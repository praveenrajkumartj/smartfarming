<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
                <!DOCTYPE html>
                <html>

                <head>
                    <meta charset="UTF-8" />
                    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                    <title>Marketplace - Admin Panel</title>
                        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                    <link rel="icon" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🏪</text></svg>" />
            </head>

                <body>
                    <div class="dashboard-layout">
                        <aside class="sidebar" id="sidebar">
                            <div class="sidebar-brand" style="cursor: pointer;" onclick="window.location.href='${pageContext.request.contextPath}/'">
                                <div class="brand-icon">🌾</div>
                                <div class="brand-text">
                                    <h3>Smart Farming</h3><span>Admin Panel</span>
                                </div>
                            </div>
                            <nav class="sidebar-nav">
                                <div class="nav-section-title">Admin Menu</div>
                                <a href="${pageContext.request.contextPath}/admin/dashboard"><span
                                        class="nav-icon">📊</span> Dashboard</a>
                                <a href="${pageContext.request.contextPath}/admin/users"><span
                                        class="nav-icon">👥</span> Manage Users</a>
                                <a href="${pageContext.request.contextPath}/admin/crops"><span
                                        class="nav-icon">🌾</span> Manage Crops</a>
                                <a href="${pageContext.request.contextPath}/admin/market-prices"><span
                                        class="nav-icon">📈</span> Market Prices</a>
                                <a href="${pageContext.request.contextPath}/admin/schemes"><span
                                        class="nav-icon">🏛️</span> Govt. Schemes</a>
                                <a href="${pageContext.request.contextPath}/admin/disease-queries"><span
                                        class="nav-icon">🔬</span> Disease Queries</a>
                                <a href="${pageContext.request.contextPath}/admin/marketplace" class="active"><span
                                        class="nav-icon">📈</span> Marketplace</a>
                                <a href="${pageContext.request.contextPath}/admin/learning-videos"><span
                                        class="nav-icon">🎓</span> Learning Videos</a>
                                <div class="nav-section-title">Account</div>
                                <a href="${pageContext.request.contextPath}/logout"><span class="nav-icon">🚪</span> Logout</a>
                            </nav>
                        </aside>
                        <div class="main-content">
                            <header class="top-nav">
                                <div class="top-nav-left">
                                    <div class="hamburger" onclick="toggleSidebar()">
                                        <span></span><span></span><span></span>
                                    </div>
                                    <span class="page-title">🛒 Marketplace Overview</span>
                                </div>
                            </header>
                            <div class="page-body">
                                <div class="card">
                                    <div class="card-header">
                                        <span class="card-title">✨ All Marketplace Listings</span>
                                        <span class="badge badge-success">${fn:length(listings)} listings</span>
                                    </div>
                                    <div class="table-container">
                                        <table>
                                            <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>Crop</th>
                                                    <th>Farmer</th>
                                                    <th>Quantity</th>
                                                    <th>Price/Unit</th>
                                                    <th>Total Value</th>
                                                    <th>Location</th>
                                                    <th>Status</th>
                                                    <th>Listed On</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${listings}" var="l" varStatus="iStat">
                                                    <tr>
                                                        <td style="color:#6b7280;font-size:11px;">${iStat.count}</td>
                                                        <td><strong style="color:#22c55e;">${l.cropName}</strong></td>
                                                        <td>
                                                            <div style="font-size:13px;font-weight:600;color:#f0fdf4;">
                                                                ${l.farmer.fullName}</div>
                                                            <div style="font-size:11px;color:#6b7280;">${l.farmer.phone}
                                                            </div>
                                                        </td>
                                                        <td>${l.quantity} ${l.unit}</td>
                                                        <td>${l.pricePerUnit}/${l.unit}</td>
                                                        <td><strong style="color:#fcd34d;">${l.quantity *
                                                                l.pricePerUnit}</strong></td>
                                                        <td style="font-size:12px;color:#9ca3af;">${l.location}</td>
                                                        <td>
                                                            <span
                                                                class="badge ${l.status == 'AVAILABLE' ? 'badge-success' : (l.status == 'SOLD' ? 'badge-danger' : 'badge-warning')}">${l.status}</span>
                                                        </td>
                                                        <td style="font-size:11px;color:#9ca3af;">
                                                            ${l.createdAt}
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                <c:if test="${empty listings}">
                                                    <tr>
                                                        <td colspan="9"
                                                            style="text-align:center;padding:40px;color:#6b7280;">
                                                            No marketplace listings yet.
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
                    <script>function toggleSidebar() { document.getElementById('sidebar').classList.toggle('open'); }</script>
                
<script src="${pageContext.request.contextPath}/js/i18n.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

                </html>
