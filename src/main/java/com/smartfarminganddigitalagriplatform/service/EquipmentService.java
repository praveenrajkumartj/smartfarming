package com.smartfarminganddigitalagriplatform.service;

import com.smartfarminganddigitalagriplatform.entity.Equipment;
import com.smartfarminganddigitalagriplatform.entity.User;
import com.smartfarminganddigitalagriplatform.repository.EquipmentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smartfarminganddigitalagriplatform.entity.EquipmentRental;
import com.smartfarminganddigitalagriplatform.repository.EquipmentRentalRepository;
import java.util.List;
import java.time.LocalDateTime;

@Service
public class EquipmentService {

    @Autowired
    private EquipmentRepository equipmentRepository;

    @Autowired
    private EquipmentRentalRepository rentalRepository;

    @Autowired
    private NotificationService notificationService;

    public List<Equipment> getEquipmentByOwner(User owner) {
        return equipmentRepository.findByOwner(owner);
    }

    public Equipment getEquipmentById(@org.springframework.lang.NonNull Long id) {
        return equipmentRepository.findById(id).orElseThrow(() -> new RuntimeException("Equipment not found"));
    }

    public List<Equipment> getAvailableEquipmentExceptOwner(User user) {
        return equipmentRepository.findByIsAvailableTrueAndIsApprovedTrueAndOwnerNot(user);
    }

    public List<Equipment> getFilteredEquipment(String type, String state, User user) {
        if (type != null && !type.isEmpty() && state != null && !state.isEmpty()) {
            return equipmentRepository
                    .findByTypeAndStateContainingIgnoreCaseAndIsAvailableTrueAndIsApprovedTrueAndOwnerNot(type,
                            state, user);
        } else if (type != null && !type.isEmpty()) {
            return equipmentRepository.findByTypeAndIsAvailableTrueAndIsApprovedTrueAndOwnerNot(type, user);
        } else if (state != null && !state.isEmpty()) {
            return equipmentRepository
                    .findByStateContainingIgnoreCaseAndIsAvailableTrueAndIsApprovedTrueAndOwnerNot(state, user);
        }
        return getAvailableEquipmentExceptOwner(user);
    }

    public void saveEquipment(Equipment equipment) {
        equipmentRepository.save(equipment);
    }

    public List<Equipment> getPendingApprovals() {
        return equipmentRepository.findByIsApprovedFalse();
    }

    public void approveEquipment(Long id) {
        Equipment equipment = equipmentRepository.findById(id).orElseThrow();
        equipment.setApproved(true);
        equipmentRepository.save(equipment);

        notificationService.sendNotification(equipment.getOwner(), "Equipment Approved",
                "Your equipment '" + equipment.getName() + "' has been approved by admin.", "RENTAL");
    }

    public void rentEquipment(User renter, Long equipmentId, LocalDateTime start, LocalDateTime end) {
        Equipment equipment = equipmentRepository.findById(equipmentId).orElseThrow();

        // Basic double booking check - look for approved bookings that overlap
        boolean isBooked = rentalRepository.findByEquipment(equipment).stream()
                .anyMatch(r -> (r.getStatus() == EquipmentRental.Status.APPROVED
                        || r.getStatus() == EquipmentRental.Status.ONGOING) &&
                        !(end.isBefore(r.getStartTime()) || start.isAfter(r.getEndTime())));

        if (isBooked) {
            throw new RuntimeException("Equipment is already reserved for these dates.");
        }

        long days = java.time.Duration.between(start, end).toDays();
        if (days < 1)
            days = 1; // Minimum 1 day charge

        EquipmentRental rental = new EquipmentRental(equipment, renter, start, end,
                equipment.getRentalRatePerDay() * days);
        rentalRepository.save(rental);

        notificationService.sendNotification(equipment.getOwner(), "New Rental Request",
                "Rental request for '" + equipment.getName() + "' from " + renter.getFullName(), "RENTAL");
    }

    public void rateEquipment(Long rentalId, int rating, String review) {
        EquipmentRental rental = rentalRepository.findById(rentalId).orElseThrow();
        rental.setRating(rating);
        rental.setReview(review);
        rentalRepository.save(rental);

        Equipment equipment = rental.getEquipment();
        double currentAvg = equipment.getAverageRating() != null ? equipment.getAverageRating() : 0.0;
        int currentTotal = equipment.getTotalRatings() != null ? equipment.getTotalRatings() : 0;

        double totalScore = currentAvg * currentTotal;
        equipment.setTotalRatings(currentTotal + 1);
        equipment.setAverageRating((totalScore + rating) / (currentTotal + 1));
        equipmentRepository.save(equipment);
    }

    public List<EquipmentRental> getRentalsByRenter(User renter) {
        return rentalRepository.findByRenter(renter);
    }

    public List<EquipmentRental> getRentalsByOwner(User owner) {
        return rentalRepository.findByEquipmentOwner(owner);
    }

    public void updateRentalStatus(Long rentalId, EquipmentRental.Status status) {
        EquipmentRental rental = rentalRepository.findById(rentalId).orElseThrow();
        rental.setStatus(status);
        if (status == EquipmentRental.Status.APPROVED) {
            rental.getEquipment().setAvailable(false);
            equipmentRepository.save(rental.getEquipment());
        } else if (status == EquipmentRental.Status.COMPLETED || status == EquipmentRental.Status.CANCELLED) {
            rental.getEquipment().setAvailable(true);
            equipmentRepository.save(rental.getEquipment());
        }
        rentalRepository.save(rental);

        notificationService.sendNotification(rental.getRenter(), "Rental Status Updated",
                "Your rental for '" + rental.getEquipment().getName() + "' is now " + status, "RENTAL");
    }

    public List<EquipmentRental> getAllRentals() {
        return rentalRepository.findAll();
    }
}
