<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>⭐ Reviews & Ratings - AGROPLANTER Admin</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/voice-assistant.css" />
                <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800;900&display=swap"
                    rel="stylesheet">
                <link rel="icon"
                    href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>⭐</text></svg>" />
                <style>
                    .v3-review-card {
                        background: rgba(30, 41, 59, 0.4);
                        border-radius: 24px;
                        padding: 24px;
                        border: 1px solid rgba(255, 255, 255, 0.05);
                        margin-bottom: 20px;
                        transition: 0.3s;
                    }

                    .v3-review-card:hover {
                        border-color: rgba(255, 255, 255, 0.1);
                        transform: translateY(-5px);
                    }

                    .star-rating {
                        color: #facc15;
                        font-size: 14px;
                    }

                    .v3-status-pill {
                        padding: 4px 10px;
                        border-radius: 8px;
                        font-size: 8px;
                        font-weight: 900;
                        letter-spacing: 1px;
                        text-transform: uppercase;
                    }

                    .nav-pills-premium {
                        background: rgba(15, 23, 42, 0.4);
                        padding: 8px;
                        border-radius: 20px;
                        border: 1px solid rgba(255, 255, 255, 0.05);
                        display: inline-flex;
                        margin-bottom: 40px;
                    }

                    .nav-link-premium {
                        color: #94a3b8;
                        border-radius: 14px;
                        padding: 10px 24px;
                        font-size: 11px;
                        font-weight: 800;
                        letter-spacing: 1px;
                        text-transform: uppercase;
                        transition: 0.3s;
                    }

                    .nav-link-premium.active {
                        background: #3b82f6 !important;
                        color: #fff !important;
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
                                        style="font-size: 10px; color: #ef4444; font-weight: 800; letter-spacing: 1px;">ROOT
                                        ACCESS V3</span>
                                </div>
                            </div>
                        </div>
                        <nav class="sidebar-nav px-3 py-4">
                            <div class="nav-section-title px-2 mb-2"
                                style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">
                                STRATEGIC CONTROL</div>
                            <a href="${pageContext.request.contextPath}/admin/dashboard"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">🛡️</span> Intelligence</a>
                            <a href="${pageContext.request.contextPath}/admin/users" class="sidebar-nav-item mb-2"><span
                                    class="nav-icon">👥</span> Identity Registry</a>
                            <a href="${pageContext.request.contextPath}/admin/reviews"
                                class="sidebar-nav-item active mb-2"><span class="nav-icon">⭐</span> Review Vault</a>
                            <a href="${pageContext.request.contextPath}/admin/marketplace"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">🛒</span> Market Oversight</a>

                            <div class="nav-section-title px-2 mt-4 mb-2"
                                style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">
                                OVERSIGHT & MONITORING</div>
                            <a href="${pageContext.request.contextPath}/admin/traceability-monitor"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">🛡️</span> Traceability</a>
                            <a href="${pageContext.request.contextPath}/admin/payouts"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">💰</span> Payout Registry</a>

                            <div class="mt-auto px-2">
                                <a href="${pageContext.request.contextPath}/logout"
                                    class="sidebar-nav-item text-danger mt-4"><span class="nav-icon">🚪</span> Terminate
                                    Session</a>
                            </div>
                        </nav>
                    </aside>

                    <main class="main-content">
                        <header class="top-nav">
                            <div class="top-nav-left d-flex align-items-center gap-3">
                                <div class="hamburger" onclick="toggleSidebar()"><span></span><span></span><span></span>
                                </div>
                                <div class="page-title">
                                    <h1 class="m-0 fw-950 text-white"
                                        style="font-size: 2.2rem; letter-spacing: -1.5px;">Review Vault</h1>
                                    <span class="v3-page-subtitle text-warning uppercase"
                                        style="letter-spacing: 1px; font-weight: 800;">⭐ FEEDBACK OVERSIGHT | SENTIMENT
                                        MONITOR | NODE: LIVE</span>
                                </div>
                            </div>
                        </header>

                        <div class="page-body px-5 py-5">
                            <c:if test="${not empty successMessage}">
                                <div class="alert alert-success border-0 bg-success bg-opacity-10 text-success rounded-4 mb-5 p-4 fw-800 uppercase x-small"
                                    style="letter-spacing: 1px;">
                                    ⚡ REGISTRY UPDATE: ${successMessage}
                                </div>
                            </c:if>

                            <ul class="nav nav-pills nav-pills-premium mb-5" id="pills-tab" role="tablist">
                                <li class="nav-item">
                                    <button class="nav-link nav-link-premium active" id="pills-product-tab"
                                        data-bs-toggle="pill" data-bs-target="#pills-product" type="button">Product
                                        Reviews</button>
                                </li>
                                <li class="nav-item">
                                    <button class="nav-link nav-link-premium" id="pills-mentor-tab"
                                        data-bs-toggle="pill" data-bs-target="#pills-mentor" type="button">Mentor
                                        Reviews</button>
                                </li>
                                <li class="nav-item">
                                    <button class="nav-link nav-link-premium" id="pills-expert-tab"
                                        data-bs-toggle="pill" data-bs-target="#pills-expert" type="button">Expert
                                        Reviews</button>
                                </li>
                            </ul>

                            <div class="tab-content" id="pills-tabContent">
                                <!-- Product Reviews -->
                                <div class="tab-pane fade show active" id="pills-product">
                                    <div class="row">
                                        <c:forEach items="${productReviews}" var="r">
                                            <div class="col-md-6">
                                                <div class="v3-review-card">
                                                    <div class="d-flex justify-content-between align-items-start mb-3">
                                                        <div class="d-flex align-items-center gap-3">
                                                            <div class="v3-identity-avatar"
                                                                style="width:40px;height:40px;border-radius:10px;background:linear-gradient(135deg,#3b82f6,#8b5cf6);display:flex;align-items:center;justify-content:center;color:white;font-weight:900;">
                                                                ${fn:substring(r.reviewer.fullName, 0, 1).toUpperCase()}
                                                            </div>
                                                            <div>
                                                                <div class="text-white fw-900 small">
                                                                    ${r.reviewer.fullName}</div>
                                                                <div class="text-white-50 x-small fw-800 uppercase"
                                                                    style="font-size:8px;">on ${r.product.cropName}
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <span
                                                            class="v3-status-pill ${r.status == 'ACTIVE' ? 'bg-success bg-opacity-10 text-success' : 'bg-danger bg-opacity-10 text-danger'}">${r.status}</span>
                                                    </div>
                                                    <div class="star-rating mb-2">
                                                        <c:forEach begin="1" end="${r.rating}">★</c:forEach>
                                                        <c:forEach begin="${r.rating + 1}" end="5">☆</c:forEach>
                                                    </div>
                                                    <p class="text-white-50 small mb-4 italic">"${r.comment}"</p>
                                                    <div class="d-flex gap-2">
                                                        <c:if test="${r.status == 'ACTIVE'}">
                                                            <form
                                                                action="${pageContext.request.contextPath}/admin/reviews/product/hide/${r.id}"
                                                                method="post">
                                                                <button
                                                                    class="btn btn-sm btn-outline-warning rounded-pill px-3 py-1 fw-900 x-small">HIDE</button>
                                                            </form>
                                                        </c:if>
                                                        <c:if test="${r.status == 'HIDDEN'}">
                                                            <form
                                                                action="${pageContext.request.contextPath}/admin/reviews/product/show/${r.id}"
                                                                method="post">
                                                                <button
                                                                    class="btn btn-sm btn-outline-success rounded-pill px-3 py-1 fw-900 x-small">ACTIVATE</button>
                                                            </form>
                                                        </c:if>
                                                        <form
                                                            action="${pageContext.request.contextPath}/admin/reviews/product/delete/${r.id}"
                                                            method="post">
                                                            <button
                                                                class="btn btn-sm btn-outline-danger rounded-pill px-3 py-1 fw-900 x-small"
                                                                onclick="return confirm('Purge this feedback node?')">DELETE</button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>

                                <!-- Mentor Reviews -->
                                <div class="tab-pane fade" id="pills-mentor">
                                    <div class="row">
                                        <c:forEach items="${mentorReviews}" var="r">
                                            <div class="col-md-6">
                                                <div class="v3-review-card">
                                                    <div class="d-flex justify-content-between align-items-start mb-3">
                                                        <div class="d-flex align-items-center gap-3">
                                                            <div class="v3-identity-avatar"
                                                                style="width:40px;height:40px;border-radius:10px;background:linear-gradient(135deg,#ec4899,#8b5cf6);display:flex;align-items:center;justify-content:center;color:white;font-weight:900;">
                                                                ${fn:substring(r.reviewer.fullName, 0, 1).toUpperCase()}
                                                            </div>
                                                            <div>
                                                                <div class="text-white fw-900 small">
                                                                    ${r.reviewer.fullName}</div>
                                                                <div class="text-white-50 x-small fw-800 uppercase"
                                                                    style="font-size:8px;">for Mentor:
                                                                    ${r.mentor.user.fullName}</div>
                                                            </div>
                                                        </div>
                                                        <span
                                                            class="v3-status-pill ${r.status == 'ACTIVE' ? 'bg-success bg-opacity-10 text-success' : 'bg-danger bg-opacity-10 text-danger'}">${r.status}</span>
                                                    </div>
                                                    <div class="star-rating mb-2">
                                                        <c:forEach begin="1" end="${r.rating}">★</c:forEach>
                                                        <c:forEach begin="${r.rating + 1}" end="5">☆</c:forEach>
                                                    </div>
                                                    <p class="text-white-50 small mb-4 italic">"${r.feedback}"</p>
                                                    <div class="d-flex gap-2">
                                                        <c:if test="${r.status == 'ACTIVE'}">
                                                            <form
                                                                action="${pageContext.request.contextPath}/admin/reviews/mentor/hide/${r.id}"
                                                                method="post">
                                                                <button
                                                                    class="btn btn-sm btn-outline-warning rounded-pill px-3 py-1 fw-900 x-small">HIDE</button>
                                                            </form>
                                                        </c:if>
                                                        <c:if test="${r.status == 'HIDDEN'}">
                                                            <form
                                                                action="${pageContext.request.contextPath}/admin/reviews/mentor/show/${r.id}"
                                                                method="post">
                                                                <button
                                                                    class="btn btn-sm btn-outline-success rounded-pill px-3 py-1 fw-900 x-small">ACTIVATE</button>
                                                            </form>
                                                        </c:if>
                                                        <form
                                                            action="${pageContext.request.contextPath}/admin/reviews/mentor/delete/${r.id}"
                                                            method="post">
                                                            <button
                                                                class="btn btn-sm btn-outline-danger rounded-pill px-3 py-1 fw-900 x-small"
                                                                onclick="return confirm('Purge this feedback node?')">DELETE</button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>

                                <!-- Expert Reviews -->
                                <div class="tab-pane fade" id="pills-expert">
                                    <div class="row">
                                        <c:forEach items="${expertReviews}" var="r">
                                            <div class="col-md-6">
                                                <div class="v3-review-card">
                                                    <div class="d-flex justify-content-between align-items-start mb-3">
                                                        <div class="d-flex align-items-center gap-3">
                                                            <div class="v3-identity-avatar"
                                                                style="width:40px;height:40px;border-radius:10px;background:linear-gradient(135deg,#10b981,#3b82f6);display:flex;align-items:center;justify-content:center;color:white;font-weight:900;">
                                                                ${fn:substring(r.reviewer.fullName, 0, 1).toUpperCase()}
                                                            </div>
                                                            <div>
                                                                <div class="text-white fw-900 small">
                                                                    ${r.reviewer.fullName}</div>
                                                                <div class="text-white-50 x-small fw-800 uppercase"
                                                                    style="font-size:8px;">for Expert:
                                                                    ${r.expert.user.fullName}</div>
                                                            </div>
                                                        </div>
                                                        <span
                                                            class="v3-status-pill ${r.status == 'ACTIVE' ? 'bg-success bg-opacity-10 text-success' : 'bg-danger bg-opacity-10 text-danger'}">${r.status}</span>
                                                    </div>
                                                    <div class="star-rating mb-2">
                                                        <c:forEach begin="1" end="${r.rating}">★</c:forEach>
                                                        <c:forEach begin="${r.rating + 1}" end="5">☆</c:forEach>
                                                    </div>
                                                    <p class="text-white-50 small mb-4 italic">"${r.feedback}"</p>
                                                    <div class="d-flex gap-2">
                                                        <c:if test="${r.status == 'ACTIVE'}">
                                                            <form
                                                                action="${pageContext.request.contextPath}/admin/reviews/expert/hide/${r.id}"
                                                                method="post">
                                                                <button
                                                                    class="btn btn-sm btn-outline-warning rounded-pill px-3 py-1 fw-900 x-small">HIDE</button>
                                                            </form>
                                                        </c:if>
                                                        <c:if test="${r.status == 'HIDDEN'}">
                                                            <form
                                                                action="${pageContext.request.contextPath}/admin/reviews/expert/show/${r.id}"
                                                                method="post">
                                                                <button
                                                                    class="btn btn-sm btn-outline-success rounded-pill px-3 py-1 fw-900 x-small">ACTIVATE</button>
                                                            </form>
                                                        </c:if>
                                                        <form
                                                            action="${pageContext.request.contextPath}/admin/reviews/expert/delete/${r.id}"
                                                            method="post">
                                                            <button
                                                                class="btn btn-sm btn-outline-danger rounded-pill px-3 py-1 fw-900 x-small"
                                                                onclick="return confirm('Purge this feedback node?')">DELETE</button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
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