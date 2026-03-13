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
import java.util.List;

@Controller
@RequestMapping("/farmer")
@SuppressWarnings("null")
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
    private FinanceService financeService;

    @Autowired
    private DiseaseQueryService diseaseQueryService;

    @Autowired
    private LearningVideoService learningVideoService;

    @Autowired
    private TransactionService transactionService;

    @Autowired
    private MentorService mentorService;

    @Autowired
    private EquipmentService equipmentService;

    @Autowired
    private TraceabilityService traceabilityService;

    @Autowired
    private ClinicService clinicService;

    @Autowired
    private NotificationService notificationService;

    @Autowired
    private ReviewService reviewService;

    @org.springframework.lang.NonNull
    private User getCurrentUser(Authentication auth) {
        User user = userService.findByEmail(auth.getName()).orElseThrow();
        // Dynamic Role Synchronization: Ensure mentors are up-to-date in session
        // context
        if (user.getRole() != User.Role.MENTOR && mentorService.getMentorByUser(user).isPresent()) {
            user.setRole(User.Role.MENTOR);
            userService.updateUser(user);
        }
        return user;
    }

    @GetMapping("/dashboard")
    public String dashboard(Authentication auth, Model model) {
        User user = getCurrentUser(auth);

        model.addAttribute("user", user);
        model.addAttribute("totalListings",
                marketplaceService.getListingsByFarmer(java.util.Objects.requireNonNull(user)).size());
        model.addAttribute("availableListings", marketplaceService.getAvailableListings().size());
        model.addAttribute("diseaseQueries", diseaseQueryService.getQueriesByUser(user).size());
        model.addAttribute("recentQueries", diseaseQueryService.getQueriesByUser(user).stream().limit(5).toList());
        model.addAttribute("recentPrices", marketPriceService.getAllPrices().stream().limit(5).toList());
        model.addAttribute("recentSchemes", schemeService.getActiveSchemes().stream().limit(3).toList());

        // Advanced Analytics
        model.addAttribute("totalEarnings", transactionService.getTotalEarnings(user));
        model.addAttribute("recentTransactions", transactionService.getRecentTransactions(user));
        model.addAttribute("totalReviews", reviewService.getProductReviewsForFarmer(user).size());
        model.addAttribute("recentConsultations",
                clinicService.getConsultationsForFarmer(user.getId()).stream().limit(3).toList());
        model.addAttribute("unreadNotifications", notificationService.getUnreadCount(user));

        return "farmer/dashboard";
    }

    @GetMapping("/earnings")
    public String earnings(Authentication auth, Model model) {
        User user = getCurrentUser(auth);
        model.addAttribute("user", user);

        Double totalEarnings = financeService.getTotalEarnings(user.getId());
        Double commissionPaid = financeService.getTotalCommissionPaid(user.getId());
        Double availableBalance = financeService.getAvailableBalance(user);

        model.addAttribute("totalEarnings", totalEarnings);
        model.addAttribute("commissionPaid", commissionPaid);
        model.addAttribute("availableBalance", availableBalance);
        model.addAttribute("transactions", transactionService.getTransactionsByFarmer(user));
        model.addAttribute("earningsChartData", transactionService.getEarningsChartData(user));
        return "farmer/earnings";
    }

    @GetMapping("/mentors")
    public String mentors(Authentication auth, Model model) {
        User currentUser = getCurrentUser(auth);
        model.addAttribute("user", currentUser);
        List<Mentor> availableMentors = mentorService.getAllAvailableMentors().stream()
                .filter(m -> !m.getUser().getId().equals(currentUser.getId()))
                .collect(java.util.stream.Collectors.toList());
        model.addAttribute("mentors", availableMentors);
        return "farmer/mentors";
    }

    @GetMapping("/consultations")
    public String myConsultations(Authentication auth, Model model) {
        User user = getCurrentUser(auth);
        model.addAttribute("user", user);
        model.addAttribute("consultations", mentorService.getConsultationsForFarmer(user));
        return "farmer/my-consultations";
    }

    @GetMapping("/equipment-rental")
    public String equipmentRental(Authentication auth, Model model,
            @RequestParam(required = false) String type,
            @RequestParam(required = false) String state) {
        User user = getCurrentUser(auth);
        model.addAttribute("user", user);
        model.addAttribute("myEquipment", equipmentService.getEquipmentByOwner(java.util.Objects.requireNonNull(user)));
        model.addAttribute("availableEquipment",
                equipmentService.getFilteredEquipment(type, state, java.util.Objects.requireNonNull(user)));
        model.addAttribute("selectedType", type);
        model.addAttribute("selectedState", state);
        return "farmer/equipment-rental";
    }

    @GetMapping("/equipment/rentals")
    public String myRentals(Authentication auth, Model model) {
        User user = getCurrentUser(auth);
        model.addAttribute("user", user);
        model.addAttribute("myBookings", equipmentService.getRentalsByRenter(java.util.Objects.requireNonNull(user)));
        model.addAttribute("receivedRentals",
                equipmentService.getRentalsByOwner(java.util.Objects.requireNonNull(user)));
        return "farmer/my-rentals";
    }

    @PostMapping("/mentors/book")
    public String bookMentor(@RequestParam Long mentorId, Authentication auth, RedirectAttributes redirectAttributes) {
        User user = getCurrentUser(auth);
        mentorService.bookConsultation(java.util.Objects.requireNonNull(user),
                java.util.Objects.requireNonNull(mentorId));
        redirectAttributes.addFlashAttribute("successMessage",
                "Consultation booked successfully! The mentor will contact you shortly.");
        return "redirect:/farmer/mentors";
    }

    @PostMapping("/equipment/add")
    public String addEquipment(@ModelAttribute Equipment equipment,
            @RequestParam(required = false) MultipartFile image,
            Authentication auth,
            RedirectAttributes redirectAttributes) throws IOException {
        User user = getCurrentUser(auth);
        equipment.setOwner(java.util.Objects.requireNonNull(user));
        equipment.setAvailable(true);
        equipment.setApproved(false); // Admin must approve

        if (image != null && !image.isEmpty()) {
            String uploadDir = "uploads/equipment/";
            Files.createDirectories(Paths.get(uploadDir));
            String fileName = System.currentTimeMillis() + "_" + image.getOriginalFilename();
            Files.write(Paths.get(uploadDir + fileName), image.getBytes());
            equipment.setImagePath("/uploads/equipment/" + fileName);
        }

        equipmentService.saveEquipment(equipment);
        redirectAttributes.addFlashAttribute("successMessage",
                "Equipment listed! It will be visible after admin approval.");
        return "redirect:/farmer/equipment-rental";
    }

    @PostMapping("/equipment/telemetry")
    public String updateTelemetry(@RequestParam Long equipmentId,
            @RequestParam(required = false) Double rate,
            @RequestParam(required = false) String location,
            @RequestParam(required = false) Boolean available,
            Authentication auth,
            RedirectAttributes ra) {
        User user = getCurrentUser(auth);
        Equipment equipment = equipmentService.getEquipmentById(equipmentId);

        if (!equipment.getOwner().getId().equals(user.getId())) {
            throw new RuntimeException("Unauthorized");
        }

        if (rate != null) {
            equipment.setRentalRatePerHour(rate);
            equipment.setRentalRatePerDay(rate * 8);
        }
        if (location != null && !location.isEmpty())
            equipment.setLocation(location);
        if (available != null)
            equipment.setAvailable(available);

        equipmentService.saveEquipment(equipment);
        ra.addFlashAttribute("successMessage", "Telemetry for '" + equipment.getName() + "' updated successfully.");
        return "redirect:/farmer/equipment-rental";
    }

    @PostMapping("/equipment/rent")
    public String rentEquipment(@RequestParam Long equipmentId,
            @RequestParam String startDate,
            @RequestParam String endDate,
            Authentication auth,
            RedirectAttributes redirectAttributes) {
        User user = getCurrentUser(auth);
        java.time.LocalDateTime start = java.time.LocalDateTime.parse(startDate);
        java.time.LocalDateTime end = java.time.LocalDateTime.parse(endDate);

        equipmentService.rentEquipment(java.util.Objects.requireNonNull(user), equipmentId, start, end);
        redirectAttributes.addFlashAttribute("successMessage",
                "Rental request sent! Wait for owner approval.");
        return "redirect:/farmer/equipment-rental";
    }

    @PostMapping("/equipment/rental/status")
    public String updateRentalStatus(@RequestParam Long rentalId,
            @RequestParam String status,
            RedirectAttributes redirectAttributes) {
        equipmentService.updateRentalStatus(rentalId, EquipmentRental.Status.valueOf(status));
        redirectAttributes.addFlashAttribute("successMessage", "Rental status updated.");
        return "redirect:/farmer/equipment/rentals";
    }

    @GetMapping("/profile")
    public String profile(Authentication auth, Model model) {
        User user = getCurrentUser(auth);
        model.addAttribute("user", user);

        // Add summary analytics to profile (Command Center integration)
        model.addAttribute("totalListings", marketplaceService.getListingsByFarmer(user).size());
        model.addAttribute("diseaseQueries", diseaseQueryService.getQueriesByUser(user).size());
        model.addAttribute("totalEarnings", transactionService.getTotalEarnings(user));

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
    public String cropRecommendation(Authentication auth, Model model,
            @RequestParam(required = false) String season,
            @RequestParam(required = false) String soilType) {
        User user = getCurrentUser(auth);
        model.addAttribute("user", user);
        model.addAttribute("crops", cropService.getCropsBySeasonAndSoil(season, soilType));
        model.addAttribute("selectedSeason", season);
        model.addAttribute("selectedSoil", soilType);
        return "farmer/crop-recommendation";
    }

    // Market Prices
    @GetMapping("/market-prices")
    public String marketPrices(Authentication auth, Model model,
            @RequestParam(required = false) String search,
            @RequestParam(required = false) String state) {
        User user = getCurrentUser(auth);
        model.addAttribute("user", user);
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
    public String schemes(Authentication auth, Model model,
            @RequestParam(required = false) String search) {
        User user = getCurrentUser(auth);
        model.addAttribute("user", user);
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
    public String marketplace(Authentication auth, Model model, jakarta.servlet.http.HttpServletRequest request) {
        User user = getCurrentUser(auth);
        model.addAttribute("user", user);
        java.util.List<MarketplaceListing> myListings = marketplaceService.getListingsByFarmer(user);

        // Generate QR codes for traceability
        String baseUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                + request.getContextPath();
        java.util.Map<Long, String> qrCodes = new java.util.HashMap<>();

        myListings.forEach(l -> {
            if (l.getTraceabilityRecord() != null) {
                String traceUrl = baseUrl + "/traceability/" + l.getTraceabilityRecord().getTraceabilityId();
                qrCodes.put(l.getId(), traceabilityService.generateQRCodeBase64(traceUrl));
            }
        });

        model.addAttribute("myListings", myListings);
        model.addAttribute("qrCodes", qrCodes);
        model.addAttribute("listing", new MarketplaceListing());
        return "farmer/marketplace";
    }

    @PostMapping("/marketplace/add")
    public String addListing(@ModelAttribute MarketplaceListing listing,
            @RequestParam(defaultValue = "") String plantingDate,
            @RequestParam(defaultValue = "") String harvestDate,
            @RequestParam(defaultValue = "") String fertilizerUsage,
            @RequestParam(defaultValue = "") String pesticideUsage,
            @RequestParam(defaultValue = "") String irrigationMethod,
            @RequestParam(defaultValue = "") String sustainabilityPractices,
            Authentication auth,
            RedirectAttributes redirectAttributes) {
        User user = getCurrentUser(auth);
        listing.setFarmer(user);
        listing.setContactNumber(user.getPhone());
        listing.setLocation(user.getDistrict() + ", " + user.getState());

        MarketplaceListing savedListing = marketplaceService.saveListing(listing);

        TraceabilityRecord record = new TraceabilityRecord();
        record.setListing(savedListing);
        if (plantingDate != null && !plantingDate.isEmpty())
            record.setPlantingDate(java.time.LocalDate.parse(plantingDate));
        if (harvestDate != null && !harvestDate.isEmpty())
            record.setHarvestDate(java.time.LocalDate.parse(harvestDate));
        record.setFertilizerUsage(fertilizerUsage);
        record.setPesticideUsage(pesticideUsage);
        record.setIrrigationMethod(irrigationMethod);
        record.setSustainabilityPractices(sustainabilityPractices);

        traceabilityService.saveRecord(record);

        redirectAttributes.addFlashAttribute("successMessage", "Listing with Farm-to-Fork traceability added!");
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
        model.addAttribute("user", user);
        model.addAttribute("query", new DiseaseQuery());
        model.addAttribute("myQueries", diseaseQueryService.getQueriesByUser(user));
        model.addAttribute("experts", clinicService.getApprovedExperts());
        return "farmer/disease-detection";
    }

    @PostMapping("/disease-detection/submit")
    public String submitDiseaseQuery(@ModelAttribute DiseaseQuery query,
            @RequestParam(required = false) MultipartFile image,
            @RequestParam(required = false) Long expertId,
            Authentication auth,
            RedirectAttributes redirectAttributes) throws IOException {
        User user = getCurrentUser(auth);
        query.setUser(user);

        if (expertId != null) {
            ClinicExpert expert = clinicService.getExpertById(expertId);
            query.setExpert(expert);
            query.setStatus(DiseaseQuery.Status.ASSIGNED.name());
        }

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
        model.addAttribute("user", user);
        DiseaseQuery query = diseaseQueryService.getQueryById(id)
                .orElseThrow(() -> new RuntimeException("Query not found"));

        // Ensure the logged-in farmer owns this query
        if (!query.getUser().getId().equals(user.getId())) {
            return "redirect:/farmer/disease-detection";
        }
        model.addAttribute("query", query);
        return "farmer/disease-result";
    }

    @PostMapping("/disease-detection/pay/{id}")
    public String payForExpertDiagnosis(@PathVariable Long id,
            @RequestParam String paymentMethod,
            Authentication auth, RedirectAttributes ra) {
        DiseaseQuery query = diseaseQueryService.getQueryById(id).orElseThrow();
        query.setStatus(DiseaseQuery.Status.DIAGNOSED.name());
        diseaseQueryService.saveQuery(query);
        ra.addFlashAttribute("successMessage",
                "Payment of ₹299 via " + paymentMethod + " successful! Expert report unlocked.");
        return "redirect:/farmer/disease-detection";
    }

    // --- FINANCIAL DASHBOARD ---
    @GetMapping("/finance")
    public String financeDashboard(Authentication auth, Model model) {
        User farmer = getCurrentUser(auth);
        model.addAttribute("user", farmer);
        model.addAttribute("farmer", farmer);

        Double totalEarnings = financeService.getTotalEarnings(farmer.getId());
        Double commissionPaid = financeService.getTotalCommissionPaid(farmer.getId());
        Double availableBalance = financeService.getAvailableBalance(farmer);

        model.addAttribute("totalEarnings", totalEarnings);
        model.addAttribute("commissionPaid", commissionPaid);
        model.addAttribute("availableBalance", availableBalance);
        model.addAttribute("withdrawals", financeService.getFarmerWithdrawalRequests(farmer));
        model.addAttribute("monthlyEarningsGraph", financeService.getMonthlyEarningsGraph(farmer.getId()));

        return "farmer/farmer-finance";
    }

    @PostMapping("/finance/withdraw")
    public String requestWithdrawal(@RequestParam Double amount,
            @RequestParam(required = false) String upiId,
            @RequestParam(required = false) String bankAccountNumber,
            @RequestParam(required = false) String ifscCode,
            Authentication auth, RedirectAttributes ra) {
        User farmer = getCurrentUser(auth);

        // Update User banking details proactively
        farmer.setUpiId(upiId);
        farmer.setBankAccountNumber(bankAccountNumber);
        farmer.setIfscCode(ifscCode);
        userService.updateUser(farmer);

        Double availableBalance = financeService.getAvailableBalance(farmer);

        if (amount > availableBalance || amount <= 0) {
            ra.addFlashAttribute("errorMessage", "Invalid withdrawal amount! Check available balance.");
            return "redirect:/farmer/finance";
        }

        financeService.requestWithdrawal(farmer, amount);
        ra.addFlashAttribute("successMessage", "Withdrawal request submitted successfully! Pending approval.");
        return "redirect:/farmer/finance";
    }

    // Learning Videos
    @GetMapping("/learning")
    public String learningVideos(Authentication auth, Model model) {
        User user = getCurrentUser(auth);
        model.addAttribute("user", user);
        model.addAttribute("videos", learningVideoService.getAllVideos());
        return "farmer/learning";
    }

    // Order Management
    @GetMapping("/orders")
    public String orders(Authentication auth, Model model) {
        User user = getCurrentUser(auth);
        model.addAttribute("user", user);
        List<Transaction> mySales = transactionService.getMarketplaceSales(user);
        model.addAttribute("sales", mySales);
        return "farmer/sales-orders";
    }

    @PostMapping("/orders/ship/{id}")
    public String updateShipment(@PathVariable Long id, @RequestParam String trackingNumber, Authentication auth,
            RedirectAttributes redirectAttributes) {
        User user = getCurrentUser(auth);
        Transaction transaction = transactionService.getTransactionById(id);

        if (!transaction.getFarmer().getId().equals(user.getId())) {
            throw new RuntimeException("Unauthorized");
        }

        transactionService.updateTrackingNumber(id, trackingNumber);
        redirectAttributes.addFlashAttribute("successMessage", "Order marked as shipped and tracking updated.");
        return "redirect:/farmer/orders";
    }

    @PostMapping("/orders/status/{id}")
    public String updateOrderStatus(@PathVariable Long id, @RequestParam String status, Authentication auth,
            RedirectAttributes redirectAttributes) {
        User user = getCurrentUser(auth);
        Transaction transaction = transactionService.getTransactionById(id);

        if (!transaction.getFarmer().getId().equals(user.getId())) {
            throw new RuntimeException("Unauthorized");
        }

        try {
            transactionService.updateOrderStatus(id, Transaction.OrderStatus.valueOf(status));
            redirectAttributes.addFlashAttribute("successMessage", "Order status updated to " + status);
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", e.getMessage());
        }
        return "redirect:/farmer/orders";
    }

    @PostMapping("/orders/return/complete/{id}")
    public String completeReturn(@PathVariable Long id, Authentication auth, RedirectAttributes redirectAttributes) {
        User user = getCurrentUser(auth);
        Transaction transaction = transactionService.getTransactionById(id);

        if (!transaction.getFarmer().getId().equals(user.getId())) {
            throw new RuntimeException("Unauthorized");
        }

        try {
            transactionService.completeReturn(id);
            redirectAttributes.addFlashAttribute("successMessage", "Return processed and inventory updated.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", e.getMessage());
        }
        return "redirect:/farmer/orders";
    }

    @PostMapping("/orders/delete/{id}")
    public String deleteOrder(@PathVariable Long id, Authentication auth, RedirectAttributes redirectAttributes) {
        User user = getCurrentUser(auth);
        Transaction transaction = transactionService.getTransactionById(id);

        if (!transaction.getFarmer().getId().equals(user.getId())) {
            throw new RuntimeException("Unauthorized");
        }

        transactionService.deleteTransactionById(id);
        redirectAttributes.addFlashAttribute("successMessage", "Order record removed successfully.");
        return "redirect:/farmer/orders";
    }

    @GetMapping("/weather")
    public String weather(Authentication auth, Model model) {
        User user = getCurrentUser(auth);
        model.addAttribute("user", user);
        return "farmer/weather";
    }

    @GetMapping("/product-reviews")
    public String productReviews(Authentication auth, Model model) {
        User user = getCurrentUser(auth);
        model.addAttribute("user", user);
        List<ProductReview> reviews = reviewService.getProductReviewsForFarmer(user);
        model.addAttribute("reviews", reviews);

        // Calculate Average Rating
        double avg = reviews.isEmpty() ? 0.0
                : reviews.stream().mapToInt(ProductReview::getRating).average().orElse(0.0);
        model.addAttribute("averageRating", avg);

        return "farmer/product-reviews";
    }

    @GetMapping("/notifications")
    public String notifications(Authentication auth, Model model) {
        User user = getCurrentUser(auth);
        model.addAttribute("user", user);
        model.addAttribute("notifications", notificationService.getAllNotifications(user));
        return "farmer/notifications";
    }
}
