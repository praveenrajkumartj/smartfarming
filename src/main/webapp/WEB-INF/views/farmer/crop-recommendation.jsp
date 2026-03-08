<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>🌱 Strategic Intel - AGROPLANTER</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/voice-assistant.css" />
                <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800;900&display=swap"
                    rel="stylesheet">
                <link rel="icon"
                    href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🌱</text></svg>" />
                <script>
                    window.AgroplanterUser = "${user.id}";
                    window.AgroplanterUserFull = "${user.fullName}";
                    window.AgroplanterRole = "${user.role}";
                </script>
                <style>
                    .intel-nexus-card {
                        background: rgba(15, 23, 42, 0.4);
                        border: 1px solid rgba(255, 255, 255, 0.05);
                        border-radius: 30px;
                        padding: 35px;
                        backdrop-filter: blur(20px);
                        position: relative;
                        overflow: hidden;
                    }

                    .intel-nexus-card::before {
                        content: '';
                        position: absolute;
                        top: 0;
                        left: 0;
                        width: 4px;
                        height: 100%;
                        background: #10b981;
                    }

                    .crop-nexus-node {
                        background: rgba(15, 23, 42, 0.4);
                        border: 1px solid rgba(255, 255, 255, 0.05);
                        border-radius: 28px;
                        overflow: hidden;
                        transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
                        backdrop-filter: blur(20px);
                        height: 100%;
                        position: relative;
                    }

                    .crop-nexus-node:hover {
                        transform: translateY(-12px);
                        border-color: rgba(16, 185, 129, 0.3);
                        box-shadow: 0 20px 40px rgba(0, 0, 0, 0.4);
                    }

                    .node-img-wrapper {
                        height: 220px;
                        position: relative;
                        overflow: hidden;
                    }

                    .node-img-wrapper img {
                        width: 100%;
                        height: 100%;
                        object-fit: cover;
                        transition: 0.6s;
                    }

                    .crop-nexus-node:hover .node-img-wrapper img {
                        transform: scale(1.15) rotate(2deg);
                    }

                    .v3-season-tag {
                        position: absolute;
                        top: 20px;
                        right: 20px;
                        background: rgba(16, 185, 129, 0.85);
                        backdrop-filter: blur(5px);
                        color: #020617;
                        font-size: 10px;
                        font-weight: 900;
                        padding: 6px 16px;
                        border-radius: 50px;
                        text-transform: uppercase;
                        letter-spacing: 1px;
                        border: 1px solid rgba(255, 255, 255, 0.2);
                        z-index: 2;
                    }

                    .v3-terminal-select {
                        background: rgba(255, 255, 255, 0.03) !important;
                        border: 1px solid rgba(255, 255, 255, 0.05) !important;
                        border-radius: 14px !important;
                        color: white !important;
                        padding: 14px 20px !important;
                        font-weight: 600 !important;
                        cursor: pointer;
                        font-size: 14px;
                    }

                    .v3-terminal-select:focus {
                        border-color: #10b981 !important;
                        background: rgba(255, 255, 255, 0.05) !important;
                        box-shadow: 0 0 0 4px rgba(16, 185, 129, 0.1) !important;
                    }

                    .v3-intel-label {
                        font-size: 9px;
                        font-weight: 900;
                        color: #475569;
                        text-transform: uppercase;
                        letter-spacing: 2px;
                        margin-bottom: 12px;
                        display: block;
                    }

                    .nexus-stat-v3 {
                        display: flex;
                        justify-content: space-between;
                        padding: 12px 0;
                        border-bottom: 1px solid rgba(255, 255, 255, 0.03);
                    }

                    .nexus-stat-v3:last-child {
                        border-bottom: none;
                    }

                    .stat-label-v3 {
                        font-size: 9px;
                        font-weight: 900;
                        color: #64748b;
                        text-transform: uppercase;
                        letter-spacing: 1px;
                    }

                    .stat-value-v3 {
                        font-size: 13px;
                        font-weight: 700;
                        color: #e2e8f0;
                    }

                    .crop-desc-node {
                        font-size: 12px;
                        color: #94a3b8;
                        line-height: 1.6;
                        margin-top: 15px;
                        display: -webkit-box;
                        -webkit-line-clamp: 2;
                        -webkit-box-orient: vertical;
                        overflow: hidden;
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
                                class="sidebar-nav-item active mb-2"><span class="nav-icon">🌱</span> Strategic
                                Intel</a>
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
                                        style="font-size: 2.2rem; letter-spacing: -1.5px;">
                                        Strategic Intelligence
                                    </h1>
                                    <span class="v3-page-subtitle text-success uppercase"
                                        style="letter-spacing: 1px; font-weight: 800;">
                                        📡 BIOSYNTHETIC ANALYSIS ENGINE ACTIVE | PATTERN RECOGNITION: OPTIMAL
                                    </span>
                                </div>
                            </div>
                        </header>

                        <div class="page-body px-5 py-5">
                            <div class="intel-nexus-card mb-5">
                                <form action="${pageContext.request.contextPath}/farmer/crop-recommendation"
                                    method="get">
                                    <div class="row g-4 align-items-end">
                                        <div class="col-md-4">
                                            <span class="v3-intel-label">CALENDAR SEGMENT</span>
                                            <select name="season" class="form-select v3-terminal-select">
                                                <option value="">ALL TACTICAL VECTORS</option>
                                                <option value="Kharif" ${selectedSeason=='Kharif' ? 'selected' : '' }>
                                                    KHARIF CYCLE (JUN-NOV)</option>
                                                <option value="Rabi" ${selectedSeason=='Rabi' ? 'selected' : '' }>RABI
                                                    CYCLE (NOV-APR)</option>
                                                <option value="Annual" ${selectedSeason=='Annual' ? 'selected' : '' }>
                                                    PERENNIAL / ANNUAL</option>
                                            </select>
                                        </div>
                                        <div class="col-md-4">
                                            <span class="v3-intel-label">SOIL COMPOSITION HUB</span>
                                            <select name="soilType" class="form-select v3-terminal-select">
                                                <option value="">ALL COMPOSITIONS</option>
                                                <option value="Clay" ${selectedSoil=='Clay' ? 'selected' : '' }>CLAY
                                                    CONCENTRATED</option>
                                                <option value="Loamy" ${selectedSoil=='Loamy' ? 'selected' : '' }>LOAMY
                                                    (BALANCED)</option>
                                                <option value="Sandy" ${selectedSoil=='Sandy' ? 'selected' : '' }>SANDY
                                                    (HIGH DRAINAGE)</option>
                                                <option value="Sandy Loam" ${selectedSoil=='Sandy Loam' ? 'selected'
                                                    : '' }>SANDY LOAM (HYBRID)</option>
                                                <option value="Black" ${selectedSoil=='Black' ? 'selected' : '' }>BLACK
                                                    (VOLCANIC/COTTON)</option>
                                                <option value="Clay Loam" ${selectedSoil=='Clay Loam' ? 'selected' : ''
                                                    }>CLAY LOAM (ALLUVIAL)</option>
                                            </select>
                                        </div>
                                        <div class="col-md-4">
                                            <button type="submit" class="btn btn-quantum w-100 py-3">INITIATE BIOSYNC
                                                →</button>
                                        </div>
                                    </div>
                                </form>
                            </div>

                            <div class="d-flex justify-content-between align-items-end mb-4">
                                <div>
                                    <span class="trust-label uppercase mb-1 d-block"
                                        style="font-size: 10px; color: #10b981;">OPTIMIZED INTELLIGENCE NODES</span>
                                    <h3 class="text-white fw-900 m-0" style="letter-spacing: -1px;">${fn:length(crops)}
                                        SECURE MATCHES DETECTED</h3>
                                </div>
                            </div>

                            <c:if test="${empty crops}">
                                <div class="text-center py-5" style="opacity: 0.3;">
                                    <div class="display-1">🛰️</div>
                                    <h4 class="text-white fw-900 mt-3 uppercase">NO BIOSYNC MATCHES FOUND</h4>
                                    <p class="text-white-50 fw-600">Re-calibrate soil or seasonal vectors for broader
                                        scanning.</p>
                                </div>
                            </c:if>

                            <div class="row g-5">
                                <c:forEach items="${crops}" var="crop">
                                    <div class="col-xl-3 col-lg-4 col-md-6">
                                        <div class="crop-nexus-node">
                                            <div class="node-img-wrapper">
                                                <img src="${crop.imageUrl != null ? (crop.imageUrl.startsWith('http') ? crop.imageUrl : pageContext.request.contextPath.concat(crop.imageUrl)) : 'https://images.unsplash.com/photo-1523348837708-15d4a09cfac2?auto=format&fit=crop&q=80&w=800'}"
                                                    alt="${crop.name}">
                                                <span class="v3-season-tag">${crop.season}</span>
                                            </div>
                                            <div class="p-4">
                                                <h4 class="text-white fw-900 mb-4" style="letter-spacing: -1px;">
                                                    ${crop.name}</h4>

                                                <div class="nexus-stat-v3">
                                                    <span class="stat-label-v3">SOIL NODE</span>
                                                    <span class="stat-value-v3">${crop.soilType}</span>
                                                </div>
                                                <div class="nexus-stat-v3">
                                                    <span class="stat-label-v3">HYDRATION</span>
                                                    <span
                                                        class="stat-value-v3 text-info">${crop.waterRequirement}</span>
                                                </div>
                                                <div class="nexus-stat-v3">
                                                    <span class="stat-label-v3">LIFE CYCLE</span>
                                                    <span
                                                        class="stat-value-v3 text-success">${crop.growthDuration}</span>
                                                </div>
                                                <div class="nexus-stat-v3">
                                                    <span class="stat-label-v3">THERMAL BAND</span>
                                                    <span class="stat-value-v3 text-warning">${crop.minTemperature}°C -
                                                        ${crop.maxTemperature}°C</span>
                                                </div>

                                                <p class="crop-desc-node fw-500">${crop.description}</p>

                                                <div class="mt-4 pt-3 border-top border-white-5 border-opacity-10">
                                                    <button class="btn btn-nexus-send w-100 py-3 fw-900 uppercase small"
                                                        style="border-radius: 12px; font-size: 10px; color: #10b981; background: rgba(16, 185, 129, 0.1); border: 1px solid rgba(16, 185, 129, 0.2);">ACCESS
                                                        FULL DATASET</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
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