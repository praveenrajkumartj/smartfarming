<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>Marketplace - Smart Farming Platform</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                <link rel="icon" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🛍️</text></svg>" />
            </head>

            <body>
                <div class="dashboard-layout">
                    <aside class="sidebar" id="sidebar">
                        <div class="sidebar-brand" style="cursor: pointer;" onclick="window.location.href='${pageContext.request.contextPath}/'">
                            <div class="brand-icon">🌾</div>
                            <div class="brand-text">
                                <h3>Smart Farming</h3><span>Buyer Portal</span>
                            </div>
                        </div>
                        <nav class="sidebar-nav">
                            <div class="nav-section-title">Main Menu</div>
                            <a href="${pageContext.request.contextPath}/buyer/dashboard"><span
                                    class="nav-icon">📊</span> Dashboard</a>
                            <a href="${pageContext.request.contextPath}/buyer/marketplace" class="active"><span
                                    class="nav-icon">✨</span> Browse
                                Marketplace</a>
                            <a href="${pageContext.request.contextPath}/buyer/market-prices"><span
                                    class="nav-icon">📈</span> Market Prices</a>
                            <a href="${pageContext.request.contextPath}/buyer/schemes"><span class="nav-icon">🏛️</span>
                                Govt. Schemes</a>
                            <div class="nav-section-title">Account</div>
                            <a href="${pageContext.request.contextPath}/logout"><span class="nav-icon">🚪</span> Logout</a>
                        </nav>
                    </aside>

                    <div class="main-content">
                        <header class="top-nav">
                            <div class="top-nav-left">
                                <div class="hamburger" onclick="toggleSidebar()"><span></span><span></span><span></span>
                                </div>
                                <span class="page-title">👨‍🌾 Farmer Marketplace</span>
                            </div>
                        </header>

                        <div class="page-body">
                            <!-- Search -->
                            <div class="card" style="margin-bottom:24px;">
                                <div class="card-body">
                                    <form action="${pageContext.request.contextPath}/buyer/marketplace" method="get">
                                        <div style="display:flex;gap:12px;align-items:center;">
                                            <div
                                                style="flex:1;display:flex;align-items:center;gap:12px;background:var(--surface);border:1px solid var(--border);border-radius:50px;padding:8px 16px;">
                                                <span></span>
                                                <input type="text" name="search"
                                                    style="background:none;border:none;color:var(--text-primary);font-size:14px;width:100%;outline:none;"
                                                    placeholder="Search crops (e.g. Wheat, Rice, Tomato)..."
                                                    value="${search}" />
                                            </div>
                                            <button type="submit" class="btn btn-primary">Search</button>
                                            <a href="${pageContext.request.contextPath}/buyer/marketplace"
                                                class="btn btn-secondary">Clear</a>
                                        </div>
                                    </form>
                                </div>
                            </div>

                            <div class="section-header">
                                <div>
                                    <h2 class="section-title">Available Crop Listings</h2>
                                    <p class="section-subtitle">${fn:length(listings)} listings from farmers across
                                        India</p>
                                </div>
                            </div>

                            <c:if test="${empty listings}">
                                <div class="empty-state">
                                    <div class="empty-state-icon">📍</div>
                                    <h3>No listings available</h3>
                                    <p>Farmers haven't posted any listings yet. Check back soon!</p>
                                </div>
                            </c:if>

                            <div class="listings-grid">
                                <c:forEach items="${listings}" var="l">
                                    <div class="listing-card fade-in">
                                        <div style="display:flex;justify-content:space-between;margin-bottom:12px;">
                                            <div class="listing-crop">${l.cropName}</div>
                                            <span class="badge badge-success">Available</span>
                                        </div>

                                        <div class="listing-price">₹${l.pricePerUnit} / ${l.unit}</div>

                                        <div
                                            style="background:var(--surface);border-radius:10px;padding:12px;margin-bottom:12px;">
                                            <div class="listing-detail" style="margin-bottom:6px;">
                                                <span>📦</span>
                                                    <span>${l.quantity} ${l.unit} available</span>
                                            </div>
                                            <div class="listing-detail" style="margin-bottom:6px;">
                                                <span></span>
                                                <span style="color:#fcd34d;font-weight:600;">Total: ₹${l.quantity *
                                                    l.pricePerUnit}</span>
                                            </div>
                                            <div class="listing-detail" style="margin-bottom:6px;">
                                                <span>📍</span>
                                                    <span>${l.location}</span>
                                            </div>
                                            <div class="listing-detail">
                                                <span></span>
                                                <span>${l.farmer.fullName}</span>
                                            </div>
                                        </div>

                                        <c:if test="${not empty l.description}">
                                            <div
                                                style="font-size:12px;color:#9ca3af;margin-bottom:12px;font-style:italic;">
                                                ${l.description}</div>
                                        </c:if>

                                        <a href="${pageContext.request.contextPath}/buyer/contact-farmer/${l.id}"
                                            class="btn btn-primary" style="width:100%;justify-content:center;">
                                            💬 Contact Farmer
                                        </a>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
                <script>function toggleSidebar() { document.getElementById('sidebar').classList.toggle('open'); }</script>
            
<script src="${pageContext.request.contextPath}/js/i18n.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

            </html>
