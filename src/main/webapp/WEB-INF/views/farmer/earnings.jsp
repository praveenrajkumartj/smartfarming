<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
            <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8" />
                    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                    <title>📈 Revenue Analytics - AGROPLANTER</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
                        rel="stylesheet">
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/voice-assistant.css" />
                    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800;900&display=swap"
                        rel="stylesheet">
                    <link rel="icon"
                        href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>📈</text></svg>" />
                    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
                    <script>
                        window.AgroplanterUser = "${user.id}";
                        window.AgroplanterUserFull = "${user.fullName}";
                        window.AgroplanterRole = "${user.role}";
                    </script>
                    <style>
                        .revenue-stat-node {
                            background: rgba(15, 23, 42, 0.4);
                            border: 1px solid rgba(255, 255, 255, 0.05);
                            border-radius: 30px;
                            padding: 35px;
                            backdrop-filter: blur(30px);
                            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
                            position: relative;
                            overflow: hidden;
                        }

                        .revenue-stat-node:hover {
                            transform: translateY(-10px);
                            border-color: rgba(16, 185, 129, 0.3);
                            background: rgba(15, 23, 42, 0.5);
                        }

                        .revenue-stat-node::after {
                            content: '';
                            position: absolute;
                            top: -50%;
                            left: -50%;
                            width: 200%;
                            height: 200%;
                            background: radial-gradient(circle, rgba(16, 185, 129, 0.03) 0%, transparent 70%);
                            pointer-events: none;
                        }

                        .v3-value-text {
                            font-size: 2.8rem;
                            font-weight: 900;
                            color: #10b981;
                            letter-spacing: -2px;
                            margin-bottom: 10px;
                        }

                        .earnings-nexus-panel {
                            background: rgba(15, 23, 42, 0.4);
                            border: 1px solid rgba(255, 255, 255, 0.05);
                            border-radius: 35px;
                            overflow: hidden;
                            backdrop-filter: blur(30px);
                            position: relative;
                            margin-bottom: 50px;
                        }

                        .v3-earnings-table {
                            width: 100%;
                            border-collapse: separate;
                            border-spacing: 0 12px;
                        }

                        .v3-earnings-table thead th {
                            color: #475569;
                            font-size: 10px;
                            font-weight: 900;
                            letter-spacing: 2px;
                            text-transform: uppercase;
                            padding: 20px 30px;
                            border: none;
                        }

                        .v3-earnings-table tbody tr td {
                            background: rgba(255, 255, 255, 0.02);
                            padding: 25px 30px;
                            border-top: 1px solid rgba(255, 255, 255, 0.05);
                            border-bottom: 1px solid rgba(255, 255, 255, 0.05);
                            vertical-align: middle;
                        }

                        .v3-earnings-table tbody tr td:first-child {
                            border-left: 1px solid rgba(255, 255, 255, 0.05);
                            border-radius: 20px 0 0 20px;
                        }

                        .v3-earnings-table tbody tr td:last-child {
                            border-right: 1px solid rgba(255, 255, 255, 0.05);
                            border-radius: 0 20px 20px 0;
                        }

                        .v3-earnings-table tbody tr:hover td {
                            background: rgba(16, 185, 129, 0.05);
                            border-color: rgba(16, 185, 129, 0.2);
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
                                    class="sidebar-nav-item active mb-2"><span class="nav-icon">💰</span> Capital
                                    Hub</a>
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
                                            style="font-size: 2.2rem; letter-spacing: -1.5px;">Revenue Analytics</h1>
                                        <span class="v3-page-subtitle text-success uppercase"
                                            style="letter-spacing: 1px; font-weight: 800;">
                                            📡 REVENUE TELEMETRY & TRANSACTION INTELLIGENCE ACTIVE | STATUS: OPERATIONAL
                                            | NODE: SECURED
                                        </span>
                                    </div>
                                </div>
                                <div class="top-nav-right">
                                    <button class="btn btn-quantum px-5 py-3 fw-900 uppercase small"
                                        onclick="window.location.href='${pageContext.request.contextPath}/farmer/finance'">INITIATE
                                        WITHDRAWAL</button>
                                </div>
                            </header>

                            <div class="page-body px-5 py-5">
                                <div class="row g-4 mb-5">
                                    <div class="col-md-4">
                                        <div class="revenue-stat-node">
                                            <span class="trust-label uppercase mb-3 d-block"
                                                style="font-size: 10px; letter-spacing: 2px;">TOTAL REVENUE (NET)</span>
                                            <div class="v3-value-text">₹
                                                <fmt:formatNumber value="${totalEarnings}" minFractionDigits="2"
                                                    maxFractionDigits="2" />
                                            </div>
                                            <div class="text-white-50 x-small fw-800 uppercase"
                                                style="letter-spacing: 1px; font-size: 8px;">● SECURE SETTLEMENTS VIA
                                                PLATFORM</div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="revenue-stat-node">
                                            <span class="trust-label uppercase mb-3 d-block"
                                                style="font-size: 10px; letter-spacing: 2px; color: #f59e0b;">NETWORK
                                                OVERHEAD</span>
                                            <div class="v3-value-text text-warning">₹
                                                <fmt:formatNumber
                                                    value="${not empty commissionPaid ? commissionPaid : 0.0}"
                                                    minFractionDigits="2" maxFractionDigits="2" />
                                            </div>
                                            <div class="text-white-50 x-small fw-800 uppercase"
                                                style="letter-spacing: 1px; font-size: 8px;">● COMMISSION APPLIED AT
                                                NODE TIER 1</div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="revenue-stat-node">
                                            <span class="trust-label uppercase mb-3 d-block"
                                                style="font-size: 10px; letter-spacing: 2px; color: #3b82f6;">LIQUID
                                                CAPITAL</span>
                                            <div class="v3-value-text text-info">₹
                                                <fmt:formatNumber
                                                    value="${not empty availableBalance ? availableBalance : 0.0}"
                                                    minFractionDigits="2" maxFractionDigits="2" />
                                            </div>
                                            <div class="text-white-50 x-small fw-800 uppercase"
                                                style="letter-spacing: 1px; font-size: 8px;">● AVAILABLE FOR IMMEDIATE
                                                LIQUIDATION</div>
                                        </div>
                                    </div>
                                </div>

                                <div class="revenue-stat-node mb-5">
                                    <span class="trust-label uppercase mb-4 d-block"
                                        style="font-size: 10px; letter-spacing: 2px;">📊 REVENUE YIELD TELEMETRY
                                        (MONTHLY)</span>
                                    <div style="height: 400px; position: relative;">
                                        <canvas id="earningsChart"></canvas>
                                    </div>
                                </div>

                                <span class="trust-label uppercase d-block mb-3"
                                    style="font-size: 10px; color: #64748b; letter-spacing: 2px;">🗒️ TRANSACTION
                                    INTELLIGENCE LOG</span>
                                <div class="earnings-nexus-panel p-4">
                                    <div class="table-responsive">
                                        <table class="v3-earnings-table">
                                            <thead>
                                                <tr>
                                                    <th>VECTOR ID</th>
                                                    <th>ASSET / SERVICE HUB</th>
                                                    <th>GROSS VALUE</th>
                                                    <th>OVERHEAD</th>
                                                    <th>NET YIELD</th>
                                                    <th>TIMESTAMP</th>
                                                    <th class="text-end">STATUS</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="tx" items="${transactions}">
                                                    <tr>
                                                        <td>
                                                            <div class="order-id-nexus text-white fw-900"
                                                                style="font-size: 12px; padding: 10px 15px; background: rgba(255,255,255,0.03); border: 1px solid rgba(255,255,255,0.05); border-radius: 12px; display: inline-block;">
                                                                #TX-${tx.id}</div>
                                                        </td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${not empty tx.listing}">
                                                                    <div class="text-white fw-900"
                                                                        style="font-size: 14px;">${tx.listing.cropName}
                                                                    </div>
                                                                    <div class="text-white-50 x-small fw-800 uppercase"
                                                                        style="letter-spacing: 1px; font-size: 8px;">
                                                                        AGRICULTURAL ASSET</div>
                                                                </c:when>
                                                                <c:when test="${not empty tx.consultation}">
                                                                    <div class="text-info fw-900"
                                                                        style="font-size: 14px;">Strategic Advisory
                                                                    </div>
                                                                    <div class="text-white-50 x-small fw-800 uppercase"
                                                                        style="letter-spacing: 1px; font-size: 8px;">
                                                                        INTELLECTUAL SERVICE</div>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <div class="text-white-50 fw-900"
                                                                        style="font-size: 14px;">System Protocol</div>
                                                                    <div class="text-white-50 x-small fw-800 uppercase"
                                                                        style="letter-spacing: 1px; font-size: 8px;">
                                                                        NETWORK OPERATION</div>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                        <td>
                                                            <div class="text-white fw-900" style="font-size: 14px;">₹
                                                                <fmt:formatNumber value="${tx.amount}"
                                                                    minFractionDigits="2" maxFractionDigits="2" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="text-warning fw-900" style="font-size: 14px;">-
                                                                ₹
                                                                <fmt:formatNumber value="${tx.commission}"
                                                                    minFractionDigits="2" maxFractionDigits="2" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="text-success fw-900" style="font-size: 18px;">₹
                                                                <fmt:formatNumber value="${tx.finalEarnings}"
                                                                    minFractionDigits="2" maxFractionDigits="2" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <c:set var="formattedDate"
                                                                value="${fn:replace(tx.timestamp, 'T', ' ')}" />
                                                            <div class="text-white fw-900 x-small uppercase"
                                                                style="font-size: 8px;">${fn:substring(formattedDate, 0,
                                                                16)}</div>
                                                        </td>
                                                        <td class="text-end">
                                                            <span
                                                                class="v3-status-pill ${tx.status == 'SUCCESS' ? 'bg-success' : (tx.status == 'PENDING' ? 'bg-warning' : 'bg-danger')} bg-opacity-10 text-${tx.status == 'SUCCESS' ? 'success' : (tx.status == 'PENDING' ? 'warning' : 'danger')} fw-900"
                                                                style="border: 1px solid rgba(255,255,255,0.05); font-size: 8px;">
                                                                ● ${tx.status}
                                                            </span>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                <c:if test="${empty transactions}">
                                                    <tr>
                                                        <td colspan="7" class="text-center py-5" style="opacity: 0.2;">
                                                            <div class="display-4">📊</div>
                                                            <div class="text-white fw-900 uppercase mt-2">NO REVENUE
                                                                VECTORS IDENTIFIED</div>
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
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                    <script>
                        function toggleSidebar() { document.getElementById('sidebar').classList.toggle('open'); }

                        const ctx = document.getElementById('earningsChart').getContext('2d');
                        const chartData = {
                            labels: [<c:forEach var="item" items="${earningsChartData}" varStatus="status">'${fn:substring(item[0].toString(), 0, 10)}'${not status.last ? ',' : ''}</c:forEach>],
                            data: [<c:forEach var="item" items="${earningsChartData}" varStatus="status">${item[1]}${not status.last ? ',' : ''}</c:forEach>]
                        };

                        if (chartData.labels.length === 0) { chartData.labels = ['NODAL ENCRYPTION']; chartData.data = [0]; }

                        const gradient = ctx.createLinearGradient(0, 0, 0, 400);
                        gradient.addColorStop(0, 'rgba(16, 185, 129, 0.2)');
                        gradient.addColorStop(1, 'rgba(16, 185, 129, 0)');

                        new Chart(ctx, {
                            type: 'line',
                            data: {
                                labels: chartData.labels,
                                datasets: [{
                                    label: 'Daily Yield (₹)',
                                    data: chartData.data,
                                    borderColor: '#10b981',
                                    borderWidth: 4,
                                    tension: 0.4,
                                    fill: true,
                                    backgroundColor: gradient,
                                    pointBackgroundColor: '#10b981',
                                    pointBorderColor: 'rgba(2, 6, 23, 1)',
                                    pointBorderWidth: 3,
                                    pointRadius: 6,
                                    pointHoverRadius: 8
                                }]
                            },
                            options: {
                                responsive: true,
                                maintainAspectRatio: false,
                                plugins: { legend: { display: false } },
                                scales: {
                                    y: {
                                        beginAtZero: true,
                                        grid: { color: 'rgba(255,255,255,0.03)', drawBorder: false },
                                        ticks: { color: '#64748b', font: { family: 'Outfit', weight: '800', size: 10 }, padding: 15 }
                                    },
                                    x: {
                                        grid: { display: false },
                                        ticks: { color: '#64748b', font: { family: 'Outfit', weight: '800', size: 10 }, padding: 10 }
                                    }
                                }
                            }
                        });
                    </script>
                </body>

                </html>





