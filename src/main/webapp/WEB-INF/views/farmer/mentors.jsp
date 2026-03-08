<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>🧑‍🏫 Expert Mentors - AGROPLANTER</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/voice-assistant.css" />
                <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800;900&display=swap"
                    rel="stylesheet">
                <link rel="icon"
                    href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🧑‍🏫</text></svg>" />
                <script>
                    window.AgroplanterUser = "${user.id}";
                    window.AgroplanterUserFull = "${user.fullName}";
                    window.AgroplanterRole = "${user.role}";
                </script>
                <style>
                    .v3-expert-card {
                        background: rgba(15, 23, 42, 0.4);
                        border: 1px solid rgba(255, 255, 255, 0.05);
                        border-radius: 40px;
                        padding: 45px;
                        transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
                        height: 100%;
                        backdrop-filter: blur(30px);
                        position: relative;
                        overflow: hidden;
                    }

                    .v3-expert-card:hover {
                        transform: translateY(-15px) scale(1.02);
                        border-color: rgba(16, 185, 129, 0.3);
                        background: rgba(15, 23, 42, 0.6);
                        box-shadow: 0 30px 60px rgba(0, 0, 0, 0.4);
                    }

                    .v3-avatar-nexus {
                        width: 140px;
                        height: 140px;
                        border-radius: 50%;
                        border: 4px solid #10b981;
                        padding: 6px;
                        background: rgba(2, 6, 23, 0.3);
                        box-shadow: 0 0 40px rgba(16, 185, 129, 0.2);
                        object-fit: cover;
                        transition: 0.4s;
                    }

                    .v3-expert-card:hover .v3-avatar-nexus {
                        transform: rotate(5deg) scale(1.1);
                        border-color: #3b82f6;
                        box-shadow: 0 0 50px rgba(59, 130, 246, 0.3);
                    }

                    .v3-value-matrix {
                        background: rgba(255, 255, 255, 0.02);
                        border: 1px solid rgba(255, 255, 255, 0.05);
                        border-radius: 25px;
                        padding: 25px;
                        margin: 35px 0;
                    }

                    .v3-trust-indicator {
                        position: absolute;
                        top: 35px;
                        right: 35px;
                        background: rgba(16, 185, 129, 0.1);
                        color: #10b981;
                        padding: 8px 18px;
                        border-radius: 50px;
                        font-family: 'Outfit';
                        font-weight: 950;
                        font-size: 8px;
                        letter-spacing: 2px;
                        border: 1px solid rgba(16, 185, 129, 0.1);
                        text-transform: uppercase;
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
                                style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">MARKET
                                OPS</div>
                            <a href="${pageContext.request.contextPath}/farmer/marketplace"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">🛍️</span> Global Market</a>
                            <a href="${pageContext.request.contextPath}/farmer/orders"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">📈</span> Trade Orders</a>
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
                                class="sidebar-nav-item active mb-2"><span class="nav-icon">👨‍🏫</span> Expert
                                Panel</a>

                            <div class="nav-section-title px-2 mt-4 mb-2"
                                style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">
                                PROFESSIONAL</div>
                            <c:choose>
                                <c:when test="${user.role eq 'MENTOR'}">
                                    <a href="${pageContext.request.contextPath}/mentor/dashboard"
                                        class="sidebar-nav-item mb-2" style="color: #fbbf24;"><span
                                            class="nav-icon">🎓</span> Advisor Workspace</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="${pageContext.request.contextPath}/mentor/become"
                                        class="sidebar-nav-item mb-2" style="color: #fbbf24;"><span
                                            class="nav-icon">🌟</span> Become Advisor</a>
                                </c:otherwise>
                            </c:choose>

                            <div class="nav-section-title px-2 mt-4 mb-2"
                                style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">FINANCE
                                & SAFETY</div>
                            <a href="${pageContext.request.contextPath}/farmer/finance"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">💰</span> Capital Hub</a>
                            <a href="${pageContext.request.contextPath}/farmer/safety-hub"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">🛡️</span> Safety HQ</a>

                            <div class="nav-section-title px-2 mt-4 mb-2"
                                style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">ACCOUNT
                                OPS</div>
                            <a href="${pageContext.request.contextPath}/farmer/profile"
                                class="sidebar-nav-item mb-2"><span class="nav-icon" style="color: #8b5cf6;">👤</span>
                                Profile Node</a>
                            <a href="${pageContext.request.contextPath}/chat" class="sidebar-nav-item mb-2"><span
                                    class="nav-icon">💬</span> Message Core</a>

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
                                    <span></span><span></span><span></span>
                                </div>
                                <div class="page-title">
                                    <h1 class="m-0 fw-900 text-white"
                                        style="font-size: 2.2rem; letter-spacing: -1.5px;">Expert Panel</h1>
                                    <span class="v3-page-subtitle text-success uppercase"
                                        style="letter-spacing: 1px; font-weight: 800;">
                                        📡 CONNECTED TO GLOBAL SECTOR EXPERTS | AGRONOMIST NETWORK: SECURED | NODE:
                                        SECURED
                                    </span>
                                </div>
                            </div>
                            <div class="top-nav-right">
                                <a href="${pageContext.request.contextPath}/farmer/consultations"
                                    class="btn btn-quantum px-5 py-3 fw-900 uppercase small">MY SESSIONS →</a>
                            </div>
                        </header>

                        <div class="page-body px-5 py-5">
                            <c:if test="${not empty successMessage}">
                                <div class="alert alert-success border-0 rounded-4 mb-5 text-center fw-950 uppercase small py-4"
                                    style="background: rgba(16, 185, 129, 0.05); color: #10b981; border: 1px solid rgba(16, 185, 129, 0.1); letter-spacing: 2px;">
                                    ✅ ${successMessage}
                                </div>
                            </c:if>

                            <div class="row g-5">
                                <c:forEach var="mentor" items="${mentors}">
                                    <div class="col-xl-4 col-md-6">
                                        <div class="v3-expert-card">
                                            <div class="v3-trust-indicator">VERIFIED</div>
                                            <div class="text-center mb-5">
                                                <div class="position-relative d-inline-block">
                                                    <c:choose>
                                                        <c:when test="${not empty mentor.user.profileImagePath}">
                                                            <img src="${pageContext.request.contextPath}${mentor.user.profileImagePath}"
                                                                class="v3-avatar-nexus" alt="Expert">
                                                        </c:when>
                                                        <c:otherwise>
                                                            <div
                                                                class="v3-avatar-nexus d-flex align-items-center justify-content-center text-white-50 fs-1 fw-950">
                                                                ${fn:substring(mentor.user.fullName, 0, 1)}</div>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <div class="position-absolute bottom-0 end-0 bg-success border border-dark rounded-circle"
                                                        style="width: 30px; height: 30px; box-shadow: 0 0 20px #10b981; border: 4px solid #0f172a;">
                                                    </div>
                                                </div>
                                                <h4 class="text-white fw-900 mt-4 mb-2 fs-3"
                                                    style="letter-spacing: -1px;">${mentor.user.fullName}</h4>
                                                <span
                                                    class="badge bg-success bg-opacity-10 text-success fw-950 px-4 py-2 rounded-pill uppercase"
                                                    style="font-size: 9px; letter-spacing: 2px; border: 1px solid rgba(16, 185, 129, 0.1);">${mentor.expertise}</span>
                                            </div>

                                            <div class="text-white-50 text-center mb-0 lh-lg"
                                                style="height: 72px; overflow: hidden; font-style: italic; opacity: 0.6; font-size: 14px;">
                                                "${mentor.bio}"</div>

                                            <div
                                                class="v3-value-matrix d-flex justify-content-between align-items-center">
                                                <div>
                                                    <span class="trust-label uppercase d-block mb-1"
                                                        style="font-size: 8px; letter-spacing: 1px; color: #475569;">CONSULT
                                                        VALUATION</span>
                                                    <div class="text-white fw-900 fs-4">₹${mentor.consultationFee}<span
                                                            class="text-white-50 x-small fw-600"
                                                            style="font-size: 10px; margin-left: 5px; opacity: 0.5;">/
                                                            SESSION</span></div>
                                                </div>
                                                <div class="text-end">
                                                    <span class="trust-label uppercase d-block mb-1"
                                                        style="font-size: 8px; letter-spacing: 1px; color: #f59e0b;">TRUST
                                                        RATING</span>
                                                    <div class="text-warning fw-950 fs-4">⭐ ${mentor.rating}</div>
                                                </div>
                                            </div>

                                            <form action="${pageContext.request.contextPath}/farmer/mentors/book"
                                                method="POST">
                                                <input type="hidden" name="mentorId" value="${mentor.id}">
                                                <button type="submit"
                                                    class="btn btn-quantum w-100 py-4 fw-900 uppercase">BOOK STRATEGIC
                                                    SESSION →</button>
                                            </form>
                                        </div>
                                    </div>
                                </c:forEach>

                                <c:if test="${empty mentors}">
                                    <div class="col-12 text-center py-5" style="opacity: 0.2;">
                                        <div class="display-1 mb-4">👨‍🏫</div>
                                        <div class="fw-900 uppercase h2" style="letter-spacing: 3px;">EXPERT NETWORK
                                            OFFLINE</div>
                                        <div class="fw-800 uppercase x-small" style="letter-spacing: 1px;">THE GLOBAL
                                            ADVISOR INDEX IS CURRENTLY RECALIBRATING</div>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </main>
                </div>

                <script src="${pageContext.request.contextPath}/js/voice-assistant.js"></script>
                <script src="${pageContext.request.contextPath}/js/background-switcher.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                <script>
                    function toggleSidebar() { document.getElementById('sidebar').classList.toggle('open'); }
                </script>
            </body>

            </html>