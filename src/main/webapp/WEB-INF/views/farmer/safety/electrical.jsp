<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>⚡ Electrical Safety Protocol - AGROPLANTER</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/voice-assistant.css" />
                <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800;900&display=swap"
                    rel="stylesheet">
                <link rel="icon"
                    href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>⚡</text></svg>" />
                <script>
                    window.AgroplanterUser = "${user.id}";
                    window.AgroplanterUserFull = "${user.fullName}";
                    window.AgroplanterRole = "${user.role}";
                </script>
                <style>
                    .safety-hero {
                        background: linear-gradient(135deg, rgba(239, 68, 68, 0.1), rgba(16, 185, 129, 0.1));
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

                    .hazard-list {
                        list-style: none;
                        padding: 0;
                        margin: 0;
                    }

                    .hazard-item {
                        padding: 15px 20px;
                        background: rgba(239, 68, 68, 0.05);
                        border: 1px solid rgba(239, 68, 68, 0.1);
                        border-radius: 16px;
                        margin-bottom: 15px;
                        color: #fca5a5;
                        font-weight: 800;
                        font-size: 11px;
                        letter-spacing: 0.5px;
                        display: flex;
                        align-items: center;
                        gap: 12px;
                    }

                    .first-aid-box {
                        background: rgba(59, 130, 246, 0.05);
                        border: 1px solid rgba(59, 130, 246, 0.1);
                        border-radius: 24px;
                        padding: 30px;
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
                                        <span style="color: #10b981;">⚡</span> Electrical Safety
                                    </h1>
                                    <span class="v3-page-subtitle text-success">
                                        📡 HIGH-VOLTAGE FARM SAFETY PROTOCOLS ACTIVE | EMERGENCY NODES READY
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
                                <div class="badge bg-success bg-opacity-10 text-success fw-900 px-3 py-1 mb-3"
                                    style="font-size: 10px; letter-spacing: 1.5px; border: 1px solid rgba(16, 185, 129, 0.2);">
                                    SAFETY STANDARD V3</div>
                                <h2 class="text-white fw-900" style="font-size: 3.5rem; letter-spacing: -2px;">Shock
                                    Prevention &<br>Management Protocols</h2>
                                <p class="text-white-50 mt-3 fs-5">Ensuring safe operation of motor pumps, capacitors,
                                    and high-tension wire awareness.</p>
                            </div>

                            <div class="row g-5">
                                <div class="col-lg-8">
                                    <span class="trust-label uppercase mb-4 d-block">🛠️ OPERATIONAL PROTOCOLS</span>

                                    <div class="protocol-node d-flex gap-4">
                                        <div class="node-digit">01</div>
                                        <div>
                                            <h5 class="text-white fw-900">Main-Switch Isolation</h5>
                                            <p class="text-white-50 small m-0">Terminate primary power sourcing before
                                                maintenance. Never access the capacitor box or motor terminals while the
                                                circuit is live.</p>
                                        </div>
                                    </div>

                                    <div class="protocol-node d-flex gap-4">
                                        <div class="node-digit">02</div>
                                        <div>
                                            <h5 class="text-white fw-900">Insulation Discipline</h5>
                                            <p class="text-white-50 small m-0">Zero tolerance for operation with wet
                                                hands. Use dry wooden instruments or certified rubber mats when
                                                accessing pump modules.</p>
                                        </div>
                                    </div>

                                    <div class="protocol-node d-flex gap-4">
                                        <div class="node-digit">03</div>
                                        <div>
                                            <h5 class="text-white fw-900">Advanced Earthing Matrix</h5>
                                            <p class="text-white-50 small m-0">Implement Double-Earthing with
                                                charcoal/salt filtration for the motor frame. Monitor continuity
                                                biennially to prevent residual charge buildup.</p>
                                        </div>
                                    </div>

                                    <div class="protocol-node d-flex gap-4">
                                        <div class="node-digit">04</div>
                                        <div>
                                            <h5 class="text-white fw-900">Tactical Cable Shielding</h5>
                                            <p class="text-white-50 small m-0">Prioritize armored underground
                                                distribution over bare overhead wires. Avoid vertical pole interference
                                                during field operations.</p>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-4">
                                    <span class="trust-label uppercase mb-4 d-block" style="color: #ef4444;">⚠️ CRITICAL
                                        HAZARDS</span>
                                    <div class="hazard-list mb-5">
                                        <div class="hazard-item"><span style="font-size: 14px;">❌</span> STATIONING NEAR
                                            TRANSFORMERS DURING MOISTURE</div>
                                        <div class="hazard-item"><span style="font-size: 14px;">❌</span> DEPLOYING BENT
                                            NAILS AS FUSE REPLACEMENTS</div>
                                        <div class="hazard-item"><span style="font-size: 14px;">❌</span> OPERATIONS NEAR
                                            SAGGING ELECTRICAL ARCS</div>
                                        <div class="hazard-item"><span style="font-size: 14px;">❌</span> CONDUCTIVE
                                            FENCE INTERACTION DURING STORMS</div>
                                    </div>

                                    <span class="trust-label uppercase mb-4 d-block" style="color: #3b82f6;">⚡ EMERGENCY
                                        FIRST-AID</span>
                                    <div class="first-aid-box">
                                        <ul class="hazard-list">
                                            <li class="mb-3 d-flex gap-3">
                                                <span class="text-primary fw-900">A</span>
                                                <span class="text-white-50 small"><strong>ISOLATION:</strong> Disable
                                                    main breaker immediately.</span>
                                            </li>
                                            <li class="mb-3 d-flex gap-3">
                                                <span class="text-primary fw-900">B</span>
                                                <span class="text-white-50 small"><strong>SEPARATION:</strong> Use
                                                    NON-CONDUCTIVE tools (Dry wood/HVAC plastic) to pull victim.</span>
                                            </li>
                                            <li class="mb-3 d-flex gap-3">
                                                <span class="text-primary fw-900">C</span>
                                                <span class="text-white-50 small"><strong>RESUSCITATION:</strong>
                                                    Initiate CPR if pulse telemetry is absent.</span>
                                            </li>
                                        </ul>
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





