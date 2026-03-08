package com.smartfarminganddigitalagriplatform.entity;

import jakarta.persistence.*;
import java.time.LocalDate;
import java.util.UUID;

@Entity
@Table(name = "traceability_records")
public class TraceabilityRecord {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "listing_id", nullable = false)
    private MarketplaceListing listing;

    @Column(nullable = false, unique = true)
    private String traceabilityId = UUID.randomUUID().toString();

    @Column(nullable = false)
    private LocalDate plantingDate;

    @Column
    private String fertilizerUsage;

    @Column
    private String pesticideUsage;

    @Column
    private String irrigationMethod;

    @Column(nullable = false)
    private LocalDate harvestDate;

    @Column(columnDefinition = "TEXT")
    private String sustainabilityPractices;

    public TraceabilityRecord() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public MarketplaceListing getListing() {
        return listing;
    }

    public void setListing(MarketplaceListing listing) {
        this.listing = listing;
    }

    public String getTraceabilityId() {
        return traceabilityId;
    }

    public void setTraceabilityId(String traceabilityId) {
        this.traceabilityId = traceabilityId;
    }

    public LocalDate getPlantingDate() {
        return plantingDate;
    }

    public void setPlantingDate(LocalDate plantingDate) {
        this.plantingDate = plantingDate;
    }

    public String getFertilizerUsage() {
        return fertilizerUsage;
    }

    public void setFertilizerUsage(String fertilizerUsage) {
        this.fertilizerUsage = fertilizerUsage;
    }

    public String getPesticideUsage() {
        return pesticideUsage;
    }

    public void setPesticideUsage(String pesticideUsage) {
        this.pesticideUsage = pesticideUsage;
    }

    public String getIrrigationMethod() {
        return irrigationMethod;
    }

    public void setIrrigationMethod(String irrigationMethod) {
        this.irrigationMethod = irrigationMethod;
    }

    public LocalDate getHarvestDate() {
        return harvestDate;
    }

    public void setHarvestDate(LocalDate harvestDate) {
        this.harvestDate = harvestDate;
    }

    public String getSustainabilityPractices() {
        return sustainabilityPractices;
    }

    public void setSustainabilityPractices(String sustainabilityPractices) {
        this.sustainabilityPractices = sustainabilityPractices;
    }
}
