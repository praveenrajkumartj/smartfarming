package com.smartfarminganddigitalagriplatform.repository;

import com.smartfarminganddigitalagriplatform.entity.Consultation;
import com.smartfarminganddigitalagriplatform.entity.User;
import com.smartfarminganddigitalagriplatform.entity.Mentor;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface ConsultationRepository extends JpaRepository<Consultation, Long> {
    List<Consultation> findByFarmer(User farmer);

    List<Consultation> findByMentor(Mentor mentor);

    boolean existsByFarmerIdAndMentorIdAndStatus(Long farmerId, Long mentorId, Consultation.Status status);
}
