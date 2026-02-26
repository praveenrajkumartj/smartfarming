package com.smartfarminganddigitalagriplatform.repository;

import com.smartfarminganddigitalagriplatform.entity.Crop;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface CropRepository extends JpaRepository<Crop, Long> {
    List<Crop> findBySeason(String season);

    List<Crop> findBySoilType(String soilType);

    List<Crop> findBySeasonAndSoilType(String season, String soilType);

    List<Crop> findByNameContainingIgnoreCase(String name);
}
