<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>⭐ Reviews - AGROPLANTER EXPERT</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800;900&display=swap"
                    rel="stylesheet">
                <link rel="stylesheet"
                    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
                <style>
                    .review-card {
                        background: rgba(15, 23, 42, 0.4);
                        border: 1px solid rgba(255, 255, 255, 0.05);
                        border-radius: 30px;
                        backdrop-filter: blur(20px);
                        transition: all 0.3s ease;
                    }

                    .review-card:hover {
                        border-color: rgba(34, 197, 94, 0.2);
                        transform: translateY(-5px);
                    }

                    .star-rating {
                        color: #fbbf24;
                        font-size: 14px;
                    }

                    .expert-stat-card {
                        background: linear-gradient(135deg, rgba(34, 197, 94, 0.1), rgba(59, 130, 246, 0.1));
                        border-radius: 25px;
                        padding: 30px;
                        border: 1px solid rgba(255, 255, 255, 0.05);
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
                                        style="font-size: 10px; color: #94a3b8; font-weight: 800; letter-spacing: 1px;">EXPERT
                                        NODE V3</span>
                                </div>
                            </div>
                        </div>

                        <nav class="sidebar-nav px-3 py-4">
                            <div class="nav-section-title px-2 mb-2"
                                style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">
                                OPERATIONS</div>
                            <a href="${pageContext.request.contextPath}/clinic/expert/dashboard"
                                class="sidebar-nav-item mb-2">
                                <span class="nav-icon">📊</span> Terminal Home
                            </a>
                            <a href="${pageContext.request.contextPath}/clinic/expert/disease-queries"
                                class="sidebar-nav-item mb-2">
                                <span class="nav-icon">🔬</span> Bio-Queries
                            </a>
                            <a href="${pageContext.request.contextPath}/clinic/expert/reviews"
                                class="sidebar-nav-item active mb-2">
                                <span class="nav-icon">⭐</span> Review Intel
                            </a>
                            <a href="${pageContext.request.contextPath}/clinic/expert/profile"
                                class="sidebar-nav-item mb-2">
                                <span class="nav-icon">👤</span> Node Profile
                            </a>

                            <div class="mt-auto px-2">
                                <a href="${pageContext.request.contextPath}/logout"
                                    class="sidebar-nav-item text-danger mt-4" style="border-radius: 12px;">
                                    <span class="nav-icon">🚪</span> Terminate Session
                                </a>
                            </div>
                        </nav>
                    </aside>

                    <main class="main-content">
                        <header class="top-nav">
                            <div class="top-nav-left d-flex align-items-center gap-3">
                                <div class="hamburger" onclick="toggleSidebar()">
                                    <span></span><span></span><span></span>
                                </div>
                                <div class="page-title">
                                    <h1 class="m-0 fw-950 text-white"
                                        style="font-size: 2.2rem; letter-spacing: -1.5px;">Review
                                        Intel</h1>
                                    <span class="v3-page-subtitle text-success uppercase"
                                        style="letter-spacing: 1px; font-weight: 800;">
                                        🌿 REPUTATION MONITORING | NODE: ${expert.user.fullName.toUpperCase()}
                                    </span>
                                </div>
                            </div>
                        </header>

                        <div class="page-body px-5 py-5">
                            <div class="row g-4 mb-5">
                                <div class="col-md-4">
                                    <div class="expert-stat-card text-center h-100">
                                        <div class="text-white-50 fw-900 uppercase small mb-2"
                                            style="letter-spacing: 2px;">NETWORK
                                            RATING</div>
                                        <div class="display-4 fw-950 text-white mb-2">
                                            <fmt:formatNumber value="${expert.rating}" maxFractionDigits="1" />
                                        </div>
                                        <div class="star-rating mb-0" style="font-size: 20px;">
                                            <c:forEach begin="1" end="5" var="i">
                                                <i class="fa${i <= expert.rating ? 's' : 'r'} fa-star"></i>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="expert-stat-card text-center h-100">
                                        <div class="text-white-50 fw-900 uppercase small mb-2"
                                            style="letter-spacing: 2px;">TOTAL
                                            EVALUATIONS</div>
                                        <div class="display-4 fw-950 text-white mb-2">${fn:length(reviews)}</div>
                                        <div class="text-success fw-800 uppercase x-small">Verified Consultations</div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="expert-stat-card text-center h-100">
                                        <div class="text-white-50 fw-900 uppercase small mb-2"
                                            style="letter-spacing: 2px;">
                                            TRUST STATUS</div>
                                        <div class="display-4 fw-950 text-info mb-2">ELITE</div>
                                        <div class="text-info fw-800 uppercase x-small">Bio-Verified Expert</div>
                                    </div>
                                </div>
                            </div>

                            <div class="row g-4">
                                <c:forEach var="r" items="${reviews}">
                                    <div class="col-md-6 col-lg-4">
                                        <div class="review-card p-4 h-100">
                                            <div class="d-flex justify-content-between align-items-start mb-3">
                                                <div class="d-flex align-items-center gap-3">
                                                    <div
                                                        style="width: 40px; height: 40px; background: rgba(255,255,255,0.05); border-radius: 12px; display: flex; align-items: center; justify-content: center; font-size: 20px;">
                                                        👨‍🌾
                                                    </div>
                                                    <div>
                                                        <div class="text-white fw-900 uppercase x-small"
                                                            style="letter-spacing: 1px;">
                                                            ${r.reviewer.fullName}</div>
                                                        <div class="text-muted fw-800" style="font-size: 10px;">
                                                            ${r.formattedDate}</div>
                                                    </div>
                                                </div>
                                                <div class="star-rating">
                                                    <c:forEach begin="1" end="5" var="i">
                                                        <i class="fa${i <= r.rating ? 's' : 'r'} fa-star"></i>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                            <div class="p-3 rounded-4"
                                                style="background: rgba(15, 23, 42, 0.4); border: 1px solid rgba(255,255,255,0.03);">
                                                <p class="text-white-50 fw-600 mb-0"
                                                    style="font-size: 13px; line-height: 1.6;">
                                                    "${r.feedback}"
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>

                                <c:if test="${empty reviews}">
                                    <div class="col-12 text-center py-5">
                                        <div class="display-3 opacity-10 mb-4">⭐</div>
                                        <div class="text-white-50 fw-950 uppercase h5" style="letter-spacing: 4px;">NO
                                            REVIEW INTEL
                                            DETECTED</div>
                                        <div class="text-muted small fw-800 uppercase mt-3"
                                            style="font-size: 10px; letter-spacing: 2px;">WAITING FOR CLIENT
                                            EVALUATIONS...</div>
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