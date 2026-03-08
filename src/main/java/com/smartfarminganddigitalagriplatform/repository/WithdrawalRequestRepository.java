package com.smartfarminganddigitalagriplatform.repository;

import com.smartfarminganddigitalagriplatform.entity.User;
import com.smartfarminganddigitalagriplatform.entity.WithdrawalRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface WithdrawalRequestRepository extends JpaRepository<WithdrawalRequest, Long> {
    List<WithdrawalRequest> findByFarmerOrderByRequestDateDesc(User farmer);

    List<WithdrawalRequest> findByStatusOrderByRequestDateAsc(WithdrawalRequest.Status status);
}
