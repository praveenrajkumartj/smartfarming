package com.smartfarminganddigitalagriplatform.service;

import com.smartfarminganddigitalagriplatform.entity.ChatMessage;
import com.smartfarminganddigitalagriplatform.entity.User;
import com.smartfarminganddigitalagriplatform.repository.ChatMessageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class ChatService {

    @Autowired
    private ChatMessageRepository chatMessageRepository;

    @Autowired
    private SimpMessagingTemplate messagingTemplate;

    @Transactional
    public ChatMessage saveAndSendMessage(@org.springframework.lang.NonNull User sender,
            @org.springframework.lang.NonNull User recipient, @org.springframework.lang.NonNull String content,
            String fileUrl, String fileType) {
        ChatMessage message = new ChatMessage(sender, recipient, content, fileUrl, fileType);
        message.setTimestamp(LocalDateTime.now());
        message = chatMessageRepository.save(message);

        // Send real-time to recipient
        messagingTemplate.convertAndSendToUser(
                recipient.getEmail(),
                "/queue/messages",
                message);

        // Also notify sender with the saved message (includes ID)
        messagingTemplate.convertAndSendToUser(
                sender.getEmail(),
                "/queue/messages",
                message);

        return message;
    }

    public List<ChatMessage> getConversationHistory(@org.springframework.lang.NonNull User user1,
            @org.springframework.lang.NonNull User user2) {
        return chatMessageRepository.findConversation(user1, user2);
    }

    @Transactional
    public void markMessagesAsRead(@org.springframework.lang.NonNull User recipient,
            @org.springframework.lang.NonNull User sender) {
        List<ChatMessage> unreadMessages = chatMessageRepository
                .findByRecipientAndIsReadFalseOrderByTimestampDesc(recipient);
        for (ChatMessage message : unreadMessages) {
            if (message.getSender().getId().equals(sender.getId())) {
                message.setRead(true);
                chatMessageRepository.save(message);
            }
        }
    }

    @Transactional
    public void deleteMessage(Long messageId, User user) {
        ChatMessage message = chatMessageRepository.findById(messageId)
                .orElseThrow(() -> new RuntimeException("Message not found"));
        if (message.getSender().getId().equals(user.getId())) {
            chatMessageRepository.delete(message);

            // Optionally notify recipient via WebSocket that message was deleted
            java.util.Map<String, Object> deletePayload = new java.util.HashMap<>();
            deletePayload.put("type", "DELETE");
            deletePayload.put("messageId", messageId);

            messagingTemplate.convertAndSendToUser(
                    message.getRecipient().getEmail(),
                    "/queue/messages",
                    deletePayload);
            // Also notify sender
            messagingTemplate.convertAndSendToUser(
                    message.getSender().getEmail(),
                    "/queue/messages",
                    deletePayload);
        } else {
            throw new RuntimeException("Unauthorized: You can only delete your own messages");
        }
    }
}
