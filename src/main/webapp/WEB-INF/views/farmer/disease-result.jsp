<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
            <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8" />
                    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                    <title>🔬 Diagnostic Report - AGROPLANTER</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
                        rel="stylesheet">
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/voice-assistant.css" />
                    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800;900&display=swap"
                        rel="stylesheet">
                    <link rel="icon"
                        href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🔬</text></svg>" />
                    <script>
                        window.AgroplanterUser = "${user.id}";
                        window.AgroplanterUserFull = "${user.fullName}";
                        window.AgroplanterRole = "${user.role}";
                    </script>
                    <style>
                        .v3-diagnostic-hero {
                            background: linear-gradient(135deg, rgba(16, 185, 129, 0.1) 0%, rgba(59, 130, 246, 0.1) 100%);
                            border: 1px solid rgba(255, 255, 255, 0.05);
                            border-radius: 40px;
                            padding: 50px;
                            margin-bottom: 50px;
                            backdrop-filter: blur(30px);
                            display: flex;
                            justify-content: space-between;
                            align-items: center;
                            gap: 40px;
                            position: relative;
                            overflow: hidden;
                        }

                        .v3-diagnostic-hero::before {
                            content: '';
                            position: absolute;
                            top: -50%;
                            left: -50%;
                            width: 200%;
                            height: 200%;
                            background: radial-gradient(circle, rgba(16, 185, 129, 0.05) 0%, transparent 70%);
                            pointer-events: none;
                        }

                        .v3-confidence-nexus {
                            width: 150px;
                            height: 150px;
                            border-radius: 50%;
                            background: rgba(16, 185, 129, 0.02);
                            border: 2px solid rgba(16, 185, 129, 0.3);
                            display: flex;
                            flex-direction: column;
                            align-items: center;
                            justify-content: center;
                            box-shadow: 0 0 40px rgba(16, 185, 129, 0.1);
                            position: relative;
                        }

                        .v3-confidence-nexus .v3-value {
                            font-size: 34px;
                            font-weight: 950;
                            color: #10b981;
                            letter-spacing: -1px;
                        }

                        .v3-confidence-nexus .v3-label {
                            font-size: 8px;
                            font-weight: 900;
                            color: #475569;
                            text-transform: uppercase;
                            letter-spacing: 2px;
                            margin-top: 5px;
                        }

                        .v3-diagnostic-card {
                            background: rgba(15, 23, 42, 0.4);
                            border: 1px solid rgba(255, 255, 255, 0.05);
                            border-radius: 35px;
                            padding: 40px;
                            backdrop-filter: blur(30px);
                            height: 100%;
                        }

                        .v3-treatment-node {
                            background: rgba(255, 255, 255, 0.02);
                            border: 1px solid rgba(255, 255, 255, 0.05);
                            border-radius: 24px;
                            padding: 30px;
                            margin-bottom: 25px;
                            transition: 0.3s;
                        }

                        .v3-treatment-node:hover {
                            border-color: rgba(16, 185, 129, 0.2);
                            background: rgba(16, 185, 129, 0.05);
                        }

                        .v3-node-icon {
                            width: 50px;
                            height: 50px;
                            border-radius: 16px;
                            display: flex;
                            align-items: center;
                            justify-content: center;
                            font-size: 22px;
                            margin-bottom: 20px;
                            background: rgba(255, 255, 255, 0.03);
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
                                    class="sidebar-nav-item active mb-2"><span class="nav-icon">🔬</span>
                                    Bio-Diagnostics</a>
                                <a href="${pageContext.request.contextPath}/clinic/farmer/dashboard"
                                    class="sidebar-nav-item mb-2"><span class="nav-icon">🌿</span> Plant Clinic</a>

                                <div class="nav-section-title px-2 mt-4 mb-2"
                                    style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">
                                    MARKET OPS</div>
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
                                    style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">
                                    FINANCE & SAFETY</div>
                                <a href="${pageContext.request.contextPath}/farmer/finance"
                                    class="sidebar-nav-item mb-2"><span class="nav-icon">💰</span> Capital Hub</a>
                                <a href="${pageContext.request.contextPath}/farmer/safety-hub"
                                    class="sidebar-nav-item mb-2"><span class="nav-icon">🛡️</span> Safety HQ</a>

                                <div class="nav-section-title px-2 mt-4 mb-2"
                                    style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">
                                    ACCOUNT OPS</div>
                                <a href="${pageContext.request.contextPath}/farmer/profile"
                                    class="sidebar-nav-item mb-2"><span class="nav-icon"
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
                                            style="font-size: 2.2rem; letter-spacing: -1.5px;">Diagnostic Report</h1>
                                        <span class="v3-page-subtitle text-success uppercase"
                                            style="letter-spacing: 1px; font-weight: 800;">
                                            📡 COMPREHENSIVE AI & EXPERT BIO-ANALYSIS COMPLETE | CASE ID:
                                            #DIAG-${query.id} | NODE: SECURED
                                        </span>
                                    </div>
                                </div>
                                <div class="top-nav-right">
                                    <a href="${pageContext.request.contextPath}/farmer/disease-detection"
                                        class="btn btn-quantum px-5 py-3 fw-900 uppercase small">BACK TO LIST</a>
                                </div>
                            </header>

                            <div class="page-body px-5 py-5">
                                <div class="v3-diagnostic-hero">
                                    <div class="hero-left">
                                        <div class="badge bg-info bg-opacity-10 text-info fw-950 px-3 py-1 mb-4 rounded-pill uppercase"
                                            style="font-size: 9px; letter-spacing: 2px; border: 1px solid rgba(14, 165, 233, 0.2);">
                                            AI + EXPERT VERIFIED</div>
                                        <h1 class="text-white fw-900 m-0"
                                            style="font-size: 4rem; letter-spacing: -3px; line-height: 1;">
                                            ${query.diseaseName}</h1>
                                        <div class="mt-4 d-flex gap-5">
                                            <div>
                                                <span class="trust-label d-block uppercase mb-1"
                                                    style="font-size: 8px; letter-spacing: 2px;">TARGET CROP</span>
                                                <span class="text-white fw-900 fs-5 uppercase"
                                                    style="letter-spacing: -0.5px;">${query.cropName}</span>
                                            </div>
                                            <div>
                                                <span class="trust-label d-block uppercase mb-1"
                                                    style="font-size: 8px; letter-spacing: 2px;">SEVERITY INDEX</span>
                                                <span class="fw-900 fs-5 uppercase"
                                                    style="letter-spacing: -0.5px; color: ${query.severityLevel == 'CRITICAL' ? '#ef4444' : (query.severityLevel == 'HIGH' ? '#f59e0b' : '#10b981')}">${query.severityLevel}</span>
                                            </div>
                                            <div>
                                                <span class="trust-label d-block uppercase mb-1"
                                                    style="font-size: 8px; letter-spacing: 2px;">ORIGIN LOCATION</span>
                                                <span class="text-white fw-900 fs-5 uppercase text-info"
                                                    style="letter-spacing: -0.5px; color: #3b82f6 !important;">
                                                    ${not empty query.user.district ? query.user.district : 'SECURED'},
                                                    ${not empty query.user.state ? query.user.state : 'NODE'}
                                                </span>
                                            </div>
                                            <div>
                                                <span class="trust-label d-block uppercase mb-1"
                                                    style="font-size: 8px; letter-spacing: 2px;">ANALYSIS STATUS</span>
                                                <span
                                                    class="badge ${query.status == 'DIAGNOSED' || query.status == 'REPORT_READY' ? 'bg-success' : 'bg-warning'} bg-opacity-10 text-${query.status == 'DIAGNOSED' || query.status == 'REPORT_READY' ? 'success' : 'warning'} fw-950 px-3 py-2 rounded-pill uppercase"
                                                    style="font-size: 8px; letter-spacing: 1px; border: 1px solid rgba(255,255,255,0.05);">${query.status}</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="hero-right">
                                        <div class="v3-confidence-nexus">
                                            <span class="v3-value">
                                                <fmt:formatNumber type="number" maxFractionDigits="1"
                                                    value="${query.confidenceScore}" />%
                                            </span>
                                            <span class="v3-label">AI CONFIDENCE</span>
                                        </div>
                                    </div>
                                </div>

                                <div class="row g-5">
                                    <div class="col-lg-6">
                                        <div class="v3-diagnostic-card">
                                            <span class="trust-label uppercase mb-5 d-block"
                                                style="font-size: 10px; letter-spacing: 2px; color: #64748b;">🩺
                                                DIAGNOSIS & OBSERVATIONS</span>
                                            <c:if test="${not empty query.imagePath}">
                                                <div class="rounded-5 overflow-hidden mb-5"
                                                    style="border: 1px solid rgba(255,255,255,0.05); box-shadow: 0 20px 40px rgba(0,0,0,0.3);">
                                                    <img src="${pageContext.request.contextPath}${query.imagePath}"
                                                        alt="Crop Analysis"
                                                        style="width: 100%; height: 350px; object-fit: cover;">
                                                </div>
                                            </c:if>
                                            <div class="p-4 rounded-4 mb-5"
                                                style="background: rgba(255,255,255,0.02); border: 1px solid rgba(255,255,255,0.05);">
                                                <div class="text-white-50 x-small fw-900 uppercase mb-2"
                                                    style="font-size: 8px; letter-spacing: 1px;">NODAL SYMPTOM LOG:
                                                </div>
                                                <p class="text-white italic m-0"
                                                    style="font-size: 15px; font-weight: 500; opacity: 0.8;">
                                                    "${query.symptoms}"</p>
                                            </div>
                                            <div class="text-white-50"
                                                style="line-height: 2; font-size: 15px; font-weight: 400;">
                                                ${query.diagnosis}
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-6">
                                        <div class="v3-diagnostic-card">
                                            <span class="trust-label uppercase mb-5 d-block"
                                                style="font-size: 10px; letter-spacing: 2px; color: #64748b;">📋
                                                RECOMMENDED TREATMENT PROTOCOL</span>

                                            <c:if test="${not empty query.organicTreatment}">
                                                <div class="v3-treatment-node">
                                                    <div class="v3-node-icon text-success"
                                                        style="border-color: rgba(16, 185, 129, 0.2); background: rgba(16, 185, 129, 0.05);">
                                                        🌿</div>
                                                    <h6 class="text-success fw-950 small mb-2 uppercase"
                                                        style="letter-spacing: 1.5px;">ORGANIC REMEDIATION</h6>
                                                    <p class="text-white-50 small m-0" style="line-height: 1.6;">
                                                        ${query.organicTreatment}</p>
                                                </div>
                                            </c:if>

                                            <c:if test="${not empty query.chemicalTreatment}">
                                                <div class="v3-treatment-node">
                                                    <div class="v3-node-icon text-danger"
                                                        style="border-color: rgba(239, 68, 68, 0.2); background: rgba(239, 68, 68, 0.05);">
                                                        🧪</div>
                                                    <h6 class="text-danger fw-950 small mb-2 uppercase"
                                                        style="letter-spacing: 1.5px;">CHEMICAL INTERVENTION</h6>
                                                    <p class="text-white-50 small m-0" style="line-height: 1.6;">
                                                        ${query.chemicalTreatment}</p>
                                                </div>
                                            </c:if>

                                            <c:if test="${not empty query.preventiveMeasures}">
                                                <div class="v3-treatment-node">
                                                    <div class="v3-node-icon text-primary"
                                                        style="border-color: rgba(13, 110, 253, 0.2); background: rgba(13, 110, 253, 0.05);">
                                                        🛡️</div>
                                                    <h6 class="text-primary fw-950 small mb-2 uppercase"
                                                        style="letter-spacing: 1.5px;">PREVENTIVE MEASURES</h6>
                                                    <p class="text-white-50 small m-0" style="line-height: 1.6;">
                                                        ${query.preventiveMeasures}</p>
                                                </div>
                                            </c:if>

                                            <c:if
                                                test="${empty query.organicTreatment && empty query.chemicalTreatment && empty query.preventiveMeasures}">
                                                <div class="h-100 d-flex align-items-center justify-content-center"
                                                    style="opacity: 0.2;">
                                                    <div class="text-center">
                                                        <div class="display-1 mb-4">⏳</div>
                                                        <div class="fw-900 uppercase small"
                                                            style="letter-spacing: 2px;">EXPERTS GENERATING PROTOCOL...
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
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
                    </script>
                </body>

                </html>