package com.smartfarminganddigitalagriplatform.controller;

import com.smartfarminganddigitalagriplatform.entity.MarketplaceListing;
import com.smartfarminganddigitalagriplatform.entity.Transaction;
import com.smartfarminganddigitalagriplatform.entity.User;
import com.smartfarminganddigitalagriplatform.repository.MarketplaceListingRepository;
import com.smartfarminganddigitalagriplatform.repository.TransactionRepository;
import com.smartfarminganddigitalagriplatform.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.security.Principal;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/b2b")
@SuppressWarnings("null")
public class B2BController {

        @Autowired
        private MarketplaceListingRepository listingRepository;

        @Autowired
        private UserService userService;

        @Autowired
        private TransactionRepository transactionRepository;

        @Autowired
        private com.smartfarminganddigitalagriplatform.service.NotificationService notificationService;

        @GetMapping("/dashboard")
        public String dashboard(Model model, Principal principal) {
                User user = userService.findByEmail(principal.getName()).orElse(null);
                model.addAttribute("user", user);

                // Fetch surplus items available for clearance
                // Use true for isSurplus and AVAILABLE status
                List<MarketplaceListing> surplusListings = listingRepository.findByIsSurplusAndStatus(true,
                                MarketplaceListing.Status.AVAILABLE);
                model.addAttribute("surplusListings", surplusListings);

                return "b2b/dashboard";
        }

        @PostMapping("/purchase/{listingId}")
        public String purchaseSurplus(@PathVariable Long listingId,
                        @RequestParam String shippingAddress,
                        @RequestParam String paymentMethod,
                        Principal principal, Model model) {
                Optional<MarketplaceListing> listingOpt = listingRepository.findById(listingId);
                User buyer = userService.findByEmail(principal.getName()).orElse(null);

                if (listingOpt.isPresent() && buyer != null) {
                        MarketplaceListing listing = listingOpt.get();
                        if (listing.isSurplus() && listing.getStatus() == MarketplaceListing.Status.AVAILABLE) {
                                // Determine transaction total amount from clearance price and quantity
                                Double totalCost = listing.getClearancePrice() * listing.getQuantity();

                                // Simple platform fee for bulk deals (e.g. 5%)
                                Double commission = totalCost * 0.05;

                                // Keep it simple and assume success payment
                                Transaction transaction = new Transaction(listing, listing.getFarmer(), buyer,
                                                totalCost, commission,
                                                listing.getQuantity());
                                transaction.setShippingAddress(shippingAddress);
                                transaction.setPaymentMethod(paymentMethod);
                                transaction.setStatus(Transaction.Status.SUCCESS);
                                transactionRepository.save(transaction);

                                // Update Listing Status
                                listing.setStatus(MarketplaceListing.Status.SOLD);
                                listingRepository.save(listing);

                                // Payment Confirmation & Booking completion alerts
                                notificationService.sendNotification(
                                                buyer, "Bulk Deal Confirmation",
                                                "Your B2B payment of ₹" + totalCost + " for "
                                                                + listing.getQuantity() + "kg " + listing.getCropName()
                                                                + " has been processed.",
                                                "PAYMENT_SUCCESS");
                                notificationService.sendNotification(
                                                listing.getFarmer(), "Surplus Stock Sold!",
                                                "B2B Buyer " + buyer.getFullName()
                                                                + " has bought your surplus stock of "
                                                                + listing.getCropName() + ".",
                                                "PAYMENT_SUCCESS");

                                return "redirect:/b2b/dashboard?success=1";
                        }
                }
                return "redirect:/b2b/dashboard?error=1";
        }
}
