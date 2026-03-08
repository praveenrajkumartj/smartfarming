<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>🏛️ Institutional Protocols - AGROPLANTER V3</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/voice-assistant.css" />
                <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800;900&display=swap"
                    rel="stylesheet">
                <link rel="icon"
                    href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🏛️</text></svg>" />
                <style>
                    .v3-protocol-nexus {
                        background: rgba(15, 23, 42, 0.4);
                        border: 1px solid rgba(255, 255, 255, 0.05);
                        border-radius: 40px;
                        padding: 40px;
                        backdrop-filter: blur(40px);
                        margin-bottom: 50px;
                    }

                    .v3-terminal-input {
                        background: rgba(15, 23, 42, 0.6) !important;
                        border: 1px solid rgba(255, 255, 255, 0.05) !important;
                        border-radius: 16px !important;
                        color: #fff !important;
                        padding: 15px 25px !important;
                        font-family: 'Outfit' !important;
                    }

                    .v3-scheme-node {
                        background: rgba(15, 23, 42, 0.4);
                        border: 1px solid rgba(255, 255, 255, 0.05);
                        border-radius: 35px;
                        padding: 45px;
                        height: 100%;
                        transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
                        backdrop-filter: blur(30px);
                        display: flex;
                        flex-direction: column;
                        justify-content: space-between;
                        border-left: 3px solid #3b82f6 !important;
                    }

                    .v3-scheme-node:hover {
                        transform: translateY(-12px);
                        border-color: rgba(59, 130, 246, 0.3);
                        background: rgba(15, 23, 42, 0.6);
                        box-shadow: 0 30px 60px rgba(0, 0, 0, 0.4);
                    }

                    .v3-identity-label {
                        font-size: 9px;
                        font-weight: 950;
                        color: #475569;
                        letter-spacing: 2px;
                        text-transform: uppercase;
                        margin-bottom: 10px;
                        display: block;
                    }

                    .v3-category-badge {
                        font-size: 9px;
                        font-weight: 950;
                        text-transform: uppercase;
                        letter-spacing: 1px;
                        padding: 6px 14px;
                        border-radius: 50px;
                        background: rgba(59, 130, 246, 0.1);
                        color: #3b82f6;
                        border: 1px solid rgba(59, 130, 246, 0.2);
                    }
                </style>
            </head>

            <body style="background: #020617; color: #fff; font-family: 'Outfit', sans-serif;">
                <div class="dashboard-scene"></div>
                <div class="dashboard-layout">
                    <!-- Sidebar -->
                    <aside class="sidebar sidebar-premium" id="sidebar">
                        <div class="sidebar-brand px-4 py-4"
                            style="border-bottom: 1px solid rgba(255,255,255,0.05); cursor: pointer;"
                            onclick="window.location.href='${pageContext.request.contextPath}/'">
                            <div class="brand-premium" style="font-size: 20px;">
                                <div class="brand-icon-box"><i class="fas fa-leaf"></i></div>
                                <div class="brand-text">
                                    <h3 class="brand-premium m-0"
                                        style="font-size: 20px; background: linear-gradient(135deg, #3b82f6, #6366f1); -webkit-background-clip: text; background-clip: text; -webkit-text-fill-color: transparent;">
                                        AGROPLANTER</h3>
                                    <span
                                        style="font-size: 10px; color: #3b82f6; font-weight: 800; letter-spacing: 1px;">BUYER
                                        NODE V3</span>
                                </div>
                            </div>
                        </div>
                        <nav class="sidebar-nav px-3 py-4">
                            <div class="nav-section-title px-2 mb-2"
                                style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">
                                PROCUREMENT NODE</div>
                            <a href="${pageContext.request.contextPath}/buyer/dashboard"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">📊</span> Strategic View</a>
                            <a href="${pageContext.request.contextPath}/buyer/marketplace"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">🛒</span> Global Market</a>
                            <c:if test="${user.role == 'B2B_BUYER' || user.role == 'ADMIN'}">
                                <a href="${pageContext.request.contextPath}/b2b/dashboard"
                                    class="sidebar-nav-item mb-2">
                                    <span class="nav-icon">🏬</span> Surplus Hub</a>
                            </c:if>
                            <a href="${pageContext.request.contextPath}/chat" class="sidebar-nav-item mb-2"><span
                                    class="nav-icon">💬</span> Secure Chat</a>
                            <a href="${pageContext.request.contextPath}/buyer/market-prices"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">📈</span> Mandi Intel</a>
                            <a href="${pageContext.request.contextPath}/buyer/orders"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">📦</span> Purchase Ledger</a>
                            <a href="${pageContext.request.contextPath}/buyer/schemes"
                                class="sidebar-nav-item active mb-2"><span class="nav-icon">🏛️</span> Institutional
                                Feed</a>
                            <div class="nav-section-title px-2 mt-4 mb-2"
                                style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">USER
                                IDENTITY</div>
                            <a href="${pageContext.request.contextPath}/buyer/profile"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">👤</span> Identity Profile</a>
                            <div class="mt-auto px-2"><a href="${pageContext.request.contextPath}/logout"
                                    class="sidebar-nav-item text-danger mt-4" style="border-radius: 12px;"><span
                                        class="nav-icon">🚪</span> Terminate Session</a></div>
                        </nav>
                    </aside>

                    <main class="main-content">
                        <header class="top-nav">
                            <div class="top-nav-left d-flex align-items-center gap-3">
                                <div class="hamburger" onclick="toggleSidebar()"><span></span><span></span><span></span>
                                </div>
                                <div class="page-title">
                                    <h1 class="m-0 fw-950 text-white"
                                        style="font-size: 2.2rem; letter-spacing: -1.5px;">Institutional Feed</h1>
                                    <span class="v3-page-subtitle text-info uppercase"
                                        style="letter-spacing: 1px; font-weight: 800;">🏛️ GOVERNMENT FRAMEWORKS |
                                        SUBSIDY PROTOCOLS | PROCUREMENT SCHEMES</span>
                                </div>
                            </div>
                            <div class="top-nav-right">
                                <div class="user-info"
                                    style="gap: 15px; cursor: pointer; display: flex; align-items: center;"
                                    onclick="window.location.href='${pageContext.request.contextPath}/buyer/profile'">
                                    <div class="user-details d-none d-md-flex flex-column text-end">
                                        <span class="user-name text-white fw-800"
                                            style="font-size: 14px; letter-spacing: -0.5px;">${user.fullName}</span>
                                        <span class="user-role uppercase fw-950"
                                            style="font-size: 9px; color: #3b82f6; letter-spacing: 1px;">STRATEGIC
                                            ${user.role}</span>
                                    </div>
                                    <div class="user-avatar"
                                        style="width: 48px; height: 48px; border-radius: 16px; display: flex; align-items: center; justify-content: center; overflow: hidden; border: 1px solid rgba(255,255,255,0.1); box-shadow: 0 10px 20px rgba(59, 130, 246, 0.2);">
                                        <c:choose>
                                            <c:when test="${not empty user.profileImagePath}">
                                                <img src="${pageContext.request.contextPath}${user.profileImagePath}"
                                                    alt="Profile" style="width: 100%; height: 100%; object-fit: cover;">
                                            </c:when>
                                            <c:otherwise>
                                                <div
                                                    style="width: 100%; height: 100%; background: linear-gradient(135deg, #3b82f6, #6366f1); display: flex; align-items: center; justify-content: center; font-weight: 950; font-size: 20px; color: white;">
                                                    ${fn:substring(user.fullName, 0, 1)}
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                        </header>

                        <div class="page-body px-5 py-5">
                            <div class="v3-protocol-nexus">
                                <form action="${pageContext.request.contextPath}/buyer/schemes" method="get">
                                    <div class="d-flex gap-4">
                                        <div class="flex-grow-1">
                                            <span class="v3-identity-label">SEARCH REGISTRY KEYWORDS</span>
                                            <input type="text" name="search" class="form-control v3-terminal-input"
                                                placeholder="Filter by category, benefit, or authority node..."
                                                value="${search}" />
                                        </div>
                                        <div class="d-flex align-items-end gap-3">
                                            <button type="submit" class="btn btn-quantum px-5 py-3"
                                                style="background: #3b82f6 !important;">ANALYZE REGISTRY</button>
                                            <a href="${pageContext.request.contextPath}/buyer/schemes"
                                                class="btn btn-quantum px-4 py-3"
                                                style="background: rgba(255,255,255,0.05) !important; color: #fff !important; box-shadow: none !important;">RESET</a>
                                        </div>
                                    </div>
                                </form>
                            </div>

                            <div class="row g-5">
                                <c:forEach items="${schemes}" var="scheme">
                                    <div class="col-xl-6 col-xxl-4">
                                        <div class="v3-scheme-node">
                                            <div>
                                                <div class="d-flex justify-content-between align-items-center mb-4">
                                                    <span class="v3-category-badge">${scheme.category}</span>
                                                    <span class="text-white-50 x-small fw-950 uppercase"
                                                        style="letter-spacing: 1px;">GOVT_PRIMARY</span>
                                                </div>
                                                <h3 class="fw-950 text-white mb-4"
                                                    style="letter-spacing: -1px; line-height: 1.2;">${scheme.title}</h3>
                                                <p class="text-white-50 small mb-5 fw-600 lh-lg">${scheme.description}
                                                </p>

                                                <div class="mb-4 p-4 rounded-4"
                                                    style="background: rgba(255,255,255,0.02); border: 1px solid rgba(255,255,255,0.05);">
                                                    <span class="v3-identity-label mb-2 opacity-50">ELIGIBILITY
                                                        PROTOCOL</span>
                                                    <div class="text-white fw-700 small">${scheme.eligibility}</div>
                                                </div>
                                                <div class="mb-5 p-4 rounded-4"
                                                    style="background: rgba(59, 130, 246, 0.05); border: 1px solid rgba(59, 130, 246, 0.1);">
                                                    <span class="v3-identity-label mb-2 text-info">BENEFICIAL
                                                        OUTCOME</span>
                                                    <div class="text-white fw-700 small">${scheme.benefits}</div>
                                                </div>
                                            </div>

                                            <div class="mt-auto">
                                                <a href="${scheme.applicationLink}" target="_blank"
                                                    class="btn btn-quantum w-100 py-3"
                                                    style="background: #3b82f6 !important;">ACCESS OFFICIAL PORTAL →</a>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                                <c:if test="${empty schemes}">
                                    <div class="col-12 text-center py-5 opacity-25">
                                        <div class="display-1 mb-4">📂</div>
                                        <h4 class="fw-950 uppercase" style="letter-spacing: 3px;">NO INSTITUTIONAL DATA
                                            POINTS DETECTED</h4>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </main>
                </div>

                <script src="${pageContext.request.contextPath}/js/i18n.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                <script>function toggleSidebar() { document.getElementById('sidebar').classList.toggle('open'); }</script>
            </body>

            </html>




