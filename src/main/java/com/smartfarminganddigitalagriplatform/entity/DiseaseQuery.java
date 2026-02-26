package com.smartfarminganddigitalagriplatform.entity;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "disease_queries")
public class DiseaseQuery {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;

    @Column
    private String cropName;

    @Column
    private String symptoms;

    @Column
    private String imagePath;

    @Column(columnDefinition = "TEXT")
    private String diagnosis;

    @Column(columnDefinition = "TEXT")
    private String treatment;

    // --- AI / MODERN PLATFORM FEATURES ---
    @Column
    private String diseaseName;

    @Column
    private Double confidenceScore; // e.g., 95.5

    @Column
    private String severityLevel; // LOW, MEDIUM, HIGH, CRITICAL

    @Column(columnDefinition = "TEXT")
    private String organicTreatment;

    @Column(columnDefinition = "TEXT")
    private String chemicalTreatment;

    @Column(columnDefinition = "TEXT")
    private String preventiveMeasures;
    // -------------------------------------

    @Enumerated(EnumType.STRING)
    private Status status = Status.PENDING;

    @Column(updatable = false)
    private LocalDateTime createdAt;

    public enum Status {
        PENDING, DIAGNOSED, RESOLVED
    }

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
    }

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getCropName() {
        return cropName;
    }

    public void setCropName(String cropName) {
        this.cropName = cropName;
    }

    public String getSymptoms() {
        return symptoms;
    }

    public void setSymptoms(String symptoms) {
        this.symptoms = symptoms;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public String getDiagnosis() {
        return diagnosis;
    }

    public void setDiagnosis(String diagnosis) {
        this.diagnosis = diagnosis;
    }

    public String getTreatment() {
        return treatment;
    }

    public void setTreatment(String treatment) {
        this.treatment = treatment;
    }

    public String getDiseaseName() {
        return diseaseName;
    }

    public void setDiseaseName(String diseaseName) {
        this.diseaseName = diseaseName;
    }

    public Double getConfidenceScore() {
        return confidenceScore;
    }

    public void setConfidenceScore(Double confidenceScore) {
        this.confidenceScore = confidenceScore;
    }

    public String getSeverityLevel() {
        return severityLevel;
    }

    public void setSeverityLevel(String severityLevel) {
        this.severityLevel = severityLevel;
    }

    public String getOrganicTreatment() {
        return organicTreatment;
    }

    public void setOrganicTreatment(String organicTreatment) {
        this.organicTreatment = organicTreatment;
    }

    public String getChemicalTreatment() {
        return chemicalTreatment;
    }

    public void setChemicalTreatment(String chemicalTreatment) {
        this.chemicalTreatment = chemicalTreatment;
    }

    public String getPreventiveMeasures() {
        return preventiveMeasures;
    }

    public void setPreventiveMeasures(String preventiveMeasures) {
        this.preventiveMeasures = preventiveMeasures;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }
}
