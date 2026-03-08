package com.smartfarminganddigitalagriplatform.controller;

import com.smartfarminganddigitalagriplatform.entity.*;
import com.smartfarminganddigitalagriplatform.service.*;
import com.smartfarminganddigitalagriplatform.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/reviews")
@SuppressWarnings("null")
public class ReviewRestController {

    @Autowired
    private ReviewService reviewService;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private MarketplaceListingRepository marketplaceListingRepository;

    @Autowired
    private MentorRepository mentorRepository;

    @Autowired
    private ClinicExpertRepository clinicExpertRepository;

    private User getAuthenticatedUser(Authentication authentication) {
        if (authentication == null)
            return null;
        return userRepository.findByEmail(authentication.getName()).orElse(null);
    }

    // --- Product Reviews ---

    @PostMapping("/product/{productId}")
    public ResponseEntity<?> addProductReview(@PathVariable Long productId,
            @RequestBody Map<String, Object> payload,
            Authentication authentication) {
        User user = getAuthenticatedUser(authentication);
        if (user == null)
            return ResponseEntity.status(401).body("Unauthorized");

        MarketplaceListing product = marketplaceListingRepository.findById(productId).orElse(null);
        if (product == null)
            return ResponseEntity.badRequest().body("Product not found");

        try {
            Integer rating = Integer.parseInt(payload.get("rating").toString());
            String comment = payload.get("comment").toString();
            ProductReview review = reviewService.addProductReview(user, product, rating, comment);
            return ResponseEntity.ok(review);
        } catch (Exception e) {
            Map<String, String> error = new HashMap<>();
            error.put("message", e.getMessage());
            return ResponseEntity.badRequest().body(error);
        }
    }

    @GetMapping("/product/{productId}")
    public ResponseEntity<?> getProductReviews(@PathVariable Long productId) {
        Map<String, Object> response = new HashMap<>();
        response.put("reviews", reviewService.getProductReviews(productId));
        response.put("averageRating", reviewService.getAverageProductRating(productId));
        response.put("totalReviews", reviewService.getTotalProductReviews(productId));
        return ResponseEntity.ok(response);
    }

    // --- Mentor Reviews ---

    @PostMapping("/mentor/{mentorId}")
    public ResponseEntity<?> addMentorReview(@PathVariable Long mentorId,
            @RequestBody Map<String, Object> payload,
            Authentication authentication) {
        User user = getAuthenticatedUser(authentication);
        if (user == null)
            return ResponseEntity.status(401).body("Unauthorized");

        Mentor mentor = mentorRepository.findById(mentorId).orElse(null);
        if (mentor == null)
            return ResponseEntity.badRequest().body("Mentor not found");

        try {
            Integer rating = Integer.parseInt(payload.get("rating").toString());
            String feedback = payload.get("feedback").toString();
            MentorReview review = reviewService.addMentorReview(user, mentor, rating, feedback);
            return ResponseEntity.ok(review);
        } catch (Exception e) {
            Map<String, String> error = new HashMap<>();
            error.put("message", e.getMessage());
            return ResponseEntity.badRequest().body(error);
        }
    }

    @GetMapping("/mentor/{mentorId}")
    public ResponseEntity<?> getMentorReviews(@PathVariable Long mentorId) {
        return ResponseEntity.ok(reviewService.getMentorReviews(mentorId));
    }

    // --- Expert Reviews ---

    @PostMapping("/expert/{expertId}")
    public ResponseEntity<?> addExpertReview(@PathVariable Long expertId,
            @RequestBody Map<String, Object> payload,
            Authentication authentication) {
        User user = getAuthenticatedUser(authentication);
        if (user == null)
            return ResponseEntity.status(401).body("Unauthorized");

        ClinicExpert expert = clinicExpertRepository.findById(expertId).orElse(null);
        if (expert == null)
            return ResponseEntity.badRequest().body("Expert not found");

        try {
            Integer rating = Integer.parseInt(payload.get("rating").toString());
            String feedback = payload.get("feedback").toString();
            ExpertReview review = reviewService.addExpertReview(user, expert, rating, feedback);
            return ResponseEntity.ok(review);
        } catch (Exception e) {
            Map<String, String> error = new HashMap<>();
            error.put("message", e.getMessage());
            return ResponseEntity.badRequest().body(error);
        }
    }

    @GetMapping("/expert/{expertId}")
    public ResponseEntity<?> getExpertReviews(@PathVariable Long expertId) {
        return ResponseEntity.ok(reviewService.getExpertReviews(expertId));
    }
}
