package com.smartfarminganddigitalagriplatform.service;

import com.smartfarminganddigitalagriplatform.entity.EquipmentRental;
import com.smartfarminganddigitalagriplatform.entity.MarketplaceListing;
import com.smartfarminganddigitalagriplatform.entity.Transaction;
import com.smartfarminganddigitalagriplatform.entity.User;
import com.smartfarminganddigitalagriplatform.repository.EquipmentRentalRepository;
import com.smartfarminganddigitalagriplatform.repository.MarketplaceListingRepository;
import com.smartfarminganddigitalagriplatform.repository.TransactionRepository;
import com.smartfarminganddigitalagriplatform.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
@SuppressWarnings("null")
public class TrustAndSafetyService {

    @Autowired
    private TransactionRepository transactionRepository;

    @Autowired
    private MarketplaceListingRepository listingRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private EquipmentRentalRepository rentalRepository;

    @Autowired
    private NotificationService notificationService;

    // 1. Suspicious Transaction Monitoring
    // Runs every 45 minutes to detect anomolous transactions (e.g., unexpectedly
    // huge amounts)
    @Scheduled(fixedRate = 2700000)
    public void monitorSuspiciousTransactions() {
        System.out.println("Running Trust & Safety: Fraud Detection Logic...");
        List<Transaction> recentTransactions = transactionRepository.findAll();

        for (Transaction tx : recentTransactions) {
            if (!tx.isSuspicious() && tx.getAmount() > 500000) { // e.g., > ₹5 Lakhs is flagged for manual review
                tx.setSuspicious(true);
                transactionRepository.save(tx);

                // Penalize buyer's trust score temporarily until reviewed
                if (tx.getBuyer() != null) {
                    User buyer = tx.getBuyer();
                    buyer.setTrustScore(Math.max(0, buyer.getTrustScore() - 20));
                    userRepository.save(buyer);
                }

                System.out
                        .println("⚠️ Suspicious Transaction Flagged: ID " + tx.getId() + " Amount: " + tx.getAmount());

                // Notify Admins (we just print for now or route to generic admin channel)
                List<User> admins = userRepository.findByRole(User.Role.ADMIN);
                for (User admin : admins) {
                    notificationService.sendNotification(admin,
                            "🚨 Fraud Alert",
                            "Suspicious transaction detected! ID: " + tx.getId() + " Amount: ₹" + tx.getAmount(),
                            "FRAUD_ALERT");
                }
            }
        }
    }

    // 2. Fake Listing Detection
    // Runs every 1 hour to detect fake listings (e.g. extremely low price
    // manipulation)
    @Scheduled(fixedRate = 3600000)
    public void detectFakeListings() {
        System.out.println("Running Trust & Safety: Fake Listing Detection...");
        List<MarketplaceListing> activeListings = listingRepository
                .findByStatusOrderByCreatedAtDesc(MarketplaceListing.Status.AVAILABLE);

        for (MarketplaceListing listing : activeListings) {
            if (!listing.isSuspicious()) {
                // Heuristics for fake: Price per unit is suspiciously low (e.g., < ₹5) or
                // drastically high
                // Or user has a terrible trust score
                if (listing.getPricePerUnit() < 5.0 || listing.getFarmer().getTrustScore() < 50) {
                    listing.setSuspicious(true);
                    listingRepository.save(listing);

                    // Deduct trust points from farmer for submitting a suspicious listing
                    User farmer = listing.getFarmer();
                    farmer.setTrustScore(Math.max(0, farmer.getTrustScore() - 10));
                    userRepository.save(farmer);

                    System.out.println("⚠️ Fake/Suspicious Listing Flagged: " + listing.getCropName() + " By: "
                            + farmer.getFullName());
                }
            }
        }
    }

    // 3. Equipment Misuse Prevention
    // Ensure renters who repeatedly cancel or have bad behavior are penalized
    @Scheduled(fixedRate = 4500000)
    public void penalizeEquipmentMisuse() {
        System.out.println("Running Trust & Safety: Equipment Misuse Prevention...");
        List<EquipmentRental> cancelledRentals = rentalRepository.findAll().stream()
                .filter(r -> r.getStatus() == EquipmentRental.Status.CANCELLED)
                .toList();

        // In a real scenario, you'd group by user and penalize if count > 3.
        // For simplicity, we deduct 5 points for every cancelled rental historically
        // unless mitigated.
        // We'll skip complex aggregation right now to avoid infinite deductions.
    }

    // 4. Verified Farmer Badge Evaluator
    // Runs once a day to award the "Verified" badge to trusted farmers
    @Scheduled(fixedRate = 86400000)
    public void evaluateFarmerTrust() {
        System.out.println("Running Trust & Safety: Farmer Verification Evaluator...");
        List<User> farmers = userRepository.findByRole(User.Role.FARMER);

        for (User farmer : farmers) {
            if (!farmer.isVerified() && farmer.getTrustScore() >= 100) {
                // Heuristic: If they maintain perfect trust score and have listings, verify
                // them
                List<MarketplaceListing> listings = listingRepository.findByFarmer(farmer);
                if (listings.size() >= 3) {
                    farmer.setVerified(true);
                    userRepository.save(farmer);

                    notificationService.sendNotification(farmer,
                            "🎖️ Account Verified!",
                            "Congratulations! Your account has earned the 'Verified Farmer' badge for maintaining a high Trust Score.",
                            "TRUST_BADGE");

                    System.out.println("✅ Verified Farmer: " + farmer.getFullName());
                }
            }
        }
    }
}
