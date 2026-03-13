<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
            <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8" />
                    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                    <title>📦 Purchase Ledger - AGROPLANTER V3</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
                        rel="stylesheet">
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/voice-assistant.css" />
                    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800;900&display=swap"
                        rel="stylesheet">
                    <link rel="icon"
                        href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>📦</text></svg>" />
                    <meta name="_csrf" content="${_csrf.token}" />
                    <meta name="_csrf_header" content="${_csrf.headerName}" />
                    <script>
                        window.AgroplanterUser = "${user.id}";
                        window.AgroplanterUserFull = "${user.fullName}";
                        window.AgroplanterRole = "${user.role}";
                    </script>
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
                            background: rgba(255, 255, 255, 0.03);
                            border-bottom: 1px solid rgba(255, 255, 255, 0.05);
                        }

                        .v3-data-table thead tr th:first-child {
                            border-radius: 15px 0 0 15px;
                        }

                        .v3-data-table thead tr th:last-child {
                            border-radius: 0 15px 15px 0;
                        }

                        .v3-data-table td {
                            background: rgba(255, 255, 255, 0.02);
                            padding: 25px;
                            border-top: 1px solid rgba(255, 255, 255, 0.03);
                            border-bottom: 1px solid rgba(255, 255, 255, 0.03);
                        }

                        .v3-data-table tr td:first-child {
                            border-radius: 20px 0 0 20px;
                            border-left: 1px solid rgba(255, 255, 255, 0.03);
                        }

                        .v3-data-table tr td:last-child {
                            border-radius: 0 20px 20px 0;
                            border-right: 1px solid rgba(255, 255, 255, 0.03);
                        }

                        .v3-ref-node {
                            font-family: 'JetBrains Mono', monospace;
                            background: rgba(59, 130, 246, 0.1);
                            color: #3b82f6;
                            padding: 5px 12px;
                            border-radius: 8px;
                            font-size: 11px;
                            font-weight: 800;
                            display: inline-block;
                        }

                        .v3-status-badge {
                            font-size: 9px;
                            font-weight: 950;
                            text-transform: uppercase;
                            letter-spacing: 1px;
                            padding: 8px 16px;
                            border-radius: 50px;
                            border: 1px solid rgba(255, 255, 255, 0.1);
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
                                    class="sidebar-nav-item active mb-2"><span class="nav-icon">📦</span> Purchase
                                    Ledger</a>
                                <a href="${pageContext.request.contextPath}/buyer/schemes"
                                    class="sidebar-nav-item mb-2"><span class="nav-icon">🏛️</span> Institutional
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
                                    <div class="hamburger" onclick="toggleSidebar()">
                                        <span></span><span></span><span></span>
                                    </div>
                                    <div class="page-title">
                                        <h1 class="m-0 fw-950 text-white"
                                            style="font-size: 2.2rem; letter-spacing: -1.5px;">Purchase Ledger</h1>
                                        <span class="v3-page-subtitle text-info uppercase"
                                            style="letter-spacing: 1px; font-weight: 800;">📦 SUPPLY CHAIN TRACKING |
                                            PROCUREMENT HISTORY | ASSET INVENTORY</span>
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
                                                        alt="Profile"
                                                        style="width: 100%; height: 100%; object-fit: cover;">
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
                                <c:if test="${not empty successMessage}">
                                    <div class="alert alert-success border-0 rounded-4 mb-5 text-center fw-900 uppercase"
                                        style="background: rgba(34, 197, 94, 0.1); color: #22c55e; letter-spacing: 1px;">
                                        ${successMessage}</div>
                                </c:if>

                                <div class="d-flex justify-content-between align-items-center mb-5">
                                    <h4 class="fw-950 text-white m-0" style="letter-spacing: -1px;">⛓️ SUPPLY CHAIN
                                        TRACKING</h4>
                                    <div class="badge bg-info bg-opacity-10 text-info fw-950 px-3 py-2 rounded-pill x-small"
                                        style="letter-spacing: 1px;">${fn:length(orders)} REQUISITIONS REGISTERED</div>
                                </div>

                                <div class="v3-ledger-panel p-4">
                                    <div class="table-responsive">
                                        <table class="v3-data-table">
                                            <thead>
                                                <tr>
                                                    <th>REFERENCE</th>
                                                    <th>CROP BATCH</th>
                                                    <th>PRODUCER NODE</th>
                                                    <th>VALUATION</th>
                                                    <th>STATUS</th>
                                                    <th class="text-end">ACTIONS</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${orders}" var="o">
                                                    <tr>
                                                        <td>
                                                            <div class="v3-ref-node mb-2">ORD-${o.id}</div>
                                                            <div class="text-white-50 x-small fw-600">${o.timestamp}
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="text-white fw-950 mb-1">${o.listing.cropName}
                                                            </div>
                                                            <div class="text-info x-small fw-950 uppercase"
                                                                style="letter-spacing: 1px;">
                                                                <fmt:formatNumber value="${o.quantity}" />
                                                                ${o.listing.unit} LOAD
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="text-white fw-800 mb-1">${o.farmer.fullName}
                                                            </div>
                                                            <div class="text-white-50 x-small fw-600">RELIABILITY: <span
                                                                    class="text-success">${o.farmer.trustScore}%</span>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="text-white fw-950 fs-5 mb-1">₹
                                                                <fmt:formatNumber value="${o.amount}"
                                                                    minFractionDigits="2" />
                                                            </div>
                                                            <span
                                                                class="text-white-50 x-small fw-950 opacity-50 uppercase">${o.paymentMethod}</span>
                                                        </td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${o.orderStatus == 'PENDING'}"><span
                                                                        class="v3-status-badge"
                                                                        style="background: rgba(245, 158, 11, 0.1); color: #f59e0b;">AWAITING
                                                                        SHIPMENT</span></c:when>
                                                                <c:when test="${o.orderStatus == 'SHIPPED'}"><span
                                                                        class="v3-status-badge"
                                                                        style="background: rgba(59, 130, 246, 0.1); color: #3b82f6;">TRANSIT
                                                                        ACTIVE</span></c:when>
                                                                <c:when test="${o.orderStatus == 'DELIVERED'}"><span
                                                                        class="v3-status-badge"
                                                                        style="background: rgba(34, 197, 94, 0.1); color: #22c55e;">ASSETS
                                                                        RECEIVED</span></c:when>
                                                                <c:otherwise><span
                                                                        class="v3-status-badge">${o.orderStatus}</span>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                        <td class="text-end">
                                                            <div class="dropdown">
                                                                <button class="btn btn-quantum px-4 py-2"
                                                                    style="background: rgba(255,255,255,0.05) !important; color: #fff !important; box-shadow: none !important; border: 1px solid rgba(255,255,255,0.1) !important;"
                                                                    type="button"
                                                                    data-bs-toggle="dropdown">MANAGE</button>
                                                                <ul class="dropdown-menu dropdown-menu-dark border-0 shadow-lg p-3"
                                                                    style="border-radius: 20px; background: rgba(15, 23, 42, 0.9); backdrop-filter: blur(20px);">
                                                                    <li><a class="dropdown-item py-2 fw-800"
                                                                            href="${pageContext.request.contextPath}/chat?with=${o.farmer.id}">CONNECT
                                                                            SECURELY</a></li>
                                                                    <c:if
                                                                        test="${not empty o.listing.traceabilityRecord}">
                                                                        <li><a class="dropdown-item py-2 fw-800 text-info"
                                                                                href="${pageContext.request.contextPath}/traceability/${o.listing.traceabilityRecord.traceabilityId}">PROVENANCE
                                                                                DATA</a></li>
                                                                    </c:if>
                                                                    <c:if
                                                                        test="${o.orderStatus == 'DELIVERED' and not empty o.listing and not reviewedOrderIds.contains(o.id)}">
                                                                        <li>
                                                                            <button
                                                                                class="dropdown-item text-warning py-2 fw-800"
                                                                                onclick="openReviewModal('${o.id}', '${o.listing.id}', '${o.listing.cropName}')">⭐
                                                                                LEAVE REVIEW</button>
                                                                        </li>
                                                                    </c:if>
                                                                    <c:if test="${o.orderStatus == 'PENDING'}">
                                                                        <li>
                                                                            <hr class="dropdown-divider opacity-10">
                                                                        </li>
                                                                        <li>
                                                                            <form
                                                                                action="${pageContext.request.contextPath}/buyer/orders/cancel/${o.id}"
                                                                                method="post"><button type="submit"
                                                                                    class="dropdown-item text-danger py-2 fw-800">TERMINATE
                                                                                    REQUISITION</button></form>
                                                                        </li>
                                                                    </c:if>
                                                                </ul>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    <c:if test="${empty orders}">
                                        <div class="text-center py-5 opacity-25">
                                            <div class="display-1 mb-4">📦</div>
                                            <h4 class="fw-950 uppercase" style="letter-spacing: 3px;">NO PROCUREMENT
                                                STREAMS DETECTED</h4>
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
                            <div id="toastMessage" class="text-white-50 fw-600"
                                style="font-size: 11px; margin-top: 4px;">
                                Transaction has been successfully updated.</div>
                        </div>
                    </div>

                    <!-- Review Modal -->
                    <div class="modal fade" id="reviewModal" tabindex="-1" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content v3-modal-nexus border-0 overflow-hidden"
                                style="border-radius: 30px; background: rgba(15, 23, 42, 0.95); backdrop-filter: blur(20px);">
                                <div class="modal-header border-0 bg-surface p-4">
                                    <h5 class="modal-title fw-950 text-white" id="reviewTitle">⭐ RATE PRODUCT</h5>
                                    <button type="button" class="btn-close btn-close-white"
                                        data-bs-dismiss="modal"></button>
                                </div>
                                <div class="modal-body p-4 bg-dark">
                                    <input type="hidden" id="reviewOrderId">
                                    <div class="text-center mb-4">
                                        <div class="star-rating-input fs-1 text-warning mb-3" style="cursor: pointer;">
                                            <span onclick="setRating(1)">☆</span>
                                            <span onclick="setRating(2)">☆</span>
                                            <span onclick="setRating(3)">☆</span>
                                            <span onclick="setRating(4)">☆</span>
                                            <span onclick="setRating(5)">☆</span>
                                        </div>
                                        <div id="ratingLabel" class="text-white-50 fw-900 uppercase small"
                                            style="letter-spacing: 1px;">Select Rating</div>
                                    </div>
                                    <div class="mb-3">
                                        <label class="v3-identity-label">YOUR FEEDBACK</label>
                                        <textarea id="reviewComment" class="form-control v3-terminal-input" rows="4"
                                            placeholder="Share your experience with this crop..."
                                            style="background: rgba(15, 23, 42, 0.4); border: 1px solid rgba(255, 255, 255, 0.1); color: white;"></textarea>
                                    </div>
                                </div>
                                <div class="modal-footer border-0 bg-surface p-4">
                                    <button type="button"
                                        class="btn btn-primary w-100 py-3 rounded-pill fw-950 uppercase"
                                        onclick="submitReview()">SUBMIT REVIEW →</button>
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
                        const reviewModal = new bootstrap.Modal(document.getElementById('reviewModal'));

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

                        function openReviewModal(orderId, productId, productName) {
                            document.getElementById('reviewOrderId').value = orderId;
                            document.getElementById('reviewTitle').innerText = "⭐ RATE: " + productName.toUpperCase();
                            setRating(0);
                            document.getElementById('reviewComment').value = "";
                            reviewModal.show();
                        }

                        function setRating(r) {
                            currentRating = r;
                            const spans = document.querySelectorAll('.star-rating-input span');
                            spans.forEach((s, idx) => {
                                s.innerText = idx < r ? '★' : '☆';
                            });
                            const labels = ["Select Rating", "Poor", "Fair", "Good", "Very Good", "Excellent"];
                            document.getElementById('ratingLabel').innerText = labels[r];
                        }

                        function submitReview() {
                            if (currentRating === 0) {
                                showToast("DATA REQUIRED", "Please select a rating for the product.", true);
                                return;
                            }
                            const orderId = document.getElementById('reviewOrderId').value;
                            const comment = document.getElementById('reviewComment').value;
                            if (!orderId || orderId === "" || orderId === "null") {
                                showToast("SYSTEM ERROR", "Order context lost during transmission.", true);
                                return;
                            }
                            const csrfTokenMsg = document.querySelector('meta[name="_csrf"]');
                            const csrfHeaderMsg = document.querySelector('meta[name="_csrf_header"]');

                            const headers = { 'Content-Type': 'application/json' };
                            if (csrfTokenMsg && csrfHeaderMsg && csrfHeaderMsg.getAttribute('content')) {
                                headers[csrfHeaderMsg.getAttribute('content')] = csrfTokenMsg.getAttribute('content');
                            }

                            fetch('${pageContext.request.contextPath}/api/reviews/order/' + orderId, {
                                method: 'POST',
                                headers: headers,
                                body: JSON.stringify({ rating: currentRating, comment: comment })
                            })
                                .then(response => {
                                    if (response.ok) return response.json();
                                    return response.text().then(text => { throw new Error(text) });
                                })
                                .then(data => {
                                    showToast("FEEDBACK RECORDED", "Your evaluation has been committed to the ledger.");
                                    reviewModal.hide();
                                    setTimeout(() => location.reload(), 2000);
                                })
                                .catch(error => {
                                    console.error('Error:', error);
                                    let errorMsg = error.message;
                                    try {
                                        const errorObj = JSON.parse(errorMsg);
                                        errorMsg = errorObj.message || errorObj;
                                    } catch (e) { }
                                    showToast("TRANSMISSION ERROR", errorMsg, true);
                                });
                        }
                    </script>
                </body>

                </html>