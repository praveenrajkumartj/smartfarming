<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <title>Smart Farming & Digital Agriculture Platform</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            <link rel="stylesheet"
                href="${pageContext.request.contextPath}/css/style.css?v=<%= System.currentTimeMillis() %>" />
            <link rel="icon"
                href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🌾</text></svg>" />
            <style>
                /* HOME PAGE SPECIFIC */
                body {
                    background: transparent;
                    overflow-x: hidden;
                }

                .hero {
                    min-height: 100vh;
                    display: flex;
                    flex-direction: column;
                    position: relative;
                    overflow: hidden;
                }

                .hero-bg {
                    position: absolute;
                    inset: 0;
                    background: radial-gradient(ellipse at 20% 50%, rgba(22, 163, 74, 0.15) 0%, transparent 50%),
                        radial-gradient(ellipse at 80% 20%, rgba(14, 165, 233, 0.1) 0%, transparent 40%);
                    background-size: cover;
                    background-position: center;
                    z-index: -1;
                }

                .hero-grid {
                    position: absolute;
                    inset: 0;
                    background-image: linear-gradient(rgba(22, 163, 74, 0.05) 1px, transparent 1px),
                        linear-gradient(90deg, rgba(22, 163, 74, 0.05) 1px, transparent 1px);
                    background-size: 60px 60px;
                }

                .navbar {
                    position: relative;
                    z-index: 10;
                    display: flex;
                    align-items: center;
                    justify-content: space-between;
                    padding: 20px 60px;
                    backdrop-filter: blur(10px);
                    border-bottom: 1px solid rgba(22, 163, 74, 0.1);
                }

                .nav-brand {
                    display: flex;
                    align-items: center;
                    gap: 12px;
                    text-decoration: none;
                }

                .nav-brand-icon {
                    width: 44px;
                    height: 44px;
                    background: linear-gradient(135deg, #16a34a, #22c55e);
                    border-radius: 12px;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    font-size: 22px;
                    box-shadow: 0 4px 16px rgba(22, 163, 74, 0.4);
                }

                .nav-brand-text h2 {
                    font-size: 16px;
                    font-weight: 800;
                    color: #f0fdf4;
                    line-height: 1.2;
                }

                .nav-brand-text span {
                    font-size: 11px;
                    color: #22c55e;
                }

                .nav-links {
                    display: flex;
                    align-items: center;
                    gap: 8px;
                }

                .nav-link {
                    padding: 8px 16px;
                    color: #9ca3af;
                    font-size: 14px;
                    font-weight: 500;
                    border-radius: 8px;
                    transition: all 0.2s;
                    text-decoration: none;
                }

                .nav-link:hover {
                    color: #f0fdf4;
                    background: rgba(255, 255, 255, 0.05);
                }

                .nav-btn {
                    padding: 9px 20px;
                    background: linear-gradient(135deg, #16a34a, #22c55e);
                    color: white;
                    border-radius: 10px;
                    font-size: 14px;
                    font-weight: 600;
                    text-decoration: none;
                    box-shadow: 0 4px 12px rgba(22, 163, 74, 0.3);
                    transition: all 0.3s;
                }

                .nav-btn:hover {
                    transform: translateY(-2px);
                    box-shadow: 0 8px 24px rgba(22, 163, 74, 0.4);
                    color: white;
                }

                .nav-btn.outline {
                    background: transparent;
                    border: 1px solid rgba(22, 163, 74, 0.4);
                    color: #22c55e;
                    box-shadow: none;
                }

                .nav-btn.outline:hover {
                    background: rgba(22, 163, 74, 0.1);
                    box-shadow: none;
                }

                .hero-content {
                    flex: 1;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    padding: 60px;
                    position: relative;
                    z-index: 5;
                }

                .hero-text {
                    text-align: center;
                    max-width: 800px;
                }

                .hero-badge {
                    display: inline-flex;
                    align-items: center;
                    gap: 8px;
                    background: rgba(22, 163, 74, 0.15);
                    border: 1px solid rgba(22, 163, 74, 0.3);
                    border-radius: 50px;
                    padding: 8px 20px;
                    font-size: 13px;
                    font-weight: 600;
                    color: #22c55e;
                    margin-bottom: 28px;
                    animation: fadeIn 0.6s ease;
                }

                .hero-title {
                    font-size: clamp(36px, 6vw, 72px);
                    font-weight: 900;
                    line-height: 1.1;
                    margin-bottom: 20px;
                    animation: fadeIn 0.8s ease 0.1s both;
                }

                .hero-title .highlight {
                    background: linear-gradient(135deg, #16a34a, #22c55e, #0ea5e9);
                    -webkit-background-clip: text;
                    -webkit-text-fill-color: transparent;
                    background-clip: text;
                }

                .hero-subtitle {
                    font-size: 18px;
                    color: #9ca3af;
                    max-width: 600px;
                    margin: 0 auto 36px;
                    line-height: 1.7;
                    animation: fadeIn 1s ease 0.2s both;
                }

                .hero-cta {
                    display: flex;
                    gap: 16px;
                    justify-content: center;
                    flex-wrap: wrap;
                    animation: fadeIn 1s ease 0.3s both;
                }

                .cta-btn {
                    display: inline-flex;
                    align-items: center;
                    gap: 10px;
                    padding: 14px 32px;
                    border-radius: 12px;
                    font-size: 15px;
                    font-weight: 700;
                    text-decoration: none;
                    transition: all 0.3s;
                }

                .cta-btn.primary {
                    background: linear-gradient(135deg, #16a34a, #22c55e);
                    color: white;
                    box-shadow: 0 8px 32px rgba(22, 163, 74, 0.35);
                }

                .cta-btn.primary:hover {
                    transform: translateY(-3px);
                    box-shadow: 0 12px 40px rgba(22, 163, 74, 0.5);
                    color: white;
                }

                .cta-btn.secondary {
                    background: rgba(255, 255, 255, 0.05);
                    border: 1px solid rgba(255, 255, 255, 0.15);
                    color: #f0fdf4;
                    backdrop-filter: blur(10px);
                }

                .cta-btn.secondary:hover {
                    background: rgba(255, 255, 255, 0.08);
                    color: #f0fdf4;
                }

                .stats-banner {
                    display: flex;
                    justify-content: center;
                    gap: 48px;
                    padding: 40px 60px;
                    position: relative;
                    z-index: 5;
                    border-top: 1px solid rgba(22, 163, 74, 0.1);
                    background: rgba(0, 0, 0, 0.3);
                    backdrop-filter: blur(5px);
                }

                .stat-item {
                    text-align: center;
                }

                .stat-item .num {
                    font-size: 32px;
                    font-weight: 800;
                    background: linear-gradient(135deg, #16a34a, #22c55e);
                    -webkit-background-clip: text;
                    -webkit-text-fill-color: transparent;
                    background-clip: text;
                }

                .stat-item .label {
                    font-size: 13px;
                    color: #6b7280;
                    font-weight: 500;
                }

                /* Features */
                .section {
                    padding: 80px 60px;
                }

                .section-center {
                    text-align: center;
                    max-width: 700px;
                    margin: 0 auto 60px;
                }

                .section-tag {
                    display: inline-block;
                    background: rgba(22, 163, 74, 0.15);
                    border: 1px solid rgba(22, 163, 74, 0.3);
                    border-radius: 50px;
                    padding: 6px 16px;
                    font-size: 12px;
                    font-weight: 700;
                    color: #22c55e;
                    text-transform: uppercase;
                    letter-spacing: 1px;
                    margin-bottom: 16px;
                }

                .section-heading {
                    font-size: clamp(28px, 4vw, 42px);
                    font-weight: 800;
                    color: #f0fdf4;
                    margin-bottom: 16px;
                }

                .section-desc {
                    font-size: 16px;
                    color: #9ca3af;
                    line-height: 1.7;
                }

                .features-grid {
                    display: grid;
                    grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
                    gap: 24px;
                    max-width: 1200px;
                    margin: 0 auto;
                }

                .feature-card {
                    background: linear-gradient(135deg, #0d1a0d, #111811);
                    border: 1px solid rgba(22, 163, 74, 0.12);
                    border-radius: 20px;
                    padding: 28px;
                    transition: all 0.3s;
                    position: relative;
                    overflow: hidden;
                }

                .feature-card::before {
                    content: '';
                    position: absolute;
                    top: 0;
                    left: 0;
                    right: 0;
                    height: 2px;
                    background: linear-gradient(90deg, transparent, #16a34a, transparent);
                    transform: scaleX(0);
                    transition: transform 0.3s;
                }

                .feature-card:hover {
                    transform: translateY(-8px);
                    border-color: rgba(22, 163, 74, 0.35);
                    box-shadow: 0 20px 60px rgba(0, 0, 0, 0.5);
                }

                .feature-card:hover::before {
                    transform: scaleX(1);
                }

                .feature-icon {
                    font-size: 40px;
                    margin-bottom: 16px;
                    display: block;
                }

                .feature-title {
                    font-size: 18px;
                    font-weight: 700;
                    color: #f0fdf4;
                    margin-bottom: 10px;
                }

                .feature-desc {
                    font-size: 14px;
                    color: #9ca3af;
                    line-height: 1.7;
                }

                /* Role Cards */
                .roles-grid {
                    display: grid;
                    grid-template-columns: repeat(3, 1fr);
                    gap: 24px;
                    max-width: 1100px;
                    margin: 0 auto;
                }

                .role-card {
                    background: #0d1a0d;
                    border: 1px solid rgba(22, 163, 74, 0.12);
                    border-radius: 24px;
                    padding: 36px 28px;
                    text-align: center;
                    transition: all 0.3s;
                    text-decoration: none;
                }

                .role-card:hover {
                    transform: translateY(-10px);
                    box-shadow: 0 24px 60px rgba(0, 0, 0, 0.6);
                }

                .role-card.farmer {
                    border-color: rgba(22, 163, 74, 0.3);
                }

                .role-card.buyer {
                    border-color: rgba(14, 165, 233, 0.3);
                }

                .role-card.admin {
                    border-color: rgba(245, 158, 11, 0.3);
                }

                .role-card.farmer:hover {
                    box-shadow: 0 24px 60px rgba(22, 163, 74, 0.15);
                }

                .role-card.buyer:hover {
                    box-shadow: 0 24px 60px rgba(14, 165, 233, 0.15);
                }

                .role-card.admin:hover {
                    box-shadow: 0 24px 60px rgba(245, 158, 11, 0.15);
                }

                .role-icon {
                    font-size: 56px;
                    margin-bottom: 16px;
                    display: block;
                }

                .role-title {
                    font-size: 22px;
                    font-weight: 800;
                    color: #f0fdf4;
                    margin-bottom: 12px;
                }

                .role-desc {
                    font-size: 14px;
                    color: #9ca3af;
                    margin-bottom: 20px;
                    line-height: 1.6;
                }

                .role-btn {
                    display: inline-block;
                    padding: 10px 24px;
                    border-radius: 10px;
                    font-size: 13px;
                    font-weight: 700;
                    text-decoration: none;
                    transition: all 0.2s;
                }

                .role-card.farmer .role-btn {
                    background: rgba(22, 163, 74, 0.2);
                    color: #22c55e;
                    border: 1px solid rgba(22, 163, 74, 0.3);
                }

                .role-card.buyer .role-btn {
                    background: rgba(14, 165, 233, 0.2);
                    color: #7dd3fc;
                    border: 1px solid rgba(14, 165, 233, 0.3);
                }

                .role-card.admin .role-btn {
                    background: rgba(245, 158, 11, 0.2);
                    color: #fcd34d;
                    border: 1px solid rgba(245, 158, 11, 0.3);
                }

                .role-btn:hover {
                    transform: scale(1.05);
                }

                /* Advanced Hi-Tech Footer */
                .hi-tech-footer {
                    position: relative;
                    background: linear-gradient(180deg, rgba(5, 10, 5, 0.8), #050a05);
                    border-top: 1px solid rgba(22, 163, 74, 0.3);
                    padding: 80px 60px 20px;
                    overflow: hidden;
                    color: #9ca3af;
                }

                .hi-tech-footer::before {
                    content: '';
                    position: absolute;
                    top: 0;
                    left: 10%;
                    right: 10%;
                    height: 1px;
                    background: linear-gradient(90deg, transparent, #22c55e, transparent);
                    box-shadow: 0 0 20px 2px rgba(34, 197, 94, 0.6);
                }

                .footer-grid {
                    display: grid;
                    grid-template-columns: 2fr 1fr 1fr 1fr;
                    gap: 40px;
                    max-width: 1200px;
                    margin: 0 auto;
                    position: relative;
                    z-index: 10;
                }

                .footer-brand {
                    display: flex;
                    flex-direction: column;
                    gap: 16px;
                }

                .footer-brand h2 {
                    color: #f0fdf4;
                    font-size: 24px;
                    font-weight: 800;
                    display: flex;
                    align-items: center;
                    gap: 12px;
                }

                .footer-brand h2 span {
                    color: #22c55e;
                }

                .footer-brand p {
                    font-size: 14px;
                    line-height: 1.8;
                }

                .footer-heading {
                    color: #f0fdf4;
                    font-size: 16px;
                    font-weight: 700;
                    margin-bottom: 24px;
                    position: relative;
                    padding-bottom: 10px;
                }

                .footer-heading::after {
                    content: '';
                    position: absolute;
                    left: 0;
                    bottom: 0;
                    height: 2px;
                    width: 30px;
                    background: #22c55e;
                }

                .footer-links {
                    display: flex;
                    flex-direction: column;
                    gap: 12px;
                }

                .footer-link {
                    color: #9ca3af;
                    text-decoration: none;
                    font-size: 14px;
                    transition: all 0.3s ease;
                    display: inline-flex;
                    align-items: center;
                    gap: 8px;
                }

                .footer-link:hover {
                    color: #22c55e;
                    transform: translateX(5px);
                }

                .footer-socials {
                    display: flex;
                    gap: 12px;
                    margin-top: 20px;
                }

                .social-icon {
                    width: 40px;
                    height: 40px;
                    border-radius: 50%;
                    background: rgba(22, 163, 74, 0.1);
                    border: 1px solid rgba(22, 163, 74, 0.2);
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    color: #22c55e;
                    font-size: 18px;
                    transition: all 0.3s;
                    text-decoration: none;
                }

                .social-icon:hover {
                    background: #22c55e;
                    color: #fff;
                    box-shadow: 0 0 20px rgba(34, 197, 94, 0.5);
                    transform: translateY(-3px);
                }

                .footer-bottom {
                    max-width: 1200px;
                    margin: 60px auto 0;
                    padding-top: 24px;
                    border-top: 1px solid rgba(255, 255, 255, 0.1);
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    font-size: 13px;
                    flex-wrap: wrap;
                    gap: 16px;
                }

                .footer-bottom-links {
                    display: flex;
                    gap: 24px;
                }

                .footer-bottom-links a {
                    color: #9ca3af;
                    text-decoration: none;
                    transition: color 0.3s;
                }

                .footer-bottom-links a:hover {
                    color: #22c55e;
                }

                /* cyber-grid background for footer */
                .footer-cyber-grid {
                    position: absolute;
                    inset: 0;
                    background-image:
                        linear-gradient(rgba(22, 163, 74, 0.03) 1px, transparent 1px),
                        linear-gradient(90deg, rgba(22, 163, 74, 0.03) 1px, transparent 1px);
                    background-size: 30px 30px;
                    opacity: 0.5;
                    z-index: 1;
                }

                @media (max-width: 900px) {
                    .footer-grid {
                        grid-template-columns: 1fr 1fr;
                    }
                }

                @media (max-width: 600px) {
                    .hi-tech-footer {
                        padding: 60px 24px 20px;
                    }

                    .footer-grid {
                        grid-template-columns: 1fr;
                    }

                    .footer-bottom {
                        flex-direction: column;
                        text-align: center;
                    }
                }

                @media (max-width: 768px) {
                    .navbar {
                        padding: 16px 24px;
                    }

                    .hero-content {
                        padding: 40px 24px;
                    }

                    .stats-banner {
                        padding: 24px;
                        gap: 24px;
                        flex-wrap: wrap;
                    }

                    .section {
                        padding: 50px 24px;
                    }

                    .roles-grid {
                        grid-template-columns: 1fr;
                    }

                    .features-grid {
                        grid-template-columns: 1fr;
                    }
                }

                /* RESPONSIVE HOME */
                @media (max-width: 992px) {
                    .navbar {
                        padding: 15px 30px;
                    }

                    .hero-content {
                        padding: 0 30px;
                    }
                }

                @media (max-width: 768px) {
                    .navbar {
                        padding: 15px 20px;
                    }

                    .nav-links {
                        display: none !important;
                    }

                    /* Hide regular links, maybe add a drawer later */
                    .mobile-nav-visible {
                        display: flex !important;
                    }

                    .hero-title {
                        font-size: 32px !important;
                    }

                    .hero-subtitle {
                        font-size: 16px !important;
                    }

                    .hero-actions {
                        flex-direction: column;
                        width: 100%;
                        gap: 12px;
                    }

                    .hero-actions .btn {
                        width: 100%;
                    }
                }

                @media (max-width: 480px) {
                    .navbar {
                        padding: 12px 15px;
                    }

                    .nav-brand-text {
                        display: none;
                    }
                }
            </style>
        </head>

        <body>

            <div class="hero">
                <div class="hero-bg"></div>
                <div class="hero-grid"></div>

                <!-- Navbar -->
                <nav class="navbar">
                    <a href="${pageContext.request.contextPath}/" class="nav-brand">
                        <div class="nav-brand-icon">🌾</div>
                        <div class="nav-brand-text">
                            <h2>Smart Farming</h2>
                            <span>Digital Agriculture Platform</span>
                        </div>
                    </a>

                    <div class="nav-links">
                        <a href="${pageContext.request.contextPath}/subscription" class="nav-link">Pricing</a>
                        <a href="#features" class="nav-link">Features</a>
                        <a href="#roles" class="nav-link">Get Started</a>
                        <a href="${pageContext.request.contextPath}/login" class="nav-btn outline">Login</a>
                        <a href="${pageContext.request.contextPath}/register" class="nav-btn">Register Free</a>
                    </div>
                </nav>

                <!-- Hero Content -->
                <div class="hero-content">
                    <div class="hero-text">
                        <div class="hero-badge">
                            🌱 Digital India Initiative &bull; AgriTech 2026
                        </div>
                        <h1 class="hero-title">
                            Transform Your Farm<br />
                            With <span class="highlight">Smart Technology</span>
                        </h1>
                        <p class="hero-subtitle">
                            India's most comprehensive digital agriculture platform — empowering farmers with AI crop
                            recommendations,
                            real-time market prices, disease detection, and direct buyer connections.
                        </p>
                        <div class="hero-cta">
                            <a href="${pageContext.request.contextPath}/register" class="cta-btn primary">
                                🚀 Start Farming Smart
                            </a>
                            <a href="${pageContext.request.contextPath}/login" class="cta-btn secondary">
                                🔑 Login to Dashboard
                            </a>
                        </div>
                    </div>
                </div>

                <!-- Stats Banner -->
                <div class="stats-banner">
                    <div class="stat-item">
                        <div class="num">50K+</div>
                        <div class="label">Active Farmers</div>
                    </div>
                    <div class="stat-item">
                        <div class="num">150+</div>
                        <div class="label">Crop Varieties</div>
                    </div>
                    <div class="stat-item">
                        <div class="num">24/7</div>
                        <div class="label">Market Updates</div>
                    </div>
                    <div class="stat-item">
                        <div class="num">30%</div>
                        <div class="label">Avg Income Boost</div>
                    </div>
                    <div class="stat-item">
                        <div class="num">6+</div>
                        <div class="label">Govt Schemes</div>
                    </div>
                </div>
            </div>

            <!-- Features Section -->
            <div class="section" id="features"
                style="background: linear-gradient(180deg, rgba(5, 10, 5, 0.4) 0%, rgba(10, 15, 10, 0.6) 100%); backdrop-filter: blur(4px);">
                <div class="section-center">
                    <div class="section-tag">Platform Features</div>
                    <h2 class="section-heading">Everything Farmers Need, In One Place</h2>
                    <p class="section-desc">Our unified platform brings together cutting-edge technology to help farmers
                        make better decisions, increase productivity, and improve income.</p>
                </div>

                <div class="features-grid">
                    <div class="feature-card">
                        <span class="feature-icon">🌱</span>
                        <h3 class="feature-title">AI Crop Recommendations</h3>
                        <p class="feature-desc">Get personalized crop suggestions based on your soil type, season, and
                            local climate conditions to maximize yield.</p>
                    </div>
                    <div class="feature-card">
                        <span class="feature-icon">📈</span>
                        <h3 class="feature-title">Real-Time Market Prices</h3>
                        <p class="feature-desc">Access live mandi prices from across India. Make informed selling
                            decisions and get the best price for your crops.</p>
                    </div>
                    <div class="feature-card">
                        <span class="feature-icon">🔬</span>
                        <h3 class="feature-title">Disease Detection</h3>
                        <p class="feature-desc">Upload plant images or describe symptoms to get instant diagnosis and
                            treatment recommendations from our expert system.</p>
                    </div>
                    <div class="feature-card">
                        <span class="feature-icon">🏛️</span>
                        <h3 class="feature-title">Government Schemes</h3>
                        <p class="feature-desc">Stay updated with PM-KISAN, PMFBY, KCC and all agricultural schemes.
                            Apply directly through our platform.</p>
                    </div>
                    <div class="feature-card">
                        <span class="feature-icon">🤝</span>
                        <h3 class="feature-title">Direct Buyer Connection</h3>
                        <p class="feature-desc">Sell directly to verified buyers. No middlemen, no commission. Get fair
                            prices and increase your profit margins.</p>
                    </div>
                    <div class="feature-card">
                        <span class="feature-icon">🎓</span>
                        <h3 class="feature-title">Learning Resources</h3>
                        <p class="feature-desc">Access curated agricultural videos, farming techniques, and educational
                            content to enhance your farming knowledge.</p>
                    </div>
                </div>
            </div>

            <!-- Roles Section -->
            <div class="section" id="roles" style="background: rgba(3, 7, 3, 0.5); backdrop-filter: blur(4px);">
                <div class="section-center">
                    <div class="section-tag">Get Started</div>
                    <h2 class="section-heading">Choose Your Role</h2>
                    <p class="section-desc">Register as a farmer, buyer, or admin and access your personalized dashboard
                        with all relevant tools.</p>
                </div>

                <div class="roles-grid">
                    <div class="role-card farmer">
                        <span class="role-icon">👨‍🌾</span>
                        <h3 class="role-title">Farmer</h3>
                        <p class="role-desc">Access crop recommendations, market prices, disease detection, government
                            schemes, and sell directly to buyers.</p>
                        <a href="${pageContext.request.contextPath}/register" class="role-btn">Register as Farmer →</a>
                    </div>
                    <div class="role-card buyer">
                        <span class="role-icon">🛒</span>
                        <h3 class="role-title">Buyer</h3>
                        <p class="role-desc">Browse fresh farm produce, contact farmers directly, check market prices,
                            and place purchase orders.</p>
                        <a href="${pageContext.request.contextPath}/register" class="role-btn">Register as Buyer →</a>
                    </div>
                    <div class="role-card admin">
                        <span class="role-icon">⚙️</span>
                        <h3 class="role-title">Admin</h3>
                        <p class="role-desc">Manage all platform operations, users, market data, schemes, and disease
                            query responses from one dashboard.</p>
                        <a href="${pageContext.request.contextPath}/login" class="role-btn">Admin Login →</a>
                    </div>
                </div>
            </div>

            <!-- Hi-Tech Footer -->
            <footer class="hi-tech-footer">
                <div class="footer-cyber-grid"></div>
                <div class="footer-grid">
                    <div class="footer-brand">
                        <h2>🌾 Smart Farming <span>Platform</span></h2>
                        <p>Empowering the futuristic farmer with AI-driven insights, live market data, and modern
                            disease detection tools. Bridging the gap between traditional agriculture and modern
                            technology.</p>
                        <div class="footer-socials">
                            <a href="https://twitter.com" target="_blank" class="social-icon">𝕏</a>
                            <a href="https://facebook.com" target="_blank" class="social-icon">f</a>
                            <a href="https://linkedin.com" target="_blank" class="social-icon">in</a>
                            <a href="https://youtube.com" target="_blank" class="social-icon">▶</a>
                        </div>
                    </div>

                    <div>
                        <h3 class="footer-heading">Quick Links</h3>
                        <div class="footer-links">
                            <a href="#features" class="footer-link">› Platform Features</a>
                            <a href="${pageContext.request.contextPath}/subscription" class="footer-link">› Premium
                                Plans</a>
                            <a href="#roles" class="footer-link">› Get Started</a>
                            <a href="${pageContext.request.contextPath}/login" class="footer-link">› Dashboard Login</a>
                            <a href="${pageContext.request.contextPath}/register" class="footer-link">› Create
                                Account</a>
                        </div>
                    </div>

                    <div>
                        <h3 class="footer-heading">Agri-Services</h3>
                        <div class="footer-links">
                            <a href="${pageContext.request.contextPath}/farmer/crop-recommendation"
                                class="footer-link">› AI
                                Crop Prediction</a>
                            <a href="${pageContext.request.contextPath}/farmer/market-prices" class="footer-link">› Live
                                Mandi Prices</a>
                            <a href="${pageContext.request.contextPath}/farmer/disease-detection" class="footer-link">›
                                Disease Diagnosis</a>
                            <a href="${pageContext.request.contextPath}/farmer/marketplace" class="footer-link">› Market
                                Listing</a>
                        </div>
                    </div>

                    <div>
                        <h3 class="footer-heading">Support & Info</h3>
                        <div class="footer-links">
                            <a href="${pageContext.request.contextPath}/help" class="footer-link">› Help
                                Center</a>
                            <a href="${pageContext.request.contextPath}/terms" class="footer-link">› Terms of
                                Service</a>
                            <a href="${pageContext.request.contextPath}/privacy" class="footer-link">› Privacy
                                Policy</a>
                            <a href="${pageContext.request.contextPath}/contact" class="footer-link">› Contact
                                Us</a>
                        </div>
                    </div>
                </div>

                <div class="footer-bottom">
                    <div>
                        &copy; 2026 Smart Farming &amp; Digital Agriculture Platform. All Rights Reserved.
                    </div>
                    <div class="footer-bottom-links">
                        <a href="#">Security</a>
                        <a href="#">API Documentation</a>
                        <a href="#">System Status <span style="color:#22c55e">●</span></a>
                    </div>
                </div>
            </footer>

            <script src="${pageContext.request.contextPath}/js/background-switcher.js"></script>

            <script src="${pageContext.request.contextPath}/js/i18n.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>