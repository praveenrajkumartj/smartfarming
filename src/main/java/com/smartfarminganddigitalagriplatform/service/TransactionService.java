package com.smartfarminganddigitalagriplatform.service;

import com.smartfarminganddigitalagriplatform.entity.Transaction;
import com.smartfarminganddigitalagriplatform.entity.User;
import com.smartfarminganddigitalagriplatform.repository.TransactionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class TransactionService {

    @Autowired
    private TransactionRepository transactionRepository;

    public Double getTotalEarnings(User farmer) {
        Double total = transactionRepository.getTotalEarnings(farmer);
        return total != null ? total : 0.0;
    }

    public List<Transaction> getRecentTransactions(User farmer) {
        return transactionRepository.findByFarmerOrderByTimestampDesc(farmer).stream().limit(5)
                .collect(Collectors.toList());
    }

    public List<Transaction> getTransactionsByFarmer(User farmer) {
        return transactionRepository.findByFarmerOrderByTimestampDesc(farmer);
    }

    public List<Transaction> getMarketplaceSales(User farmer) {
        return transactionRepository.findByFarmerAndListingIsNotNullOrderByTimestampDesc(farmer);
    }

    public List<Object[]> getEarningsChartData(User farmer) {
        return transactionRepository.getEarningsOverTime(farmer);
    }

    public List<Transaction> getAllTransactions() {
        return transactionRepository.findAll();
    }

    public Transaction getTransactionById(Long id) {
        if (id == null) {
            throw new IllegalArgumentException("Transaction ID cannot be null");
        }
        return transactionRepository.findById(id).orElseThrow(() -> new RuntimeException("Transaction not found"));
    }

    public Transaction saveTransaction(Transaction transaction) {
        if (transaction == null) {
            throw new IllegalArgumentException("Transaction cannot be null");
        }
        return transactionRepository.save(transaction);
    }

    public Transaction updateOrderStatus(Long id, Transaction.OrderStatus newStatus) {
        Transaction transaction = getTransactionById(id);
        transaction.setOrderStatus(newStatus);

        // Finalize payment for COD if delivered
        if (newStatus == Transaction.OrderStatus.DELIVERED && "COD".equals(transaction.getPaymentMethod())) {
            transaction.setStatus(Transaction.Status.SUCCESS);
        }

        return transactionRepository.save(transaction);
    }

    public Transaction updateTrackingNumber(Long id, String trackingNumber) {
        Transaction transaction = getTransactionById(id);
        transaction.setTrackingNumber(trackingNumber);
        transaction.setOrderStatus(Transaction.OrderStatus.SHIPPED);
        return transactionRepository.save(transaction);
    }

    public Transaction processCancellation(Long id) {
        Transaction transaction = getTransactionById(id);
        if (transaction.getOrderStatus() == Transaction.OrderStatus.PENDING) {
            transaction.setOrderStatus(Transaction.OrderStatus.CANCELLED);

            if ("COD".equals(transaction.getPaymentMethod())) {
                transaction.setStatus(Transaction.Status.FAILED); // No money was paid
            } else {
                transaction.setStatus(Transaction.Status.REFUNDED); // Money returned
            }
            // Restore inventory
            if (transaction.getListing() != null) {
                com.smartfarminganddigitalagriplatform.entity.MarketplaceListing listing = transaction.getListing();
                listing.setQuantity(listing.getQuantity() + transaction.getQuantity());
                if (listing
                        .getStatus() == com.smartfarminganddigitalagriplatform.entity.MarketplaceListing.Status.SOLD) {
                    listing.setStatus(
                            com.smartfarminganddigitalagriplatform.entity.MarketplaceListing.Status.AVAILABLE);
                }
            }
            return transactionRepository.save(transaction);
        }
        throw new RuntimeException("Cannot cancel order in current status");
    }

    public Transaction processReturnRequest(Long id) {
        Transaction transaction = getTransactionById(id);
        if (transaction.getOrderStatus() == Transaction.OrderStatus.DELIVERED) {
            transaction.setOrderStatus(Transaction.OrderStatus.RETURN_REQUESTED);
            return transactionRepository.save(transaction);
        }
        throw new RuntimeException("Return only available for delivered items");
    }

    public Transaction completeReturn(Long id) {
        Transaction transaction = getTransactionById(id);
        if (transaction.getOrderStatus() == Transaction.OrderStatus.RETURN_REQUESTED) {
            transaction.setOrderStatus(Transaction.OrderStatus.RETURNED);
            transaction.setStatus(Transaction.Status.REFUNDED);
            // Restore inventory if item is resalable (simplified)
            if (transaction.getListing() != null) {
                com.smartfarminganddigitalagriplatform.entity.MarketplaceListing listing = transaction.getListing();
                listing.setQuantity(listing.getQuantity() + transaction.getQuantity());
            }
            return transactionRepository.save(transaction);
        }
        throw new RuntimeException("Return must be requested first");
    }

    public void deleteTransactionById(Long id) {
        if (id == null) {
            throw new IllegalArgumentException("Transaction ID cannot be null");
        }
        transactionRepository.deleteById(id);
    }

    public List<Transaction> getSuspiciousTransactions() {
        return transactionRepository.findByIsSuspiciousTrue();
    }
}
