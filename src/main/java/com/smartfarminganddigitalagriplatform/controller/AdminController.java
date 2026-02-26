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
import java.util.UUID;

@Controller
@RequestMapping("/admin")
public class AdminController {

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

    @GetMapping("/dashboard")
    public String dashboard(Authentication auth, Model model) {
        User admin = userService.findByEmail(auth.getName()).orElseThrow();
        model.addAttribute("admin", admin);
        model.addAttribute("totalFarmers", userService.countByRole(User.Role.FARMER));
        model.addAttribute("totalBuyers", userService.countByRole(User.Role.BUYER));
        model.addAttribute("totalCrops", cropService.getTotalCrops());
        model.addAttribute("totalListings", marketplaceService.getTotalListings());
        model.addAttribute("totalPrices", marketPriceService.getAllPrices().size());
        model.addAttribute("totalSchemes", schemeService.getTotalSchemes());
        model.addAttribute("pendingQueries", diseaseQueryService.getPendingCount());
        model.addAttribute("recentUsers", userService.findAllUsers().stream()
                .sorted((a, b) -> b.getCreatedAt().compareTo(a.getCreatedAt()))
                .limit(5).toList());
        model.addAttribute("recentQueries", diseaseQueryService.getPendingQueries()
                .stream().limit(3).toList());
        return "admin/dashboard";
    }

    // User Management
    @GetMapping("/users")
    public String users(Model model) {
        model.addAttribute("users", userService.findAllUsers());
        return "admin/users";
    }

    @PostMapping("/users/delete/{id}")
    public String deleteUser(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        userService.deleteUser(id);
        redirectAttributes.addFlashAttribute("successMessage", "User deleted successfully!");
        return "redirect:/admin/users";
    }

    @PostMapping("/users/deactivate-plan/{id}")
    public String deactivatePlan(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        User user = userService.findById(id).orElseThrow();
        if (user.getRole() == User.Role.BUYER) {
            user.setSubscriptionPlan("Local Buyer");
        } else {
            user.setSubscriptionPlan("Basic Plan");
        }
        userService.updateUser(user);
        redirectAttributes.addFlashAttribute("successMessage", "User's subscription has been deactivated!");
        return "redirect:/admin/users";
    }

    // Crop Management
    @GetMapping("/crops")
    public String crops(Model model) {
        model.addAttribute("crops", cropService.getAllCrops());
        model.addAttribute("crop", new Crop());
        return "admin/crops";
    }

    @PostMapping("/crops/add")
    public String addCrop(@ModelAttribute Crop crop,
            @RequestParam(value = "imageFile", required = false) MultipartFile file,
            RedirectAttributes redirectAttributes) {
        handleImageUpload(crop, file);
        cropService.saveCrop(crop);
        redirectAttributes.addFlashAttribute("successMessage", "Crop added successfully!");
        return "redirect:/admin/crops";
    }

    @PostMapping("/crops/edit")
    public String editCrop(@ModelAttribute Crop crop,
            @RequestParam(value = "imageFile", required = false) MultipartFile file,
            RedirectAttributes redirectAttributes) {
        Crop existingCrop = cropService.getCropById(crop.getId())
                .orElseThrow(() -> new RuntimeException("Crop not found"));

        existingCrop.setName(crop.getName());
        existingCrop.setSeason(crop.getSeason());
        existingCrop.setSoilType(crop.getSoilType());
        existingCrop.setWaterRequirement(crop.getWaterRequirement());
        existingCrop.setMinTemperature(crop.getMinTemperature());
        existingCrop.setMaxTemperature(crop.getMaxTemperature());
        existingCrop.setGrowthDuration(crop.getGrowthDuration());
        existingCrop.setDescription(crop.getDescription());

        if (crop.getImageUrl() != null && !crop.getImageUrl().isEmpty()) {
            existingCrop.setImageUrl(crop.getImageUrl());
        }

        handleImageUpload(existingCrop, file);

        cropService.saveCrop(existingCrop);
        redirectAttributes.addFlashAttribute("successMessage", "Crop updated successfully!");
        return "redirect:/admin/crops";
    }

    private void handleImageUpload(Crop crop, MultipartFile file) {
        if (file != null && !file.isEmpty()) {
            try {
                String fileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
                String uploadDir = "src/main/resources/static/images/crops/";
                Path uploadPath = Paths.get(uploadDir);

                if (!Files.exists(uploadPath)) {
                    Files.createDirectories(uploadPath);
                }

                try (var inputStream = file.getInputStream()) {
                    Files.copy(inputStream, uploadPath.resolve(fileName), StandardCopyOption.REPLACE_EXISTING);
                }
                crop.setImageUrl("/images/crops/" + fileName);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    @PostMapping("/crops/delete/{id}")
    public String deleteCrop(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        cropService.deleteCrop(id);
        redirectAttributes.addFlashAttribute("successMessage", "Crop deleted successfully!");
        return "redirect:/admin/crops";
    }

    // Market Price Management
    @GetMapping("/market-prices")
    public String marketPrices(Model model) {
        model.addAttribute("prices", marketPriceService.getAllPrices());
        model.addAttribute("price", new MarketPrice());
        return "admin/market-prices";
    }

    @PostMapping("/market-prices/add")
    public String addPrice(@ModelAttribute MarketPrice price, RedirectAttributes redirectAttributes) {
        marketPriceService.savePrice(price);
        redirectAttributes.addFlashAttribute("successMessage", "Market price added successfully!");
        return "redirect:/admin/market-prices";
    }

    @PostMapping("/market-prices/delete/{id}")
    public String deletePrice(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        marketPriceService.deletePrice(id);
        redirectAttributes.addFlashAttribute("successMessage", "Price deleted successfully!");
        return "redirect:/admin/market-prices";
    }

    // Scheme Management
    @GetMapping("/schemes")
    public String schemes(Model model) {
        model.addAttribute("schemes", schemeService.getAllSchemes());
        model.addAttribute("scheme", new GovernmentScheme());
        return "admin/schemes";
    }

    @PostMapping("/schemes/add")
    public String addScheme(@ModelAttribute GovernmentScheme scheme, RedirectAttributes redirectAttributes) {
        schemeService.saveScheme(scheme);
        redirectAttributes.addFlashAttribute("successMessage", "Scheme added successfully!");
        return "redirect:/admin/schemes";
    }

    @PostMapping("/schemes/delete/{id}")
    public String deleteScheme(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        schemeService.deleteScheme(id);
        redirectAttributes.addFlashAttribute("successMessage", "Scheme deleted successfully!");
        return "redirect:/admin/schemes";
    }

    // Disease Queries
    @GetMapping("/disease-queries")
    public String diseaseQueries(Model model) {
        model.addAttribute("queries", diseaseQueryService.getAllQueries());
        return "admin/disease-queries";
    }

    @PostMapping("/disease-queries/update/{id}")
    public String updateDiagnosis(@PathVariable Long id,
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

        query.setStatus(DiseaseQuery.Status.DIAGNOSED);
        diseaseQueryService.saveQuery(query);
        redirectAttributes.addFlashAttribute("successMessage", "AI / Expert Analysis Updated Successfully!");
        return "redirect:/admin/disease-queries";
    }

    // Marketplace Management
    @GetMapping("/marketplace")
    public String marketplace(Model model) {
        model.addAttribute("listings", marketplaceService.getAllListings());
        return "admin/marketplace";
    }

    // Learning Videos Management
    @GetMapping("/learning-videos")
    public String learningVideos(Model model) {
        model.addAttribute("videos", learningVideoService.getAllVideos());
        model.addAttribute("video", new LearningVideo());
        return "admin/learning-videos";
    }

    @PostMapping("/learning-videos/add")
    public String addLearningVideo(@ModelAttribute LearningVideo video, RedirectAttributes redirectAttributes) {
        // Basic URL processing to extract embed string more robustly
        String url = video.getVideoUrl();
        String embeddedUrl = url;
        try {
            if (url.contains("watch?v=")) {
                String videoId = url.substring(url.indexOf("v=") + 2);
                int ampersandPos = videoId.indexOf('&');
                if (ampersandPos != -1) {
                    videoId = videoId.substring(0, ampersandPos);
                }
                embeddedUrl = "https://www.youtube.com/embed/" + videoId;
            } else if (url.contains("youtu.be/")) {
                String videoId = url.substring(url.indexOf("youtu.be/") + 9);
                int queryPos = videoId.indexOf('?');
                if (queryPos != -1) {
                    videoId = videoId.substring(0, queryPos);
                }
                embeddedUrl = "https://www.youtube.com/embed/" + videoId;
            }
        } catch (Exception e) {
            // ignore and preserve the original URL
        }
        video.setVideoUrl(embeddedUrl);

        learningVideoService.saveVideo(video);
        redirectAttributes.addFlashAttribute("successMessage", "Learning video added successfully!");
        return "redirect:/admin/learning-videos";
    }

    @PostMapping("/learning-videos/delete/{id}")
    public String deleteLearningVideo(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        learningVideoService.deleteVideo(id);
        redirectAttributes.addFlashAttribute("successMessage", "Learning video deleted successfully!");
        return "redirect:/admin/learning-videos";
    }
}
