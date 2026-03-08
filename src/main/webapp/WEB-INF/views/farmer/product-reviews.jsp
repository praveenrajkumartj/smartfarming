<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8" />
                    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                    <title>⭐ Product Intel - AGROPLANTER</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
                        rel="stylesheet">
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/voice-assistant.css" />
                    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800;900&display=swap"
                        rel="stylesheet">
                    <link rel="stylesheet"
                        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
                    <link rel="icon"
                        href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>⭐</text></svg>" />
                    <style>
                        .review-card {
                            background: rgba(15, 23, 42, 0.4);
                            border: 1px solid rgba(255, 255, 255, 0.05);
                            border-radius: 30px;
                            backdrop-filter: blur(20px);
                            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
                            overflow: hidden;
                        }

                        .review-card:hover {
                            transform: translateY(-5px);
                            background: rgba(15, 23, 42, 0.6);
                            border-color: rgba(16, 185, 129, 0.2);
                        }

                        .rating-orbit {
                            width: 120px;
                            height: 120px;
                            border-radius: 50%;
                            background: rgba(16, 185, 129, 0.05);
                            border: 2px solid rgba(16, 185, 129, 0.1);
                            display: flex;
                            flex-direction: column;
                            align-items: center;
                            justify-content: center;
                        }

                        .stat-glow-box {
                            background: rgba(255, 255, 255, 0.02);
                            border: 1px solid rgba(255, 255, 255, 0.05);
                            border-radius: 20px;
                            padding: 20px;
                        }

                        .reviewer-avatar {
                            width: 45px;
                            height: 45px;
                            border-radius: 12px;
                            background: linear-gradient(135deg, #10b981 0%, #06b6d4 100%);
                            display: flex;
                            align-items: center;
                            justify-content: center;
                            font-weight: 900;
                            color: white;
                            font-size: 18px;
                        }

                        .star-active {
                            color: #f59e0b;
                        }

                        .star-inactive {
                            color: rgba(255, 255, 255, 0.1);
                        }
                    </style>
                </head>

                <body>
                    <div class="dashboard-scene"></div>
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
                                            style="font-size: 10px; color: #94a3b8; font-weight: 800; letter-spacing: 1px;">FARMER
                                            NODE V3</span>
                                    </div>
                                </div>
                            </div>
                            <nav class="sidebar-nav px-3 py-4">
                                <div class="nav-section-title px-2 mb-2"
                                    style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">
                                    STRATEGIC CORE</div>
                                <a href="${pageContext.request.contextPath}/farmer/dashboard"
                                    class="sidebar-nav-item mb-2"><span class="nav-icon">📊</span> Command Center</a>
                                <a href="${pageContext.request.contextPath}/farmer/crop-recommendation"
                                    class="sidebar-nav-item mb-2"><span class="nav-icon">🌱</span> Strategic Intel</a>
                                <a href="${pageContext.request.contextPath}/farmer/disease-detection"
                                    class="sidebar-nav-item mb-2"><span class="nav-icon">🔬</span> Bio-Diagnostics</a>
                                <a href="${pageContext.request.contextPath}/clinic/farmer/dashboard"
                                    class="sidebar-nav-item mb-2"><span class="nav-icon">🌿</span> Plant Clinic</a>

                                <div class="nav-section-title px-2 mt-4 mb-2"
                                    style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">
                                    MARKET OPS</div>
                                <a href="${pageContext.request.contextPath}/farmer/marketplace"
                                    class="sidebar-nav-item mb-2"><span class="nav-icon">🛍️</span> Global Market</a>
                                <a href="${pageContext.request.contextPath}/farmer/orders"
                                    class="sidebar-nav-item mb-2"><span class="nav-icon">📈</span> Trade Orders</a>
                                <a href="${pageContext.request.contextPath}/farmer/product-reviews"
                                    class="sidebar-nav-item active mb-2"><span class="nav-icon">⭐</span> Product
                                    Intel</a>
                                <a href="${pageContext.request.contextPath}/farmer/equipment-rental"
                                    class="sidebar-nav-item mb-2"><span class="nav-icon">🚜</span> Agri-Uber</a>

                                <div class="nav-section-title px-2 mt-4 mb-2"
                                    style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">
                                    INTELLIGENCE</div>
                                <a href="${pageContext.request.contextPath}/farmer/weather"
                                    class="sidebar-nav-item mb-2"><span class="nav-icon">⛈️</span> Weather Intel</a>
                                <a href="${pageContext.request.contextPath}/farmer/market-prices"
                                    class="sidebar-nav-item mb-2"><span class="nav-icon">📊</span> Live Mandi</a>
                                <a href="${pageContext.request.contextPath}/farmer/schemes"
                                    class="sidebar-nav-item mb-2"><span class="nav-icon">🏛️</span> Institutional</a>
                                <a href="${pageContext.request.contextPath}/farmer/learning"
                                    class="sidebar-nav-item mb-2"><span class="nav-icon">🎓</span> Agri-Academy</a>
                                <a href="${pageContext.request.contextPath}/farmer/mentors"
                                    class="sidebar-nav-item mb-2"><span class="nav-icon">👨‍🏫</span> Expert Panel</a>

                                <div class="mt-auto px-2">
                                    <a href="${pageContext.request.contextPath}/logout"
                                        class="sidebar-nav-item text-danger mt-4" style="border-radius: 12px;"><span
                                            class="nav-icon">🚪</span> Terminate Session</a>
                                </div>
                            </nav>
                        </aside>

                        <main class="main-content">
                            <header class="top-nav">
                                <div class="top-nav-left d-flex align-items-center gap-3">
                                    <div class="hamburger" onclick="toggleSidebar()">
                                        <span></span><span></span><span></span></div>
                                    <div class="page-title">
                                        <h1 class="m-0 fw-900 text-white"
                                            style="font-size: 2.2rem; letter-spacing: -1.5px;">Product Intel</h1>
                                        <span class="v3-page-subtitle text-success uppercase"
                                            style="letter-spacing: 1px; font-weight: 800;">📡 MARKET FEEDBACK ANALYSIS |
                                            SYSTEM STATUS: OPTIMAL</span>
                                    </div>
                                </div>
                            </header>

                            <div class="page-body px-5 py-5">
                                <!-- Summary Stats -->
                                <div class="row g-4 mb-5">
                                    <div class="col-md-4">
                                        <div class="stat-glow-box d-flex align-items-center gap-4">
                                            <div class="rating-orbit">
                                                <div class="text-white fw-900 fs-1" style="line-height: 1;">
                                                    <fmt:formatNumber value="${averageRating}" maxFractionDigits="1" />
                                                </div>
                                                <div class="text-success x-small fw-950 uppercase mt-1">Global Score
                                                </div>
                                            </div>
                                            <div>
                                                <div class="d-flex mb-1">
                                                    <c:forEach begin="1" end="5" var="i">
                                                        <i
                                                            class="fas fa-star ${i <= averageRating ? 'star-active' : 'star-inactive'} small mx-1"></i>
                                                    </c:forEach>
                                                </div>
                                                <div class="text-white-50 x-small fw-600">Based on ${fn:length(reviews)}
                                                    active data points</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-8">
                                        <div
                                            class="stat-glow-box h-100 d-flex align-items-center justify-content-around">
                                            <div class="text-center">
                                                <div class="text-white fw-900 fs-3">${fn:length(reviews)}</div>
                                                <div class="text-white-50 x-small fw-950 uppercase"
                                                    style="letter-spacing: 1px;">Secure Logs</div>
                                            </div>
                                            <div style="width: 1px; height: 40px; background: rgba(255,255,255,0.05);">
                                            </div>
                                            <div class="text-center">
                                                <div class="text-success fw-900 fs-3">100%</div>
                                                <div class="text-white-50 x-small fw-950 uppercase"
                                                    style="letter-spacing: 1px;">Traceable</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Reviews Feed -->
                                <div class="row g-4">
                                    <c:forEach items="${reviews}" var="r">
                                        <div class="col-md-6 col-lg-4">
                                            <div class="review-card p-4 h-100 d-flex flex-column">
                                                <div class="d-flex justify-content-between align-items-center mb-4">
                                                    <div class="d-flex align-items-center gap-3">
                                                        <div class="reviewer-avatar">
                                                            ${fn:substring(r.reviewer.fullName, 0, 1)}
                                                        </div>
                                                        <div>
                                                            <div class="text-white fw-900" style="font-size: 14px;">
                                                                ${r.reviewer.fullName}</div>
                                                            <div class="text-white-50 x-small fw-600 uppercase"
                                                                style="font-size: 9px;">Verified Buyer</div>
                                                        </div>
                                                    </div>
                                                    <div class="text-white-50 x-small fw-800 uppercase"
                                                        style="font-size: 9px; opacity: 0.5;">
                                                        ${r.formattedDate}
                                                    </div>
                                                </div>

                                                <div class="mb-3">
                                                    <span
                                                        class="badge bg-success bg-opacity-10 text-success x-small fw-950 uppercase border border-success border-opacity-10 px-3 py-1 mb-2">
                                                        ${r.product.cropName}
                                                    </span>
                                                    <div class="d-flex">
                                                        <c:forEach begin="1" end="5" var="i">
                                                            <i
                                                                class="fas fa-star ${i <= r.rating ? 'star-active' : 'star-inactive'} extra-small mx-1"></i>
                                                        </c:forEach>
                                                    </div>
                                                </div>

                                                <div class="text-white-50 x-small lh-lg fw-600 flex-grow-1"
                                                    style="opacity: 0.8; font-style: italic;">
                                                    "${r.comment}"
                                                </div>

                                                <div class="mt-4 pt-3 border-top border-white border-opacity-5">
                                                    <div class="d-flex align-items-center gap-2">
                                                        <div
                                                            style="width: 6px; height: 6px; background: #10b981; border-radius: 50%;">
                                                        </div>
                                                        <div class="text-white-50 x-small fw-900 uppercase"
                                                            style="letter-spacing: 1px; font-size: 9px;">Packet ID:
                                                            #${r.id}</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>

                                    <c:if test="${empty reviews}">
                                        <div class="col-12">
                                            <div class="text-center py-5">
                                                <div class="display-1 opacity-10 mb-4">📉</div>
                                                <div class="text-white-50 fw-950 uppercase"
                                                    style="letter-spacing: 4px; font-size: 14px;">Feedback Archive Empty
                                                </div>
                                                <div class="text-muted small fw-800 uppercase mt-2"
                                                    style="font-size: 9px; letter-spacing: 2px;">Awaiting Buyer
                                                    Transmission</div>
                                            </div>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </main>
                    </div>

                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                    <script>
                        function toggleSidebar() { document.getElementById('sidebar').classList.toggle('open'); }
                    </script>
                </body>

                </html>