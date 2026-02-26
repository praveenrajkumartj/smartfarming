<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>Market Prices - Smart Farming Platform</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                <link rel="icon" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>📈</text></svg>" />
            </head>

            <body>
                <div class="dashboard-layout">
                    <aside class="sidebar" id="sidebar">
                        <div class="sidebar-brand" style="cursor: pointer;" onclick="window.location.href='${pageContext.request.contextPath}/'">
                            <div class="brand-icon">🌾</div>
                            <div class="brand-text">
                                <h3>Smart Farming</h3><span>Farmer Portal</span>
                            </div>
                        </div>
                        <nav class="sidebar-nav">
                            <div class="nav-section-title">Main Menu</div>
                            <a href="${pageContext.request.contextPath}/farmer/dashboard"><span
                                    class="nav-icon">📊</span> Dashboard</a>
                            <a href="${pageContext.request.contextPath}/farmer/crop-recommendation"><span
                                    class="nav-icon">🌱</span> Crop Recommendation</a>
                            <a href="${pageContext.request.contextPath}/farmer/market-prices" class="active"><span
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
                            <a href="${pageContext.request.contextPath}/logout"><span class="nav-icon">🚪</span> Logout</a>
                        </nav>
                    </aside>

                    <div class="main-content">
                        <header class="top-nav">
                            <div class="top-nav-left">
                                <div class="hamburger" onclick="toggleSidebar()"><span></span><span></span><span></span>
                                </div>
                                <span class="page-title">✨ Real-Time Market Prices</span>
                            </div>
                        </header>

                        <div class="page-body">
                            <!-- Search & Filter -->
                            <div class="card" style="margin-bottom:24px;">
                                <div class="card-body">
                                    <form action="${pageContext.request.contextPath}/farmer/market-prices" method="get">
                                        <div
                                            style="display:grid;grid-template-columns:1fr 1fr auto;gap:16px;align-items:end;">
                                            <div>
                                                <label class="form-label">Search Crop</label>
                                                <input type="text" name="search" class="form-control"
                                                    placeholder="e.g. Rice, Wheat, Tomato..." value="${search}" />
                                            </div>
                                            <div>
                                                <label class="form-label">Filter by State</label>
                                                <select name="state" class="form-control">
                                                    <option value="">All States</option>
                                                    <c:forEach items="${states}" var="s">
                                                        <option value="${s}" ${s==selectedState ? 'selected' : '' }>${s}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <button type="submit" class="btn btn-primary">Search</button>
                                        </div>
                                    </form>
                                </div>
                            </div>

                            <!-- Prices Table -->
                            <div class="card">
                                <div class="card-header">
                                    <span class="card-title">📈 Mandi Prices (₹/Quintal)</span>
                                    <span class="badge badge-success">${fn:length(prices)} records</span>
                                </div>
                                <div class="table-container">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Crop Name</th>
                                                <th>Mandi / Market</th>
                                                <th>State</th>
                                                <th>Min Price</th>
                                                <th>Max Price</th>
                                                <th>Modal Price</th>
                                                <th>Unit</th>
                                                <th>Date</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${prices}" var="price" varStatus="iStat">
                                                <tr>
                                                    <td style="color:#6b7280;font-size:12px;">${iStat.count}</td>
                                                    <td>
                                                        <strong style="color:#22c55e;">${price.cropName}</strong>
                                                    </td>
                                                    <td style="font-size:13px;">${price.market}</td>
                                                    <td>
                                                        <span class="badge badge-info">${price.state}</span>
                                                    </td>
                                                    <td style="color:#fcd34d;">${price.minPrice}</td>
                                                    <td style="color:#fcd34d;">${price.maxPrice}</td>
                                                    <td>
                                                        <strong
                                                            style="color:#4ade80;font-size:15px;">${price.modalPrice}</strong>
                                                    </td>
                                                    <td style="font-size:12px;color:#9ca3af;">${price.unit}</td>
                                                    <td style="font-size:12px;color:#9ca3af;">${price.priceDate}</td>
                                                </tr>
                                            </c:forEach>
                                            <c:if test="${empty prices}">
                                                <tr>
                                                    <td colspan="9"
                                                        style="text-align:center;padding:40px;color:#6b7280;">
                                                        No price data found. Try a different search.
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
