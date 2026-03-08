package com.smartfarminganddigitalagriplatform.service;

import com.smartfarminganddigitalagriplatform.entity.User;
import com.smartfarminganddigitalagriplatform.entity.UserConnection;
import com.smartfarminganddigitalagriplatform.repository.UserConnectionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@SuppressWarnings("null")
public class ConnectionService {

    @Autowired
    private UserConnectionRepository connectionRepo;

    public void sendRequest(User sender, User recipient) {
        if (sender.getId().equals(recipient.getId()))
            return;

        Optional<UserConnection> existing = connectionRepo.findByUserAAndUserBOrUserBAndUserA(sender, recipient,
                sender, recipient);
        if (existing.isEmpty()) {
            UserConnection uc = new UserConnection();
            uc.setUserA(sender);
            uc.setUserB(recipient);
            uc.setStatus(UserConnection.Status.PENDING);
            connectionRepo.save(uc);
        }
    }

    public void acceptRequest(User recipient, Long requestId) {
        Optional<UserConnection> req = connectionRepo.findById(requestId);
        if (req.isPresent() && req.get().getUserB().getId().equals(recipient.getId())) {
            UserConnection uc = req.get();
            uc.setStatus(UserConnection.Status.ACCEPTED);
            uc.setRespondedAt(LocalDateTime.now());
            connectionRepo.save(uc);
        }
    }

    public void rejectRequest(User recipient, Long requestId) {
        Optional<UserConnection> req = connectionRepo.findById(requestId);
        if (req.isPresent() && req.get().getUserB().getId().equals(recipient.getId())) {
            UserConnection uc = req.get();
            uc.setStatus(UserConnection.Status.REJECTED);
            uc.setRespondedAt(LocalDateTime.now());
            connectionRepo.save(uc);
        }
    }

    public List<User> getConnectedUsers(User user) {
        // Find accepted where user is either A or B
        List<UserConnection> connections = connectionRepo.findByUserAAndStatusOrUserBAndStatus(user,
                UserConnection.Status.ACCEPTED, user, UserConnection.Status.ACCEPTED);
        return connections.stream()
                .map(uc -> uc.getUserA().getId().equals(user.getId()) ? uc.getUserB() : uc.getUserA())
                .collect(Collectors.toList());
    }

    public List<UserConnection> getPendingRequests(User user) {
        return connectionRepo.findByUserBAndStatus(user, UserConnection.Status.PENDING);
    }

    public String getConnectionStatus(User u1, User u2) {
        Optional<UserConnection> uc = connectionRepo.findByUserAAndUserBOrUserBAndUserA(u1, u2, u1, u2);
        if (uc.isEmpty())
            return "NONE";
        return uc.get().getStatus().name();
    }
}
