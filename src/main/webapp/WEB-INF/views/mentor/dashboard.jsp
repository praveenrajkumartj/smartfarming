<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
            <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>🎓 Advisor Terminal - AGROPLANTER</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
                        rel="stylesheet">
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/voice-assistant.css">
                    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800;900&display=swap"
                        rel="stylesheet">
                    <link rel="icon"
                        href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🎓</text></svg>" />
                    <script>
                        window.AgroplanterUser = "${mentor.user.id}";
                        window.AgroplanterUserFull = "${mentor.user.fullName}";
                        window.AgroplanterRole = "${mentor.user.role}";
                    </script>
                    <style>
                        .v3-stat-grid {
                            display: grid;
                            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
                            gap: 30px;
                            margin-bottom: 50px;
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
                            border-color: rgba(251, 191, 36, 0.3);
                            box-shadow: 0 30px 60px rgba(0, 0, 0, 0.4);
                        }

                        .v3-stat-node::after {
                            content: '';
                            position: absolute;
                            bottom: -30px;
                            right: -30px;
                            width: 120px;
                            height: 120px;
                            background: radial-gradient(circle, #fbbf24 0%, transparent 70%);
                            opacity: 0.1;
                            filter: blur(30px);
                        }

                        .v3-nexus-panel {
                            background: rgba(15, 23, 42, 0.4);
                            border: 1px solid rgba(255, 255, 255, 0.05);
                            border-radius: 40px;
                            padding: 30px 40px;
                            backdrop-filter: blur(30px);
                            height: 100%;
                            position: relative;
                        }

                        .v3-data-table {
                            width: 100%;
                            border-collapse: separate;
                            border-spacing: 0 12px;
                        }

                        .v3-data-table thead th {
                            color: #475569;
                            font-family: 'Outfit';
                            font-size: 10px;
                            font-weight: 900;
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

                        .v3-data-table tbody tr:hover td {
                            background: rgba(251, 191, 36, 0.05);
                            border-color: rgba(251, 191, 36, 0.2);
                        }

                        .v3-data-table tr td:last-child {
                            border-right: 1px solid rgba(255, 255, 255, 0.03);
                            border-radius: 0 20px 20px 0;
                        }

                        .v3-avatar-bubble {
                            width: 50px;
                            height: 50px;
                            background: rgba(251, 191, 36, 0.1);
                            border: 2px solid #fbbf24;
                            border-radius: 15px;
                            display: flex;
                            align-items: center;
                            justify-content: center;
                            font-weight: 800;
                            color: #fbbf24;
                            font-size: 20px;
                        }

                        .v3-action-btn {
                            background: rgba(251, 191, 36, 0.1);
                            border: 1px solid rgba(251, 191, 36, 0.2);
                            color: #fbbf24;
                            padding: 12px 24px;
                            border-radius: 15px;
                            font-size: 11px;
                            font-weight: 800;
                            text-transform: uppercase;
                            text-decoration: none;
                            transition: 0.3s;
                            letter-spacing: 1px;
                        }

                        .v3-action-btn:hover {
                            background: #fbbf24;
                            color: #000;
                            box-shadow: 0 10px 20px rgba(251, 191, 36, 0.2);
                            transform: translateY(-2px);
                        }

                        .v3-btn-complete {
                            background: rgba(59, 130, 246, 0.1);
                            border-color: rgba(59, 130, 246, 0.2);
                            color: #3b82f6;
                        }

                        .v3-btn-complete:hover {
                            background: #3b82f6;
                            color: #fff;
                            box-shadow: 0 10px 20px rgba(59, 130, 246, 0.2);
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
                                            style="font-size: 10px; color: #fbbf24; font-weight: 800; letter-spacing: 1px;">ADVISOR
                                            NODE V3</span>
                                    </div>
                                </div>
                            </div>

                            <nav class="sidebar-nav px-3 py-4">
                                <div class="nav-section-title px-2 mb-2"
                                    style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">
                                    STRATEGIC COMMAND</div>
                                <a href="${pageContext.request.contextPath}/mentor/dashboard"
                                    class="sidebar-nav-item active mb-2">
                                    <span class="nav-icon">📊</span> Advisor Workspace
                                </a>
                                <a href="${pageContext.request.contextPath}/mentor/ledger"
                                    class="sidebar-nav-item mb-2">
                                    <span class="nav-icon">📖</span> Advisory Ledger
                                </a>
                                <a href="${pageContext.request.contextPath}/mentor/reviews"
                                    class="sidebar-nav-item mb-2">
                                    <span class="nav-icon">⭐</span> Advisor Reviews
                                </a>
                                <a href="${pageContext.request.contextPath}/chat" class="sidebar-nav-item mb-2">
                                    <span class="nav-icon">💬</span> Message Core
                                </a>

                                <div class="nav-section-title px-2 mt-4 mb-2"
                                    style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">
                                    FARMER INTEL</div>
                                <a href="${pageContext.request.contextPath}/farmer/dashboard"
                                    class="sidebar-nav-item mb-2" style="color: #10b981;">
                                    <span class="nav-icon">👨‍🌾</span> Farmer Command
                                </a>

                                <div class="nav-section-title px-2 mt-4 mb-2"
                                    style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">
                                    USER IDENTITY</div>
                                <a href="${pageContext.request.contextPath}/mentor/profile"
                                    class="sidebar-nav-item mb-2">
                                    <span class="nav-icon">👤</span> Advisor Profile
                                </a>

                                <div class="nav-section-title px-2 mt-4 mb-2"
                                    style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">
                                    SESSION OPS</div>
                                <a href="${pageContext.request.contextPath}/logout"
                                    class="sidebar-nav-item text-danger mt-4">
                                    <span class="nav-icon">🚪</span> Terminate Session
                                </a>
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
                                            style="font-size: 2.2rem; letter-spacing: -1.5px;">Advisor Workspace</h1>
                                        <span class="v3-page-subtitle text-warning uppercase"
                                            style="letter-spacing: 1px; font-weight: 800;">
                                            📡 EXPERTISE NODE: ${mentor.expertise.toUpperCase()} | STATUS: OPERATIONAL |
                                            NODE: V3 SECURED
                                        </span>
                                    </div>
                                </div>
                            </header>

                            <div class="page-body px-5 py-5">
                                <c:if test="${not empty successMessage}">
                                    <div class="alert alert-success border-0 bg-success bg-opacity-10 text-success rounded-4 mb-5 p-4 fw-800 uppercase x-small"
                                        style="letter-spacing: 1px;">
                                        ⚡ PROTOCOL UPDATE: ${successMessage}
                                    </div>
                                </c:if>

                                <div class="v3-stat-grid">
                                    <div class="v3-stat-node">
                                        <span class="trust-label uppercase d-block mb-2"
                                            style="font-size: 9px; letter-spacing: 2px; color: #475569;">TACTICAL
                                            REVENUE</span>
                                        <div class="display-5 fw-950 text-white mb-1" style="letter-spacing: -2px;">
                                            ₹
                                            <fmt:formatNumber value="${totalEarnings}" pattern="#,###.##" />
                                        </div>
                                        <div class="text-white-50 x-small fw-950 uppercase"
                                            style="font-size: 8px; letter-spacing: 1.5px;">TOTAL EARNINGS</div>
                                    </div>
                                    <div class="v3-stat-node">
                                        <span class="trust-label uppercase d-block mb-2"
                                            style="font-size: 9px; letter-spacing: 2px; color: #475569;">ACTIVE
                                            DEPLOYMENTS</span>
                                        <div class="display-5 fw-950 text-white mb-1" style="letter-spacing: -2px;">
                                            ${totalSessions}</div>
                                        <div class="text-white-50 x-small fw-950 uppercase"
                                            style="font-size: 8px; letter-spacing: 1.5px;">CONSULTATIONS COMPLETED</div>
                                    </div>
                                    <div class="v3-stat-node">
                                        <span class="trust-label uppercase d-block mb-2"
                                            style="font-size: 9px; letter-spacing: 2px; color: #475569;">ADVISOR
                                            RATING</span>
                                        <div class="display-5 fw-950 text-warning mb-1" style="letter-spacing: -2px;">
                                            ${mentor.rating}</div>
                                        <div class="text-white-50 x-small fw-950 uppercase"
                                            style="font-size: 8px; letter-spacing: 1.5px;">COMMUNITY TRUST SCORE</div>
                                    </div>
                                </div>

                                <div class="v3-nexus-panel">
                                    <div class="d-flex justify-content-between align-items-center mb-5">
                                        <h4 class="fw-900 text-white m-0 fs-2"
                                            style="letter-spacing: -1.5px; line-height: 1;">Pending Consultations</h4>
                                        <div class="badge bg-warning bg-opacity-10 text-warning fw-950 px-4 py-2 rounded-pill uppercase"
                                            style="font-size: 9px; letter-spacing: 2px; border: 1px solid rgba(251, 191, 36, 0.1);">
                                            OPERATIONAL QUEUE: ${fn:length(upcoming)}</div>
                                    </div>

                                    <div class="table-responsive">
                                        <table class="v3-data-table">
                                            <thead>
                                                <tr>
                                                    <th>CLIENT ASSET / NODE</th>
                                                    <th>NET VOLUME</th>
                                                    <th>VALUATION</th>
                                                    <th>BIO-TRACEABILITY</th>
                                                    <th class="text-end">CONTROL</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="c" items="${upcoming}">
                                                    <tr>
                                                        <td>
                                                            <div class="text-white fw-900 mb-1"
                                                                style="font-size: 16px;">${c.farmer.fullName}</div>
                                                            <div class="text-white-50 x-small fw-800 uppercase"
                                                                style="letter-spacing: 0.5px; font-size: 8px;">LOC:
                                                                ${c.farmer.district}, ${c.farmer.state} | ID:
                                                                ${c.farmer.phone}</div>
                                                        </td>
                                                        <td>
                                                            <div class="text-white fw-900" style="font-size: 15px;">
                                                                ADVISORY PROTOCOL</div>
                                                            <span
                                                                class="badge bg-warning bg-opacity-10 text-warning x-small fw-900 uppercase p-0">PENDING
                                                                MISSION</span>
                                                        </td>
                                                        <td>
                                                            <div class="text-success fw-900" style="font-size: 20px;">
                                                                ₹${c.fee}<span
                                                                    class="text-white-50 x-small fw-400">/SESSION</span>
                                                                <button
                                                                    class="btn btn-sm btn-link text-warning p-0 ms-2"
                                                                    onclick="openFeeModal('${c.id}', '${c.fee}')"
                                                                    title="Fix Fee">
                                                                    <i class="fas fa-edit"></i>
                                                                </button>
                                                            </div>
                                                            <div class="text-white-50 x-small fw-800 uppercase">TTL:
                                                                ₹${c.fee}</div>
                                                        </td>
                                                        <td>
                                                            <div class="text-white fw-900" style="font-size: 15px;">
                                                                ${c.formattedSessionTime}</div>
                                                            <div class="text-warning x-small fw-800 uppercase"
                                                                style="letter-spacing: 0.5px;">${c.formattedSessionHour}
                                                                HRS • T-MINUS</div>
                                                        </td>
                                                        <td class="text-end">
                                                            <div
                                                                class="d-flex gap-3 justify-content-end align-items-center">
                                                                <a href="${pageContext.request.contextPath}/chat?with=${c.farmer.id}"
                                                                    class="btn btn-outline-warning px-4 py-2 rounded-3 fw-900 uppercase small"
                                                                    style="font-size: 10px; border-width: 1.5px;">INTEL</a>
                                                                <form
                                                                    action="${pageContext.request.contextPath}/mentor/consultation/complete/${c.id}"
                                                                    method="POST" class="m-0">
                                                                    <button type="submit"
                                                                        class="btn btn-warning px-4 py-2 rounded-3 fw-900 uppercase small text-dark"
                                                                        style="font-size: 10px;">RESOLVE</button>
                                                                </form>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                <c:if test="${empty upcoming}">
                                                    <tr>
                                                        <td colspan="5" class="text-center py-5">
                                                            <div class="display-3 opacity-10 mb-4"
                                                                style="filter: drop-shadow(0 0 20px rgba(59, 130, 246, 0.2));">
                                                                📡</div>
                                                            <div class="text-white fw-950 uppercase"
                                                                style="letter-spacing: 4px; font-size: 16px; opacity: 0.8;">
                                                                STEALTH MODE ACTIVE</div>
                                                            <div class="text-white-50 x-small fw-800 uppercase mt-2 mb-4"
                                                                style="font-size: 9px; letter-spacing: 2px;">No
                                                                operational deployments detected in current sector</div>
                                                            <div
                                                                style="width: 150px; height: 1px; background: linear-gradient(90deg, transparent, rgba(255,255,255,0.1), transparent); margin: 0 auto;">
                                                            </div>
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

                    <!-- Fee Update Modal -->
                    <div class="modal fade" id="feeModal" tabindex="-1" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content v3-nexus-panel border-0"
                                style="background: rgba(15, 23, 42, 0.95); border-radius: 40px; border: 1px solid rgba(255,255,255,0.05);">
                                <div class="modal-body p-5">
                                    <h4 class="fw-900 text-white mb-4">Fix Session Fee</h4>
                                    <p class="text-white-50 x-small fw-600 mb-4">Set the final amount for this specific
                                        session. This update will be reflected in the final transaction and payout.</p>
                                    <form id="feeForm" method="POST">
                                        <div class="mb-4">
                                            <label class="v3-identity-label">NEW SESSION FEE (₹)</label>
                                            <input type="number" name="fee" id="newFeeInput" class="form-control"
                                                style="background: rgba(255,255,255,0.05); border: 1px solid rgba(255,255,255,0.1); border-radius: 16px; color: white; padding: 15px;"
                                                step="0.01" required>
                                        </div>
                                        <div class="d-flex gap-3">
                                            <button type="button" class="v3-action-btn flex-fill"
                                                data-bs-dismiss="modal">CANCEL</button>
                                            <button type="submit" class="v3-action-btn v3-btn-complete flex-fill"
                                                style="background: #fbbf24; color: #000; border: none;">COMMIT
                                                FEE</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                    <style>
                        .v3-identity-label {
                            font-size: 10px;
                            font-weight: 950;
                            color: #475569;
                            letter-spacing: 2px;
                            text-transform: uppercase;
                            margin-bottom: 10px;
                            display: block;
                        }
                    </style>

                    <div class="voice-assistant-container">
                        <label class="voice-status-label" id="voiceStatus">IDLE</label>
                        <button class="voice-trigger-btn" id="startVoice">🎙️</button>
                    </div>

                    <script src="${pageContext.request.contextPath}/js/voice-assistant.js"></script>
                    <script src="${pageContext.request.contextPath}/js/background-switcher.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                    <script>
                        function toggleSidebar() { document.getElementById('sidebar').classList.toggle('open'); }

                        function openFeeModal(id, currentFee) {
                            const form = document.getElementById('feeForm');
                            form.action = '${pageContext.request.contextPath}/mentor/consultation/update-fee/' + id;
                            document.getElementById('newFeeInput').value = currentFee;
                            new bootstrap.Modal(document.getElementById('feeModal')).show();
                        }
                    </script>
                </body>

                </html>