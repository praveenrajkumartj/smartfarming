package com.smartfarminganddigitalagriplatform.service;

import com.smartfarminganddigitalagriplatform.entity.Mentor;
import com.smartfarminganddigitalagriplatform.entity.User;
import com.smartfarminganddigitalagriplatform.entity.Consultation;
import com.smartfarminganddigitalagriplatform.entity.Transaction;
import com.smartfarminganddigitalagriplatform.repository.MentorRepository;
import com.smartfarminganddigitalagriplatform.repository.ConsultationRepository;
import com.smartfarminganddigitalagriplatform.repository.TransactionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
public class MentorService {

    @Autowired
    private MentorRepository mentorRepository;

    @Autowired
    private ConsultationRepository consultationRepository;

    @Autowired
    private NotificationService notificationService;

    @Autowired
    private TransactionRepository transactionRepository;

    public List<Mentor> getAllAvailableMentors() {
        return mentorRepository.findByIsAvailableTrue();
    }

    public Optional<Mentor> getMentorByUser(User user) {
        return mentorRepository.findByUser(user);
    }

    public void saveMentor(Mentor mentor) {
        mentorRepository.save(mentor);
    }

    public void bookConsultation(User farmer, Long mentorId) {
        Mentor mentor = mentorRepository.findById(mentorId).orElseThrow();
        Consultation consultation = new Consultation(mentor, farmer, LocalDateTime.now().plusDays(2),
                mentor.getConsultationFee());
        consultationRepository.save(consultation);

        // Monetization: Create transaction
        // Correct assignment: Recipient (farmer field) = Mentor User, Payer (buyer
        // field) = Farmer
        Double commission = mentor.getConsultationFee() * 0.10; // 10% commission
        Transaction transaction = new Transaction(consultation, mentor.getUser(), farmer, mentor.getConsultationFee(),
                commission, true);
        transactionRepository.save(transaction);

        notificationService.sendNotification(mentor.getUser(), "New Consultation Booking",
                "Farmer " + farmer.getFullName() + " has booked a consultation session with you.", "CONSULTATION");
        notificationService.sendNotification(farmer, "Consultation Booked",
                "You have successfully booked a session with " + mentor.getUser().getFullName() + ".", "CONSULTATION");
    }

    public List<Consultation> getUpcomingConsultations(Mentor mentor) {
        return consultationRepository.findByMentor(mentor).stream()
                .filter(c -> c.getStatus() == Consultation.Status.SCHEDULED)
                .toList();
    }

    public Double getTotalEarnings(Mentor mentor) {
        Double total = transactionRepository.getTotalEarnings(mentor.getUser());
        return total != null ? total : 0.0;
    }

    public int getTotalSessions(Mentor mentor) {
        return (int) consultationRepository.findByMentor(mentor).stream()
                .filter(c -> c.getStatus() == Consultation.Status.COMPLETED)
                .count();
    }

    public void completeConsultation(Long consultationId) {
        Consultation consultation = consultationRepository.findById(consultationId).orElseThrow();
        consultation.setStatus(Consultation.Status.COMPLETED);
        consultation.setPaid(true);
        consultationRepository.save(consultation);

        notificationService.sendNotification(consultation.getFarmer(), "Consultation Completed",
                "Your session with " + consultation.getMentor().getUser().getFullName() + " is marked as completed.",
                "CONSULTATION");
    }

    public List<Consultation> getConsultationsForFarmer(User farmer) {
        return consultationRepository.findByFarmer(farmer);
    }

    @SuppressWarnings("null")
    public void updateConsultationFee(Long consultationId, Double newFee) {
        Consultation consultation = consultationRepository.findById(consultationId).orElseThrow();
        consultation.setFee(newFee);
        consultationRepository.save(consultation);

        // Update linked transaction
        transactionRepository.findByConsultation(consultation).ifPresent(tx -> {
            tx.setAmount(newFee);
            Double commission = newFee * 0.10;
            tx.setCommission(commission);
            tx.setFinalEarnings(newFee - commission);
            transactionRepository.save(tx);
        });
    }

    public List<Transaction> getMentorLedger(Mentor mentor) {
        return transactionRepository.findByFarmerOrderByTimestampDesc(mentor.getUser());
    }
}
