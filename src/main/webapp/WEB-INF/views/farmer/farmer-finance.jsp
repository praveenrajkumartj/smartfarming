<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
            <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8" />
                    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                    <title>💰 Strategic Capital - AGROPLANTER</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
                        rel="stylesheet">
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/voice-assistant.css" />
                    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800;900&display=swap"
                        rel="stylesheet">
                    <link rel="icon"
                        href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>💰</text></svg>" />
                    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
                    <style>
                        .v3-capital-nexus {
                            background: linear-gradient(135deg, rgba(6, 78, 59, 0.5) 0%, rgba(6, 95, 70, 0.3) 100%);
                            border-radius: 40px;
                            padding: 65px;
                            margin-bottom: 50px;
                            border: 1px solid rgba(16, 185, 129, 0.1);
                            backdrop-filter: blur(30px);
                            position: relative;
                            overflow: hidden;
                        }

                        .v3-capital-nexus::before {
                            content: 'CAPITAL';
                            position: absolute;
                            right: -50px;
                            bottom: -50px;
                            font-size: 15vw;
                            font-weight: 900;
                            color: white;
                            opacity: 0.02;
                            pointer-events: none;
                        }

                        .v3-finance-card {
                            background: rgba(15, 23, 42, 0.4);
                            border: 1px solid rgba(255, 255, 255, 0.05);
                            border-radius: 35px;
                            padding: 40px;
                            backdrop-filter: blur(30px);
                            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
                        }

                        .v3-log-node {
                            background: rgba(255, 255, 255, 0.02);
                            border: 1px solid rgba(255, 255, 255, 0.05);
                            border-radius: 24px;
                            padding: 30px;
                            margin-bottom: 20px;
                            display: flex;
                            align-items: center;
                            justify-content: space-between;
                            transition: 0.3s;
                        }

                        .v3-log-node:hover {
                            border-color: rgba(16, 185, 129, 0.3);
                            background: rgba(16, 185, 129, 0.05);
                            transform: scale(1.01);
                        }

                        .v3-input-nexus {
                            background: rgba(255, 255, 255, 0.02) !important;
                            border: 1px solid rgba(255, 255, 255, 0.05) !important;
                            border-radius: 16px !important;
                            color: white !important;
                            padding: 16px 24px !important;
                            font-weight: 600 !important;
                            font-family: 'Outfit';
                        }

                        .v3-input-nexus:focus {
                            border-color: #10b981 !important;
                            background: rgba(255, 255, 255, 0.05) !important;
                            box-shadow: 0 0 0 4px rgba(16, 185, 129, 0.1) !important;
                        }

                        .tid-pill-nexus {
                            font-family: 'JetBrains Mono', monospace;
                            background: rgba(16, 185, 129, 0.1);
                            color: #10b981;
                            font-size: 9px;
                            font-weight: 900;
                            padding: 6px 14px;
                            border-radius: 8px;
                            border: 1px solid rgba(16, 185, 129, 0.1);
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
                                            style="font-size: 2.2rem; letter-spacing: -1.5px;">Strategic Capital</h1>
                                        <span class="v3-page-subtitle text-success uppercase"
                                            style="letter-spacing: 1px; font-weight: 800;">
                                            📡 ASSET LIQUIDITY TELEMETRY | ESCROW NODES: ACTIVE | NODE: SECURED
                                        </span>
                                    </div>
                                </div>
                                <div class="top-nav-right">
                                    <button class="btn btn-quantum px-5 py-3 fw-900 uppercase small"
                                        onclick="window.location.href='${pageContext.request.contextPath}/farmer/earnings'">VIEW
                                        ANALYTICS</button>
                                </div>
                            </header>

                            <div class="page-body px-5 py-5">
                                <div class="v3-capital-nexus">
                                    <div class="row align-items-center">
                                        <div class="col-xl-8">
                                            <span class="trust-label uppercase d-block mb-2"
                                                style="font-size: 11px; letter-spacing: 3px; color: rgba(255,255,255,0.6);">REDEEMABLE
                                                ASSET LIQUIDITY</span>
                                            <h1 class="display-1 fw-900 text-white mb-0" style="letter-spacing: -5px;">₹
                                                <fmt:formatNumber value="${availableBalance}" minFractionDigits="2" />
                                            </h1>
                                            <div class="mt-4 d-flex gap-3">
                                                <div class="px-3 py-1 rounded-pill"
                                                    style="background: rgba(255,255,255,0.05); border: 1px solid rgba(255,255,255,0.1); font-size: 9px; font-weight: 900; letter-spacing: 1px; color: rgba(255,255,255,0.5);">
                                                    ESCROW VERIFIED</div>
                                                <div class="px-3 py-1 rounded-pill"
                                                    style="background: rgba(16, 185, 129, 0.1); border: 1px solid rgba(16, 185, 129, 0.2); font-size: 9px; font-weight: 900; letter-spacing: 1px; color: #10b981;">
                                                    INSTANT DISBURSEMENT</div>
                                            </div>
                                        </div>
                                        <div class="col-xl-4 text-xl-end mt-5 mt-xl-0">
                                            <button class="btn btn-quantum px-5 py-4 fw-900 uppercase"
                                                onclick="document.getElementById('withdrawSection').scrollIntoView({behavior: 'smooth'})">INITIALIZE
                                                REDEMPTION →</button>
                                        </div>
                                    </div>
                                </div>

                                <div class="row g-4 mb-5">
                                    <div class="col-lg-8">
                                        <div class="v3-finance-card h-100">
                                            <div class="d-flex justify-content-between align-items-center mb-5">
                                                <span class="trust-label uppercase m-0"
                                                    style="font-size: 10px; letter-spacing: 2px;">REVENUE PERFORMANCE
                                                    TELEMETRY</span>
                                                <div class="d-flex align-items-center gap-2">
                                                    <div class="pulse-green"></div>
                                                    <span class="text-white-50 x-small fw-900 uppercase"
                                                        style="font-size: 8px;">LIVE FEED ACTIVE</span>
                                                </div>
                                            </div>
                                            <div style="height: 480px;"><canvas id="earningsChart"></canvas></div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div id="withdrawSection" class="v3-finance-card">
                                            <span class="trust-label uppercase mb-4 d-block"
                                                style="font-size: 10px; letter-spacing: 2px;">REDEMPTION
                                                REQUISITION</span>
                                            <form action="${pageContext.request.contextPath}/farmer/finance/withdraw"
                                                method="post">
                                                <div class="mb-4">
                                                    <span class="trust-label uppercase mb-2 d-block"
                                                        style="font-size: 8px;">LIQUIDATION QUANTITY (INR)</span>
                                                    <input type="number" step="0.01" class="form-control v3-input-nexus"
                                                        name="amount" placeholder="0.00" max="${availableBalance}"
                                                        required />
                                                </div>
                                                <div class="mb-4">
                                                    <span class="trust-label uppercase mb-2 d-block"
                                                        style="font-size: 8px;">SETTLEMENT PROTOCOL</span>
                                                    <select class="form-select v3-input-nexus" id="settlementMethod"
                                                        onchange="toggleSettlementFields()">
                                                        <option value="UPI">VIRTUAL PAYMENT ADDRESS (UPI)</option>
                                                        <option value="BANK">INSTITUTIONAL BANKING (NEFT/RTGS)</option>
                                                    </select>
                                                </div>

                                                <div id="upiFields" class="mb-4">
                                                    <span class="trust-label uppercase mb-2 d-block"
                                                        style="font-size: 8px;">UPI IDENTITY (VPA)</span>
                                                    <input type="text" class="form-control v3-input-nexus" name="upiId"
                                                        value="${farmer.upiId}" placeholder="identity@bank-node" />
                                                </div>

                                                <div id="bankFields" style="display: none;" class="mb-4">
                                                    <div class="mb-3">
                                                        <span class="trust-label uppercase mb-2 d-block"
                                                            style="font-size: 8px;">ACCOUNT SEQUENCE</span>
                                                        <input type="text" class="form-control v3-input-nexus"
                                                            name="bankAccountNumber" value="${farmer.bankAccountNumber}"
                                                            placeholder="000000000000" />
                                                    </div>
                                                    <div>
                                                        <span class="trust-label uppercase mb-2 d-block"
                                                            style="font-size: 8px;">ROUTING CODE (IFSC)</span>
                                                        <input type="text" class="form-control v3-input-nexus"
                                                            name="ifscCode" value="${farmer.ifscCode}"
                                                            placeholder="ABCD0123456" />
                                                    </div>
                                                </div>

                                                <div class="p-3 rounded-4 mb-4 text-center x-small text-info fw-900 uppercase"
                                                    style="background: rgba(13, 202, 240, 0.05); border: 1px solid rgba(13, 202, 240, 0.1); letter-spacing: 1px; font-size: 7px;">
                                                    🛡️ AES-256 E2E ENCRYPTED SETTLEMENT TUNNEL
                                                </div>
                                                <button type="submit"
                                                    class="btn btn-quantum w-100 py-4 fw-900 uppercase">EXECUTE
                                                    REDEMPTION →</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>

                                <div class="px-2 mb-4">
                                    <span class="trust-label uppercase m-0"
                                        style="font-size: 10px; color: #64748b; letter-spacing: 2px;">TRANSACTION
                                        INTELLIGENCE LOG</span>
                                </div>

                                <div class="row">
                                    <c:forEach var="req" items="${withdrawals}">
                                        <div class="col-12">
                                            <div class="v3-log-node">
                                                <div class="d-flex align-items-center gap-5">
                                                    <div class="tid-pill-nexus">TID-${req.id}</div>
                                                    <div>
                                                        <div class="text-white fw-900 fs-3"
                                                            style="letter-spacing: -1.5px;">₹
                                                            <fmt:formatNumber value="${req.amount}"
                                                                minFractionDigits="2" />
                                                        </div>
                                                        <div class="text-white-50 x-small fw-800 uppercase mt-1"
                                                            style="font-size: 8px; letter-spacing: 1px;">NODAL
                                                            DISBURSEMENT: ${req.requestDate}</div>
                                                    </div>
                                                </div>
                                                <span
                                                    class="badge ${req.status == 'PENDING' ? 'bg-warning' : 'bg-success'} bg-opacity-10 text-${req.status == 'PENDING' ? 'warning' : 'success'} px-4 py-2 rounded-pill fw-900 border border-${req.status == 'PENDING' ? 'warning' : 'success'} border-opacity-10 uppercase small">
                                                    ● ${req.status}
                                                </span>
                                            </div>
                                        </div>
                                    </c:forEach>
                                    <c:if test="${empty withdrawals}">
                                        <div class="col-12 text-center py-5" style="opacity: 0.2;">
                                            <div class="display-1">📊</div>
                                            <div class="text-white fw-900 uppercase mt-3">NO TRANSACTION TELEMETRY
                                                IDENTIFIED</div>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </main>
                    </div>

                    <script src="${pageContext.request.contextPath}/js/background-switcher.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                    <script>
                        function toggleSidebar() { document.getElementById('sidebar').classList.toggle('open'); }
                        function toggleSettlementFields() {
                            const method = document.getElementById('settlementMethod').value;
                            const upiFields = document.getElementById('upiFields');
                            const bankFields = document.getElementById('bankFields');
                            if (method === 'UPI') { upiFields.style.display = 'block'; bankFields.style.display = 'none'; }
                            else { upiFields.style.display = 'none'; bankFields.style.display = 'block'; }
                        }
                        document.addEventListener("DOMContentLoaded", function () {
                            const ctx = document.getElementById('earningsChart').getContext('2d');
                            const labels = []; const data = [];
                            <c:forEach var="entry" items="${monthlyEarningsGraph}">labels.push('${entry.key}'); data.push(${entry.value});</c:forEach>

                            const gradient = ctx.createLinearGradient(0, 0, 0, 480);
                            gradient.addColorStop(0, 'rgba(16, 185, 129, 0.2)');
                            gradient.addColorStop(1, 'rgba(16, 185, 129, 0)');

                            new Chart(ctx, {
                                type: 'line',
                                data: {
                                    labels: labels,
                                    datasets: [{
                                        label: 'REVENUE', data: data, borderColor: '#10b981', backgroundColor: gradient,
                                        borderWidth: 4, tension: 0.4, fill: true, pointBackgroundColor: '#0f172a',
                                        pointBorderColor: '#10b981', pointBorderWidth: 3, pointRadius: 6, pointHoverRadius: 9
                                    }]
                                },
                                options: {
                                    responsive: true, maintainAspectRatio: false,
                                    plugins: { legend: { display: false }, tooltip: { backgroundColor: '#0f172a', titleFont: { family: 'Outfit', size: 10 }, bodyFont: { family: 'Outfit', size: 14, weight: 'bold' }, padding: 15, borderRadius: 15, borderColor: 'rgba(255,255,255,0.05)', borderWidth: 1 } },
                                    scales: {
                                        y: { beginAtZero: true, grid: { color: 'rgba(255, 255, 255, 0.03)', drawBorder: false }, ticks: { color: '#475569', font: { family: 'Outfit', weight: '800', size: 10 }, padding: 15 } },
                                        x: { grid: { display: false }, ticks: { color: '#475569', font: { family: 'Outfit', weight: '800', size: 10 }, padding: 15 } }
                                    }
                                }
                            });
                        });
                    </script>
                </body>

                </html>




