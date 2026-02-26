package com.smartfarminganddigitalagriplatform.repository;

import com.smartfarminganddigitalagriplatform.entity.GovernmentScheme;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface GovernmentSchemeRepository extends JpaRepository<GovernmentScheme, Long> {
    List<GovernmentScheme> findByActiveTrue();

    List<GovernmentScheme> findByCategory(String category);

    List<GovernmentScheme> findByTitleContainingIgnoreCase(String title);
}
