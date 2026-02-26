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

    public List<MarketplaceListing> getListingsByFarmer(User farmer) {
        return listingRepository.findByFarmer(farmer);
    }

    public List<MarketplaceListing> searchByCrop(String cropName) {
        return listingRepository.findByCropNameContainingIgnoreCase(cropName);
    }

    public MarketplaceListing saveListing(MarketplaceListing listing) {
        return listingRepository.save(listing);
    }

    public Optional<MarketplaceListing> getListingById(Long id) {
        return listingRepository.findById(id);
    }

    public void deleteListing(Long id) {
        listingRepository.deleteById(id);
    }

    public long getTotalListings() {
        return listingRepository.count();
    }
}
