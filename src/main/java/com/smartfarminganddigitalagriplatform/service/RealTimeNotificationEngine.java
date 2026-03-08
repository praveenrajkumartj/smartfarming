package com.smartfarminganddigitalagriplatform.service;

import com.smartfarminganddigitalagriplatform.entity.ClinicConsultation;
import com.smartfarminganddigitalagriplatform.entity.MarketPrice;
import com.smartfarminganddigitalagriplatform.entity.User;
import com.smartfarminganddigitalagriplatform.repository.ClinicConsultationRepository;
import com.smartfarminganddigitalagriplatform.repository.MarketPriceRepository;
import com.smartfarminganddigitalagriplatform.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Random;

@Service
@SuppressWarnings("null")
public class RealTimeNotificationEngine {

    @Autowired
    private NotificationService notificationService;

    @Autowired
    private MarketPriceRepository marketPriceRepository;

    @Autowired
    private ClinicConsultationRepository clinicConsultationRepository;

    @Autowired
    private UserRepository userRepository;

    // 1. Price drop alerts (Runs every hour - simulated here for demo to run
    // frequently)
    @Scheduled(fixedRate = 3600000)
    public void detectPriceDrops() {
        System.out.println("Running Real-time Price Drop Detection...");
        // Fetch all market prices, compare variations theoretically.
        // For demonstration logic, we pick a random crop and notify farmers in that
        // state.
        List<MarketPrice> prices = marketPriceRepository.findAll();
        if (!prices.isEmpty()) {
            MarketPrice target = prices.get(new Random().nextInt(prices.size()));

            // Assume the price dropped by 10%
            Double droppedPrice = target.getMinPrice() * 0.90;

            List<User> affectedFarmers = userRepository.findByRole(User.Role.FARMER).stream()
                    .filter(u -> target.getState().equalsIgnoreCase(u.getState()))
                    .toList();

            for (User farmer : affectedFarmers) {
                notificationService.sendNotification(
                        farmer,
                        "📉 Price Drop Alert: " + target.getCropName(),
                        String.format("Market prices for %s in %s have dropped to ₹%.2f. Consider holding stock.",
                                target.getCropName(), target.getState(), droppedPrice),
                        "PRICE_ALERT");
            }
        }
    }

    // 2. Weather alerts (Push notification based on severe conditions)
    @Scheduled(fixedRate = 7200000) // Runs every 2 hours
    public void pushWeatherAlerts() {
        System.out.println("Running Real-time Weather Alert Engine...");
        // Simulated severe weather condition for a specific region
        String[] severeStates = { "Maharashtra", "Punjab", "Karnataka" };
        String targetState = severeStates[new Random().nextInt(severeStates.length)];

        List<User> regionalFarmers = userRepository.findByRole(User.Role.FARMER).stream()
                .filter(u -> targetState.equalsIgnoreCase(u.getState()))
                .toList();

        for (User farmer : regionalFarmers) {
            notificationService.sendNotification(
                    farmer,
                    "⛈️ Severe Weather Warning",
                    "Heavy rainfall expected in " + targetState
                            + " over the next 24 hours. Protect your exposed crops.",
                    "WEATHER_ALERT");
        }
    }

    // 3. Consultation reminders
    @Scheduled(fixedRate = 1800000) // Runs every 30 minutes
    public void sendConsultationReminders() {
        System.out.println("Running Consultation Reminder Engine...");
        // Find consultations approaching in the next hour that are PENDING/SCHEDULED
        List<ClinicConsultation> consultations = clinicConsultationRepository.findAll().stream()
                .filter(c -> c.getStatus() == ClinicConsultation.Status.PENDING)
                .filter(c -> c.getSessionTime() != null)
                // Assuming sessionTime is fairly soon
                .toList();

        for (ClinicConsultation consultation : consultations) {
            // Notify Farmer
            notificationService.sendNotification(
                    consultation.getFarmer(),
                    "⏰ Consultation Reminder",
                    "You have an upcoming clinic session with Dr. " + consultation.getExpert().getUser().getFullName()
                            + " at "
                            + consultation.getSessionTime(),
                    "CLINIC_REMINDER");

            // Notify Expert
            notificationService.sendNotification(
                    consultation.getExpert().getUser(),
                    "👨‍🔬 Upcoming Session Alert",
                    "You have an upcoming consultation with Farmer " + consultation.getFarmer().getFullName() + " at "
                            + consultation.getSessionTime(),
                    "CLINIC_REMINDER");
        }
    }
}
