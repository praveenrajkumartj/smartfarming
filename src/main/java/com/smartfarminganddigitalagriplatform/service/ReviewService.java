package com.smartfarminganddigitalagriplatform.service;

import com.smartfarminganddigitalagriplatform.entity.*;
import com.smartfarminganddigitalagriplatform.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@SuppressWarnings("null")
public class ReviewService {

    @Autowired
    private ProductReviewRepository productReviewRepository;

    @Autowired
    private MentorReviewRepository mentorReviewRepository;

    @Autowired
    private ExpertReviewRepository expertReviewRepository;

    @Autowired
    private TransactionRepository transactionRepository;

    @Autowired
    private ConsultationRepository consultationRepository;

    @Autowired
    private ClinicConsultationRepository clinicConsultationRepository;

    @Autowired
    private MentorRepository mentorRepository;

    @Autowired
    private ClinicExpertRepository clinicExpertRepository;

    // --- Product Reviews ---

    @Transactional
    public ProductReview addProductReview(User reviewer, MarketplaceListing product, Integer rating, String comment) {
        if (productReviewRepository.existsByReviewerIdAndProductId(reviewer.getId(), product.getId())) {
            throw new RuntimeException("You have already reviewed this product.");
        }

        if (!transactionRepository.existsByBuyerIdAndListingIdAndStatus(reviewer.getId(), product.getId(),
                Transaction.Status.SUCCESS)) {
            throw new RuntimeException("Only users who purchased the product can review it.");
        }

        ProductReview review = new ProductReview();
        review.setReviewer(reviewer);
        review.setProduct(product);
        review.setRating(rating);
        review.setComment(comment);
        return productReviewRepository.save(review);
    }

    public List<ProductReview> getProductReviews(Long productId) {
        return productReviewRepository.findByProductIdAndStatus(productId, ProductReview.ReviewStatus.ACTIVE);
    }

    public Double getAverageProductRating(Long productId) {
        Double avg = productReviewRepository.getAverageRating(productId);
        return avg != null ? avg : 0.0;
    }

    public long getTotalProductReviews(Long productId) {
        return productReviewRepository.countByProductIdAndStatus(productId, ProductReview.ReviewStatus.ACTIVE);
    }

    public List<ProductReview> getProductReviewsForFarmer(User farmer) {
        return productReviewRepository.findByProductFarmerOrderByTimestampDesc(farmer);
    }

    // --- Mentor Reviews ---

    @Transactional
    public MentorReview addMentorReview(User reviewer, Mentor mentor, Integer rating, String feedback) {
        if (mentorReviewRepository.existsByReviewerIdAndMentorId(reviewer.getId(), mentor.getId())) {
            throw new RuntimeException("You have already reviewed this mentor.");
        }

        if (!consultationRepository.existsByFarmerIdAndMentorIdAndStatus(reviewer.getId(), mentor.getId(),
                Consultation.Status.COMPLETED)) {
            throw new RuntimeException("Only users who attended a session can rate the mentor.");
        }

        MentorReview review = new MentorReview();
        review.setReviewer(reviewer);
        review.setMentor(mentor);
        review.setRating(rating);
        review.setFeedback(feedback);
        MentorReview savedReview = mentorReviewRepository.save(review);

        // Update Mentor Rating
        updateMentorRating(mentor.getId());

        return savedReview;
    }

    private void updateMentorRating(Long mentorId) {
        Mentor mentor = mentorRepository.findById(mentorId).orElseThrow();
        Double avgRating = mentorReviewRepository.getAverageRating(mentorId);
        long count = mentorReviewRepository.countByMentorIdAndStatus(mentorId, MentorReview.ReviewStatus.ACTIVE);
        mentor.setRating(avgRating != null ? avgRating : 0.0);
        mentor.setTotalReviews((int) count);
        mentorRepository.save(mentor);
    }

    public List<MentorReview> getMentorReviews(Long mentorId) {
        return mentorReviewRepository.findByMentorIdAndStatus(mentorId, MentorReview.ReviewStatus.ACTIVE);
    }

    // --- Expert Reviews ---

    @Transactional
    public ExpertReview addExpertReview(User reviewer, ClinicExpert expert, Integer rating, String feedback) {
        if (expertReviewRepository.existsByReviewerIdAndExpertId(reviewer.getId(), expert.getId())) {
            throw new RuntimeException("You have already reviewed this expert.");
        }

        if (!clinicConsultationRepository.existsByFarmerIdAndExpertIdAndStatus(reviewer.getId(), expert.getId(),
                ClinicConsultation.Status.COMPLETED)) {
            throw new RuntimeException("Only users who completed a consultation can rate the expert.");
        }

        ExpertReview review = new ExpertReview();
        review.setReviewer(reviewer);
        review.setExpert(expert);
        review.setRating(rating);
        review.setFeedback(feedback);
        ExpertReview savedReview = expertReviewRepository.save(review);

        // Update Expert Rating
        updateExpertRating(expert.getId());

        return savedReview;
    }

    private void updateExpertRating(Long expertId) {
        ClinicExpert expert = clinicExpertRepository.findById(expertId).orElseThrow();
        Double avgRating = expertReviewRepository.getAverageRating(expertId);
        long count = expertReviewRepository.countByExpertIdAndStatus(expertId, ExpertReview.ReviewStatus.ACTIVE);
        expert.setRating(avgRating != null ? avgRating : 0.0);
        expert.setTotalReviews((int) count);
        clinicExpertRepository.save(expert);
    }

    public List<ExpertReview> getExpertReviews(Long expertId) {
        return expertReviewRepository.findByExpertIdAndStatus(expertId, ExpertReview.ReviewStatus.ACTIVE);
    }

    // --- Admin Functions ---

    public List<ProductReview> getAllProductReviews() {
        return productReviewRepository.findAll();
    }

    public List<MentorReview> getAllMentorReviews() {
        return mentorReviewRepository.findAll();
    }

    public List<ExpertReview> getAllExpertReviews() {
        return expertReviewRepository.findAll();
    }

    @Transactional
    public void updateProductReviewStatus(Long reviewId, ProductReview.ReviewStatus status) {
        ProductReview review = productReviewRepository.findById(reviewId).orElseThrow();
        review.setStatus(status);
        productReviewRepository.save(review);
    }

    @Transactional
    public void updateMentorReviewStatus(Long reviewId, MentorReview.ReviewStatus status) {
        MentorReview review = mentorReviewRepository.findById(reviewId).orElseThrow();
        review.setStatus(status);
        mentorReviewRepository.save(review);
        updateMentorRating(review.getMentor().getId());
    }

    @Transactional
    public void updateExpertReviewStatus(Long reviewId, ExpertReview.ReviewStatus status) {
        ExpertReview review = expertReviewRepository.findById(reviewId).orElseThrow();
        review.setStatus(status);
        expertReviewRepository.save(review);
        updateExpertRating(review.getExpert().getId());
    }

    @Transactional
    public void deleteProductReview(Long reviewId) {
        productReviewRepository.deleteById(reviewId);
    }

    @Transactional
    public void deleteMentorReview(Long reviewId) {
        MentorReview review = mentorReviewRepository.findById(reviewId).orElseThrow();
        Long mentorId = review.getMentor().getId();
        mentorReviewRepository.deleteById(reviewId);
        updateMentorRating(mentorId);
    }

    @Transactional
    public void deleteExpertReview(Long reviewId) {
        ExpertReview review = expertReviewRepository.findById(reviewId).orElseThrow();
        Long expertId = review.getExpert().getId();
        expertReviewRepository.deleteById(reviewId);
        updateExpertRating(expertId);
    }
}
