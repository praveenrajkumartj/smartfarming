package com.smartfarminganddigitalagriplatform.service;

import com.smartfarminganddigitalagriplatform.entity.ClinicConsultation;
import com.smartfarminganddigitalagriplatform.entity.EquipmentRental;
import com.smartfarminganddigitalagriplatform.entity.MarketplaceListing;
import com.smartfarminganddigitalagriplatform.entity.Transaction;
import com.smartfarminganddigitalagriplatform.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AdminAnalyticsService {

        @Autowired
        private TransactionRepository transactionRepository;

        @Autowired
        private MarketplaceListingRepository marketplaceListingRepository;

        @Autowired
        private EquipmentRentalRepository equipmentRentalRepository;

        @Autowired
        private ClinicConsultationRepository clinicConsultationRepository;

        public Map<String, Object> getDashboardAnalytics() {
                Map<String, Object> analytics = new HashMap<>();

                // 1. Total Platform Revenue (All Success Transactions)
                List<Transaction> allTransactions = transactionRepository.findAll();
                double totalRevenue = allTransactions.stream()
                                .filter(t -> t.getStatus() == Transaction.Status.SUCCESS
                                                || t.getStatus() == Transaction.Status.WITHDRAWN)
                                .mapToDouble(Transaction::getAmount)
                                .sum();

                double totalCommissions = allTransactions.stream()
                                .filter(t -> t.getStatus() == Transaction.Status.SUCCESS
                                                || t.getStatus() == Transaction.Status.WITHDRAWN)
                                .mapToDouble(Transaction::getCommission)
                                .sum();

                analytics.put("totalRevenue", totalRevenue);
                analytics.put("totalCommissions", totalCommissions);

                // 2. Marketplace Conversion Rates
                List<MarketplaceListing> allListings = marketplaceListingRepository.findAll();
                long totalListings = allListings.size();
                long soldListings = allListings.stream()
                                .filter(l -> l.getStatus() == MarketplaceListing.Status.SOLD)
                                .count();

                double conversionRate = totalListings > 0 ? ((double) soldListings / totalListings) * 100 : 0.0;
                analytics.put("totalListings", totalListings);
                analytics.put("soldListings", soldListings);
                analytics.put("conversionRate", Math.round(conversionRate * 100.0) / 100.0);

                // 3. Equipment Utilization Metrics
                List<EquipmentRental> allRentals = equipmentRentalRepository.findAll();
                long successfulRentals = allRentals.stream()
                                .filter(r -> r.getStatus() == EquipmentRental.Status.COMPLETED)
                                .count();
                analytics.put("totalRentals", allRentals.size());
                analytics.put("successfulRentals", successfulRentals);

                // 4. Clinic Consultation Metrics
                List<ClinicConsultation> allConsultations = clinicConsultationRepository.findAll();
                long completedConsultations = allConsultations.stream()
                                .filter(c -> c.getStatus() == ClinicConsultation.Status.COMPLETED)
                                .count();
                analytics.put("totalConsultations", allConsultations.size());
                analytics.put("completedConsultations", completedConsultations);

                // 5. Demand vs Supply Analytics (Total Crops Quantity Available vs Sold)
                double totalSupply = allListings.stream()
                                .mapToDouble(MarketplaceListing::getQuantity)
                                .sum();
                double totalDemandSold = allListings.stream()
                                .filter(l -> l.getStatus() == MarketplaceListing.Status.SOLD)
                                .mapToDouble(MarketplaceListing::getQuantity)
                                .sum();
                analytics.put("totalSupplyQs", Math.round(totalSupply * 10.0) / 10.0);
                analytics.put("totalDemandQs", Math.round(totalDemandSold * 10.0) / 10.0);

                // 6. Region-Wise Crop Performance (Based on Listings origin state)
                Map<String, Long> regionalPerformance = new HashMap<>();
                for (MarketplaceListing l : allListings) {
                        if (l.getFarmer() != null && l.getFarmer().getState() != null) {
                                String state = l.getFarmer().getState();
                                regionalPerformance.put(state, regionalPerformance.getOrDefault(state, 0L) + 1);
                        }
                }
                analytics.put("regionalPerformance", regionalPerformance);

                // 7. Conversions (B2C vs B2B)
                long b2cTransactions = allTransactions.stream()
                                .filter(t -> t.getStatus() == Transaction.Status.SUCCESS
                                                || t.getStatus() == Transaction.Status.WITHDRAWN)
                                .filter(t -> t.getBuyer() != null && t.getBuyer()
                                                .getRole() == com.smartfarminganddigitalagriplatform.entity.User.Role.BUYER)
                                .count();
                long b2bTransactions = allTransactions.stream()
                                .filter(t -> t.getStatus() == Transaction.Status.SUCCESS
                                                || t.getStatus() == Transaction.Status.WITHDRAWN)
                                .filter(t -> t.getBuyer() != null && t.getBuyer()
                                                .getRole() == com.smartfarminganddigitalagriplatform.entity.User.Role.B2B_BUYER)
                                .count();
                analytics.put("b2cSalesCount", b2cTransactions);
                analytics.put("b2bSalesCount", b2bTransactions);

                // 8. Trust & Safety Metrics
                analytics.put("suspiciousListingsCount", marketplaceListingRepository.countByIsSuspiciousTrue());
                analytics.put("suspiciousTransactionsCount", transactionRepository.countByIsSuspiciousTrue());

                return analytics;
        }
}
