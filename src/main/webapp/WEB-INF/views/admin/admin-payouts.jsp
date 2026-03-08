<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8" />
                    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                    <title>💰 Financial Control - AGROPLANTER Admin</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
                        rel="stylesheet">
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/voice-assistant.css" />
                    <link rel="stylesheet"
                        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
                    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800;900&display=swap"
                        rel="stylesheet">
                    <link rel="icon"
                        href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>💰</text></svg>" />
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
                            content: '💰';
                            position: absolute;
                            right: -30px;
                            top: -30px;
                            font-size: 200px;
                            opacity: 0.03;
                            transform: rotate(15deg);
                        }

                        .v3-nexus-panel {
                            background: rgba(15, 23, 42, 0.4);
                            border: 1px solid rgba(255, 255, 255, 0.05);
                            border-radius: 40px;
                            padding: 35px;
                            backdrop-filter: blur(40px);
                        }

                        .btn-quantum-success {
                            background: linear-gradient(135deg, #10b981 0%, #059669 100%);
                            border: none;
                            color: white;
                            font-weight: 800;
                            text-transform: uppercase;
                            letter-spacing: 1px;
                            padding: 8px 18px;
                            border-radius: 12px;
                            transition: 0.3s;
                            font-size: 10px;
                        }

                        .btn-quantum-success:hover {
                            transform: translateY(-2px);
                            box-shadow: 0 10px 20px rgba(16, 185, 129, 0.2);
                            color: white;
                        }

                        .btn-quantum-danger {
                            background: linear-gradient(135deg, #ef4444 0%, #dc2626 100%);
                            border: none;
                            color: white;
                            font-weight: 800;
                            text-transform: uppercase;
                            letter-spacing: 1px;
                            padding: 8px 18px;
                            border-radius: 12px;
                            transition: 0.3s;
                            font-size: 10px;
                        }

                        .btn-quantum-danger:hover {
                            transform: translateY(-2px);
                            box-shadow: 0 10px 20px rgba(239, 68, 68, 0.2);
                            color: white;
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

                        .v3-modal-glass {
                            background: rgba(15, 23, 42, 0.8) !important;
                            backdrop-filter: blur(40px) !important;
                            border: 1px solid rgba(255, 255, 255, 0.1) !important;
                            border-radius: 40px !important;
                        }
                    </style>
                </head>

                <body style="background: #020617; color: #fff; font-family: 'Outfit', sans-serif;">
                    <div class="dashboard-scene"></div>
                    <div class="dashboard-layout">
                        <!-- V3 Premium Sidebar -->
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
                                    class="sidebar-nav-item active mb-2"><span class="nav-icon">💰</span> Payout
                                    Registry</a>

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
                                            style="font-size: 2.2rem; letter-spacing: -1.5px;">Financial Control</h1>
                                        <span class="v3-page-subtitle text-purple-400 uppercase"
                                            style="letter-spacing: 1px; font-weight: 800;">
                                            💹 CAPITAL DISBURSEMENT | AUTHORIZATION: REQUIRED | STATUS: SECURED
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
                                                ACCESS: ADMIN</span>
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
                                                        <i class="fas fa-user-shield"></i>
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
                                                Financial Settlement Engine</h1>
                                            <p class="text-white-50 fw-800 uppercase x-small mb-0"
                                                style="letter-spacing: 2px;">
                                                <span class="v3-status-beam"></span> MONITORING LIQUIDITY: SETTLEMENT
                                                PROTOCOL ACTIVE
                                            </p>
                                        </div>
                                        <div class="col-lg-4 text-lg-end mt-4 mt-lg-0">
                                            <div class="badge bg-warning bg-opacity-10 text-warning fw-950 px-4 py-3 rounded-pill uppercase"
                                                style="font-size: 10px; letter-spacing: 2px; border: 1px solid rgba(245, 158, 11, 0.2);">
                                                ⚠️ ${fn:length(pendingWithdrawals)} PENDING TRANSFERS
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <c:if test="${successMessage != null}">
                                    <div
                                        class="alert alert-quantum-success border-0 bg-success bg-opacity-10 text-success fw-800 mb-5 p-4 rounded-4 shadow-sm">
                                        <div class="d-flex align-items-center gap-3">
                                            <div class="alert-icon-box bg-success text-white px-3 py-2 rounded-3">
                                                <i class="fas fa-check-circle"></i>
                                            </div>
                                            <div>
                                                <div class="uppercase x-small letter-spacing-2 opacity-50">Settlement
                                                    Protocol Updated</div>
                                                <div class="fs-6">${successMessage}</div>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>

                                <div class="v3-nexus-panel mb-5">
                                    <div class="d-flex justify-content-between align-items-center mb-5">
                                        <h4 class="fw-950 text-white m-0 fs-2" style="letter-spacing: -1.5px;">⚠️
                                            Verification Queue</h4>
                                        <span
                                            class="badge bg-danger bg-opacity-10 text-danger fw-950 px-4 py-2 rounded-pill uppercase"
                                            style="font-size: 9px; letter-spacing: 2px; border: 1px solid rgba(239, 68, 68, 0.1);">HIGH
                                            PRIORITY</span>
                                    </div>
                                    <div class="table-responsive">
                                        <table class="v3-data-table">
                                            <thead>
                                                <tr>
                                                    <th>TRANSACTION ID</th>
                                                    <th>IDENTITY</th>
                                                    <th>VALUATION</th>
                                                    <th>TARGET NODE</th>
                                                    <th class="text-end">AUTHORIZATION</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="req" items="${pendingWithdrawals}">
                                                    <tr>
                                                        <td>
                                                            <div class="fw-950 text-white">#${req.id}</div>
                                                            <div class="text-white-50 x-small fw-600">${req.requestDate}
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="fw-950 text-white fs-6">${req.farmer.fullName}
                                                            </div>
                                                            <div class="text-white-50 x-small fw-700 uppercase"
                                                                style="letter-spacing: 1px;">
                                                                <i class="fas fa-phone-alt me-1"></i>
                                                                ${req.farmer.phone}
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="fw-950 text-white fs-5"
                                                                style="letter-spacing: -1px;">₹${req.amount}</div>
                                                        </td>
                                                        <td>
                                                            <span
                                                                class="badge bg-primary bg-opacity-10 text-primary fw-950 px-3 py-1 rounded-pill uppercase font-monospace"
                                                                style="font-size: 9px; letter-spacing: 0.5px; border: 1px solid rgba(59, 130, 246, 0.2);">
                                                                ${req.transferReference}
                                                            </span>
                                                        </td>
                                                        <td class="text-end">
                                                            <div class="d-flex gap-2 justify-content-end">
                                                                <button class="btn btn-quantum-success"
                                                                    data-bs-toggle="modal"
                                                                    data-bs-target="#approveModal-${req.id}">
                                                                    AUTHORIZE
                                                                </button>
                                                                <button class="btn btn-quantum-danger"
                                                                    data-bs-toggle="modal"
                                                                    data-bs-target="#rejectModal-${req.id}">
                                                                    REJECT
                                                                </button>
                                                            </div>

                                                            <!-- Approve Modal -->
                                                            <div class="modal fade" id="approveModal-${req.id}"
                                                                tabindex="-1" aria-hidden="true">
                                                                <div class="modal-dialog modal-dialog-centered">
                                                                    <div class="modal-content v3-modal-glass">
                                                                        <div class="modal-header border-0 p-5 pb-0">
                                                                            <h5 class="modal-title fw-950 display-6 text-white"
                                                                                style="letter-spacing: -2px;">Verify
                                                                                Settlement</h5>
                                                                            <button type="button"
                                                                                class="btn-close btn-close-white"
                                                                                data-bs-dismiss="modal"></button>
                                                                        </div>
                                                                        <div class="modal-body p-5">
                                                                            <div
                                                                                class="p-4 bg-success bg-opacity-10 rounded-4 border border-success border-opacity-20 mb-4 text-center">
                                                                                <div
                                                                                    class="display-5 fw-950 text-success mb-2">
                                                                                    ₹${req.amount}</div>
                                                                                <div class="text-success-50 small fw-800 uppercase"
                                                                                    style="letter-spacing: 1px;">TARGET:
                                                                                    ${req.transferReference}</div>
                                                                            </div>
                                                                            <p class="text-white-50 fw-600 mb-0 lh-lg">
                                                                                By clicking confirm, you certify that
                                                                                the physical bank transfer to
                                                                                <strong>${req.farmer.fullName}</strong>
                                                                                has been initiated and verify the
                                                                                transaction record.
                                                                            </p>
                                                                        </div>
                                                                        <div class="modal-footer border-0 p-5 pt-0">
                                                                            <form
                                                                                action="${pageContext.request.contextPath}/admin/payouts/approve/${req.id}"
                                                                                method="post" class="w-100">
                                                                                <button type="submit"
                                                                                    class="btn btn-quantum-success w-100 py-3 rounded-4 fs-6">CONFIRM
                                                                                    SETTLEMENT</button>
                                                                            </form>
                                                                            <button type="button"
                                                                                class="btn btn-link text-white-50 w-100 fw-900 mt-3 text-decoration-none x-small uppercase"
                                                                                data-bs-dismiss="modal">ABORT
                                                                                PROCEDURE</button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <!-- Reject Modal -->
                                                            <div class="modal fade" id="rejectModal-${req.id}"
                                                                tabindex="-1" aria-hidden="true">
                                                                <div class="modal-dialog modal-dialog-centered">
                                                                    <div class="modal-content v3-modal-glass">
                                                                        <div class="modal-header border-0 p-5 pb-0">
                                                                            <h5 class="modal-title fw-950 display-6 text-white"
                                                                                style="letter-spacing: -2px;">Reject
                                                                                Request</h5>
                                                                            <button type="button"
                                                                                class="btn-close btn-close-white"
                                                                                data-bs-dismiss="modal"></button>
                                                                        </div>
                                                                        <div class="modal-body p-5">
                                                                            <p class="text-white-50 fw-600 mb-0 lh-lg">
                                                                                Are you certain you want to reject this
                                                                                withdrawal request of
                                                                                <strong>₹${req.amount}</strong> for
                                                                                farmer ${req.farmer.fullName}? Funds
                                                                                will be returned to the farmer's
                                                                                internal wallet.
                                                                            </p>
                                                                        </div>
                                                                        <div class="modal-footer border-0 p-5 pt-0">
                                                                            <form
                                                                                action="${pageContext.request.contextPath}/admin/payouts/reject/${req.id}"
                                                                                method="post" class="w-100">
                                                                                <button type="submit"
                                                                                    class="btn btn-quantum-danger w-100 py-3 rounded-4 fs-6">YES,
                                                                                    REJECT REQUEST</button>
                                                                            </form>
                                                                            <button type="button"
                                                                                class="btn btn-link text-white-50 w-100 fw-900 mt-3 text-decoration-none x-small uppercase"
                                                                                data-bs-dismiss="modal">CANCEL
                                                                                ACTION</button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                <c:if test="${empty pendingWithdrawals}">
                                                    <tr>
                                                        <td colspan="5" class="text-center py-5">
                                                            <div class="text-white-50 fw-950 uppercase opacity-30"
                                                                style="letter-spacing: 5px; font-size: 14px;">QUEUE
                                                                CLEAR - NO PENDING ACTIONS</div>
                                                        </td>
                                                    </tr>
                                                </c:if>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                                <div class="v3-nexus-panel mb-5">
                                    <div class="d-flex justify-content-between align-items-center mb-5">
                                        <h4 class="fw-950 text-white m-0 fs-2" style="letter-spacing: -1.5px;">📜
                                            Settlement Archive</h4>
                                        <span
                                            class="badge bg-success bg-opacity-10 text-success fw-950 px-4 py-2 rounded-pill uppercase"
                                            style="font-size: 9px; letter-spacing: 2px; border: 1px solid rgba(16, 185, 129, 0.1);">HISTORICAL
                                            LEDGER</span>
                                    </div>
                                    <div class="table-responsive">
                                        <table class="v3-data-table">
                                            <thead>
                                                <tr>
                                                    <th>REQ. ID</th>
                                                    <th>SETTLEMENT DATE</th>
                                                    <th>IDENTITY</th>
                                                    <th>VALUATION</th>
                                                    <th class="text-end">INTEGRITY</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="req" items="${completedWithdrawals}">
                                                    <tr>
                                                        <td>
                                                            <div class="fw-950 text-white-50 font-monospace">#${req.id}
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="text-white-50 x-small fw-800 uppercase">
                                                                ${req.processDate}</div>
                                                        </td>
                                                        <td>
                                                            <div class="fw-950 text-white">${req.farmer.fullName}</div>
                                                        </td>
                                                        <td>
                                                            <div class="fw-950 text-white">₹${req.amount}</div>
                                                        </td>
                                                        <td class="text-end">
                                                            <span
                                                                class="badge bg-success bg-opacity-10 text-success fw-950 px-3 py-1 rounded-pill uppercase"
                                                                style="font-size: 8px; letter-spacing: 1px; border: 1px solid rgba(16, 185, 129, 0.2);">SECURED</span>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                <c:if test="${empty completedWithdrawals}">
                                                    <tr>
                                                        <td colspan="5" class="text-center py-5">
                                                            <div class="text-white-50 fw-950 uppercase opacity-30"
                                                                style="letter-spacing: 2px;">ARCHIVE EMPTY</div>
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

                    <script src="${pageContext.request.contextPath}/js/voice-assistant.js"></script>
                    <script src="${pageContext.request.contextPath}/js/background-switcher.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                    <script>
                        function toggleSidebar() { document.getElementById('sidebar').classList.toggle('open'); }
                    </script>
                </body>

                </html>