<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>Crop Recommendation - Smart Farming Platform</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                <link rel="icon" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🌱</text></svg>" />
                <style>
                    .crop-image-container {
                        width: 100%;
                        height: 160px;
                        border-radius: 12px;
                        overflow: hidden;
                        margin-bottom: 15px;
                        background: var(--border);
                    }

                    .crop-image {
                        width: 100%;
                        height: 100%;
                        object-fit: cover;
                        transition: transform 0.3s ease;
                    }

                    .crop-card:hover .crop-image {
                        transform: scale(1.1);
                    }

                    .crop-emoji {
                        font-size: 48px;
                        display: block;
                        margin-bottom: 10px;
                        text-align: center;
                    }
                </style>
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
                            <a href="${pageContext.request.contextPath}/farmer/crop-recommendation" class="active"><span
                                    class="nav-icon">🌱</span> Crop
                                Recommendation</a>
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
                            <a href="${pageContext.request.contextPath}/logout"><span class="nav-icon">🚪</span> Logout</a>
                        </nav>
                    </aside>

                    <div class="main-content">
                        <header class="top-nav">
                            <div class="top-nav-left">
                                <div class="hamburger" onclick="toggleSidebar()"><span></span><span></span><span></span>
                                </div>
                                <span class="page-title">✨ Crop Recommendation</span>
                            </div>
                        </header>

                        <div class="page-body">
                            <!-- Filter Card -->
                            <div class="card" style="margin-bottom: 24px;">
                                <div class="card-header">
                                    <span class="card-title">✨ Find Best Crops for Your Farm</span>
                                </div>
                                <div class="card-body">
                                    <form action="${pageContext.request.contextPath}/farmer/crop-recommendation"
                                        method="get">
                                        <div
                                            style="display:grid;grid-template-columns:1fr 1fr auto;gap:16px;align-items:end;">
                                            <div>
                                                <label class="form-label">Select Season</label>
                                                <select name="season" class="form-control">
                                                    <option value="">All Seasons</option>
                                                    <option value="Kharif" ${selectedSeason=='Kharif' ? 'selected' : ''
                                                        }>Kharif
                                                        (June-November)</option>
                                                    <option value="Rabi" ${selectedSeason=='Rabi' ? 'selected' : '' }>
                                                        Rabi
                                                        (November-April)</option>
                                                    <option value="Annual" ${selectedSeason=='Annual' ? 'selected' : ''
                                                        }>Annual Crops
                                                    </option>
                                                </select>
                                            </div>
                                            <div>
                                                <label class="form-label">Select Soil Type</label>
                                                <select name="soilType" class="form-control">
                                                    <option value="">All Soil Types</option>
                                                    <option value="Clay" ${selectedSoil=='Clay' ? 'selected' : '' }>Clay
                                                        Soil</option>
                                                    <option value="Loamy" ${selectedSoil=='Loamy' ? 'selected' : '' }>
                                                        Loamy Soil
                                                    </option>
                                                    <option value="Sandy" ${selectedSoil=='Sandy' ? 'selected' : '' }>
                                                        Sandy Soil
                                                    </option>
                                                    <option value="Sandy Loam" ${selectedSoil=='Sandy Loam' ? 'selected'
                                                        : '' }>Sandy
                                                        Loam</option>
                                                    <option value="Black" ${selectedSoil=='Black' ? 'selected' : '' }>
                                                        Black Soil
                                                    </option>
                                                    <option value="Clay Loam" ${selectedSoil=='Clay Loam' ? 'selected'
                                                        : '' }>Clay Loam
                                                    </option>
                                                </select>
                                            </div>
                                            <button type="submit" class="btn btn-primary">
                                                ✨ Get Recommendations
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>

                            <!-- Results -->
                            <div class="section-header">
                                <div>
                                    <h2 class="section-title">Recommended Crops</h2>
                                    <p class="section-subtitle">${fn:length(crops)} crops found</p>
                                </div>
                            </div>

                            <c:if test="${empty crops}">
                                <div class="empty-state">
                                    <div class="empty-state-icon">📍</div>
                                    <h3>No crops found for selected filters</h3>
                                    <p>Try selecting different season or soil type</p>
                                </div>
                            </c:if>

                            <div class="crops-grid">
                                <c:forEach items="${crops}" var="crop">
                                    <div class="crop-card fade-in">
                                        <div class="crop-card-header">
                                            <c:if test="${not empty crop.imageUrl}">
                                                <div class="crop-image-container">
                                                    <img src="${crop.imageUrl.startsWith('http') ? crop.imageUrl : pageContext.request.contextPath.concat(crop.imageUrl)}"
                                                        alt="${crop.name}" class="crop-image" />
                                                </div>
                                            </c:if>
                                            <c:if test="${empty crop.imageUrl}">
                                                <span class="crop-emoji">
                                                    <c:choose>
                                                        <c:when test="${crop.name == 'Rice (Paddy)'}"></c:when>
                                                        <c:when test="${crop.name == 'Wheat'}"></c:when>
                                                        <c:when test="${crop.name == 'Maize (Corn)'}"></c:when>
                                                        <c:when test="${crop.name == 'Cotton'}"></c:when>
                                                        <c:when test="${crop.name == 'Sugarcane'}"></c:when>
                                                        <c:when test="${crop.name == 'Soybean'}"></c:when>
                                                        <c:when test="${crop.name == 'Tomato'}"></c:when>
                                                        <c:when test="${crop.name == 'Onion'}"></c:when>
                                                        <c:when test="${crop.name == 'Potato'}"></c:when>
                                                        <c:when test="${crop.name == 'Banana'}"></c:when>
                                                        <c:when test="${crop.name == 'Turmeric'}"></c:when>
                                                        <c:when test="${crop.name == 'Groundnut'}"></c:when>
                                                        <c:when test="${crop.name == 'Mustard'}"></c:when>
                                                        <c:otherwise></c:otherwise>
                                                    </c:choose>
                                                </span>
                                            </c:if>
                                            <div class="crop-name">${crop.name}</div>
                                            <div style="margin-top:6px;">
                                                <span class="badge badge-success">${crop.season}</span>
                                            </div>
                                        </div>
                                        <div class="crop-card-body">
                                            <div class="crop-detail">
                                                <span class="crop-detail-label">Soil</span>
                                                <span class="crop-detail-value">${crop.soilType}</span>
                                            </div>
                                            <div class="crop-detail">
                                                <span class="crop-detail-label">Water</span>
                                                <span class="crop-detail-value">${crop.waterRequirement}</span>
                                            </div>
                                            <div class="crop-detail">
                                                <span class="crop-detail-label">Duration</span>
                                                <span class="crop-detail-value">${crop.growthDuration}</span>
                                            </div>
                                            <div class="crop-detail">
                                                <span class="crop-detail-label">Temp</span>
                                                <span class="crop-detail-value">${crop.minTemperature}°C -
                                                    ${crop.maxTemperature}°C</span>
                                            </div>
                                            <div
                                                style="margin-top:12px;padding-top:12px;border-top:1px solid var(--border);font-size:12px;color:#9ca3af;">
                                                ${crop.description}</div>
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
