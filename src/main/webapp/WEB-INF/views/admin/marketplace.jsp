<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8" />
                    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                    <title>🛒 Market Oversight - AGROPLANTER Admin</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
                        rel="stylesheet">
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/voice-assistant.css" />
                    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800;900&display=swap"
                        rel="stylesheet">
                    <link rel="icon"
                        href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🛒</text></svg>" />
                    <script>
                        window.AgroplanterUser = "${user.id}";
                        window.AgroplanterUserFull = "${user.fullName}";
                        window.AgroplanterRole = "${user.role}";
                    </script>
                    <style>
                        .v3-admin-hero {
                            background: linear-gradient(135deg, rgba(16, 185, 129, 0.1) 0%, rgba(15, 23, 42, 0.4) 100%);
                            border-radius: 40px;
                            padding: 60px;
                            margin-bottom: 50px;
                            backdrop-filter: blur(40px);
                            border: 1px solid rgba(255, 255, 255, 0.05);
                            position: relative;
                            overflow: hidden;
                        }

                        .v3-nexus-panel {
                            background: rgba(15, 23, 42, 0.4);
                            border: 1px solid rgba(255, 255, 255, 0.05);
                            border-radius: 40px;
                            padding: 35px;
                            backdrop-filter: blur(30px);
                        }

                        .v3-currency-unit {
                            font-family: 'JetBrains Mono';
                            font-weight: 950;
                            color: #fbbf24;
                            font-size: 15px;
                        }

                        .v3-status-pill {
                            padding: 6px 14px;
                            border-radius: 10px;
                            font-size: 9px;
                            font-weight: 950;
                            letter-spacing: 1px;
                            text-transform: uppercase;
                            border: 1px solid rgba(255, 255, 255, 0.05);
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
                                            style="font-size: 10px; color: #ef4444; font-weight: 800; letter-spacing: 1px;">ROOT
                                            ACCESS V3</span>
                                    </div>
                                </div>
                            </div>
                            <nav class="sidebar-nav px-3 py-4">
                                <div class="nav-section-title px-2 mb-2"
                                    style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">
                                    STRATEGIC CONTROL</div>
                                <a href="${pageContext.request.contextPath}/admin/dashboard"
                                    class="sidebar-nav-item mb-2"><span class="nav-icon">🛡️</span>
                                    Intelligence</a>
                                <a href="${pageContext.request.contextPath}/admin/users"
                                    class="sidebar-nav-item mb-2"><span class="nav-icon">👥</span> Identity Registry</a>
                                <a href="${pageContext.request.contextPath}/admin/marketplace"
                                    class="sidebar-nav-item active mb-2"><span class="nav-icon">🛒</span> Market
                                    Oversight</a>
                                <a href="${pageContext.request.contextPath}/admin/disease-queries"
                                    class="sidebar-nav-item mb-2"><span class="nav-icon">🔬</span> Bio-Triage</a>
                                <a href="${pageContext.request.contextPath}/chat" class="sidebar-nav-item mb-2"><span
                                        class="nav-icon">💬</span> Message Core</a>

                                <div class="nav-section-title px-2 mt-4 mb-2"
                                    style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">
                                    OVERSIGHT & MONITORING</div>
                                <a href="${pageContext.request.contextPath}/admin/traceability-monitor"
                                    class="sidebar-nav-item mb-2"><span class="nav-icon">🛡️</span> Traceability</a>
                                <a href="${pageContext.request.contextPath}/admin/rental-transactions"
                                    class="sidebar-nav-item mb-2"><span class="nav-icon">🚜</span> Rental Logs</a>
                                <a href="${pageContext.request.contextPath}/admin/b2b-deals"
                                    class="sidebar-nav-item mb-2"><span class="nav-icon">🏢</span> B2B Deals</a>

                                <div class="nav-section-title px-2 mt-4 mb-2"
                                    style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">
                                    SYSTEM ASSETS</div>
                                <a href="${pageContext.request.contextPath}/admin/crops"
                                    class="sidebar-nav-item mb-2"><span class="nav-icon">🌾</span> Crop Index</a>
                                <a href="${pageContext.request.contextPath}/admin/market-prices"
                                    class="sidebar-nav-item mb-2"><span class="nav-icon">📈</span> Data Streams</a>
                                <a href="${pageContext.request.contextPath}/admin/schemes"
                                    class="sidebar-nav-item mb-2"><span class="nav-icon">🏛️</span> Institutional</a>
                                <a href="${pageContext.request.contextPath}/admin/learning-videos"
                                    class="sidebar-nav-item mb-2"><span class="nav-icon">🎓</span> Academy Manager</a>

                                <div class="nav-section-title px-2 mt-4 mb-2"
                                    style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">
                                    OPERATIONS</div>
                                <a href="${pageContext.request.contextPath}/admin/equipment-approvals"
                                    class="sidebar-nav-item mb-2"><span class="nav-icon">🚜</span> Agri-Uber</a>
                                <a href="${pageContext.request.contextPath}/admin/clinic-experts"
                                    class="sidebar-nav-item mb-2"><span class="nav-icon">🩺</span> Clinic Panel</a>
                                <a href="${pageContext.request.contextPath}/admin/payouts"
                                    class="sidebar-nav-item mb-2"><span class="nav-icon">💰</span> Payout Registry</a>

                                <div class="mt-auto px-2">
                                    <a href="${pageContext.request.contextPath}/logout"
                                        class="sidebar-nav-item text-danger mt-4"><span class="nav-icon">🚪</span>
                                        Terminate Session</a>
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
                                            style="font-size: 2.2rem; letter-spacing: -1.5px;">Market Oversight</h1>
                                        <span class="v3-page-subtitle text-success uppercase"
                                            style="letter-spacing: 1px; font-weight: 800;">
                                            🛒 GLOBAL TRADE NEXUS | LIQUIDITY: MONITORING | NODE: SECURED
                                        </span>
                                    </div>
                                </div>
                                <div class="top-nav-right">
                                    <div class="user-info"
                                        style="gap: 15px; cursor: pointer; display: flex; align-items: center;"
                                        onclick="window.location.href='${pageContext.request.contextPath}/admin/marketplace'">
                                        <div class="user-details d-none d-md-flex flex-column text-end">
                                            <span class="user-name text-white fw-800"
                                                style="font-size: 14px; letter-spacing: -0.5px;">${admin.fullName}</span>
                                            <span class="user-role uppercase fw-950"
                                                style="font-size: 9px; color: #7c3aed; letter-spacing: 1px;">ROOT
                                                ACCESS: ${admin.role}</span>
                                        </div>
                                        <div class="user-avatar"
                                            style="width: 48px; height: 48px; border-radius: 16px; display: flex; align-items: center; justify-content: center; overflow: hidden; border: 1px solid rgba(255,255,255,0.1); box-shadow: 0 10px 20px rgba(124, 58, 237, 0.2);">
                                            <c:choose>
                                                <c:when test="${not empty admin.profileImagePath}">
                                                    <img src="${pageContext.request.contextPath}${admin.profileImagePath}"
                                                        alt="Profile"
                                                        style="width: 100%; height: 100%; object-fit: cover;">
                                                </c:when>
                                                <c:otherwise>
                                                    <div
                                                        style="width: 100%; height: 100%; background: linear-gradient(135deg, #7c3aed, #4f46e5); display: flex; align-items: center; justify-content: center; font-weight: 950; font-size: 20px; color: white;">
                                                        ${fn:substring(admin.fullName, 0, 1)}
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                </div>
                            </header>

                            <div class="page-body px-5 py-5">
                                <div class="v3-admin-hero">
                                    <div class="row align-items-center">
                                        <div class="col-md-9">
                                            <h1 class="fw-950 text-white mb-3 display-4" style="letter-spacing: -3px;">
                                                Marketplace Trade Intelligence</h1>
                                            <p class="text-white-50 fw-800 uppercase x-small mb-0"
                                                style="letter-spacing: 2px; opacity: 0.6;">
                                                REAL-TIME OVERSIGHT OF GLOBAL AGRICULTURAL COMMODITIES, MERCHANT
                                                PERSONAS, AND SECURE TRANSACTIONAL FLOWS.
                                            </p>
                                        </div>
                                        <div class="col-md-3 text-md-end">
                                            <div class="badge bg-green-500 bg-opacity-10 text-green-400 fw-950 px-4 py-2 rounded-pill uppercase"
                                                style="font-size: 10px; letter-spacing: 1px; border: 1px solid rgba(16, 185, 129, 0.2);">
                                                ${fn:length(listings)} ACTIVE TRADES
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="v3-nexus-panel">
                                    <div class="table-responsive">
                                        <table class="v3-data-table">
                                            <thead>
                                                <tr>
                                                    <th>COMMODITY</th>
                                                    <th>MERCHANT (OPERATOR)</th>
                                                    <th class="text-center">VOLUME</th>
                                                    <th class="text-end">UNIT VAL</th>
                                                    <th class="text-end">NET LIQUIDITY</th>
                                                    <th class="text-center">STATUS</th>
                                                    <th class="text-end">TIMESTAMP</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${listings}" var="l">
                                                    <tr>
                                                        <td><span class="text-white fw-950 fs-6"
                                                                style="letter-spacing: -0.5px;">${l.cropName.toUpperCase()}</span>
                                                        </td>
                                                        <td>
                                                            <div class="text-white fw-800 uppercase"
                                                                style="font-size: 11px;">
                                                                ${l.farmer.fullName.toUpperCase()}</div>
                                                            <div class="text-white-50 x-small fw-800 uppercase"
                                                                style="font-size: 9px; opacity: 0.4;">${l.farmer.phone}
                                                            </div>
                                                        </td>
                                                        <td class="text-center">
                                                            <span class="text-white fw-950 uppercase"
                                                                style="font-size: 12px;">${l.quantity} ${l.unit}</span>
                                                        </td>
                                                        <td class="text-end">
                                                            <span class="text-white-50 fw-800"
                                                                style="font-size: 11px;">₹${l.pricePerUnit}/${l.unit}</span>
                                                        </td>
                                                        <td class="text-end">
                                                            <span class="v3-currency-unit">₹
                                                                <fmt:formatNumber value="${l.quantity * l.pricePerUnit}"
                                                                    pattern="#,###" />
                                                            </span>
                                                        </td>
                                                        <td class="text-center">
                                                            <span
                                                                class="v3-status-pill ${l.status == 'AVAILABLE' ? 'bg-success bg-opacity-10 text-success' : 'bg-danger bg-opacity-10 text-danger'}">
                                                                ${l.status}
                                                            </span>
                                                        </td>
                                                        <td class="text-end">
                                                            <span class="text-white-50 italic fw-800 uppercase"
                                                                style="font-size: 9px; letter-spacing: 1px; opacity: 0.4;">${l.createdAt}</span>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    <c:if test="${empty listings}">
                                        <div class="text-center py-5">
                                            <div class="display-3 opacity-10 mb-5">🏟️</div>
                                            <div class="text-white-50 fw-950 uppercase"
                                                style="letter-spacing: 4px; font-size: 14px;">TRADE NEXUS INACTIVE</div>
                                            <div class="text-muted small fw-800 uppercase mt-3"
                                                style="font-size: 10px; letter-spacing: 3px;">NO ACTIVE LISTINGS IN THE
                                                SECURE SECTOR</div>
                                        </div>
                                    </c:if>
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