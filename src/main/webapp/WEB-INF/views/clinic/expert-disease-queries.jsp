<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>🔬 Bio-Diagnostic Triage - AGROPLANTER Expert</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/voice-assistant.css" />
                <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800;900&display=swap"
                    rel="stylesheet">
                <link rel="icon"
                    href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🔬</text></svg>" />
                <script>
                    window.AgroplanterUser = "${expert.user.id}";
                    window.AgroplanterUserFull = "${expert.user.fullName}";
                    window.AgroplanterRole = "${expert.user.role}";
                </script>
                <style>
                    .v3-triage-node {
                        background: rgba(15, 23, 42, 0.4);
                        border: 1px solid rgba(255, 255, 255, 0.05);
                        border-radius: 40px;
                        padding: 50px;
                        margin-bottom: 40px;
                        backdrop-filter: blur(40px);
                        transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
                        position: relative;
                        overflow: hidden;
                    }

                    .v3-triage-node:hover {
                        transform: translateY(-10px);
                        background: rgba(15, 23, 42, 0.6);
                        border-color: rgba(59, 130, 246, 0.3);
                        box-shadow: 0 40px 80px rgba(0, 0, 0, 0.5);
                    }

                    .v3-triage-node::before {
                        content: '';
                        position: absolute;
                        top: 0;
                        left: 0;
                        width: 8px;
                        height: 100%;
                        background: #3b82f6;
                        opacity: 0.3;
                    }

                    .v3-evidence-box {
                        background: rgba(34, 197, 94, 0.05);
                        border: 1px solid rgba(34, 197, 94, 0.1);
                        border-radius: 20px;
                        padding: 25px;
                        margin-bottom: 30px;
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
                        padding: 15px 35px;
                        border-radius: 18px;
                        font-size: 11px;
                        font-weight: 950;
                        text-transform: uppercase;
                        text-decoration: none;
                        transition: 0.3s;
                        letter-spacing: 2px;
                    }

                    .v3-action-btn:hover {
                        background: #3b82f6;
                        color: #fff;
                        box-shadow: 0 10px 30px rgba(59, 130, 246, 0.3);
                        transform: translateY(-3px);
                    }

                    .v3-btn-danger {
                        background: rgba(239, 68, 68, 0.05);
                        border-color: rgba(239, 68, 68, 0.1);
                        color: #ef4444;
                    }

                    .v3-btn-danger:hover {
                        background: #ef4444;
                    }

                    .v3-severity-badge {
                        padding: 6px 15px;
                        border-radius: 10px;
                        font-size: 9px;
                        font-weight: 950;
                        letter-spacing: 2px;
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
                                        style="font-size: 10px; color: #3b82f6; font-weight: 800; letter-spacing: 1px;">EXPERT
                                        LAB V3</span>
                                </div>
                            </div>
                        </div>
                        <nav class="sidebar-nav px-3 py-4">
                            <div class="nav-section-title px-2 mb-2"
                                style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">CLINIC
                                OPS</div>
                            <a href="${pageContext.request.contextPath}/clinic/expert/dashboard"
                                class="sidebar-nav-item mb-2">
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
                                class="sidebar-nav-item active mb-2">
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
                                        style="font-size: 2.2rem; letter-spacing: -1.5px;">Bio-Intelligence Triage</h1>
                                    <span class="v3-page-subtitle text-info uppercase"
                                        style="letter-spacing: 1px; font-weight: 800;">
                                        🔬 QUARANTINE TELEMETRY | ANALYTICS: ACTIVE | TRACEABILITY: V3
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
                                    ⚡ CLASSIFICATION COMMITTED: ${successMessage}
                                </div>
                            </c:if>

                            <div class="d-flex justify-content-between align-items-center mb-5">
                                <h4 class="fw-950 text-white m-0 fs-2" style="letter-spacing: -1.5px;">Active Quarantine
                                    Queries</h4>
                                <div class="badge bg-warning bg-opacity-10 text-warning fw-950 px-4 py-2 rounded-pill uppercase"
                                    style="font-size: 10px; letter-spacing: 2px; border: 1px solid rgba(245, 158, 11, 0.2);">
                                    ${fn:length(queries)} PENDING ANALYSIS
                                </div>
                            </div>

                            <c:forEach items="${queries}" var="q">
                                <div class="v3-triage-node">
                                    <div class="row align-items-start mb-5">
                                        <div class="col-md-9">
                                            <h2 class="text-white fw-950 display-6 mb-2" style="letter-spacing: -2px;">
                                                ${q.cropName.toUpperCase()} Pathogen Alert</h2>
                                            <div class="text-info fw-950 uppercase d-flex flex-wrap gap-4"
                                                style="letter-spacing: 1.5px; font-size: 11px;">
                                                <span>👤 OPERATOR: ${q.user.fullName.toUpperCase()}</span>
                                                <span>📅 TIMESTAMP: ${q.createdAt}</span>
                                                <span>📍 DISTRICT: ${q.user.district.toUpperCase()}</span>
                                            </div>
                                        </div>
                                        <div class="col-md-3 text-md-end">
                                            <span class="v3-severity-badge 
                                                <c:choose>
                                                    <c:when test=" ${q.status=='PENDING' }">bg-warning text-dark
                                                </c:when>
                                                <c:when test="${q.status == 'ASSIGNED'}">bg-info text-white</c:when>
                                                <c:when test="${q.status == 'REPORT_READY'}">bg-primary text-white
                                                </c:when>
                                                <c:when test="${q.status == 'REJECTED'}">bg-danger text-white</c:when>
                                                <c:otherwise>bg-success text-white</c:otherwise>
                                                </c:choose>">
                                                STATUS: ${q.status}
                                            </span>
                                        </div>
                                    </div>

                                    <div class="v3-evidence-box">
                                        <label class="trust-label uppercase d-block mb-3"
                                            style="font-size: 9px; letter-spacing: 2.5px; color: #10b981;">EVIDENCE /
                                            DIAGNOSTIC SYMPTOMS</label>
                                        <p class="text-white fs-6 fw-600 mb-0 italic"
                                            style="opacity: 0.9; line-height: 1.6;">"${q.symptoms}"</p>
                                    </div>

                                    <form
                                        action="${pageContext.request.contextPath}/clinic/expert/disease-queries/update/${q.id}"
                                        method="post" class="m-0">
                                        <div class="p-5 rounded-5"
                                            style="background: rgba(0,0,0,0.3); border: 1px solid rgba(255,255,255,0.03);">
                                            <h5 class="text-white fw-950 mb-4 uppercase fs-5"
                                                style="letter-spacing: -0.5px; color: #8b5cf6;">🛡️ DIAGNOSTIC PROTOCOL
                                                INJECTION</h5>

                                            <div class="row g-4 mb-5">
                                                <div class="col-md-4">
                                                    <label class="v3-field-label">Identified Pathogen</label>
                                                    <input type="text" name="diseaseName"
                                                        class="form-control v3-terminal-input" value="${q.diseaseName}"
                                                        placeholder="e.g. Fusarium Wilt" required
                                                        ${(q.status=='REPORT_READY' || q.status=='DIAGNOSED' ||
                                                        q.status=='REJECTED' ) ? 'readonly' : '' } />
                                                </div>
                                                <div class="col-md-4">
                                                    <label class="v3-field-label">Confidence Score (%)</label>
                                                    <input type="number" step="0.1" name="confidenceScore"
                                                        class="form-control v3-terminal-input"
                                                        value="${q.confidenceScore}" required
                                                        ${(q.status=='REPORT_READY' || q.status=='DIAGNOSED' ||
                                                        q.status=='REJECTED' ) ? 'readonly' : '' } />
                                                </div>
                                                <div class="col-md-4">
                                                    <label class="v3-field-label">Severity Level</label>
                                                    <select name="severityLevel" class="form-select v3-terminal-input"
                                                        required ${(q.status=='REPORT_READY' || q.status=='DIAGNOSED' ||
                                                        q.status=='REJECTED' ) ? 'disabled' : '' }>
                                                        <option value="LOW" ${q.severityLevel=='LOW' ? 'selected' : ''
                                                            }>LOW</option>
                                                        <option value="MEDIUM" ${q.severityLevel=='MEDIUM' ? 'selected'
                                                            : '' }>MEDIUM</option>
                                                        <option value="HIGH" ${q.severityLevel=='HIGH' ? 'selected' : ''
                                                            }>HIGH</option>
                                                        <option value="CRITICAL" ${q.severityLevel=='CRITICAL'
                                                            ? 'selected' : '' }>CRITICAL / QUARANTINE</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="mb-5">
                                                <label class="v3-field-label">General Diagnosis & Biological
                                                    Impact</label>
                                                <textarea name="diagnosis" class="form-control v3-terminal-input"
                                                    rows="3" required ${(q.status=='REPORT_READY' ||
                                                    q.status=='DIAGNOSED' || q.status=='REJECTED' ) ? 'readonly' : ''
                                                    }>${q.diagnosis}</textarea>
                                            </div>

                                            <div class="row g-4 mb-5">
                                                <div class="col-md-6">
                                                    <label class="v3-field-label" style="color: #10b981;">Bio-Organic
                                                        Neutralization</label>
                                                    <textarea name="organicTreatment"
                                                        class="form-control v3-terminal-input" rows="3"
                                                        ${(q.status=='REPORT_READY' || q.status=='DIAGNOSED' ||
                                                        q.status=='REJECTED' ) ? 'readonly' : ''
                                                        }>${q.organicTreatment}</textarea>
                                                </div>
                                                <div class="col-md-6">
                                                    <label class="v3-field-label" style="color: #ef4444;">Chemical
                                                        Counter-Measures</label>
                                                    <textarea name="chemicalTreatment"
                                                        class="form-control v3-terminal-input" rows="3"
                                                        ${(q.status=='REPORT_READY' || q.status=='DIAGNOSED' ||
                                                        q.status=='REJECTED' ) ? 'readonly' : ''
                                                        }>${q.chemicalTreatment}</textarea>
                                                </div>
                                            </div>

                                            <div class="mb-5">
                                                <label class="v3-field-label" style="color: #3b82f6;">Long-Term
                                                    Preventive Protocol</label>
                                                <textarea name="preventiveMeasures"
                                                    class="form-control v3-terminal-input" rows="3"
                                                    ${(q.status=='REPORT_READY' || q.status=='DIAGNOSED' ||
                                                    q.status=='REJECTED' ) ? 'readonly' : ''
                                                    }>${q.preventiveMeasures}</textarea>
                                            </div>

                                            <c:if test="${q.status == 'PENDING' || q.status == 'ASSIGNED'}">
                                                <div class="d-flex justify-content-between align-items-center mt-5">
                                                    <button type="button" class="v3-action-btn v3-btn-danger"
                                                        data-bs-toggle="modal"
                                                        data-bs-target="#rejectModal${q.id}">REJECT QUERY</button>
                                                    <button type="submit" class="v3-action-btn"
                                                        style="background: #3b82f6; color: #fff;">COMMIT DIAGNOSIS
                                                        →</button>
                                                </div>
                                            </c:if>

                                            <c:if test="${q.status == 'REPORT_READY' || q.status == 'DIAGNOSED'}">
                                                <div class="badge bg-success bg-opacity-10 text-success fw-950 p-4 rounded-4 w-100 uppercase"
                                                    style="font-size: 11px; letter-spacing: 2px; border: 1px solid rgba(16, 185, 129, 0.2);">
                                                    ✅ DIAGNOSIS COMMITTED - DATA RECORD LOCKED
                                                </div>
                                            </c:if>
                                            <c:if test="${q.status == 'REJECTED'}">
                                                <div class="badge bg-danger bg-opacity-10 text-danger fw-950 p-4 rounded-4 w-100 uppercase"
                                                    style="font-size: 11px; letter-spacing: 2px; border: 1px solid rgba(239, 68, 68, 0.2);">
                                                    ❌ QUERY REJECTED - DATA RECORD LOCKED
                                                </div>
                                            </c:if>
                                        </div>
                                    </form>

                                    <!-- Rejection Modal -->
                                    <div class="modal fade" id="rejectModal${q.id}" tabindex="-1">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content v3-modal-content"
                                                style="background: #0f172a !important;">
                                                <div class="modal-header border-0 p-0 mb-4">
                                                    <h5 class="modal-title fw-950 text-white fs-4"
                                                        style="letter-spacing: -1px;">🚨 REJECT PATHOGEN QUERY</h5>
                                                    <button type="button" class="btn-close btn-close-white"
                                                        data-bs-dismiss="modal"></button>
                                                </div>
                                                <form
                                                    action="${pageContext.request.contextPath}/clinic/expert/disease-queries/reject/${q.id}"
                                                    method="post">
                                                    <div class="modal-body p-0">
                                                        <p class="text-white-50 small fw-600 mb-4">Provide categorical
                                                            justification for rejection. This will be transmitted to the
                                                            originating operator.</p>
                                                        <textarea name="reason" class="form-control v3-terminal-input"
                                                            rows="4"
                                                            placeholder="e.g. Visual evidence insufficient, symptoms non-distinct..."
                                                            required></textarea>
                                                    </div>
                                                    <div class="modal-footer border-0 p-0 mt-5">
                                                        <div class="d-flex gap-3 w-100">
                                                            <button type="button"
                                                                class="v3-action-btn flex-fill bg-opacity-5 border-opacity-10 text-white-50"
                                                                data-bs-dismiss="modal">ABORT</button>
                                                            <button type="submit"
                                                                class="v3-action-btn v3-btn-danger flex-fill">CONFIRM
                                                                REJECTION</button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                            <c:if test="${empty queries}">
                                <div class="text-center py-5">
                                    <div class="display-3 opacity-10 mb-5">🦠</div>
                                    <div class="text-white-50 fw-950 uppercase"
                                        style="letter-spacing: 4px; font-size: 14px;">ALL BIO-THREATS NEUTRALIZED</div>
                                    <div class="text-muted small fw-800 uppercase mt-3"
                                        style="font-size: 10px; letter-spacing: 3px;">SYSTEMS CLEAR | STANDBY FOR
                                        QUARANTINE TELEMETRY</div>
                                </div>
                            </c:if>
                        </div>
                    </main>
                </div>

                <script src="${pageContext.request.contextPath}/js/background-switcher.js"></script>
                <script src="${pageContext.request.contextPath}/js/voice-assistant.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                <script>
                    function toggleSidebar() { document.getElementById('sidebar').classList.toggle('open'); }
                </script>
            </body>

            </html>