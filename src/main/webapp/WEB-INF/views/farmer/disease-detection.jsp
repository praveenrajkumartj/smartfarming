<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>🔬 Bio-Diagnostic Lab - AGROPLANTER</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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
                    .diagnostic-nexus-panel {
                        background: rgba(15, 23, 42, 0.4);
                        border: 1px solid rgba(255, 255, 255, 0.05);
                        border-radius: 35px;
                        padding: 45px;
                        backdrop-filter: blur(30px);
                        position: relative;
                        overflow: hidden;
                    }

                    .v3-upload-zone {
                        border: 2px dashed rgba(16, 185, 129, 0.3);
                        background: rgba(16, 185, 129, 0.03);
                        border-radius: 25px;
                        padding: 60px 40px;
                        text-align: center;
                        cursor: pointer;
                        transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
                    }

                    .v3-upload-zone:hover {
                        background: rgba(16, 185, 129, 0.08);
                        border-color: #10b981;
                        transform: scale(1.02);
                        box-shadow: 0 15px 30px rgba(16, 185, 129, 0.1);
                    }

                    .v3-terminal-input {
                        background: rgba(255, 255, 255, 0.02) !important;
                        border: 1px solid rgba(255, 255, 255, 0.05) !important;
                        border-radius: 14px !important;
                        color: white !important;
                        padding: 16px 22px !important;
                        font-weight: 600 !important;
                        font-family: 'Outfit';
                        transition: 0.3s;
                    }

                    .v3-terminal-input:focus {
                        border-color: #10b981 !important;
                        background: rgba(255, 255, 255, 0.04) !important;
                        box-shadow: 0 0 0 4px rgba(16, 185, 129, 0.1) !important;
                        outline: none;
                    }

                    .bio-capability-node {
                        background: rgba(255, 255, 255, 0.02);
                        border: 1px solid rgba(255, 255, 255, 0.05);
                        border-radius: 20px;
                        padding: 25px;
                        margin-bottom: 20px;
                        transition: all 0.3s ease;
                    }

                    .bio-capability-node:hover {
                        background: rgba(255, 255, 255, 0.04);
                        border-color: rgba(16, 185, 129, 0.2);
                        transform: translateX(8px);
                    }

                    .nexus-mic-btn {
                        background: rgba(16, 185, 129, 0.1);
                        border: 1px solid rgba(16, 185, 129, 0.2);
                        color: #10b981;
                        border-radius: 12px;
                        padding: 0 20px;
                        transition: 0.3s;
                    }

                    .nexus-mic-btn:hover {
                        background: #10b981;
                        color: #020617;
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
                                        style="font-size: 2.2rem; letter-spacing: -1.5px;">Bio-Diagnostic Lab</h1>
                                    <span class="v3-page-subtitle text-success uppercase"
                                        style="letter-spacing: 1px; font-weight: 800;">
                                        📡 SCAN ACTIVE | BIOSYSTEMS ANALYSIS: ENGAGED | RECOGNITION CONFIDENCE: 98%
                                    </span>
                                </div>
                            </div>
                        </header>

                        <div class="page-body px-5 py-5">
                            <c:if test="${not empty successMessage}">
                                <div class="alert alert-success border-0 rounded-4 mb-5 text-center fw-900 uppercase small"
                                    style="background: rgba(16, 185, 129, 0.1); color: #10b981; border: 1px solid rgba(16, 185, 129, 0.2); letter-spacing: 1px;">
                                    ✅ ${successMessage}
                                </div>
                            </c:if>

                            <div class="row g-5">
                                <div class="col-xl-8">
                                    <div class="diagnostic-nexus-panel">
                                        <span class="trust-label uppercase mb-4 d-block"
                                            style="font-size: 10px; letter-spacing: 2px;">BIOLOGICAL SPECIMEN
                                            INTAKE</span>
                                        <form
                                            action="${pageContext.request.contextPath}/farmer/disease-detection/submit"
                                            method="post" enctype="multipart/form-data">
                                            <div class="mb-5">
                                                <span class="trust-label uppercase mb-2 d-block"
                                                    style="font-size: 8px;">CROP TAXONOMY (SPECIMEN NAME)</span>
                                                <div class="input-group">
                                                    <input type="text" name="cropName" id="cropName"
                                                        class="form-control v3-terminal-input"
                                                        placeholder="e.g. Rice, Wheat, Tomato..." required />
                                                    <button type="button" class="nexus-mic-btn"
                                                        onclick="agriVoice.startListeningFor('cropName')">🎤</button>
                                                </div>
                                            </div>

                                            <div class="mb-5">
                                                <span class="trust-label uppercase mb-2 d-block"
                                                    style="font-size: 8px;">PATHOGEN OBSERVATIONS (SYMPTOMS)</span>
                                                <div class="position-relative">
                                                    <textarea name="symptoms" id="symptomsInput"
                                                        class="form-control v3-terminal-input" rows="5"
                                                        placeholder="Document morphological anomalies, foliar corruption, or structural decay..."
                                                        required></textarea>
                                                    <button type="button"
                                                        class="btn btn-quantum rounded-circle position-absolute bottom-0 end-0 m-3 p-0"
                                                        onclick="agriVoice.startListeningFor('symptomsInput')"
                                                        style="width: 45px; height: 45px; display: flex; align-items: center; justify-content: center;">🎤</button>
                                                </div>
                                            </div>

                                            <div class="mb-5">
                                                <span class="trust-label uppercase mb-2 d-block"
                                                    style="font-size: 8px;">PIXEL TELEMETRY (VISUAL DATA)</span>
                                                <div class="v3-upload-zone"
                                                    onclick="document.getElementById('imageFile').click()">
                                                    <div class="display-3 mb-2">📸</div>
                                                    <h5 class="text-white fw-900">INITIALIZE MACRO-SCAN</h5>
                                                    <p class="text-white-50 small fw-800 uppercase mt-2">JPEG/PNG
                                                        OPTIMAL | 4K TELEMETRY ENCRYPTION ACTIVE</p>
                                                    <div id="fileName"
                                                        class="text-success fw-900 mt-3 x-small uppercase"></div>
                                                </div>
                                                <input type="file" id="imageFile" name="image" accept="image/*"
                                                    style="display:none;"
                                                    onchange="document.getElementById('fileName').innerText = '✓ TELEMETRY LOADED: ' + this.files[0].name.toUpperCase()" />
                                            </div>

                                            <div class="mb-5 p-4 rounded-4"
                                                style="background: rgba(251, 191, 36, 0.03); border: 1px solid rgba(251, 191, 36, 0.1);">
                                                <span class="trust-label uppercase mb-2 d-block"
                                                    style="font-size: 8px; color: #fbbf24;">EXPERT OVERRIDE
                                                    PROTOCOL</span>
                                                <select name="expertId" class="form-select v3-terminal-input"
                                                    style="border-color: rgba(251, 191, 36, 0.2) !important;">
                                                    <option value="">-- NEURAL NETWORK DIAGNOSTIC (DEFAULT) --</option>
                                                    <c:forEach items="${experts}" var="e">
                                                        <option value="${e.id}">DR. ${e.user.fullName} |
                                                            ${e.specialization} HUB [FEE: ₹${e.consultationFee}]
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </div>

                                            <button type="submit" class="btn btn-quantum w-100 py-4 fw-900">RUN
                                                BIOLOGICAL DIAGNOSTIC CYCLE →</button>
                                        </form>
                                    </div>
                                </div>

                                <div class="col-xl-4">
                                    <div class="diagnostic-nexus-panel" style="border-color: rgba(139, 92, 246, 0.2);">
                                        <span class="trust-label uppercase mb-4 d-block"
                                            style="color: #8b5cf6; font-size: 10px; letter-spacing: 2px;">RECOGNITION
                                            MATRIX</span>

                                        <div class="bio-capability-node">
                                            <div class="d-flex align-items-center gap-3 mb-3">
                                                <div
                                                    style="width: 12px; height: 12px; background: #fbbf24; border-radius: 50%; box-shadow: 0 0 10px #fbbf24;">
                                                </div>
                                                <h6 class="text-white fw-900 m-0 uppercase" style="font-size: 13px;">
                                                    CHLOROSIS DECODER</h6>
                                            </div>
                                            <p class="text-white-50 x-small fw-600 m-0 lh-base">Scans for nitrogen-link
                                                pigment corruption and viral foliar decay patterns.</p>
                                        </div>

                                        <div class="bio-capability-node">
                                            <div class="d-flex align-items-center gap-3 mb-3">
                                                <div
                                                    style="width: 12px; height: 12px; background: #ef4444; border-radius: 50%; box-shadow: 0 0 10px #ef4444;">
                                                </div>
                                                <h6 class="text-white fw-900 m-0 uppercase" style="font-size: 13px;">
                                                    NECROTIC SIGNATURES</h6>
                                            </div>
                                            <p class="text-white-50 x-small fw-600 m-0 lh-base">Analyzes cellular death
                                                telemetry linked to fungal blights and bacterial pathogens.</p>
                                        </div>

                                        <div class="bio-capability-node">
                                            <div class="d-flex align-items-center gap-3 mb-3">
                                                <div
                                                    style="width: 12px; height: 12px; background: #3b82f6; border-radius: 50%; box-shadow: 0 0 10px #3b82f6;">
                                                </div>
                                                <h6 class="text-white fw-900 m-0 uppercase" style="font-size: 13px;">
                                                    MILDEW SPECTROMETRY</h6>
                                            </div>
                                            <p class="text-white-50 x-small fw-600 m-0 lh-base">Specific bio-logic for
                                                identification of aerial spores and fungal film detection.</p>
                                        </div>

                                        <div class="mt-5 pt-4 text-center border-top border-white-5 border-opacity-10">
                                            <div class="trust-label uppercase mb-2" style="font-size: 8px;">SECURITY
                                                PROTOCOL</div>
                                            <div class="text-success x-small fw-900 uppercase"
                                                style="letter-spacing: 1px;">AES-256 IDENTITY SHIELD ACTIVE</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </main>
                </div>

                <div id="voiceStatus" class="voice-status-terminal">
                    <div class="waves">
                        <div class="wave"></div>
                        <div class="wave"></div>
                        <div class="wave"></div>
                    </div>
                    <span id="voiceText">AI Listening...</span>
                </div>

                <script src="${pageContext.request.contextPath}/js/background-switcher.js"></script>
                <script src="${pageContext.request.contextPath}/js/voice-assistant.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                <script>
                    function toggleSidebar() { document.getElementById('sidebar').classList.toggle('open'); }
                </script>
            </body>

            </html>