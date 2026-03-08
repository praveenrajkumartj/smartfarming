package com.smartfarminganddigitalagriplatform.service;

import com.smartfarminganddigitalagriplatform.entity.Notification;
import com.smartfarminganddigitalagriplatform.entity.User;
import com.smartfarminganddigitalagriplatform.repository.NotificationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class NotificationService {

    @Autowired
    private NotificationRepository notificationRepository;

    @Autowired
    private SimpMessagingTemplate messagingTemplate;

    public void sendNotification(@org.springframework.lang.NonNull User recipient,
            @org.springframework.lang.NonNull String title, @org.springframework.lang.NonNull String message,
            @org.springframework.lang.NonNull String type) {
        Notification notification = new Notification(recipient, title, message, type);
        notificationRepository.save(notification);

        // Push to WebSocket
        messagingTemplate.convertAndSendToUser(
                java.util.Objects.requireNonNull(recipient.getEmail()),
                "/queue/notifications",
                notification);
    }

    public List<Notification> getUnreadNotifications(User user) {
        return notificationRepository.findByRecipientAndIsReadFalseOrderByTimestampDesc(user);
    }

    public List<Notification> getAllNotifications(User user) {
        return notificationRepository.findByRecipientOrderByTimestampDesc(user);
    }

    @Transactional
    public void markAsRead(Long id) {
        notificationRepository.findById(id).ifPresent(n -> {
            n.setRead(true);
            notificationRepository.save(n);
        });
    }

    public long getUnreadCount(User user) {
        return notificationRepository.countByRecipientAndIsReadFalse(user);
    }
}
