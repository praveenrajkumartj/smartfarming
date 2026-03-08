package com.smartfarminganddigitalagriplatform.repository;

import com.smartfarminganddigitalagriplatform.entity.MentorReview;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MentorReviewRepository extends JpaRepository<MentorReview, Long> {
    List<MentorReview> findByMentorIdAndStatus(Long mentorId, MentorReview.ReviewStatus status);

    @Query("SELECT AVG(r.rating) FROM MentorReview r WHERE r.mentor.id = :mentorId AND r.status = 'ACTIVE'")
    Double getAverageRating(Long mentorId);

    long countByMentorIdAndStatus(Long mentorId, MentorReview.ReviewStatus status);

    boolean existsByReviewerIdAndMentorId(Long reviewerId, Long mentorId);
}
