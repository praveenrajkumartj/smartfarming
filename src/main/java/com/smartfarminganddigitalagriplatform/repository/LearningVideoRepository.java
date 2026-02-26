package com.smartfarminganddigitalagriplatform.repository;

import com.smartfarminganddigitalagriplatform.entity.LearningVideo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LearningVideoRepository extends JpaRepository<LearningVideo, Long> {
}
