package com.smartfarminganddigitalagriplatform.repository;

import com.smartfarminganddigitalagriplatform.entity.ClinicExpert;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ClinicExpertRepository extends JpaRepository<ClinicExpert, Long> {
    ClinicExpert findByUserId(Long userId);

    java.util.List<ClinicExpert> findByIsApprovedTrue();

    java.util.List<ClinicExpert> findByIsApprovedFalse();
}
