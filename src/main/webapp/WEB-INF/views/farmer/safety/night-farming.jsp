<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>🌙 Lunar Shift Safety - AGROPLANTER</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/voice-assistant.css" />
                <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800;900&display=swap"
                    rel="stylesheet">
                <link rel="icon"
                    href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🌙</text></svg>" />
                <script>
                    window.AgroplanterUser = "${user.id}";
                    window.AgroplanterUserFull = "${user.fullName}";
                    window.AgroplanterRole = "${user.role}";
                </script>
                <style>
                    .safety-hero {
                        background: linear-gradient(135deg, rgba(30, 41, 59, 0.4), rgba(15, 23, 42, 0.6));
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
                        transition: 0.3s;
                    }

                    .protocol-node:hover {
                        border-color: rgba(59, 130, 246, 0.2);
                    }

                    .node-icon-large {
                        font-size: 2.5rem;
                        margin-bottom: 20px;
                        display: block;
                    }

                    .check-in-box {
                        background: rgba(139, 92, 246, 0.05);
                        border: 1px solid rgba(139, 92, 246, 0.1);
                        border-radius: 24px;
                        padding: 35px;
                    }

                    .tactical-pill {
                        padding: 10px 20px;
                        background: rgba(255, 255, 255, 0.02);
                        border: 1px solid rgba(255, 255, 255, 0.05);
                        border-radius: 12px;
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
                                        <span style="color: #3b82f6;">🌙</span> Lunar Shift Safety
                                    </h1>
                                    <span class="v3-page-subtitle text-success">
                                        📡 LOW-LIGHT OPERATIONAL STEWARDSHIP ACTIVE | ECO-MONITORING ENGAGED
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
                                <div class="badge bg-primary bg-opacity-10 text-primary fw-900 px-3 py-1 mb-3"
                                    style="font-size: 10px; letter-spacing: 1.5px; border: 1px solid rgba(59, 130, 246, 0.2);">
                                    NOCTURNAL STANDARDS</div>
                                <h2 class="text-white fw-900" style="font-size: 3.5rem; letter-spacing: -2px;">Safe
                                    Night Farming &<br>Wildlife Awareness</h2>
                                <p class="text-white-50 mt-3 fs-5">Advanced illumination strategies, solo-work check-in
                                    protocols, and ecological caution.</p>
                            </div>

                            <div class="row g-5">
                                <div class="col-lg-8">
                                    <span class="trust-label uppercase mb-4 d-block">🔦 ILLUMINATION & GEAR
                                        ARCHITECTURE</span>
                                    <div class="row g-4 mb-5">
                                        <div class="col-md-6">
                                            <div class="protocol-node">
                                                <span class="node-icon-large">🔦</span>
                                                <h5 class="text-white fw-900">Dual-Source Lighting</h5>
                                                <p class="text-white-50 small m-0">Redundant lighting is mandatory.
                                                    Carry a high-lumen headlamp (primary) and a tactical hand torch
                                                    (auxiliary).</p>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="protocol-node">
                                                <span class="node-icon-large">🦺</span>
                                                <h5 class="text-white fw-900">High-Visibility Envelopes</h5>
                                                <p class="text-white-50 small m-0">Utilize reflective apparel to ensure
                                                    visibility to field machinery and logistic nodes during low-light
                                                    cycles.</p>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="protocol-node mb-5" style="border-color: rgba(16, 185, 129, 0.2);">
                                        <span class="trust-label mb-4 d-block" style="color: #10b981;">🐾 ECOLOGICAL
                                            INTERACTION PROTOCOLS</span>
                                        <p class="text-white-50 small mb-4">Nocturnal wildlife (snakes, boars) are
                                            highly active. Maintain steady acoustic output to prevent startled
                                            interactions.</p>
                                        <div class="row g-3">
                                            <div class="col-md-4">
                                                <div class="tactical-pill"><span
                                                        class="text-success fw-900 x-small uppercase">Acoustic
                                                        Signaling</span><br><span class="text-white-50 x-small">Tap
                                                        stick/scythe</span></div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="tactical-pill"><span
                                                        class="text-success fw-900 x-small uppercase">Zero-Earphone
                                                        Policy</span><br><span class="text-white-50 x-small">100%
                                                        Situational Awareness</span></div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="tactical-pill"><span
                                                        class="text-success fw-900 x-small uppercase">Visual
                                                        Freezing</span><br><span class="text-white-50 x-small">Stop if
                                                        eyes glow</span></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-4">
                                    <span class="trust-label uppercase mb-4 d-block" style="color: #8b5cf6;">🛰️
                                        SOLO-WORK TELEMETRY</span>
                                    <div class="check-in-box mb-5">
                                        <div class="mb-4">
                                            <h6 class="text-white fw-900 small mb-1">LOCATION SHARING</h6>
                                            <p class="text-white-50 x-small m-0">Broadcast coordinates to trusted nodes
                                                or family before deployment.</p>
                                        </div>
                                        <div class="mb-4">
                                            <h6 class="text-white fw-900 small mb-1">TEMPORAL CHECK-INS</h6>
                                            <p class="text-white-50 x-small m-0">Set 60-minute recurring alarms for
                                                manual status verification.</p>
                                        </div>
                                        <div class="mb-4">
                                            <h6 class="text-white fw-900 small mb-1">ENERGY MANAGEMENT</h6>
                                            <p class="text-white-50 x-small m-0">Maintain device charge above 80% with
                                                auxiliary power modules.</p>
                                        </div>
                                        <div class="mb-0">
                                            <h6 class="text-white fw-900 small mb-1">SOS READINESS</h6>
                                            <p class="text-white-50 x-small m-0">Keep the AGROPLANTER SOS interface
                                                pre-loaded for immediate activation.</p>
                                        </div>
                                    </div>

                                    <div class="protocol-node text-center p-4"
                                        style="border-color: rgba(245, 158, 11, 0.2);">
                                        <span class="node-icon-large">⛈️</span>
                                        <h5 class="text-warning fw-900">Meteorological Veto</h5>
                                        <p class="text-white-50 small m-0">Abandon shift immediately if lightning
                                            telemetry is detected. Fences and high-tension wires are critical targets.
                                        </p>
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





