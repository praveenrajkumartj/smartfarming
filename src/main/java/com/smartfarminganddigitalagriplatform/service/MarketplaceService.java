package com.smartfarminganddigitalagriplatform.service;

import com.smartfarminganddigitalagriplatform.entity.MarketplaceListing;
import com.smartfarminganddigitalagriplatform.entity.User;
import com.smartfarminganddigitalagriplatform.entity.Transaction;
import com.smartfarminganddigitalagriplatform.repository.MarketplaceListingRepository;
import com.smartfarminganddigitalagriplatform.repository.TransactionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class MarketplaceService {

    @Autowired
    private MarketplaceListingRepository listingRepository;

    @Autowired
    private TransactionRepository transactionRepository; // Added TransactionRepository dependency

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
        MarketplaceListing listing = listingRepository.findById(id).orElse(null);
        if (listing != null) {
            // Nullify transaction references to prevent foreign key constraint violations
            List<Transaction> transactions = transactionRepository.findByListing(listing);
            for (Transaction t : transactions) {
                t.setListing(null);
                transactionRepository.save(t);
            }
            listingRepository.delete(listing);
        }
    }

    public MarketplaceListing updateInventory(@org.springframework.lang.NonNull Long listingId,
            @org.springframework.lang.NonNull Double newQuantity) {
        MarketplaceListing listing = listingRepository.findById(listingId)
                .orElseThrow(() -> new RuntimeException("Listing not found"));
        listing.setQuantity(newQuantity);
        if (newQuantity <= 0) {
            listing.setStatus(MarketplaceListing.Status.SOLD);
        } else {
            listing.setStatus(MarketplaceListing.Status.AVAILABLE);
        }
        return listingRepository.save(listing);
    }

    public synchronized MarketplaceListing deductStock(Long listingId,
            @org.springframework.lang.NonNull Double quantityToDeduct) {
        if (listingId == null) {
            throw new IllegalArgumentException("Listing ID cannot be null");
        }
        MarketplaceListing listing = listingRepository.findById(listingId)
                .orElseThrow(() -> new RuntimeException("Listing not found"));

        if (listing.getQuantity() < quantityToDeduct) {
            throw new RuntimeException("Insufficient stock available");
        }

        listing.setQuantity(listing.getQuantity() - quantityToDeduct);
        if (listing.getQuantity() <= 0) {
            listing.setStatus(MarketplaceListing.Status.SOLD);
        }
        return listingRepository.save(listing);
    }

    public long getTotalListings() {
        return listingRepository.count();
    }

    public List<MarketplaceListing> getSuspiciousListings() {
        return listingRepository.findByIsSuspiciousTrue();
    }
}
