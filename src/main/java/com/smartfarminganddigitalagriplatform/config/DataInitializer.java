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
        private MentorRepository mentorRepository;

        @Autowired
        private EquipmentRepository equipmentRepository;

        @Autowired
        private TransactionRepository transactionRepository;

        @Autowired
        private MarketplaceListingRepository marketplaceListingRepository;

        @Autowired
        private EquipmentRentalRepository rentalRepository;

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

                // Add mentors if none exist
                if (mentorRepository.count() == 0) {
                        addMentors();
                }

                // Add equipment if none exist (or force refresh for testing)
                // rentalRepository.deleteAll();
                // equipmentRepository.deleteAll();
                // addEquipment();

                // Add sample rentals for audit logs
                // addSampleRentals();

                // Add sample transactions for dashboard
                if (transactionRepository.count() == 0) {
                        addSampleTransactions();
                }

                // Remove specifically requested "groundnut" listing
                java.util.List<MarketplaceListing> groundnutListings = marketplaceListingRepository
                                .findByCropNameContainingIgnoreCase("groundnut");
                for (MarketplaceListing gl : groundnutListings) {
                        if (gl.getQuantity() == 2.1) {
                                marketplaceListingRepository.delete(gl);
                        }
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

        private void addMentors() {
                // Create mentor users if they don't exist
                String[][] mentorUsers = {
                                { "Dr. Arun Varma", "arun@mentor.com", "mentor123", "Organic Specialist" },
                                { "Savitri Devi", "savitri@mentor.com", "mentor123", "Irrigation Expert" },
                                { "John Miller", "john@mentor.com", "mentor123", "Modern Machinery Analyst" }
                };

                for (String[] data : mentorUsers) {
                        if (!userRepository.existsByEmail(data[1])) {
                                User user = new User();
                                user.setFullName(data[0]);
                                user.setEmail(data[1]);
                                user.setPassword(passwordEncoder.encode(data[2]));
                                user.setPhone("910000000" + data[0].length());
                                user.setRole(User.Role.ADMIN); // Mentors have elevated roles or specific roles
                                userRepository.save(user);

                                Mentor mentor = new Mentor(user, data[3], 500.0);
                                mentor.setBio("Helping farmers grow better and smarter with over 15 years of field experience.");
                                mentor.setRating(4.5 + (data[0].length() % 5) * 0.1);
                                mentor.setTotalReviews(12 + data[0].length());
                                mentorRepository.save(mentor);
                        }
                }
        }

        private void addEquipment() {
                User farmer = userRepository.findByEmail("farmer@smartfarm.com").orElse(null);
                User admin = userRepository.findByEmail("admin@smartfarm.com").orElse(null);
                User buyer = userRepository.findByEmail("buyer@smartfarm.com").orElse(null);

                if (farmer == null || admin == null || buyer == null)
                        return;

                // Equipment owned by Farmer (Visible to Others)
                String[][] farmerEquipment = {
                                { "Mahindra Yuvo 575 DI", "Robust tractor for all farming needs.", "500.0",
                                                "https://images.unsplash.com/photo-1594494424759-6446e557199a?auto=format&fit=crop&q=80&w=400",
                                                "TRACTOR" },
                                { "Power Rotavator 7HP", "High-performance soil preparation tool.", "200.0",
                                                "https://images.unsplash.com/photo-1622383563227-04401ab4e5ea?auto=format&fit=crop&q=80&w=400",
                                                "ROTAVATOR" }
                };

                // Equipment owned by Admin (Visible to Farmer)
                String[][] adminEquipment = {
                                { "John Deere Combine Harvester", "Efficient harvesting for large fields.", "1500.0",
                                                "https://images.unsplash.com/photo-1592915264629-65fe00a6e309?auto=format&fit=crop&q=80&w=400",
                                                "HARVESTER" },
                                { "DJI Agras T30 Drone", "Precision spraying and mapping drone.", "2500.0",
                                                "https://images.unsplash.com/photo-1508614589041-895b88991e3e?auto=format&fit=crop&q=80&w=400",
                                                "DRONE" }
                };

                // Equipment owned by Buyer/Other (Visible to Farmer)
                String[][] buyerEquipment = {
                                { "New Holland 3630", "Turbo super tractor for heavy load.", "600.0",
                                                "https://images.unsplash.com/photo-1594494424759-6446e557199a?auto=format&fit=crop&q=80&w=400",
                                                "TRACTOR" },
                                { "Kubota Rice Transplanter", "Fast and efficient rice transplanting.", "800.0",
                                                "https://images.unsplash.com/photo-1569880153113-76e33fc52d5f?auto=format&fit=crop&q=80&w=400",
                                                "TRANSPLANTER" }
                };

                saveEquipmentSet(farmer, farmerEquipment);
                saveEquipmentSet(admin, adminEquipment);
                saveEquipmentSet(buyer, buyerEquipment);
        }

        private void saveEquipmentSet(User owner, String[][] data) {
                for (String[] eqData : data) {
                        Equipment eq = new Equipment(owner, eqData[0], eqData[4], Double.parseDouble(eqData[2]) / 8,
                                        Double.parseDouble(eqData[2]));
                        eq.setDescription(eqData[1]);
                        eq.setImagePath(eqData[3]);
                        eq.setState(owner.getState());
                        eq.setDistrict(owner.getDistrict());
                        eq.setLocation(owner.getDistrict());
                        eq.setApproved(true);
                        equipmentRepository.save(eq);
                }
        }

        private void addSampleTransactions() {
                User farmer = userRepository.findByEmail("farmer@smartfarm.com").orElse(null);
                User buyer = userRepository.findByEmail("buyer@smartfarm.com").orElse(null);
                if (farmer == null || buyer == null)
                        return;

                double[] amounts = { 25000.0, 15000.0, 42000.0, 18000.0, 31000.0, 27000.0 };
                for (int i = 0; i < amounts.length; i++) {
                        Transaction t = new Transaction(null, farmer, buyer, amounts[i], amounts[i] * 0.05, 1.0);
                        t.setTimestamp(java.time.LocalDateTime.now().minusDays(i * 5));
                        transactionRepository.save(t);
                }
        }

        private void addSampleRentals() {
                User farmer = userRepository.findByEmail("farmer@smartfarm.com").orElse(null);
                User admin = userRepository.findByEmail("admin@smartfarm.com").orElse(null);
                User buyer = userRepository.findByEmail("buyer@smartfarm.com").orElse(null);

                if (farmer == null || admin == null || buyer == null)
                        return;

                Equipment harvester = equipmentRepository.findAll().stream()
                                .filter(e -> e.getName().contains("Harvester")).findFirst().orElse(null);
                Equipment tractor = equipmentRepository.findAll().stream()
                                .filter(e -> e.getName().contains("Yuvo")).findFirst().orElse(null);

                if (harvester != null) {
                        EquipmentRental r1 = new EquipmentRental(harvester, farmer,
                                        java.time.LocalDateTime.now().minusDays(5),
                                        java.time.LocalDateTime.now().minusDays(2), 4500.0);
                        r1.setStatus(EquipmentRental.Status.COMPLETED);
                        rentalRepository.save(r1);
                }

                if (tractor != null) {
                        EquipmentRental r2 = new EquipmentRental(tractor, buyer,
                                        java.time.LocalDateTime.now().plusDays(1),
                                        java.time.LocalDateTime.now().plusDays(3), 1200.0);
                        r2.setStatus(EquipmentRental.Status.APPROVED);
                        rentalRepository.save(r2);
                }
        }
}
