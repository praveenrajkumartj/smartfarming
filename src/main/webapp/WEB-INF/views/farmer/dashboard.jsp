<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>👨‍🌾 Farmer Dashboard - Smart Farming Platform</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet"
                    href="${pageContext.request.contextPath}/css/style.css?v=<%= System.currentTimeMillis() %>" />
                <link rel="icon" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>📊</text></svg>" />
            </head>

            <body>
                <div class="dashboard-layout">
                    <!-- Sidebar -->
                    <aside class="sidebar" id="sidebar">
                        <div class="sidebar-brand" style="cursor: pointer;" onclick="window.location.href='${pageContext.request.contextPath}/'">
                            <div class="brand-icon">🌾</div>
                            <div class="brand-text">
                                <h3>Smart Farming</h3>
                                <span>Farmer Portal</span>
                            </div>
                        </div>

                        <nav class="sidebar-nav">
                            <div class="nav-section-title">Main Menu</div>
                            <a href="${pageContext.request.contextPath}/farmer/dashboard" class="active"><span
                                    class="nav-icon">📊</span> Dashboard</a>
                            <a href="${pageContext.request.contextPath}/farmer/crop-recommendation"><span
                                    class="nav-icon">🌱</span> Crop Recommendation</a>
                            <a href="${pageContext.request.contextPath}/farmer/market-prices"><span
                                    class="nav-icon">📈</span> Market Prices</a>
                            <a href="${pageContext.request.contextPath}/farmer/disease-detection"><span
                                    class="nav-icon">🔬</span> Disease Detection</a>
                            <a href="${pageContext.request.contextPath}/farmer/marketplace"><span
                                    class="nav-icon">🛒</span> My Marketplace</a>
                            <a href="${pageContext.request.contextPath}/farmer/schemes"><span
                                    class="nav-icon">🏛️</span> Govt. Schemes</a>
                            <a href="${pageContext.request.contextPath}/farmer/learning"><span
                                    class="nav-icon">🎓</span> Learning Videos</a>
                            <div class="nav-section-title">Account</div>
                            <a href="${pageContext.request.contextPath}/farmer/profile"><span class="nav-icon">👤</span> My Profile</a>
                            <a href="${pageContext.request.contextPath}/logout"><span class="nav-icon">🚪</span> Logout</a>
                        </nav>

                        <div class="sidebar-footer">
                            <div style="font-size:11px;color:#6b7280;text-align:center;">
                                Smart Farming Platform v1.0<br />
                                <span style="color:#22c55e;">● System Online</span>
                            </div>
                        </div>
                    </aside>

                    <!-- Main Content -->
                    <div class="main-content">
                        <!-- Top Nav -->
                        <header class="top-nav">
                            <div class="top-nav-left">
                                <div class="hamburger" onclick="toggleSidebar()" id="hamburger">
                                    <span></span><span></span><span></span>
                                </div>
                                <span class="page-title">👨‍🌾 Farmer Dashboard</span>
                            </div>
                            <div class="top-nav-right">
                                <div class="user-info">
                                    <div class="user-avatar" <c:if test="${not empty user.profileImagePath}">
                                        style="background: transparent; padding: 0;"</c:if>>
                                        <c:choose>
                                            <c:when test="${not empty user.profileImagePath}">
                                                <img src="${pageContext.request.contextPath}${user.profileImagePath}"
                                                    style="width: 100%; height: 100%; border-radius: 50%; object-fit: cover; display: block;"
                                                    alt="Profile Picture" />
                                            </c:when>
                                            <c:otherwise>
                                                ${fn:substring(user.fullName, 0, 1)}
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div style="display: flex; flex-direction: column; justify-content: center;">
                                        <div class="user-name">${user.fullName}</div>
                                        <div style="display: flex; align-items: center; gap: 8px; margin-top: 4px;">
                                            <div class="user-role" style="margin-bottom: 0;">👨‍🌾 Farmer</div>
                                            <div
                                                style="font-size: 10px; background: rgba(34,197,94,0.15); color: #22c55e; padding: 2px 6px; border-radius: 6px; display: inline-flex; align-items: center; font-weight: 700; border: 1px solid rgba(34,197,94,0.3); letter-spacing: 0.5px;">
                                                ⭐ ${not empty user.subscriptionPlan ? user.subscriptionPlan : 'Basic
                                                Plan'}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </header>

                        <div class="page-body">
                            <!-- Welcome Banner -->
                            <div
                                style="background: linear-gradient(135deg, #0d2515, #1a3824); border: 1px solid rgba(22,163,74,0.2); border-radius: 20px; padding: 28px; margin-bottom: 24px; position: relative; overflow: hidden;">
                                <div
                                    style="position: absolute; right: -30px; top: -30px; font-size: 120px; opacity: 0.1;">
                                    🌤️</div>
                                <h2 style="font-size: 22px; font-weight: 800; color: #f0fdf4; margin-bottom: 6px;">
                                    <span id="greetingText">Good Morning</span>, <span
                                        style="color: #22c55e;">${user.fullName}</span>! <span
                                        id="greetingIcon">👋</span>
                                </h2>
                                <p style="color: #86efac; font-size: 14px;">
                                    📍 <span>${user.district}</span>, <span>${user.state}</span>
                                    &nbsp; | &nbsp; 📅 Today: <span id="currentDate"></span>
                                </p>
                            </div>

                            <!-- Stats -->
                            <div class="stats-grid">
                                <div class="stat-card">
                                    <span class="stat-icon">🛒</span>
                                    <div class="stat-value">${totalListings}</div>
                                    <div class="stat-label">My Listings</div>
                                </div>
                                <div class="stat-card blue">
                                    <span class="stat-icon">📈</span>
                                    <div class="stat-value">${availableListings}</div>
                                    <div class="stat-label">Market Available</div>
                                </div>
                                <div class="stat-card amber">
                                    <span class="stat-icon">🩺</span>
                                    <div class="stat-value">${diseaseQueries}</div>
                                    <div class="stat-label">Disease Queries</div>
                                </div>
                                <div class="stat-card purple">
                                    <span class="stat-icon">🏛️</span>
                                    <div class="stat-value">${fn:length(recentSchemes)}</div>
                                    <div class="stat-label">Active Schemes</div>
                                </div>
                            </div>

                            <!-- Quick Actions -->
                            <div class="card" style="margin-bottom: 24px;">
                                <div class="card-header">
                                    <span class="card-title">⚡ Quick Actions</span>
                                </div>
                                <div class="card-body">
                                    <div class="quick-actions">
                                        <a href="${pageContext.request.contextPath}/farmer/crop-recommendation}"
                                            class="quick-action-btn">
                                            <span class="quick-action-icon">🌱</span>
                                            <span class="quick-action-label">Crop Advice</span>
                                        </a>
                                        <a href="${pageContext.request.contextPath}/farmer/market-prices"
                                            class="quick-action-btn">
                                            <span class="quick-action-icon">📈</span>
                                            <span class="quick-action-label">Market Prices</span>
                                        </a>
                                        <a href="${pageContext.request.contextPath}/farmer/disease-detection"
                                            class="quick-action-btn">
                                            <span class="quick-action-icon">🔬</span>
                                            <span class="quick-action-label">Check Disease</span>
                                        </a>
                                        <a href="${pageContext.request.contextPath}/farmer/marketplace"
                                            class="quick-action-btn">
                                            <span class="quick-action-icon">🛒</span>
                                            <span class="quick-action-label">Sell Crops</span>
                                        </a>
                                        <a href="${pageContext.request.contextPath}/farmer/schemes"
                                            class="quick-action-btn">
                                            <span class="quick-action-icon">🏛️</span>
                                            <span class="quick-action-label">Govt Schemes</span>
                                        </a>
                                        <a href="${pageContext.request.contextPath}/farmer/learning"
                                            class="quick-action-btn">
                                            <span class="quick-action-icon">🎓</span>
                                            <span class="quick-action-label">Learn Farming</span>
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <!-- Two Column: Market Prices + Schemes -->
                            <div class="grid-2">
                                <!-- Latest Market Prices -->
                                <div class="card">
                                    <div class="card-header">
                                        <span class="card-title">📈 Latest Market Prices</span>
                                        <a href="${pageContext.request.contextPath}/farmer/market-prices"
                                            class="btn btn-secondary btn-sm">View All</a>
                                    </div>
                                    <div class="card-body" style="padding: 0;">
                                        <div class="table-container">
                                            <table>
                                                <thead>
                                                    <tr>
                                                        <th>Crop</th>
                                                        <th>Market</th>
                                                        <th>₹/Quintal</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${recentPrices}" var="price">
                                                        <tr>
                                                            <td><strong>${price.cropName}</strong></td>
                                                            <td style="color:#9ca3af;font-size:12px;">${price.market}
                                                            </td>
                                                            <td><span
                                                                    style="color:#4ade80;font-weight:700;">₹${price.modalPrice}</span>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                    <c:if test="${empty recentPrices}">
                                                        <tr>
                                                            <td colspan="3"
                                                                style="text-align:center;color:#6b7280;padding:20px;">No
                                                                prices available</td>
                                                        </tr>
                                                    </c:if>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>

                                <!-- Active Schemes -->
                                <div class="card">
                                    <div class="card-header">
                                        <span class="card-title">🏛️ Government Schemes</span>
                                        <a href="${pageContext.request.contextPath}/farmer/schemes"
                                            class="btn btn-secondary btn-sm">View All</a>
                                    </div>
                                    <div class="card-body">
                                        <c:if test="${empty recentSchemes}">
                                            <div class="empty-state" style="padding:20px;">
                                                <p>No schemes available</p>
                                            </div>
                                        </c:if>
                                        <c:forEach items="${recentSchemes}" var="scheme">
                                            <div
                                                style="padding: 14px; background: var(--surface); border-radius: 12px; margin-bottom: 12px; border: 1px solid var(--border);">
                                                <div
                                                    style="font-size:14px;font-weight:700;color:#f0fdf4;margin-bottom:4px;">
                                                    ${scheme.title}</div>
                                                <div style="font-size:12px;color:#9ca3af;margin-bottom:8px;">
                                                    <c:choose>
                                                        <c:when test="${fn:length(scheme.description) > 100}">
                                                            ${fn:substring(scheme.description, 0, 100)}...
                                                        </c:when>
                                                        <c:otherwise>
                                                            ${scheme.description}
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                                <span class="badge badge-success">${scheme.category}</span>
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

                    // Dynamic Greeting Logic
                    const hour = new Date().getHours();
                    let greeting = "Good Morning";
                    let icon = "☀️";

                    if (hour >= 12 && hour < 17) {
                        greeting = "Good Afternoon";
                        icon = "🌤️";
                    } else if (hour >= 17) {
                        greeting = "Good Evening";
                        icon = "🌙";
                    }

                    document.getElementById('greetingText').textContent = greeting;
                    document.getElementById('greetingIcon').textContent = icon;

                    function toggleSidebar() { document.getElementById('sidebar').classList.toggle('open'); }
                </script>
            
<script src="${pageContext.request.contextPath}/js/i18n.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>


            </html>
