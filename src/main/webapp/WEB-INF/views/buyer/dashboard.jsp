<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8" />
                    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                    <title>📊 Strategic Buyer Hub - AGROPLANTER V3</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
                        rel="stylesheet">
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/voice-assistant.css" />
                    <link rel="stylesheet"
                        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
                    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800;900&display=swap"
                        rel="stylesheet">
                    <link rel="icon"
                        href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>📊</text></svg>" />
                    <script>
                        window.AgroplanterUser = "${user.id}";
                        window.AgroplanterUserFull = "${user.fullName}";
                        window.AgroplanterRole = "${user.role}";
                    </script>
                    <style>
                        .v3-buyer-hero {
                            background: linear-gradient(135deg, rgba(59, 130, 246, 0.1) 0%, rgba(15, 23, 42, 0.4) 100%);
                            border: 1px solid rgba(59, 130, 246, 0.2);
                            border-radius: 40px;
                            padding: 80px 60px;
                            margin-bottom: 50px;
                            backdrop-filter: blur(40px);
                            position: relative;
                            overflow: hidden;
                        }

                        .v3-stat-node {
                            background: rgba(15, 23, 42, 0.4);
                            border: 1px solid rgba(255, 255, 255, 0.05);
                            border-radius: 35px;
                            padding: 40px;
                            backdrop-filter: blur(30px);
                            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
                        }

                        .v3-stat-node:hover {
                            transform: translateY(-10px);
                            background: rgba(15, 23, 42, 0.6);
                            border-color: rgba(59, 130, 246, 0.3);
                        }

                        .v3-nexus-panel {
                            background: rgba(15, 23, 42, 0.4);
                            border: 1px solid rgba(255, 255, 255, 0.05);
                            border-radius: 40px;
                            padding: 50px;
                            backdrop-filter: blur(40px);
                        }

                        .v3-opp-node {
                            background: rgba(15, 23, 42, 0.3);
                            border: 1px solid rgba(255, 255, 255, 0.05);
                            border-radius: 25px;
                            padding: 30px;
                            transition: 0.3s;
                        }

                        .v3-opp-node:hover {
                            border-color: rgba(59, 130, 246, 0.4);
                            background: rgba(59, 130, 246, 0.05);
                        }

                        .v3-data-table {
                            width: 100%;
                            border-collapse: separate;
                            border-spacing: 0 12px;
                        }

                        .v3-data-table td {
                            background: rgba(255, 255, 255, 0.02);
                            padding: 20px 25px;
                            border-top: 1px solid rgba(255, 255, 255, 0.03);
                            border-bottom: 1px solid rgba(255, 255, 255, 0.03);
                        }

                        .v3-data-table tr td:first-child {
                            border-radius: 20px 0 0 20px;
                            border-left: 1px solid rgba(255, 255, 255, 0.03);
                        }

                        .v3-data-table tr td:last-child {
                            border-radius: 0 20px 20px 0;
                            border-right: 1px solid rgba(255, 255, 255, 0.03);
                        }

                        .v3-identity-label {
                            font-size: 9px;
                            font-weight: 950;
                            color: #475569;
                            letter-spacing: 2px;
                            text-transform: uppercase;
                            margin-bottom: 8px;
                            display: block;
                        }

                        .v3-action-btn {
                            background: rgba(59, 130, 246, 0.1);
                            border: 1px solid rgba(59, 130, 246, 0.2);
                            color: #3b82f6;
                            padding: 10px 20px;
                            border-radius: 12px;
                            font-size: 10px;
                            font-weight: 900;
                            text-transform: uppercase;
                            letter-spacing: 1px;
                            transition: 0.3s;
                        }

                        .v3-action-btn:hover {
                            background: #3b82f6;
                            color: #fff;
                            transform: translateY(-2px);
                        }
                    </style>
                </head>

                <body style="background: #020617; color: #fff; font-family: 'Outfit', sans-serif;">
                    <div class="dashboard-scene"></div>
                    <div class="dashboard-layout">
                        <!-- V3 Premium Sidebar -->
                        <aside class="sidebar sidebar-premium" id="sidebar">
                            <div class="sidebar-brand px-4 py-4"
                                style="border-bottom: 1px solid rgba(255,255,255,0.05); cursor: pointer;"
                                onclick="window.location.href='${pageContext.request.contextPath}/'">
                                <div class="brand-premium" style="font-size: 20px;">
                                    <div class="brand-icon-box"><i class="fas fa-leaf"></i></div>
                                    <div class="brand-text">
                                        <h3 class="brand-premium m-0"
                                            style="font-size: 20px; background: linear-gradient(135deg, #3b82f6, #6366f1); -webkit-background-clip: text; background-clip: text; -webkit-text-fill-color: transparent;">
                                            AGROPLANTER</h3>
                                        <span
                                            style="font-size: 10px; color: #3b82f6; font-weight: 800; letter-spacing: 1px;">BUYER
                                            NODE V3</span>
                                    </div>
                                </div>
                            </div>

                            <nav class="sidebar-nav px-3 py-4">
                                <div class="nav-section-title px-2 mb-2"
                                    style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">
                                    PROCUREMENT NODE</div>
                                <a href="${pageContext.request.contextPath}/buyer/dashboard"
                                    class="sidebar-nav-item active mb-2">
                                    <span class="nav-icon">📊</span> Strategic View</a>
                                <a href="${pageContext.request.contextPath}/buyer/marketplace"
                                    class="sidebar-nav-item mb-2">
                                    <span class="nav-icon">🛒</span> Global Market</a>
                                <c:if test="${user.role == 'B2B_BUYER' || user.role == 'ADMIN'}">
                                    <a href="${pageContext.request.contextPath}/b2b/dashboard"
                                        class="sidebar-nav-item mb-2">
                                        <span class="nav-icon">🏬</span> Surplus Hub</a>
                                </c:if>
                                <a href="${pageContext.request.contextPath}/chat" class="sidebar-nav-item mb-2">
                                    <span class="nav-icon">💬</span> Secure Chat</a>
                                <a href="${pageContext.request.contextPath}/buyer/market-prices"
                                    class="sidebar-nav-item mb-2">
                                    <span class="nav-icon">📈</span> Mandi Intel</a>
                                <a href="${pageContext.request.contextPath}/buyer/orders" class="sidebar-nav-item mb-2">
                                    <span class="nav-icon">📦</span> Purchase Ledger</a>
                                <a href="${pageContext.request.contextPath}/buyer/schemes"
                                    class="sidebar-nav-item mb-2">
                                    <span class="nav-icon">🏛️</span> Institutional Feed</a>

                                <c:if test="${user.role eq 'MENTOR'}">
                                    <div class="nav-section-title px-2 mt-4 mb-2"
                                        style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">
                                        PROFESSIONAL</div>
                                    <a href="${pageContext.request.contextPath}/mentor/dashboard"
                                        class="sidebar-nav-item mb-2" style="color: #fbbf24;"><span
                                            class="nav-icon">🎓</span> Advisor Workspace</a>
                                </c:if>

                                <div class="nav-section-title px-2 mt-4 mb-2"
                                    style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">
                                    USER IDENTITY</div>
                                <a href="${pageContext.request.contextPath}/buyer/profile"
                                    class="sidebar-nav-item mb-2">
                                    <span class="nav-icon">👤</span> Identity Profile</a>

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
                                            style="font-size: 2.2rem; letter-spacing: -1.5px;">Strategic Sourcing</h1>
                                        <span class="v3-page-subtitle text-info uppercase"
                                            style="letter-spacing: 1px; font-weight: 800;">
                                            🌐 GLOBAL PROCUREMENT TERMINAL | TRACEABILITY: ACTIVE | NODE: V3 SECURE
                                        </span>
                                    </div>
                                </div>

                                <div class="top-nav-right">
                                    <div class="user-info"
                                        style="gap: 15px; cursor: pointer; display: flex; align-items: center;"
                                        onclick="window.location.href='${pageContext.request.contextPath}/buyer/profile'">
                                        <div class="user-details d-none d-md-flex flex-column text-end">
                                            <span class="user-name text-white fw-800"
                                                style="font-size: 14px; letter-spacing: -0.5px;">${user.fullName}</span>
                                            <span class="user-role uppercase fw-950"
                                                style="font-size: 9px; color: #3b82f6; letter-spacing: 1px;">STRATEGIC
                                                ${user.role}</span>
                                        </div>
                                        <div class="user-avatar"
                                            style="width: 48px; height: 48px; border-radius: 16px; display: flex; align-items: center; justify-content: center; overflow: hidden; border: 1px solid rgba(255,255,255,0.1); box-shadow: 0 10px 20px rgba(59, 130, 246, 0.2);">
                                            <c:choose>
                                                <c:when test="${not empty user.profileImagePath}">
                                                    <img src="${pageContext.request.contextPath}${user.profileImagePath}"
                                                        alt="Profile"
                                                        style="width: 100%; height: 100%; object-fit: cover;">
                                                </c:when>
                                                <c:otherwise>
                                                    <div
                                                        style="width: 100%; height: 100%; background: linear-gradient(135deg, #3b82f6, #6366f1); display: flex; align-items: center; justify-content: center; font-weight: 950; font-size: 20px; color: white;">
                                                        <i class="fas fa-user-circle"></i>
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                </div>
                            </header>

                            <div class="page-body px-5 py-5">
                                <div class="v3-buyer-hero">
                                    <div class="row align-items-center">
                                        <div class="col-lg-8">
                                            <h1 class="fw-950 text-white mb-3 display-4" style="letter-spacing: -3px;">
                                                Welcome, ${user.fullName}</h1>
                                            <p class="text-info fw-800 uppercase x-small mb-0"
                                                style="letter-spacing: 2px;">
                                                📡 ACCESSING VERIFIED ASSETS | TRACEABILITY: 100% | NODE:
                                                ${user.state.toUpperCase()}
                                            </p>
                                        </div>
                                        <div class="col-lg-4 text-lg-end mt-4 mt-lg-0">
                                            <div class="badge bg-info bg-opacity-10 text-info fw-950 px-5 py-3 rounded-pill uppercase"
                                                style="font-size: 10px; letter-spacing: 3px; border: 1px solid rgba(59, 130, 246, 0.2);">
                                                ${not empty user.subscriptionPlan ? user.subscriptionPlan.toUpperCase()
                                                : 'LOCAL BUYER'}
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="v3-stat-grid mb-5">
                                    <div class="v3-stat-node">
                                        <span class="v3-identity-label">MARKET OPPORTUNITIES</span>
                                        <div class="display-5 fw-950 text-white mb-1" style="letter-spacing: -2px;">
                                            ${availableListings}</div>
                                        <div class="text-white-50 x-small fw-950 uppercase"
                                            style="font-size: 8px; letter-spacing: 1.5px;">ACTIVE BATCH LISTINGS</div>
                                    </div>
                                    <div class="v3-stat-node">
                                        <span class="v3-identity-label">TELEMETRY NODES</span>
                                        <div class="display-5 fw-950 text-white mb-1" style="letter-spacing: -2px;">
                                            ${fn:length(recentPrices)}</div>
                                        <div class="text-white-50 x-small fw-950 uppercase"
                                            style="font-size: 8px; letter-spacing: 1.5px;">LIVE PRICE STREAMS</div>
                                    </div>
                                    <div class="v3-stat-node">
                                        <span class="v3-identity-label">CLOSED SUPPLY CHAINS</span>
                                        <div class="display-5 fw-950 text-info mb-1" style="letter-spacing: -2px;">
                                            ${myPurchasesCount}</div>
                                        <div class="text-white-50 x-small fw-950 uppercase"
                                            style="font-size: 8px; letter-spacing: 1.5px;">COMPLETED REQUISITIONS</div>
                                    </div>
                                </div>

                                <div class="row g-5">
                                    <div class="col-lg-8">
                                        <div class="v3-nexus-panel">
                                            <div class="d-flex justify-content-between align-items-center mb-5">
                                                <h4 class="fw-950 text-white m-0 fs-2" style="letter-spacing: -1.5px;">
                                                    🌱 High-Priority Batches</h4>
                                                <a href="${pageContext.request.contextPath}/buyer/marketplace"
                                                    class="v3-action-btn">EXPLORE ALL MARKET →</a>
                                            </div>
                                            <div class="row g-4">
                                                <c:forEach items="${recentListings}" var="l">
                                                    <div class="col-md-6">
                                                        <div class="v3-opp-node">
                                                            <div
                                                                class="d-flex justify-content-between align-items-center mb-4">
                                                                <h5 class="text-white fw-950 fs-4 m-0"
                                                                    style="letter-spacing: -1px;">${l.cropName}</h5>
                                                                <span
                                                                    class="text-info fw-950 fs-5">₹${l.pricePerUnit}/${l.unit}</span>
                                                            </div>
                                                            <div class="text-white-50 fw-600 x-small uppercase mb-5"
                                                                style="letter-spacing: 1.5px; line-height: 2;">
                                                                <div class="mb-1">📦 ${l.quantity} ${l.unit} AVAILABLE
                                                                </div>
                                                                <div class="mb-1">📍 ${l.location.toUpperCase()}</div>
                                                                <div>👨‍🌾 FARMER: ${l.farmer.fullName.toUpperCase()}
                                                                </div>
                                                            </div>
                                                            <div class="d-flex gap-3">
                                                                <a href="${pageContext.request.contextPath}/chat?with=${l.farmer.id}"
                                                                    class="v3-action-btn flex-fill text-center">CONTACT</a>
                                                                <a href="${pageContext.request.contextPath}/buyer/marketplace"
                                                                    class="v3-action-btn flex-fill text-center"
                                                                    style="background: #3b82f6; color: #fff;">SOURCE</a>
                                                            </div>
                                                            <c:if test="${not empty l.traceabilityRecord}">
                                                                <div class="mt-3">
                                                                    <a href="${pageContext.request.contextPath}/traceability/${l.traceabilityRecord.traceabilityId}"
                                                                        class="text-info fw-950 uppercase x-small d-block text-center"
                                                                        style="letter-spacing: 1.5px; text-decoration: none;">
                                                                        🌐 VALIDATE PROVENANCE PROTOCOL
                                                                    </a>
                                                                </div>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-4">
                                        <div class="v3-nexus-panel h-100">
                                            <div class="d-flex justify-content-between align-items-center mb-5">
                                                <h4 class="fw-950 text-white m-0 fs-2" style="letter-spacing: -1.5px;">
                                                    📋 Procurement Log</h4>
                                            </div>
                                            <div class="table-responsive">
                                                <table class="v3-data-table">
                                                    <thead>
                                                        <tr>
                                                            <th><span class="v3-identity-label m-0">ITEM</span></th>
                                                            <th><span class="v3-identity-label m-0">VALUATION</span>
                                                            </th>
                                                            <th class="text-end"><span
                                                                    class="v3-identity-label m-0">STATUS</span></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${recentPurchases}" var="p">
                                                            <tr>
                                                                <td>
                                                                    <div class="fw-950 text-white">${p.listing.cropName}
                                                                    </div>
                                                                </td>
                                                                <td><span class="fw-950 text-info">₹${p.amount}</span>
                                                                </td>
                                                                <td class="text-end">
                                                                    <span
                                                                        class="badge bg-info bg-opacity-10 text-info fw-950 px-2 py-1 rounded-pill uppercase"
                                                                        style="font-size: 8px; letter-spacing: 1px; border: 1px solid rgba(59, 130, 246, 0.2);">${p.status}</span>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <c:if test="${empty recentPurchases}">
                                                <div class="text-center py-5 opacity-25">
                                                    <div class="fs-1 mb-3">📋</div>
                                                    <div class="fw-950 uppercase x-small" style="letter-spacing: 2px;">
                                                        NO REQUISITIONS</div>
                                                </div>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </main>
                    </div>

                    <script src="${pageContext.request.contextPath}/js/voice-assistant.js"></script>
                    <script src="${pageContext.request.contextPath}/js/background-switcher.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                    <script>function toggleSidebar() { document.getElementById('sidebar').classList.toggle('open'); }</script>
                </body>

                </html>