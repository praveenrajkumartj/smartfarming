package com.smartfarminganddigitalagriplatform.service;

import com.smartfarminganddigitalagriplatform.entity.PasswordResetOTP;
import com.smartfarminganddigitalagriplatform.repository.OTPRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.Optional;
import java.util.Random;

@Service
public class OTPService {

    @Autowired
    private OTPRepository otpRepository;

    @Autowired
    private EmailService emailService;

    private static final int OTP_EXPIRATION_MINUTES = 5;
    private static final int MAX_ATTEMPTS = 3;

    @Transactional
    public String generateAndSendOTP(String email) {
        // Delete any existing OTP for this email
        otpRepository.deleteByEmail(email);

        // Generate 6-digit OTP
        String otp = String.format("%06d", new Random().nextInt(999999));

        PasswordResetOTP otpEntity = new PasswordResetOTP();
        otpEntity.setEmail(email);
        otpEntity.setOtp(otp);
        otpEntity.setExpiresAt(LocalDateTime.now().plusMinutes(OTP_EXPIRATION_MINUTES));
        otpEntity.setAttempts(0);
        otpEntity.setVerified(false);

        otpRepository.save(otpEntity);

        // Send via email
        emailService.sendOTPEmail(email, otp);

        return otp;
    }

    @Transactional
    public String generateAndSendRegistrationOTP(String email) {
        // Delete any existing OTP for this email
        otpRepository.deleteByEmail(email);

        // Generate 6-digit OTP
        String otp = String.format("%06d", new Random().nextInt(999999));

        PasswordResetOTP otpEntity = new PasswordResetOTP();
        otpEntity.setEmail(email);
        otpEntity.setOtp(otp);
        otpEntity.setExpiresAt(LocalDateTime.now().plusMinutes(OTP_EXPIRATION_MINUTES));
        otpEntity.setAttempts(0);
        otpEntity.setVerified(false);

        otpRepository.save(otpEntity);

        // Send via professional registration email
        emailService.sendRegistrationOTPEmail(email, otp);

        return otp;
    }

    @Transactional
    public boolean verifyOTP(String email, String otp) {
        Optional<PasswordResetOTP> optionalOTP = otpRepository.findByEmail(email);

        if (optionalOTP.isPresent()) {
            PasswordResetOTP otpEntity = optionalOTP.get();

            if (otpEntity.isExpired()) {
                return false;
            }

            if (otpEntity.getAttempts() >= MAX_ATTEMPTS) {
                return false;
            }

            if (otpEntity.getOtp().equals(otp)) {
                otpEntity.setVerified(true);
                otpRepository.save(otpEntity);
                return true;
            } else {
                otpEntity.setAttempts(otpEntity.getAttempts() + 1);
                otpRepository.save(otpEntity);
            }
        }
        return false;
    }

    public boolean isOTPVerified(String email) {
        return otpRepository.findByEmail(email)
                .map(PasswordResetOTP::isVerified)
                .orElse(false);
    }

    @Transactional
    public void clearOTP(String email) {
        otpRepository.deleteByEmail(email);
    }
}
