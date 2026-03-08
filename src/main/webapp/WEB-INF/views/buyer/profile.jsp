<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>Buyer Profile Hub - AGROPLANTER V3</title>
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
                        padding: 60px;
                        backdrop-filter: blur(40px);
                        position: relative;
                        overflow: hidden;
                    }

                    .v3-terminal-input {
                        background: rgba(15, 23, 42, 0.6) !important;
                        border: 1px solid rgba(255, 255, 255, 0.05) !important;
                        border-radius: 16px !important;
                        color: #fff !important;
                        padding: 18px 25px !important;
                        font-family: 'Outfit', sans-serif !important;
                        font-weight: 500 !important;
                        transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1) !important;
                    }

                    .v3-terminal-input:focus {
                        background: rgba(15, 23, 42, 0.8) !important;
                        border-color: #10b981 !important;
                        box-shadow: 0 0 25px rgba(16, 185, 129, 0.1) !important;
                        transform: translateY(-2px);
                    }

                    .v3-identity-label {
                        font-size: 10px;
                        font-weight: 950;
                        color: #475569;
                        letter-spacing: 2px;
                        text-transform: uppercase;
                        margin-bottom: 10px;
                        display: block;
                    }

                    .v3-profile-orb {
                        width: 120px;
                        height: 120px;
                        border-radius: 35px;
                        background: linear-gradient(135deg, #10b981, #3b82f6);
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        font-size: 48px;
                        font-weight: 950;
                        color: white;
                        box-shadow: 0 0 40px rgba(16, 185, 129, 0.3);
                        position: relative;
                        overflow: hidden;
                        border: 2px solid rgba(255, 255, 255, 0.1);
                    }

                    .v3-orb-glow {
                        position: absolute;
                        inset: 0;
                        background: radial-gradient(circle at center, rgba(255, 255, 255, 0.2), transparent 70%);
                        animation: v3-orb-pulse 4s infinite ease-in-out;
                    }

                    @keyframes v3-orb-pulse {

                        0%,
                        100% {
                            opacity: 0.5;
                            transform: scale(1);
                        }

                        50% {
                            opacity: 0.8;
                            transform: scale(1.1);
                        }
                    }

                    .v3-subscription-node {
                        background: linear-gradient(135deg, rgba(59, 130, 246, 0.1) 0%, rgba(15, 23, 42, 0.4) 100%);
                        border: 1px solid rgba(59, 130, 246, 0.2);
                        border-radius: 30px;
                        padding: 40px;
                        position: relative;
                        overflow: hidden;
                    }
                </style>
            </head>

            <body style="background: #020617; color: #fff; font-family: 'Outfit', sans-serif;">
                <div class="dashboard-scene"></div>

                <div class="dashboard-layout">
                    <!-- V3 Premium Sidebar -->
                    <aside class="sidebar sidebar-premium" id="sidebar">
                        <div class="sidebar-brand px-4 py-4"
                            style="border-bottom: 1px solid rgba(255,255,255,0.05); cursor: pointer;"
                            onclick="window.location.href='${pageContext.request.contextPath}/'">
                            <div class="brand-premium" style="font-size: 20px;">
                                <div class="brand-icon-box"><i class="fas fa-leaf"></i></div>
                                <div class="brand-text">
                                    <h3 class="brand-premium m-0" style="font-size: 20px;">AGROPLANTER</h3>
                                    <span
                                        style="font-size: 10px; color: #94a3b8; font-weight: 800; letter-spacing: 1px;">BUYER
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
                                class="sidebar-nav-item mb-2"><span class="nav-icon">🏛️</span> Institutional Feed</a>
                            <div class="nav-section-title px-2 mt-4 mb-2"
                                style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">USER
                                IDENTITY</div>
                            <a href="${pageContext.request.contextPath}/buyer/profile"
                                class="sidebar-nav-item active mb-2"><span class="nav-icon">👤</span> Identity
                                Profile</a>
                            <div class="mt-auto px-2"><a href="${pageContext.request.contextPath}/logout"
                                    class="sidebar-nav-item text-danger mt-4" style="border-radius: 12px;"><span
                                        class="nav-icon">🚪</span> Terminate Session</a></div>
                        </nav>
                    </aside>

                    <!-- Main Hub -->
                    <main class="main-content">
                        <header class="top-nav">
                            <div class="top-nav-left d-flex align-items-center gap-3">
                                <div class="hamburger" onclick="toggleSidebar()">
                                    <span></span><span></span><span></span>
                                </div>
                                <div class="page-title">
                                    <h1 class="m-0 fw-950 text-white"
                                        style="font-size: 2.2rem; letter-spacing: -1.5px;">Identity Profile</h1>
                                    <span class="v3-page-subtitle text-success uppercase"
                                        style="letter-spacing: 1px; font-weight: 800;">
                                        👤 SECURE ACCESS | NODE: ${user.fullName.toUpperCase()} | STATUS: ACTIVE
                                    </span>
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
                                                    <i class="fas fa-user-circle"></i>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                        </header>

                        <div class="page-body px-5 py-5">
                            <c:if test="${not empty successMessage}">
                                <div class="alert alert-success border-0 rounded-4 mb-5 text-center fw-900 uppercase"
                                    style="background: rgba(34, 197, 94, 0.1); color: #22c55e; letter-spacing: 1px;">
                                    ${successMessage}
                                </div>
                            </c:if>

                            <!-- Command Center Quick stats -->
                            <div class="row g-4 mb-5">
                                <div class="col-md-4">
                                    <div class="v3-nexus-panel p-4 text-center">
                                        <span class="v3-identity-label">TOTAL ACQUISITIONS</span>
                                        <div class="h2 fw-950 text-white m-0">${myPurchasesCount}</div>
                                        <div class="x-small text-success fw-800 uppercase mt-1">Orders Processed</div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="v3-nexus-panel p-4 text-center">
                                        <span class="v3-identity-label">MARKET REACH</span>
                                        <div class="h2 fw-950 text-info m-0">${availableListings}</div>
                                        <div class="x-small text-info fw-800 uppercase mt-1">Live Inventory Nodes</div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="v3-nexus-panel p-4 text-center">
                                        <span class="v3-identity-label">SECURITY STATUS</span>
                                        <div class="h2 fw-950 text-success m-0">ACTIVE</div>
                                        <div class="x-small text-white-50 fw-800 uppercase mt-1">AES-256 Encrypted</div>
                                    </div>
                                </div>
                            </div>

                            <div class="row g-5">
                                <div class="col-lg-7">
                                    <div class="v3-profile-nexus">
                                        <h3 class="fw-950 text-white mb-5" style="letter-spacing: -1px;">✏️ Edit
                                            Identity Details</h3>

                                        <form action="${pageContext.request.contextPath}/buyer/profile/update"
                                            method="post" enctype="multipart/form-data">
                                            <div class="d-flex align-items-center gap-4 mb-5 p-4 rounded-4"
                                                style="background: rgba(255,255,255,0.02); border: 1px solid rgba(255,255,255,0.05);">
                                                <div class="v3-profile-orb">
                                                    <div class="v3-orb-glow"></div>
                                                    <c:choose>
                                                        <c:when test="${not empty user.profileImagePath}">
                                                            <img src="${pageContext.request.contextPath}${user.profileImagePath}"
                                                                style="width: 100%; height: 100%; object-fit: cover; position: relative; z-index: 1;" />
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span
                                                                style="position: relative; z-index: 1;">${fn:substring(user.fullName,
                                                                0, 1)}</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                                <div class="flex-grow-1">
                                                    <span class="v3-identity-label">BIOMETRIC DATA (OPTIONAL)</span>
                                                    <input type="file" name="profileImage"
                                                        class="form-control v3-terminal-input" accept="image/*" />
                                                    <p class="text-white-50 x-small mt-2 mb-0 fw-600">High-resolution
                                                        square images recommended for optimal rendering.</p>
                                                </div>
                                            </div>

                                            <div class="form-group mb-4">
                                                <span class="v3-identity-label">FULL LEGAL NAME</span>
                                                <input type="text" name="fullName"
                                                    class="form-control v3-terminal-input" value="${user.fullName}"
                                                    required />
                                            </div>

                                            <div class="form-group mb-4 opacity-75">
                                                <span class="v3-identity-label">SECURE EMAIL ADDRESS
                                                    (UNMODIFIABLE)</span>
                                                <input type="email" class="form-control v3-terminal-input"
                                                    value="${user.email}" disabled />
                                            </div>

                                            <div class="form-group mb-4">
                                                <span class="v3-identity-label">COMMUNICATION VECTOR (PHONE)</span>
                                                <input type="text" name="phone" class="form-control v3-terminal-input"
                                                    value="${user.phone}" required />
                                            </div>

                                            <div class="row g-4 mb-5">
                                                <div class="col-md-6">
                                                    <span class="v3-identity-label">GEOGRAPHIC STATE</span>
                                                    <input type="text" name="state"
                                                        class="form-control v3-terminal-input" value="${user.state}" />
                                                </div>
                                                <div class="col-md-6">
                                                    <span class="v3-identity-label">DISTRICT / CITY NODE</span>
                                                    <input type="text" name="district"
                                                        class="form-control v3-terminal-input"
                                                        value="${user.district}" />
                                                </div>
                                            </div>

                                            <div class="text-end">
                                                <button type="submit" class="btn btn-quantum px-5">SYNCHRONIZE
                                                    PROFILE</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>

                                <div class="col-lg-5">
                                    <div class="v3-subscription-node mb-5">
                                        <span class="v3-identity-label text-info">SUBSCRIPTION PROTOCOLS</span>
                                        <h3 class="fw-950 text-white mb-4" style="letter-spacing: -1.5px;">⭐ Active Tier
                                            Plan</h3>

                                        <div class="p-4 rounded-4 mb-4"
                                            style="background: rgba(59, 130, 246, 0.1); border: 1px solid rgba(59, 130, 246, 0.2);">
                                            <div class="d-flex justify-content-between align-items-center">
                                                <div>
                                                    <span class="v3-identity-label opacity-50">CURRENT DEPLOYMENT</span>
                                                    <h4 class="text-info fw-950 m-0">${not empty user.subscriptionPlan ?
                                                        user.subscriptionPlan.toUpperCase() : 'LOCAL BUYER'}</h4>
                                                </div>
                                                <div class="fs-1">💎</div>
                                            </div>
                                        </div>

                                        <div class="d-flex flex-column gap-3">
                                            <a href="${pageContext.request.contextPath}/subscription"
                                                class="btn btn-quantum w-100 text-center justify-content-center">UPGRADE
                                                CAPABILITIES</a>
                                            <c:if test="${user.subscriptionPlan != 'Local Buyer'}">
                                                <form
                                                    action="${pageContext.request.contextPath}/buyer/profile/deactivate-plan"
                                                    method="post"
                                                    onsubmit="event.preventDefault(); showConfirmModal('Terminate Plan', 'This action will revoke premium network access. Proceed?', this)">
                                                    <button type="submit"
                                                        class="btn btn-quantum w-100 text-center justify-content-center"
                                                        style="background: rgba(239, 68, 68, 0.1) !important; border: 1px solid rgba(239, 68, 68, 0.2) !important; color: #ef4444 !important; box-shadow: none !important;">TERMINATE
                                                        SUBSCRIPTION</button>
                                                </form>
                                            </c:if>
                                        </div>
                                    </div>

                                    <div class="v3-nexus-panel p-5">
                                        <h4 class="fw-950 text-white mb-4" style="letter-spacing: -1px;">🔒 Security
                                            Oversight</h4>
                                        <p class="text-white-50 small fw-600 lh-lg mb-0" style="opacity: 0.6;">
                                            Your identity profile is synchronized across the AGROPLANTER Global Network.
                                            All biometric and geographic data is encrypted via end-to-end security
                                            protocols.
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </main>
                </div>

                <!-- V3 Custom Modal -->
                <div id="v3-confirm-nexus" class="modal-nexus"
                    style="display:none; position:fixed; inset:0; background:rgba(2,6,23,0.8); backdrop-filter:blur(20px); z-index:9999; align-items:center; justify-content:center; padding: 20px;">
                    <div class="v3-nexus-panel p-5"
                        style="max-width: 450px; width: 100%; text-align: center; border-color: rgba(245, 158, 11, 0.2);">
                        <div class="fs-1 mb-4" style="filter: drop-shadow(0 0 20px rgba(245, 158, 11, 0.4));">⚠️</div>
                        <h3 id="modalTitle" class="fw-950 text-white mb-3" style="letter-spacing: -1px;">Confirm Action
                        </h3>
                        <p id="modalMsg" class="text-white-50 fw-600 mb-5 lh-base">Are you sure you want to proceed?</p>
                        <div class="d-flex gap-3 justify-content-center">
                            <button class="btn btn-quantum px-4"
                                style="background: rgba(255,255,255,0.05) !important; color: #fff !important; box-shadow: none !important;"
                                onclick="closeModal()">ABORT</button>
                            <button id="confirmBtn" class="btn btn-quantum px-4"
                                style="background: #f59e0b !important;">EXECUTE</button>
                        </div>
                    </div>
                </div>

                <script>
                    function toggleSidebar() { document.getElementById('sidebar').classList.toggle('open'); }

                    let pendingAction = null;
                    function showConfirmModal(title, msg, form) {
                        document.getElementById('modalTitle').innerText = title;
                        document.getElementById('modalMsg').innerText = msg;
                        pendingAction = form;
                        document.getElementById('v3-confirm-nexus').style.display = 'flex';
                    }

                    function closeModal() {
                        document.getElementById('v3-confirm-nexus').style.display = 'none';
                        pendingAction = null;
                    }

                    document.getElementById('confirmBtn').onclick = () => { if (pendingAction) pendingAction.submit(); };
                </script>

                <script src="${pageContext.request.contextPath}/js/voice-assistant.js"></script>
                <script src="${pageContext.request.contextPath}/js/i18n.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
            </body>

            </html>





