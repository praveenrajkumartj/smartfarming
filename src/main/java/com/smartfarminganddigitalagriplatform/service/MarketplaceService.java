package com.smartfarminganddigitalagriplatform.service;

import com.smartfarminganddigitalagriplatform.entity.MarketplaceListing;
import com.smartfarminganddigitalagriplatform.entity.User;
import com.smartfarminganddigitalagriplatform.repository.MarketplaceListingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class MarketplaceService {

    @Autowired
    private MarketplaceListingRepository listingRepository;

    public List<MarketplaceListing> getAllListings() {
        return listingRepository.findAll();
    }

    public List<MarketplaceListing> getAvailableListings() {
        return listingRepository.findByStatusOrderByCreatedAtDesc(MarketplaceListing.Status.AVAILABLE);
    }

    public List<MarketplaceListing> getListingsByFarmer(@org.springframework.lang.NonNull User farmer) {
        return listingRepository.findByFarmer(farmer);
    }

    public List<MarketplaceListing> searchByCrop(@org.springframework.lang.NonNull String cropName) {
        return listingRepository.findByCropNameContainingIgnoreCase(cropName);
    }

    public MarketplaceListing saveListing(@org.springframework.lang.NonNull MarketplaceListing listing) {
        return listingRepository.save(listing);
    }

    public Optional<MarketplaceListing> getListingById(@org.springframework.lang.NonNull Long id) {
        return listingRepository.findById(id);
    }

    public void deleteListing(@org.springframework.lang.NonNull Long id) {
        listingRepository.deleteById(id);
    }

    public long getTotalListings() {
        return listingRepository.count();
    }
}
