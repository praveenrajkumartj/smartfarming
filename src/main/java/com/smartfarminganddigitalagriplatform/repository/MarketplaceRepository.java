package com.smartfarminganddigitalagriplatform.repository;

import com.smartfarminganddigitalagriplatform.entity.MarketplaceListing;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MarketplaceRepository extends JpaRepository<MarketplaceListing, Long> {
    java.util.List<MarketplaceListing> findByFarmerId(Long farmerId);
}
