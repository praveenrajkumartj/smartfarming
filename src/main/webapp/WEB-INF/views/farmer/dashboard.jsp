<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>👨‍🌾 Farmer Command Center - AGROPLANTER</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/voice-assistant.css" />
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
                <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800;900&display=swap"
                    rel="stylesheet">
                <link rel="icon"
                    href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>👨‍🌾</text></svg>" />
                <script>
                    window.AgroplanterUser = "${user.id}";
                    window.AgroplanterUserFull = "${user.fullName}";
                    window.AgroplanterRole = "${user.role}";
                </script>
                <style>
                    .v3-stat-grid {
                        display: grid;
                        grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
                        gap: 30px;
                        margin-bottom: 50px;
                    }

                    .v3-stat-node {
                        background: rgba(15, 23, 42, 0.4);
                        border: 1px solid rgba(255, 255, 255, 0.05);
                        border-radius: 40px;
                        padding: 40px;
                        backdrop-filter: blur(30px);
                        transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
                        position: relative;
                        overflow: hidden;
                    }

                    .v3-stat-node:hover {
                        transform: translateY(-15px) scale(1.02);
                        background: rgba(15, 23, 42, 0.6);
                        border-color: rgba(16, 185, 129, 0.3);
                        box-shadow: 0 30px 60px rgba(0, 0, 0, 0.4);
                    }

                    .v3-stat-node::after {
                        content: '';
                        position: absolute;
                        bottom: -30px;
                        right: -30px;
                        width: 120px;
                        height: 120px;
                        background: radial-gradient(circle, var(--primary) 0%, transparent 70%);
                        opacity: 0.1;
                        filter: blur(30px);
                    }

                    .v3-ops-grid {
                        display: grid;
                        grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
                        gap: 25px;
                        margin-bottom: 50px;
                    }

                    .v3-op-node {
                        background: rgba(15, 23, 42, 0.4);
                        border: 1px solid rgba(255, 255, 255, 0.05);
                        border-radius: 30px;
                        padding: 30px;
                        display: flex;
                        flex-direction: column;
                        align-items: center;
                        gap: 20px;
                        transition: 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
                        text-decoration: none;
                        backdrop-filter: blur(20px);
                        position: relative;
                        overflow: hidden;
                    }

                    .v3-op-node:hover {
                        background: rgba(16, 185, 129, 0.05);
                        border-color: rgba(16, 185, 129, 0.3);
                        transform: translateY(-8px);
                    }

                    .v3-op-node .orb {
                        width: 70px;
                        height: 70px;
                        background: rgba(255, 255, 255, 0.02);
                        border: 1px solid rgba(255, 255, 255, 0.05);
                        border-radius: 20px;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        font-size: 32px;
                        transition: 0.3s;
                    }

                    .v3-op-node:hover .orb {
                        background: rgba(16, 185, 129, 0.1);
                        transform: scale(1.15) rotate(-5deg);
                    }

                    .v3-nexus-panel {
                        background: rgba(15, 23, 42, 0.4);
                        border: 1px solid rgba(255, 255, 255, 0.05);
                        border-radius: 40px;
                        padding: 50px;
                        backdrop-filter: blur(30px);
                        height: 100%;
                    }

                    .v3-data-table {
                        width: 100%;
                        border-collapse: separate;
                        border-spacing: 0 15px;
                    }

                    .v3-data-table th {
                        color: #475569;
                        font-family: 'Outfit';
                        font-size: 11px;
                        font-weight: 950;
                        text-transform: uppercase;
                        letter-spacing: 2px;
                        padding: 0 25px 15px;
                    }

                    .v3-data-table td {
                        background: rgba(255, 255, 255, 0.015);
                        padding: 25px;
                        border-top: 1px solid rgba(255, 255, 255, 0.03);
                        border-bottom: 1px solid rgba(255, 255, 255, 0.03);
                        font-size: 15px;
                    }

                    .v3-data-table tr td:first-child {
                        border-left: 1px solid rgba(255, 255, 255, 0.03);
                        border-radius: 20px 0 0 20px;
                    }

                    .v3-data-table tr td:last-child {
                        border-right: 1px solid rgba(255, 255, 255, 0.03);
                        border-radius: 0 20px 20px 0;
                    }

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
                        width: 38px;
                        height: 38px;
                        background: linear-gradient(135deg, rgba(16, 185, 129, 0.2), rgba(6, 182, 212, 0.2));
                        border: 1px solid rgba(16, 185, 129, 0.3);
                        border-radius: 10px;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        font-size: 20px;
                        color: #10b981;
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
                                <div class="brand-icon-box">
                                    <i class="fas fa-leaf"></i>
                                </div>
                                <div class="brand-text">
                                    <h3 class="m-0"
                                        style="font-size: 18px; font-weight: 900; background: linear-gradient(135deg, #10b981 0%, #06b6d4 100%); -webkit-background-clip: text; background-clip: text; -webkit-text-fill-color: transparent;">
                                        AGROPLANTER</h3>
                                    <span
                                        style="font-size: 9px; color: #94a3b8; font-weight: 800; letter-spacing: 1px; -webkit-text-fill-color: #94a3b8;">FARMER
                                        NODE V3</span>
                                </div>
                            </div>
                        </div>
                        <nav class="sidebar-nav px-3 py-4">
                            <div class="nav-section-title px-2 mb-2"
                                style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">
                                STRATEGIC CORE</div>
                            <a href="${pageContext.request.contextPath}/farmer/dashboard"
                                class="sidebar-nav-item active mb-2"><span class="nav-icon">📊</span> Command Center</a>
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
                            <a href="${pageContext.request.contextPath}/farmer/product-reviews"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">⭐</span> Product Intel</a>
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
                                <c:when test="${user.role eq 'MENTOR'}">
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
                                    <h1 id="dynamicGreeting" class="m-0 fw-900 text-white"
                                        style="font-size: 2.2rem; letter-spacing: -1.5px;">Command Center</h1>
                                    <span class="v3-page-subtitle text-success uppercase"
                                        style="letter-spacing: 1px; font-weight: 800;">
                                        📡 ${not empty user.district ? user.district : 'GLOBAL'}, ${not empty user.state
                                        ? user.state : 'NODE'} | OPERATIONAL HUB ACTIVE | NODE: SECURED
                                    </span>
                                </div>
                            </div>
                            <div class="top-nav-right d-flex align-items-center gap-4">
                                <div class="notification-trigger position-relative"
                                    style="cursor: pointer; font-size: 20px; color: #94a3b8;"
                                    onclick="window.location.href='${pageContext.request.contextPath}/farmer/notifications'">
                                    <i class="fas fa-bell"></i>
                                    <c:if test="${unreadNotifications > 0}">
                                        <span
                                            class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger"
                                            style="font-size: 8px; padding: 4px 6px;">
                                            ${unreadNotifications}
                                        </span>
                                    </c:if>
                                </div>
                                <div class="user-info"
                                    style="gap: 15px; cursor: pointer; display: flex; align-items: center;"
                                    onclick="window.location.href='${pageContext.request.contextPath}/farmer/profile'">
                                    <div class="user-details d-none d-md-flex flex-column text-end">
                                        <span class="user-name text-white fw-800"
                                            style="font-size: 14px; letter-spacing: -0.5px;">${user.fullName}</span>
                                        <span class="user-role uppercase fw-950"
                                            style="font-size: 9px; color: #10b981; letter-spacing: 1px;">NODAL
                                            ${user.role}</span>
                                    </div>
                                    <div class="user-avatar"
                                        style="width: 48px; height: 48px; border-radius: 16px; display: flex; align-items: center; justify-content: center; overflow: hidden; border: 1px solid rgba(255,255,255,0.1); box-shadow: 0 10px 20px rgba(16, 185, 129, 0.2);">
                                        <c:choose>
                                            <c:when test="${not empty user.profileImagePath}">
                                                <img src="${pageContext.request.contextPath}${user.profileImagePath}"
                                                    alt="Profile" style="width: 100%; height: 100%; object-fit: cover;">
                                            </c:when>
                                            <c:otherwise>
                                                <div
                                                    style="width: 100%; height: 100%; background: linear-gradient(135deg, #10b981, #3b82f6); display: flex; align-items: center; justify-content: center; font-weight: 950; font-size: 20px; color: white;">
                                                    <i class="fas fa-user-circle"></i>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                        </header>

                        <div class="page-body px-5 py-5">
                            <div class="v3-stat-grid">
                                <div class="v3-stat-node">
                                    <span class="trust-label uppercase d-block mb-2"
                                        style="font-size: 9px; letter-spacing: 2px; color: #475569;">ACTIVE YIELD</span>
                                    <div class="display-5 fw-950 text-white mb-1" style="letter-spacing: -2px;">
                                        ${totalListings}</div>
                                    <div class="text-white-50 x-small fw-950 uppercase"
                                        style="font-size: 8px; letter-spacing: 1.5px;">SECURED LISTINGS</div>
                                </div>
                                <div class="v3-stat-node">
                                    <span class="trust-label uppercase d-block mb-2"
                                        style="font-size: 9px; letter-spacing: 2px; color: #475569;">MARKET
                                        ACCESSIBILITY</span>
                                    <div class="display-5 fw-950 text-white mb-1" style="letter-spacing: -2px;">
                                        ${availableListings}</div>
                                    <div class="text-white-50 x-small fw-950 uppercase"
                                        style="font-size: 8px; letter-spacing: 1.5px;">GLOBAL MARKET NODES</div>
                                </div>
                                <div class="v3-stat-node">
                                    <span class="trust-label uppercase d-block mb-2"
                                        style="font-size: 9px; letter-spacing: 2px; color: #475569;">BIO-TELEMETRY</span>
                                    <div class="display-5 fw-950 text-white mb-1" style="letter-spacing: -2px;">
                                        ${diseaseQueries}</div>
                                    <div class="text-white-50 x-small fw-950 uppercase"
                                        style="font-size: 8px; letter-spacing: 1.5px;">DIAGNOSTIC QUERIES</div>
                                </div>
                                <div class="v3-stat-node">
                                    <span class="trust-label uppercase d-block mb-2"
                                        style="font-size: 9px; letter-spacing: 2px; color: #475569;">NODE TRUST
                                        RATING</span>
                                    <div class="display-5 fw-950 text-success mb-1" style="letter-spacing: -2px;">${not
                                        empty user.trustScore ? user.trustScore : 0}%</div>
                                    <div class="text-white-50 x-small fw-950 uppercase"
                                        style="font-size: 8px; letter-spacing: 1.5px;">SYSTEM REPUTATION</div>
                                </div>
                                <div class="v3-stat-node" style="cursor: pointer;"
                                    onclick="window.location.href='${pageContext.request.contextPath}/farmer/product-reviews'">
                                    <span class="trust-label uppercase d-block mb-2"
                                        style="font-size: 9px; letter-spacing: 2px; color: #475569;">PRODUCT
                                        INTEL</span>
                                    <div class="display-5 fw-950 text-white mb-1" style="letter-spacing: -2px;">
                                        ${totalReviews}</div>
                                    <div class="text-white-50 x-small fw-950 uppercase"
                                        style="font-size: 8px; letter-spacing: 1.5px;">BUYER FEEDBACK LOGS</div>
                                </div>
                            </div>

                            <div class="v3-ops-grid">
                                <a href="${pageContext.request.contextPath}/farmer/crop-recommendation"
                                    class="v3-op-node">
                                    <div class="orb">🌱</div>
                                    <span class="trust-label uppercase"
                                        style="font-size: 10px; letter-spacing: 1.5px;">STRATEGIC INTEL</span>
                                </a>
                                <a href="${pageContext.request.contextPath}/farmer/market-prices" class="v3-op-node">
                                    <div class="orb">📊</div>
                                    <span class="trust-label uppercase"
                                        style="font-size: 10px; letter-spacing: 1.5px;">LIVE MANDI</span>
                                </a>
                                <a href="${pageContext.request.contextPath}/farmer/weather" class="v3-op-node">
                                    <div class="orb">⛈️</div>
                                    <span class="trust-label uppercase"
                                        style="font-size: 10px; letter-spacing: 1.5px;">ATMOS DATA</span>
                                </a>
                                <a href="${pageContext.request.contextPath}/farmer/disease-detection"
                                    class="v3-op-node">
                                    <div class="orb">🔬</div>
                                    <span class="trust-label uppercase"
                                        style="font-size: 10px; letter-spacing: 1.5px;">BIO SCAN</span>
                                </a>
                                <a href="${pageContext.request.contextPath}/farmer/marketplace" class="v3-op-node">
                                    <div class="orb">🛍️</div>
                                    <span class="trust-label uppercase"
                                        style="font-size: 10px; letter-spacing: 1.5px;">MARKET HUB</span>
                                </a>
                                <a href="${pageContext.request.contextPath}/farmer/safety-hub" class="v3-op-node"
                                    style="border-color: rgba(239, 68, 68, 0.2); background: rgba(239, 68, 68, 0.05);">
                                    <div class="orb text-danger">🛡️</div>
                                    <span class="trust-label uppercase text-danger"
                                        style="font-size: 10px; letter-spacing: 1.5px;">SAFETY HQ</span>
                                </a>
                            </div>

                            <div class="row g-5">
                                <div class="col-xl-7">
                                    <div class="v3-nexus-panel">
                                        <div class="d-flex justify-content-between align-items-center mb-5">
                                            <h4 class="fw-900 text-white m-0 fs-2"
                                                style="letter-spacing: -1.5px; line-height: 1;">Regional Price Analytics
                                            </h4>
                                            <a href="${pageContext.request.contextPath}/farmer/market-prices"
                                                class="btn btn-quantum px-5 py-3 small fw-950 uppercase"
                                                style="font-size: 10px;">FULL TELEMETRY →</a>
                                        </div>
                                        <div class="table-responsive">
                                            <table class="v3-data-table">
                                                <thead>
                                                    <tr>
                                                        <th>CROP ASSET</th>
                                                        <th>MARKET HUB</th>
                                                        <th class="text-end">VALUATION</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${recentPrices}" var="price">
                                                        <tr>
                                                            <td><span class="fw-950 text-white">${price.cropName}</span>
                                                            </td>
                                                            <td class="text-white-50 x-small fw-950 uppercase"
                                                                style="font-size: 10px;">${price.market}</td>
                                                            <td class="text-end"><span
                                                                    class="text-success fw-950 fs-5">₹${price.modalPrice}</span>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-5">
                                    <div class="v3-nexus-panel">
                                        <div class="d-flex justify-content-between align-items-center mb-5">
                                            <h4 class="fw-900 text-white m-0 fs-2"
                                                style="letter-spacing: -1.5px; line-height: 1;">Institutional Feed</h4>
                                            <a href="${pageContext.request.contextPath}/farmer/schemes"
                                                class="text-white-50 small fw-950 uppercase"
                                                style="font-size: 10px; letter-spacing: 1px;">ALL PROJECTS →</a>
                                        </div>
                                        <div class="alerts-list">
                                            <c:forEach items="${recentSchemes}" var="scheme">
                                                <div class="p-4 rounded-4 mb-3"
                                                    style="background: rgba(255,255,255,0.02); border: 1px solid rgba(255,255,255,0.05); transition: 0.3s;"
                                                    onmouseover="this.style.background='rgba(255,255,255,0.04)'"
                                                    onmouseout="this.style.background='rgba(255,255,255,0.02)'">
                                                    <span
                                                        class="badge bg-success bg-opacity-10 text-success x-small px-3 py-1 mb-3 rounded-pill fw-950 uppercase"
                                                        style="font-size: 8px; letter-spacing: 1.5px; border: 1px solid rgba(16, 185, 129, 0.1);">${scheme.category}</span>
                                                    <div class="fw-950 text-white mb-2 fs-5"
                                                        style="letter-spacing: -0.5px;">${scheme.title}</div>
                                                    <div class="text-white-50 x-small lh-lg fw-600"
                                                        style="opacity: 0.6;">${fn:substring(scheme.description, 0,
                                                        100)}...</div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                                <div class="row g-5 mt-4">
                                    <div class="col-12">
                                        <div class="v3-nexus-panel">
                                            <div class="d-flex justify-content-between align-items-center mb-5">
                                                <h4 class="fw-900 text-white m-0 fs-2"
                                                    style="letter-spacing: -1.5px; line-height: 1;">Recent Biological
                                                    Diagnostics</h4>
                                                <a href="${pageContext.request.contextPath}/farmer/disease-detection"
                                                    class="btn btn-quantum px-5 py-3 small fw-950 uppercase"
                                                    style="font-size: 10px;">BIO-LAB ACCESS →</a>
                                            </div>
                                            <div class="table-responsive">
                                                <table class="v3-data-table">
                                                    <thead>
                                                        <tr>
                                                            <th>CASE ID</th>
                                                            <th>CROP ASSET</th>
                                                            <th>DIAGNOSTIC STATUS</th>
                                                            <th>AI CONFIDENCE</th>
                                                            <th class="text-end">ACTIONS</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${recentQueries}" var="q">
                                                            <tr>
                                                                <td><span class="text-white-50 fw-950"
                                                                        style="font-size: 12px;">#DIAG-${q.id}</span>
                                                                </td>
                                                                <td><span
                                                                        class="fw-950 text-white uppercase">${q.cropName}</span>
                                                                </td>
                                                                <td>
                                                                    <c:set var="statusClass"
                                                                        value="${q.status == 'REPORT_READY' || q.status == 'DIAGNOSED' ? 'success' : (q.status == 'REJECTED' ? 'danger' : 'warning')}" />
                                                                    <span
                                                                        class="badge bg-${statusClass} bg-opacity-10 text-${statusClass} fw-950 px-3 py-1 rounded-pill uppercase"
                                                                        style="font-size: 9px; letter-spacing: 1px; border: 1px solid rgba(255,255,255,0.05);">
                                                                        ${q.status == 'REPORT_READY' || q.status ==
                                                                        'DIAGNOSED' ? 'READY' : q.status}
                                                                    </span>
                                                                </td>
                                                                <td>
                                                                    <div class="d-flex align-items-center gap-2">
                                                                        <div class="progress flex-grow-1"
                                                                            style="height: 4px; background: rgba(255,255,255,0.05); width: 80px;">
                                                                            <div class="progress-bar bg-success"
                                                                                style="width: ${not empty q.confidenceScore ? q.confidenceScore : 0}%">
                                                                            </div>
                                                                        </div>
                                                                        <span class="text-success fw-950 small">${not
                                                                            empty q.confidenceScore ? q.confidenceScore
                                                                            : 0}%</span>
                                                                    </div>
                                                                </td>
                                                                <td class="text-end">
                                                                    <a href="${pageContext.request.contextPath}/farmer/disease-detection/result/${q.id}"
                                                                        class="btn btn-sm btn-quantum px-4 py-2 fw-950 uppercase"
                                                                        style="font-size: 9px;">VIEW REPORT</a>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                        <c:if test="${empty recentQueries}">
                                                            <tr>
                                                                <td colspan="5"
                                                                    class="text-center py-5 text-white-50 fw-800 uppercase"
                                                                    style="letter-spacing: 2px; opacity: 0.5;">No
                                                                    diagnostic logs detected in current cycle</td>
                                                            </tr>
                                                        </c:if>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>

                                        <div class="v3-nexus-panel mt-5">
                                            <div class="d-flex justify-content-between align-items-center mb-5">
                                                <h4 class="fw-900 text-white m-0 fs-2"
                                                    style="letter-spacing: -1.5px; line-height: 1;">Recent Plant Clinic
                                                    Consultations</h4>
                                                <a href="${pageContext.request.contextPath}/clinic/farmer/dashboard"
                                                    class="btn btn-quantum px-5 py-3 small fw-950 uppercase"
                                                    style="font-size: 10px;">CLINIC DESK ACCESS →</a>
                                            </div>
                                            <div class="table-responsive">
                                                <table class="v3-data-table">
                                                    <thead>
                                                        <tr>
                                                            <th>EXPERT HUB</th>
                                                            <th>SESSION TIME</th>
                                                            <th>STATUS</th>
                                                            <th class="text-end">ACTIONS</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${recentConsultations}" var="c">
                                                            <tr>
                                                                <td><span class="fw-950 text-white">DR.
                                                                        ${c.expert.user.fullName}</span></td>
                                                                <td class="text-white-50 small fw-800">${c.sessionTime}
                                                                </td>
                                                                <td>
                                                                    <span
                                                                        class="badge ${c.status == 'COMPLETED' ? 'bg-success' : (c.status == 'APPROVED' ? 'bg-info' : (c.status == 'CANCELLED' ? 'bg-danger' : 'bg-warning'))} bg-opacity-10 text-${c.status == 'COMPLETED' ? 'success' : (c.status == 'APPROVED' ? 'info' : (c.status == 'CANCELLED' ? 'danger' : 'warning'))} fw-950 px-3 py-1 rounded-pill uppercase"
                                                                        style="font-size: 9px; letter-spacing: 1px; border: 1px solid rgba(255,255,255,0.05);">${c.status}</span>
                                                                </td>
                                                                <td class="text-end">
                                                                    <div class="d-flex justify-content-end gap-2">
                                                                        <c:if test="${c.status == 'COMPLETED'}">
                                                                            <a href="${pageContext.request.contextPath}/clinic/farmer/dashboard"
                                                                                class="btn btn-sm btn-quantum px-4 py-2 fw-950 uppercase"
                                                                                style="font-size: 9px; background: linear-gradient(135deg, #10b981, #059669);">VIEW
                                                                                REPORT</a>
                                                                        </c:if>
                                                                        <a href="${pageContext.request.contextPath}/clinic/farmer/dashboard"
                                                                            class="btn btn-sm btn-quantum px-4 py-2 fw-950 uppercase"
                                                                            style="font-size: 9px;">VIEW CLINIC HUB</a>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                        <c:if test="${empty recentConsultations}">
                                                            <tr>
                                                                <td colspan="4"
                                                                    class="text-center py-5 text-white-50 fw-800 uppercase"
                                                                    style="letter-spacing: 2px; opacity: 0.5;">No clinic
                                                                    consultations on active file</td>
                                                            </tr>
                                                        </c:if>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    </main>
                </div>

                <div class="voice-assistant-container">
                    <label class="voice-status-label" id="voiceStatus">IDLE</label>
                    <button class="voice-trigger-btn" id="startVoice">🎙️</button>
                </div>

                <script src="${pageContext.request.contextPath}/js/voice-assistant.js"></script>
                <script src="${pageContext.request.contextPath}/js/background-switcher.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                <script>
                    const hour = new Date().getHours();
                    const greeting = hour < 12 ? "Good Morning" : (hour < 17 ? "Good Afternoon" : "Good Evening");
                    document.getElementById('dynamicGreeting').innerText = greeting + ", ${user.fullName} 👋";
                    function toggleSidebar() { document.getElementById('sidebar').classList.toggle('open'); }
                </script>
            </body>

            </html>