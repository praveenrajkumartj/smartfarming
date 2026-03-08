<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>🛡️ Equipment Oversight - AGROPLANTER Admin</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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
                            <a href="${pageContext.request.contextPath}/admin/users" class="sidebar-nav-item mb-2"><span
                                    class="nav-icon">👥</span> Identity Registry</a>
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
                            <a href="${pageContext.request.contextPath}/admin/crops" class="sidebar-nav-item mb-2"><span
                                    class="nav-icon">🌾</span> Crop Index</a>
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
                                class="sidebar-nav-item active mb-2"><span class="nav-icon">🚜</span> Agri-Uber</a>
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
                                <div class="hamburger" onclick="toggleSidebar()"><span></span><span></span><span></span>
                                </div>
                                <span class="page-title">🚜 Equipment Listing Approvals</span>
                            </div>
                            <div class="top-nav-right">
                                <div class="user-info"
                                    style="gap: 15px; cursor: pointer; display: flex; align-items: center;"
                                    onclick="window.location.href='${pageContext.request.contextPath}/admin/equipment-approvals'">
                                    <div class="user-details d-none d-md-flex flex-column text-end">
                                        <span class="user-name text-white fw-800"
                                            style="font-size: 14px; letter-spacing: -0.5px;">${admin.fullName}</span>
                                        <span class="user-role uppercase fw-950"
                                            style="font-size: 9px; color: #7c3aed; letter-spacing: 1px;">ROOT ACCESS:
                                            ${admin.role}</span>
                                    </div>
                                    <div class="user-avatar"
                                        style="width: 48px; height: 48px; border-radius: 16px; display: flex; align-items: center; justify-content: center; overflow: hidden; border: 1px solid rgba(255,255,255,0.1); box-shadow: 0 10px 20px rgba(124, 58, 237, 0.2);">
                                        <c:choose>
                                            <c:when test="${not empty admin.profileImagePath}">
                                                <img src="${pageContext.request.contextPath}${admin.profileImagePath}"
                                                    alt="Profile" style="width: 100%; height: 100%; object-fit: cover;">
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
                            <c:if test="${not empty successMessage}">
                                <div class="alert alert-success border-0 shadow-sm">${successMessage}</div>
                            </c:if>

                            <div class="card overkill-card">
                                <div class="card-header border-0 d-flex justify-content-between align-items-center">
                                    <span class="card-title">🚜 Pending Fleet Authorization</span>
                                    <div class="badge bg-warning bg-opacity-10 text-warning fw-950 px-4 py-2 rounded-pill uppercase"
                                        style="font-size: 10px; letter-spacing: 1px; border: 1px solid rgba(245, 158, 11, 0.2);">
                                        ${fn:length(pendingEquipment)} ASSETS WAITING</div>
                                </div>

                                <div class="table-container p-0">
                                    <table class="v3-data-table mb-0">
                                        <thead>
                                            <tr>
                                                <th class="ps-4">EQUIPMENT</th>
                                                <th>OPERATOR (OWNER)</th>
                                                <th>CATEGORY</th>
                                                <th>DEPLOYMENT ZONE</th>
                                                <th>DAILY QUOTATION</th>
                                                <th>AUTHORIZATION</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="equip" items="${pendingEquipment}">
                                                <tr>
                                                    <td class="ps-4">
                                                        <div class="d-flex align-items-center">
                                                            <div class="avatar-box me-3"
                                                                style="width: 44px; height: 44px;">
                                                                <img src="${empty equip.imagePath ? '/images/placeholder-tractor.jpg' : equip.imagePath}"
                                                                    style="width: 100%; height: 100%; object-fit: cover; border-radius: 8px;">
                                                            </div>
                                                            <div class="text-white fw-bold">${equip.name}</div>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="text-white-50">${equip.owner.fullName}</div>
                                                        <div class="text-muted" style="font-size: 10px;">UID:
                                                            #${equip.owner.id}
                                                        </div>
                                                    </td>
                                                    <td><span
                                                            class="badge bg-secondary bg-opacity-10 text-secondary">${equip.type}</span>
                                                    </td>
                                                    <td>${equip.district}, ${equip.state}</td>
                                                    <td><span
                                                            class="text-success fw-bold">₹${equip.rentalRatePerDay}</span>
                                                    </td>
                                                    <td>
                                                        <form
                                                            action="${pageContext.request.contextPath}/admin/equipment/approve/${equip.id}"
                                                            method="POST" class="d-inline">
                                                            <button type="submit"
                                                                class="btn btn-sm btn-success px-3">AUTHORIZE</button>
                                                        </form>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            <c:if test="${empty pendingEquipment}">
                                                <tr>
                                                    <td colspan="6" class="text-center text-muted py-5 opacity-50">
                                                        No pending assets in authorization queue.
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