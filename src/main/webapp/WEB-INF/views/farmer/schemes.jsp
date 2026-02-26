<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>Government Schemes - Smart Farming Platform</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                <link rel="icon" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🏛️</text></svg>" />
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
                            <a href="${pageContext.request.contextPath}/farmer/market-prices"><span
                                    class="nav-icon">📈</span> Market Prices</a>
                            <a href="${pageContext.request.contextPath}/farmer/disease-detection"><span
                                    class="nav-icon">🔬</span> Disease Detection</a>
                            <a href="${pageContext.request.contextPath}/farmer/marketplace"><span
                                    class="nav-icon">🛒</span> My Marketplace</a>
                            <a href="${pageContext.request.contextPath}/farmer/schemes" class="active"><span
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
                                <span class="page-title">✨ Government Schemes &amp; Subsidies</span>
                            </div>
                        </header>

                        <div class="page-body">
                            <!-- Search -->
                            <div class="card" style="margin-bottom:24px;">
                                <div class="card-body">
                                    <form action="${pageContext.request.contextPath}/farmer/schemes" method="get">
                                        <div style="display:flex;gap:12px;">
                                            <input type="text" name="search" class="form-control"
                                                placeholder="Search schemes by name (e.g. PM-KISAN, PMFBY)..."
                                                value="${search}" style="flex:1;" />
                                            <button type="submit" class="btn btn-primary">Search</button>
                                            <a href="${pageContext.request.contextPath}/farmer/schemes"
                                                class="btn btn-secondary">Clear</a>
                                        </div>
                                    </form>
                                </div>
                            </div>

                            <div class="section-header">
                                <div>
                                    <h2 class="section-title">Available Government Schemes</h2>
                                    <p class="section-subtitle">${fn:length(schemes)} schemes available</p>
                                </div>
                            </div>

                            <c:if test="${empty schemes}">
                                <div class="empty-state">
                                    <div class="empty-state-icon">🛒</div>
                                    <h3>No schemes found</h3>
                                    <p>Try a different search term</p>
                                </div>
                            </c:if>

                            <div class="schemes-grid">
                                <c:forEach items="${schemes}" var="scheme">
                                    <div class="scheme-card fade-in">
                                        <div
                                            style="display:flex;justify-content:space-between;align-items:start;margin-bottom:12px;">
                                            <span class="badge badge-success">${scheme.category}</span>
                                            <span class="badge badge-info">Active</span>
                                        </div>
                                        <h3 class="scheme-title">${scheme.title}</h3>
                                        <p class="scheme-description">${scheme.description}</p>

                                        <div class="scheme-detail">
                                            <span class="scheme-detail-label">Eligible:</span>
                                            <span style="font-size:12px;color:#9ca3af;">${scheme.eligibility}</span>
                                        </div>
                                        <div class="scheme-detail">
                                            <span class="scheme-detail-label">Benefits:</span>
                                            <span style="font-size:12px;color:#9ca3af;">${scheme.benefits}</span>
                                        </div>
                                        <c:if test="${not empty scheme.lastDate}">
                                            <div class="scheme-detail">
                                                <span class="scheme-detail-label">Deadline:</span>
                                                <span style="font-size:12px;color:#fcd34d;">${scheme.lastDate}</span>
                                            </div>
                                        </c:if>

                                        <div style="margin-top:16px;">
                                            <a href="${scheme.applicationLink}" target="_blank"
                                                class="btn btn-primary btn-sm">
                                                👉 Apply Now
                                            </a>
                                        </div>
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
