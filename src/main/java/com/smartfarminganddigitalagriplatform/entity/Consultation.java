package com.smartfarminganddigitalagriplatform.entity;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "consultations")
public class Consultation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "mentor_id", nullable = false)
    private Mentor mentor;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "farmer_id", nullable = false)
    private User farmer;

    @Column(nullable = false)
    private LocalDateTime sessionTime;

    @Column(nullable = false)
    private Double fee;

    @Enumerated(EnumType.STRING)
    private Status status = Status.SCHEDULED;

    @Column(columnDefinition = "TEXT")
    private String notes;

    private String meetingLink; // for live sessions

    @Column(nullable = false)
    private boolean isPaid = false;

    public enum Status {
        SCHEDULED, COMPLETED, CANCELLED, NO_SHOW
    }

    public Consultation() {
    }

    public Consultation(Mentor mentor, User farmer, LocalDateTime time, Double fee) {
        this.mentor = mentor;
        this.farmer = farmer;
        this.sessionTime = time;
        this.fee = fee;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Mentor getMentor() {
        return mentor;
    }

    public void setMentor(Mentor mentor) {
        this.mentor = mentor;
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

    public String getFormattedSessionTime() {
        if (sessionTime == null)
            return "PENDING";
        return sessionTime.format(java.time.format.DateTimeFormatter.ofPattern("dd MMM, yyyy"));
    }

    public String getFormattedSessionHour() {
        if (sessionTime == null)
            return "00:00";
        return sessionTime.format(java.time.format.DateTimeFormatter.ofPattern("HH:mm"));
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

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public String getMeetingLink() {
        return meetingLink;
    }

    public void setMeetingLink(String meetingLink) {
        this.meetingLink = meetingLink;
    }

    public boolean isPaid() {
        return isPaid;
    }

    public void setPaid(boolean paid) {
        isPaid = paid;
    }
}
