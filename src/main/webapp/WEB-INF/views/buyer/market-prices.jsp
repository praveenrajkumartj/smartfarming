<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>📈 Mandi Intel Hub - AGROPLANTER V3</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/voice-assistant.css" />
                <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800;900&display=swap"
                    rel="stylesheet">
                <link rel="icon"
                    href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>📈</text></svg>" />
                <script>
                    window.AgroplanterUser = "${not empty pageContext.request.userPrincipal ? 'true' : ''}";
                    window.AgroplanterUserFull = "${user.fullName}";
                    window.AgroplanterRole = "${user.role}";
                </script>
                <style>
                    .v3-intel-nexus {
                        background: rgba(15, 23, 42, 0.4);
                        border: 1px solid rgba(255, 255, 255, 0.05);
                        border-radius: 40px;
                        padding: 40px;
                        backdrop-filter: blur(40px);
                        margin-bottom: 40px;
                    }

                    .v3-terminal-input {
                        background: rgba(15, 23, 42, 0.6) !important;
                        border: 1px solid rgba(255, 255, 255, 0.05) !important;
                        border-radius: 16px !important;
                        color: #fff !important;
                        padding: 15px 25px !important;
                        font-family: 'Outfit' !important;
                    }

                    .v3-data-table {
                        width: 100%;
                        border-collapse: separate;
                        border-spacing: 0 12px;
                    }

                    .v3-data-table td {
                        background: rgba(255, 255, 255, 0.02);
                        padding: 25px;
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

                    .v3-price-node {
                        font-family: 'Outfit';
                        font-weight: 950;
                        color: #3b82f6;
                        font-size: 1.2rem;
                    }
                </style>
            </head>

            <body style="background: #020617; color: #fff; font-family: 'Outfit', sans-serif;">
                <div class="dashboard-scene"></div>
                <div class="dashboard-layout">
                    <!-- Sidebar -->
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
                                class="sidebar-nav-item mb-2"><span class="nav-icon">📊</span> Strategic View</a>
                            <a href="${pageContext.request.contextPath}/buyer/marketplace"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">🛒</span> Global Market</a>
                            <c:if test="${user.role == 'B2B_BUYER' || user.role == 'ADMIN'}">
                                <a href="${pageContext.request.contextPath}/b2b/dashboard"
                                    class="sidebar-nav-item mb-2">
                                    <span class="nav-icon">🏬</span> Surplus Hub</a>
                            </c:if>
                            <a href="${pageContext.request.contextPath}/chat" class="sidebar-nav-item mb-2"><span
                                    class="nav-icon">💬</span> Secure Chat</a>
                            <a href="${pageContext.request.contextPath}/buyer/market-prices"
                                class="sidebar-nav-item active mb-2"><span class="nav-icon">📈</span> Mandi Intel</a>
                            <a href="${pageContext.request.contextPath}/buyer/orders"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">📦</span> Purchase Ledger</a>
                            <a href="${pageContext.request.contextPath}/buyer/schemes"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">🏛️</span> Institutional Feed</a>
                            <div class="nav-section-title px-2 mt-4 mb-2"
                                style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">USER
                                IDENTITY</div>
                            <a href="${pageContext.request.contextPath}/buyer/profile"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">👤</span> Identity Profile</a>
                            <div class="mt-auto px-2"><a href="${pageContext.request.contextPath}/logout"
                                    class="sidebar-nav-item text-danger mt-4" style="border-radius: 12px;"><span
                                        class="nav-icon">🚪</span> Terminate Session</a></div>
                        </nav>
                    </aside>

                    <main class="main-content">
                        <header class="top-nav">
                            <div class="top-nav-left d-flex align-items-center gap-3">
                                <div class="hamburger" onclick="toggleSidebar()"><span></span><span></span><span></span>
                                </div>
                                <div class="page-title">
                                    <h1 class="m-0 fw-950 text-white"
                                        style="font-size: 2.2rem; letter-spacing: -1.5px;">Market Intelligence</h1>
                                    <span class="v3-page-subtitle text-info uppercase"
                                        style="letter-spacing: 1px; font-weight: 800;">📈 AGMARKNET REAL-TIME STREAMS |
                                        GLOBAL MANDI ANALYTICS</span>
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
                                                    alt="Profile" style="width: 100%; height: 100%; object-fit: cover;">
                                            </c:when>
                                            <c:otherwise>
                                                <div
                                                    style="width: 100%; height: 100%; background: linear-gradient(135deg, #3b82f6, #6366f1); display: flex; align-items: center; justify-content: center; font-weight: 950; font-size: 20px; color: white;">
                                                    ${fn:substring(user.fullName, 0, 1)}
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                        </header>

                        <div class="page-body px-5 py-5">
                            <div class="v3-intel-nexus">
                                <form action="${pageContext.request.contextPath}/buyer/market-prices" method="get">
                                    <div class="row g-4 align-items-end">
                                        <div class="col-md-5">
                                            <span class="v3-identity-label">COMMODITY TELEMETRY</span>
                                            <div class="input-group">
                                                <input type="text" name="search" class="form-control v3-terminal-input"
                                                    placeholder="Search across India..." value="${search}">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <span class="v3-identity-label">REGIONAL GEOSPATIAL FILTER</span>
                                            <select name="state" class="form-control v3-terminal-input"
                                                style="appearance: none;">
                                                <option value="">ALL REGIONS</option>
                                                <c:forEach items="${states}" var="s">
                                                    <option value="${s}" ${s==selectedState ? 'selected' : '' }>
                                                        ${s.toUpperCase()}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="col-md-3">
                                            <button type="submit" class="btn btn-quantum w-100 py-3"
                                                style="background: #3b82f6 !important;">ANALYZE MARKET</button>
                                        </div>
                                    </div>
                                </form>
                            </div>

                            <div class="v3-nexus-panel p-5">
                                <div class="d-flex justify-content-between align-items-center mb-5">
                                    <div class="d-flex align-items-center gap-4">
                                        <h2 class="fw-950 text-white m-0" style="letter-spacing: -1.5px;">Live Mandi
                                            Quotes</h2>
                                        <span
                                            class="badge bg-info bg-opacity-10 text-info fw-950 px-3 py-2 rounded-pill x-small"
                                            style="letter-spacing: 1px;">${fn:length(prices)} STREAMS DETECTED</span>
                                    </div>
                                </div>

                                <div class="table-responsive">
                                    <table class="v3-data-table">
                                        <thead>
                                            <tr>
                                                <th><span class="v3-identity-label m-0">COMMODITY</span></th>
                                                <th><span class="v3-identity-label m-0">MANDI</span></th>
                                                <th><span class="v3-identity-label m-0">REGION</span></th>
                                                <th><span class="v3-identity-label m-0">MIN</span></th>
                                                <th><span class="v3-identity-label m-0">MAX</span></th>
                                                <th><span class="v3-identity-label m-0">MODAL</span></th>
                                                <th class="text-end"><span
                                                        class="v3-identity-label m-0">TIMESTAMP</span></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${prices}" var="price">
                                                <tr style="transition: 0.3s;"
                                                    onmouseover="this.style.background='rgba(59, 130, 246, 0.05)'"
                                                    onmouseout="this.style.background='transparent'">
                                                    <td>
                                                        <div class="fw-950 text-white" style="font-size: 1.1rem;">
                                                            ${price.cropName}</div>
                                                    </td>
                                                    <td class="text-white-50 fw-600">${price.market}</td>
                                                    <td><span
                                                            class="badge bg-info bg-opacity-10 text-info fw-950 px-2 py-1 rounded-pill"
                                                            style="font-size: 9px;">${price.state.toUpperCase()}</span>
                                                    </td>
                                                    <td class="fw-800 opacity-75">₹${price.minPrice}</td>
                                                    <td class="fw-800 opacity-75">₹${price.maxPrice}</td>
                                                    <td>
                                                        <div class="v3-price-node">₹${price.modalPrice}</div>
                                                    </td>
                                                    <td class="text-end text-white-50 x-small fw-600 uppercase"
                                                        style="letter-spacing: 1px;">${price.priceDate}</td>
                                                </tr>
                                            </c:forEach>
                                            <c:if test="${empty prices}">
                                                <tr>
                                                    <td colspan="7" class="text-center py-5 opacity-25">
                                                        <div class="display-1 mb-4">📉</div>
                                                        <h4 class="fw-900 uppercase" style="letter-spacing: 3px;">NO
                                                            MARKET STREAMS DETECTED</h4>
                                                    </td>
                                                </tr>
                                            </c:if>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </main>
                </div>

                <script src="${pageContext.request.contextPath}/js/background-switcher.js"></script>
                <script src="${pageContext.request.contextPath}/js/i18n.js"></script>
                <script src="${pageContext.request.contextPath}/js/voice-assistant.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                <script>function toggleSidebar() { document.getElementById('sidebar').classList.toggle('open'); }</script>
            </body>

            </html>





