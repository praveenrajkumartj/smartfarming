<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>🐍 Venomous Defense - AGROPLANTER</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/voice-assistant.css" />
                <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800;900&display=swap"
                    rel="stylesheet">
                <link rel="icon"
                    href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🐍</text></svg>" />
                <script>
                    window.AgroplanterUser = "${user.id}";
                    window.AgroplanterUserFull = "${user.fullName}";
                    window.AgroplanterRole = "${user.role}";
                </script>
                <style>
                    .safety-hero {
                        background: linear-gradient(135deg, rgba(245, 158, 11, 0.1), rgba(239, 68, 68, 0.1));
                        border: 1px solid rgba(255, 255, 255, 0.05);
                        border-radius: 40px;
                        padding: 60px;
                        margin-bottom: 40px;
                        backdrop-filter: blur(20px);
                    }

                    .protocol-node {
                        background: rgba(15, 23, 42, 0.4);
                        border: 1px solid rgba(255, 255, 255, 0.05);
                        border-radius: 24px;
                        padding: 30px;
                        margin-bottom: 25px;
                        backdrop-filter: blur(20px);
                    }

                    .node-digit {
                        width: 45px;
                        height: 45px;
                        background: rgba(16, 185, 129, 0.1);
                        color: #10b981;
                        border-radius: 14px;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        font-weight: 900;
                        font-size: 1.2rem;
                        border: 1px solid rgba(16, 185, 129, 0.2);
                        flex-shrink: 0;
                    }

                    .list-box {
                        border-radius: 24px;
                        padding: 30px;
                        height: 100%;
                        backdrop-filter: blur(20px);
                    }

                    .do-box {
                        background: rgba(16, 185, 129, 0.05);
                        border: 1px solid rgba(16, 185, 129, 0.1);
                    }

                    .dont-box {
                        background: rgba(239, 68, 68, 0.05);
                        border: 1px solid rgba(239, 68, 68, 0.1);
                    }

                    .snake-entry {
                        display: flex;
                        align-items: center;
                        gap: 20px;
                        padding: 20px;
                        background: rgba(255, 255, 255, 0.02);
                        border-radius: 20px;
                        margin-bottom: 15px;
                        border: 1px solid rgba(255, 255, 255, 0.05);
                        transition: 0.3s;
                    }

                    .snake-entry:hover {
                        border-color: rgba(245, 158, 11, 0.3);
                        background: rgba(255, 255, 255, 0.05);
                    }

                    .gear-pill {
                        padding: 10px 20px;
                        background: rgba(16, 185, 129, 0.05);
                        border: 1px solid rgba(16, 185, 129, 0.1);
                        border-radius: 12px;
                        font-size: 11px;
                        font-weight: 800;
                        color: #10b981;
                        text-align: center;
                    }
                </style>
            </head>

            <body>
                <div class="dashboard-scene"></div>
                <div class="dashboard-layout">
                    <aside class="sidebar sidebar-premium" id="sidebar">
                        <div class="sidebar-brand px-4 py-4"
                            style="border-bottom: 1px solid rgba(255,255,255,0.05); cursor: pointer;"
                            onclick="window.location.href='${pageContext.request.contextPath}/'">
                            <div class="brand-premium" style="font-size: 20px;">
                                <div class="brand-icon-box"><i class="fas fa-leaf"></i></div>
                                <div class="brand-text">
                                    <h3 class="brand-premium m-0" style="font-size: 20px;">AGROPLANTER</h3>
                                    <span
                                        style="font-size: 10px; color: #94a3b8; font-weight: 800; letter-spacing: 1px;">FARMER
                                        NODE V3</span>
                                </div>
                            </div>
                        </div>
                        <nav class="sidebar-nav px-3 py-4">
                            <div class="nav-section-title px-2 mb-2"
                                style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">
                                STRATEGIC CORE</div>
                            <a href="${pageContext.request.contextPath}/farmer/dashboard"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">📊</span> Command Center</a>
                            <a href="${pageContext.request.contextPath}/farmer/crop-recommendation"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">🌱</span> Strategic Intel</a>
                            <a href="${pageContext.request.contextPath}/farmer/disease-detection"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">🔬</span> Bio-Diagnostics</a>
                            <a href="${pageContext.request.contextPath}/clinic/farmer/dashboard"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">🌿</span> Plant Clinic</a>

                            <div class="nav-section-title px-2 mt-4 mb-2"
                                style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">MARKET
                                OPS</div>
                            <a href="${pageContext.request.contextPath}/farmer/marketplace"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">🛍️</span> Global Market</a>
                            <a href="${pageContext.request.contextPath}/farmer/orders"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">📈</span> Trade Orders</a>
                            <a href="${pageContext.request.contextPath}/farmer/equipment-rental"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">🚜</span> Agri-Uber</a>

                            <div class="nav-section-title px-2 mt-4 mb-2"
                                style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">
                                INTELLIGENCE</div>
                            <a href="${pageContext.request.contextPath}/farmer/weather"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">⛈️</span> Weather Intel</a>
                            <a href="${pageContext.request.contextPath}/farmer/market-prices"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">📊</span> Live Mandi</a>
                            <a href="${pageContext.request.contextPath}/farmer/schemes"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">🏛️</span> Institutional</a>
                            <a href="${pageContext.request.contextPath}/farmer/learning"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">🎓</span> Agri-Academy</a>
                            <a href="${pageContext.request.contextPath}/farmer/mentors"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">👨‍🏫</span> Expert Panel</a>

                            <div class="nav-section-title px-2 mt-4 mb-2"
                                style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">
                                PROFESSIONAL</div>
                            <c:choose>
                                <c:when test="${user.role == 'MENTOR'}">
                                    <a href="${pageContext.request.contextPath}/mentor/dashboard"
                                        class="sidebar-nav-item mb-2" style="color: #fbbf24;"><span
                                            class="nav-icon">🎓</span> Advisor Workspace</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="${pageContext.request.contextPath}/mentor/become"
                                        class="sidebar-nav-item mb-2" style="color: #fbbf24;"><span
                                            class="nav-icon">🌟</span> Become Advisor</a>
                                </c:otherwise>
                            </c:choose>

                            <div class="nav-section-title px-2 mt-4 mb-2"
                                style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">FINANCE
                                & SAFETY</div>
                            <a href="${pageContext.request.contextPath}/farmer/finance"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">💰</span> Capital Hub</a>
                            <a href="${pageContext.request.contextPath}/farmer/safety-hub"
                                class="sidebar-nav-item active mb-2"><span class="nav-icon">🛡️</span> Safety HQ</a>

                            <div class="nav-section-title px-2 mt-4 mb-2"
                                style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">ACCOUNT
                                OPS</div>
                            <a href="${pageContext.request.contextPath}/farmer/profile"
                                class="sidebar-nav-item mb-2"><span class="nav-icon" style="color: #8b5cf6;">👤</span>
                                Profile Node</a>
                            <a href="${pageContext.request.contextPath}/chat" class="sidebar-nav-item mb-2"><span
                                    class="nav-icon">💬</span> Message Core</a>

                            <div class="mt-auto px-2">
                                <a href="${pageContext.request.contextPath}/logout"
                                    class="sidebar-nav-item text-danger mt-4" style="border-radius: 12px;"><span
                                        class="nav-icon">🚪</span> Terminate Session</a>
                            </div>
                        </nav>
                    </aside>

                    <main class="main-content">
                        <header class="top-nav">
                            <div class="top-nav-left d-flex align-items-center gap-3">
                                <div class="hamburger" onclick="toggleSidebar()">
                                    <span></span><span></span><span></span>
                                </div>
                                <div class="page-title">
                                    <h1 class="m-0 fw-900 text-white"
                                        style="font-size: 2.2rem; letter-spacing: -1.5px;">
                                        <span style="color: #fbbf24;">🐍</span> Venomous Defense
                                    </h1>
                                    <span class="v3-page-subtitle text-success">
                                        📡 HERPETOLOGICAL PROTOCOLS ACTIVE | EMERGENCY RESPONSE NODES SYNCED
                                    </span>
                                </div>
                            </div>
                            <div class="top-nav-right">
                                <a href="${pageContext.request.contextPath}/farmer/safety-hub"
                                    class="btn btn-quantum px-4" style="font-size: 11px;">BACK TO HUB</a>
                            </div>
                        </header>

                        <div class="page-body px-5 py-5">
                            <div class="safety-hero mb-5">
                                <div class="badge bg-warning bg-opacity-10 text-warning fw-900 px-3 py-1 mb-3"
                                    style="font-size: 10px; letter-spacing: 1.5px; border: 1px solid rgba(245, 158, 11, 0.2);">
                                    CRITICAL FIRST-AID V3</div>
                                <h2 class="text-white fw-900" style="font-size: 3.5rem; letter-spacing: -2px;">Venomous
                                    Bite Response &<br>Interaction Protocols</h2>
                                <p class="text-white-50 mt-3 fs-5">Immediate tactical action for life-preservation and
                                    physiological stabilization.</p>
                            </div>

                            <div class="row g-5">
                                <div class="col-lg-8">
                                    <span class="trust-label uppercase mb-4 d-block">🌓 IMMEDIATE RESPONSE
                                        SEQUENCE</span>

                                    <div class="protocol-node d-flex gap-4">
                                        <div class="node-digit">01</div>
                                        <div>
                                            <h5 class="text-white fw-900">Physiological Immobilization</h5>
                                            <p class="text-white-50 small m-0">Maintain the affected limb BELOW HEART
                                                LEVEL. Deploy rigid splints to neutralize muscular movement, preventing
                                                venom-drift.</p>
                                        </div>
                                    </div>

                                    <div class="protocol-node d-flex gap-4">
                                        <div class="node-digit">02</div>
                                        <div>
                                            <h5 class="text-white fw-900">Constriction Removal</h5>
                                            <p class="text-white-50 small m-0">Terminate all circulatory restrictors
                                                (jewelry, footwear, watches) before inflammatory swelling initiates.</p>
                                        </div>
                                    </div>

                                    <div class="protocol-node d-flex gap-4">
                                        <div class="node-digit">03</div>
                                        <div>
                                            <h5 class="text-white fw-900">Sanitation & Intelligence</h5>
                                            <p class="text-white-50 small m-0">Gently cleanse the zone with static
                                                fluid. Document the actor (snake photo) from safe distance for clinical
                                                assessment.</p>
                                        </div>
                                    </div>

                                    <div class="protocol-node d-flex gap-4"
                                        style="border-color: rgba(239, 68, 68, 0.2);">
                                        <div class="node-digit"
                                            style="background: rgba(239, 68, 68, 0.1); color: #ef4444; border-color: rgba(239, 68, 68, 0.2);">
                                            04</div>
                                        <div>
                                            <h5 class="text-danger fw-900">EMERGENCY EVACUATION</h5>
                                            <p class="text-white-50 small m-0">Proceed immediately to the nearest
                                                Government Hospital for Anti-Snake Venom (ASV). Avoid traditional
                                                healers.</p>
                                        </div>
                                    </div>

                                    <div class="row g-4 mt-2">
                                        <div class="col-md-6">
                                            <div class="list-box do-box">
                                                <h6 class="text-success fw-900 uppercase mb-3">✅ Tactical DO's</h6>
                                                <ul class="text-white-50 small" style="list-style: none; padding: 0;">
                                                    <li class="mb-2">Maintain absolute stillness.</li>
                                                    <li class="mb-2">Keep the wound dry.</li>
                                                    <li class="mb-2">Log exact bite timestamp.</li>
                                                    <li>Initialize 108 Emergency Transit.</li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="list-box dont-box">
                                                <h6 class="text-danger fw-900 uppercase mb-3">❌ Tactical DON'Ts</h6>
                                                <ul class="text-white-50 small" style="list-style: none; padding: 0;">
                                                    <li class="mb-2">DO NOT incise or bleed wound.</li>
                                                    <li class="mb-2">DO NOT attempt suction protocols.</li>
                                                    <li class="mb-2">DO NOT apply ice or electrical pulses.</li>
                                                    <li>DO NOT use tight tourniquets.</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-4">
                                    <span class="trust-label uppercase mb-4 d-block" style="color: #10b981;">🛡️
                                        PREVENTION PROTOCOLS</span>
                                    <div class="protocol-node mb-5" style="border-color: rgba(16, 185, 129, 0.2);">
                                        <div class="row g-3">
                                            <div class="col-6">
                                                <div class="gear-pill">GUMBOOTS</div>
                                            </div>
                                            <div class="col-6">
                                                <div class="gear-pill">TACTICAL STICK</div>
                                            </div>
                                            <div class="col-6">
                                                <div class="gear-pill">HI-LUMEN TORCH</div>
                                            </div>
                                            <div class="col-6">
                                                <div class="gear-pill">PERIMETER CLEAR</div>
                                            </div>
                                        </div>
                                    </div>

                                    <span class="trust-label uppercase mb-4 d-block" style="color: #fbbf24;">🐍 LOCAL
                                        VENOMOUS PROFILES</span>
                                    <div class="mb-0">
                                        <div class="snake-entry">
                                            <span style="font-size: 2rem;">🐍</span>
                                            <div>
                                                <h6 class="text-white fw-900 small mb-1">Russell's Viper</h6>
                                                <p class="text-white-50 x-small m-0">Chain-pattern circles, high
                                                    aggression, hemotoxic.</p>
                                            </div>
                                        </div>
                                        <div class="snake-entry">
                                            <span style="font-size: 2rem;">🔥</span>
                                            <div>
                                                <h6 class="text-white fw-900 small mb-1">King Cobra</h6>
                                                <p class="text-white-50 x-small m-0">Expanding hood, high neurotoxicity,
                                                    tactical torque.</p>
                                            </div>
                                        </div>
                                        <div class="snake-entry">
                                            <span style="font-size: 2rem;">🌌</span>
                                            <div>
                                                <h6 class="text-white fw-900 small mb-1">Common Krait</h6>
                                                <p class="text-white-50 x-small m-0">Nocturnal, white cross-bars, potent
                                                    neurotoxin.</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </main>
                </div>

                <script src="${pageContext.request.contextPath}/js/background-switcher.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                <script>
                    function toggleSidebar() { document.getElementById('sidebar').classList.toggle('open'); }
                </script>
            </body>

            </html>





