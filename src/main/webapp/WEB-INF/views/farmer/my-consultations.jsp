<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
            <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8" />
                    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                    <title>🧑‍🏫 My Mentor Sessions - AGROPLANTER</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
                        rel="stylesheet">
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/voice-assistant.css" />
                    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800;900&display=swap"
                        rel="stylesheet">
                    <link rel="icon"
                        href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🧑‍🏫</text></svg>" />
                    <style>
                        .v3-ledger-panel {
                            background: rgba(15, 23, 42, 0.4);
                            border: 1px solid rgba(255, 255, 255, 0.05);
                            border-radius: 40px;
                            padding: 50px;
                            backdrop-filter: blur(40px);
                        }

                        .v3-data-table {
                            width: 100%;
                            border-collapse: separate;
                            border-spacing: 0 12px;
                        }

                        .v3-data-table th {
                            color: #94a3b8;
                            padding: 20px 25px;
                            font-size: 11px;
                            font-weight: 950;
                            text-transform: uppercase;
                            letter-spacing: 2px;
                        }

                        .v3-data-table td {
                            background: rgba(255, 255, 255, 0.02);
                            padding: 25px;
                            border-top: 1px solid rgba(255, 255, 255, 0.03);
                            border-bottom: 1px solid rgba(255, 255, 255, 0.03);
                        }

                        .v3-status-badge {
                            font-size: 9px;
                            font-weight: 950;
                            text-transform: uppercase;
                            letter-spacing: 1px;
                            padding: 8px 16px;
                            border-radius: 50px;
                        }
                    </style>
                </head>

                <body style="background: #020617; color: #fff; font-family: 'Outfit', sans-serif;">
                    <div class="dashboard-scene"></div>
                    <div class="dashboard-layout">
                        <aside class="sidebar sidebar-premium" id="sidebar">
                            <!-- Sidebar content same as other farmer pages -->
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
                                <a href="${pageContext.request.contextPath}/farmer/dashboard"
                                    class="sidebar-nav-item mb-2"><span class="nav-icon">📊</span> Command Center</a>
                                <a href="${pageContext.request.contextPath}/farmer/mentors"
                                    class="sidebar-nav-item mb-2"><span class="nav-icon">👨‍🏫</span> Expert Panel</a>
                                <a href="${pageContext.request.contextPath}/farmer/consultations"
                                    class="sidebar-nav-item active mb-2"><span class="nav-icon">📅</span> My
                                    Sessions</a>
                                <div class="mt-auto px-2"><a href="${pageContext.request.contextPath}/logout"
                                        class="sidebar-nav-item text-danger mt-4"><span class="nav-icon">🚪</span>
                                        Session Terminated</a></div>
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
                                            style="font-size: 2.2rem; letter-spacing: -1.5px;">Advisory Ledger</h1>
                                        <span class="v3-page-subtitle text-info uppercase"
                                            style="letter-spacing: 1px; font-weight: 800;">👨‍🏫 MENTOR CONSULTATIONS |
                                            KNOWLEDGE TRANSFER HISTORY</span>
                                    </div>
                                </div>
                            </header>

                            <div class="page-body px-5 py-5">
                                <div class="v3-ledger-panel">
                                    <div class="table-responsive">
                                        <table class="v3-data-table">
                                            <thead>
                                                <tr>
                                                    <th>REFERENCE</th>
                                                    <th>MENTOR</th>
                                                    <th>SCHEDULE</th>
                                                    <th>VALUATION</th>
                                                    <th>STATUS</th>
                                                    <th class="text-end">ACTIONS</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${consultations}" var="c">
                                                    <tr>
                                                        <td>
                                                            <div class="v3-ref-node">CON-${c.id}</div>
                                                        </td>
                                                        <td>
                                                            <div class="text-white fw-950">${c.mentor.user.fullName}
                                                            </div>
                                                            <div class="text-info x-small fw-800 uppercase">
                                                                ${c.mentor.expertise}</div>
                                                        </td>
                                                        <td>
                                                            <div class="text-white fw-950">${c.formattedSessionTime}
                                                            </div>
                                                            <div class="text-white-50 x-small fw-800">
                                                                ${c.formattedSessionHour} HRS</div>
                                                        </td>
                                                        <td>
                                                            <div class="text-white fw-950">₹${c.fee}</div>
                                                        </td>
                                                        <td>
                                                            <span
                                                                class="v3-status-badge ${c.status == 'COMPLETED' ? 'bg-success bg-opacity-10 text-success' : 'bg-warning bg-opacity-10 text-warning'}">${c.status}</span>
                                                        </td>
                                                        <td class="text-end">
                                                            <c:if test="${c.status == 'COMPLETED'}">
                                                                <button
                                                                    class="btn btn-sm btn-outline-warning rounded-pill px-3 py-1 fw-950"
                                                                    onclick="openReviewModal('${c.mentor.id}', '${c.mentor.user.fullName}')">⭐
                                                                    RATE ADVISOR</button>
                                                            </c:if>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </main>
                    </div>

                    <!-- Mentor Review Modal -->
                    <div class="modal fade" id="mentorReviewModal" tabindex="-1">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content border-0 overflow-hidden"
                                style="border-radius: 30px; background: rgba(15, 23, 42, 0.95); backdrop-filter: blur(20px);">
                                <div class="modal-header border-0 p-4">
                                    <h5 class="modal-title fw-950 text-white" id="mentorReviewTitle">⭐ RATE ADVISOR</h5>
                                    <button type="button" class="btn-close btn-close-white"
                                        data-bs-dismiss="modal"></button>
                                </div>
                                <div class="modal-body p-4 bg-dark">
                                    <input type="hidden" id="reviewMentorId">
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
                                        <label class="v3-identity-label">FEEDBACK</label>
                                        <textarea id="reviewFeedback" class="form-control v3-terminal-input" rows="4"
                                            placeholder="How was your consultation experience?"></textarea>
                                    </div>
                                </div>
                                <div class="modal-footer border-0 p-4">
                                    <button type="button"
                                        class="btn btn-primary w-100 py-3 rounded-pill fw-950 uppercase"
                                        onclick="submitMentorReview()">SUBMIT EVALUATION →</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="statusToast"
                        style="position: fixed; top: 100px; right: 30px; background: rgba(15, 23, 42, 0.9); border: 1px solid #10b981; border-radius: 20px; padding: 20px 30px; z-index: 9999; display: flex; align-items: center; gap: 15px; opacity: 0; pointer-events: none; transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275); transform: translateX(50px); backdrop-filter: blur(10px); box-shadow: 0 20px 40px rgba(0,0,0,0.5), 0 0 20px rgba(16, 185, 129, 0.2);">
                        <div id="toastIcon" style="font-size: 24px; color: #10b981;"><i class="fas fa-check-circle"></i>
                        </div>
                        <div>
                            <div id="toastTitle" class="text-success fw-900 uppercase"
                                style="font-size: 13px; letter-spacing: 1px;">PROTOCOL SUCCESS</div>
                            <div id="toastMessage" class="text-white-50 fw-600"
                                style="font-size: 11px; margin-top: 4px;">
                                Expert evaluation has been successfully synchronized.</div>
                        </div>
                    </div>

                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                    <script>
                        function toggleSidebar() { document.getElementById('sidebar').classList.toggle('open'); }
                        let currentRating = 0;
                        const reviewModal = new bootstrap.Modal(document.getElementById('mentorReviewModal'));

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

                        function openReviewModal(mentorId, mentorName) {
                            document.getElementById('reviewMentorId').value = mentorId;
                            document.getElementById('mentorReviewTitle').innerText = "⭐ RATE: " + mentorName.toUpperCase();
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

                        function submitMentorReview() {
                            if (currentRating === 0) {
                                showToast("VALUATION ERROR", "Please select a star rating to proceed.", true);
                                return;
                            }
                            const mentorId = document.getElementById('reviewMentorId').value;
                            const feedback = document.getElementById('reviewFeedback').value;
                            fetch('${pageContext.request.contextPath}/api/reviews/mentor/' + mentorId, {
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