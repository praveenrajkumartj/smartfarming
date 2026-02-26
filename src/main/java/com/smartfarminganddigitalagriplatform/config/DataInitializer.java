package com.smartfarminganddigitalagriplatform.config;

import com.smartfarminganddigitalagriplatform.entity.*;
import com.smartfarminganddigitalagriplatform.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import java.time.LocalDate;

@Component
public class DataInitializer implements CommandLineRunner {

        @Autowired
        private UserRepository userRepository;

        @Autowired
        private CropRepository cropRepository;

        @Autowired
        private MarketPriceRepository marketPriceRepository;

        @Autowired
        private GovernmentSchemeRepository schemeRepository;

        @Autowired
        private LearningVideoRepository learningVideoRepository;

        @Autowired
        private PasswordEncoder passwordEncoder;

        @Override
        public void run(String... args) throws Exception {
                // Create default admin user
                if (!userRepository.existsByEmail("admin@smartfarm.com")) {
                        User admin = new User();
                        admin.setFullName("System Administrator");
                        admin.setEmail("admin@smartfarm.com");
                        admin.setPassword(passwordEncoder.encode("admin123"));
                        admin.setPhone("9999999999");
                        admin.setState("Maharashtra");
                        admin.setDistrict("Pune");
                        admin.setRole(User.Role.ADMIN);
                        userRepository.save(admin);
                }

                // Create demo farmer
                if (!userRepository.existsByEmail("farmer@smartfarm.com")) {
                        User farmer = new User();
                        farmer.setFullName("Ramesh Kumar");
                        farmer.setEmail("farmer@smartfarm.com");
                        farmer.setPassword(passwordEncoder.encode("farmer123"));
                        farmer.setPhone("8888888888");
                        farmer.setState("Punjab");
                        farmer.setDistrict("Amritsar");
                        farmer.setRole(User.Role.FARMER);
                        userRepository.save(farmer);
                }

                // Create demo buyer
                if (!userRepository.existsByEmail("buyer@smartfarm.com")) {
                        User buyer = new User();
                        buyer.setFullName("Priya Sharma");
                        buyer.setEmail("buyer@smartfarm.com");
                        buyer.setPassword(passwordEncoder.encode("buyer123"));
                        buyer.setPhone("7777777777");
                        buyer.setState("Delhi");
                        buyer.setDistrict("New Delhi");
                        buyer.setRole(User.Role.BUYER);
                        userRepository.save(buyer);
                }

                // Add crops if none exist
                if (cropRepository.count() == 0) {
                        addCrops();
                }

                // Add market prices if none exist
                if (marketPriceRepository.count() == 0) {
                        addMarketPrices();
                }

                // Add government schemes if none exist
                if (schemeRepository.count() == 0) {
                        addSchemes();
                }

                // Add learning videos if none exist
                if (learningVideoRepository.count() == 0) {
                        addLearningVideos();
                }

                // Fix old broken embedded videos in existing databases
                java.util.List<LearningVideo> existingVideos = learningVideoRepository.findAll();
                for (LearningVideo v : existingVideos) {
                        boolean updated = false;
                        if (v.getVideoUrl() != null) {
                                if (v.getVideoUrl().contains("5DrmzNtyhYI")) {
                                        v.setVideoUrl("https://www.youtube.com/embed/mkEsLdNKlPM");
                                        updated = true;
                                }
                                if (v.getVideoUrl().contains("Z0oDBM7p9Lw")) {
                                        v.setVideoUrl("https://www.youtube.com/embed/l0WdnAWOFy4");
                                        updated = true;
                                }
                                if (v.getVideoUrl().contains("3v3H_zX0C-8")) {
                                        v.setVideoUrl("https://www.youtube.com/embed/LApTxEcN7hs");
                                        updated = true;
                                }
                                if (v.getVideoUrl().contains("G2e0i4R1Yiw")) {
                                        v.setVideoUrl("https://www.youtube.com/embed/lRyXlvIJFWI");
                                        updated = true;
                                }
                                if (updated) {
                                        learningVideoRepository.save(v);
                                }
                        }
                }
        }

        private void addCrops() {
                String[][] cropsData = {
                                // name, season, soilType, description, water, duration, minTemp, maxTemp
                                { "Rice (Paddy)", "Kharif", "Clay", "Staple food crop grown widely in India", "High",
                                                "120-150 days",
                                                "20", "35" },
                                { "Wheat", "Rabi", "Loamy", "Major cereal crop cultivated in winter", "Medium",
                                                "120-130 days", "10",
                                                "25" },
                                { "Maize (Corn)", "Kharif", "Sandy Loam", "Versatile crop used for food and feed",
                                                "Medium",
                                                "80-110 days", "18", "32" },
                                { "Cotton", "Kharif", "Black", "Cash crop grown for textile fibers", "Medium",
                                                "150-180 days", "21",
                                                "37" },
                                { "Sugarcane", "Annual", "Loamy", "Major sugar producing crop of India", "High",
                                                "10-12 months", "20",
                                                "35" },
                                { "Soybean", "Kharif", "Sandy Loam", "Rich protein crop with multiple uses", "Medium",
                                                "90-120 days",
                                                "15", "30" },
                                { "Groundnut", "Kharif", "Sandy", "Oil seed crop rich in protein", "Low", "90-110 days",
                                                "20", "35" },
                                { "Mustard", "Rabi", "Loamy", "Oil seed crop cultivated in winter", "Low",
                                                "110-130 days", "10", "25" },
                                { "Tomato", "Rabi", "Sandy Loam", "Widely used vegetable crop", "Medium", "90-120 days",
                                                "15", "30" },
                                { "Onion", "Rabi", "Loamy", "Essential vegetable crop grown across India", "Medium",
                                                "120-150 days",
                                                "13", "28" },
                                { "Potato", "Rabi", "Sandy Loam", "Versatile food crop for all seasons", "Medium",
                                                "70-90 days", "10",
                                                "20" },
                                { "Banana", "Annual", "Loamy", "Tropical fruit with high nutritional value", "High",
                                                "10-12 months",
                                                "22", "38" },
                                { "Turmeric", "Kharif", "Clay Loam", "Spice crop with medicinal properties", "Medium",
                                                "8-9 months",
                                                "20", "35" },
                                { "Chickpea (Gram)", "Rabi", "Sandy Loam", "Protein-rich legume cultivated in winter",
                                                "Low",
                                                "90-120 days", "10", "25" },
                                { "Sunflower", "Kharif", "Loamy", "Oilseed crop grown for edible oil", "Low",
                                                "90-100 days", "18",
                                                "30" }
                };

                for (String[] data : cropsData) {
                        Crop crop = new Crop();
                        crop.setName(data[0]);
                        crop.setSeason(data[1]);
                        crop.setSoilType(data[2]);
                        crop.setDescription(data[3]);
                        crop.setWaterRequirement(data[4]);
                        crop.setGrowthDuration(data[5]);
                        crop.setMinTemperature(Double.parseDouble(data[6]));
                        crop.setMaxTemperature(Double.parseDouble(data[7]));
                        cropRepository.save(crop);
                }
        }

        private void addMarketPrices() {
                Object[][] pricesData = {
                                { "Rice", "Azadpur Mandi", "Delhi", "Delhi", 2200.0, 2800.0, 2500.0, "Quintal" },
                                { "Wheat", "Ludhiana Mandi", "Punjab", "Ludhiana", 2015.0, 2200.0, 2100.0, "Quintal" },
                                { "Tomato", "Nashik Mandi", "Maharashtra", "Nashik", 800.0, 1500.0, 1200.0, "Quintal" },
                                { "Onion", "Lasalgaon", "Maharashtra", "Nashik", 1200.0, 2000.0, 1600.0, "Quintal" },
                                { "Potato", "Agra Mandi", "Uttar Pradesh", "Agra", 600.0, 1200.0, 900.0, "Quintal" },
                                { "Cotton", "Akola Mandi", "Maharashtra", "Akola", 6200.0, 6800.0, 6500.0, "Quintal" },
                                { "Maize", "Karimnagar", "Telangana", "Karimnagar", 1700.0, 2000.0, 1850.0, "Quintal" },
                                { "Soybean", "Indore Mandi", "Madhya Pradesh", "Indore", 4200.0, 4800.0, 4500.0,
                                                "Quintal" },
                                { "Mustard", "Jaipur Mandi", "Rajasthan", "Jaipur", 5200.0, 5800.0, 5500.0, "Quintal" },
                                { "Banana", "Kolkata Mandi", "West Bengal", "Kolkata", 1500.0, 2500.0, 2000.0,
                                                "Quintal" },
                                { "Sugarcane", "Muzaffarnagar", "Uttar Pradesh", "Muzaffarnagar", 340.0, 360.0, 350.0,
                                                "Quintal" },
                                { "Groundnut", "Rajkot Mandi", "Gujarat", "Rajkot", 5000.0, 6000.0, 5500.0, "Quintal" },
                                { "Chickpea", "Raipur Mandi", "Chhattisgarh", "Raipur", 4800.0, 5200.0, 5000.0,
                                                "Quintal" },
                                { "Turmeric", "Nizamabad", "Telangana", "Nizamabad", 7000.0, 9000.0, 8000.0,
                                                "Quintal" },
                };

                for (Object[] data : pricesData) {
                        MarketPrice price = new MarketPrice();
                        price.setCropName((String) data[0]);
                        price.setMarket((String) data[1]);
                        price.setState((String) data[2]);
                        price.setDistrict((String) data[3]);
                        price.setMinPrice((Double) data[4]);
                        price.setMaxPrice((Double) data[5]);
                        price.setModalPrice((Double) data[6]);
                        price.setUnit((String) data[7]);
                        price.setPriceDate(LocalDate.now());
                        marketPriceRepository.save(price);
                }
        }

        private void addSchemes() {
                Object[][] schemesData = {
                                { "PM-KISAN (Pradhan Mantri Kisan Samman Nidhi)",
                                                "A government scheme that provides income support of Rs. 6000 per year to all farmer families holding cultivable land.",
                                                "All small and marginal farmers with landholding up to 2 hectares",
                                                "Rs. 6,000 per year in 3 equal installments of Rs. 2,000 each",
                                                "https://pmkisan.gov.in/",
                                                "Ongoing",
                                                "Income Support" },
                                { "PM Fasal Bima Yojana (PMFBY)",
                                                "Comprehensive crop insurance scheme to provide financial support to farmers suffering crop loss/damage due to unforeseen events.",
                                                "All farmers growing notified crops in notified areas",
                                                "Insurance coverage for crop failure due to natural calamities, pests, and diseases",
                                                "https://pmfby.gov.in/",
                                                "Ongoing",
                                                "Insurance" },
                                { "Kisan Credit Card (KCC)",
                                                "Provides farmers with affordable credit for agricultural needs including cultivation, post-harvest expenses, and maintenance.",
                                                "All farmers, self-help groups, joint liability groups",
                                                "Short-term credit up to Rs. 1.6 lakh at 4% interest rate",
                                                "https://www.nabard.org/",
                                                "Ongoing",
                                                "Credit" },
                                { "Soil Health Card Scheme",
                                                "Scheme to promote balanced use of fertilizers based on soil test results to improve soil health and productivity.",
                                                "All farmers across India",
                                                "Free soil health card with crop-wise recommendations for nutrients and fertilizers",
                                                "https://soilhealth.dac.gov.in/",
                                                "Ongoing",
                                                "Soil Health" },
                                { "National Mission on Agriculture Mechanization",
                                                "Promotes farm mechanization through subsidized agricultural machinery to increase farm productivity and reduce costs.",
                                                "Individual farmers, FPOs, cooperatives, NGOs",
                                                "Subsidy of 40-50% on agricultural machinery and equipment",
                                                "https://farmech.dac.gov.in/",
                                                "Ongoing",
                                                "Mechanization" },
                                { "eNAM (National Agriculture Market)",
                                                "Pan-India electronic trading portal that networks existing APMC mandis to create a unified national market for agricultural commodities.",
                                                "All farmers, traders, and buyers",
                                                "Direct access to pan-India market, transparent price discovery, reduced cost of transaction",
                                                "https://www.enam.gov.in/",
                                                "Ongoing",
                                                "Market Linkage" },
                };

                for (Object[] data : schemesData) {
                        GovernmentScheme scheme = new GovernmentScheme();
                        scheme.setTitle((String) data[0]);
                        scheme.setDescription((String) data[1]);
                        scheme.setEligibility((String) data[2]);
                        scheme.setBenefits((String) data[3]);
                        scheme.setApplicationLink((String) data[4]);
                        scheme.setLastDate((String) data[5]);
                        scheme.setCategory((String) data[6]);
                        scheme.setActive(true);
                        schemeRepository.save(scheme);
                }
        }

        private void addLearningVideos() {
                learningVideoRepository.save(new LearningVideo(
                                "Complete Guide to Organic Farming",
                                "A comprehensive overview of organic farming techniques and transition strategies.",
                                "organic",
                                "https://www.youtube.com/embed/mkEsLdNKlPM"));

                learningVideoRepository.save(new LearningVideo(
                                "Modern Agricultural Machinery",
                                "Learn about the latest tractors, harvesters, and smart farming equipment.",
                                "machinery",
                                "https://www.youtube.com/embed/l0WdnAWOFy4"));

                learningVideoRepository.save(new LearningVideo(
                                "Identifying Crop Diseases",
                                "How to spot early signs of fungal, bacterial, and viral infections in crops.",
                                "disease",
                                "https://www.youtube.com/embed/LApTxEcN7hs"));

                learningVideoRepository.save(new LearningVideo(
                                "Smart Crop Recommendation Systems",
                                "Understanding how soil type and weather data help choose the best crops.",
                                "crop",
                                "https://www.youtube.com/embed/lRyXlvIJFWI"));
        }
}
