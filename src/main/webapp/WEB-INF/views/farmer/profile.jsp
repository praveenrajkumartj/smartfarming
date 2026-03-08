<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>👤 Profile Terminal - AGROPLANTER</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/voice-assistant.css" />
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
                <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800;900&display=swap"
                    rel="stylesheet">
                <link rel="icon"
                    href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>👤</text></svg>" />
                <script>
                    window.AgroplanterUser = "${user.id}";
                    window.AgroplanterUserFull = "${user.fullName}";
                    window.AgroplanterRole = "${user.role}";
                </script>
                <style>
                    .v3-profile-nexus {
                        background: rgba(15, 23, 42, 0.4);
                        border: 1px solid rgba(255, 255, 255, 0.05);
                        border-radius: 40px;
                        padding: 50px;
                        backdrop-filter: blur(30px);
                        position: relative;
                        overflow: hidden;
                    }

                    .v3-identity-hub {
                        background: linear-gradient(135deg, rgba(255, 255, 255, 0.02) 0%, rgba(255, 255, 255, 0.01) 100%);
                        border: 1px solid rgba(255, 255, 255, 0.05);
                        border-radius: 35px;
                        padding: 45px;
                        margin-bottom: 45px;
                        transition: 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
                    }

                    .v3-identity-hub:hover {
                        border-color: rgba(16, 185, 129, 0.2);
                        background: rgba(16, 185, 129, 0.02);
                        transform: translateY(-5px);
                    }

                    .v3-avatar-nexus-lg {
                        width: 150px;
                        height: 150px;
                        border-radius: 50%;
                        border: 4px solid #10b981;
                        padding: 6px;
                        background: rgba(0, 0, 0, 0.3);
                        position: relative;
                        box-shadow: 0 0 40px rgba(16, 185, 129, 0.2);
                        transition: 0.4s;
                    }

                    .v3-avatar-nexus-lg:hover {
                        transform: scale(1.05) rotate(3deg);
                        box-shadow: 0 0 50px rgba(16, 185, 129, 0.3);
                    }

                    .v3-avatar-nexus-lg img {
                        width: 100%;
                        height: 100%;
                        border-radius: 50%;
                        object-fit: cover;
                    }

                    .v3-upload-trigger {
                        position: absolute;
                        bottom: 8px;
                        right: 8px;
                        background: #10b981;
                        width: 44px;
                        height: 44px;
                        border-radius: 50%;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        cursor: pointer;
                        border: 5px solid #0f172a;
                        color: #020617;
                        transition: 0.3s;
                        font-size: 18px;
                    }

                    .v3-upload-trigger:hover {
                        transform: scale(1.2) rotate(15deg);
                        background: #34d399;
                        box-shadow: 0 0 20px rgba(52, 211, 153, 0.5);
                    }

                    .v3-terminal-input {
                        background: rgba(255, 255, 255, 0.02) !important;
                        border: 1px solid rgba(255, 255, 255, 0.05) !important;
                        border-radius: 16px !important;
                        color: white !important;
                        padding: 16px 24px !important;
                        font-weight: 600 !important;
                        font-family: 'Outfit';
                    }

                    .v3-terminal-input:focus {
                        border-color: #10b981 !important;
                        background: rgba(255, 255, 255, 0.05) !important;
                        box-shadow: 0 0 0 4px rgba(16, 185, 129, 0.1) !important;
                    }

                    .v3-terminal-input:disabled {
                        opacity: 0.3;
                        cursor: not-allowed;
                    }

                    .v3-tier-panel {
                        background: rgba(16, 185, 129, 0.02);
                        border: 1px solid rgba(16, 185, 129, 0.1);
                        border-left: 6px solid #10b981;
                        border-radius: 25px;
                        padding: 35px;
                        margin-top: 40px;
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
                            <a href="${pageContext.request.contextPath}/farmer/product-reviews"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">⭐</span> Product Intel</a>
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
                                class="sidebar-nav-item active mb-2"><span class="nav-icon"
                                    style="color: #8b5cf6;">👤</span> Profile Node</a>
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
                                        style="font-size: 2.2rem; letter-spacing: -1.5px;">Profile Hub</h1>
                                    <span class="v3-page-subtitle text-success uppercase"
                                        style="letter-spacing: 1px; font-weight: 800;">
                                        📡 AUTHORIZED NODE OWNER: #USR-00${user.id} | IDENTITY PROTOCOLS: SECURED |
                                        NODE: SECURED
                                    </span>
                                </div>
                            </div>

                        </header>

                        <div class="page-body px-5 py-5">
                            <c:if test="${not empty successMessage}">
                                <div class="alert alert-success border-0 rounded-4 mb-5 text-center fw-950 uppercase small py-4"
                                    style="background: rgba(16, 185, 129, 0.05); color: #10b981; border: 1px solid rgba(16, 185, 129, 0.1); letter-spacing: 2px;">
                                    ✅ ${successMessage}
                                </div>
                            </c:if>

                            <div class="row g-4 mb-5">
                                <div class="col-md-4">
                                    <div class="v3-nexus-panel p-4 text-center">
                                        <span class="trust-label uppercase d-block mb-1"
                                            style="font-size: 8px; letter-spacing: 2px; color: #475569;">MANAGED
                                            ASSETS</span>
                                        <div class="h2 fw-950 text-white m-0">${totalListings}</div>
                                        <div class="x-small text-success fw-800 uppercase mt-1">Active Listings</div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="v3-nexus-panel p-4 text-center">
                                        <span class="trust-label uppercase d-block mb-1"
                                            style="font-size: 8px; letter-spacing: 2px; color: #475569;">BIO-DIAGNOSTICS</span>
                                        <div class="h2 fw-950 text-info m-0">${diseaseQueries}</div>
                                        <div class="x-small text-info fw-800 uppercase mt-1">Health Scans</div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="v3-nexus-panel p-4 text-center">
                                        <span class="trust-label uppercase d-block mb-1"
                                            style="font-size: 8px; letter-spacing: 2px; color: #475569;">TOTAL
                                            REVENUE</span>
                                        <div class="h2 fw-950 text-success m-0">₹${totalEarnings}</div>
                                        <div class="x-small text-white-50 fw-800 uppercase mt-1">Settled Assets</div>
                                    </div>
                                </div>
                            </div>

                            <div class="row g-5 justify-content-center">
                                <div class="col-xl-10">
                                    <div class="v3-profile-nexus mb-5">
                                        <div class="px-2 mb-5 d-flex justify-content-between align-items-center">
                                            <span class="trust-label uppercase m-0"
                                                style="font-size: 11px; letter-spacing: 3px; color: #10b981;">NODE
                                                IDENTITY ARCHITECTURE</span>
                                            <div class="d-flex align-items-center gap-2">
                                                <div class="pulse-green"></div>
                                                <span class="text-white-50 x-small fw-950 uppercase"
                                                    style="font-size: 8px; letter-spacing: 1.5px;">SYSTEM STATUS:
                                                    NOMINAL</span>
                                            </div>
                                        </div>

                                        <form action="${pageContext.request.contextPath}/farmer/profile/update"
                                            method="post" enctype="multipart/form-data">
                                            <div class="v3-identity-hub d-flex flex-wrap align-items-center gap-5">
                                                <div class="v3-avatar-nexus-lg">
                                                    <c:choose>
                                                        <c:when test="${not empty user.profileImagePath}">
                                                            <img id="profile-preview"
                                                                src="${fn:startsWith(user.profileImagePath, 'http') ? '' : pageContext.request.contextPath}${user.profileImagePath}"
                                                                onerror="this.src='https://ui-avatars.com/api/?name=${fn:replace(not empty user.fullName ? user.fullName : 'User', ' ', '+')}&background=10b981&color=fff';"
                                                                alt="Profile" />
                                                        </c:when>
                                                        <c:otherwise>
                                                            <div
                                                                class="w-100 h-100 d-flex align-items-center justify-content-center fw-950 text-white fs-1 bg-dark bg-opacity-50">
                                                                <i class="fas fa-user-circle"></i>
                                                            </div>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <label for="profileImage" class="v3-upload-trigger">
                                                        <span>📷</span>
                                                    </label>
                                                    <input type="file" id="profileImage" name="profileImage"
                                                        style="display: none;" accept="image/*"
                                                        onchange="previewFile(this)" />
                                                </div>
                                                <div class="flex-grow-1">
                                                    <div class="badge bg-success bg-opacity-10 text-success fw-950 px-3 py-1 mb-3 rounded-pill uppercase"
                                                        style="font-size: 9px; letter-spacing: 2px; border: 1px solid rgba(16, 185, 129, 0.1);">
                                                        MASTER AUTHENTICATED</div>
                                                    <h2 class="text-white fw-900 m-0"
                                                        style="letter-spacing: -2px; font-size: 3rem; line-height: 1;">
                                                        ${user.fullName}</h2>
                                                    <div class="mt-3 d-flex align-items-center gap-4">
                                                        <div class="d-flex align-items-center gap-2">
                                                            <span class="text-white-50 x-small fw-950 uppercase"
                                                                style="font-size: 8px; letter-spacing: 1.5px;">TRUST
                                                                SCORE:</span>
                                                            <span class="text-success fw-950 fs-5">${not empty
                                                                user.trustScore ? user.trustScore : 0}%</span>
                                                        </div>
                                                        <div class="d-flex align-items-center gap-2">
                                                            <span class="text-white-50 x-small fw-950 uppercase"
                                                                style="font-size: 8px; letter-spacing: 1.5px;">NODE
                                                                STATUS:</span>
                                                            <span class="text-info fw-950 fs-5">ACTIVE</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row g-5">
                                                <div class="col-md-12">
                                                    <span class="trust-label uppercase mb-3 d-block"
                                                        style="font-size: 10px; letter-spacing: 2px; color: #475569;">FULL
                                                        LEGAL IDENTITY</span>
                                                    <input type="text" name="fullName"
                                                        class="form-control v3-terminal-input" value="${user.fullName}"
                                                        required />
                                                </div>
                                                <div class="col-md-6">
                                                    <span class="trust-label uppercase mb-3 d-block"
                                                        style="font-size: 10px; letter-spacing: 2px; color: #475569;">DIGITAL
                                                        IDENTIFIER (EMAIL)</span>
                                                    <input type="email" class="form-control v3-terminal-input"
                                                        value="${user.email}" disabled />
                                                </div>
                                                <div class="col-md-6">
                                                    <span class="trust-label uppercase mb-3 d-block"
                                                        style="font-size: 10px; letter-spacing: 2px; color: #475569;">COMMUNICATION
                                                        LINK (PHONE)</span>
                                                    <input type="text" name="phone"
                                                        class="form-control v3-terminal-input" value="${user.phone}"
                                                        required />
                                                </div>
                                                <div class="col-md-6">
                                                    <span class="trust-label uppercase mb-3 d-block"
                                                        style="font-size: 10px; letter-spacing: 2px; color: #475569;">PROVINCIAL
                                                        SECTOR (STATE)</span>
                                                    <input type="text" name="state"
                                                        class="form-control v3-terminal-input" value="${user.state}" />
                                                </div>
                                                <div class="col-md-6">
                                                    <span class="trust-label uppercase mb-3 d-block"
                                                        style="font-size: 10px; letter-spacing: 2px; color: #475569;">DISTRICT
                                                        NODE (MUNICIPALITY)</span>
                                                    <input type="text" name="district"
                                                        class="form-control v3-terminal-input"
                                                        value="${user.district}" />
                                                </div>
                                            </div>

                                            <div class="mt-5 pt-4">
                                                <button type="submit"
                                                    class="btn btn-quantum w-100 py-4 fw-900 uppercase">COMMIT
                                                    ARCHITECTURE UPDATES →</button>
                                            </div>
                                        </form>

                                        <div class="v3-tier-panel">
                                            <div class="row align-items-center">
                                                <div class="col-md-7">
                                                    <span class="trust-label uppercase d-block mb-2"
                                                        style="font-size: 9px; letter-spacing: 2px; color: #10b981;">OPERATIONAL
                                                        TIER CORE</span>
                                                    <h3 class="fw-900 text-white m-0 fs-2"
                                                        style="letter-spacing: -1px;">${not empty user.subscriptionPlan
                                                        ? user.subscriptionPlan : 'BASIC HUB INTERFACE'}</h3>
                                                    <div class="text-white-50 x-small fw-950 uppercase mt-3"
                                                        style="letter-spacing: 1px; font-size: 8px; opacity: 0.5;">
                                                        ✨ PREMIUM NODE FEATURES ACTIVATED | PRIORITY ANALYTICS ENABLED
                                                    </div>
                                                </div>
                                                <div class="col-md-5 mt-4 mt-md-0 d-flex gap-3 justify-content-md-end">
                                                    <c:if
                                                        test="${user.subscriptionPlan != 'Basic Plan' && not empty user.subscriptionPlan}">
                                                        <form
                                                            action="${pageContext.request.contextPath}/farmer/profile/deactivate-plan"
                                                            method="post"
                                                            onsubmit="return confirm('TERMINATE PREMIUM PROTOCOLS?');">
                                                            <button type="submit"
                                                                class="btn btn-outline-danger px-4 py-3 fw-900 uppercase small"
                                                                style="border-radius: 12px; font-size: 9px; letter-spacing: 1px;">TERMINATE
                                                                TIER</button>
                                                        </form>
                                                    </c:if>
                                                    <a href="${pageContext.request.contextPath}/subscription"
                                                        class="btn btn-quantum px-5 py-3 small fw-900 uppercase">UPGRADE
                                                        NODE</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </main>
                </div>

                <script src="${pageContext.request.contextPath}/js/background-switcher.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                <script>
                    function toggleSidebar() { document.getElementById('sidebar').classList.toggle('open'); }
                    function previewFile(input) {
                        if (input.files && input.files[0]) {
                            var reader = new FileReader();
                            reader.onload = function (e) {
                                document.getElementById('profile-preview').src = e.target.result;
                            }
                            reader.readAsDataURL(input.files[0]);
                        }
                    }
                </script>
            </body>

            </html>