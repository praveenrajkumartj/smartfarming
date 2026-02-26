package com.smartfarminganddigitalagriplatform.repository;

import com.smartfarminganddigitalagriplatform.entity.DiseaseQuery;
import com.smartfarminganddigitalagriplatform.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface DiseaseQueryRepository extends JpaRepository<DiseaseQuery, Long> {
    List<DiseaseQuery> findByUser(User user);

    List<DiseaseQuery> findByStatus(DiseaseQuery.Status status);

    List<DiseaseQuery> findByUserOrderByCreatedAtDesc(User user);

    long countByStatus(DiseaseQuery.Status status);
}
