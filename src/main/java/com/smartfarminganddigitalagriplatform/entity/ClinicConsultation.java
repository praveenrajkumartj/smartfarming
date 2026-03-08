package com.smartfarminganddigitalagriplatform.entity;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "clinic_consultations")
public class ClinicConsultation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "expert_id", nullable = false)
    private ClinicExpert expert;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "farmer_id", nullable = false)
    private User farmer;

    @Column(nullable = false)
    private LocalDateTime sessionTime;

    @Column(nullable = false)
    private Double fee;

    @Enumerated(EnumType.STRING)
    private Status status = Status.PENDING; // PENDING -> APPROVED -> COMPLETED / CANCELLED

    @Column(columnDefinition = "TEXT")
    private String symptomsDescription;

    @Column
    private String plantImagePath; // Image of affected plant

    private String meetLink; // WebRTC link placeholder

    @OneToOne(mappedBy = "consultation", cascade = CascadeType.ALL)
    private ClinicPrescription prescription;

    @OneToOne(mappedBy = "consultation", cascade = CascadeType.ALL)
    private ClinicPayment payment;

    public enum Status {
        PENDING, APPROVED, REJECTED, COMPLETED, CANCELLED
    }

    // Getters and Setters

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public ClinicExpert getExpert() {
        return expert;
    }

    public void setExpert(ClinicExpert expert) {
        this.expert = expert;
    }

    public User getFarmer() {
        return farmer;
    }

    public void setFarmer(User farmer) {
        this.farmer = farmer;
    }

    public LocalDateTime getSessionTime() {
        return sessionTime;
    }

    public void setSessionTime(LocalDateTime sessionTime) {
        this.sessionTime = sessionTime;
    }

    public Double getFee() {
        return fee;
    }

    public void setFee(Double fee) {
        this.fee = fee;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public String getSymptomsDescription() {
        return symptomsDescription;
    }

    public void setSymptomsDescription(String symptomsDescription) {
        this.symptomsDescription = symptomsDescription;
    }

    public String getPlantImagePath() {
        return plantImagePath;
    }

    public void setPlantImagePath(String plantImagePath) {
        this.plantImagePath = plantImagePath;
    }

    public String getMeetLink() {
        return meetLink;
    }

    public void setMeetLink(String meetLink) {
        this.meetLink = meetLink;
    }

    public ClinicPrescription getPrescription() {
        return prescription;
    }

    public void setPrescription(ClinicPrescription prescription) {
        this.prescription = prescription;
    }

    public ClinicPayment getPayment() {
        return payment;
    }

    public void setPayment(ClinicPayment payment) {
        this.payment = payment;
    }
}
