<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>🏛️ Institutional Schemes - AGROPLANTER</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/voice-assistant.css" />
                <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800;900&display=swap"
                    rel="stylesheet">
                <link rel="icon"
                    href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🏛️</text></svg>" />
                <script>
                    window.AgroplanterUser = "${user.id}";
                    window.AgroplanterUserFull = "${user.fullName}";
                    window.AgroplanterRole = "${user.role}";
                </script>
                <style>
                    .v3-scanner-terminal {
                        background: rgba(15, 23, 42, 0.4);
                        border: 1px solid rgba(255, 255, 255, 0.05);
                        border-radius: 35px;
                        padding: 45px;
                        margin-bottom: 50px;
                        backdrop-filter: blur(30px);
                    }

                    .v3-terminal-input {
                        background: rgba(255, 255, 255, 0.02) !important;
                        border: 1px solid rgba(255, 255, 255, 0.05) !important;
                        border-radius: 20px !important;
                        color: white !important;
                        padding: 18px 28px !important;
                        font-weight: 600 !important;
                        font-family: 'Outfit';
                        transition: 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
                    }

                    .v3-terminal-input:focus {
                        border-color: #10b981 !important;
                        background: rgba(255, 255, 255, 0.05) !important;
                        box-shadow: 0 0 0 5px rgba(16, 185, 129, 0.1) !important;
                        transform: translateY(-2px);
                    }

                    .v3-scheme-card {
                        background: rgba(15, 23, 42, 0.4);
                        border: 1px solid rgba(255, 255, 255, 0.05);
                        border-radius: 40px;
                        padding: 45px;
                        height: 100%;
                        transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
                        display: flex;
                        flex-direction: column;
                        backdrop-filter: blur(30px);
                        position: relative;
                        overflow: hidden;
                    }

                    .v3-scheme-card::before {
                        content: '';
                        position: absolute;
                        top: 0;
                        left: 0;
                        width: 100%;
                        height: 6px;
                        background: linear-gradient(90deg, transparent, #10b981, transparent);
                        opacity: 0;
                        transition: 0.3s;
                    }

                    .v3-scheme-card:hover {
                        border-color: rgba(16, 185, 129, 0.2);
                        background: rgba(15, 23, 42, 0.6);
                        transform: translateY(-15px) scale(1.02);
                        box-shadow: 0 30px 60px rgba(0, 0, 0, 0.4);
                    }

                    .v3-scheme-card:hover::before {
                        opacity: 1;
                    }

                    .v3-scheme-icon {
                        width: 70px;
                        height: 70px;
                        background: rgba(59, 130, 246, 0.05);
                        border: 1px solid rgba(59, 130, 246, 0.1);
                        border-radius: 20px;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        font-size: 32px;
                        margin-bottom: 30px;
                        transition: 0.3s;
                    }

                    .v3-scheme-card:hover .v3-scheme-icon {
                        transform: scale(1.1) rotate(-10deg);
                        background: rgba(59, 130, 246, 0.1);
                    }

                    .v3-param-matrix {
                        background: rgba(255, 255, 255, 0.02);
                        border: 1px solid rgba(255, 255, 255, 0.05);
                        border-radius: 25px;
                        padding: 25px;
                        margin-top: auto;
                    }

                    .v3-deadline-pills {
                        display: flex;
                        align-items: center;
                        gap: 10px;
                        margin-top: 15px;
                        padding-top: 15px;
                        border-top: 1px solid rgba(59, 130, 246, 0.1);
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
                                class="sidebar-nav-item active mb-2"><span class="nav-icon">🏛️</span> Institutional</a>
                            <a href="${pageContext.request.contextPath}/farmer/learning"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">🎓</span> Agri-Academy</a>
                            <a href="${pageContext.request.contextPath}/farmer/mentors"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">👨‍🏫</span> Expert Panel</a>

                            <div class="nav-section-title px-2 mt-4 mb-2"
                                style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">
                                PROFESSIONAL</div>
                            <c:choose>
                                <c:when test="${user.role == 'MENTOR'}">
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
                                        style="font-size: 2.2rem; letter-spacing: -1.5px;">Institutional Support</h1>
                                    <span class="v3-page-subtitle text-success uppercase"
                                        style="letter-spacing: 1px; font-weight: 800;">
                                        📡 GOVERNMENT SUBSIDY STREAMS | OPPORTUNITIES DETECTED: ${fn:length(schemes)} |
                                        NODE: SECURED
                                    </span>
                                </div>
                            </div>
                        </header>

                        <div class="page-body px-5 py-5">
                            <div class="v3-scanner-terminal">
                                <form action="${pageContext.request.contextPath}/farmer/schemes" method="get">
                                    <div class="row g-4 align-items-center">
                                        <div class="col-lg-9">
                                            <span class="trust-label uppercase mb-3 d-block"
                                                style="font-size: 10px; letter-spacing: 2px; color: #475569;">SUBSIDY
                                                CORE SCANNER</span>
                                            <input type="text" name="search" class="form-control v3-terminal-input"
                                                placeholder="Initialize probe: search by scheme, category, or keyword..."
                                                value="${search}">
                                        </div>
                                        <div class="col-lg-3 mt-lg-auto pt-lg-2">
                                            <button type="submit"
                                                class="btn btn-quantum w-100 py-4 fw-900 uppercase">INITIALIZE SCAN
                                                →</button>
                                        </div>
                                    </div>
                                </form>
                            </div>

                            <div class="row g-5">
                                <c:forEach items="${schemes}" var="scheme">
                                    <div class="col-xl-4 col-md-6">
                                        <div class="v3-scheme-card">
                                            <div class="d-flex justify-content-between align-items-start mb-4">
                                                <div class="v3-scheme-icon">🏛️</div>
                                                <span
                                                    class="badge bg-success bg-opacity-10 text-success fw-950 px-3 py-2 rounded-pill uppercase"
                                                    style="font-size: 9px; letter-spacing: 2px; border: 1px solid rgba(16, 185, 129, 0.1);">${scheme.category}</span>
                                            </div>
                                            <h4 class="fw-900 text-white mb-3 fs-3"
                                                style="min-height: 72px; letter-spacing: -1px; line-height: 1.2;">
                                                ${scheme.title}</h4>
                                            <p class="text-white-50 mb-5 lh-lg"
                                                style="min-height: 84px; font-size: 14px; opacity: 0.6;">
                                                ${scheme.description}</p>

                                            <div class="v3-param-matrix">
                                                <span class="trust-label uppercase d-block mb-2"
                                                    style="font-size: 9px; letter-spacing: 2px; color: #475569;">ELIGIBILITY
                                                    PARAMETERS</span>
                                                <div class="text-white fw-600 fs-6">${scheme.eligibility}</div>

                                                <c:if test="${not empty scheme.lastDate}">
                                                    <div class="v3-deadline-pills">
                                                        <div class="pulse-red" style="width: 8px; height: 8px;"></div>
                                                        <span class="trust-label uppercase m-0"
                                                            style="font-size: 9px; color: #f59e0b; letter-spacing: 1px;">DEADLINE:
                                                            <span class="fw-950">${scheme.lastDate}</span></span>
                                                    </div>
                                                </c:if>
                                            </div>

                                            <div class="mt-5">
                                                <a href="${scheme.applicationLink}" target="_blank"
                                                    class="btn btn-quantum w-100 py-4 fw-900 uppercase">PROCURE SUBSIDY
                                                    →</a>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>

                                <c:if test="${empty schemes}">
                                    <div class="col-12 text-center py-5" style="opacity: 0.2;">
                                        <div class="display-1 mb-4">🏛️</div>
                                        <div class="fw-900 uppercase h2" style="letter-spacing: 3px;">NO STREAMS
                                            DETECTED</div>
                                        <div class="fw-800 uppercase x-small" style="letter-spacing: 1px;">THE
                                            GOVERNMENT SUBSIDY INDEX IS CURRENTLY EMPTY FOR THIS PROBE</div>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </main>
                </div>

                <script src="${pageContext.request.contextPath}/js/background-switcher.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                <script>
                    function toggleSidebar() { document.getElementById('sidebar').classList.toggle('open'); }
                </script>
            </body>

            </html>





