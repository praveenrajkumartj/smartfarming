<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>Learning Videos - Smart Farming Platform</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                <link rel="icon" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🎓</text></svg>" />
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
                            <a href="${pageContext.request.contextPath}/farmer/schemes"><span
                                    class="nav-icon">🏛️</span> Govt. Schemes</a>
                            <a href="${pageContext.request.contextPath}/farmer/learning" class="active"><span
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
                                <span class="page-title">✨ Agriculture Learning Videos</span>
                            </div>
                        </header>

                        <div class="page-body">
                            <div class="section-header" style="margin-bottom:24px;">
                                <div>
                                    <h2 class="section-title">Learn Modern Farming Techniques</h2>
                                    <p class="section-subtitle">Expert-curated videos on crop management, organic
                                        farming, and more
                                    </p>
                                </div>
                            </div>

                            <!-- Category Tabs -->
                            <div style="display:flex;gap:10px;margin-bottom:24px;flex-wrap:wrap;">
                                <button class="btn btn-primary btn-sm" onclick="filterVideos('all')">All Videos</button>
                                <button class="btn btn-secondary btn-sm" onclick="filterVideos('crop')">Crop
                                    Management</button>
                                <button class="btn btn-secondary btn-sm" onclick="filterVideos('organic')">Organic
                                    Farming</button>
                                <button class="btn btn-secondary btn-sm" onclick="filterVideos('machinery')">Farm
                                    Machinery</button>
                                <button class="btn btn-secondary btn-sm" onclick="filterVideos('disease')">Disease
                                    Control</button>
                            </div>

                            <div class="videos-grid">
                                <c:forEach items="${videos}" var="video">
                                    <div class="video-card" data-cat="${video.category}">
                                        <div class="video-thumb">
                                            <iframe src="${video.videoUrl}" title="${video.title}"
                                                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                                                allowfullscreen loading="lazy"></iframe>
                                        </div>
                                        <div class="video-info">
                                            <div class="video-title">${video.title}</div>
                                            <div class="video-desc">${video.description}</div>
                                            <c:choose>
                                                <c:when test="${video.category == 'crop'}">
                                                    <span class="badge badge-success" style="margin-top:8px;">Crop
                                                        Management</span>
                                                </c:when>
                                                <c:when test="${video.category == 'organic'}">
                                                    <span class="badge badge-info" style="margin-top:8px;">Organic
                                                        Farming</span>
                                                </c:when>
                                                <c:when test="${video.category == 'disease'}">
                                                    <span class="badge badge-warning" style="margin-top:8px;">Disease
                                                        Control</span>
                                                </c:when>
                                                <c:when test="${video.category == 'machinery'}">
                                                    <span class="badge badge-purple" style="margin-top:8px;">Farm
                                                        Machinery</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge badge-secondary"
                                                        style="margin-top:8px;">${video.category}</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>

                <script>
                    function toggleSidebar() { document.getElementById('sidebar').classList.toggle('open'); }
                    function filterVideos(cat) {
                        document.querySelectorAll('.video-card').forEach(card => {
                            if (cat === 'all' || card.dataset.cat === cat) {
                                card.style.display = 'block';
                            } else {
                                card.style.display = 'none';
                            }
                        });
                    }
                </script>
            
<script src="${pageContext.request.contextPath}/js/i18n.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

            </html>
