package com.smartfarminganddigitalagriplatform.service;

import com.smartfarminganddigitalagriplatform.entity.*;
import com.smartfarminganddigitalagriplatform.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.UUID;

@Service
@SuppressWarnings("null")
public class ClinicService {

    @Autowired
    private ClinicExpertRepository expertRepository;
    @Autowired
    private ClinicConsultationRepository consultationRepository;
    @Autowired
    private ClinicPaymentRepository paymentRepository;
    @Autowired
    private ClinicPrescriptionRepository prescriptionRepository;
    @Autowired
    private NotificationService notificationService;

    public ClinicExpert saveExpert(ClinicExpert expert) {
        return expertRepository.save(expert);
    }

    public ClinicExpert getExpertById(Long id) {
        return expertRepository.findById(id).orElse(null);
    }

    public ClinicExpert getExpertByUserId(Long userId) {
        return expertRepository.findByUserId(userId);
    }

    public List<ClinicExpert> getApprovedExperts() {
        return expertRepository.findByIsApprovedTrue();
    }

    public List<ClinicExpert> getPendingExperts() {
        return expertRepository.findByIsApprovedFalse();
    }

    public void approveExpert(Long expertId) {
        ClinicExpert expert = expertRepository.findById(expertId).orElse(null);
        if (expert != null) {
            expert.setApproved(true);
            expertRepository.save(expert);
        }
    }

    public ClinicConsultation bookConsultation(ClinicConsultation consultation, User farmer, Long expertId) {
        ClinicExpert expert = expertRepository.findById(expertId).orElse(null);
        if (expert != null) {
            consultation.setFarmer(farmer);
            consultation.setExpert(expert);
            consultation.setFee(expert.getConsultationFee());
            consultation.setStatus(ClinicConsultation.Status.PENDING);
            ClinicConsultation saved = consultationRepository.save(consultation);

            // Send Booking Confirmation
            notificationService
                    .sendNotification(
                            farmer, "Booking Confirmation", "Your consultation with Dr. "
                                    + expert.getUser().getFullName() + " has been requested. Awaiting their response.",
                            "CLINIC_BOOKING");
            notificationService.sendNotification(expert.getUser(), "New Consultation Request",
                    "You have received a new consultation request from " + farmer.getFullName(), "CLINIC_BOOKING");

            return saved;
        }
        return null;
    }

    public List<ClinicConsultation> getConsultationsForFarmer(Long farmerId) {
        return consultationRepository.findByFarmerId(farmerId);
    }

    public List<ClinicConsultation> getConsultationsForExpert(Long expertId) {
        return consultationRepository.findByExpertId(expertId);
    }

    public ClinicConsultation getConsultationById(Long id) {
        return consultationRepository.findById(id).orElse(null);
    }

    public ClinicConsultation acceptConsultation(Long id) {
        ClinicConsultation c = consultationRepository.findById(id).orElse(null);
        if (c != null) {
            c.setStatus(ClinicConsultation.Status.APPROVED);

            // Create pending payment
            ClinicPayment p = new ClinicPayment();
            p.setConsultation(c);
            p.setAmount(c.getFee());
            p.setStatus(ClinicPayment.PaymentStatus.PENDING);
            p.setTransactionId(UUID.randomUUID().toString().substring(0, 8));
            paymentRepository.save(p);

            // Send acceptance alert
            notificationService.sendNotification(c.getFarmer(), "Consultation Accepted",
                    "Dr. " + c.getExpert().getUser().getFullName()
                            + " accepted your consultation. Please complete the payment.",
                    "CLINIC_BOOKING");

            return consultationRepository.save(c);
        }
        return null;
    }

    public ClinicConsultation payConsultation(Long id) {
        ClinicConsultation c = consultationRepository.findById(id).orElse(null);
        if (c != null && c.getStatus() == ClinicConsultation.Status.APPROVED) {
            ClinicPayment p = c.getPayment();
            if (p != null) {
                p.setStatus(ClinicPayment.PaymentStatus.COMPLETED);
                p.setPaymentDate(java.time.LocalDateTime.now());
                paymentRepository.save(p);

                c.setMeetLink("/clinic/video-room/" + UUID.randomUUID().toString());
                ClinicConsultation updated = consultationRepository.save(c);

                // Send Payment Success alerts
                notificationService.sendNotification(c.getFarmer(), "Payment Confirmation",
                        "Your payment of ₹" + c.getFee() + " was successful. View your dashboard for the meet link.",
                        "PAYMENT_SUCCESS");
                notificationService.sendNotification(c.getExpert().getUser(), "Session Funded", "Farmer "
                        + c.getFarmer().getFullName() + " has completed payment. The session is fully booked.",
                        "PAYMENT_SUCCESS");

                return updated;
            }
        }
        return null;
    }

    public void addPrescription(Long consultationId, ClinicPrescription prescription) {
        ClinicConsultation c = consultationRepository.findById(consultationId).orElse(null);
        if (c != null) {
            c.setStatus(ClinicConsultation.Status.COMPLETED);
            prescription.setConsultation(c);
            prescriptionRepository.save(prescription);
            consultationRepository.save(c);
        }
    }
}
