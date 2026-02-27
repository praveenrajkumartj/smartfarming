package com.smartfarminganddigitalagriplatform.service;

import com.smartfarminganddigitalagriplatform.entity.Crop;
import com.smartfarminganddigitalagriplatform.repository.CropRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class CropService {

    @Autowired
    private CropRepository cropRepository;

    public List<Crop> getAllCrops() {
        return cropRepository.findAll();
    }

    public Optional<Crop> getCropById(@org.springframework.lang.NonNull Long id) {
        return cropRepository.findById(id);
    }

    public List<Crop> getCropsBySeason(String season) {
        return cropRepository.findBySeason(season);
    }

    public List<Crop> getCropsBySoilType(String soilType) {
        return cropRepository.findBySoilType(soilType);
    }

    public List<Crop> getCropsBySeasonAndSoil(String season, String soilType) {
        if (season != null && !season.isEmpty() && soilType != null && !soilType.isEmpty()) {
            return cropRepository.findBySeasonAndSoilType(season, soilType);
        } else if (season != null && !season.isEmpty()) {
            return cropRepository.findBySeason(season);
        } else if (soilType != null && !soilType.isEmpty()) {
            return cropRepository.findBySoilType(soilType);
        }
        return cropRepository.findAll();
    }

    public Crop saveCrop(@org.springframework.lang.NonNull Crop crop) {
        return cropRepository.save(crop);
    }

    public void deleteCrop(@org.springframework.lang.NonNull Long id) {
        cropRepository.deleteById(id);
    }

    public long getTotalCrops() {
        return cropRepository.count();
    }
}
