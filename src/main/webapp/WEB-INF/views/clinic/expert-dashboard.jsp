<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>🧪 Expert Bio-Diagnostic Lab - AGROPLANTER</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/voice-assistant.css" />
                <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800;900&display=swap"
                    rel="stylesheet">
                <link rel="icon"
                    href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🧪</text></svg>" />
                <script>
                    window.AgroplanterUser = "${expert.user.id}";
                    window.AgroplanterUserFull = "${expert.user.fullName}";
                    window.AgroplanterRole = "${expert.user.role}";
                </script>
                <style>
                    .v3-clinic-hero {
                        background: linear-gradient(135deg, rgba(15, 23, 42, 0.4) 0%, rgba(30, 58, 138, 0.4) 100%);
                        border: 1px solid rgba(59, 130, 246, 0.2);
                        border-radius: 40px;
                        padding: 50px;
                        margin-bottom: 50px;
                        backdrop-filter: blur(40px);
                        position: relative;
                        overflow: hidden;
                    }

                    .v3-clinic-hero::after {
                        content: '🔬';
                        position: absolute;
                        right: -20px;
                        top: -20px;
                        font-size: 180px;
                        opacity: 0.03;
                        transform: rotate(-15deg);
                    }

                    .v3-consult-node {
                        background: rgba(15, 23, 42, 0.4);
                        border: 1px solid rgba(255, 255, 255, 0.05);
                        border-radius: 30px;
                        padding: 30px;
                        margin-bottom: 25px;
                        backdrop-filter: blur(30px);
                        transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
                    }

                    .v3-consult-node:hover {
                        transform: translateY(-10px) scale(1.01);
                        background: rgba(15, 23, 42, 0.6);
                        border-color: rgba(59, 130, 246, 0.3);
                        box-shadow: 0 25px 50px rgba(0, 0, 0, 0.4);
                    }

                    .v3-terminal-input {
                        background: rgba(255, 255, 255, 0.02) !important;
                        border: 1px solid rgba(255, 255, 255, 0.05) !important;
                        border-radius: 20px !important;
                        padding: 16px 24px !important;
                        color: #fff !important;
                        transition: 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
                        font-size: 14px !important;
                        font-family: 'Outfit';
                    }

                    .v3-terminal-input:focus {
                        border-color: #3b82f6 !important;
                        background: rgba(255, 255, 255, 0.05) !important;
                        box-shadow: 0 0 30px rgba(59, 130, 246, 0.1) !important;
                        transform: translateY(-2px);
                    }

                    .v3-action-btn {
                        background: rgba(59, 130, 246, 0.1);
                        border: 1px solid rgba(59, 130, 246, 0.2);
                        color: #3b82f6;
                        padding: 12px 28px;
                        border-radius: 15px;
                        font-size: 11px;
                        font-weight: 800;
                        text-transform: uppercase;
                        text-decoration: none;
                        transition: 0.3s;
                        letter-spacing: 1.5px;
                    }

                    .v3-action-btn:hover {
                        background: #3b82f6;
                        color: #fff;
                        box-shadow: 0 10px 20px rgba(59, 130, 246, 0.2);
                        transform: translateY(-2px);
                    }

                    .v3-btn-success {
                        background: rgba(16, 185, 129, 0.1);
                        border-color: rgba(16, 185, 129, 0.2);
                        color: #10b981;
                    }

                    .v3-btn-success:hover {
                        background: #10b981;
                    }

                    .v3-modal-content {
                        background: rgba(15, 23, 42, 0.95) !important;
                        backdrop-filter: blur(50px) !important;
                        border: 1px solid rgba(255, 255, 255, 0.08) !important;
                        border-radius: 40px !important;
                        padding: 40px;
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
                                        style="font-size: 10px; color: #3b82f6; font-weight: 800; letter-spacing: 1px;">CLINIC
                                        NODE V3</span>
                                </div>
                            </div>
                        </div>
                        <nav class="sidebar-nav px-3 py-4">
                            <div class="nav-section-title px-2 mb-2"
                                style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">CLINIC
                                OPS</div>
                            <a href="${pageContext.request.contextPath}/clinic/expert/dashboard"
                                class="sidebar-nav-item active mb-2">
                                <span class="nav-icon">📋</span> Queue Desk
                            </a>
                            <a href="${pageContext.request.contextPath}/chat" class="sidebar-nav-item mb-2">
                                <span class="nav-icon">💬</span> Secure Message
                            </a>
                            <a href="${pageContext.request.contextPath}/clinic/expert/reviews"
                                class="sidebar-nav-item mb-2">
                                <span class="nav-icon">⭐</span> Review Intel
                            </a>

                            <div class="nav-section-title px-2 mt-4 mb-2"
                                style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">
                                TELEMETRY</div>
                            <a href="${pageContext.request.contextPath}/clinic/expert/disease-queries"
                                class="sidebar-nav-item mb-2">
                                <span class="nav-icon">🔬</span> Bio-Intelligence
                            </a>

                            <div class="nav-section-title px-2 mt-4 mb-2"
                                style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">ACCOUNT
                            </div>
                            <a href="${pageContext.request.contextPath}/clinic/expert/profile"
                                class="sidebar-nav-item mb-2">
                                <span class="nav-icon">👤</span> Expert Profile
                            </a>
                            <a href="${pageContext.request.contextPath}/logout"
                                class="sidebar-nav-item text-danger mt-4">
                                <span class="nav-icon">🚪</span> Terminate Session
                            </a>
                        </nav>
                    </aside>

                    <main class="main-content">
                        <header class="top-nav">
                            <div class="top-nav-left d-flex align-items-center gap-3">
                                <div class="hamburger" onclick="toggleSidebar()">
                                    <span></span><span></span><span></span>
                                </div>
                                <div class="page-title">
                                    <h1 class="m-0 fw-950 text-white"
                                        style="font-size: 2.2rem; letter-spacing: -1.5px;">Diagnostic Hub</h1>
                                    <span class="v3-page-subtitle text-info uppercase"
                                        style="letter-spacing: 1px; font-weight: 800;">
                                        🧪 EXPERT LAB: ${expert.specialization.toUpperCase()} | STATUS: ONLINE |
                                        SECRETS: V3 AES-256
                                    </span>
                                </div>
                            </div>
                            <div class="top-nav-right">
                                <div class="user-info"
                                    style="gap: 15px; cursor: pointer; display: flex; align-items: center;"
                                    onclick="window.location.href='${pageContext.request.contextPath}/clinic/expert/profile'">
                                    <div class="user-details d-none d-md-flex flex-column text-end">
                                        <span class="user-name text-white fw-800"
                                            style="font-size: 14px; letter-spacing: -0.5px;">${expert.user.fullName}</span>
                                        <span class="user-role uppercase fw-950"
                                            style="font-size: 9px; color: #3b82f6; letter-spacing: 1px;">DIAGNOSTIC
                                            ${expert.user.role}</span>
                                    </div>
                                    <div class="user-avatar"
                                        style="width: 48px; height: 48px; border-radius: 16px; display: flex; align-items: center; justify-content: center; overflow: hidden; border: 1px solid rgba(255,255,255,0.1); box-shadow: 0 10px 20px rgba(59, 130, 246, 0.2);">
                                        <c:choose>
                                            <c:when test="${not empty expert.user.profileImagePath}">
                                                <img src="${pageContext.request.contextPath}${expert.user.profileImagePath}"
                                                    alt="Profile" style="width: 100%; height: 100%; object-fit: cover;">
                                            </c:when>
                                            <c:otherwise>
                                                <div
                                                    style="width: 100%; height: 100%; background: linear-gradient(135deg, #3b82f6, #6366f1); display: flex; align-items: center; justify-content: center; font-weight: 950; font-size: 20px; color: white;">
                                                    ${fn:substring(expert.user.fullName, 0, 1)}
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                        </header>

                        <div class="page-body px-5 py-5">
                            <c:if test="${not empty successMessage}">
                                <div class="alert alert-success border-0 bg-success bg-opacity-10 text-success rounded-4 mb-5 p-4 fw-800 uppercase x-small"
                                    style="letter-spacing: 1px;">
                                    ⚡ PROTOCOL UPDATE: ${successMessage}
                                </div>
                            </c:if>

                            <div class="v3-clinic-hero">
                                <div class="row align-items-center">
                                    <div class="col-md-8">
                                        <h2 class="fw-950 text-white display-5 mb-2" style="letter-spacing: -2px;">
                                            ${expert.user.fullName}</h2>
                                        <div class="text-info fw-950 uppercase mb-0 d-flex gap-4"
                                            style="letter-spacing: 1.5px; font-size: 11px;">
                                            <span>EXPERIENCE: ${expert.experience.toUpperCase()}</span>
                                            <span>GLOBAL RATING: ⭐ ${expert.rating}</span>
                                        </div>
                                    </div>
                                    <div class="col-md-4 text-md-end mt-4 mt-md-0">
                                        <div class="badge bg-info bg-opacity-10 text-info fw-950 px-4 py-3 rounded-pill uppercase"
                                            style="font-size: 10px; letter-spacing: 2px; border: 1px solid rgba(59, 130, 246, 0.2);">
                                            🟢 LAB NODE: SECURED & ONLINE
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="d-flex justify-content-between align-items-center mb-5 mt-5">
                                <h4 class="fw-950 text-white m-0 fs-2" style="letter-spacing: -1.5px;">Pending
                                    Bio-Diagnostics</h4>
                                <div class="text-white-50 fw-950 uppercase"
                                    style="font-size: 10px; letter-spacing: 2px;">Active Requisitions:
                                    ${fn:length(consultations)}</div>
                            </div>

                            <div class="v3-consult-grid">
                                <c:forEach var="c" items="${consultations}">
                                    <div class="v3-consult-node">
                                        <div class="row align-items-center g-4">
                                            <div class="col-md-3">
                                                <div class="fw-950 text-white fs-5 mb-1">${c.farmer.fullName}</div>
                                                <div class="text-white-50 x-small fw-800 uppercase"
                                                    style="letter-spacing: 1px;">${c.farmer.district.toUpperCase()},
                                                    ${c.farmer.state.toUpperCase()}</div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="text-info-glow fw-950 fs-6 text-info"
                                                    style="letter-spacing: 0.5px;">📅 ${c.sessionTime}</div>
                                                <div class="text-white-50 x-small fw-800 uppercase mt-1"
                                                    style="letter-spacing: 1.5px;">SCHEDULED WINDOW</div>
                                            </div>
                                            <div class="col-md-2">
                                                <span
                                                    class="badge ${c.status == 'PENDING' ? 'bg-warning bg-opacity-10 text-warning' : 'bg-success bg-opacity-10 text-success'} fw-950 px-3 py-2 rounded-pill uppercase"
                                                    style="font-size: 8px; letter-spacing: 2px; border: 1px solid currentColor;">
                                                    ${c.status}
                                                </span>
                                            </div>
                                            <div class="col-md-4 text-md-end">
                                                <div class="d-flex gap-3 justify-content-end">
                                                    <c:if test="${c.status == 'PENDING'}">
                                                        <form
                                                            action="${pageContext.request.contextPath}/clinic/expert/accept/${c.id}"
                                                            method="post" class="m-0">
                                                            <button class="v3-action-btn w-100">ACCEPT
                                                                REQUISITION</button>
                                                        </form>
                                                    </c:if>
                                                    <c:if
                                                        test="${c.status == 'APPROVED' && c.payment != null && c.payment.status == 'COMPLETED'}">
                                                        <a href="${pageContext.request.contextPath}${c.meetLink}"
                                                            class="v3-action-btn" target="_blank">📡 JOIN LINK</a>
                                                        <button class="v3-action-btn v3-btn-success"
                                                            data-bs-toggle="modal"
                                                            data-bs-target="#prescribeModal${c.id}">💉 INJECT
                                                            DATA</button>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Prescribe Modal -->
                                    <div class="modal fade" id="prescribeModal${c.id}" tabindex="-1">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content v3-modal-content">
                                                <div class="modal-header border-0 p-0 mb-4">
                                                    <h5 class="modal-title fw-950 text-white fs-4"
                                                        style="letter-spacing: -1px;">🔬 DIAGNOSTIC INJECTION</h5>
                                                    <button type="button" class="btn-close btn-close-white"
                                                        data-bs-dismiss="modal"></button>
                                                </div>
                                                <form
                                                    action="${pageContext.request.contextPath}/clinic/expert/prescribe"
                                                    method="post">
                                                    <div class="modal-body p-0">
                                                        <input type="hidden" name="consultationId" value="${c.id}">
                                                        <div class="mb-4">
                                                            <label
                                                                class="text-white-50 x-small fw-950 uppercase mb-3 d-block"
                                                                style="letter-spacing: 2px;">DIAGNOSIS (PATHOGEN
                                                                NODE)</label>
                                                            <input type="text" name="diagnosis"
                                                                class="form-control v3-terminal-input"
                                                                placeholder="e.g. Fusarium Wilt Hub" required />
                                                        </div>
                                                        <div class="mb-4">
                                                            <label
                                                                class="text-white-50 x-small fw-950 uppercase mb-3 d-block"
                                                                style="letter-spacing: 2px;">TREATMENT PROTOCOL</label>
                                                            <textarea name="medications"
                                                                class="form-control v3-terminal-input" rows="4"
                                                                placeholder="Specify neutralization steps..."
                                                                required></textarea>
                                                        </div>
                                                        <div class="mb-0">
                                                            <label
                                                                class="text-white-50 x-small fw-950 uppercase mb-3 d-block"
                                                                style="letter-spacing: 2px;">PREVENTATIVE
                                                                ADVISORY</label>
                                                            <textarea name="additionalAdvice"
                                                                class="form-control v3-terminal-input" rows="3"
                                                                placeholder="Long-term containment strategy..."></textarea>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer border-0 p-0 mt-5">
                                                        <div class="d-flex gap-3 w-100">
                                                            <button type="button"
                                                                class="v3-action-btn flex-fill bg-opacity-5 border-opacity-10 text-white-50"
                                                                data-bs-dismiss="modal">ABORT</button>
                                                            <button type="submit"
                                                                class="v3-action-btn v3-btn-success flex-fill">COMMIT TO
                                                                BIO-LEDGER</button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                                <c:if test="${empty consultations}">
                                    <div class="text-center py-5">
                                        <div class="display-3 opacity-10 mb-4">🔬</div>
                                        <div class="text-white-50 fw-950 uppercase"
                                            style="letter-spacing: 4px; font-size: 14px;">REQUISITION QUEUE CLEAR</div>
                                        <div class="text-muted small fw-800 uppercase mt-2"
                                            style="font-size: 9px; letter-spacing: 2px;">SYSTEMS IDLE | STANDBY FOR
                                            TASKING</div>
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