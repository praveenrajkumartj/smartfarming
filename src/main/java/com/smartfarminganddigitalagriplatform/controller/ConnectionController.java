package com.smartfarminganddigitalagriplatform.controller;

import com.smartfarminganddigitalagriplatform.entity.User;
import com.smartfarminganddigitalagriplatform.repository.UserRepository;
import com.smartfarminganddigitalagriplatform.service.ConnectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.security.Principal;
import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/chat/connections")
@SuppressWarnings("null")
public class ConnectionController {

    @Autowired
    private ConnectionService connectionService;
    @Autowired
    private UserRepository userRepository;

    @GetMapping("/explore")
    public String exploreUsers(Principal principal, Model model) {
        if (principal == null)
            return "redirect:/login";

        User user = userRepository.findByEmail(principal.getName()).get();
        model.addAttribute("user", user);

        // Find all users except the current one and those already connected
        List<User> connected = connectionService.getConnectedUsers(user);
        List<Long> connectedIds = connected.stream().map(User::getId).collect(Collectors.toList());
        connectedIds.add(user.getId());

        List<User> others = userRepository.findAll().stream()
                .filter(u -> !connectedIds.contains(u.getId()))
                .collect(Collectors.toList());

        model.addAttribute("exploreList", others);
        model.addAttribute("pendingIn", connectionService.getPendingRequests(user));
        return "chat/explore";
    }

    @PostMapping("/request/{id}")
    public String sendRequest(@PathVariable Long id, Principal principal, RedirectAttributes ra) {
        if (principal == null)
            return "redirect:/login";

        User sender = userRepository.findByEmail(principal.getName()).get();
        userRepository.findById(id).ifPresent(recipient -> {
            connectionService.sendRequest(sender, recipient);
            ra.addFlashAttribute("successMessage", "Connection request sent to " + recipient.getFullName());
        });
        return "redirect:/chat/connections/explore";
    }

    @PostMapping("/accept/{requestId}")
    public String acceptRequest(@PathVariable Long requestId, Principal principal, RedirectAttributes ra) {
        if (principal == null)
            return "redirect:/login";

        User recipient = userRepository.findByEmail(principal.getName()).get();
        connectionService.acceptRequest(recipient, requestId);
        ra.addFlashAttribute("successMessage", "Connection request accepted!");
        return "redirect:/chat/connections/explore";
    }

    @PostMapping("/reject/{requestId}")
    public String rejectRequest(@PathVariable Long requestId, Principal principal, RedirectAttributes ra) {
        if (principal == null)
            return "redirect:/login";

        User recipient = userRepository.findByEmail(principal.getName()).get();
        connectionService.rejectRequest(recipient, requestId);
        ra.addFlashAttribute("successMessage", "Request ignored.");
        return "redirect:/chat/connections/explore";
    }
}
