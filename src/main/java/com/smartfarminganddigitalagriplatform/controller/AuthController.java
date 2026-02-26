package com.smartfarminganddigitalagriplatform.controller;

import com.smartfarminganddigitalagriplatform.entity.User;
import com.smartfarminganddigitalagriplatform.service.UserService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class AuthController {

    @Autowired
    private UserService userService;

    @GetMapping("/")
    public String home(Model model) {
        return "home";
    }

    @GetMapping("/home")
    public String homeRedirect() {
        return "home";
    }

    @GetMapping("/login")
    public String loginPage(@RequestParam(required = false) String error,
            @RequestParam(required = false) String logout,
            Model model) {
        if (error != null) {
            model.addAttribute("errorMessage", "Invalid email or password. Please try again.");
        }
        if (logout != null) {
            model.addAttribute("logoutMessage", "You have been logged out successfully.");
        }
        return "auth/login";
    }

    @GetMapping("/register")
    public String registerPage(Model model) {
        model.addAttribute("user", new User());
        return "auth/register";
    }

    @PostMapping("/register")
    public String registerUser(@Valid @ModelAttribute("user") User user,
            BindingResult result,
            RedirectAttributes redirectAttributes,
            Model model) {
        if (result.hasErrors()) {
            return "auth/register";
        }
        try {
            userService.registerUser(user);
            redirectAttributes.addFlashAttribute("successMessage",
                    "Registration successful! Please login to continue.");
            return "redirect:/login";
        } catch (RuntimeException e) {
            model.addAttribute("errorMessage", e.getMessage());
            return "auth/register";
        }
    }

    @GetMapping("/forgot-password")
    public String forgotPasswordPage() {
        return "auth/forgot-password";
    }

    @PostMapping("/forgot-password")
    public String handleForgotPassword(@RequestParam("phone") String phone,
            @RequestParam("newPassword") String newPassword,
            RedirectAttributes redirectAttributes,
            Model model) {
        try {
            userService.updatePasswordByPhone(phone, newPassword);
            redirectAttributes.addFlashAttribute("successMessage", "Password updated successfully. Please login.");
            return "redirect:/login";
        } catch (RuntimeException e) {
            model.addAttribute("errorMessage", e.getMessage());
            return "auth/forgot-password";
        }
    }

    @GetMapping("/help")
    public String helpPage() {
        return "help";
    }

    @GetMapping("/terms")
    public String termsPage() {
        return "terms";
    }

    @GetMapping("/privacy")
    public String privacyPage() {
        return "privacy";
    }

    @GetMapping("/contact")
    public String contactPage() {
        return "contact";
    }

    @GetMapping("/subscription")
    public String subscriptionPage() {
        return "subscription";
    }

    @GetMapping("/payment")
    public String paymentPage() {
        return "payment";
    }

    @PostMapping("/subscription/upgrade")
    @ResponseBody
    public String upgradePlan(@RequestParam("plan") String plan,
            org.springframework.security.core.Authentication auth) {
        if (auth != null && auth.isAuthenticated()) {
            User user = userService.findByEmail(auth.getName()).orElse(null);
            if (user != null) {
                user.setSubscriptionPlan(plan);
                userService.updateUser(user);
                if (user.getRole() == User.Role.BUYER) {
                    return "/buyer/dashboard";
                } else if (user.getRole() == User.Role.FARMER) {
                    return "/farmer/dashboard";
                } else if (user.getRole() == User.Role.ADMIN) {
                    return "/admin/dashboard";
                }
            }
        }
        return "/login";
    }
}
