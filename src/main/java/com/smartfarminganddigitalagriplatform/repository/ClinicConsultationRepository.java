package com.smartfarminganddigitalagriplatform.repository;

import com.smartfarminganddigitalagriplatform.entity.ClinicConsultation;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ClinicConsultationRepository extends JpaRepository<ClinicConsultation, Long> {
    java.util.List<ClinicConsultation> findByFarmerId(Long farmerId);

    java.util.List<ClinicConsultation> findByExpertId(Long expertId);

    boolean existsByFarmerIdAndExpertIdAndStatus(Long farmerId, Long expertId, ClinicConsultation.Status status);
}
