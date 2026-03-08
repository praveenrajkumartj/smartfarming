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
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@Controller
@RequestMapping("/buyer")
public class BuyerController {

    @Autowired
    private UserService userService;

    @Autowired
    private MarketplaceService marketplaceService;

    @Autowired
    private MarketPriceService marketPriceService;

    @Autowired
    private GovernmentSchemeService schemeService;

    @Autowired
    private TransactionService transactionService;

    private User getCurrentUser(Authentication auth) {
        return userService.findByEmail(auth.getName()).orElseThrow();
    }

    @GetMapping("/dashboard")
    public String dashboard(Authentication auth, Model model) {
        User user = getCurrentUser(auth);
        model.addAttribute("user", user);
        model.addAttribute("availableListings", marketplaceService.getAvailableListings().size());
        model.addAttribute("recentListings", marketplaceService.getAvailableListings().stream().limit(6).toList());
        model.addAttribute("recentPrices", marketPriceService.getAllPrices().stream().limit(5).toList());

        // Buyer-specific data
        List<Transaction> myPurchases = transactionService.getAllTransactions().stream()
                .filter(t -> t.getBuyer() != null && t.getBuyer().getId().equals(user.getId()))
                .toList();
        model.addAttribute("myPurchasesCount", myPurchases.size());
        model.addAttribute("recentPurchases", myPurchases.stream().limit(3).toList());

        return "buyer/dashboard";
    }

    @GetMapping("/profile")
    public String profile(Authentication auth, Model model) {
        User user = getCurrentUser(auth);
        model.addAttribute("user", user);

        // Add summary analytics to profile (Command Center integration)
        model.addAttribute("availableListings", marketplaceService.getAvailableListings().size());
        model.addAttribute("recentListings", marketplaceService.getAvailableListings().stream().limit(3).toList());
        model.addAttribute("recentPrices", marketPriceService.getAllPrices().stream().limit(3).toList());

        // Buyer-specific summary
        List<Transaction> myPurchases = transactionService.getAllTransactions().stream()
                .filter(t -> t.getBuyer() != null && t.getBuyer().getId().equals(user.getId()))
                .toList();
        model.addAttribute("myPurchasesCount", myPurchases.size());

        return "buyer/profile";
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
        return "redirect:/buyer/profile";
    }

    @PostMapping("/profile/deactivate-plan")
    public String deactivatePlan(Authentication auth, RedirectAttributes redirectAttributes) {
        User user = getCurrentUser(auth);
        user.setSubscriptionPlan("Local Buyer");
        userService.updateUser(user);
        redirectAttributes.addFlashAttribute("successMessage", "Subscription deactivated successfully.");
        return "redirect:/buyer/profile";
    }

    @GetMapping("/marketplace")
    public String marketplace(Authentication auth, Model model,
            @RequestParam(required = false) String search) {
        User user = getCurrentUser(auth);
        model.addAttribute("user", user);
        List<MarketplaceListing> listings;
        if (search != null && !search.isEmpty()) {
            listings = marketplaceService.searchByCrop(search);
        } else {
            listings = marketplaceService.getAvailableListings();
        }
        model.addAttribute("listings", listings);
        model.addAttribute("search", search);
        return "buyer/marketplace";
    }

    @GetMapping("/contact-farmer/{id}")
    public String contactFarmer(@PathVariable Long id, Authentication auth, Model model) {
        if (id == null) {
            throw new IllegalArgumentException("ID cannot be null");
        }
        User user = getCurrentUser(auth);
        model.addAttribute("user", user);
        MarketplaceListing listing = marketplaceService.getListingById(id)
                .orElseThrow(() -> new RuntimeException("Listing not found"));
        model.addAttribute("listing", listing);
        return "buyer/contact-farmer";
    }

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
        return "buyer/market-prices";
    }

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
        return "buyer/schemes";
    }

    @PostMapping("/purchase/{id}")
    public String purchaseProduct(@PathVariable Long id,
            @RequestParam Double quantity,
            @RequestParam String shippingAddress,
            @RequestParam String paymentMethod,
            Authentication auth,
            RedirectAttributes redirectAttributes) {
        if (id == null) {
            throw new IllegalArgumentException("Product ID cannot be null");
        }
        User buyer = getCurrentUser(auth);
        MarketplaceListing listing = marketplaceService.getListingById(id)
                .orElseThrow(() -> new RuntimeException("Listing not found"));

        if (listing.getQuantity() < quantity) {
            redirectAttributes.addFlashAttribute("errorMessage", "Insufficient stock available.");
            return "redirect:/buyer/marketplace";
        }

        Double totalAmount = listing.getPricePerUnit() * quantity;
        Double commission = totalAmount * 0.02; // 2% platform fee

        // Deduct from inventory
        marketplaceService.deductStock(id, quantity);

        // Create Transaction (Order)
        Transaction transaction = new Transaction(listing, listing.getFarmer(), buyer, totalAmount, commission,
                quantity);
        transaction.setShippingAddress(shippingAddress);
        transaction.setPaymentMethod(paymentMethod);
        transaction.setOrderStatus(Transaction.OrderStatus.PENDING);

        if ("COD".equals(paymentMethod)) {
            transaction.setStatus(Transaction.Status.PENDING); // Buyer will pay later
            redirectAttributes.addFlashAttribute("successMessage",
                    "Order placed successfully via Cash on Delivery! Please keep ₹" + totalAmount
                            + " ready for delivery.");
        } else {
            transaction.setStatus(Transaction.Status.SUCCESS); // Simulated online payment success
            redirectAttributes.addFlashAttribute("successMessage",
                    "Payment confirmed via " + paymentMethod + "! Your order has been placed successfully.");
        }

        transactionService.saveTransaction(transaction);
        return "redirect:/buyer/orders";
    }

    @GetMapping("/orders")
    public String orders(Authentication auth, Model model) {
        User user = getCurrentUser(auth);
        model.addAttribute("user", user);
        List<Transaction> myOrders = transactionService.getAllTransactions().stream()
                .filter(t -> t.getBuyer() != null && t.getBuyer().getId().equals(user.getId()))
                .sorted((t1, t2) -> t2.getTimestamp().compareTo(t1.getTimestamp()))
                .toList();
        model.addAttribute("orders", myOrders);
        return "buyer/orders";
    }

    @PostMapping("/orders/cancel/{id}")
    public String cancelOrder(@PathVariable Long id, Authentication auth, RedirectAttributes redirectAttributes) {
        User user = getCurrentUser(auth);
        Transaction transaction = transactionService.getTransactionById(id);

        if (!transaction.getBuyer().getId().equals(user.getId())) {
            throw new RuntimeException("Unauthorized");
        }

        try {
            transactionService.processCancellation(id);
            redirectAttributes.addFlashAttribute("successMessage", "Order cancelled and refund initiated.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", e.getMessage());
        }
        return "redirect:/buyer/orders";
    }

    @PostMapping("/orders/return/{id}")
    public String requestReturn(@PathVariable Long id, Authentication auth, RedirectAttributes redirectAttributes) {
        User user = getCurrentUser(auth);
        Transaction transaction = transactionService.getTransactionById(id);

        if (!transaction.getBuyer().getId().equals(user.getId())) {
            throw new RuntimeException("Unauthorized");
        }

        try {
            transactionService.processReturnRequest(id);
            redirectAttributes.addFlashAttribute("successMessage", "Return request submitted.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", e.getMessage());
        }
        return "redirect:/buyer/orders";
    }
}
