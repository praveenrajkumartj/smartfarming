<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
            <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Advisor Reviews - AGROPLANTER</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
                        rel="stylesheet">
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
                    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800;900&display=swap"
                        rel="stylesheet">
                    <link rel="stylesheet"
                        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
                    <style>
                        .v3-review-nexus {
                            background: rgba(15, 23, 42, 0.4);
                            border: 1px solid rgba(255, 255, 255, 0.05);
                            border-radius: 40px;
                            padding: 40px;
                            backdrop-filter: blur(40px);
                        }

                        .review-card {
                            background: rgba(255, 255, 255, 0.02);
                            border: 1px solid rgba(255, 255, 255, 0.05);
                            border-radius: 25px;
                            padding: 30px;
                            margin-bottom: 25px;
                            transition: all 0.3s ease;
                        }

                        .review-card:hover {
                            background: rgba(255, 255, 255, 0.04);
                            border-color: rgba(251, 191, 36, 0.2);
                            transform: translateY(-5px);
                        }

                        .star-accent {
                            color: #fbbf24;
                            font-size: 18px;
                            letter-spacing: 2px;
                        }

                        .reviewer-avatar {
                            width: 60px;
                            height: 60px;
                            background: rgba(16, 185, 129, 0.1);
                            border: 2px solid #10b981;
                            border-radius: 18px;
                            display: flex;
                            align-items: center;
                            justify-content: center;
                            font-weight: 950;
                            color: #10b981;
                            font-size: 22px;
                        }
                    </style>
                </head>

                <body style="background: #020617; color: #fff; font-family: 'Outfit', sans-serif;">
                    <div class="dashboard-scene"></div>
                    <div class="dashboard-layout">
                        <aside class="sidebar sidebar-premium">
                            <div class="sidebar-brand px-4 py-4"
                                onclick="window.location.href='${pageContext.request.contextPath}/'">
                                <div class="brand-premium">
                                    <div class="brand-icon-box"><i class="fas fa-leaf"></i></div>
                                    <div class="brand-text">
                                        <h3 class="brand-premium m-0" style="font-size: 20px;">AGROPLANTER</h3>
                                        <span
                                            style="font-size: 10px; color: #fbbf24; font-weight: 800; letter-spacing: 1px;">ADVISOR
                                            NODE V3</span>
                                    </div>
                                </div>
                            </div>
                            <nav class="sidebar-nav px-3 py-4">
                                <div class="nav-section-title px-2 mb-2">STRATEGIC COMMAND</div>
                                <a href="${pageContext.request.contextPath}/mentor/dashboard"
                                    class="sidebar-nav-item mb-2"><span class="nav-icon">📊</span> Advisor Workspace</a>
                                <a href="${pageContext.request.contextPath}/mentor/ledger"
                                    class="sidebar-nav-item mb-2"><span class="nav-icon">📖</span> Advisory Ledger</a>
                                <a href="${pageContext.request.contextPath}/mentor/reviews"
                                    class="sidebar-nav-item active mb-2"><span class="nav-icon">⭐</span> Advisor
                                    Reviews</a>
                                <a href="${pageContext.request.contextPath}/chat" class="sidebar-nav-item mb-2"><span
                                        class="nav-icon">💬</span> Message Core</a>
                                <div class="nav-section-title px-2 mt-4 mb-2">USER IDENTITY</div>
                                <a href="${pageContext.request.contextPath}/mentor/profile"
                                    class="sidebar-nav-item mb-2"><span class="nav-icon">👤</span> Advisor Profile</a>
                                <a href="${pageContext.request.contextPath}/logout"
                                    class="sidebar-nav-item text-danger mt-4"><span class="nav-icon">🚪</span> Terminate
                                    Session</a>
                            </nav>
                        </aside>

                        <main class="main-content">
                            <header class="top-nav">
                                <div class="top-nav-left d-flex align-items-center gap-3">
                                    <div class="page-title">
                                        <h1 class="m-0 fw-950 text-white"
                                            style="font-size: 2.2rem; letter-spacing: -1.5px;">Advisor Reviews</h1>
                                        <span class="v3-page-subtitle text-warning uppercase"
                                            style="letter-spacing: 1px; font-weight: 800;">COMMUNITY FEEDBACK |
                                            TRUST PROTOCOLS</span>
                                    </div>
                                </div>
                            </header>

                            <div class="page-body px-5 py-5">
                                <div class="row g-4 mb-5">
                                    <div class="col-md-4">
                                        <div class="v3-stat-node p-4 rounded-4"
                                            style="background: rgba(251, 191, 36, 0.05); border: 1px solid rgba(251, 191, 36, 0.1);">
                                            <span class="v3-identity-label">GLOBAL TRUST INDEX</span>
                                            <div class="display-5 fw-950 text-warning">${mentor.rating}</div>
                                            <div class="star-accent mt-2">
                                                <c:forEach begin="1" end="5" var="i">
                                                    <i
                                                        class="fas fa-star ${i <= mentor.rating ? '' : 'opacity-25'}"></i>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="v3-nexus-panel d-flex flex-column justify-content-center">
                                            <span class="v3-identity-label">FEEDBACK VOLUME</span>
                                            <div class="display-5 fw-950 text-white">${fn:length(reviews)}</div>
                                            <p class="text-white-50 x-small fw-800 uppercase mt-2">Verified community
                                                evaluations active in network</p>
                                        </div>
                                    </div>
                                </div>

                                <div class="v3-review-nexus">
                                    <h4 class="fw-900 text-white mb-5">Feedback History</h4>

                                    <c:forEach var="r" items="${reviews}">
                                        <div class="review-card">
                                            <div class="d-flex justify-content-between align-items-start mb-4">
                                                <div class="d-flex align-items-center gap-4">
                                                    <div class="reviewer-avatar">
                                                        ${fn:substring(r.reviewer.fullName, 0, 1)}
                                                    </div>
                                                    <div>
                                                        <div class="fw-950 text-white fs-5">${r.reviewer.fullName}</div>
                                                        <div class="text-white-50 x-small fw-800 uppercase"
                                                            style="letter-spacing: 1px;">
                                                            NODE: ${r.reviewer.district}, ${r.reviewer.state}
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="text-end">
                                                    <div class="star-accent">
                                                        <c:forEach begin="1" end="5" var="i">
                                                            <i
                                                                class="fas fa-star ${i <= r.rating ? '' : 'opacity-25'}"></i>
                                                        </c:forEach>
                                                    </div>
                                                    <div class="text-white-50 x-small fw-800 mt-2">
                                                        ${r.formattedDate}
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="v3-review-content x-small text-white-50 fw-600 font-monospace"
                                                style="line-height: 1.8; border-left: 3px solid #fbbf24; padding-left: 20px;">
                                                "${r.feedback}"
                                            </div>
                                        </div>
                                    </c:forEach>

                                    <c:if test="${empty reviews}">
                                        <div class="text-center py-5">
                                            <div class="display-3 opacity-10 mb-4">📡</div>
                                            <div class="text-white fw-950 uppercase"
                                                style="letter-spacing: 4px; opacity: 0.5;">NO FEEDBACK DATA DETECTED
                                            </div>
                                            <p class="text-white-50 x-small fw-800 uppercase mt-3">Community trust
                                                protocols pending first evaluation</p>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </main>
                    </div>
                    <script src="${pageContext.request.contextPath}/js/background-switcher.js"></script>
                </body>

                </html>