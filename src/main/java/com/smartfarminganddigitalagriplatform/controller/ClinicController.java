package com.smartfarminganddigitalagriplatform.controller;

import com.smartfarminganddigitalagriplatform.entity.*;
import com.smartfarminganddigitalagriplatform.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.multipart.MultipartFile;
import java.io.IOException;
import java.nio.file.*;

@Controller
@RequestMapping("/clinic")
@SuppressWarnings("null")
public class ClinicController {

    @Autowired
    private ClinicService clinicService;
    @Autowired
    private UserService userService;
    @Autowired
    private DiseaseQueryService diseaseQueryService;
    @Autowired
    private ReviewService reviewService;

    private User getCurrentUser(Authentication auth) {
        if (auth == null || !auth.isAuthenticated())
            return null;
        return userService.findByEmail(auth.getName()).orElse(null);
    }

    // --- EXPERT REGISTRATION ---
    @GetMapping("/expert/register")
    public String expertRegisterPage() {
        return "clinic/expert-register";
    }

    @PostMapping("/expert/register")
    public String registerExpert(@RequestParam String fullName, @RequestParam String email,
            @RequestParam String password, @RequestParam String phone,
            @RequestParam String specialization, @RequestParam String experience,
            @RequestParam Double fee, @RequestParam String bio,
            RedirectAttributes redirectAttributes) {

        // 1. Create User
        User user = new User();
        user.setFullName(fullName);
        user.setEmail(email);
        user.setPassword(password); // Will be encoded by UserService
        user.setPhone(phone);
        user.setRole(User.Role.EXPERT);
        userService.registerUser(user);

        // 2. Create Expert Profile
        ClinicExpert expert = new ClinicExpert();
        expert.setUser(user);
        expert.setSpecialization(specialization);
        expert.setExperience(experience);
        expert.setConsultationFee(fee);
        expert.setBio(bio);
        expert.setApproved(false); // Admin must approve
        clinicService.saveExpert(expert);

        redirectAttributes.addFlashAttribute("successMessage",
                "Expert registration successful! Please wait for Admin approval before logging in.");
        return "redirect:/login";
    }

    // --- FARMER VIEWS ---
    @GetMapping("/farmer/experts")
    public String listExperts(Model model, Authentication auth) {
        model.addAttribute("experts", clinicService.getApprovedExperts());
        return "clinic/farmer-experts";
    }

    @PostMapping("/farmer/book")
    public String bookConsultation(@ModelAttribute ClinicConsultation consultation,
            @RequestParam Long expertId,
            Authentication auth, RedirectAttributes ra) {
        User farmer = getCurrentUser(auth);
        clinicService.bookConsultation(consultation, farmer, expertId);
        ra.addFlashAttribute("successMessage", "Consultation Booked Successfully! Platform fees apply.");
        return "redirect:/clinic/farmer/dashboard";
    }

    @GetMapping("/farmer/dashboard")
    public String farmerClinicDashboard(Model model, Authentication auth) {
        User farmer = getCurrentUser(auth);
        model.addAttribute("user", farmer);
        model.addAttribute("consultations", clinicService.getConsultationsForFarmer(farmer.getId()));
        return "clinic/farmer-dashboard";
    }

    @PostMapping("/farmer/pay/{id}")
    public String payConsultation(@PathVariable Long id, RedirectAttributes ra) {
        clinicService.payConsultation(id);
        ra.addFlashAttribute("successMessage", "Payment Complete! Link Generated.");
        return "redirect:/clinic/farmer/dashboard";
    }

    // --- EXPERT VIEWS ---
    @GetMapping("/expert/dashboard")
    public String expertDashboard(Model model, Authentication auth) {
        User currentUser = getCurrentUser(auth);
        if (currentUser == null) {
            return "redirect:/login";
        }
        ClinicExpert expert = clinicService.getExpertByUserId(currentUser.getId());

        if (expert == null || !expert.isApproved()) {
            return "clinic/expert-pending";
        }

        model.addAttribute("expert", expert);
        model.addAttribute("consultations", clinicService.getConsultationsForExpert(expert.getId()));
        return "clinic/expert-dashboard";
    }

    @PostMapping("/expert/accept/{id}")
    public String acceptConsultation(@PathVariable Long id, RedirectAttributes ra) {
        clinicService.acceptConsultation(id);
        ra.addFlashAttribute("successMessage", "Consultation Accepted. Waiting for farmer payment.");
        return "redirect:/clinic/expert/dashboard";
    }

    @PostMapping("/expert/prescribe")
    public String providePrescription(@ModelAttribute ClinicPrescription prescription,
            @RequestParam Long consultationId, RedirectAttributes ra) {
        clinicService.addPrescription(consultationId, prescription);
        ra.addFlashAttribute("successMessage", "Prescription Saved!");
        return "redirect:/clinic/expert/dashboard";
    }

    @GetMapping("/expert/disease-queries")
    public String expertDiseaseQueries(Authentication auth, Model model) {
        User user = getCurrentUser(auth);
        if (user == null) {
            return "redirect:/login";
        }
        ClinicExpert expert = clinicService.getExpertByUserId(user.getId());
        if (expert == null) {
            model.addAttribute("queries", java.util.Collections.emptyList());
        } else {
            model.addAttribute("expert", expert);
            model.addAttribute("queries", diseaseQueryService.getQueriesByExpert(expert));
        }
        return "clinic/expert-disease-queries";
    }

    @PostMapping("/expert/disease-queries/update/{id}")
    public String updateDiagnosisByExpert(@PathVariable Long id,
            @RequestParam(required = false) String diseaseName,
            @RequestParam(required = false) Double confidenceScore,
            @RequestParam(required = false) String severityLevel,
            @RequestParam(required = false) String diagnosis,
            @RequestParam(required = false) String organicTreatment,
            @RequestParam(required = false) String chemicalTreatment,
            @RequestParam(required = false) String preventiveMeasures,
            RedirectAttributes redirectAttributes) {
        DiseaseQuery query = diseaseQueryService.getQueryById(id)
                .orElseThrow(() -> new RuntimeException("Query not found"));

        query.setDiseaseName(diseaseName);
        query.setConfidenceScore(confidenceScore);
        query.setSeverityLevel(severityLevel);
        query.setDiagnosis(diagnosis);
        query.setOrganicTreatment(organicTreatment);
        query.setChemicalTreatment(chemicalTreatment);
        query.setPreventiveMeasures(preventiveMeasures);

        query.setStatus(DiseaseQuery.Status.REPORT_READY.name());
        diseaseQueryService.saveQuery(query);
        redirectAttributes.addFlashAttribute("successMessage", "AI / Expert Analysis Updated Successfully!");
        return "redirect:/clinic/expert/disease-queries";
    }

    @PostMapping("/expert/disease-queries/reject/{id}")
    public String rejectDiseaseQuery(@PathVariable Long id, @RequestParam String reason, RedirectAttributes ra) {
        DiseaseQuery query = diseaseQueryService.getQueryById(id).orElseThrow();
        query.setStatus(DiseaseQuery.Status.REJECTED.name());
        query.setRejectionReason(reason);
        diseaseQueryService.saveQuery(query);
        ra.addFlashAttribute("successMessage", "Query Rejected Successfully.");
        return "redirect:/clinic/expert/disease-queries";
    }

    @GetMapping("/expert/profile")
    public String expertProfile(Authentication auth, Model model) {
        User user = getCurrentUser(auth);
        if (user == null) {
            return "redirect:/login";
        }
        ClinicExpert expert = clinicService.getExpertByUserId(user.getId());
        model.addAttribute("user", user);
        model.addAttribute("expert", expert);

        // Add summary analytics to profile (Command Center integration)
        model.addAttribute("consultationsCount", clinicService.getConsultationsForExpert(expert.getId()).size());
        model.addAttribute("diseaseQueriesCount", diseaseQueryService.getQueriesByExpert(expert).size());

        return "clinic/expert-profile";
    }

    @PostMapping("/expert/profile/update")
    public String updateExpertProfile(@ModelAttribute User updatedUser,
            @RequestParam(required = false) MultipartFile profileImage,
            Authentication auth,
            RedirectAttributes redirectAttributes) throws IOException {
        User user = getCurrentUser(auth);
        if (user == null) {
            return "redirect:/login";
        }
        user.setFullName(updatedUser.getFullName());
        user.setPhone(updatedUser.getPhone());
        user.setState(updatedUser.getState());
        user.setDistrict(updatedUser.getDistrict());

        if (profileImage != null && !profileImage.isEmpty()) {
            String uploadDir = "uploads/profiles/";
            Files.createDirectories(Paths.get(uploadDir));
            String fileName = System.currentTimeMillis() + "_" + profileImage.getOriginalFilename();
            Path filePath = Paths.get(uploadDir + fileName);
            Files.write(filePath, profileImage.getBytes());
            user.setProfileImagePath("/uploads/profiles/" + fileName);
        }

        userService.updateUser(user);
        redirectAttributes.addFlashAttribute("successMessage", "Profile updated successfully!");
        return "redirect:/clinic/expert/profile";
    }

    @PostMapping("/expert/profile/deactivate-plan")
    public String deactivateExpertPlan(Authentication auth, RedirectAttributes redirectAttributes) {
        User user = getCurrentUser(auth);
        user.setSubscriptionPlan("Basic Plan");
        userService.updateUser(user);
        redirectAttributes.addFlashAttribute("successMessage", "Subscription deactivated successfully.");
        return "redirect:/clinic/expert/profile";
    }

    // --- SHARED WEBRTC VIDEO ROOM ---
    @GetMapping("/video-room/{roomId}")
    public String videoRoom(@PathVariable String roomId, Model model) {
        model.addAttribute("roomId", roomId);
        return "clinic/video-room";
    }

    @GetMapping("/expert/reviews")
    public String expertReviews(Authentication auth, Model model) {
        User user = getCurrentUser(auth);
        if (user == null) {
            return "redirect:/login";
        }
        ClinicExpert expert = clinicService.getExpertByUserId(user.getId());
        if (expert == null) {
            return "redirect:/clinic/expert/dashboard";
        }
        model.addAttribute("expert", expert);
        model.addAttribute("reviews", reviewService.getExpertReviews(expert.getId()));
        return "clinic/expert-reviews";
    }
}
