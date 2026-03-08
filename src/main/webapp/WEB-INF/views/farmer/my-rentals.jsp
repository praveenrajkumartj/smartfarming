<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
            <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8" />
                    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                    <title>🚜 Rental Ledger - AGROPLANTER</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
                        rel="stylesheet">
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
                        .rental-nexus-panel {
                            background: rgba(15, 23, 42, 0.4);
                            border: 1px solid rgba(255, 255, 255, 0.05);
                            border-radius: 35px;
                            overflow: hidden;
                            backdrop-filter: blur(30px);
                            position: relative;
                            margin-bottom: 50px;
                        }

                        .v3-rental-table {
                            width: 100%;
                            border-collapse: separate;
                            border-spacing: 0 12px;
                        }

                        .v3-rental-table thead th {
                            color: #475569;
                            font-size: 10px;
                            font-weight: 900;
                            letter-spacing: 2px;
                            text-transform: uppercase;
                            padding: 20px 30px;
                            border: none;
                        }

                        .v3-rental-table tbody tr td {
                            background: rgba(255, 255, 255, 0.02);
                            padding: 25px 30px;
                            border-top: 1px solid rgba(255, 255, 255, 0.05);
                            border-bottom: 1px solid rgba(255, 255, 255, 0.05);
                            vertical-align: middle;
                        }

                        .v3-rental-table tbody tr td:first-child {
                            border-left: 1px solid rgba(255, 255, 255, 0.05);
                            border-radius: 20px 0 0 20px;
                        }

                        .v3-rental-table tbody tr td:last-child {
                            border-right: 1px solid rgba(255, 255, 255, 0.05);
                            border-radius: 0 20px 20px 0;
                        }

                        .v3-rental-table tbody tr:hover td {
                            background: rgba(16, 185, 129, 0.05);
                            border-color: rgba(16, 185, 129, 0.2);
                        }

                        .v3-status-pill {
                            padding: 8px 16px;
                            border-radius: 50px;
                            font-size: 9px;
                            font-weight: 900;
                            text-transform: uppercase;
                            letter-spacing: 1px;
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
                                            style="font-size: 2.2rem; letter-spacing: -1.5px;">Rental Ledger</h1>
                                        <span class="v3-page-subtitle text-success uppercase"
                                            style="letter-spacing: 1px; font-weight: 800;">
                                            📡 LOGISTICS & SHARED PROTOCOLS ACTIVE | SESSIONS MONITORED | NODE: SECURED
                                        </span>
                                    </div>
                                </div>
                                <div class="top-nav-right">
                                    <a href="${pageContext.request.contextPath}/farmer/equipment-rental"
                                        class="btn btn-quantum px-5 py-3 fw-900 uppercase small">BACK TO HUB</a>
                                </div>
                            </header>

                            <div class="page-body px-5 py-5">
                                <c:if test="${not empty successMessage}">
                                    <div class="alert alert-success border-0 rounded-4 mb-5 text-center fw-900 uppercase small"
                                        style="background: rgba(16, 185, 129, 0.1); color: #10b981; border: 1px solid rgba(16, 185, 129, 0.2); letter-spacing: 1px;">
                                        ✅ ${successMessage}
                                    </div>
                                </c:if>

                                <div class="mb-5">
                                    <span class="trust-label uppercase d-block mb-3"
                                        style="font-size: 10px; color: #64748b; letter-spacing: 2px;">📦 OUTGOING
                                        REQUISITIONS (RENTED BY ME)</span>
                                    <div class="rental-nexus-panel p-4">
                                        <div class="table-responsive">
                                            <table class="v3-rental-table">
                                                <thead>
                                                    <tr>
                                                        <th>ASSET / LOGISTICS NODE</th>
                                                        <th>PROVIDER / OWNER</th>
                                                        <th>DEPLOYMENT PERIOD</th>
                                                        <th>NET COST</th>
                                                        <th class="text-end">STATUS</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="booking" items="${myBookings}">
                                                        <tr>
                                                            <td>
                                                                <div class="text-white fw-900 mb-1"
                                                                    style="font-size: 16px;">${booking.equipment.name}
                                                                </div>
                                                                <div class="text-white-50 x-small fw-800 uppercase"
                                                                    style="letter-spacing: 1px; font-size: 8px;">
                                                                    CATEGORY: ${booking.equipment.type}</div>
                                                            </td>
                                                            <td>
                                                                <div class="text-white fw-900" style="font-size: 14px;">
                                                                    ${booking.equipment.owner.fullName}</div>
                                                                <div class="text-info x-small fw-900 uppercase"
                                                                    style="letter-spacing: 1px; font-size: 8px;">📞
                                                                    SECURE COMMS ACTIVE</div>
                                                            </td>
                                                            <td>
                                                                <div class="text-white fw-900 x-small uppercase mb-1"
                                                                    style="font-size: 8px;">FROM: ${booking.startTime}
                                                                </div>
                                                                <div class="text-white fw-900 x-small uppercase"
                                                                    style="font-size: 8px;">UNTIL: ${booking.endTime}
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="text-success fw-900"
                                                                    style="font-size: 20px;">₹${booking.totalCost}</div>
                                                                <div class="text-white-50 x-small fw-800 uppercase"
                                                                    style="font-size: 8px;">SETTLEMENT PENDING</div>
                                                            </td>
                                                            <td class="text-end">
                                                                <c:choose>
                                                                    <c:when test="${booking.status == 'APPROVED'}"><span
                                                                            class="v3-status-pill"
                                                                            style="background: rgba(16, 185, 129, 0.1); color: #10b981; border: 1px solid rgba(16, 185, 129, 0.2);">ACTIVE
                                                                            DEPLOYMENT</span></c:when>
                                                                    <c:when test="${booking.status == 'PENDING'}"><span
                                                                            class="v3-status-pill"
                                                                            style="background: rgba(245, 158, 11, 0.1); color: #f59e0b; border: 1px solid rgba(245, 158, 11, 0.2);">AWAITING
                                                                            APPROVAL</span></c:when>
                                                                    <c:otherwise><span class="v3-status-pill"
                                                                            style="background: rgba(255,255,255,0.05); color: #94a3b8; border: 1px solid rgba(255,255,255,0.1);">${booking.status}</span>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                    <c:if test="${empty myBookings}">
                                                        <tr>
                                                            <td colspan="5" class="text-center py-5"
                                                                style="opacity: 0.2;">
                                                                <div class="display-4">🛰️</div>
                                                                <div class="text-white fw-900 uppercase mt-2">NO
                                                                    OUTGOING DEPLOYMENTS DETECTED</div>
                                                            </td>
                                                        </tr>
                                                    </c:if>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>

                                <div class="mb-5">
                                    <span class="trust-label uppercase d-block mb-3"
                                        style="font-size: 10px; color: #3b82f6; letter-spacing: 2px;">📥 INCOMING
                                        REQUISITIONS (EARNINGS FROM MY ASSETS)</span>
                                    <div class="rental-nexus-panel p-4">
                                        <div class="table-responsive">
                                            <table class="v3-rental-table">
                                                <thead>
                                                    <tr>
                                                        <th>GEAR / ASSET HUB</th>
                                                        <th>RENTER / NODE</th>
                                                        <th>SCHEDULE</th>
                                                        <th>REVENUE VALUE</th>
                                                        <th>STATUS</th>
                                                        <th class="text-end">CONTROL</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="rental" items="${receivedRentals}">
                                                        <tr>
                                                            <td>
                                                                <div class="text-white fw-900 mb-1"
                                                                    style="font-size: 16px;">${rental.equipment.name}
                                                                </div>
                                                                <div class="text-white-50 x-small fw-800 uppercase"
                                                                    style="letter-spacing: 1px; font-size: 8px;">ID:
                                                                    #${rental.equipment.id}</div>
                                                            </td>
                                                            <td>
                                                                <div class="text-white fw-900" style="font-size: 14px;">
                                                                    ${rental.renter.fullName}</div>
                                                                <div class="text-info x-small fw-900 uppercase"
                                                                    style="letter-spacing: 1px; font-size: 8px;">📞
                                                                    CONTACT ESTABLISHED</div>
                                                            </td>
                                                            <td>
                                                                <div class="text-white fw-900 x-small uppercase mb-1"
                                                                    style="font-size: 8px;">START: ${rental.startTime}
                                                                </div>
                                                                <div class="text-white fw-900 x-small uppercase"
                                                                    style="font-size: 8px;">END: ${rental.endTime}</div>
                                                            </td>
                                                            <td>
                                                                <div class="text-success fw-900"
                                                                    style="font-size: 20px;">₹${rental.totalCost}</div>
                                                            </td>
                                                            <td>
                                                                <c:choose>
                                                                    <c:when test="${rental.status == 'APPROVED'}"><span
                                                                            class="v3-status-pill"
                                                                            style="background: rgba(16, 185, 129, 0.1); color: #10b981; border: 1px solid rgba(16, 185, 129, 0.2);">DEPLOYED</span>
                                                                    </c:when>
                                                                    <c:when test="${rental.status == 'PENDING'}"><span
                                                                            class="v3-status-pill"
                                                                            style="background: rgba(245, 158, 11, 0.1); color: #f59e0b; border: 1px solid rgba(245, 158, 11, 0.2);">REQUISITIONED</span>
                                                                    </c:when>
                                                                    <c:otherwise><span class="v3-status-pill"
                                                                            style="background: rgba(255,255,255,0.05); color: #94a3b8; border: 1px solid rgba(255,255,255,0.1);">${rental.status}</span>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </td>
                                                            <td class="text-end">
                                                                <c:if test="${rental.status == 'PENDING'}">
                                                                    <div class="d-flex justify-content-end gap-2">
                                                                        <form
                                                                            action="${pageContext.request.contextPath}/farmer/equipment/rental/status"
                                                                            method="POST">
                                                                            <input type="hidden" name="rentalId"
                                                                                value="${rental.id}"><input
                                                                                type="hidden" name="status"
                                                                                value="APPROVED">
                                                                            <button type="submit"
                                                                                class="btn btn-success px-4 py-2 fw-900 uppercase x-small"
                                                                                style="font-size: 9px; border-radius: 10px;">APPROVE</button>
                                                                        </form>
                                                                        <form
                                                                            action="${pageContext.request.contextPath}/farmer/equipment/rental/status"
                                                                            method="POST">
                                                                            <input type="hidden" name="rentalId"
                                                                                value="${rental.id}"><input
                                                                                type="hidden" name="status"
                                                                                value="CANCELLED">
                                                                            <button type="submit"
                                                                                class="btn btn-outline-danger px-4 py-2 fw-900 uppercase x-small"
                                                                                style="font-size: 9px; border-radius: 10px; border-color: rgba(239, 68, 68, 0.2);">REJECT</button>
                                                                        </form>
                                                                    </div>
                                                                </c:if>
                                                                <c:if test="${rental.status == 'APPROVED'}">
                                                                    <form
                                                                        action="${pageContext.request.contextPath}/farmer/equipment/rental/status"
                                                                        method="POST">
                                                                        <input type="hidden" name="rentalId"
                                                                            value="${rental.id}"><input type="hidden"
                                                                            name="status" value="COMPLETED">
                                                                        <button type="submit"
                                                                            class="btn btn-primary px-4 py-2 fw-900 uppercase x-small"
                                                                            style="font-size: 9px; background: #6366f1; border: none; border-radius: 10px;">FINALIZE
                                                                            SESSION</button>
                                                                    </form>
                                                                </c:if>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                    <c:if test="${empty receivedRentals}">
                                                        <tr>
                                                            <td colspan="6" class="text-center py-5"
                                                                style="opacity: 0.2;">
                                                                <div class="display-4">📥</div>
                                                                <div class="text-white fw-900 uppercase mt-2">NO
                                                                    INCOMING REQUISITIONS DETECTED</div>
                                                            </td>
                                                        </tr>
                                                    </c:if>
                                                </tbody>
                                            </table>
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





