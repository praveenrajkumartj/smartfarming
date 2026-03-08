package com.smartfarminganddigitalagriplatform.controller;

import com.smartfarminganddigitalagriplatform.service.OTPService;
import com.smartfarminganddigitalagriplatform.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/recovery")
public class RecoveryController {

    @Autowired
    private UserService userService;

    @Autowired
    private OTPService otpService;

    @GetMapping
    public String showRecoveryPage() {
        return "auth/recovery";
    }

    @PostMapping("/send-otp")
    public String sendOTP(@RequestParam String email, RedirectAttributes ra) {
        if (userService.findByEmail(email).isEmpty()) {
            ra.addFlashAttribute("errorMessage", "NO ACCOUNT FOUND WITH THIS EMAIL");
            return "redirect:/recovery";
        }

        try {
            otpService.generateAndSendOTP(email);
            ra.addFlashAttribute("successMessage", "OTP SENT TO YOUR REGISTERED EMAIL");
            return "redirect:/recovery/verify-otp?email=" + email;
        } catch (Exception e) {
            ra.addFlashAttribute("errorMessage", "FAILED TO SEND OTP: " + e.getMessage());
            return "redirect:/recovery";
        }
    }

    @GetMapping("/verify-otp")
    public String showVerifyOTPPage(@RequestParam String email, Model model) {
        model.addAttribute("email", email);
        return "auth/verify-otp";
    }

    @PostMapping("/verify-otp")
    public String verifyOTP(@RequestParam String email, @RequestParam String otp, RedirectAttributes ra) {
        if (otpService.verifyOTP(email, otp)) {
            return "redirect:/recovery/reset-password?email=" + email;
        } else {
            ra.addFlashAttribute("errorMessage", "INVALID OR EXPIRED OTP. ATTEMPTS REMAINING: " + (3 - 0)); // simplified
            return "redirect:/recovery/verify-otp?email=" + email;
        }
    }

    @GetMapping("/reset-password")
    public String showResetPasswordPage(@RequestParam String email, Model model, RedirectAttributes ra) {
        if (!otpService.isOTPVerified(email)) {
            ra.addFlashAttribute("errorMessage", "UNAUTHORIZED ACCESS");
            return "redirect:/recovery";
        }
        model.addAttribute("email", email);
        return "auth/reset-password";
    }

    @PostMapping("/reset-password")
    public String resetPassword(@RequestParam String email,
            @RequestParam String password,
            @RequestParam String confirmPassword,
            RedirectAttributes ra) {

        if (!otpService.isOTPVerified(email)) {
            ra.addFlashAttribute("errorMessage", "UNAUTHORIZED ACCESS");
            return "redirect:/recovery";
        }

        if (!password.equals(confirmPassword)) {
            ra.addFlashAttribute("errorMessage", "ENCRYPTION KEYS DO NOT MATCH");
            return "redirect:/recovery/reset-password?email=" + email;
        }

        try {
            userService.updatePasswordByEmail(email, password);
            otpService.clearOTP(email);
            ra.addFlashAttribute("successMessage", "ENCRYPTION KEY UPDATED SUCCESSFULLY. INITIALIZE LOGIN.");
            return "redirect:/login";
        } catch (Exception e) {
            ra.addFlashAttribute("errorMessage", "RECOVERY FAILURE: " + e.getMessage());
            return "redirect:/recovery/reset-password?email=" + email;
        }
    }
}
