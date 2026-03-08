<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>🌿 Clinic Hub - AGROPLANTER</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/voice-assistant.css" />
                <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800;900&display=swap"
                    rel="stylesheet">
                <link rel="icon"
                    href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🌿</text></svg>" />
                <script>
                    window.AgroplanterUser = "${user.id}";
                    window.AgroplanterUserFull = "${user.fullName}";
                    window.AgroplanterRole = "${user.role}";
                </script>
                <style>
                    .v3-clinic-hero {
                        background: linear-gradient(135deg, rgba(34, 197, 94, 0.1) 0%, rgba(15, 23, 42, 0.4) 100%);
                        border-radius: 40px;
                        padding: 60px;
                        margin-bottom: 50px;
                        backdrop-filter: blur(40px);
                        border: 1px solid rgba(255, 255, 255, 0.05);
                        position: relative;
                        overflow: hidden;
                    }

                    .v3-consult-node {
                        background: rgba(15, 23, 42, 0.4);
                        border: 1px solid rgba(255, 255, 255, 0.05);
                        border-radius: 35px;
                        padding: 35px;
                        margin-bottom: 25px;
                        backdrop-filter: blur(40px);
                        transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
                    }

                    .v3-consult-node:hover {
                        border-color: rgba(34, 197, 94, 0.2);
                        background: rgba(15, 23, 42, 0.6);
                        transform: translateY(-5px);
                    }

                    .v3-status-pill {
                        padding: 6px 14px;
                        border-radius: 10px;
                        font-size: 9px;
                        font-weight: 950;
                        letter-spacing: 1.5px;
                        text-transform: uppercase;
                        border: 1px solid rgba(255, 255, 255, 0.05);
                    }

                    .v3-data-label {
                        font-size: 9px;
                        font-weight: 950;
                        color: #475569;
                        letter-spacing: 2px;
                        text-transform: uppercase;
                        margin-bottom: 8px;
                        display: block;
                    }

                    .v3-expert-avatar {
                        width: 55px;
                        height: 55px;
                        background: linear-gradient(135deg, #22c55e, #3b82f6);
                        border-radius: 18px;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        font-size: 24px;
                        color: white;
                        box-shadow: 0 10px 20px rgba(34, 197, 94, 0.2);
                    }

                    .v3-report-box {
                        background: rgba(34, 197, 94, 0.05);
                        border: 1px solid rgba(34, 197, 94, 0.1);
                        border-radius: 20px;
                        padding: 25px;
                        margin-top: 20px;
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
                                class="sidebar-nav-item active mb-2"><span class="nav-icon">🌿</span> Plant Clinic</a>

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

                            <div class="nav-section-title px-2 mt-4 mb-2"
                                style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">FINANCE
                                & SAFETY</div>
                            <a href="${pageContext.request.contextPath}/farmer/finance"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">💰</span> Capital Hub</a>
                            <a href="${pageContext.request.contextPath}/farmer/safety-hub"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">🛡️</span> Safety HQ</a>

                            <div class="mt-auto px-2">
                                <a href="${pageContext.request.contextPath}/logout"
                                    class="sidebar-nav-item text-danger mt-4" style="border-radius: 12px;">
                                    <span class="nav-icon">🚪</span> Terminate Session
                                </a>
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
                                    <h1 class="m-0 fw-950 text-white"
                                        style="font-size: 2.2rem; letter-spacing: -1.5px;">Clinic Hub</h1>
                                    <div class="d-inline-block px-3 py-1 rounded-3 mt-1"
                                        style="background: rgba(16, 185, 129, 0.1); border: 1px solid rgba(16, 185, 129, 0.2);">
                                        <span class="v3-page-subtitle text-success uppercase"
                                            style="letter-spacing: 1px; font-weight: 800; font-size: 10px;">
                                            🌿 BIOMEDICAL OVERSIGHT | ACTIVE SESSIONS: ${fn:length(consultations)} |
                                            NODE: SECURED
                                        </span>
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

                            <div class="v3-clinic-hero">
                                <div class="row align-items-center">
                                    <div class="col-md-9">
                                        <div class="badge bg-success bg-opacity-10 text-success fw-950 px-3 py-2 rounded-pill uppercase mb-4"
                                            style="font-size: 9px; letter-spacing: 2px; border: 1px solid rgba(34, 197, 94, 0.2);">
                                            REQUISITION PORTAL ACTIVE
                                        </div>
                                        <h1 class="fw-950 text-white mb-3 display-4" style="letter-spacing: -3px;">
                                            AGROPLANTER Clinical Hub</h1>
                                        <p class="text-white-50 fw-800 uppercase x-small mb-0"
                                            style="letter-spacing: 2px; opacity: 0.6;">
                                            MONITORING PERSONAL CROP PATHOGEN TELEMETRY AND EXPERT DIAGNOSTIC SESSIONS.
                                        </p>
                                    </div>
                                    <div class="col-md-3 text-md-end">
                                        <a href="${pageContext.request.contextPath}/clinic/farmer/experts"
                                            class="btn btn-quantum w-100 py-4 fw-950 uppercase"
                                            style="font-size: 11px; letter-spacing: 1px;">
                                            INITIATE CONSULTATION +
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <div class="row g-4">
                                <c:forEach var="c" items="${consultations}">
                                    <div class="col-12 mb-4">
                                        <div class="v3-consult-node">
                                            <div class="row align-items-center g-4">
                                                <div class="col-md-3">
                                                    <div class="d-flex align-items-center gap-4">
                                                        <div class="v3-expert-avatar">🩺</div>
                                                        <div>
                                                            <div class="text-white fw-950 fs-5 mb-1"
                                                                style="letter-spacing: -0.5px;">DR.
                                                                ${c.expert.user.fullName.toUpperCase()}</div>
                                                            <div class="text-info fw-950 uppercase"
                                                                style="font-size: 10px; letter-spacing: 1px;">
                                                                ${c.expert.specialization}</div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <span class="v3-data-label">TELEMETRY WINDOW</span>
                                                    <div class="text-white fw-800 fs-6">${c.sessionTime}</div>
                                                </div>
                                                <div class="col-md-2">
                                                    <span class="v3-data-label">STATUS NODE</span>
                                                    <c:choose>
                                                        <c:when test="${c.status == 'PENDING'}">
                                                            <span
                                                                class="v3-status-pill bg-warning bg-opacity-10 text-warning">${c.status}</span>
                                                        </c:when>
                                                        <c:when test="${c.status == 'APPROVED'}">
                                                            <span
                                                                class="v3-status-pill bg-info bg-opacity-10 text-info">${c.status}</span>
                                                        </c:when>
                                                        <c:when test="${c.status == 'COMPLETED'}">
                                                            <span
                                                                class="v3-status-pill bg-success bg-opacity-10 text-success">${c.status}</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span
                                                                class="v3-status-pill bg-secondary bg-opacity-10 text-white">${c.status}</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                                <div class="col-md-2">
                                                    <span class="v3-data-label">VALUATION</span>
                                                    <div class="text-white fw-950 fs-5"
                                                        style="font-family: 'JetBrains Mono'; color: #fbbf24;">₹${c.fee}
                                                    </div>
                                                </div>
                                                <div class="col-md-2 text-md-end">
                                                    <c:choose>
                                                        <c:when
                                                            test="${c.status == 'APPROVED' && c.payment != null && c.payment.status == 'PENDING'}">
                                                            <form
                                                                action="${pageContext.request.contextPath}/clinic/farmer/pay/${c.id}"
                                                                method="post" class="m-0">
                                                                <button
                                                                    class="btn btn-quantum w-100 py-3 fw-950 uppercase"
                                                                    style="font-size: 10px;">RESOLVE FEE</button>
                                                            </form>
                                                        </c:when>
                                                        <c:when
                                                            test="${c.status == 'APPROVED' && c.payment != null && c.payment.status == 'COMPLETED'}">
                                                            <a href="${pageContext.request.contextPath}${c.meetLink}"
                                                                class="btn btn-quantum w-100 py-3 fw-950 uppercase"
                                                                style="font-size: 10px; background: linear-gradient(135deg, #3b82f6, #6366f1);"
                                                                target="_blank">JOIN SESSION</a>
                                                        </c:when>
                                                        <c:when test="${c.status == 'COMPLETED'}">
                                                            <div class="d-flex flex-column gap-2">
                                                                <button
                                                                    class="btn btn-quantum w-100 py-3 fw-950 uppercase"
                                                                    style="font-size: 10px; background: linear-gradient(135deg, #10b981, #059669);"
                                                                    data-bs-toggle="modal"
                                                                    data-bs-target="#rxModal${c.id}">VIEW
                                                                    REPORT</button>
                                                                <button
                                                                    class="btn btn-sm btn-outline-warning rounded-pill px-3 py-1 fw-950 uppercase"
                                                                    style="font-size: 8px;"
                                                                    onclick="openExpertReviewModal('${c.expert.id}', '${c.expert.user.fullName}')">⭐
                                                                    RATE EXPERT</button>
                                                            </div>
                                                        </c:when>
                                                    </c:choose>
                                                </div>
                                            </div>

                                            <c:if test="${c.status == 'COMPLETED' && c.prescription != null}">
                                                <div class="v3-report-box mt-4">
                                                    <div class="row">
                                                        <div class="col-md-6 mb-3 mb-md-0">
                                                            <span class="v3-data-label text-danger"
                                                                style="opacity: 0.8;">DIAGNOSED PHENOMENON</span>
                                                            <div class="text-white fw-800 small">
                                                                ${c.prescription.diagnosis}</div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <span class="v3-data-label text-success"
                                                                style="opacity: 0.8;">REMEDIATION PROTOCOL</span>
                                                            <div class="text-white fw-800 small">
                                                                ${c.prescription.medications}</div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </div>
                                    </div>

                                    <!-- Report Modal -->
                                    <div class="modal fade" id="rxModal${c.id}" tabindex="-1">
                                        <div class="modal-dialog modal-dialog-centered modal-lg">
                                            <div class="modal-content overflow-hidden border-0"
                                                style="border-radius: 40px; background: rgba(15, 23, 42, 0.95); backdrop-filter: blur(40px);">
                                                <div class="modal-header border-0 p-5 pb-2">
                                                    <h2 class="modal-title fw-950 text-white"
                                                        style="letter-spacing: -1.5px;">🌿 BIO-DIAGNOSTIC REPORT</h2>
                                                    <button type="button" class="btn-close btn-close-white"
                                                        data-bs-dismiss="modal"></button>
                                                </div>
                                                <div class="modal-body p-5 pt-4">
                                                    <div class="mb-5">
                                                        <span class="v3-data-label mb-3"
                                                            style="color: #ef4444; font-size: 10px;">CRITICAL DIAGNOSIS
                                                            DETECTED</span>
                                                        <div
                                                            class="p-4 bg-danger bg-opacity-10 border border-danger border-opacity-20 rounded-4 text-white fw-800 fs-5">
                                                            ${c.prescription.diagnosis}
                                                        </div>
                                                    </div>
                                                    <div class="mb-5">
                                                        <span class="v3-data-label mb-3"
                                                            style="color: #10b981; font-size: 10px;">NEUTRALIZATION
                                                            STRATEGY</span>
                                                        <div
                                                            class="p-4 bg-success bg-opacity-10 border border-success border-opacity-20 rounded-4 text-white-50 fw-600 lh-lg">
                                                            ${c.prescription.medications}
                                                        </div>
                                                    </div>
                                                    <c:if test="${not empty c.prescription.additionalAdvice}">
                                                        <div>
                                                            <span class="v3-data-label mb-3"
                                                                style="color: #3b82f6; font-size: 10px;">OPERATIONAL
                                                                ADVISORY</span>
                                                            <p class="text-white-50 fw-600 mb-0 px-2"
                                                                style="font-size: 14px; opacity: 0.7;">
                                                                ${c.prescription.additionalAdvice}
                                                            </p>
                                                        </div>
                                                    </c:if>
                                                </div>
                                                <div class="modal-footer border-0 p-5 pt-0 text-center d-block">
                                                    <div class="small fw-950 uppercase text-muted"
                                                        style="letter-spacing: 3px; font-size: 10px; opacity: 0.3;">
                                                        AUTHENTICATED BY Agroplanter BIOLABS & DR.
                                                        ${c.expert.user.fullName.toUpperCase()}
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>

                                <c:if test="${empty consultations}">
                                    <div class="col-12 text-center py-5">
                                        <div class="display-3 opacity-10 mb-4">🌿</div>
                                        <div class="text-white-50 fw-950 uppercase h5" style="letter-spacing: 4px;">
                                            NO CLINICAL REQUISITIONS DETECTED</div>
                                        <div class="text-muted small fw-800 uppercase mt-3"
                                            style="font-size: 10px; letter-spacing: 2px;">SECURE NODE READY FOR NEW
                                            CONSULTATIONS</div>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </main>
                </div>

                <div id="statusToast"
                    style="position: fixed; top: 100px; right: 30px; background: rgba(15, 23, 42, 0.9); border: 1px solid #10b981; border-radius: 20px; padding: 20px 30px; z-index: 9999; display: flex; align-items: center; gap: 15px; opacity: 0; pointer-events: none; transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275); transform: translateX(50px); backdrop-filter: blur(10px); box-shadow: 0 20px 40px rgba(0,0,0,0.5), 0 0 20px rgba(16, 185, 129, 0.2);">
                    <div id="toastIcon" style="font-size: 24px; color: #10b981;"><i class="fas fa-check-circle"></i>
                    </div>
                    <div>
                        <div id="toastTitle" class="text-success fw-900 uppercase"
                            style="font-size: 13px; letter-spacing: 1px;">PROTOCOL SUCCESS</div>
                        <div id="toastMessage" class="text-white-50 fw-600" style="font-size: 11px; margin-top: 4px;">
                            Expert evaluation has been successfully synchronized.</div>
                    </div>
                </div>

                <!-- Expert Review Modal -->
                <div class="modal fade" id="expertReviewModal" tabindex="-1">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content border-0 overflow-hidden"
                            style="border-radius: 30px; background: rgba(15, 23, 42, 0.95); backdrop-filter: blur(20px);">
                            <div class="modal-header border-0 p-4">
                                <h5 class="modal-title fw-950 text-white" id="expertReviewTitle">⭐ RATE EXPERT</h5>
                                <button type="button" class="btn-close btn-close-white"
                                    data-bs-dismiss="modal"></button>
                            </div>
                            <div class="modal-body p-4 bg-dark">
                                <input type="hidden" id="reviewExpertId">
                                <div class="text-center mb-4">
                                    <div class="star-rating-input fs-1 text-warning mb-3" style="cursor: pointer;">
                                        <span onclick="setRating(1)">☆</span>
                                        <span onclick="setRating(2)">☆</span>
                                        <span onclick="setRating(3)">☆</span>
                                        <span onclick="setRating(4)">☆</span>
                                        <span onclick="setRating(5)">☆</span>
                                    </div>
                                    <div id="ratingLabel" class="text-white-50 fw-900 uppercase small">Select Rating
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label class="v3-data-label">FEEDBACK</label>
                                    <textarea id="reviewFeedback"
                                        class="form-control bg-dark border-secondary text-white rounded-4 p-3" rows="4"
                                        placeholder="How was your consultation experience?"
                                        style="background: rgba(15, 23, 42, 0.4); border: 1px solid rgba(255, 255, 255, 0.1);"></textarea>
                                </div>
                            </div>
                            <div class="modal-footer border-0 p-4">
                                <button type="button" class="btn btn-primary w-100 py-3 rounded-pill fw-950 uppercase"
                                    onclick="submitExpertReview()">SUBMIT EVALUATION →</button>
                            </div>
                        </div>
                    </div>
                </div>

                <script src="${pageContext.request.contextPath}/js/voice-assistant.js"></script>
                <script src="${pageContext.request.contextPath}/js/background-switcher.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                <script>
                    function toggleSidebar() { document.getElementById('sidebar').classList.toggle('open'); }

                    let currentRating = 0;
                    const reviewModal = new bootstrap.Modal(document.getElementById('expertReviewModal'));

                    function showToast(title, message, isError = false) {
                        const toast = document.getElementById('statusToast');
                        const titleEl = document.getElementById('toastTitle');
                        const msgEl = document.getElementById('toastMessage');
                        const iconEl = document.getElementById('toastIcon');

                        titleEl.innerText = title;
                        msgEl.innerText = message;

                        if (isError) {
                            toast.style.borderColor = '#ef4444';
                            titleEl.style.color = '#ef4444';
                            iconEl.style.color = '#ef4444';
                            iconEl.innerHTML = '<i class="fas fa-exclamation-circle"></i>';
                        } else {
                            toast.style.borderColor = '#10b981';
                            titleEl.style.color = '#10b981';
                            iconEl.style.color = '#10b981';
                            iconEl.innerHTML = '<i class="fas fa-check-circle"></i>';
                        }

                        toast.style.opacity = '1';
                        toast.style.transform = 'translateX(0)';
                        toast.style.pointerEvents = 'auto';

                        setTimeout(() => {
                            toast.style.opacity = '0';
                            toast.style.transform = 'translateX(50px)';
                            toast.style.pointerEvents = 'none';
                        }, 4000);
                    }

                    function openExpertReviewModal(expertId, expertName) {
                        document.getElementById('reviewExpertId').value = expertId;
                        document.getElementById('expertReviewTitle').innerText = "⭐ RATE: " + expertName.toUpperCase();
                        setRating(0);
                        document.getElementById('reviewFeedback').value = "";
                        reviewModal.show();
                    }

                    function setRating(r) {
                        currentRating = r;
                        const spans = document.querySelectorAll('.star-rating-input span');
                        spans.forEach((s, idx) => { s.innerText = idx < r ? '★' : '☆'; });
                        const labels = ["Select Rating", "Poor", "Fair", "Good", "Very Good", "Excellent"];
                        document.getElementById('ratingLabel').innerText = labels[r];
                    }

                    function submitExpertReview() {
                        if (currentRating === 0) {
                            showToast("VALUATION ERROR", "Please select a star rating to proceed.", true);
                            return;
                        }
                        const expertId = document.getElementById('reviewExpertId').value;
                        const feedback = document.getElementById('reviewFeedback').value;
                        fetch('${pageContext.request.contextPath}/api/reviews/expert/' + expertId, {
                            method: 'POST',
                            headers: { 'Content-Type': 'application/json' },
                            body: JSON.stringify({ rating: currentRating, feedback: feedback })
                        })
                            .then(async response => {
                                const isJson = response.headers.get('content-type')?.includes('application/json');
                                const data = isJson ? await response.json() : await response.text();
                                return { status: response.status, body: data };
                            })
                            .then(res => {
                                if (res.status === 200) {
                                    reviewModal.hide();
                                    showToast("REVIEW STORED", "Your feedback has been successfully processed and synchronized.", false);
                                    setTimeout(() => { location.reload(); }, 2000);
                                }
                                else {
                                    const errorMsg = typeof res.body === 'object' ? res.body.message : res.body;
                                    showToast("SYNC ERROR", errorMsg, true);
                                }
                            })
                            .catch(error => showToast("TERMINAL ERROR", "Connection failure: " + error, true));
                    }
                </script>


            </body>

            </html>