<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>🎓 Digital Academy - AGROPLANTER</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/voice-assistant.css" />
                <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800;900&display=swap"
                    rel="stylesheet">
                <link rel="icon"
                    href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🎓</text></svg>" />
                <script>
                    window.AgroplanterUser = "${user.id}";
                    window.AgroplanterUserFull = "${user.fullName}";
                    window.AgroplanterRole = "${user.role}";
                </script>
                <style>
                    .v3-training-nexus {
                        background: linear-gradient(135deg, rgba(6, 78, 59, 0.5) 0%, rgba(6, 95, 70, 0.3) 100%);
                        border-radius: 40px;
                        padding: 70px;
                        margin-bottom: 60px;
                        border: 1px solid rgba(16, 185, 129, 0.1);
                        backdrop-filter: blur(30px);
                        position: relative;
                        overflow: hidden;
                    }

                    .v3-training-nexus::after {
                        content: 'ACADEMY';
                        position: absolute;
                        right: -5vw;
                        bottom: -5vw;
                        font-size: 15vw;
                        font-weight: 950;
                        color: white;
                        opacity: 0.02;
                        letter-spacing: -5px;
                        pointer-events: none;
                    }

                    .v3-module-node {
                        background: rgba(15, 23, 42, 0.4);
                        border: 1px solid rgba(255, 255, 255, 0.05);
                        border-radius: 35px;
                        overflow: hidden;
                        transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
                        height: 100%;
                        backdrop-filter: blur(30px);
                    }

                    .v3-module-node:hover {
                        transform: translateY(-15px) scale(1.02);
                        border-color: rgba(16, 185, 129, 0.3);
                        background: rgba(15, 23, 42, 0.6);
                        box-shadow: 0 30px 60px rgba(0, 0, 0, 0.4);
                    }

                    .v3-video-viewport {
                        position: relative;
                        padding-top: 56.25%;
                        background: #000;
                        border-bottom: 1px solid rgba(255, 255, 255, 0.05);
                    }

                    .v3-video-viewport iframe {
                        position: absolute;
                        top: 0;
                        left: 0;
                        width: 100%;
                        height: 100%;
                        border: none;
                    }

                    .v3-intel-pill {
                        padding: 14px 32px;
                        border-radius: 50px;
                        font-size: 10px;
                        font-weight: 900;
                        cursor: pointer;
                        transition: all 0.3s;
                        background: rgba(255, 255, 255, 0.02);
                        border: 1px solid rgba(255, 255, 255, 0.05);
                        color: #64748b;
                        text-transform: uppercase;
                        letter-spacing: 2px;
                    }

                    .v3-intel-pill:hover {
                        background: rgba(255, 255, 255, 0.08);
                        color: white;
                        transform: scale(1.05);
                    }

                    .v3-intel-pill.active {
                        background: #10b981;
                        color: #020617;
                        border-color: #10b981;
                        box-shadow: 0 10px 30px rgba(16, 185, 129, 0.4);
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
                                class="sidebar-nav-item active mb-2"><span class="nav-icon">🎓</span> Agri-Academy</a>
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
                                        style="font-size: 2.2rem; letter-spacing: -1.5px;">Agri-Academy</h1>
                                    <span class="v3-page-subtitle text-success uppercase"
                                        style="letter-spacing: 1px; font-weight: 800;">
                                        📡 HIGH-FIDELITY KNOWLEDGE STREAMS | MODULES PROCESSED: <span
                                            class="fw-900">${fn:length(videos)}</span> | NODE: SECURED
                                    </span>
                                </div>
                            </div>
                            <div class="top-nav-right">
                                <button class="btn btn-quantum px-5 py-3 fw-900 uppercase small"
                                    onclick="showSyncMessage()">MY PROGRESS</button>
                            </div>
                        </header>

                        <div class="page-body px-5 py-5">
                            <div class="v3-training-nexus">
                                <div class="row align-items-center">
                                    <div class="col-xl-9">
                                        <span class="trust-label uppercase mb-3 d-block"
                                            style="font-size: 11px; letter-spacing: 3px; color: rgba(255,255,255,0.6);">KNOWLEDGE
                                            CORE</span>
                                        <h1 class="fw-900 text-white mb-4"
                                            style="font-size: 4rem; letter-spacing: -3px; line-height: 1;">Master
                                            High-Yield Agriculture</h1>
                                        <p class="text-white-50 fs-5 mb-0"
                                            style="max-width: 750px; line-height: 1.8; opacity: 0.7;">
                                            Deploy high-fidelity intelligence streams for precision terminal farming.
                                            Access curated biosynthetic and mechanized modules verified by global
                                            agricultural experts.
                                        </p>
                                    </div>
                                </div>
                            </div>

                            <div class="d-flex gap-3 mb-5 flex-wrap px-1">
                                <div class="v3-intel-pill active" onclick="filterVideos('all', this)">ALL INTEL</div>
                                <div class="v3-intel-pill" onclick="filterVideos('crop', this)">CROP PATHOLOGY</div>
                                <div class="v3-intel-pill" onclick="filterVideos('organic', this)">NEURAL ORGANICS</div>
                                <div class="v3-intel-pill" onclick="filterVideos('machinery', this)">HARDWARE OPS</div>
                                <div class="v3-intel-pill" onclick="filterVideos('disease', this)">BIO-SECURITY</div>
                            </div>

                            <div class="row g-5" id="videoGrid">
                                <c:forEach items="${videos}" var="v">
                                    <div class="col-xl-4 col-md-6 video-item" data-category="${v.category}">
                                        <div class="v3-module-node">
                                            <div class="v3-video-viewport">
                                                <iframe src="${v.videoUrl}" allowfullscreen></iframe>
                                            </div>
                                            <div class="p-5">
                                                <div class="d-flex justify-content-between align-items-start mb-4">
                                                    <span
                                                        class="badge bg-success bg-opacity-10 text-success fw-950 px-3 py-2 rounded-pill uppercase"
                                                        style="font-size: 8px; letter-spacing: 1.5px; border: 1px solid rgba(16, 185, 129, 0.1);">${v.category}</span>
                                                    <div class="d-flex align-items-center gap-2">
                                                        <div class="pulse-green"></div>
                                                        <span class="text-white-50 x-small fw-900 uppercase"
                                                            style="font-size: 7px; letter-spacing: 1px;">VERIFIED
                                                            EXPERT</span>
                                                    </div>
                                                </div>
                                                <h5 class="text-white fw-900 mb-3"
                                                    style="font-size: 20px; line-height: 1.4; height: 56px; overflow: hidden; display: -webkit-box; -webkit-line-clamp: 2; line-clamp: 2; -webkit-box-orient: vertical; letter-spacing: -0.5px;">
                                                    ${v.title}</h5>
                                                <p class="text-white-50 mb-0 lh-lg"
                                                    style="font-size: 14px; height: 84px; overflow: hidden; display: -webkit-box; -webkit-line-clamp: 3; line-clamp: 3; -webkit-box-orient: vertical; opacity: 0.6;">
                                                    ${v.description}</p>
                                                <div class="mt-5 pt-4 d-flex justify-content-between align-items-center"
                                                    style="border-top: 1px solid rgba(255,255,255,0.05);">
                                                    <span class="text-white-50 x-small fw-800 uppercase"
                                                        style="font-size: 8px; letter-spacing: 1.5px;">MODULE:
                                                        LVL-1</span>
                                                    <a href="${v.videoUrl}" target="_blank"
                                                        class="btn btn-quantum px-4 py-2 small fw-900 uppercase text-decoration-none">ACCESS
                                                        MODULE</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                                <c:if test="${empty videos}">
                                    <div class="col-12 text-center py-5" style="opacity: 0.2;">
                                        <div class="display-1 mb-4">📡</div>
                                        <div class="fw-900 uppercase h2" style="letter-spacing: 3px;">KNOWLEDGE STREAM
                                            OFFLINE</div>
                                        <div class="fw-800 uppercase x-small" style="letter-spacing: 1px;">NO LEARNING
                                            MODULES DETECTED IN CURRENT SECTOR</div>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </main>
                </div>

                <script src="${pageContext.request.contextPath}/js/background-switcher.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                <div id="syncToast"
                    style="position: fixed; top: 100px; right: 30px; background: rgba(15, 23, 42, 0.9); border: 1px solid #10b981; border-radius: 20px; padding: 20px 30px; z-index: 9999; display: flex; align-items: center; gap: 15px; opacity: 0; pointer-events: none; transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275); transform: translateX(50px); backdrop-filter: blur(10px); box-shadow: 0 20px 40px rgba(0,0,0,0.5), 0 0 20px rgba(16, 185, 129, 0.2);">
                    <div style="font-size: 24px; color: #10b981;"><i class="fas fa-check-circle"></i></div>
                    <div>
                        <div class="text-success fw-900 uppercase" style="font-size: 13px; letter-spacing: 1px;">
                            PROGRESS SYNCHRONIZATION COMPLETE</div>
                        <div class="text-white-50 fw-600" style="font-size: 11px; margin-top: 4px;">All completed
                            modules authenticated and stored in secure neural link.</div>
                    </div>
                </div>

                <script>
                    function toggleSidebar() { document.getElementById('sidebar').classList.toggle('open'); }
                    function filterVideos(cat, el) {
                        document.querySelectorAll('.v3-intel-pill').forEach(p => p.classList.remove('active'));
                        el.classList.add('active');
                        document.querySelectorAll('.video-item').forEach(card => {
                            if (cat === 'all' || card.dataset.category === cat) { card.style.display = 'block'; }
                            else { card.style.display = 'none'; }
                        });
                    }
                    function showSyncMessage() {
                        const toast = document.getElementById('syncToast');
                        toast.style.opacity = '1';
                        toast.style.transform = 'translateX(0)';
                        toast.style.pointerEvents = 'auto';

                        setTimeout(() => {
                            toast.style.opacity = '0';
                            toast.style.transform = 'translateX(50px)';
                            toast.style.pointerEvents = 'none';
                        }, 4000);
                    }
                </script>
            </body>

            </html>