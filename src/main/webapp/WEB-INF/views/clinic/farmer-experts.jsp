<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>🌿 Bio-Specialist Registry - AGROPLANTER</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/voice-assistant.css" />
                <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800;900&display=swap"
                    rel="stylesheet">
                <link rel="icon"
                    href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🌿</text></svg>" />
                <script>
                    window.AgroplanterUser = "${not empty pageContext.request.userPrincipal ? 'true' : ''}";
                    window.AgroplanterRole = "${user.role}";
                </script>
                <style>
                    .v3-expert-hero {
                        background: linear-gradient(135deg, rgba(59, 130, 246, 0.1) 0%, rgba(15, 23, 42, 0.4) 100%);
                        border-radius: 40px;
                        padding: 60px;
                        margin-bottom: 50px;
                        backdrop-filter: blur(40px);
                        border: 1px solid rgba(255, 255, 255, 0.05);
                        position: relative;
                        overflow: hidden;
                    }

                    .v3-expert-card {
                        background: rgba(15, 23, 42, 0.4);
                        border: 1px solid rgba(255, 255, 255, 0.05);
                        border-radius: 40px;
                        padding: 0;
                        overflow: hidden;
                        backdrop-filter: blur(40px);
                        height: 100%;
                        transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
                        display: flex;
                        flex-direction: column;
                    }

                    .v3-expert-card:hover {
                        border-color: rgba(59, 130, 246, 0.2);
                        background: rgba(15, 23, 42, 0.6);
                        transform: translateY(-12px);
                        box-shadow: 0 30px 60px rgba(0, 0, 0, 0.4);
                    }

                    .v3-card-banner {
                        height: 100px;
                        background: linear-gradient(135deg, #1e293b, #0f172a);
                        position: relative;
                    }

                    .v3-expert-orb {
                        width: 80px;
                        height: 80px;
                        background: linear-gradient(135deg, #3b82f6, #6366f1);
                        border: 4px solid #0f172a;
                        border-radius: 22px;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        font-size: 32px;
                        position: absolute;
                        bottom: -40px;
                        left: 30px;
                        box-shadow: 0 10px 25px rgba(59, 130, 246, 0.3);
                    }

                    .v3-card-body {
                        padding: 55px 30px 30px;
                        flex: 1;
                        display: flex;
                        flex-direction: column;
                    }

                    .v3-stat-pill {
                        background: rgba(255, 255, 255, 0.02);
                        border: 1px solid rgba(255, 255, 255, 0.05);
                        border-radius: 12px;
                        padding: 10px;
                        text-align: center;
                    }

                    .v3-terminal-input {
                        background: rgba(255, 255, 255, 0.02) !important;
                        border: 1px solid rgba(255, 255, 255, 0.05) !important;
                        border-radius: 20px !important;
                        color: white !important;
                        padding: 15px 20px !important;
                        font-family: 'Outfit';
                        font-size: 14px !important;
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
                                class="sidebar-nav-item active mb-2"><span class="nav-icon">🌿</span> Plant Clinic</a>

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

                            <div class="mt-auto px-2">
                                <a href="${pageContext.request.contextPath}/logout"
                                    class="sidebar-nav-item text-danger mt-4" style="border-radius: 12px;">
                                    <span class="nav-icon">🚪</span> Terminate Session
                                </a>
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
                                    <h1 class="m-0 fw-950 text-white"
                                        style="font-size: 2.2rem; letter-spacing: -1.5px;">Specialist Registry</h1>
                                    <span class="v3-page-subtitle text-info uppercase"
                                        style="letter-spacing: 1px; font-weight: 800;">
                                        🩺 BIO-DIAGNOSTIC NETWORK | VERIFIED NODES: ${fn:length(experts)} | NODE:
                                        SECURED
                                    </span>
                                </div>
                            </div>
                            <div class="top-nav-right">
                                <a href="${pageContext.request.contextPath}/clinic/farmer/dashboard"
                                    class="btn btn-quantum px-4 py-2 fw-950 uppercase"
                                    style="font-size: 10px; background: rgba(255,255,255,0.05); border: 1px solid rgba(255,255,255,0.1);">
                                    MY REQUISITIONS
                                </a>
                            </div>
                        </header>

                        <div class="page-body px-5 py-5">
                            <div class="v3-expert-hero">
                                <div class="row align-items-center">
                                    <div class="col-md-9">
                                        <div class="badge bg-info bg-opacity-10 text-info fw-950 px-3 py-2 rounded-pill uppercase mb-4"
                                            style="font-size: 9px; letter-spacing: 2px; border: 1px solid rgba(59, 130, 246, 0.2);">
                                            NETWORK PROBE: ACTIVE
                                        </div>
                                        <h1 class="fw-950 text-white mb-3 display-4" style="letter-spacing: -3px;">
                                            Bio-Specialist Directory</h1>
                                        <p class="text-white-50 fw-800 uppercase x-small mb-0"
                                            style="letter-spacing: 2px; opacity: 0.6;">
                                            ACCESS VERIFIED CLINICAL NODES FOR ADVANCED CROP DIAGNOSTICS AND BIOLOGICAL
                                            OPTIMIZATION.
                                        </p>
                                    </div>
                                    <div class="col-md-3 text-md-end">
                                        <div class="badge fw-950 px-4 py-3 rounded-pill uppercase"
                                            style="font-size: 10px; letter-spacing: 1px; border: 1px solid rgba(255, 255, 255, 0.1); background: rgba(255, 255, 255, 0.03); color: rgba(255, 255, 255, 0.5);">
                                            SECURE SESSIONS ONLY
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row g-5">
                                <c:forEach var="e" items="${experts}">
                                    <div class="col-xl-4 col-md-6">
                                        <div class="v3-expert-card">
                                            <div class="v3-card-banner">
                                                <div class="v3-expert-orb">🩺</div>
                                            </div>
                                            <div class="v3-card-body">
                                                <h3 class="text-white fw-950 mb-1" style="letter-spacing: -1px;">DR.
                                                    ${e.user.fullName.toUpperCase()}</h3>
                                                <div class="text-info fw-950 uppercase mb-4"
                                                    style="font-size: 11px; letter-spacing: 1.5px;">${e.specialization}
                                                </div>

                                                <p class="text-white-50 small fw-600 mb-5"
                                                    style="line-height: 1.6; opacity: 0.7; min-height: 72px;">
                                                    ${e.bio}
                                                </p>

                                                <div class="row g-3 mb-5">
                                                    <div class="col-6">
                                                        <div class="v3-stat-pill">
                                                            <div class="v3-identity-label">EXPERIENCE</div>
                                                            <div class="text-white fw-900 small">${e.experience}</div>
                                                        </div>
                                                    </div>
                                                    <div class="col-6">
                                                        <div class="v3-stat-pill">
                                                            <div class="v3-identity-label">PROTOCOL RATING</div>
                                                            <div class="text-warning fw-950 small">⭐ ${e.rating}</div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="mt-auto pt-4 d-flex align-items-center justify-content-between"
                                                    style="border-top: 1px solid rgba(255,255,255,0.05);">
                                                    <div>
                                                        <div class="v3-identity-label">SESSION FEE</div>
                                                        <div class="text-white fw-950 fs-4"
                                                            style="font-family: 'JetBrains Mono'; color: #fbbf24;">
                                                            ₹${e.consultationFee}</div>
                                                    </div>
                                                    <button class="btn btn-quantum py-3 px-4 fw-950 uppercase"
                                                        style="font-size: 11px;" data-bs-toggle="modal"
                                                        data-bs-target="#bookModal${e.id}">
                                                        DEPLOY NODES →
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Booking Modal -->
                                    <div class="modal fade" id="bookModal${e.id}" tabindex="-1">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content overflow-hidden border-0"
                                                style="border-radius: 40px; background: rgba(15, 23, 42, 0.95); backdrop-filter: blur(40px);">
                                                <div class="modal-header border-0 p-5 pb-2">
                                                    <h2 class="modal-title fw-950 text-white"
                                                        style="letter-spacing: -1.5px;">INITIATE SESSION</h2>
                                                    <button type="button" class="btn-close btn-close-white"
                                                        data-bs-dismiss="modal"></button>
                                                </div>
                                                <form action="${pageContext.request.contextPath}/clinic/farmer/book"
                                                    method="post">
                                                    <div class="modal-body p-5 pt-4">
                                                        <input type="hidden" name="expertId" value="${e.id}">

                                                        <div class="p-4 rounded-4 mb-4"
                                                            style="background: rgba(59, 130, 246, 0.05); border: 1px solid rgba(59, 130, 246, 0.1);">
                                                            <div class="d-flex align-items-center gap-3">
                                                                <div class="v3-avatar-mini"
                                                                    style="width: 50px; height: 50px; font-size: 20px;">
                                                                    ${fn:substring(e.user.fullName, 0, 1)}</div>
                                                                <div>
                                                                    <div class="text-white fw-950 uppercase"
                                                                        style="font-size: 14px;">DR.
                                                                        ${e.user.fullName.toUpperCase()}</div>
                                                                    <div class="text-info fw-950 uppercase"
                                                                        style="font-size: 10px; opacity: 0.6;">
                                                                        ${e.specialization}</div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="mb-4">
                                                            <label class="v3-identity-label mb-2">PREFERRED TELEMETRY
                                                                WINDOW (DATE/TIME)</label>
                                                            <input type="datetime-local" name="sessionTime"
                                                                class="form-control v3-terminal-input" required>
                                                        </div>

                                                        <div class="mb-4">
                                                            <label class="v3-identity-label mb-2">SYMPTOMS / BIOLOGICAL
                                                                ANOMALIES</label>
                                                            <textarea name="symptomsDescription"
                                                                class="form-control v3-terminal-input" rows="4"
                                                                placeholder="Describe the pathogen manifestations..."
                                                                required></textarea>
                                                        </div>

                                                        <div class="p-3 text-center rounded-4"
                                                            style="background: rgba(251, 191, 36, 0.05); border: 1px solid rgba(251, 191, 36, 0.1);">
                                                            <span class="text-warning fw-950 uppercase"
                                                                style="font-size: 10px; letter-spacing: 1px;">PROTOCOL
                                                                FEE: ₹${e.consultationFee} (PAYABLE AFTER
                                                                APPROVAL)</span>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer border-0 p-5 pt-0">
                                                        <button type="submit"
                                                            class="btn btn-quantum w-100 py-4 fw-950 uppercase">DEPLOY
                                                            REQUISITION →</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </main>
                </div>

                <script src="${pageContext.request.contextPath}/js/background-switcher.js"></script>
                <script src="${pageContext.request.contextPath}/js/voice-assistant.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                <script>
                    function toggleSidebar() { document.getElementById('sidebar').classList.toggle('open'); }
                </script>
            </body>

            </html>