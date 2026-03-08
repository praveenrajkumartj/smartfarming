package com.smartfarminganddigitalagriplatform.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "equipments")
public class Equipment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "owner_id", nullable = false)
    private User owner;

    @Column(nullable = false)
    private String name;

    @Column(columnDefinition = "TEXT")
    private String description;

    @Column(nullable = false)
    private String type; // TRACTOR, HARVESTER, DRONE, ROTAVATOR, etc.

    @Column(nullable = false)
    private Double rentalRatePerHour;

    @Column(nullable = false)
    private Double rentalRatePerDay;

    @Column(nullable = false)
    private boolean isAvailable = true;

    @Column(nullable = false)
    private boolean isApproved = false;

    private String state;
    private String district;
    private String location;

    @Column
    private String imagePath;

    private Double averageRating = 0.0;
    private Integer totalRatings = 0;

    public Equipment() {
    }

    public Equipment(User owner, String name, String type, Double hourRate, Double dayRate) {
        this.owner = owner;
        this.name = name;
        this.type = type;
        this.rentalRatePerHour = hourRate;
        this.rentalRatePerDay = dayRate;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getOwner() {
        return owner;
    }

    public void setOwner(User owner) {
        this.owner = owner;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Double getRentalRatePerHour() {
        return rentalRatePerHour;
    }

    public void setRentalRatePerHour(Double rentalRatePerHour) {
        this.rentalRatePerHour = rentalRatePerHour;
    }

    public boolean isAvailable() {
        return isAvailable;
    }

    public void setAvailable(boolean available) {
        isAvailable = available;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Double getRentalRatePerDay() {
        return rentalRatePerDay;
    }

    public void setRentalRatePerDay(Double rentalRatePerDay) {
        this.rentalRatePerDay = rentalRatePerDay;
    }

    public boolean isApproved() {
        return isApproved;
    }

    public void setApproved(boolean approved) {
        isApproved = approved;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public Double getAverageRating() {
        return averageRating;
    }

    public void setAverageRating(Double averageRating) {
        this.averageRating = averageRating;
    }

    public Integer getTotalRatings() {
        return totalRatings;
    }

    public void setTotalRatings(Integer totalRatings) {
        this.totalRatings = totalRatings;
    }
}
