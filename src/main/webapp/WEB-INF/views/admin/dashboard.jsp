<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>🛡️ Admin Dashboard - Smart Farming Platform</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                <link rel="icon" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>⚙️</text></svg>" />
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
                            <a href="${pageContext.request.contextPath}/admin/dashboard" class="active"><span
                                    class="nav-icon">📊</span> Dashboard</a>
                            <a href="${pageContext.request.contextPath}/admin/users"><span class="nav-icon">👥</span> Manage Users</a>
                            <a href="${pageContext.request.contextPath}/admin/crops"><span class="nav-icon">🌾</span> Manage Crops</a>
                            <a href="${pageContext.request.contextPath}/admin/market-prices"><span
                                    class="nav-icon">📈</span> Market Prices</a>
                            <a href="${pageContext.request.contextPath}/admin/schemes"><span class="nav-icon">🏛️</span>
                                Govt. Schemes</a>
                            <a href="${pageContext.request.contextPath}/admin/disease-queries"><span
                                    class="nav-icon">🔬</span> Disease Queries</a>
                            <a href="${pageContext.request.contextPath}/admin/marketplace"><span
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
                                <div class="hamburger" onclick="toggleSidebar()"><span></span><span></span><span></span>
                                </div>
                                <span class="page-title">🛡️ Admin Dashboard</span>
                            </div>
                            <div class="top-nav-right">
                                <div class="user-info">
                                    <div class="user-avatar"
                                        style="background:linear-gradient(135deg,#7c3aed,#a855f7);">A</div>
                                    <div style="display: flex; flex-direction: column; justify-content: center;">
                                        <div class="user-name">${admin.fullName}</div>
                                        <div class="user-role" style="color:#c4b5fd;">🛡️ Admin</div>
                                    </div>
                                </div>
                            </div>
                        </header>

                        <div class="page-body">
                            <!-- Welcome -->
                            <div
                                style="background:linear-gradient(135deg,#1e1232,#2d1b4e);border:1px solid rgba(124,58,237,0.2);border-radius:20px;padding:28px;margin-bottom:24px;position:relative;overflow:hidden;">
                                <div style="position:absolute;right:-20px;top:-20px;font-size:100px;opacity:0.08;">📊
                                </div>
                                <h2 style="font-size:22px;font-weight:800;color:#f0fdf4;margin-bottom:6px;">
                                    Platform Overview 📊
                                </h2>
                                <p style="color:#c4b5fd;font-size:14px;">
                                    📅 <span id="currentDate"></span> &nbsp;|&nbsp; ✅ All Systems Operational
                                </p>
                            </div>

                            <!-- Stats Row 1 -->
                            <div class="stats-grid">
                                <div class="stat-card">
                                    <span class="stat-icon">👨‍🌾</span>
                                    <div class="stat-value">${totalFarmers}</div>
                                    <div class="stat-label">Total Farmers</div>
                                </div>
                                <div class="stat-card blue">
                                    <span class="stat-icon">🛒</span>
                                    <div class="stat-value">${totalBuyers}</div>
                                    <div class="stat-label">Total Buyers</div>
                                </div>
                                <div class="stat-card amber">
                                    <span class="stat-icon">🛒</span>
                                    <div class="stat-value">${totalListings}</div>
                                    <div class="stat-label">Active Listings</div>
                                </div>
                                <div class="stat-card purple">
                                    <span class="stat-icon">⏳</span>
                                    <div class="stat-value">${pendingQueries}</div>
                                    <div class="stat-label">Pending Queries</div>
                                </div>
                            </div>

                            <!-- Stats Row 2 -->
                            <div class="stats-grid" style="margin-top:0;">
                                <div class="stat-card">
                                    <span class="stat-icon">🌱</span>
                                    <div class="stat-value">${totalCrops}</div>
                                    <div class="stat-label">Crops in DB</div>
                                </div>
                                <div class="stat-card blue">
                                    <span class="stat-icon">💳</span>
                                    <div class="stat-value">${totalPrices}</div>
                                    <div class="stat-label">Price Records</div>
                                </div>
                                <div class="stat-card amber">
                                    <span class="stat-icon">🏛️</span>
                                    <div class="stat-value">${totalSchemes}</div>
                                    <div class="stat-label">Govt. Schemes</div>
                                </div>
                                <div class="stat-card purple">
                                    <span class="stat-icon">👨‍🌾</span>
                                    <div class="stat-value">${totalFarmers + totalBuyers}</div>
                                    <div class="stat-label">Total Users</div>
                                </div>
                            </div>

                            <!-- Quick Admin Actions -->
                            <div class="card" style="margin-bottom:24px;">
                                <div class="card-header">
                                    <span class="card-title">🛡️ Admin Quick Actions</span>
                                </div>
                                <div class="card-body">
                                    <div class="quick-actions">
                                        <a href="${pageContext.request.contextPath}/admin/users"
                                            class="quick-action-btn">
                                            <span class="quick-action-icon">👥</span>
                                            <span class="quick-action-label">Manage Users</span>
                                        </a>
                                        <a href="${pageContext.request.contextPath}/admin/crops"
                                            class="quick-action-btn">
                                            <span class="quick-action-icon">🌾</span>
                                            <span class="quick-action-label">Manage Crops</span>
                                        </a>
                                        <a href="${pageContext.request.contextPath}/admin/market-prices"
                                            class="quick-action-btn">
                                            <span class="quick-action-icon">📈</span>
                                            <span class="quick-action-label">Market Prices</span>
                                        </a>
                                        <a href="${pageContext.request.contextPath}/admin/schemes"
                                            class="quick-action-btn">
                                            <span class="quick-action-icon">🏛️</span>
                                            <span class="quick-action-label">Govt Schemes</span>
                                        </a>
                                        <a href="${pageContext.request.contextPath}/admin/disease-queries"
                                            class="quick-action-btn">
                                            <span class="quick-action-icon">🔬</span>
                                            <span class="quick-action-label">Disease Queries</span>
                                        </a>
                                        <a href="${pageContext.request.contextPath}/admin/marketplace"
                                            class="quick-action-btn">
                                            <span class="quick-action-icon">📈</span>
                                            <span class="quick-action-label">Marketplace</span>
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <!-- Recent Users + Pending Queries -->
                            <div class="grid-2">
                                <div class="card">
                                    <div class="card-header">
                                        <span class="card-title">👥 Recent Users</span>
                                        <a href="${pageContext.request.contextPath}/admin/users"
                                            class="btn btn-secondary btn-sm">View All</a>
                                    </div>
                                    <div class="table-container">
                                        <table>
                                            <thead>
                                                <tr>
                                                    <th>Name</th>
                                                    <th>Role</th>
                                                    <th>State</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${recentUsers}" var="u">
                                                    <tr>
                                                        <td>
                                                            <div style="font-weight:600;color:#f0fdf4;font-size:13px;">
                                                                ${u.fullName}</div>
                                                            <div style="font-size:11px;color:#6b7280;">${u.email}</div>
                                                        </td>
                                                        <td>
                                                            <span
                                                                class="badge ${u.role == 'FARMER' ? 'badge-success' : (u.role == 'BUYER' ? 'badge-info' : 'badge-warning')}">${u.role}</span>
                                                        </td>
                                                        <td style="font-size:12px;color:#9ca3af;">${u.state}</td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                                <div class="card">
                                    <div class="card-header">
                                        <span class="card-title">⏳ Pending Disease Queries</span>
                                        <a href="${pageContext.request.contextPath}/admin/disease-queries"
                                            class="btn btn-secondary btn-sm">View All</a>
                                    </div>
                                    <div class="card-body" style="padding:12px;">
                                        <c:if test="${empty recentQueries}">
                                            <div class="empty-state" style="padding:20px;">
                                                <p style="color:#6b7280;">No pending queries ✅</p>
                                            </div>
                                        </c:if>
                                        <c:forEach items="${recentQueries}" var="q">
                                            <div
                                                style="padding:12px;background:var(--surface);border-radius:10px;margin-bottom:10px;border:1px solid var(--border);">
                                                <div
                                                    style="display:flex;justify-content:space-between;margin-bottom:4px;">
                                                    <strong style="color:#22c55e;font-size:13px;">${q.cropName}</strong>
                                                    <span class="badge badge-warning">Pending</span>
                                                </div>
                                                <div style="font-size:12px;color:#9ca3af;">${q.farmer.fullName}</div>
                                                <div style="font-size:12px;color:#6b7280;margin-top:4px;">
                                                    <c:choose>
                                                        <c:when test="${fn:length(q.symptoms) > 80}">
                                                            ${fn:substring(q.symptoms, 0, 80)}...
                                                        </c:when>
                                                        <c:otherwise>
                                                            ${q.symptoms}
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                                <a href="${pageContext.request.contextPath}/admin/disease-queries"
                                                    class="btn btn-primary btn-sm" style="margin-top:8px;">Update
                                                    Diagnosis</a>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <script src="${pageContext.request.contextPath}/js/background-switcher.js"></script>
                <script>
                    document.getElementById('currentDate').textContent = new Date().toLocaleDateString('en-IN', {
                        weekday: 'long', year: 'numeric', month: 'long', day: 'numeric'
                    });
                    function toggleSidebar() { document.getElementById('sidebar').classList.toggle('open'); }
                </script>
            
<script src="${pageContext.request.contextPath}/js/i18n.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

            </html>
