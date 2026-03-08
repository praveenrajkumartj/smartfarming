package com.smartfarminganddigitalagriplatform.controller.api;

import com.smartfarminganddigitalagriplatform.service.OTPService;
import com.smartfarminganddigitalagriplatform.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.Map;

@RestController
@RequestMapping("/api/forgot-password")
public class ForgotPasswordRestController {

    @Autowired
    private UserService userService;

    @Autowired
    private OTPService otpService;

    @PostMapping("/send-otp")
    public ResponseEntity<?> sendOTP(@RequestBody Map<String, String> request) {
        String email = request.get("email");
        if (email == null || email.isEmpty()) {
            return ResponseEntity.badRequest().body(Map.of("message", "Email is required"));
        }

        if (userService.findByEmail(email).isEmpty()) {
            return ResponseEntity.status(404).body(Map.of("message", "User not found"));
        }

        otpService.generateAndSendOTP(email);
        return ResponseEntity.ok(Map.of("message", "OTP sent successfully"));
    }

    @PostMapping("/verify-otp")
    public ResponseEntity<?> verifyOTP(@RequestBody Map<String, String> request) {
        String email = request.get("email");
        String otp = request.get("otp");

        if (otpService.verifyOTP(email, otp)) {
            return ResponseEntity.ok(Map.of("message", "OTP verified successfully", "status", "SUCCESS"));
        } else {
            return ResponseEntity.badRequest().body(Map.of("message", "Invalid or expired OTP", "status", "FAILURE"));
        }
    }

    @PostMapping("/reset-password")
    public ResponseEntity<?> resetPassword(@RequestBody Map<String, String> request) {
        String email = request.get("email");
        String newPassword = request.get("newPassword");
        String confirmPassword = request.get("confirmPassword");

        if (!otpService.isOTPVerified(email)) {
            return ResponseEntity.status(403).body(Map.of("message", "OTP must be verified first"));
        }

        if (newPassword == null || !newPassword.equals(confirmPassword)) {
            return ResponseEntity.badRequest().body(Map.of("message", "Passwords do not match"));
        }

        userService.updatePasswordByEmail(email, newPassword);
        otpService.clearOTP(email);
        return ResponseEntity.ok(Map.of("message", "Password reset successfully"));
    }
}
