<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <title>Subscription Plans - AGROPLANTER</title>
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
            <link rel="icon"
                href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>💎</text></svg>" />
        </head>

        <body style="background-color: #020617; color: #f8fafc; font-family: 'Inter', sans-serif; overflow-x: hidden;">
            <nav
                style="padding: 20px 40px; border-bottom: 1px solid rgba(255, 255, 255, 0.05); display: flex; justify-content: space-between; align-items: center; background: rgba(15, 23, 42, 0.5); backdrop-filter: blur(20px); position: sticky; top: 0; z-index: 1000;">
                <style>
                    .brand-premium {
                        font-size: 28px;
                        font-weight: 900;
                        letter-spacing: -1.5px;
                        background: linear-gradient(135deg, #10b981 0%, #06b6d4 100%);
                        -webkit-background-clip: text;
                        background-clip: text;
                        -webkit-text-fill-color: transparent;
                        display: flex;
                        align-items: center;
                        gap: 10px;
                    }

                    .brand-icon-box {
                        width: 32px;
                        height: 32px;
                        background: linear-gradient(135deg, rgba(16, 185, 129, 0.2), rgba(6, 182, 212, 0.2));
                        border: 1px solid rgba(16, 185, 129, 0.3);
                        border-radius: 8px;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        font-size: 16px;
                        color: #10b981;
                    }
                </style>
                <a href="${pageContext.request.contextPath}/"
                    style="text-decoration: none; display: flex; align-items: center;">
                    <div class="brand-premium">
                        <div class="brand-icon-box">
                            <i class="fas fa-leaf"></i>
                        </div>
                        AGROPLANTER
                    </div>
                </a>
                <a href="${pageContext.request.contextPath}/" class="btn btn-outline-light rounded-pill px-4">← Return
                    to Command Center</a>
            </nav>

            <div class="pricing-hero"
                style="background: linear-gradient(180deg, rgba(2, 6, 23, 0.7) 0%, #020617 100%); border-bottom: none;">
                <div class="badge rounded-pill px-4 py-2 border mb-4"
                    style="background: rgba(139, 92, 246, 0.2); border-color: rgba(139, 92, 246, 0.4) !important; color: #8b5cf6 !important; font-weight: 800; font-size: 13px; letter-spacing: 1px;">
                    SUBSCRIPTION ECOSYSTEM V3.0
                </div>
                <h1 style="font-size: clamp(2.5rem, 8vw, 4rem); font-weight: 900; color: #fff; letter-spacing: -2px;">
                    UNLEASH <span style="color: #10b981;">STRATEGIC</span> POTENTIAL</h1>
                <p style="color: #94a3b8; max-width: 700px; margin: 0 auto; line-height: 1.6;">Activate mission-critical
                    intelligence modules tailored for your specific role in the agricultural supply chain.</p>
            </div>

            <div class="pricing-toggle" style="margin-bottom: 60px;">
                <button id="btn-farmer" class="toggle-btn active" onclick="switchPricing('farmer', this)">Farmer
                    Protocols</button>
                <button id="btn-buyer" class="toggle-btn" onclick="switchPricing('buyer', this)">Buyer
                    Protocols</button>
            </div>

            <c:set var="userRole" value="${not empty user ? user.role.toString() : 'GUEST'}" />

            <!-- Farmer Plans Container -->
            <div id="farmer-plans"
                class="pricing-grid plans-container ${userRole == 'FARMER' || userRole == 'GUEST' ? 'active' : ''}">
                <c:if test="${not empty user && userRole != 'FARMER'}">
                    <div style="grid-column: 1 / -1; margin-bottom: 2rem;">
                        <div class="alert"
                            style="background: rgba(59, 130, 246, 0.1); border: 1px solid rgba(59, 130, 246, 0.2); color: #60a5fa; border-radius: 12px; padding: 1rem 2rem; display: flex; align-items: center; gap: 12px; justify-content: center;">
                            <span style="font-size: 20px;">ℹ️</span>
                            <span>Showing <strong>Farmer Protocols</strong>. Accessing as <span
                                    class="badge bg-primary">${userRole}</span></span>
                        </div>
                    </div>
                </c:if>

                <!-- Farmer - Basic -->
                <div class="pricing-card"
                    style="background: rgba(30, 41, 59, 0.4); backdrop-filter: blur(10px); border: 1px solid rgba(255,255,255,0.05);">
                    <div
                        style="font-size: 12px; font-weight: 800; color: #10b981; margin-bottom: 10px; text-transform: uppercase; letter-spacing: 2px;">
                        Core Intelligence</div>
                    <h3 class="plan-name">BASIC NODE</h3>
                    <div class="plan-price" style="color: #fff;">FREE<span>/forever</span></div>
                    <ul class="plan-features">
                        <li>AI Disease Detection (5/mo)</li>
                        <li>Real-time Mandi Price Feed</li>
                        <li>Community Network Access</li>
                        <li class="disabled">Yield Prediction Ops</li>
                        <li class="disabled">Priority Sourcing Link</li>
                    </ul>
                    <a href="${userRole == 'GUEST' ? pageContext.request.contextPath.concat('/register') : '#'}"
                        class="btn-subscribe btn-subscribe-outline"
                        style="${userRole != 'GUEST' ? 'opacity: 0.5; cursor: default;' : ''}">
                        ${userRole == 'GUEST' ? 'INITIALIZE NODE' : 'CURRENT TIER'}
                    </a>
                </div>

                <!-- Farmer - Premium -->
                <div class="pricing-card premium" style="background: rgba(16, 185, 129, 0.05); border-color: #10b981;">
                    <div
                        style="font-size: 12px; font-weight: 800; color: #10b981; margin-bottom: 10px; text-transform: uppercase; letter-spacing: 2px;">
                        Strategic Edge</div>
                    <h3 class="plan-name">PRO COMMANDER</h3>
                    <div class="plan-price" style="color: #10b981;">₹499<span>/month</span></div>
                    <ul class="plan-features">
                        <li>Unlimited AI Diagnostics</li>
                        <li>Predictive Market Analytics</li>
                        <li>Priority 24/7 Intel Support</li>
                        <li>Elite Seller Verification</li>
                        <li class="disabled">Supply Chain API Access</li>
                    </ul>
                    <a href="${pageContext.request.contextPath}/payment?plan=Pro%20Commander&amount=499"
                        class="btn-subscribe btn-subscribe-filled">ACTIVATE COMMANDER</a>
                </div>

                <!-- Farmer - Enterprise -->
                <div class="pricing-card"
                    style="background: rgba(30, 41, 59, 0.4); border: 1px solid rgba(255,255,255,0.05);">
                    <div
                        style="font-size: 12px; font-weight: 800; color: #8b5cf6; margin-bottom: 10px; text-transform: uppercase; letter-spacing: 2px;">
                        Global Scale</div>
                    <h3 class="plan-name">QUANTUM HUB</h3>
                    <div class="plan-price" style="color: #8b5cf6;">₹1999<span>/month</span></div>
                    <ul class="plan-features">
                        <li>Full Supply Chain Telemetry</li>
                        <li>Direct B2B Integration APIs</li>
                        <li>Dedicated On-Site Expert</li>
                        <li>Global Export Compliance</li>
                        <li>Unlimited Marketplace Scale</li>
                    </ul>
                    <a href="${pageContext.request.contextPath}/contact"
                        class="btn-subscribe btn-subscribe-outline">ENLIST ENTERPRISE</a>
                </div>
            </div>

            <!-- Buyer Plans Container -->
            <div id="buyer-plans"
                class="pricing-grid plans-container ${userRole == 'BUYER' || userRole == 'B2B_BUYER' ? 'active' : ''}">
                <c:if test="${not empty user && userRole != 'BUYER' && userRole != 'B2B_BUYER'}">
                    <div style="grid-column: 1 / -1; margin-bottom: 2rem;">
                        <div class="alert"
                            style="background: rgba(14, 165, 233, 0.1); border: 1px solid rgba(14, 165, 233, 0.2); color: #38bdf8; border-radius: 12px; padding: 1rem 2rem; display: flex; align-items: center; gap: 12px; justify-content: center;">
                            <span style="font-size: 20px;">ℹ️</span>
                            <span>Showing <strong>Buyer Protocols</strong>. Accessing as <span
                                    class="badge bg-primary">${userRole}</span></span>
                        </div>
                    </div>
                </c:if>

                <!-- Buyer - Basic -->
                <div class="pricing-card"
                    style="background: rgba(30, 41, 59, 0.4); border: 1px solid rgba(255,255,255,0.05);">
                    <div
                        style="font-size: 12px; font-weight: 800; color: #0ea5e9; margin-bottom: 10px; text-transform: uppercase; letter-spacing: 2px;">
                        Operational Access</div>
                    <h3 class="plan-name">LOCAL TRADER</h3>
                    <div class="plan-price" style="color: #fff;">FREE<span>/forever</span></div>
                    <ul class="plan-features">
                        <li>Browse Accredited Farms</li>
                        <li>Direct Secure Messaging</li>
                        <li>Standard Escrow Protection</li>
                        <li class="disabled">Mass procurement tools</li>
                        <li class="disabled">Logistics Hub access</li>
                    </ul>
                    <a href="${userRole == 'GUEST' ? pageContext.request.contextPath.concat('/register') : '#'}"
                        class="btn-subscribe btn-subscribe-outline"
                        style="${userRole != 'GUEST' ? 'opacity: 0.5; cursor: default;' : ''}">
                        ${userRole == 'GUEST' ? 'DEPLOY ACCESS' : 'CURRENT TIER'}
                    </a>
                </div>

                <!-- Buyer - Pro -->
                <div class="pricing-card premium" style="background: rgba(14, 165, 233, 0.05); border-color: #0ea5e9;">
                    <div
                        style="font-size: 12px; font-weight: 800; color: #0ea5e9; margin-bottom: 10px; text-transform: uppercase; letter-spacing: 2px;">
                        Market Edge</div>
                    <h3 class="plan-name">PRO SOURCE</h3>
                    <div class="plan-price" style="color: #0ea5e9;">₹999<span>/month</span></div>
                    <ul class="plan-features">
                        <li>Early Harvest Notifications</li>
                        <li>Bulk Procurement Assistant</li>
                        <li>Verified Supplier Badges</li>
                        <li>Market Volatility Analytics</li>
                        <li class="disabled">Automated Logistics Fleet</li>
                    </ul>
                    <a href="${pageContext.request.contextPath}/payment?plan=Pro%20Source&amount=999"
                        class="btn-subscribe btn-subscribe-filled"
                        style="background: linear-gradient(135deg, #0ea5e9, #0284c7); box-shadow: 0 4px 15px rgba(14, 165, 233, 0.3);">ACTIVATE
                        SOURCE</a>
                </div>

                <!-- Buyer - Enterprise -->
                <div class="pricing-card"
                    style="background: rgba(30, 41, 59, 0.4); border: 1px solid rgba(255,255,255,0.05);">
                    <div
                        style="font-size: 12px; font-weight: 800; color: #8b5cf6; margin-bottom: 10px; text-transform: uppercase; letter-spacing: 2px;">
                        Global Sourcing</div>
                    <h3 class="plan-name">ENTERPRISE HUB</h3>
                    <div class="plan-price" style="color: #8b5cf6;">₹4999<span>/month</span></div>
                    <ul class="plan-features">
                        <li>Full Sourcing API Suite</li>
                        <li>Dedicated Procurement Mgr</li>
                        <li>Global Logistics Network</li>
                        <li>Smart Contract Automation</li>
                        <li>Custom Reporting & Audit</li>
                    </ul>
                    <a href="${pageContext.request.contextPath}/contact" class="btn-subscribe btn-subscribe-outline"
                        style="border-color: #8b5cf6; color: #8b5cf6;">CONTACT ARCHITECT</a>
                </div>
            </div>

            <script>
                function switchPricing(type, btn) {
                    if (!btn) return;
                    // Update buttons
                    document.querySelectorAll('.toggle-btn').forEach(b => b.classList.remove('active'));
                    btn.classList.add('active');

                    // Update grids
                    document.querySelectorAll('.plans-container').forEach(c => c.classList.remove('active'));
                    const target = document.getElementById(type + '-plans');
                    if (target) target.classList.add('active');
                }

                // Auto-set role if logged in but somehow on guest view
                window.onload = function () {
                    const role = '${userRole}';
                    if (role === 'BUYER' || role === 'B2B_BUYER') {
                        switchPricing('buyer', document.getElementById('btn-buyer'));
                    } else if (role === 'FARMER') {
                        switchPricing('farmer', document.getElementById('btn-farmer'));
                    }
                };
            </script>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>


