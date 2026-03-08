package com.smartfarminganddigitalagriplatform.controller;

import com.smartfarminganddigitalagriplatform.entity.*;
import com.smartfarminganddigitalagriplatform.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/mentor")
public class MentorController {

    @Autowired
    private UserService userService;

    @Autowired
    private MentorService mentorService;

    @Autowired
    private ReviewService reviewService;

    private User getCurrentUser(Authentication auth) {
        return userService.findByEmail(auth.getName()).orElseThrow();
    }

    @GetMapping("/dashboard")
    public String dashboard(Authentication auth, Model model) {
        User user = getCurrentUser(auth);
        Mentor mentor = mentorService.getMentorByUser(user).orElse(null);

        if (mentor == null) {
            // If they aren't a mentor, redirect to become-mentor or home
            return "redirect:/mentor/become";
        }

        model.addAttribute("mentor", mentor);
        List<Consultation> upcoming = mentorService.getUpcomingConsultations(mentor);
        model.addAttribute("upcoming", upcoming);
        model.addAttribute("totalEarnings", mentorService.getTotalEarnings(mentor));
        model.addAttribute("totalSessions", mentorService.getTotalSessions(mentor));

        return "mentor/dashboard";
    }

    // Removed direct mentor registration per policy.
    // New mentors must first register as Farmer/Buyer and then use /mentor/become
    // internally.

    @GetMapping("/become")
    public String becomeMentor(Authentication auth, Model model, RedirectAttributes ra) {
        User user = getCurrentUser(auth);
        if (user.getRole() != User.Role.FARMER) {
            ra.addFlashAttribute("errorMessage",
                    "ACCESS DENIED: Only verified Farmer nodes can elevate to Advisory status.");
            return "redirect:/farmer/dashboard";
        }
        model.addAttribute("user", user);
        return "mentor/become";
    }

    @PostMapping("/become")
    public String processBecomeMentor(@RequestParam String expertise,
            @RequestParam String bio,
            @RequestParam Double consultationFee,
            @RequestParam String experience,
            Authentication auth,
            RedirectAttributes redirectAttributes) {
        User user = getCurrentUser(auth);
        if (user.getRole() != User.Role.FARMER) {
            redirectAttributes.addFlashAttribute("errorMessage",
                    "PROTOCOL ERROR: Unauthorized role elevation request.");
            return "redirect:/login";
        }
        user.setRole(User.Role.MENTOR);
        userService.updateUser(user);

        Mentor mentor = new Mentor(user, expertise, consultationFee);
        mentor.setBio(bio);
        mentor.setExperience(experience);
        mentorService.saveMentor(mentor);

        redirectAttributes.addFlashAttribute("successMessage", "Elevated to Agroplanter Strategic Advisor Node.");
        return "redirect:/mentor/dashboard";
    }

    @GetMapping("/profile")
    public String profile(Authentication auth, Model model) {
        User user = getCurrentUser(auth);
        Mentor mentor = mentorService.getMentorByUser(user).orElseThrow();
        model.addAttribute("user", user);
        model.addAttribute("mentor", mentor);

        // Add summary analytics for profile dashboard
        model.addAttribute("totalEarnings", mentorService.getTotalEarnings(mentor));
        model.addAttribute("totalSessions", mentorService.getTotalSessions(mentor));
        model.addAttribute("avgRating", mentor.getRating());

        return "mentor/profile";
    }

    @PostMapping("/profile/update")
    public String updateProfile(@ModelAttribute User updatedUser,
            @RequestParam String expertise,
            @RequestParam String bio,
            @RequestParam Double consultationFee,
            @RequestParam String experience,
            @RequestParam(required = false) org.springframework.web.multipart.MultipartFile profileImage,
            Authentication auth,
            RedirectAttributes redirectAttributes) throws java.io.IOException {
        User user = getCurrentUser(auth);
        user.setFullName(updatedUser.getFullName());
        user.setPhone(updatedUser.getPhone());
        user.setState(updatedUser.getState());
        user.setDistrict(updatedUser.getDistrict());

        if (profileImage != null && !profileImage.isEmpty()) {
            String uploadDir = "uploads/profiles/";
            java.nio.file.Files.createDirectories(java.nio.file.Paths.get(uploadDir));
            String fileName = System.currentTimeMillis() + "_" + profileImage.getOriginalFilename();
            java.nio.file.Path filePath = java.nio.file.Paths.get(uploadDir + fileName);
            java.nio.file.Files.write(filePath, profileImage.getBytes());
            user.setProfileImagePath("/uploads/profiles/" + fileName);
        }

        userService.updateUser(user);

        Mentor mentor = mentorService.getMentorByUser(user).orElseThrow();
        mentor.setExpertise(expertise);
        mentor.setBio(bio);
        mentor.setConsultationFee(consultationFee);
        mentor.setExperience(experience);
        mentorService.saveMentor(mentor);

        redirectAttributes.addFlashAttribute("successMessage", "Advisor profile updated successfully!");
        return "redirect:/mentor/profile";
    }

    @GetMapping("/ledger")
    public String ledger(Authentication auth, Model model) {
        User user = getCurrentUser(auth);
        Mentor mentor = mentorService.getMentorByUser(user).orElseThrow();
        model.addAttribute("mentor", mentor);
        model.addAttribute("transactions", mentorService.getMentorLedger(mentor));
        model.addAttribute("totalEarnings", mentorService.getTotalEarnings(mentor));
        return "mentor/ledger";
    }

    @GetMapping("/reviews")
    public String reviews(Authentication auth, Model model) {
        User user = getCurrentUser(auth);
        Mentor mentor = mentorService.getMentorByUser(user).orElseThrow();
        model.addAttribute("mentor", mentor);
        model.addAttribute("reviews", reviewService.getMentorReviews(mentor.getId()));
        return "mentor/reviews";
    }

    @PostMapping("/consultation/complete/{id}")
    public String completeConsultation(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        mentorService.completeConsultation(id);
        redirectAttributes.addFlashAttribute("successMessage", "Consultation marked as completed.");
        return "redirect:/mentor/dashboard";
    }

    @PostMapping("/consultation/update-fee/{id}")
    public String updateFee(@PathVariable Long id, @RequestParam Double fee, RedirectAttributes redirectAttributes) {
        mentorService.updateConsultationFee(id, fee);
        redirectAttributes.addFlashAttribute("successMessage", "Consultation fee updated successfully!");
        return "redirect:/mentor/dashboard";
    }
}
