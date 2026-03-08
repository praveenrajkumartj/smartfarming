package com.smartfarminganddigitalagriplatform.controller;

import com.smartfarminganddigitalagriplatform.entity.ChatMessage;
import com.smartfarminganddigitalagriplatform.entity.User;
import com.smartfarminganddigitalagriplatform.repository.UserRepository;
import com.smartfarminganddigitalagriplatform.service.ChatService;
import com.smartfarminganddigitalagriplatform.service.ConnectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import java.security.Principal;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Controller
public class ChatController {

    @Autowired
    private ChatService chatService;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ConnectionService connectionService;

    @GetMapping("/chat")
    public String chat(@org.springframework.web.bind.annotation.RequestParam(required = false) Long with,
            Principal principal, org.springframework.ui.Model model) {
        if (principal == null)
            return "redirect:/login";

        String email = principal.getName();
        userRepository.findByEmail(email).ifPresent(user -> {
            model.addAttribute("currentUserId", user.getId());
            model.addAttribute("currentUser", user);
            model.addAttribute("user", user);
            model.addAttribute("selectWith", with);

            // ONLY show accepted, verified connections for messaging
            List<User> connectedUsers = connectionService.getConnectedUsers(user);
            model.addAttribute("users", connectedUsers);

            // Dynamic dashboard return logic
            String dashboardUrl = "/home";
            if (user.getRole().name().equals("FARMER"))
                dashboardUrl = "/farmer/dashboard";
            else if (user.getRole().name().equals("BUYER"))
                dashboardUrl = "/buyer/dashboard";
            else if (user.getRole().name().equals("ADMIN"))
                dashboardUrl = "/admin/dashboard";
            else if (user.getRole().name().equals("EXPERT"))
                dashboardUrl = "/clinic/expert/dashboard";
            else if (user.getRole().name().equals("B2B_BUYER"))
                dashboardUrl = "/b2b/dashboard";
            else if (user.getRole().name().equals("MENTOR"))
                dashboardUrl = "/mentor/dashboard";

            model.addAttribute("dashboardUrl", dashboardUrl);
            model.addAttribute("pendingCount", connectionService.getPendingRequests(user).size());
        });
        return "chat/index";
    }

    @GetMapping("/chat/explore")
    public String explore(Principal principal, org.springframework.ui.Model model) {
        User user = userRepository.findByEmail(principal.getName()).orElseThrow();
        List<User> allUsers = userRepository.findAll().stream()
                .filter(u -> !u.getId().equals(user.getId()))
                .filter(u -> connectionService.getConnectionStatus(user, u).equals("NONE"))
                .limit(50)
                .toList();
        model.addAttribute("user", user);
        model.addAttribute("users", allUsers);
        return "chat/explore";
    }

    @GetMapping("/chat/requests")
    public String requests(Principal principal, org.springframework.ui.Model model) {
        User user = userRepository.findByEmail(principal.getName()).orElseThrow();
        model.addAttribute("user", user);
        model.addAttribute("pendingRequests", connectionService.getPendingRequests(user));
        return "chat/requests";
    }

    @PostMapping("/chat/connect/{id}")
    public String sendRequest(@PathVariable Long id, Principal principal) {
        User sender = userRepository.findByEmail(principal.getName()).orElseThrow();
        User recipient = userRepository.findById(id).orElseThrow();
        connectionService.sendRequest(sender, recipient);
        return "redirect:/chat/explore?requested=1";
    }

    @PostMapping("/chat/accept/{requestId}")
    public String acceptRequest(@PathVariable Long requestId, Principal principal) {
        User user = userRepository.findByEmail(principal.getName()).orElseThrow();
        connectionService.acceptRequest(user, requestId);
        return "redirect:/chat/requests?accepted=1";
    }

    @PostMapping("/chat/reject/{requestId}")
    public String rejectRequest(@PathVariable Long requestId, Principal principal) {
        User user = userRepository.findByEmail(principal.getName()).orElseThrow();
        connectionService.rejectRequest(user, requestId);
        return "redirect:/chat/requests?rejected=1";
    }

    @MessageMapping("/chat.sendMessage")
    public void sendMessage(@Payload Map<String, String> chatMessage, SimpMessageHeaderAccessor headerAccessor) {
        java.security.Principal principal = headerAccessor.getUser();
        if (principal == null)
            return;
        String senderEmail = principal.getName();
        String recipientIdStr = chatMessage.get("recipientId");
        String content = chatMessage.get("content");

        Optional<User> senderOpt = userRepository.findByEmail(senderEmail);
        Optional<User> recipientOpt = userRepository.findById(Long.parseLong(recipientIdStr));

        if (senderOpt.isPresent() && recipientOpt.isPresent()
                && (content != null || chatMessage.get("fileUrl") != null)) {
            // Verify connection is ACCEPTED before saving
            String status = connectionService.getConnectionStatus(senderOpt.get(), recipientOpt.get());
            if ("ACCEPTED".equals(status)) {
                chatService.saveAndSendMessage(senderOpt.get(), recipientOpt.get(),
                        content != null ? content : "",
                        chatMessage.get("fileUrl"),
                        chatMessage.get("fileType"));
            }
        }
    }

    @GetMapping("/api/chat/history/{recipientId}")
    @ResponseBody
    public List<ChatMessage> getChatHistory(@PathVariable Long recipientId, Principal principal) {
        String userEmail = principal.getName();
        Optional<User> userOpt = userRepository.findByEmail(userEmail);
        Optional<User> recipientOpt = userRepository.findById(recipientId);

        if (userOpt.isPresent() && recipientOpt.isPresent()) {
            // Verify connection is ACCEPTED
            String status = connectionService.getConnectionStatus(userOpt.get(), recipientOpt.get());
            if ("ACCEPTED".equals(status)) {
                return chatService.getConversationHistory(userOpt.get(), recipientOpt.get());
            }
        }
        return null;
    }

    @PostMapping("/api/chat/upload")
    @ResponseBody
    public Map<String, String> uploadFile(
            @org.springframework.web.bind.annotation.RequestParam("file") org.springframework.web.multipart.MultipartFile file,
            Principal principal) {
        if (principal == null)
            return Map.of("error", "Unauthorized");

        try {
            String uploadDir = "uploads/chat/";
            java.nio.file.Files.createDirectories(java.nio.file.Paths.get(uploadDir));
            String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
            java.nio.file.Path filePath = java.nio.file.Paths.get(uploadDir + fileName);
            java.nio.file.Files.write(filePath, file.getBytes());

            String fileUrl = "/uploads/chat/" + fileName;
            String fileType = file.getContentType();

            return Map.of("fileUrl", fileUrl, "fileType", fileType != null ? fileType : "application/octet-stream");
        } catch (Exception e) {
            return Map.of("error", "Upload failed: " + e.getMessage());
        }
    }

    @PostMapping("/api/chat/delete/{messageId}")
    @ResponseBody
    public Map<String, String> deleteMessage(@PathVariable Long messageId, Principal principal) {
        if (principal == null)
            return Map.of("error", "Unauthorized");
        try {
            User user = userRepository.findByEmail(principal.getName()).orElseThrow();
            chatService.deleteMessage(messageId, user);
            return Map.of("success", "true");
        } catch (Exception e) {
            return Map.of("error", e.getMessage());
        }
    }
}
