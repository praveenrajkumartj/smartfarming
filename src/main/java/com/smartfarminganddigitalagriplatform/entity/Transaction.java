package com.smartfarminganddigitalagriplatform.entity;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "transactions")
public class Transaction {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "listing_id")
    private MarketplaceListing listing;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "consultation_id")
    private Consultation consultation;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "farmer_id", nullable = false)
    private User farmer;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "buyer_id")
    private User buyer;

    @Column(nullable = false)
    private Double amount;

    @Column(nullable = false)
    private Double commission = 0.0;

    @Column(nullable = false)
    private Double finalEarnings;

    @Column(nullable = false)
    private LocalDateTime timestamp;

    @Column(name = "is_suspicious", columnDefinition = "boolean default false")
    private Boolean isSuspicious = false;

    @Enumerated(EnumType.STRING)
    @Column(length = 50)
    private Status status = Status.SUCCESS;

    @Enumerated(EnumType.STRING)
    @Column(length = 50)
    private OrderStatus orderStatus = OrderStatus.PENDING;

    @Column
    private Double quantity;

    @Column
    private String shippingAddress;

    @Column
    private String trackingNumber;

    @Column(length = 50)
    private String paymentMethod;

    public enum Status {
        SUCCESS, PENDING, FAILED, WITHDRAWN, REFUNDED
    }

    public enum OrderStatus {
        PENDING, SHIPPED, DELIVERED, CANCELLED, RETURN_REQUESTED, RETURNED
    }

    public Transaction() {
    }

    public Transaction(MarketplaceListing listing, User farmer, User buyer, Double amount, Double commission,
            Double quantity) {
        this.listing = listing;
        this.farmer = farmer;
        this.buyer = buyer;
        this.amount = amount;
        this.commission = commission;
        this.quantity = quantity;
        this.finalEarnings = amount - commission;
        this.timestamp = LocalDateTime.now();
        this.orderStatus = OrderStatus.PENDING;
    }

    public Transaction(Consultation consultation, User farmer, User mentorUser, Double amount, Double commission,
            boolean isConsultation) {
        this.consultation = consultation;
        this.farmer = farmer;
        this.buyer = mentorUser;
        this.amount = amount;
        this.commission = commission;
        this.finalEarnings = amount - commission;
        this.timestamp = LocalDateTime.now();
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

    public Consultation getConsultation() {
        return consultation;
    }

    public void setConsultation(Consultation consultation) {
        this.consultation = consultation;
    }

    public User getFarmer() {
        return farmer;
    }

    public void setFarmer(User farmer) {
        this.farmer = farmer;
    }

    public User getBuyer() {
        return buyer;
    }

    public void setBuyer(User buyer) {
        this.buyer = buyer;
    }

    public Double getAmount() {
        return amount;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }

    public Double getCommission() {
        return commission;
    }

    public void setCommission(Double commission) {
        this.commission = commission;
    }

    public Double getFinalEarnings() {
        return finalEarnings;
    }

    public void setFinalEarnings(Double finalEarnings) {
        this.finalEarnings = finalEarnings;
    }

    public boolean isSuspicious() {
        return Boolean.TRUE.equals(isSuspicious);
    }

    public void setSuspicious(Boolean suspicious) {
        if (suspicious == null)
            suspicious = false;
        isSuspicious = suspicious;
    }

    public LocalDateTime getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(LocalDateTime timestamp) {
        this.timestamp = timestamp;
    }

    public String getFormattedDate() {
        if (timestamp == null)
            return "N/A";
        return timestamp.format(java.time.format.DateTimeFormatter.ofPattern("dd MMM yyyy"));
    }

    public String getFormattedTime() {
        if (timestamp == null)
            return "00:00";
        return timestamp.format(java.time.format.DateTimeFormatter.ofPattern("HH:mm"));
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public OrderStatus getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(OrderStatus orderStatus) {
        this.orderStatus = orderStatus;
    }

    public Double getQuantity() {
        return quantity;
    }

    public void setQuantity(Double quantity) {
        this.quantity = quantity;
    }

    public String getShippingAddress() {
        return shippingAddress;
    }

    public void setShippingAddress(String shippingAddress) {
        this.shippingAddress = shippingAddress;
    }

    public String getTrackingNumber() {
        return trackingNumber;
    }

    public void setTrackingNumber(String trackingNumber) {
        this.trackingNumber = trackingNumber;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }
}
