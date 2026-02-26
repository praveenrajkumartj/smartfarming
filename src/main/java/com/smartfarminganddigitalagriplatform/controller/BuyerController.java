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
        return "buyer/dashboard";
    }

    @GetMapping("/profile")
    public String profile(Authentication auth, Model model) {
        model.addAttribute("user", getCurrentUser(auth));
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
    public String marketplace(Model model,
            @RequestParam(required = false) String search) {
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
    public String contactFarmer(@PathVariable Long id, Model model) {
        MarketplaceListing listing = marketplaceService.getListingById(id)
                .orElseThrow(() -> new RuntimeException("Listing not found"));
        model.addAttribute("listing", listing);
        return "buyer/contact-farmer";
    }

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
        return "buyer/market-prices";
    }

    @GetMapping("/schemes")
    public String schemes(Model model,
            @RequestParam(required = false) String search) {
        if (search != null && !search.isEmpty()) {
            model.addAttribute("schemes", schemeService.searchByTitle(search));
        } else {
            model.addAttribute("schemes", schemeService.getActiveSchemes());
        }
        model.addAttribute("search", search);
        return "buyer/schemes";
    }
}
