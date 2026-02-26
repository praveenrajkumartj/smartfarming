package com.smartfarminganddigitalagriplatform.repository;

import com.smartfarminganddigitalagriplatform.entity.MarketPrice;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface MarketPriceRepository extends JpaRepository<MarketPrice, Long> {
    List<MarketPrice> findByCropNameContainingIgnoreCase(String cropName);

    List<MarketPrice> findByState(String state);

    List<MarketPrice> findByStateAndDistrict(String state, String district);

    @Query("SELECT DISTINCT m.cropName FROM MarketPrice m ORDER BY m.cropName")
    List<String> findDistinctCropNames();

    @Query("SELECT DISTINCT m.state FROM MarketPrice m ORDER BY m.state")
    List<String> findDistinctStates();
}
