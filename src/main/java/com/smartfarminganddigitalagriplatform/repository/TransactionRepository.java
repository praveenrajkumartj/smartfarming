package com.smartfarminganddigitalagriplatform.repository;

import com.smartfarminganddigitalagriplatform.entity.Transaction;
import com.smartfarminganddigitalagriplatform.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

import java.util.Optional;
import com.smartfarminganddigitalagriplatform.entity.Consultation;

@Repository
public interface TransactionRepository extends JpaRepository<Transaction, Long> {
    List<Transaction> findByFarmerOrderByTimestampDesc(User farmer);

    List<Transaction> findByFarmerAndListingIsNotNullOrderByTimestampDesc(User farmer);

    @Query("SELECT SUM(t.finalEarnings) FROM Transaction t WHERE t.farmer = :farmer AND t.status = 'SUCCESS'")
    Double getTotalEarnings(@Param("farmer") User farmer);

    @Query("SELECT t.timestamp, SUM(t.finalEarnings) FROM Transaction t WHERE t.farmer = :farmer AND t.status = 'SUCCESS' GROUP BY t.timestamp ORDER BY t.timestamp ASC")
    List<Object[]> getEarningsOverTime(@Param("farmer") User farmer);

    List<Transaction> findByFarmerId(Long farmerId);

    List<Transaction> findByIsSuspiciousTrue();

    List<Transaction> findByListing(com.smartfarminganddigitalagriplatform.entity.MarketplaceListing listing);

    List<Transaction> findByBuyerOrderByTimestampDesc(User buyer);

    Optional<Transaction> findByConsultation(Consultation consultation);

    long countByIsSuspiciousTrue();

    boolean existsByBuyerIdAndListingIdAndStatus(Long buyerId, Long listingId, Transaction.Status status);
}
