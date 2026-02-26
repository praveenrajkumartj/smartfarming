<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <title>Subscription Plans | Smart Farming Platform</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
            <style>
                .pricing-hero {
                    background: linear-gradient(rgba(10, 15, 10, 0.8), rgba(10, 15, 10, 0.9)), url('https://images.unsplash.com/photo-1592982537447-6f2bfd2b781a?q=80&w=2070') center/cover;
                    padding: 100px 20px;
                    text-align: center;
                    border-bottom: 1px solid var(--border);
                }

                .pricing-hero h1 {
                    font-size: 48px;
                    color: #22c55e;
                    margin-bottom: 20px;
                }

                .pricing-hero p {
                    font-size: 18px;
                    color: #d1d5db;
                    max-width: 600px;
                    margin: 0 auto;
                }

                .pricing-grid {
                    display: grid;
                    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
                    gap: 30px;
                    max-width: 1200px;
                    margin: 0 auto 80px;
                    padding: 0 20px;
                    position: relative;
                    z-index: 10;
                }

                .pricing-card {
                    background: var(--surface);
                    border: 1px solid var(--border);
                    border-radius: 16px;
                    padding: 40px 30px;
                    transition: transform 0.3s ease, box-shadow 0.3s ease;
                    display: flex;
                    flex-direction: column;
                    position: relative;
                    overflow: hidden;
                }

                .pricing-card:hover {
                    transform: translateY(-10px);
                    box-shadow: 0 10px 40px rgba(0, 0, 0, 0.3);
                    border-color: rgba(34, 197, 94, 0.4);
                }

                .pricing-card.premium {
                    border-color: #22c55e;
                    box-shadow: 0 0 30px rgba(34, 197, 94, 0.1);
                }

                .pricing-card.premium::before {
                    content: 'Most Popular';
                    position: absolute;
                    top: 20px;
                    right: -35px;
                    background: #22c55e;
                    color: white;
                    padding: 5px 40px;
                    font-size: 12px;
                    font-weight: bold;
                    transform: rotate(45deg);
                }

                .plan-name {
                    font-size: 24px;
                    color: #f0fdf4;
                    margin-bottom: 15px;
                    font-weight: 700;
                }

                .plan-price {
                    font-size: 48px;
                    color: #22c55e;
                    font-weight: 800;
                    margin-bottom: 20px;
                    display: flex;
                    align-items: baseline;
                }

                .plan-price span {
                    font-size: 16px;
                    color: #9ca3af;
                    font-weight: 400;
                    margin-left: 5px;
                }

                .plan-features {
                    list-style: none;
                    padding: 0;
                    margin: 0 0 30px 0;
                    flex-grow: 1;
                }

                .plan-features li {
                    color: #d1d5db;
                    margin-bottom: 15px;
                    display: flex;
                    align-items: center;
                    gap: 10px;
                }

                .plan-features li::before {
                    content: '✓';
                    color: #22c55e;
                    font-weight: bold;
                }

                .plan-features li.disabled {
                    color: #6b7280;
                }

                .plan-features li.disabled::before {
                    content: '✕';
                    color: #ef4444;
                }

                .btn-subscribe {
                    display: block;
                    text-align: center;
                    padding: 15px;
                    border-radius: 8px;
                    font-weight: 600;
                    text-decoration: none;
                    transition: all 0.3s ease;
                    width: 100%;
                }

                .btn-subscribe-outline {
                    background: transparent;
                    color: #22c55e;
                    border: 2px solid #22c55e;
                }

                .btn-subscribe-outline:hover {
                    background: rgba(34, 197, 94, 0.1);
                }

                .btn-subscribe-filled {
                    background: linear-gradient(135deg, #22c55e, #16a34a);
                    color: white;
                    border: none;
                    box-shadow: 0 4px 15px rgba(34, 197, 94, 0.3);
                }

                .btn-subscribe-filled:hover {
                    transform: translateY(-2px);
                    box-shadow: 0 6px 20px rgba(34, 197, 94, 0.4);
                }

                /* Toggle Switch */
                .pricing-toggle {
                    display: flex;
                    justify-content: center;
                    gap: 15px;
                    margin-top: -25px;
                    margin-bottom: 50px;
                    position: relative;
                    z-index: 20;
                }

                .toggle-btn {
                    background: rgba(255, 255, 255, 0.05);
                    border: 1px solid rgba(255, 255, 255, 0.2);
                    color: #d1d5db;
                    padding: 12px 30px;
                    border-radius: 50px;
                    font-size: 16px;
                    font-weight: 600;
                    cursor: pointer;
                    transition: all 0.3s ease;
                }

                .toggle-btn.active {
                    background: #22c55e;
                    color: white;
                    border-color: #22c55e;
                    box-shadow: 0 4px 15px rgba(34, 197, 94, 0.3);
                }

                .plans-container {
                    display: none;
                }

                .plans-container.active {
                    display: grid;
                    animation: fadeIn 0.4s ease;
                }

                @keyframes fadeIn {
                    from {
                        opacity: 0;
                        transform: translateY(10px);
                    }

                    to {
                        opacity: 1;
                        transform: translateY(0);
                    }
                }
            </style>
            <link rel="icon" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>💎</text></svg>" />
            </head>

        <body style="background-color: var(--bg-dark); color: var(--text-light); font-family: 'Inter', sans-serif;">
            <nav
                style="padding: 20px 40px; border-bottom: 1px solid var(--border); display: flex; justify-content: space-between; align-items: center; background: rgba(10, 15, 10, 0.9); backdrop-filter: blur(10px); position: sticky; top: 0; z-index: 100;">
                <a href="${pageContext.request.contextPath}/"
                    style="text-decoration: none; display: flex; align-items: center; gap: 10px;">
                    <span style="font-size: 24px;">🌾</span>
                    <span style="font-size: 20px; font-weight: 800; color: #fff;">Smart <span
                            style="color: #22c55e;">Farming</span></span>
                </a>
                <a href="${pageContext.request.contextPath}/" class="btn btn-secondary">← Back to Home</a>
            </nav>

            <div class="pricing-hero">
                <h1>Choose Your Farming Plan</h1>
                <p>Unlock powerful AI insights, priority marketplace listings, and expert diagnostics tailored to scale
                    your agricultural business.</p>
            </div>

            <div class="pricing-toggle">
                <button class="toggle-btn active" onclick="switchPricing('farmer', this)">For Farmers</button>
                <button class="toggle-btn" onclick="switchPricing('buyer', this)">For Buyers</button>
            </div>

            <!-- Farmer Plans -->
            <div id="farmer-plans" class="pricing-grid plans-container active">
                <!-- Basic Plan -->
                <div class="pricing-card">
                    <h3 class="plan-name">Basic Seed</h3>
                    <div class="plan-price">Free<span>/forever</span></div>
                    <ul class="plan-features">
                        <li>Basic AI Disease Detection</li>
                        <li>View Daily Mandi Prices</li>
                        <li>Standard Support (48h)</li>
                        <li class="disabled">Priority Marketplace Listings</li>
                        <li class="disabled">Expert Human Agronomist Review</li>
                        <li class="disabled">Weather & Yield Forecasting</li>
                    </ul>
                    <a href="${pageContext.request.contextPath}/register"
                        class="btn-subscribe btn-subscribe-outline">Get Started</a>
                </div>

                <!-- Premium Plan -->
                <div class="pricing-card premium">
                    <h3 class="plan-name">⭐ Smart Harvester</h3>
                    <div class="plan-price">₹499<span>/month</span></div>
                    <ul class="plan-features">
                        <li>Unlimited AI Disease Detection</li>
                        <li>Real-Time Mandi Price Alerts</li>
                        <li>Priority Support (24h)</li>
                        <li>Priority Marketplace Listings</li>
                        <li>Expert Human Agronomist Review</li>
                        <li class="disabled">Custom Crop Strategy APIs</li>
                    </ul>
                    <a href="${pageContext.request.contextPath}/payment?plan=Smart%20Harvester&amount=499"
                        class="btn-subscribe btn-subscribe-filled">Subscribe Now</a>
                </div>

                <!-- Enterprise Plan -->
                <div class="pricing-card">
                    <h3 class="plan-name">Agri Corporate</h3>
                    <div class="plan-price">₹1999<span>/month</span></div>
                    <ul class="plan-features">
                        <li>Everything in Smart Harvester</li>
                        <li>API Access for Supply Chain</li>
                        <li>Dedicated Account Manager (1h)</li>
                        <li>Unlimited Marketplace Listings</li>
                        <li>Expert On-site Consultation (Yearly)</li>
                        <li>Custom Crop Strategy APIs</li>
                    </ul>
                    <a href="${pageContext.request.contextPath}/payment?plan=Agri%20Corporate&amount=1999"
                        class="btn-subscribe btn-subscribe-outline">Subscribe Now</a>
                </div>
            </div>

            <!-- Buyer Plans -->
            <div id="buyer-plans" class="pricing-grid plans-container">
                <!-- Basic Buyer Plan -->
                <div class="pricing-card">
                    <h3 class="plan-name">Local Buyer</h3>
                    <div class="plan-price">Free<span>/forever</span></div>
                    <ul class="plan-features">
                        <li>Browse Marketplace Listings</li>
                        <li>💬 Contact Farmers Directly</li>
                        <li>Standard Support (48h)</li>
                        <li class="disabled">Early Access to Fresh Yields</li>
                        <li class="disabled">Bulk Purchasing Assistant</li>
                        <li class="disabled">Supply Chain APIs</li>
                    </ul>
                    <a href="${pageContext.request.contextPath}/register"
                        class="btn-subscribe btn-subscribe-outline">Get Started</a>
                </div>

                <!-- Premium Buyer Plan -->
                <div class="pricing-card premium">
                    <h3 class="plan-name">Pro Trader</h3>
                    <div class="plan-price">₹999<span>/month</span></div>
                    <ul class="plan-features">
                        <li>Early Access to Fresh Yields</li>
                        <li>Bulk Purchasing Assistant & Escrow</li>
                        <li>Priority Support (24h)</li>
                        <li>Verified Farmer Matchmaking</li>
                        <li>Advanced Price Trend Analytics</li>
                        <li class="disabled">Supply Chain APIs</li>
                    </ul>
                    <a href="${pageContext.request.contextPath}/payment?plan=Pro%20Trader&amount=999"
                        class="btn-subscribe btn-subscribe-filled">Subscribe Now</a>
                </div>

                <!-- Enterprise Buyer Plan -->
                <div class="pricing-card">
                    <h3 class="plan-name">Enterprise Sourcing</h3>
                    <div class="plan-price">₹4999<span>/month</span></div>
                    <ul class="plan-features">
                        <li>Everything in Pro Trader</li>
                        <li>Direct Supply Chain APIs</li>
                        <li>Dedicated Sourcing Manager</li>
                        <li>Automated Contract Generation</li>
                        <li>Custom Procurement Reports</li>
                        <li>Logistics & Transport Assistance</li>
                    </ul>
                    <a href="${pageContext.request.contextPath}/payment?plan=Enterprise%20Sourcing&amount=4999"
                        class="btn-subscribe btn-subscribe-outline">Subscribe Now</a>
                </div>
            </div>

            <script>
                function switchPricing(type, btn) {
                    // Update buttons
                    document.querySelectorAll('.toggle-btn').forEach(b => b.classList.remove('active'));
                    btn.classList.add('active');

                    // Update grids
                    document.querySelectorAll('.plans-container').forEach(c => c.classList.remove('active'));
                    document.getElementById(type + '-plans').classList.add('active');
                }
            </script>
        
<script src="${pageContext.request.contextPath}/js/i18n.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

        </html>
