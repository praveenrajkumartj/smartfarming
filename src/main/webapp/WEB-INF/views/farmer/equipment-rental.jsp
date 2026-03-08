<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>🚜 Agri-Uber Logistics - AGROPLANTER</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/voice-assistant.css" />
                <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800;900&display=swap"
                    rel="stylesheet">
                <link rel="icon"
                    href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🚜</text></svg>" />
                <script>
                    window.AgroplanterUser = "${user.id}";
                    window.AgroplanterUserFull = "${user.fullName}";
                    window.AgroplanterRole = "${user.role}";
                </script>
                <style>
                    .logistics-nexus-terminal {
                        background: rgba(15, 23, 42, 0.4);
                        border: 1px solid rgba(16, 185, 129, 0.2);
                        border-radius: 35px;
                        padding: 40px;
                        backdrop-filter: blur(30px);
                        position: relative;
                        overflow: hidden;
                    }

                    .logistics-nexus-terminal::before {
                        content: '';
                        position: absolute;
                        top: -50%;
                        left: -50%;
                        width: 200%;
                        height: 200%;
                        background: radial-gradient(circle, rgba(16, 185, 129, 0.05) 0%, transparent 60%);
                        pointer-events: none;
                    }

                    .v3-asset-node {
                        background: rgba(15, 23, 42, 0.4);
                        border: 1px solid rgba(255, 255, 255, 0.05);
                        border-radius: 30px;
                        overflow: hidden;
                        transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
                        height: 100%;
                        display: flex;
                        flex-direction: column;
                        backdrop-filter: blur(30px);
                    }

                    .v3-asset-node:hover {
                        border-color: rgba(16, 185, 129, 0.3);
                        transform: translateY(-12px);
                        box-shadow: 0 20px 40px rgba(0, 0, 0, 0.4);
                    }

                    .asset-img-nexus {
                        height: 240px;
                        width: 100%;
                        object-fit: cover;
                        border-bottom: 1px solid rgba(255, 255, 255, 0.05);
                    }

                    .v3-nexus-tab {
                        background: rgba(255, 255, 255, 0.02);
                        border: 1px solid rgba(255, 255, 255, 0.05);
                        border-radius: 12px;
                        padding: 12px 24px;
                        font-size: 11px;
                        font-weight: 800;
                        color: #cbd5e1;
                        transition: 0.3s;
                        display: inline-block;
                        text-decoration: none;
                        text-transform: uppercase;
                        letter-spacing: 1px;
                        cursor: pointer;
                    }

                    .v3-nexus-tab.active {
                        background: rgba(16, 185, 129, 0.1);
                        color: #10b981;
                        border-color: #10b981;
                        box-shadow: 0 0 20px rgba(16, 185, 129, 0.1);
                    }

                    .v3-terminal-input {
                        background: rgba(255, 255, 255, 0.02) !important;
                        border: 1px solid rgba(255, 255, 255, 0.05) !important;
                        border-radius: 14px !important;
                        color: white !important;
                        padding: 16px 22px !important;
                        font-weight: 600 !important;
                        font-family: 'Outfit';
                    }

                    .v3-terminal-input:focus {
                        border-color: #10b981 !important;
                        background: rgba(255, 255, 255, 0.05) !important;
                        box-shadow: 0 0 0 4px rgba(16, 185, 129, 0.1) !important;
                    }

                    .v3-modal-nexus {
                        background: #0f1728 !important;
                        border: 1px solid rgba(255, 255, 255, 0.05) !important;
                        border-radius: 40px !important;
                        overflow: hidden;
                        box-shadow: 0 30px 60px rgba(0, 0, 0, 0.6);
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
                                class="sidebar-nav-item active mb-2"><span class="nav-icon">🚜</span> Agri-Uber</a>

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
                                class="sidebar-nav-item mb-2"><span class="nav-icon">🛡️</span> Safety HQ</a>

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
                                        style="font-size: 2.2rem; letter-spacing: -1.5px;">Agri-Uber</h1>
                                    <span class="v3-page-subtitle text-success uppercase"
                                        style="letter-spacing: 1px; font-weight: 800;">
                                        📡 LOGISTICS TERMINAL ACTIVE | ASSET DEPLOYMENT MONITORING ENABLED | NODE:
                                        SECURED
                                    </span>
                                </div>
                            </div>
                            <div class="top-nav-right">
                                <button class="btn btn-quantum px-5 py-3 fw-900 uppercase small" data-bs-toggle="modal"
                                    data-bs-target="#addEqModal">LIST NEW ASSET +</button>
                            </div>
                        </header>

                        <div class="page-body px-5 py-5">
                            <div class="d-flex gap-3 mb-5">
                                <div class="v3-nexus-tab active" id="rent-trigger">DEPLOY ASSETS</div>
                                <div class="v3-nexus-tab" id="my-trigger">OWNED INVENTORY</div>
                                <a href="${pageContext.request.contextPath}/farmer/equipment/rentals"
                                    class="v3-nexus-tab text-decoration-none">TRANSACTION LOGS</a>
                            </div>

                            <div class="logistics-nexus-terminal mb-5">
                                <form action="${pageContext.request.contextPath}/farmer/equipment-rental" method="GET">
                                    <div class="row g-4 align-items-end">
                                        <div class="col-md-5">
                                            <span class="trust-label uppercase mb-2 d-block"
                                                style="font-size: 8px;">ASSET CATEGORY ORIENTATION</span>
                                            <select name="type" class="form-select v3-terminal-input">
                                                <option value="">ALL LOGISTICS NODES</option>
                                                <option value="TRACTOR" ${selectedType=='TRACTOR' ? 'selected' : '' }>
                                                    PRECISION TRACTORS</option>
                                                <option value="HARVESTER" ${selectedType=='HARVESTER' ? 'selected' : ''
                                                    }>ADVANCED HARVESTERS</option>
                                                <option value="DRONE" ${selectedType=='DRONE' ? 'selected' : '' }>
                                                    AUTONOMOUS DRONES</option>
                                                <option value="ROTAVATOR" ${selectedType=='ROTAVATOR' ? 'selected' : ''
                                                    }>ROTAVATOR SYSTEMS</option>
                                            </select>
                                        </div>
                                        <div class="col-md-5">
                                            <span class="trust-label uppercase mb-2 d-block"
                                                style="font-size: 8px;">GEOGRAPHIC DEPLOYMENT NODE</span>
                                            <input type="text" name="state" class="form-control v3-terminal-input"
                                                placeholder="SCAN REGION (e.g. TAMIL NADU)" value="${selectedState}">
                                        </div>
                                        <div class="col-md-2">
                                            <button type="submit"
                                                class="btn btn-quantum w-100 py-3 fw-900 uppercase">SCAN HUB</button>
                                        </div>
                                    </div>
                                </form>
                            </div>

                            <div id="rent-section">
                                <div class="row g-4">
                                    <c:choose>
                                        <c:when test="${not empty availableEquipment}">
                                            <c:forEach var="equipment" items="${availableEquipment}">
                                                <div class="col-xl-4 col-md-6">
                                                    <div class="v3-asset-node">
                                                        <img src="${empty equipment.imagePath ? 'https://images.unsplash.com/photo-1592919016327-51920ca33744?auto=format&fit=crop&q=80&w=800' : (fn:startsWith(equipment.imagePath, 'http') ? '' : pageContext.request.contextPath) += equipment.imagePath}"
                                                            onerror="this.src='https://images.unsplash.com/photo-1592919016327-51920ca33744?auto=format&fit=crop&q=80&w=800';"
                                                            class="asset-img-nexus">
                                                        <div class="p-4">
                                                            <div
                                                                class="d-flex justify-content-between align-items-start mb-2">
                                                                <h5 class="text-white fw-900 m-0"
                                                                    style="letter-spacing: -0.5px;">${equipment.name}
                                                                </h5>
                                                                <span
                                                                    class="badge bg-success bg-opacity-10 text-success x-small fw-900 uppercase"
                                                                    style="letter-spacing: 1px; font-size: 8px; border: 1px solid rgba(16, 185, 129, 0.2);">${equipment.type}</span>
                                                            </div>
                                                            <p class="text-white-50 x-small fw-800 uppercase mb-4"
                                                                style="letter-spacing: 1px; font-size: 8px;">📍
                                                                ${equipment.district}, ${equipment.state}</p>

                                                            <div class="d-flex justify-content-between align-items-end mb-4 p-3 rounded-4"
                                                                style="background: rgba(255,255,255,0.02); border: 1px solid rgba(255,255,255,0.05);">
                                                                <div>
                                                                    <div class="text-white-50 x-small fw-900 uppercase mb-1"
                                                                        style="font-size: 9px; opacity: 0.8 !important;">
                                                                        HOURLY
                                                                        RATE</div>
                                                                    <div class="text-success fw-900 fs-4">
                                                                        ₹${equipment.rentalRatePerHour}</div>
                                                                </div>
                                                                <div class="text-end">
                                                                    <div class="text-white-50 x-small fw-900 uppercase mb-1"
                                                                        style="font-size: 9px; opacity: 0.8 !important;">
                                                                        DAILY
                                                                        CYCLE</div>
                                                                    <div class="text-white fw-900 fs-5">
                                                                        ₹${equipment.rentalRatePerDay}</div>
                                                                </div>
                                                            </div>

                                                            <button type="button"
                                                                class="btn btn-quantum w-100 py-3 fw-900 uppercase small"
                                                                data-bs-toggle="modal"
                                                                data-bs-target="#rentModal${equipment.id}">INITIALIZE
                                                                BOOKING
                                                                →</button>
                                                        </div>
                                                    </div>
                                                </div>

                                                <!-- Modal: Requisition -->
                                                <div class="modal fade" id="rentModal${equipment.id}" tabindex="-1">
                                                    <div class="modal-dialog modal-dialog-centered">
                                                        <div class="modal-content v3-modal-nexus">
                                                            <div class="modal-header border-0 p-5 pb-0">
                                                                <div class="page-title">
                                                                    <h4 class="modal-title fw-900 text-white uppercase m-0"
                                                                        style="letter-spacing: -1px;">Logistics
                                                                        Requisition</h4>
                                                                    <span class="text-success x-small fw-800 uppercase"
                                                                        style="letter-spacing: 1px;">DEFINING
                                                                        OPERATIONAL
                                                                        TIMEFRAME</span>
                                                                </div>
                                                                <button type="button" class="btn-close btn-close-white"
                                                                    data-bs-dismiss="modal"></button>
                                                            </div>
                                                            <form
                                                                action="${pageContext.request.contextPath}/farmer/equipment/rent"
                                                                method="POST">
                                                                <input type="hidden" name="equipmentId"
                                                                    value="${equipment.id}">
                                                                <div class="modal-body p-5">
                                                                    <div class="row g-4 mb-5">
                                                                        <div class="col-md-6">
                                                                            <span
                                                                                class="trust-label uppercase mb-2 d-block"
                                                                                style="font-size: 10px; color: #cbd5e1;">START
                                                                                TELEMETRY</span>
                                                                            <input type="datetime-local"
                                                                                name="startDate"
                                                                                class="form-control v3-terminal-input"
                                                                                required>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <span
                                                                                class="trust-label uppercase mb-2 d-block"
                                                                                style="font-size: 10px; color: #cbd5e1;">END
                                                                                TELEMETRY</span>
                                                                            <input type="datetime-local" name="endDate"
                                                                                class="form-control v3-terminal-input"
                                                                                required>
                                                                        </div>
                                                                    </div>
                                                                    <div class="p-4 rounded-4 text-center fw-900 uppercase"
                                                                        style="background: rgba(14, 165, 233, 0.05); border: 1px dashed rgba(14, 165, 233, 0.3); color: #38bdf8; letter-spacing: 2px; font-size: 9px;">
                                                                        💡 DYNAMIC VALUATION CALCULATED AT END OF
                                                                        DEPLOYMENT
                                                                        CYCLE
                                                                    </div>
                                                                </div>
                                                                <div class="modal-footer border-0 p-5 pt-0">
                                                                    <button type="submit"
                                                                        class="btn btn-quantum w-100 py-4 fw-900 uppercase">CONFIRM
                                                                        DEPLOYMENT →</button>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="col-12 text-center py-5">
                                                <div class="mb-4" style="font-size: 64px; opacity: 0.5;">📡</div>
                                                <h4 class="text-white fw-900 uppercase" style="letter-spacing: 2px;">No
                                                    Active Assets Detected</h4>
                                                <p class="text-white-50 x-small fw-800 uppercase"
                                                    style="letter-spacing: 1px;">The specified sector or category
                                                    currently has no logistics nodes online.</p>
                                                <div class="mt-4">
                                                    <a href="${pageContext.request.contextPath}/farmer/equipment-rental"
                                                        class="btn btn-quantum px-5 py-3 fw-900 uppercase">RESET HUB
                                                        SCAN</a>
                                                </div>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>

                            <div id="my-section" style="display: none;">
                                <div class="row g-4">
                                    <c:forEach var="equipment" items="${myEquipment}">
                                        <div class="col-xl-4 col-md-6">
                                            <div class="v3-asset-node p-4">
                                                <div class="d-flex justify-content-between align-items-start mb-4">
                                                    <div>
                                                        <h5 class="text-white fw-900 m-0"
                                                            style="letter-spacing: -0.5px;">${equipment.name}</h5>
                                                        <span class="text-white-50 x-small fw-800 uppercase"
                                                            style="font-size: 8px; letter-spacing: 1px;">EQUIPMENT NODE:
                                                            #${equipment.id}</span>
                                                    </div>
                                                    <span
                                                        class="badge ${equipment.available ? 'bg-success' : 'bg-warning'} bg-opacity-10 text-${equipment.available ? 'success' : 'warning'} x-small fw-900 px-3 py-2 rounded-pill uppercase"
                                                        style="letter-spacing: 1px; font-size: 8px; border: 1px solid rgba(255,255,255,0.05);">
                                                        ${equipment.available ? '● NODE ONLINE' : '● ASSET DEPLOYED'}
                                                    </span>
                                                </div>
                                                <div class="d-flex justify-content-between align-items-center mb-5 p-3 rounded-4"
                                                    style="background: rgba(255,255,255,0.02); border: 1px solid rgba(255,255,255,0.05);">
                                                    <div>
                                                        <span class="text-white-50 x-small fw-900 uppercase mb-1"
                                                            style="font-size: 7px;">HOURLY VALUATION</span>
                                                        <div class="text-white fw-900 fs-5">
                                                            ₹${equipment.rentalRatePerHour}</div>
                                                    </div>
                                                    <div class="text-end">
                                                        <span class="text-white-50 x-small fw-900 uppercase mb-1"
                                                            style="font-size: 7px;">STATION NODE</span>
                                                        <div class="text-white-50 x-small fw-900 uppercase"
                                                            style="letter-spacing: 1px;">${equipment.district}</div>
                                                    </div>
                                                </div>
                                                <button type="button"
                                                    class="btn btn-outline-info w-100 py-3 fw-900 uppercase small"
                                                    style="border-radius: 14px; border-width: 1.5px; font-size: 10px;"
                                                    data-bs-toggle="modal"
                                                    data-bs-target="#telemetryModal${equipment.id}">CALIBRATE
                                                    TELEMETRY</button>
                                            </div>
                                        </div>

                                        <!-- Modal: Calibration -->
                                        <div class="modal fade" id="telemetryModal${equipment.id}" tabindex="-1">
                                            <div class="modal-dialog modal-dialog-centered">
                                                <div class="modal-content v3-modal-nexus">
                                                    <div class="modal-header border-0 p-5 pb-0">
                                                        <div class="page-title">
                                                            <h4 class="modal-title fw-900 text-white uppercase m-0"
                                                                style="letter-spacing: -1px;">Asset Calibration</h4>
                                                            <span class="text-success x-small fw-800 uppercase"
                                                                style="letter-spacing: 1px;">SYNCHRONIZING OPERATIONAL
                                                                PARAMETERS</span>
                                                        </div>
                                                        <button type="button" class="btn-close btn-close-white"
                                                            data-bs-dismiss="modal"></button>
                                                    </div>
                                                    <form
                                                        action="${pageContext.request.contextPath}/farmer/equipment/telemetry"
                                                        method="POST">
                                                        <input type="hidden" name="equipmentId" value="${equipment.id}">
                                                        <div class="modal-body p-5">
                                                            <div class="mb-5">
                                                                <span class="trust-label uppercase mb-2 d-block"
                                                                    style="font-size: 8px;">GLOBAL AVAILABILITY
                                                                    STATUS</span>
                                                                <select name="available"
                                                                    class="form-select v3-terminal-input">
                                                                    <option value="true" ${equipment.available
                                                                        ? 'selected' : '' }>ONLINE (VISIBLE FOR NETWORK)
                                                                    </option>
                                                                    <option value="false" ${!equipment.available
                                                                        ? 'selected' : '' }>OFFLINE (SECURE MODE)
                                                                    </option>
                                                                </select>
                                                            </div>
                                                            <div class="row g-4">
                                                                <div class="col-md-6">
                                                                    <span class="trust-label uppercase mb-2 d-block"
                                                                        style="font-size: 8px;">VALUATION (₹ /
                                                                        HR)</span>
                                                                    <input type="number" name="rate" step="0.01"
                                                                        class="form-control v3-terminal-input"
                                                                        value="${equipment.rentalRatePerHour}">
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <span class="trust-label uppercase mb-2 d-block"
                                                                        style="font-size: 8px;">DEPLOYMENT HUB</span>
                                                                    <input type="text" name="location"
                                                                        class="form-control v3-terminal-input"
                                                                        value="${equipment.district}">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer border-0 p-5 pt-0">
                                                            <button type="submit"
                                                                class="btn btn-quantum w-100 py-4 fw-900 uppercase">SYNCHRONIZE
                                                                TELEMETRY →</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </main>
                </div>

                <!-- Modal: Enrollment -->
                <div class="modal fade" id="addEqModal" tabindex="-1">
                    <div class="modal-dialog modal-dialog-centered modal-lg">
                        <div class="modal-content v3-modal-nexus">
                            <div class="modal-header border-0 p-5 pb-0">
                                <div class="page-title">
                                    <h4 class="modal-title fw-900 text-white uppercase m-0"
                                        style="letter-spacing: -1px;">Asset Enrollment</h4>
                                    <span class="text-success x-small fw-800 uppercase"
                                        style="letter-spacing: 1px;">INTEGRATING NEW NODE TO LOGISTICS NETWORK</span>
                                </div>
                                <button type="button" class="btn-close btn-close-white"
                                    data-bs-dismiss="modal"></button>
                            </div>
                            <form action="${pageContext.request.contextPath}/farmer/equipment/add" method="POST"
                                enctype="multipart/form-data">
                                <div class="modal-body p-5">
                                    <div class="row g-4">
                                        <div class="col-md-6">
                                            <span class="trust-label uppercase mb-2 d-block"
                                                style="font-size: 8px;">ASSET IDENTIFIER</span>
                                            <input type="text" name="name" class="form-control v3-terminal-input"
                                                placeholder="e.g. John Deere 5050D" required>
                                        </div>
                                        <div class="col-md-6">
                                            <span class="trust-label uppercase mb-2 d-block"
                                                style="font-size: 8px;">CATEGORY SEGMENT</span>
                                            <select name="type" class="form-select v3-terminal-input" required>
                                                <option value="TRACTOR">PRECISION TRACTOR</option>
                                                <option value="HARVESTER">ADVANCED HARVESTER</option>
                                                <option value="DRONE">AUTONOMOUS DRONE</option>
                                                <option value="ROTAVATOR">ROTAVATOR SYSTEM</option>
                                            </select>
                                        </div>
                                        <div class="col-md-6">
                                            <span class="trust-label uppercase mb-2 d-block"
                                                style="font-size: 8px;">HOURLY VALUATION (₹)</span>
                                            <input type="number" name="rentalRatePerHour" step="0.01"
                                                class="form-control v3-terminal-input" required>
                                        </div>
                                        <div class="col-md-6">
                                            <span class="trust-label uppercase mb-2 d-block"
                                                style="font-size: 8px;">DAILY VALUATION (₹)</span>
                                            <input type="number" name="rentalRatePerDay" step="0.01"
                                                class="form-control v3-terminal-input" required>
                                        </div>
                                        <div class="col-md-6">
                                            <span class="trust-label uppercase mb-2 d-block"
                                                style="font-size: 8px;">STATE HUB</span>
                                            <input type="text" name="state" class="form-control v3-terminal-input"
                                                required>
                                        </div>
                                        <div class="col-md-6">
                                            <span class="trust-label uppercase mb-2 d-block"
                                                style="font-size: 8px;">DISTRICT NODE</span>
                                            <input type="text" name="district" class="form-control v3-terminal-input"
                                                required>
                                        </div>
                                        <div class="col-12">
                                            <span class="trust-label uppercase mb-2 d-block"
                                                style="font-size: 8px;">TECHNICAL SPECIFICATIONS LEDGER</span>
                                            <textarea name="description" class="form-control v3-terminal-input" rows="3"
                                                placeholder="ENGINE PARAMETERS, HP, FUEL PROTOCOL..."></textarea>
                                        </div>
                                        <div class="col-12">
                                            <span class="trust-label uppercase mb-2 d-block"
                                                style="font-size: 8px;">VISUAL FACSIMILE</span>
                                            <input type="file" name="image" class="form-control v3-terminal-input">
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer border-0 p-5 pt-0">
                                    <button type="submit" class="btn btn-quantum w-100 py-4 fw-900 uppercase">ENROLL
                                        ASSET NODE →</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <script src="${pageContext.request.contextPath}/js/background-switcher.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                <script>
                    function toggleSidebar() { document.getElementById('sidebar').classList.toggle('open'); }

                    document.getElementById('rent-trigger').onclick = function () {
                        this.classList.add('active');
                        document.getElementById('my-trigger').classList.remove('active');
                        document.getElementById('rent-section').style.display = 'block';
                        document.getElementById('my-section').style.display = 'none';
                        return false;
                    };

                    document.getElementById('my-trigger').onclick = function () {
                        this.classList.add('active');
                        document.getElementById('rent-trigger').classList.remove('active');
                        document.getElementById('my-section').style.display = 'block';
                        document.getElementById('rent-section').style.display = 'none';
                        return false;
                    };
                </script>
            </body>

            </html>