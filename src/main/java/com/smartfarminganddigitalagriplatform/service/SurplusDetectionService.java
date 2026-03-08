package com.smartfarminganddigitalagriplatform.service;

import com.smartfarminganddigitalagriplatform.entity.MarketplaceListing;
import com.smartfarminganddigitalagriplatform.entity.User;
import com.smartfarminganddigitalagriplatform.repository.MarketplaceListingRepository;
import com.smartfarminganddigitalagriplatform.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

@Service
@SuppressWarnings("null")
public class SurplusDetectionService {

    @Autowired
    private MarketplaceListingRepository listingRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private NotificationService notificationService;

    // Run every day at midnight (or every 1 minute for demo purposes)
    // Here we use fixedRate = 60000 (1 minute) so the user can easily observe the
    // background job running
    @Scheduled(fixedRate = 60000)
    @Transactional
    public void detectAndProcessSurplus() {
        System.out.println("Running Smart Surplus Detection Job...");

        // Let's define "unsold" as: status = AVAILABLE, created more than 3 days ago
        // For demonstration, let's say 2 minutes ago so it runs easily
        LocalDateTime thresholdDate = LocalDateTime.now().minusMinutes(2);

        List<MarketplaceListing> unsoldListings = listingRepository
                .findByStatusAndCreatedAtBefore(MarketplaceListing.Status.AVAILABLE, thresholdDate);

        List<User> b2bBuyers = userRepository.findByRole(User.Role.B2B_BUYER);

        for (MarketplaceListing listing : unsoldListings) {
            if (!listing.isSurplus()) {
                listing.setSurplus(true);
                // Apply a 30% discount as default clearance price
                listing.setClearancePrice(listing.getPricePerUnit() * 0.70);
                listingRepository.save(listing);

                // Notify B2B Buyers
                for (User buyer : b2bBuyers) {
                    notificationService.sendNotification(
                            buyer,
                            "🚨 Surplus Inventory Alert!",
                            String.format("Bulk surplus available: %s. Discounted clearance price: ₹%.2f. Location: %s",
                                    listing.getCropName(), listing.getClearancePrice(), listing.getLocation()),
                            "SURPLUS_ALERT");
                }
                System.out.println("Marked listing " + listing.getId() + " as Surplus & notified B2B buyers.");
            }
        }
    }
}
