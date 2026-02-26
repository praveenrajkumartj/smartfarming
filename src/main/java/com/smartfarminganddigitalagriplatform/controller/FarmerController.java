package com.smartfarminganddigitalagriplatform.controller;

import com.smartfarminganddigitalagriplatform.entity.*;
import com.smartfarminganddigitalagriplatform.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import java.io.IOException;
import java.nio.file.*;

@Controller
@RequestMapping("/farmer")
public class FarmerController {

    @Autowired
    private UserService userService;

    @Autowired
    private CropService cropService;

    @Autowired
    private MarketPriceService marketPriceService;

    @Autowired
    private GovernmentSchemeService schemeService;

    @Autowired
    private MarketplaceService marketplaceService;

    @Autowired
    private DiseaseQueryService diseaseQueryService;

    @Autowired
    private LearningVideoService learningVideoService;

    private User getCurrentUser(Authentication auth) {
        return userService.findByEmail(auth.getName()).orElseThrow();
    }

    @GetMapping("/dashboard")
    public String dashboard(Authentication auth, Model model) {
        User user = getCurrentUser(auth);
        model.addAttribute("user", user);
        model.addAttribute("totalListings", marketplaceService.getListingsByFarmer(user).size());
        model.addAttribute("availableListings", marketplaceService.getAvailableListings().size());
        model.addAttribute("diseaseQueries", diseaseQueryService.getQueriesByUser(user).size());
        model.addAttribute("recentPrices", marketPriceService.getAllPrices().stream().limit(5).toList());
        model.addAttribute("recentSchemes", schemeService.getActiveSchemes().stream().limit(3).toList());
        return "farmer/dashboard";
    }

    @GetMapping("/profile")
    public String profile(Authentication auth, Model model) {
        model.addAttribute("user", getCurrentUser(auth));
        return "farmer/profile";
    }

    @PostMapping("/profile/update")
    public String updateProfile(@ModelAttribute User updatedUser,
            @RequestParam(required = false) MultipartFile profileImage,
            Authentication auth,
            RedirectAttributes redirectAttributes) throws IOException {
        User user = getCurrentUser(auth);
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
        return "redirect:/farmer/profile";
    }

    @PostMapping("/profile/deactivate-plan")
    public String deactivatePlan(Authentication auth, RedirectAttributes redirectAttributes) {
        User user = getCurrentUser(auth);
        user.setSubscriptionPlan("Basic Plan");
        userService.updateUser(user);
        redirectAttributes.addFlashAttribute("successMessage", "Subscription deactivated successfully.");
        return "redirect:/farmer/profile";
    }

    // Crop Recommendations
    @GetMapping("/crop-recommendation")
    public String cropRecommendation(Model model,
            @RequestParam(required = false) String season,
            @RequestParam(required = false) String soilType) {
        model.addAttribute("crops", cropService.getCropsBySeasonAndSoil(season, soilType));
        model.addAttribute("selectedSeason", season);
        model.addAttribute("selectedSoil", soilType);
        return "farmer/crop-recommendation";
    }

    // Market Prices
    @GetMapping("/market-prices")
    public String marketPrices(Model model,
            @RequestParam(required = false) String search,
            @RequestParam(required = false) String state) {
        if (search != null && !search.isEmpty()) {
            model.addAttribute("prices", marketPriceService.searchByCrop(search));
        } else if (state != null && !state.isEmpty()) {
            model.addAttribute("prices", marketPriceService.getByState(state));
        } else {
            model.addAttribute("prices", marketPriceService.getAllPrices());
        }
        model.addAttribute("states", marketPriceService.getDistinctStates());
        model.addAttribute("search", search);
        model.addAttribute("selectedState", state);
        return "farmer/market-prices";
    }

    // Government Schemes
    @GetMapping("/schemes")
    public String schemes(Model model,
            @RequestParam(required = false) String search) {
        if (search != null && !search.isEmpty()) {
            model.addAttribute("schemes", schemeService.searchByTitle(search));
        } else {
            model.addAttribute("schemes", schemeService.getActiveSchemes());
        }
        model.addAttribute("search", search);
        return "farmer/schemes";
    }

    // Marketplace
    @GetMapping("/marketplace")
    public String marketplace(Authentication auth, Model model) {
        User user = getCurrentUser(auth);
        model.addAttribute("myListings", marketplaceService.getListingsByFarmer(user));
        model.addAttribute("listing", new MarketplaceListing());
        return "farmer/marketplace";
    }

    @PostMapping("/marketplace/add")
    public String addListing(@ModelAttribute MarketplaceListing listing,
            Authentication auth,
            RedirectAttributes redirectAttributes) {
        User user = getCurrentUser(auth);
        listing.setFarmer(user);
        listing.setContactNumber(user.getPhone());
        listing.setLocation(user.getDistrict() + ", " + user.getState());
        marketplaceService.saveListing(listing);
        redirectAttributes.addFlashAttribute("successMessage", "Listing added successfully!");
        return "redirect:/farmer/marketplace";
    }

    @PostMapping("/marketplace/delete/{id}")
    public String deleteListing(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        marketplaceService.deleteListing(id);
        redirectAttributes.addFlashAttribute("successMessage", "Listing deleted successfully!");
        return "redirect:/farmer/marketplace";
    }

    // Disease Detection
    @GetMapping("/disease-detection")
    public String diseaseDetection(Authentication auth, Model model) {
        User user = getCurrentUser(auth);
        model.addAttribute("query", new DiseaseQuery());
        model.addAttribute("myQueries", diseaseQueryService.getQueriesByUser(user));
        return "farmer/disease-detection";
    }

    @PostMapping("/disease-detection/submit")
    public String submitDiseaseQuery(@ModelAttribute DiseaseQuery query,
            @RequestParam(required = false) MultipartFile image,
            Authentication auth,
            RedirectAttributes redirectAttributes) throws IOException {
        User user = getCurrentUser(auth);
        query.setUser(user);

        if (image != null && !image.isEmpty()) {
            String uploadDir = "uploads/disease-images/";
            Files.createDirectories(Paths.get(uploadDir));
            String fileName = System.currentTimeMillis() + "_" + image.getOriginalFilename();
            Path filePath = Paths.get(uploadDir + fileName);
            Files.write(filePath, image.getBytes());
            query.setImagePath("/uploads/disease-images/" + fileName);
        }

        // Simulated Advanced AI Preliminary Analysis
        String symptoms = query.getSymptoms() != null ? query.getSymptoms().toLowerCase() : "";
        query.setConfidenceScore(75.5 + Math.random() * 10); // Simulated 75-85% confidence

        if (symptoms.contains("yellow") || symptoms.contains("yellowing")) {
            query.setDiseaseName("Nitrogen Deficiency / Chlorosis");
            query.setDiagnosis(
                    "Yellowing of leaves usually indicates a lack of sufficient nitrogen or poor root health preventing nutrient uptake.");
            query.setSeverityLevel("MEDIUM");
            query.setOrganicTreatment("Apply compost tea or blood meal around the base. Ensure soil is aerated.");
            query.setChemicalTreatment("Apply a balanced NPK fertilizer with higher nitrogen ratio (e.g., 20-10-10).");
            query.setPreventiveMeasures(
                    "Regularly test soil pH and nutrient levels before planting. Maintain consistent watering schedules.");
        } else if (symptoms.contains("brown") || symptoms.contains("spot") || symptoms.contains("spots")) {
            query.setDiseaseName("Leaf Spot Disease (Fungal)");
            query.setDiagnosis(
                    "Brown spots surrounded by yellow halos are typical indicators of fungal or bacterial leaf spot diseases.");
            query.setSeverityLevel("HIGH");
            query.setOrganicTreatment(
                    "Spray a protective coating of नीम (Neem) oil or a baking soda and water mixture.");
            query.setChemicalTreatment("Apply an appropriate broad-spectrum copper-based fungicide to halt spread.");
            query.setPreventiveMeasures(
                    "Avoid overhead watering. Space plants properly to ensure good air circulation. Remove and burn fallen infected leaves.");
        } else if (symptoms.contains("wilt") || symptoms.contains("wilting")) {
            query.setDiseaseName("Fusarium Wilt / Root Rot");
            query.setDiagnosis(
                    "Wilting despite adequate soil moisture indicates vascular blockage, typically caused by soil-borne pathogens.");
            query.setSeverityLevel("CRITICAL");
            query.setOrganicTreatment("Drench soil with Trichoderma viride or Pseudomonas fluorescens bio-agents.");
            query.setChemicalTreatment(
                    "Apply systemic fungicides like Carbendazim via soil drenching. (Use cautiously)");
            query.setPreventiveMeasures(
                    "Ensure proper land drainage. Practice 3-year crop rotation with non-host crops. Use resistant seed varieties.");
        } else if (symptoms.contains("rust")) {
            query.setDiseaseName("Plant Rust (Pucciniales)");
            query.setDiagnosis(
                    "Rust appears as yellow, orange, red, or brown pustules on the undersides of leaves, weakening the plant.");
            query.setSeverityLevel("HIGH");
            query.setOrganicTreatment(
                    "Dust plants with sulfur powder early in the morning. Use garlic extract sprays.");
            query.setChemicalTreatment("Use Mancozeb or Propiconazole based fungicides. Repeat every 10-14 days.");
            query.setPreventiveMeasures(
                    "Destroy infected plant debris post-harvest. Do not plant the same crop in the affected area immediately.");
        } else {
            query.setDiseaseName("Awaiting Expert Analysis");
            query.setDiagnosis(
                    "Symptoms are atypical. The AI model requires expert human verification. Submitted for expert review.");
            query.setConfidenceScore(0.0);
            query.setSeverityLevel("PENDING");
            query.setOrganicTreatment("Pending expert review.");
            query.setChemicalTreatment("Pending expert review.");
            query.setPreventiveMeasures("Pending expert review.");
        }

        diseaseQueryService.saveQuery(query);
        redirectAttributes.addFlashAttribute("successMessage",
                "Disease query submitted! Preliminary Diagnosis: " + query.getDiseaseName());
        return "redirect:/farmer/disease-detection/result/" + query.getId();
    }

    // New Detailed View for a Single Query Result
    @GetMapping("/disease-detection/result/{id}")
    public String viewDiseaseResult(@PathVariable Long id, Authentication auth, Model model) {
        User user = getCurrentUser(auth);
        DiseaseQuery query = diseaseQueryService.getQueryById(id)
                .orElseThrow(() -> new RuntimeException("Query not found"));

        // Ensure the logged-in farmer owns this query
        if (!query.getUser().getId().equals(user.getId())) {
            return "redirect:/farmer/disease-detection";
        }

        model.addAttribute("query", query);
        return "farmer/disease-result";
    }

    // Learning Videos
    @GetMapping("/learning")
    public String learningVideos(Model model) {
        model.addAttribute("videos", learningVideoService.getAllVideos());
        return "farmer/learning";
    }
}
