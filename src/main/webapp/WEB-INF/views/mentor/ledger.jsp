<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
            <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Advisory Ledger - AGROPLANTER</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
                        rel="stylesheet">
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
                    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800;900&display=swap"
                        rel="stylesheet">
                    <link rel="stylesheet"
                        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
                    <style>
                        .v3-ledger-nexus {
                            background: rgba(15, 23, 42, 0.4);
                            border: 1px solid rgba(255, 255, 255, 0.05);
                            border-radius: 40px;
                            padding: 40px;
                            backdrop-filter: blur(40px);
                        }

                        .v3-data-table {
                            width: 100%;
                            border-collapse: separate;
                            border-spacing: 0 12px;
                        }

                        .v3-data-table thead th {
                            color: #475569;
                            font-size: 10px;
                            font-weight: 950;
                            text-transform: uppercase;
                            letter-spacing: 2px;
                            padding: 20px 30px;
                            border: none;
                        }

                        .v3-data-table tbody tr td {
                            background: rgba(255, 255, 255, 0.02);
                            padding: 25px 30px;
                            border-top: 1px solid rgba(255, 255, 255, 0.05);
                            border-bottom: 1px solid rgba(255, 255, 255, 0.05);
                            font-size: 15px;
                            vertical-align: middle;
                        }

                        .v3-data-table tr td:first-child {
                            border-left: 1px solid rgba(255, 255, 255, 0.05);
                            border-radius: 20px 0 0 20px;
                        }

                        .v3-data-table tr td:last-child {
                            border-right: 1px solid rgba(255, 255, 255, 0.05);
                            border-radius: 0 20px 20px 0;
                        }

                        .transaction-card {
                            background: linear-gradient(135deg, rgba(16, 185, 129, 0.1), rgba(16, 185, 129, 0.05));
                            border: 1px solid rgba(16, 185, 129, 0.2);
                            border-radius: 25px;
                            padding: 30px;
                        }
                    </style>
                </head>

                <body style="background: #020617; color: #fff; font-family: 'Outfit', sans-serif;">
                    <div class="dashboard-scene"></div>
                    <div class="dashboard-layout">
                        <aside class="sidebar sidebar-premium">
                            <div class="sidebar-brand px-4 py-4"
                                onclick="window.location.href='${pageContext.request.contextPath}/'">
                                <div class="brand-premium">
                                    <div class="brand-icon-box"><i class="fas fa-leaf"></i></div>
                                    <div class="brand-text">
                                        <h3 class="brand-premium m-0" style="font-size: 20px;">AGROPLANTER</h3>
                                        <span
                                            style="font-size: 10px; color: #fbbf24; font-weight: 800; letter-spacing: 1px;">ADVISOR
                                            NODE V3</span>
                                    </div>
                                </div>
                            </div>
                            <nav class="sidebar-nav px-3 py-4">
                                <div class="nav-section-title px-2 mb-2">STRATEGIC COMMAND</div>
                                <a href="${pageContext.request.contextPath}/mentor/dashboard"
                                    class="sidebar-nav-item mb-2"><span class="nav-icon">📊</span> Advisor Workspace</a>
                                <a href="${pageContext.request.contextPath}/mentor/ledger"
                                    class="sidebar-nav-item active mb-2"><span class="nav-icon">📖</span> Advisory
                                    Ledger</a>
                                <a href="${pageContext.request.contextPath}/mentor/reviews"
                                    class="sidebar-nav-item mb-2"><span class="nav-icon">⭐</span> Advisor Reviews</a>
                                <a href="${pageContext.request.contextPath}/chat" class="sidebar-nav-item mb-2"><span
                                        class="nav-icon">💬</span> Message Core</a>
                                <div class="nav-section-title px-2 mt-4 mb-2">USER IDENTITY</div>
                                <a href="${pageContext.request.contextPath}/mentor/profile"
                                    class="sidebar-nav-item mb-2"><span class="nav-icon">👤</span> Advisor Profile</a>
                                <a href="${pageContext.request.contextPath}/logout"
                                    class="sidebar-nav-item text-danger mt-4"><span class="nav-icon">🚪</span> Terminate
                                    Session</a>
                            </nav>
                        </aside>

                        <main class="main-content">
                            <header class="top-nav">
                                <div class="top-nav-left d-flex align-items-center gap-3">
                                    <div class="page-title">
                                        <h1 class="m-0 fw-950 text-white"
                                            style="font-size: 2.2rem; letter-spacing: -1.5px;">Advisory Ledger</h1>
                                        <span class="v3-page-subtitle text-warning uppercase"
                                            style="letter-spacing: 1px; font-weight: 800;">FINANCIAL AUDIT | SECURE
                                            SETTLEMENTS</span>
                                    </div>
                                </div>
                            </header>

                            <div class="page-body px-5 py-5">
                                <div class="row g-4 mb-5">
                                    <div class="col-md-6">
                                        <div class="transaction-card">
                                            <span class="v3-identity-label"
                                                style="font-size: 10px; font-weight: 950; color: #475569; letter-spacing: 2px; text-transform: uppercase;">ACCUMULATED
                                                REVENUE</span>
                                            <div class="display-5 fw-950 text-success">₹
                                                <fmt:formatNumber value="${totalEarnings}" pattern="#,###.##" />
                                            </div>
                                            <p class="text-white-50 x-small fw-800 uppercase mt-2">Net advisor payouts
                                                after platform commission</p>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="v3-nexus-panel d-flex flex-column justify-content-center">
                                            <span class="v3-identity-label">TOTAL TRANSACTIONS</span>
                                            <div class="display-5 fw-950 text-white">${fn:length(transactions)}</div>
                                            <p class="text-white-50 x-small fw-800 uppercase mt-2">Verified nodal
                                                exchanges</p>
                                        </div>
                                    </div>
                                </div>

                                <div class="v3-ledger-nexus">
                                    <h4 class="fw-900 text-white mb-5">Transaction History</h4>
                                    <div class="table-responsive">
                                        <table class="v3-data-table">
                                            <thead>
                                                <tr>
                                                    <th>TIMESTAMP</th>
                                                    <th>CLIENT NODE</th>
                                                    <th>GROSS VOLUME</th>
                                                    <th>COMMISSION (10%)</th>
                                                    <th>NET PAYOUT</th>
                                                    <th>STATUS</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="tx" items="${transactions}">
                                                    <tr>
                                                        <td>
                                                            <div class="fw-950 text-white">${tx.formattedDate}</div>
                                                            <div class="text-white-50 x-small fw-800">
                                                                ${tx.formattedTime} HRS</div>
                                                        </td>
                                                        <td>
                                                            <div class="fw-900 text-white">${tx.buyer.fullName}</div>
                                                            <div class="text-white-50 x-small">ID: ${tx.buyer.phone}
                                                            </div>
                                                        </td>
                                                        <td class="fw-900">₹
                                                            <fmt:formatNumber value="${tx.amount}" pattern="#,###.##" />
                                                        </td>
                                                        <td class="text-danger fw-800">- ₹
                                                            <fmt:formatNumber value="${tx.commission}"
                                                                pattern="#,###.##" />
                                                        </td>
                                                        <td class="text-success fw-950">₹
                                                            <fmt:formatNumber value="${tx.finalEarnings}"
                                                                pattern="#,###.##" />
                                                        </td>
                                                        <td>
                                                            <span
                                                                class="badge ${tx.status == 'SUCCESS' ? 'bg-success' : 'bg-warning'} bg-opacity-10 ${tx.status == 'SUCCESS' ? 'text-success' : 'text-warning'} fw-950 px-3 py-2 rounded-pill uppercase"
                                                                style="font-size: 9px; letter-spacing: 1px;">
                                                                ${tx.status}
                                                            </span>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                <c:if test="${empty transactions}">
                                                    <tr>
                                                        <td colspan="6" class="text-center py-5 opacity-50 fw-800">NO
                                                            FINANCIAL RECORDS DETECTED</td>
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
                </body>

                </html>