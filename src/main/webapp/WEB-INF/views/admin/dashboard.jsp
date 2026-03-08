<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8" />
                    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                    <title>🛡️ Strategic Command - AGROPLANTER Admin</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
                        rel="stylesheet">
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/voice-assistant.css" />
                    <link rel="stylesheet"
                        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
                    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800;900&display=swap"
                        rel="stylesheet">
                    <link rel="icon"
                        href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🛡️</text></svg>" />
                    <script>
                        window.AgroplanterUser = "${admin.id}";
                        window.AgroplanterUserFull = "${admin.fullName}";
                        window.AgroplanterRole = "${admin.role}";
                    </script>
                    <style>
                        .v3-admin-hero {
                            background: linear-gradient(135deg, rgba(30, 27, 75, 0.4) 0%, rgba(49, 46, 129, 0.4) 100%);
                            border: 1px solid rgba(124, 58, 237, 0.2);
                            border-radius: 40px;
                            padding: 40px 50px;
                            position: relative;
                            overflow: hidden;
                            margin-bottom: 50px;
                            backdrop-filter: blur(30px);
                        }

                        .v3-admin-hero::after {
                            content: '⚙️';
                            position: absolute;
                            right: -30px;
                            top: -30px;
                            font-size: 200px;
                            opacity: 0.03;
                            transform: rotate(15deg);
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
                            border-color: rgba(124, 58, 237, 0.3);
                            box-shadow: 0 30px 60px rgba(0, 0, 0, 0.4);
                        }

                        .v3-intel-orb {
                            background: rgba(15, 23, 42, 0.3);
                            border: 1px solid rgba(124, 58, 237, 0.1);
                            border-radius: 30px;
                            padding: 30px;
                            transition: 0.4s;
                            backdrop-filter: blur(20px);
                        }

                        .v3-intel-orb:hover {
                            border-color: rgba(124, 58, 237, 0.4);
                            background: rgba(124, 58, 237, 0.05);
                            transform: translateY(-8px);
                        }

                        .v3-status-beam {
                            width: 12px;
                            height: 12px;
                            background: #10b981;
                            border-radius: 50%;
                            display: inline-block;
                            margin-right: 15px;
                            box-shadow: 0 0 20px #10b981;
                            animation: v3-pulse-beam 2s infinite;
                        }

                        @keyframes v3-pulse-beam {
                            0% {
                                opacity: 0.4;
                                transform: scale(0.8);
                            }

                            50% {
                                opacity: 1;
                                transform: scale(1.1);
                            }

                            100% {
                                opacity: 0.4;
                                transform: scale(0.8);
                            }
                        }

                        .v3-nexus-panel {
                            background: rgba(15, 23, 42, 0.4);
                            border: 1px solid rgba(255, 255, 255, 0.05);
                            border-radius: 40px;
                            padding: 35px;
                            backdrop-filter: blur(40px);
                        }



                        .v3-flag-node {
                            padding: 25px;
                            border-radius: 20px;
                            background: rgba(239, 68, 68, 0.05);
                            border: 1px solid rgba(239, 68, 68, 0.1);
                            margin-bottom: 15px;
                            transition: 0.3s;
                        }

                        .v3-flag-node:hover {
                            background: rgba(239, 68, 68, 0.08);
                            transform: translateX(10px);
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
                                    class="sidebar-nav-item active mb-2"><span class="nav-icon">🛡️</span>
                                    Intelligence</a>
                                <a href="${pageContext.request.contextPath}/admin/users"
                                    class="sidebar-nav-item mb-2"><span class="nav-icon">👥</span> Identity Registry</a>
                                <a href="${pageContext.request.contextPath}/admin/marketplace"
                                    class="sidebar-nav-item mb-2"><span class="nav-icon">🛒</span> Market Oversight</a>
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
                                        <h1 class="m-0 fw-900 text-white"
                                            style="font-size: 2.2rem; letter-spacing: -1.5px;">Strategic Command</h1>
                                        <span class="v3-page-subtitle text-purple-400 uppercase"
                                            style="letter-spacing: 1px; font-weight: 800;">
                                            📊 REAL-TIME ANALYTICS | SESSION: ACTIVE | IDENTITY: SECURED
                                        </span>
                                    </div>
                                </div>
                                <div class="top-nav-right">
                                    <div class="user-info"
                                        style="gap: 15px; cursor: pointer; display: flex; align-items: center;"
                                        onclick="window.location.href='${pageContext.request.contextPath}/admin/dashboard'">
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
                                                        <i class="fas fa-user-circle"></i>
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                </div>
                            </header>

                            <div class="page-body px-4 py-4">
                                <div class="v3-admin-hero">
                                    <div class="row align-items-center">
                                        <div class="col-lg-8">
                                            <h1 class="fw-950 text-white mb-3 display-4" style="letter-spacing: -3px;">
                                                Systems Intelligence Core</h1>
                                            <p class="text-white-50 fw-800 uppercase x-small mb-0"
                                                style="letter-spacing: 2px;">
                                                <span class="v3-status-beam"></span> MONITORING ACTIVE: GLOBAL SUPPLY
                                                CHAIN INTEGRITY 99.9%
                                            </p>
                                        </div>
                                        <div class="col-lg-4 text-lg-end mt-4 mt-lg-0">
                                            <a href="${pageContext.request.contextPath}/admin/export/report"
                                                class="btn btn-quantum px-5 py-3 fw-950 uppercase text-decoration-none shadow-sm"
                                                style="font-size: 11px; display: inline-block;">GENERATE AUDIT INTEL
                                                →</a>
                                        </div>
                                    </div>
                                </div>

                                <div class="v3-stat-grid mb-5">
                                    <div class="v3-stat-node">
                                        <span class="trust-label uppercase d-block mb-2"
                                            style="font-size: 9px; letter-spacing: 2px; color: #475569;">PLATFORM
                                            VOLUME</span>
                                        <div class="display-5 fw-950 text-white mb-1" style="letter-spacing: -2px;">₹
                                            <fmt:formatNumber value="${platformRevenue}" pattern="#,###" />
                                        </div>
                                        <div class="text-white-50 x-small fw-950 uppercase"
                                            style="font-size: 8px; letter-spacing: 1.5px;">GROSS REVENUE</div>
                                    </div>
                                    <div class="v3-stat-node">
                                        <span class="trust-label uppercase d-block mb-2"
                                            style="font-size: 9px; letter-spacing: 2px; color: #475569;">VERIFIED
                                            IDENTITIES</span>
                                        <div class="display-5 fw-950 text-white mb-1" style="letter-spacing: -2px;">
                                            ${totalVerified} / ${totalFarmers + totalBuyers}</div>
                                        <div class="text-white-50 x-small fw-950 uppercase"
                                            style="font-size: 8px; letter-spacing: 1.5px;">GLOBAL NODES</div>
                                    </div>
                                    <div class="v3-stat-node">
                                        <span class="trust-label uppercase d-block mb-2"
                                            style="font-size: 9px; letter-spacing: 2px; color: #475569;">THREAT
                                            FLAGS</span>
                                        <div class="display-5 fw-950 text-danger mb-1" style="letter-spacing: -2px;">
                                            ${analytics.suspiciousTransactionsCount + analytics.suspiciousListingsCount}
                                        </div>
                                        <div class="text-white-50 x-small fw-950 uppercase"
                                            style="font-size: 8px; letter-spacing: 1.5px;">ACTIVE ALERTS</div>
                                    </div>
                                    <div class="v3-stat-node">
                                        <span class="trust-label uppercase d-block mb-2"
                                            style="font-size: 9px; letter-spacing: 2px; color: #475569;">MACHINERY
                                            CLUSTER</span>
                                        <div class="display-5 fw-950 text-white mb-1" style="letter-spacing: -2px;">
                                            ${totalEquipment}</div>
                                        <div class="text-white-50 x-small fw-950 uppercase"
                                            style="font-size: 8px; letter-spacing: 1.5px;">PHYSICAL ASSETS</div>
                                    </div>
                                </div>

                                <div class="row g-4 mb-5">
                                    <div class="col-md-3">
                                        <div class="v3-intel-orb">
                                            <span class="trust-label uppercase d-block mb-2"
                                                style="font-size: 9px; letter-spacing: 1px; color: #475569;">CONVERSION
                                                INDEX</span>
                                            <div class="h3 text-success fw-950 mb-1" style="letter-spacing: -1px;">
                                                ${analytics.conversionRate}%</div>
                                            <div class="text-white-50 x-small fw-800 uppercase" style="font-size: 8px;">
                                                ${analytics.soldListings} SETTLED</div>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="v3-intel-orb">
                                            <span class="trust-label uppercase d-block mb-2"
                                                style="font-size: 9px; letter-spacing: 1px; color: #475569;">LOGISTICS
                                                FLOW</span>
                                            <div class="h3 text-info fw-950 mb-1" style="letter-spacing: -1px;">
                                                ${analytics.successfulRentals} B2B</div>
                                            <div class="text-white-50 x-small fw-800 uppercase" style="font-size: 8px;">
                                                ${analytics.totalRentals} REQS</div>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="v3-intel-orb">
                                            <span class="trust-label uppercase d-block mb-2"
                                                style="font-size: 9px; letter-spacing: 1px; color: #475569;">BIO-TRIAGE
                                                QUEUE</span>
                                            <div class="h3 text-warning fw-950 mb-1" style="letter-spacing: -1px;">
                                                ${pendingQueries} PENDING</div>
                                            <div class="text-white-50 x-small fw-800 uppercase" style="font-size: 8px;">
                                                SCAN DISPATCH REQUIRED</div>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="v3-intel-orb">
                                            <span class="trust-label uppercase d-block mb-2"
                                                style="font-size: 9px; letter-spacing: 1px; color: #475569;">EXPERT
                                                NETWORK</span>
                                            <div class="h3 text-purple-400 fw-950 mb-1" style="letter-spacing: -1px;">
                                                ${activeMentors} ACTIVE</div>
                                            <div class="text-white-50 x-small fw-800 uppercase" style="font-size: 8px;">
                                                BOOTCAMP MENTORS</div>
                                        </div>
                                    </div>
                                </div>

                                <div class="v3-nexus-panel mb-5">
                                    <div class="d-flex justify-content-between align-items-center mb-5">
                                        <h4 class="fw-950 text-white m-0 fs-2" style="letter-spacing: -1.5px;">⚠️ Trust
                                            & Safety Monitor</h4>
                                        <span
                                            class="badge bg-danger bg-opacity-10 text-danger fw-950 px-4 py-2 rounded-pill uppercase"
                                            style="font-size: 9px; letter-spacing: 2px; border: 1px solid rgba(239, 68, 68, 0.1);">REAL-TIME
                                            HEURISTICS ACTIVE</span>
                                    </div>
                                    <div class="row g-5">
                                        <div class="col-md-6">
                                            <h6 class="text-white-50 fw-950 uppercase x-small mb-4"
                                                style="letter-spacing: 2px;">SUSPICIOUS TRANSACTIONS
                                                (${fn:length(suspiciousTransactions)})</h6>
                                            <c:forEach items="${suspiciousTransactions}" var="st">
                                                <div class="v3-flag-node">
                                                    <div class="d-flex justify-content-between align-items-start">
                                                        <div>
                                                            <div class="text-white fw-950 fs-5 mb-1">TXN #${st.id}</div>
                                                            <div class="text-white-50 x-small fw-600 uppercase"
                                                                style="font-size: 9px;">BUYER: ${st.buyer.fullName} |
                                                                FARMER: ${st.farmer.fullName}</div>
                                                        </div>
                                                        <div class="text-danger fw-950 fs-5">₹${st.amount}</div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                            <c:if test="${empty suspiciousTransactions}">
                                                <div class="text-white-50 x-small py-4 text-center opacity-30 fw-900 uppercase"
                                                    style="letter-spacing: 2px;">ZERO ANOMALIES DETECTED</div>
                                            </c:if>
                                        </div>
                                        <div class="col-md-6">
                                            <h6 class="text-white-50 fw-950 uppercase x-small mb-4"
                                                style="letter-spacing: 2px;">FLAGGED LISTINGS
                                                (${fn:length(suspiciousListings)})</h6>
                                            <c:forEach items="${suspiciousListings}" var="sl">
                                                <div class="v3-flag-node"
                                                    style="border-color: rgba(245, 158, 11, 0.2); background: rgba(245, 158, 11, 0.05);">
                                                    <div class="d-flex justify-content-between align-items-start">
                                                        <div>
                                                            <div class="text-white fw-950 fs-5 mb-1">${sl.cropName}
                                                            </div>
                                                            <div class="text-white-50 x-small fw-600 uppercase"
                                                                style="font-size: 9px;">FARMER: ${sl.farmer.fullName} |
                                                                TRUST: ${sl.farmer.trustScore}%</div>
                                                        </div>
                                                        <div class="text-warning fw-950 fs-5">
                                                            ₹${sl.pricePerUnit}/${sl.unit}</div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                            <c:if test="${empty suspiciousListings}">
                                                <div class="text-white-50 x-small py-4 text-center opacity-30 fw-900 uppercase"
                                                    style="letter-spacing: 2px;">ZERO FLAG EVENTS</div>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>

                                <div class="row g-5">
                                    <div class="col-lg-7">
                                        <div class="v3-nexus-panel h-100">
                                            <div class="d-flex justify-content-between align-items-center mb-5">
                                                <h4 class="fw-950 text-white m-0 fs-2" style="letter-spacing: -1.5px;">
                                                    👥 Identity Registry</h4>
                                                <a href="${pageContext.request.contextPath}/admin/users"
                                                    class="text-purple-400 x-small fw-950 uppercase text-decoration-none"
                                                    style="letter-spacing: 1px;">VIEW ALL NODES →</a>
                                            </div>
                                            <div class="table-responsive">
                                                <table class="v3-data-table">
                                                    <thead>
                                                        <tr>
                                                            <th>IDENTITY</th>
                                                            <th>CLASSIFICATION</th>
                                                            <th class="text-end">REGION</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${recentUsers}" var="u">
                                                            <tr>
                                                                <td>
                                                                    <div class="fw-950 text-white fs-6">${u.fullName}
                                                                    </div>
                                                                    <div class="text-white-50 x-small fw-600">${u.email}
                                                                    </div>
                                                                </td>
                                                                <td><span
                                                                        class="badge ${u.role == 'FARMER' ? 'bg-success' : 'bg-info'} bg-opacity-10 text-${u.role == 'FARMER' ? 'success' : 'info'} fw-950 px-3 py-1 rounded-pill uppercase"
                                                                        style="font-size: 8px; letter-spacing: 1.5px; border: 1px solid currentColor; opacity: 0.8;">${u.role}</span>
                                                                </td>
                                                                <td class="text-end text-white-50 x-small fw-950 uppercase"
                                                                    style="font-size: 10px;">${u.state}</td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-5">
                                        <div class="v3-nexus-panel h-100">
                                            <div class="d-flex justify-content-between align-items-center mb-5">
                                                <h4 class="fw-950 text-white m-0 fs-2" style="letter-spacing: -1.5px;">
                                                    🔬 Bio-Threat Triage</h4>
                                                <a href="${pageContext.request.contextPath}/admin/disease-queries"
                                                    class="text-warning x-small fw-950 uppercase text-decoration-none"
                                                    style="letter-spacing: 1px;">DISPATCH EXPERTS →</a>
                                            </div>
                                            <c:forEach items="${recentQueries}" var="q">
                                                <div class="p-4 rounded-4 mb-3"
                                                    style="background: rgba(255,255,255,0.02); border: 1px solid rgba(255,255,255,0.05); transition: 0.3s;"
                                                    onmouseover="this.style.background='rgba(255,255,255,0.04)'"
                                                    onmouseout="this.style.background='rgba(255,255,255,0.02)'">
                                                    <div class="d-flex justify-content-between align-items-center mb-3">
                                                        <span class="text-success fw-950 fs-5"
                                                            style="letter-spacing: -0.5px;">${q.cropName}</span>
                                                        <span
                                                            class="badge bg-danger bg-opacity-10 text-danger fw-950 px-3 py-1 rounded-pill uppercase"
                                                            style="font-size: 8px; letter-spacing: 1.5px; border: 1px solid rgba(220, 38, 38, 0.2);">CRITICAL</span>
                                                    </div>
                                                    <p class="text-white-50 small mb-3 lh-lg opacity-70">
                                                        ${fn:substring(q.symptoms, 0, 90)}...</p>
                                                    <div class="text-muted fw-950 uppercase"
                                                        style="font-size: 8px; letter-spacing: 1.5px;">ORIGIN:
                                                        ${q.user.fullName}</div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
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