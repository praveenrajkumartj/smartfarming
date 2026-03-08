package com.smartfarminganddigitalagriplatform.controller;

import com.smartfarminganddigitalagriplatform.entity.*;
import com.smartfarminganddigitalagriplatform.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/admin/reviews")
public class AdminReviewController {

    @Autowired
    private ReviewService reviewService;

    @Autowired
    private UserService userService;

    @ModelAttribute
    public void addAttributes(Model model, Authentication auth) {
        if (auth != null && auth.isAuthenticated()) {
            User admin = userService.findByEmail(auth.getName()).orElse(null);
            model.addAttribute("admin", admin);
            model.addAttribute("user", admin);
        }
    }

    @GetMapping
    public String viewAllReviews(Model model) {
        model.addAttribute("productReviews", reviewService.getAllProductReviews());
        model.addAttribute("mentorReviews", reviewService.getAllMentorReviews());
        model.addAttribute("expertReviews", reviewService.getAllExpertReviews());
        return "admin/reviews";
    }

    @PostMapping("/product/hide/{id}")
    public String hideProductReview(@PathVariable Long id, RedirectAttributes ra) {
        reviewService.updateProductReviewStatus(id, ProductReview.ReviewStatus.HIDDEN);
        ra.addFlashAttribute("successMessage", "Product review hidden!");
        return "redirect:/admin/reviews";
    }

    @PostMapping("/product/show/{id}")
    public String showProductReview(@PathVariable Long id, RedirectAttributes ra) {
        reviewService.updateProductReviewStatus(id, ProductReview.ReviewStatus.ACTIVE);
        ra.addFlashAttribute("successMessage", "Product review activated!");
        return "redirect:/admin/reviews";
    }

    @PostMapping("/product/delete/{id}")
    public String deleteProductReview(@PathVariable Long id, RedirectAttributes ra) {
        reviewService.deleteProductReview(id);
        ra.addFlashAttribute("successMessage", "Product review deleted!");
        return "redirect:/admin/reviews";
    }

    @PostMapping("/mentor/hide/{id}")
    public String hideMentorReview(@PathVariable Long id, RedirectAttributes ra) {
        reviewService.updateMentorReviewStatus(id, MentorReview.ReviewStatus.HIDDEN);
        ra.addFlashAttribute("successMessage", "Mentor review hidden!");
        return "redirect:/admin/reviews";
    }

    @PostMapping("/mentor/show/{id}")
    public String showMentorReview(@PathVariable Long id, RedirectAttributes ra) {
        reviewService.updateMentorReviewStatus(id, MentorReview.ReviewStatus.ACTIVE);
        ra.addFlashAttribute("successMessage", "Mentor review activated!");
        return "redirect:/admin/reviews";
    }

    @PostMapping("/mentor/delete/{id}")
    public String deleteMentorReview(@PathVariable Long id, RedirectAttributes ra) {
        reviewService.deleteMentorReview(id);
        ra.addFlashAttribute("successMessage", "Mentor review deleted!");
        return "redirect:/admin/reviews";
    }

    @PostMapping("/expert/hide/{id}")
    public String hideExpertReview(@PathVariable Long id, RedirectAttributes ra) {
        reviewService.updateExpertReviewStatus(id, ExpertReview.ReviewStatus.HIDDEN);
        ra.addFlashAttribute("successMessage", "Expert review hidden!");
        return "redirect:/admin/reviews";
    }

    @PostMapping("/expert/show/{id}")
    public String showExpertReview(@PathVariable Long id, RedirectAttributes ra) {
        reviewService.updateExpertReviewStatus(id, ExpertReview.ReviewStatus.ACTIVE);
        ra.addFlashAttribute("successMessage", "Expert review activated!");
        return "redirect:/admin/reviews";
    }

    @PostMapping("/expert/delete/{id}")
    public String deleteExpertReview(@PathVariable Long id, RedirectAttributes ra) {
        reviewService.deleteExpertReview(id);
        ra.addFlashAttribute("successMessage", "Expert review deleted!");
        return "redirect:/admin/reviews";
    }
}
