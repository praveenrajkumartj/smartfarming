package com.smartfarminganddigitalagriplatform.service;

import com.smartfarminganddigitalagriplatform.entity.Transaction;
import com.smartfarminganddigitalagriplatform.entity.User;
import com.smartfarminganddigitalagriplatform.entity.WithdrawalRequest;
import com.smartfarminganddigitalagriplatform.repository.TransactionRepository;
import com.smartfarminganddigitalagriplatform.repository.WithdrawalRequestRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.time.YearMonth;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Service
public class FinanceService {

    @Autowired
    private TransactionRepository transactionRepository;

    @Autowired
    private WithdrawalRequestRepository withdrawalRequestRepository;

    // Get total earnings for a farmer
    public Double getTotalEarnings(Long farmerId) {
        List<Transaction> transactions = transactionRepository.findByFarmerId(farmerId);
        return transactions.stream()
                .filter(t -> t.getStatus() == Transaction.Status.SUCCESS
                        || t.getStatus() == Transaction.Status.WITHDRAWN)
                .mapToDouble(Transaction::getFinalEarnings)
                .sum();
    }

    // Get total commission paid by a farmer
    public Double getTotalCommissionPaid(Long farmerId) {
        List<Transaction> transactions = transactionRepository.findByFarmerId(farmerId);
        return transactions.stream()
                .filter(t -> t.getStatus() == Transaction.Status.SUCCESS
                        || t.getStatus() == Transaction.Status.WITHDRAWN)
                .mapToDouble(Transaction::getCommission)
                .sum();
    }

    // Get available balance (Total Earnings - Withdrawn or Pending Withdrawals)
    public Double getAvailableBalance(User farmer) {
        Double totalEarnings = getTotalEarnings(farmer.getId());
        Double withdrawnOrPending = getWithdrawnOrPendingAmount(farmer);
        return totalEarnings - withdrawnOrPending;
    }

    public Double getWithdrawnOrPendingAmount(User farmer) {
        return withdrawalRequestRepository.findByFarmerOrderByRequestDateDesc(farmer).stream()
                .filter(w -> w.getStatus() != WithdrawalRequest.Status.REJECTED)
                .mapToDouble(WithdrawalRequest::getAmount)
                .sum();
    }

    // Get Monthly Earnings Breakdown for Graph
    public Map<String, Double> getMonthlyEarningsGraph(Long farmerId) {
        List<Transaction> transactions = transactionRepository.findByFarmerId(farmerId);
        Map<String, Double> monthlyData = new LinkedHashMap<>();

        // Initialize last 6 months
        YearMonth current = YearMonth.now();
        for (int i = 5; i >= 0; i--) {
            monthlyData.put(current.minusMonths(i).toString(), 0.0);
        }

        for (Transaction t : transactions) {
            if (t.getStatus() == Transaction.Status.SUCCESS || t.getStatus() == Transaction.Status.WITHDRAWN) {
                String monthKey = YearMonth.from(t.getTimestamp()).toString();
                if (monthlyData.containsKey(monthKey)) {
                    monthlyData.put(monthKey, monthlyData.get(monthKey) + t.getFinalEarnings());
                }
            }
        }
        return monthlyData;
    }

    // Create a new withdrawal Request
    public WithdrawalRequest requestWithdrawal(User farmer, Double amount) {
        WithdrawalRequest request = new WithdrawalRequest();
        request.setFarmer(farmer);
        request.setAmount(amount);
        request.setStatus(WithdrawalRequest.Status.PENDING);
        request.setRequestDate(LocalDateTime.now());

        // determine the withdrawal target reference
        String target = "Bank: " + farmer.getBankAccountNumber();
        if (farmer.getUpiId() != null && !farmer.getUpiId().isEmpty()) {
            target = "UPI: " + farmer.getUpiId();
        }
        request.setTransferReference(target);

        return withdrawalRequestRepository.save(request);
    }

    public List<WithdrawalRequest> getFarmerWithdrawalRequests(User farmer) {
        return withdrawalRequestRepository.findByFarmerOrderByRequestDateDesc(farmer);
    }

    public List<WithdrawalRequest> getAllPendingWithdrawals() {
        return withdrawalRequestRepository.findByStatusOrderByRequestDateAsc(WithdrawalRequest.Status.PENDING);
    }

    public List<WithdrawalRequest> getAllCompletedWithdrawals() {
        return withdrawalRequestRepository.findByStatusOrderByRequestDateAsc(WithdrawalRequest.Status.COMPLETED);
    }

    public void approveWithdrawal(Long id) {
        WithdrawalRequest req = withdrawalRequestRepository.findById(id).orElse(null);
        if (req != null && req.getStatus() == WithdrawalRequest.Status.PENDING) {
            req.setStatus(WithdrawalRequest.Status.COMPLETED);
            req.setProcessDate(LocalDateTime.now());
            withdrawalRequestRepository.save(req);
        }
    }

    public void rejectWithdrawal(Long id) {
        WithdrawalRequest req = withdrawalRequestRepository.findById(id).orElse(null);
        if (req != null && req.getStatus() == WithdrawalRequest.Status.PENDING) {
            req.setStatus(WithdrawalRequest.Status.REJECTED);
            req.setProcessDate(LocalDateTime.now());
            withdrawalRequestRepository.save(req);
        }
    }
}
