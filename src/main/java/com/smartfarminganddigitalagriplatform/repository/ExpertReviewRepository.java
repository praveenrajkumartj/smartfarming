package com.smartfarminganddigitalagriplatform.repository;

import com.smartfarminganddigitalagriplatform.entity.ExpertReview;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ExpertReviewRepository extends JpaRepository<ExpertReview, Long> {
    List<ExpertReview> findByExpertIdAndStatus(Long expertId, ExpertReview.ReviewStatus status);

    @Query("SELECT AVG(r.rating) FROM ExpertReview r WHERE r.expert.id = :expertId AND r.status = 'ACTIVE'")
    Double getAverageRating(Long expertId);

    long countByExpertIdAndStatus(Long expertId, ExpertReview.ReviewStatus status);

    boolean existsByReviewerIdAndExpertId(Long reviewerId, Long expertId);
}
