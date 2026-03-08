package com.smartfarminganddigitalagriplatform.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailService {

    @Autowired
    private JavaMailSender javaMailSender;

    public void sendOTPEmail(String to, String otp) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("kingpraveen6379@gmail.com");
        message.setTo(to);
        message.setSubject("AGROPLANTER Password Reset OTP");
        message.setText("Your AGROPLANTER password reset OTP is: " + otp +
                ". This OTP is valid for 5 minutes. Please do not share this OTP with anyone.");
        javaMailSender.send(message);
    }

    public void sendRegistrationOTPEmail(String to, String otp) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("kingpraveen6379@gmail.com");
        message.setTo(to);
        message.setSubject("AGROPLANTER - Email Verification OTP");
        message.setText("Welcome to AGROPLANTER!\n\n" +
                "To complete your registration, please verify your email address.\n\n" +
                "Your One-Time Password (OTP) is: " + otp + "\n\n" +
                "This code is valid for 5 minutes and should not be shared with anyone. " +
                "If you did not request this code, please ignore this email.\n\n" +
                "Welcome to the future of digital agriculture!\n" +
                "Team AGROPLANTER");
        javaMailSender.send(message);
    }
}
