<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
                <!DOCTYPE html>
                <html>

                <head>
                    <meta charset="UTF-8" />
                    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                    <title>🚜 Rental Logs - AGROPLANTER Admin</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
                        rel="stylesheet">
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                    <link rel="icon"
                        href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🚜</text></svg>" />
                </head>

                <body>
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
                                    class="sidebar-nav-item active mb-2"><span class="nav-icon">🚜</span> Rental
                                    Logs</a>
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

                        <div class="main-content">
                            <header class="top-nav">
                                <div class="top-nav-left">
                                    <div class="hamburger" onclick="toggleSidebar()">
                                        <span></span><span></span><span></span>
                                    </div>
                                    <span class="page-title">🚜 Agri-Uber Rental Logs</span>
                                </div>
                                <div class="top-nav-right">
                                    <div class="user-info"
                                        style="gap: 15px; cursor: pointer; display: flex; align-items: center;"
                                        onclick="window.location.href='${pageContext.request.contextPath}/admin/rental-transactions'">
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
                                                        ${fn:substring(admin.fullName, 0, 1)}
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                </div>
                            </header>

                            <div class="page-body">
                                <div class="card overkill-card">
                                    <div class="card-header border-0 d-flex justify-content-between align-items-center">
                                        <span class="card-title">💸 Financial Rental Audit</span>
                                        <div class="badge bg-info bg-opacity-10 text-info fw-950 px-4 py-2 rounded-pill uppercase"
                                            style="font-size: 10px; letter-spacing: 1px; border: 1px solid rgba(6, 182, 212, 0.2);">
                                            ${fn:length(rentals)} TRANSACTIONS RECORDED</div>
                                    </div>

                                    <div class="table-container p-0">
                                        <table class="v3-data-table mb-0">
                                            <thead>
                                                <tr>
                                                    <th class="ps-4">LOG ID</th>
                                                    <th>ASSET</th>
                                                    <th>OPERATOR (OWNER)</th>
                                                    <th>LESSEE (RENTER)</th>
                                                    <th>TEMPORAL SPAN</th>
                                                    <th>QUOTATION</th>
                                                    <th>STATUS</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="rental" items="${rentals}">
                                                    <tr>
                                                        <td class="ps-4 small text-muted font-monospace">#${rental.id}
                                                        </td>
                                                        <td>
                                                            <div class="text-white fw-bold">${rental.equipment.name}
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="text-white-50 small">
                                                                ${rental.equipment.owner.fullName}</div>
                                                        </td>
                                                        <td>
                                                            <div class="text-white-50 small">${rental.renter.fullName}
                                                            </div>
                                                        </td>
                                                        <td class="small">
                                                            <div class="text-muted">Start: ${rental.startTime}</div>
                                                            <div class="text-muted">End: ${rental.endTime}</div>
                                                        </td>
                                                        <td><span
                                                                class="text-success fw-bold">₹${rental.totalCost}</span>
                                                        </td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${rental.status == 'APPROVED'}">
                                                                    <span
                                                                        class="badge bg-success bg-opacity-10 text-success"
                                                                        style="font-size: 10px;">ACTIVE</span>
                                                                </c:when>
                                                                <c:when test="${rental.status == 'PENDING'}">
                                                                    <span
                                                                        class="badge bg-warning bg-opacity-10 text-warning"
                                                                        style="font-size: 10px;">AWAITING</span>
                                                                </c:when>
                                                                <c:when test="${rental.status == 'CANCELLED'}">
                                                                    <span
                                                                        class="badge bg-danger bg-opacity-10 text-danger"
                                                                        style="font-size: 10px;">VOIDED</span>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <span
                                                                        class="badge bg-secondary bg-opacity-10 text-secondary"
                                                                        style="font-size: 10px;">${rental.status}</span>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                <c:if test="${empty rentals}">
                                                    <tr>
                                                        <td colspan="7" class="text-center text-muted py-5 opacity-50">
                                                            No rental logs found in the financial database.
                                                        </td>
                                                    </tr>
                                                </c:if>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <script src="${pageContext.request.contextPath}/js/background-switcher.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                    <script>
                        function toggleSidebar() { document.getElementById('sidebar').classList.toggle('open'); }
                    </script>
                </body>

                </html>