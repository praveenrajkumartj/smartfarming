<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
            <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8" />
                    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                    <title>📈 Trade Orders - AGROPLANTER</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
                        rel="stylesheet">
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
                        .orders-nexus-panel {
                            background: rgba(15, 23, 42, 0.4);
                            border: 1px solid rgba(255, 255, 255, 0.05);
                            border-radius: 35px;
                            overflow: hidden;
                            backdrop-filter: blur(30px);
                            position: relative;
                        }

                        .v3-orders-table {
                            width: 100%;
                            border-collapse: separate;
                            border-spacing: 0 12px;
                        }

                        .v3-orders-table thead th {
                            color: #475569;
                            font-size: 10px;
                            font-weight: 900;
                            letter-spacing: 2px;
                            text-transform: uppercase;
                            padding: 20px 30px;
                            border: none;
                        }

                        .v3-orders-table tbody tr td {
                            background: rgba(255, 255, 255, 0.02);
                            padding: 25px 30px;
                            border-top: 1px solid rgba(255, 255, 255, 0.05);
                            border-bottom: 1px solid rgba(255, 255, 255, 0.05);
                            vertical-align: middle;
                        }

                        .v3-orders-table tbody tr td:first-child {
                            border-left: 1px solid rgba(255, 255, 255, 0.05);
                            border-radius: 20px 0 0 20px;
                        }

                        .v3-orders-table tbody tr td:last-child {
                            border-right: 1px solid rgba(255, 255, 255, 0.05);
                            border-radius: 0 20px 20px 0;
                        }

                        .v3-orders-table tbody tr:hover td {
                            background: rgba(16, 185, 129, 0.05);
                            border-color: rgba(16, 185, 129, 0.2);
                        }

                        .order-id-nexus {
                            display: inline-block;
                            background: rgba(255, 255, 255, 0.03);
                            border: 1px solid rgba(255, 255, 255, 0.05);
                            padding: 4px 12px;
                            border-radius: 8px;
                            font-family: 'Outfit';
                            font-weight: 900;
                            font-size: 9px;
                            color: #64748b;
                            letter-spacing: 1px;
                            margin-bottom: 12px;
                        }

                        .v3-status-pill {
                            padding: 8px 16px;
                            border-radius: 50px;
                            font-size: 9px;
                            font-weight: 900;
                            text-transform: uppercase;
                            letter-spacing: 1px;
                        }

                        .v3-earnings {
                            font-size: 22px;
                            font-weight: 900;
                            color: #10b981;
                            letter-spacing: -1px;
                        }

                        .v3-modal-nexus {
                            position: fixed;
                            top: 0;
                            left: 0;
                            width: 100%;
                            height: 100%;
                            background: rgba(2, 6, 23, 0.85);
                            backdrop-filter: blur(15px);
                            display: none;
                            align-items: center;
                            justify-content: center;
                            z-index: 10000;
                        }

                        .v3-modal-nexus.show {
                            display: flex;
                        }

                        .v3-modal-content {
                            background: #0f172a;
                            border: 1px solid rgba(255, 255, 255, 0.05);
                            border-radius: 35px;
                            width: 500px;
                            overflow: hidden;
                            box-shadow: 0 40px 80px rgba(0, 0, 0, 0.6);
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
                                    style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">
                                    MARKET OPS</div>
                                <a href="${pageContext.request.contextPath}/farmer/marketplace"
                                    class="sidebar-nav-item mb-2"><span class="nav-icon">🛍️</span> Global Market</a>
                                <a href="${pageContext.request.contextPath}/farmer/orders"
                                    class="sidebar-nav-item active mb-2"><span class="nav-icon">📈</span> Trade
                                    Orders</a>
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
                                    style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">
                                    FINANCE & SAFETY</div>
                                <a href="${pageContext.request.contextPath}/farmer/finance"
                                    class="sidebar-nav-item mb-2"><span class="nav-icon">💰</span> Capital Hub</a>
                                <a href="${pageContext.request.contextPath}/farmer/safety-hub"
                                    class="sidebar-nav-item mb-2"><span class="nav-icon">🛡️</span> Safety HQ</a>

                                <div class="nav-section-title px-2 mt-4 mb-2"
                                    style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">
                                    ACCOUNT OPS</div>
                                <a href="${pageContext.request.contextPath}/farmer/profile"
                                    class="sidebar-nav-item mb-2"><span class="nav-icon"
                                        style="color: #8b5cf6;">👤</span> Profile Node</a>
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
                                            style="font-size: 2.2rem; letter-spacing: -1.5px;">Trade Orders</h1>
                                        <span class="v3-page-subtitle text-success uppercase"
                                            style="letter-spacing: 1px; font-weight: 800;">
                                            📡 GLOBAL LOGISTICS TRACKER | ACTIVE REVENUE STREAMS: ${fn:length(sales)} |
                                            NODE: SECURED
                                        </span>
                                    </div>
                                </div>
                            </header>

                            <div class="page-body px-5 py-5">
                                <c:if test="${not empty successMessage}">
                                    <div class="alert alert-success border-0 rounded-4 mb-5 text-center fw-900 uppercase small"
                                        style="background: rgba(16, 185, 129, 0.1); color: #10b981; border: 1px solid rgba(16, 185, 129, 0.2); letter-spacing: 1px;">
                                        ✅ ${successMessage}
                                    </div>
                                </c:if>

                                <div id="statusToast"
                                    style="position: fixed; top: 100px; right: 30px; background: rgba(15, 23, 42, 0.9); border: 1px solid #10b981; border-radius: 20px; padding: 20px 30px; z-index: 9999; display: flex; align-items: center; gap: 15px; opacity: 0; pointer-events: none; transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275); transform: translateX(50px); backdrop-filter: blur(10px); box-shadow: 0 20px 40px rgba(0,0,0,0.5), 0 0 20px rgba(16, 185, 129, 0.2);">
                                    <div id="toastIcon" style="font-size: 24px; color: #10b981;"><i
                                            class="fas fa-check-circle"></i>
                                    </div>
                                    <div>
                                        <div id="toastTitle" class="text-success fw-900 uppercase"
                                            style="font-size: 13px; letter-spacing: 1px;">PROTOCOL SUCCESS</div>
                                        <div id="toastMessage" class="text-white-50 fw-600"
                                            style="font-size: 11px; margin-top: 4px;">
                                            Operation has been successfully completed.</div>
                                    </div>
                                </div>

                                <div class="orders-nexus-panel p-4">
                                    <div class="d-flex justify-content-between align-items-center mb-4 px-3">
                                        <div>
                                            <span class="trust-label uppercase d-block mb-1"
                                                style="font-size: 9px; color: #64748b;">COMMODITY EXCHANGE LEDGER</span>
                                            <h4 class="text-white fw-900 m-0" style="letter-spacing: -1px;">TRADE
                                                TRANSACTIONS</h4>
                                        </div>
                                    </div>

                                    <div class="table-responsive">
                                        <table class="v3-orders-table">
                                            <thead>
                                                <tr>
                                                    <th>TRANSACTION IDENTIFIER</th>
                                                    <th>CROP PARTNER / BUYER</th>
                                                    <th>NET REVENUE</th>
                                                    <th>LOGISTICS STATUS</th>
                                                    <th>TRACKING TELEMETRY</th>
                                                    <th class="text-end">MANAGEMENT</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:if test="${empty sales}">
                                                    <tr>
                                                        <td colspan="6" class="text-center py-5" style="opacity: 0.2;">
                                                            <div class="display-3 mb-2">📦</div>
                                                            <div class="text-white fw-900 uppercase">NO ACTIVE
                                                                TRANSACTIONS DETECTED</div>
                                                        </td>
                                                    </tr>
                                                </c:if>
                                                <c:forEach items="${sales}" var="s">
                                                    <tr>
                                                        <td>
                                                            <div class="order-id-nexus">ORD-PRT-${s.id}</div>
                                                            <div class="text-white fw-900" style="font-size: 16px;">
                                                                ${not empty s.listing ? s.listing.cropName : 'DIRECT
                                                                TRADING'}</div>
                                                            <div class="text-white-50 x-small fw-800 uppercase"
                                                                style="letter-spacing: 0.5px; font-size: 8px;">QUANTITY:
                                                                ${s.quantity} ${not empty s.listing ? s.listing.unit :
                                                                'UNITS'}</div>
                                                        </td>
                                                        <td>
                                                            <div class="text-white fw-900 mb-1"
                                                                style="font-size: 15px;">${not empty s.buyer ?
                                                                s.buyer.fullName : 'PREMIUM PARTNER'}</div>
                                                            <div class="text-info x-small fw-900 uppercase"
                                                                style="letter-spacing: 1px; font-size: 9px;">📞 CONTACT:
                                                                ${not empty s.buyer ? s.buyer.phone : 'SECURE'}</div>
                                                        </td>
                                                        <td>
                                                            <div class="v3-earnings">₹
                                                                <fmt:formatNumber value="${s.finalEarnings}"
                                                                    maxFractionDigits="2" />
                                                            </div>
                                                            <c:choose>
                                                                <c:when test="${s.paymentMethod == 'COD'}"><span
                                                                        class="badge bg-warning bg-opacity-10 text-warning x-small fw-900 uppercase"
                                                                        style="font-size: 8px; letter-spacing: 1px;">WAITING
                                                                        FOR SETTLEMENT</span></c:when>
                                                                <c:otherwise><span
                                                                        class="badge bg-info bg-opacity-10 text-info x-small fw-900 uppercase"
                                                                        style="font-size: 8px; letter-spacing: 1px;">SETTLEMENT
                                                                        SECURED</span></c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${s.orderStatus == 'PENDING'}"><span
                                                                        class="v3-status-pill"
                                                                        style="background: rgba(245, 158, 11, 0.1); color: #f59e0b; border: 1px solid rgba(245, 158, 11, 0.2);">AWAITING
                                                                        PICKUP</span></c:when>
                                                                <c:when test="${s.orderStatus == 'SHIPPED'}"><span
                                                                        class="v3-status-pill"
                                                                        style="background: rgba(59, 130, 246, 0.1); color: #3b82f6; border: 1px solid rgba(59, 130, 246, 0.2);">GLOBAL
                                                                        TRANSIT</span></c:when>
                                                                <c:when test="${s.orderStatus == 'DELIVERED'}"><span
                                                                        class="v3-status-pill"
                                                                        style="background: rgba(16, 185, 129, 0.1); color: #10b981; border: 1px solid rgba(16, 185, 129, 0.2);">DELIVERY
                                                                        SECURED</span></c:when>
                                                                <c:otherwise><span class="v3-status-pill"
                                                                        style="background: rgba(255,255,255,0.05); color: #94a3b8; border: 1px solid rgba(255,255,255,0.1);">${s.orderStatus}</span>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                        <td>
                                                            <c:if test="${not empty s.trackingNumber}">
                                                                <div
                                                                    class="text-white-50 x-small fw-900 uppercase mb-1">
                                                                    NETWORK ID:</div>
                                                                <div class="text-info fw-900"
                                                                    style="font-family: 'Outfit'; letter-spacing: 1px;">
                                                                    ${s.trackingNumber}</div>
                                                            </c:if>
                                                            <c:if test="${empty s.trackingNumber}">
                                                                <button
                                                                    class="btn btn-nexus-send px-3 py-2 fw-900 uppercase small"
                                                                    style="font-size: 10px; color: #10b981; background: rgba(16, 185, 129, 0.1); border: 1px solid rgba(16, 185, 129, 0.2);"
                                                                    onclick="openModal('shipModal${s.id}')">+ INITIALIZE
                                                                    TRACKING</button>
                                                            </c:if>
                                                        </td>
                                                        <td class="text-end">
                                                            <div class="dropdown">
                                                                <button
                                                                    class="btn btn-outline-light dropdown-toggle px-3 py-2 fw-900 uppercase small"
                                                                    type="button" data-bs-toggle="dropdown"
                                                                    style="font-size: 10px; border-radius: 10px; border-color: rgba(255,255,255,0.1);">ACCESS
                                                                    OPS</button>
                                                                <ul class="dropdown-menu dropdown-menu-dark dropdown-menu-end shadow-lg border-0 p-2"
                                                                    style="background: #1e293b; border-radius: 20px; box-shadow: 0 20px 40px rgba(0,0,0,0.4);">
                                                                    <c:if test="${s.orderStatus == 'SHIPPED'}">
                                                                        <li>
                                                                            <form
                                                                                action="${pageContext.request.contextPath}/farmer/orders/status/${s.id}"
                                                                                method="post"><input type="hidden"
                                                                                    name="status"
                                                                                    value="DELIVERED"><button
                                                                                    type="submit"
                                                                                    class="dropdown-item py-2 px-3 fw-800 uppercase x-small"
                                                                                    style="color: #10b981; font-size: 10px;">MARK
                                                                                    DELIVERED</button></form>
                                                                        </li>
                                                                    </c:if>
                                                                    <li><a class="dropdown-item py-2 px-3 fw-800 uppercase x-small"
                                                                            style="font-size: 10px;"
                                                                            href="${pageContext.request.contextPath}/chat?with=${s.buyer.id}">INITIATE
                                                                            COMMS</a></li>
                                                                    <li><a class="dropdown-item py-2 px-3 fw-800 uppercase x-small location-data-btn"
                                                                            style="font-size: 10px;" href="#"
                                                                            data-address="${fn:escapeXml(s.shippingAddress)}">LOCATION
                                                                            DATA</a></li>
                                                                    <li>
                                                                        <hr class="dropdown-divider opacity-10">
                                                                    </li>
                                                                    <li>
                                                                        <form
                                                                            action="${pageContext.request.contextPath}/farmer/orders/delete/${s.id}"
                                                                            method="post"><button type="submit"
                                                                                class="dropdown-item py-2 px-3 fw-800 uppercase x-small text-danger"
                                                                                style="font-size: 10px;">PURGE
                                                                                RECORD</button></form>
                                                                    </li>
                                                                </ul>
                                                            </div>

                                                            <!-- Modal: Logistics Deployment -->
                                                            <div class="v3-modal-nexus" id="shipModal${s.id}">
                                                                <div class="v3-modal-content">
                                                                    <div
                                                                        class="p-5 border-bottom border-white border-opacity-5 d-flex justify-content-between align-items-center">
                                                                        <div class="page-title">
                                                                            <h4 class="text-white fw-900 uppercase m-0"
                                                                                style="letter-spacing: -1px;">Logistics
                                                                                Deployment</h4>
                                                                            <span
                                                                                class="text-success x-small fw-800 uppercase"
                                                                                style="letter-spacing: 1px;">INITIALIZING
                                                                                TRANSIT PROTOCOL</span>
                                                                        </div>
                                                                        <button type="button"
                                                                            class="btn-close btn-close-white"
                                                                            onclick="closeModal('shipModal${s.id}')"></button>
                                                                    </div>
                                                                    <form
                                                                        action="${pageContext.request.contextPath}/farmer/orders/ship/${s.id}"
                                                                        method="post">
                                                                        <div class="p-5">
                                                                            <span
                                                                                class="trust-label uppercase mb-3 d-block"
                                                                                style="font-size: 8px;">TRACKING / AWB
                                                                                IDENTIFIER</span>
                                                                            <input type="text" name="trackingNumber"
                                                                                class="form-control v3-terminal-input"
                                                                                placeholder="e.g. XPRESS-T-99880"
                                                                                required>
                                                                            <div class="mt-5 p-4 rounded-4"
                                                                                style="background: rgba(16, 185, 129, 0.03); border: 1px solid rgba(16, 185, 129, 0.1);">
                                                                                <div class="text-white-50 x-small fw-900 mb-2 uppercase"
                                                                                    style="font-size: 8px;">DESTINATION
                                                                                    NODE:</div>
                                                                                <div class="text-white fw-900"
                                                                                    style="font-size: 14px;">
                                                                                    ${s.shippingAddress}</div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="p-5 pt-0">
                                                                            <button type="submit"
                                                                                class="btn btn-quantum w-100 py-4 fw-900 uppercase">FINALIZE
                                                                                LOGISTICS DEPLOYMENT →</button>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </main>
                    </div>

                    <script src="${pageContext.request.contextPath}/js/background-switcher.js"></script>
                    <script src="${pageContext.request.contextPath}/js/voice-assistant.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                    <script>
                        function toggleSidebar() { document.getElementById('sidebar').classList.toggle('open'); }
                        function openModal(id) { document.getElementById(id).classList.add('show'); }
                        function closeModal(id) { document.getElementById(id).classList.remove('show'); }

                        function showToast(title, message, isError = false) {
                            const toast = document.getElementById('statusToast');
                            const titleEl = document.getElementById('toastTitle');
                            const msgEl = document.getElementById('toastMessage');
                            const iconEl = document.getElementById('toastIcon');

                            titleEl.innerText = title;
                            msgEl.innerHTML = message;

                            if (isError) {
                                toast.style.borderColor = '#ef4444';
                                titleEl.style.color = '#ef4444';
                                iconEl.style.color = '#ef4444';
                                iconEl.innerHTML = '<i class="fas fa-exclamation-circle"></i>';
                            } else {
                                toast.style.borderColor = '#10b981';
                                titleEl.style.color = '#10b981';
                                iconEl.style.color = '#10b981';
                                iconEl.innerHTML = '<i class="fas fa-check-circle"></i>';
                            }

                            toast.style.opacity = '1';
                            toast.style.transform = 'translateX(0)';
                            toast.style.pointerEvents = 'auto';

                            setTimeout(() => {
                                toast.style.opacity = '0';
                                toast.style.transform = 'translateX(50px)';
                                toast.style.pointerEvents = 'none';
                            }, 4000);
                        }

                        document.querySelectorAll('.location-data-btn').forEach(btn => {
                            btn.addEventListener('click', (e) => {
                                e.preventDefault();
                                const address = btn.getAttribute('data-address');
                                if (!address || address.trim() === "" || address === "null") {
                                    showToast('LOGISTICS ERROR', 'NO DESTINATION TELEMETRY DETECTED', true);
                                    return;
                                }
                                const mapUrl = "https://www.google.com/maps/search/?api=1&query=" + encodeURIComponent(address);
                                const html = `DESTINATION NODE: <br><span class="text-white fw-900" style="font-size: 11px;">\${address}</span><br><a href="\${mapUrl}" target="_blank" class="btn btn-sm btn-quantum mt-3 py-2 px-3 fw-950 uppercase" style="font-size: 8px;">🛰️ OPEN IN NAVIGATOR →</a>`;
                                showToast('LOGISTICS DATA', html, false);
                            });
                        });
                    </script>
                </body>

                </html>