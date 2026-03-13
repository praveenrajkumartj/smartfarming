package com.smartfarminganddigitalagriplatform.repository;

import com.smartfarminganddigitalagriplatform.entity.ProductReview;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductReviewRepository extends JpaRepository<ProductReview, Long> {
    List<ProductReview> findByProductIdAndStatus(Long productId, ProductReview.ReviewStatus status);

    @Query("SELECT AVG(r.rating) FROM ProductReview r WHERE r.product.id = :productId AND r.status = 'ACTIVE'")
    Double getAverageRating(Long productId);

    long countByProductIdAndStatus(Long productId, ProductReview.ReviewStatus status);

    boolean existsByReviewerIdAndProductId(Long reviewerId, Long productId);

    boolean existsByTransactionId(Long transactionId);

    List<ProductReview> findByProductFarmerOrderByTimestampDesc(
            com.smartfarminganddigitalagriplatform.entity.User farmer);
}
