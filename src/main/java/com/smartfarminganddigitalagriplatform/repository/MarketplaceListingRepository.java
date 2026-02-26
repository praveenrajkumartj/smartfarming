package com.smartfarminganddigitalagriplatform.repository;

import com.smartfarminganddigitalagriplatform.entity.MarketplaceListing;
import com.smartfarminganddigitalagriplatform.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface MarketplaceListingRepository extends JpaRepository<MarketplaceListing, Long> {
    List<MarketplaceListing> findByFarmer(User farmer);

    List<MarketplaceListing> findByStatus(MarketplaceListing.Status status);

    List<MarketplaceListing> findByCropNameContainingIgnoreCase(String cropName);

    List<MarketplaceListing> findByStatusOrderByCreatedAtDesc(MarketplaceListing.Status status);
}
