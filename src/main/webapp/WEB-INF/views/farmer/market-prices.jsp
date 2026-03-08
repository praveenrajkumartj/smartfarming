<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>📈 Live Mandi Intelligence - AGROPLANTER</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/voice-assistant.css" />
                <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800;900&display=swap"
                    rel="stylesheet">
                <link rel="icon"
                    href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>📈</text></svg>" />
                <script>
                    window.AgroplanterUser = "${user.id}";
                    window.AgroplanterUserFull = "${user.fullName}";
                    window.AgroplanterRole = "${user.role}";
                </script>
                <style>
                    .v3-scanner-terminal {
                        background: rgba(15, 23, 42, 0.4);
                        border: 1px solid rgba(16, 185, 129, 0.1);
                        border-radius: 35px;
                        padding: 40px;
                        margin-bottom: 40px;
                        backdrop-filter: blur(30px);
                        position: relative;
                        overflow: hidden;
                    }

                    .v3-scanner-terminal::after {
                        content: 'SCANNER';
                        position: absolute;
                        right: -20px;
                        top: -20px;
                        font-size: 100px;
                        font-weight: 950;
                        color: white;
                        opacity: 0.02;
                        pointer-events: none;
                    }

                    .v3-mandi-nexus {
                        background: rgba(15, 23, 42, 0.4);
                        border: 1px solid rgba(255, 255, 255, 0.05);
                        border-radius: 40px;
                        overflow: hidden;
                        backdrop-filter: blur(30px);
                        position: relative;
                    }

                    .v3-mandi-table {
                        width: 100%;
                        border-collapse: separate;
                        border-spacing: 0;
                    }

                    .v3-mandi-table thead th {
                        color: #475569;
                        font-size: 10px;
                        font-weight: 900;
                        letter-spacing: 2px;
                        text-transform: uppercase;
                        padding: 25px 40px;
                        background: rgba(255, 255, 255, 0.01);
                        border: none;
                    }

                    .v3-mandi-table tbody td {
                        padding: 30px 40px;
                        border-top: 1px solid rgba(255, 255, 255, 0.05);
                        vertical-align: middle;
                        transition: 0.3s;
                    }

                    .v3-mandi-table tbody tr:hover td {
                        background: rgba(16, 185, 129, 0.05);
                        border-top-color: rgba(16, 185, 129, 0.1);
                    }

                    .v3-terminal-select {
                        background: rgba(255, 255, 255, 0.02) !important;
                        border: 1px solid rgba(255, 255, 255, 0.05) !important;
                        border-radius: 16px !important;
                        color: white !important;
                        padding: 16px 24px !important;
                        font-weight: 600 !important;
                        font-family: 'Outfit';
                    }

                    .v3-terminal-select:focus {
                        border-color: #10b981 !important;
                        background: rgba(255, 255, 255, 0.05) !important;
                        box-shadow: 0 0 0 4px rgba(16, 185, 129, 0.1) !important;
                    }

                    .v3-price-node {
                        font-size: 1.8rem;
                        font-weight: 950;
                        color: #10b981;
                        letter-spacing: -1.5px;
                        line-height: 1;
                    }

                    .v3-hub-pill {
                        background: rgba(59, 130, 246, 0.1);
                        color: #60a5fa;
                        font-size: 8px;
                        font-weight: 950;
                        padding: 6px 16px;
                        border-radius: 50px;
                        text-transform: uppercase;
                        letter-spacing: 1.5px;
                        border: 1px solid rgba(59, 130, 246, 0.1);
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
                                class="sidebar-nav-item active mb-2"><span class="nav-icon">📊</span> Live Mandi</a>
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
                                        style="font-size: 2.2rem; letter-spacing: -1.5px;">Live Mandi</h1>
                                    <span class="v3-page-subtitle text-success uppercase"
                                        style="letter-spacing: 1px; font-weight: 800;">
                                        📡 REAL-TIME COMMODITY TELEMETRY | CURRENCY: INR | UNIT: PER QUINTAL | NODE:
                                        SECURED
                                    </span>
                                </div>
                            </div>
                        </header>

                        <div class="page-body px-5 py-5">
                            <div class="v3-scanner-terminal">
                                <form action="${pageContext.request.contextPath}/farmer/market-prices" method="get">
                                    <div class="row g-4 align-items-end">
                                        <div class="col-md-5">
                                            <span class="trust-label uppercase mb-3 d-block"
                                                style="font-size: 10px; letter-spacing: 2px; color: #64748b;">COMMODITY
                                                SCANNER</span>
                                            <input type="text" name="search" class="form-control v3-terminal-select"
                                                placeholder="Enter commodity identity..." value="${search}">
                                        </div>
                                        <div class="col-md-4">
                                            <span class="trust-label uppercase mb-3 d-block"
                                                style="font-size: 10px; letter-spacing: 2px; color: #64748b;">REGIONAL
                                                TRADING HUB</span>
                                            <select name="state" class="form-select v3-terminal-select">
                                                <option value="">ALL FEDERATION STATES</option>
                                                <c:forEach items="${states}" var="s">
                                                    <option value="${s}" ${s==selectedState ? 'selected' : '' }>
                                                        ${s.toUpperCase()}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="col-md-3">
                                            <button type="submit"
                                                class="btn btn-quantum w-100 py-4 fw-900 uppercase">RUN PRICE ANALYSIS
                                                →</button>
                                        </div>
                                    </div>
                                </form>
                            </div>

                            <div class="v3-mandi-nexus">
                                <div class="px-5 py-4 d-flex justify-content-between align-items-center"
                                    style="background: rgba(255,255,255,0.01); border-bottom: 1px solid rgba(255,255,255,0.05);">
                                    <span class="trust-label uppercase m-0"
                                        style="font-size: 11px; letter-spacing: 3px; color: #10b981;">LIVE COMMODITY
                                        PRICE STREAM</span>
                                    <div class="d-flex align-items-center gap-3">
                                        <div class="pulse-green"></div>
                                        <span class="text-white-50 x-small fw-950 uppercase"
                                            style="font-size: 8px; letter-spacing: 1px;">PRECISION SYNC: 100%</span>
                                    </div>
                                </div>
                                <div class="table-responsive">
                                    <table class="v3-mandi-table">
                                        <thead>
                                            <tr>
                                                <th>COMMODITY ASSET</th>
                                                <th>TRADING HUB (MANDI)</th>
                                                <th>VALUATION RANGE (MIN - MAX)</th>
                                                <th class="text-end">MODAL UNIT PRICE</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${prices}" var="price">
                                                <tr>
                                                    <td>
                                                        <div class="text-white fw-900 fs-4 mb-2"
                                                            style="letter-spacing: -0.5px;">${price.cropName}</div>
                                                        <div class="text-white-50 x-small fw-950 uppercase"
                                                            style="font-size: 7px; letter-spacing: 1.5px; opacity: 0.5;">
                                                            TRACE-NODE: #${price.id}</div>
                                                    </td>
                                                    <td>
                                                        <div class="text-white fw-900 fs-5 mb-2">
                                                            ${price.market.toUpperCase()}</div>
                                                        <span class="v3-hub-pill">${price.state}</span>
                                                    </td>
                                                    <td>
                                                        <div class="text-white-50 fw-950 fs-6"
                                                            style="font-family: 'JetBrains Mono', monospace; opacity: 0.8;">
                                                            ₹ ${price.minPrice} <span
                                                                style="opacity: 0.2; margin: 0 10px;">||</span> ₹
                                                            ${price.maxPrice}
                                                        </div>
                                                        <div class="text-white-50 x-small fw-900 uppercase mt-2"
                                                            style="font-size: 7px; letter-spacing: 1px;">NODAL RANGE
                                                            EXPORTED</div>
                                                    </td>
                                                    <td class="text-end">
                                                        <div class="v3-price-node">₹${price.modalPrice}</div>
                                                        <div class="text-white-50 x-small fw-950 uppercase mt-2"
                                                            style="font-size: 7px; letter-spacing: 1px; color: #475569 !important;">
                                                            COMMODITY VALUE PULSE</div>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <c:if test="${empty prices}">
                                    <div class="text-center py-5" style="opacity: 0.2;">
                                        <div class="display-3 mb-3">📈</div>
                                        <div class="fw-900 uppercase fs-5" style="letter-spacing: 3px;">NO TRADING
                                            TELEMETRY PULSED</div>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </main>
                </div>

                <script src="${pageContext.request.contextPath}/js/voice-assistant.js"></script>
                <script src="${pageContext.request.contextPath}/js/background-switcher.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                <script>
                    function toggleSidebar() { document.getElementById('sidebar').classList.toggle('open'); }
                </script>
            </body>

            </html>





