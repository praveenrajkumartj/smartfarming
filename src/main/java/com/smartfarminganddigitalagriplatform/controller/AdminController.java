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
import java.util.Map;
import java.util.UUID;
import jakarta.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/admin")
@SuppressWarnings("null")
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

    @Autowired
    private TransactionService transactionService;

    @Autowired
    private FinanceService financeService;

    @Autowired
    private MentorService mentorService;

    @Autowired
    private EquipmentService equipmentService;

    @Autowired
    private AdminAnalyticsService adminAnalyticsService;

    @ModelAttribute
    public void addAttributes(Model model, Authentication auth) {
        if (auth != null && auth.isAuthenticated()) {
            User admin = userService.findByEmail(auth.getName()).orElse(null);
            model.addAttribute("admin", admin);
            model.addAttribute("user", admin);
        }
    }

    @GetMapping("/dashboard")
    public String dashboard(Authentication auth, Model model) {
        User admin = userService.findByEmail(auth.getName()).orElseThrow();
        model.addAttribute("admin", admin);
        model.addAttribute("user", admin); // Standardized for header/voice assistant
        model.addAttribute("totalFarmers", userService.countByRole(User.Role.FARMER));
        model.addAttribute("totalBuyers", userService.countByRole(User.Role.BUYER));
        model.addAttribute("totalCrops", cropService.getTotalCrops());
        model.addAttribute("totalListings", marketplaceService.getTotalListings());
        model.addAttribute("totalPrices", marketPriceService.getAllPrices().size());
        model.addAttribute("totalSchemes", schemeService.getTotalSchemes());
        model.addAttribute("pendingQueries", diseaseQueryService.getPendingCount());
        model.addAttribute("totalVerified", userService.countByVerifiedTrue());

        // New features metrics
        model.addAttribute("totalEquipment", equipmentService.getAvailableEquipmentExceptOwner(null).size()
                + equipmentService.getEquipmentByOwner(null).size());
        model.addAttribute("activeMentors", mentorService.getAllAvailableMentors().size());
        model.addAttribute("platformRevenue", transactionService.getAllTransactions().stream()
                .mapToDouble(Transaction::getCommission)
                .sum());

        model.addAttribute("recentUsers", userService.findAllUsers().stream()
                .filter(u -> u.getCreatedAt() != null)
                .sorted((a, b) -> b.getCreatedAt().compareTo(a.getCreatedAt()))
                .limit(5).toList());
        model.addAttribute("recentQueries", diseaseQueryService.getPendingQueries()
                .stream().limit(3).toList());

        // Suspicious activity for monitoring
        model.addAttribute("suspiciousListings", marketplaceService.getSuspiciousListings());
        model.addAttribute("suspiciousTransactions", transactionService.getSuspiciousTransactions());

        // Advanced Admin Analytics
        Map<String, Object> advancedAnalytics = adminAnalyticsService.getDashboardAnalytics();
        model.addAttribute("analytics", advancedAnalytics);

        return "admin/dashboard";
    }

    @GetMapping("/profile")
    public String profile(Authentication auth, Model model) {
        User admin = userService.findByEmail(auth.getName()).orElseThrow();
        model.addAttribute("user", admin);
        model.addAttribute("admin", admin);

        // Add summary analytics for profile dashboard
        model.addAttribute("totalUsers", userService.findAllUsers().size());
        model.addAttribute("totalRevenue", transactionService.getAllTransactions().stream()
                .mapToDouble(Transaction::getCommission)
                .sum());

        return "admin/profile";
    }

    @PostMapping("/profile/update")
    public String updateAdminProfile(@ModelAttribute User updatedUser,
            @RequestParam(required = false) MultipartFile profileImage,
            Authentication auth,
            RedirectAttributes redirectAttributes) throws IOException {
        User admin = userService.findByEmail(auth.getName()).orElseThrow();
        admin.setFullName(updatedUser.getFullName());
        admin.setPhone(updatedUser.getPhone());
        admin.setState(updatedUser.getState());
        admin.setDistrict(updatedUser.getDistrict());

        if (profileImage != null && !profileImage.isEmpty()) {
            String uploadDir = "uploads/profiles/";
            Files.createDirectories(Paths.get(uploadDir));
            String fileName = System.currentTimeMillis() + "_" + profileImage.getOriginalFilename();
            Path filePath = Paths.get(uploadDir + fileName);
            Files.write(filePath, profileImage.getBytes());
            admin.setProfileImagePath("/uploads/profiles/" + fileName);
        }

        userService.updateUser(admin);
        redirectAttributes.addFlashAttribute("successMessage", "Admin profile updated successfully!");
        return "redirect:/admin/profile";
    }

    @GetMapping("/export/report")
    public void exportBusinessIntelligenceReport(HttpServletResponse response) throws IOException {
        response.setContentType("text/csv");
        response.setHeader("Content-Disposition", "attachment; filename=\"Agroplanter_intelligence_report.csv\"");

        java.io.PrintWriter out = response.getWriter();
        out.println("Agroplanter Business Intelligence Report");
        out.println("Metric,Value");

        Map<String, Object> data = adminAnalyticsService.getDashboardAnalytics();

        out.println("Total Revenue (INR)," + data.get("totalRevenue"));
        out.println("Total Platform Commissions (INR)," + data.get("totalCommissions"));

        out.println("Marketplace Conversion Rate (%)," + data.get("conversionRate"));
        out.println("Marketplace Sold Listings," + data.get("soldListings"));
        out.println("Marketplace Total Listings," + data.get("totalListings"));

        out.println("Demand vs Supply - Total Quantity Created," + data.get("totalSupplyQs"));
        out.println("Demand vs Supply - Total Quantity Sold," + data.get("totalDemandQs"));

        out.println("Conversion B2C (Consumer Purchases)," + data.get("b2cSalesCount"));
        out.println("Conversion B2B (Enterprise Deals)," + data.get("b2bSalesCount"));

        out.println("Equipment Rentals Completed," + data.get("successfulRentals"));
        out.println("Equipment Rentals Total," + data.get("totalRentals"));

        out.println("Clinic Consultations Closed," + data.get("completedConsultations"));
        out.println("Clinic Consultations Handled," + data.get("totalConsultations"));

        out.flush();
    }

    @GetMapping("/b2b-deals")
    public String monitorB2BDeals(Model model) {
        // Collect all transactions where the buyer has B2B_BUYER role
        java.util.List<Transaction> b2bDeals = transactionService.getAllTransactions().stream()
                .filter(t -> t.getBuyer() != null && t.getBuyer().getRole() == User.Role.B2B_BUYER)
                .toList();
        model.addAttribute("deals", b2bDeals);
        return "admin/b2b-deals";
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

    @PostMapping("/users/edit")
    public String editUser(@ModelAttribute User user, RedirectAttributes redirectAttributes) {
        User existing = userService.findById(user.getId())
                .orElseThrow(() -> new RuntimeException("User not found"));

        existing.setFullName(user.getFullName());
        existing.setPhone(user.getPhone());
        existing.setState(user.getState());
        existing.setDistrict(user.getDistrict());
        existing.setRole(user.getRole());

        userService.updateUser(existing);
        redirectAttributes.addFlashAttribute("successMessage", "Identity profile updated successfully!");
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

    @PostMapping("/market-prices/edit")
    public String editPrice(@ModelAttribute MarketPrice price, RedirectAttributes redirectAttributes) {
        MarketPrice existing = marketPriceService.getPriceById(price.getId())
                .orElseThrow(() -> new RuntimeException("Price record not found"));

        existing.setCropName(price.getCropName());
        existing.setMarket(price.getMarket());
        existing.setState(price.getState());
        existing.setUnit(price.getUnit());
        existing.setMinPrice(price.getMinPrice());
        existing.setMaxPrice(price.getMaxPrice());
        existing.setModalPrice(price.getModalPrice());
        existing.setPriceDate(price.getPriceDate());

        marketPriceService.savePrice(existing);
        redirectAttributes.addFlashAttribute("successMessage", "Market price updated successfully!");
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

    @PostMapping("/schemes/edit")
    public String editScheme(@ModelAttribute GovernmentScheme scheme, RedirectAttributes redirectAttributes) {
        GovernmentScheme existing = schemeService.getSchemeById(scheme.getId())
                .orElseThrow(() -> new RuntimeException("Scheme not found"));

        existing.setTitle(scheme.getTitle());
        existing.setDescription(scheme.getDescription());
        existing.setCategory(scheme.getCategory());
        existing.setLastDate(scheme.getLastDate());
        existing.setEligibility(scheme.getEligibility());
        existing.setBenefits(scheme.getBenefits());
        existing.setApplicationLink(scheme.getApplicationLink());

        schemeService.saveScheme(existing);
        redirectAttributes.addFlashAttribute("successMessage", "Scheme updated successfully!");
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

    // Marketplace Management
    @GetMapping("/marketplace")
    public String marketplace(Model model) {
        model.addAttribute("listings", marketplaceService.getAllListings());
        return "admin/marketplace";
    }

    @GetMapping("/traceability-monitor")
    public String monitorTraceability(Model model) {
        model.addAttribute("listings", marketplaceService.getAllListings());
        return "admin/traceability-monitor";
    }

    // Equipment Management
    @GetMapping("/equipment-approvals")
    public String equipmentApprovals(Model model) {
        model.addAttribute("pendingEquipment", equipmentService.getPendingApprovals());
        return "admin/equipment-approvals";
    }

    @PostMapping("/equipment/approve/{id}")
    public String approveEquipment(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        equipmentService.approveEquipment(id);
        redirectAttributes.addFlashAttribute("successMessage", "Equipment approved successfully!");
        return "redirect:/admin/equipment-approvals";
    }

    @GetMapping("/rental-transactions")
    public String monitorRentals(Model model) {
        model.addAttribute("rentals", equipmentService.getAllRentals());
        return "admin/rental-transactions";
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

    @PostMapping("/learning-videos/edit")
    public String editLearningVideo(@ModelAttribute LearningVideo video, RedirectAttributes redirectAttributes) {
        LearningVideo existing = learningVideoService.findById(video.getId())
                .orElseThrow(() -> new RuntimeException("Asset not found"));

        existing.setTitle(video.getTitle());
        existing.setCategory(video.getCategory());
        existing.setDescription(video.getDescription());

        // Convert URL if necessary
        String url = video.getVideoUrl();
        String embeddedUrl = url;
        try {
            if (url.contains("watch?v=")) {
                String videoId = url.substring(url.indexOf("v=") + 2);
                int ampersandPos = videoId.indexOf('&');
                if (ampersandPos != -1)
                    videoId = videoId.substring(0, ampersandPos);
                embeddedUrl = "https://www.youtube.com/embed/" + videoId;
            } else if (url.contains("youtu.be/")) {
                String videoId = url.substring(url.indexOf("youtu.be/") + 9);
                int queryPos = videoId.indexOf('?');
                if (queryPos != -1)
                    videoId = videoId.substring(0, queryPos);
                embeddedUrl = "https://www.youtube.com/embed/" + videoId;
            }
        } catch (Exception e) {
        }
        existing.setVideoUrl(embeddedUrl);

        learningVideoService.updateVideo(existing);
        redirectAttributes.addFlashAttribute("successMessage", "Educational asset reconfigured successfully.");
        return "redirect:/admin/learning-videos";
    }

    // Clinic Experts Management
    @Autowired
    private ClinicService clinicService;

    @GetMapping("/clinic-experts")
    public String clinicExperts(Model model) {
        model.addAttribute("pendingExperts", clinicService.getPendingExperts());
        return "admin/clinic-experts";
    }

    @PostMapping("/clinic/approve-expert/{id}")
    public String approveClinicExpert(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        clinicService.approveExpert(id);
        redirectAttributes.addFlashAttribute("successMessage", "Clinic Expert approved!");
        return "redirect:/admin/clinic-experts";
    }

    // --- FINANCIAL PAYOUTS MANAGEMENT ---
    @GetMapping("/payouts")
    public String getPayoutsDashboard(Model model) {
        model.addAttribute("pendingWithdrawals", financeService.getAllPendingWithdrawals());
        model.addAttribute("completedWithdrawals", financeService.getAllCompletedWithdrawals());
        return "admin/admin-payouts";
    }

    @PostMapping("/payouts/approve/{id}")
    public String approvePayout(@PathVariable Long id, RedirectAttributes ra) {
        financeService.approveWithdrawal(id);
        ra.addFlashAttribute("successMessage", "Payout Request #" + id + " Approved & Marked as Completed!");
        return "redirect:/admin/payouts";
    }

    @PostMapping("/payouts/reject/{id}")
    public String rejectPayout(@PathVariable Long id, RedirectAttributes ra) {
        financeService.rejectWithdrawal(id);
        ra.addFlashAttribute("successMessage", "Payout Request #" + id + " has been Rejected.");
        return "redirect:/admin/payouts";
    }
}
