package com.smartfarminganddigitalagriplatform.entity;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "marketplace_listings")
public class MarketplaceListing {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "farmer_id", nullable = false)
    private User farmer;

    @Column(nullable = false)
    private String cropName;

    @Column(nullable = false)
    private Double quantity;

    @Column(nullable = false)
    private String unit;

    @Column(nullable = false)
    private Double pricePerUnit;

    @Column
    private String location;

    @Column(columnDefinition = "TEXT")
    private String description;

    @Column
    private String contactNumber;

    @Enumerated(EnumType.STRING)
    private Status status = Status.AVAILABLE;

    @Column(updatable = false)
    private LocalDateTime createdAt;

    @OneToOne(mappedBy = "listing", cascade = CascadeType.ALL)
    private TraceabilityRecord traceabilityRecord;

    @Column(name = "is_surplus")
    private boolean isSurplus = false;

    @Column(name = "clearance_price")
    private Double clearancePrice;

    @Column(name = "is_suspicious", columnDefinition = "boolean default false")
    private Boolean isSuspicious = false;

    public enum Status {
        AVAILABLE, SOLD, PENDING
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

    public User getFarmer() {
        return farmer;
    }

    public void setFarmer(User farmer) {
        this.farmer = farmer;
    }

    public String getCropName() {
        return cropName;
    }

    public void setCropName(String cropName) {
        this.cropName = cropName;
    }

    public Double getQuantity() {
        return quantity;
    }

    public void setQuantity(Double quantity) {
        this.quantity = quantity;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public Double getPricePerUnit() {
        return pricePerUnit;
    }

    public void setPricePerUnit(Double pricePerUnit) {
        this.pricePerUnit = pricePerUnit;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getContactNumber() {
        return contactNumber;
    }

    public void setContactNumber(String contactNumber) {
        this.contactNumber = contactNumber;
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

    public TraceabilityRecord getTraceabilityRecord() {
        return traceabilityRecord;
    }

    public void setTraceabilityRecord(TraceabilityRecord traceabilityRecord) {
        this.traceabilityRecord = traceabilityRecord;
    }

    public boolean isSurplus() {
        return isSurplus;
    }

    public void setSurplus(boolean surplus) {
        isSurplus = surplus;
    }

    public Double getClearancePrice() {
        return clearancePrice;
    }

    public void setClearancePrice(Double clearancePrice) {
        this.clearancePrice = clearancePrice;
    }

    public boolean isSuspicious() {
        return Boolean.TRUE.equals(isSuspicious);
    }

    public Boolean getIsSuspicious() {
        return isSuspicious;
    }

    public void setSuspicious(Boolean suspicious) {
        if (suspicious == null)
            suspicious = false;
        isSuspicious = suspicious;
    }
}
