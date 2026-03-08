<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
            <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8" />
                    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                    <title>📦 Global Sourcing Market - AGROPLANTER V3</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
                        rel="stylesheet">
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/voice-assistant.css" />
                    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800;900&display=swap"
                        rel="stylesheet">
                    <link rel="icon"
                        href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>📦</text></svg>" />
                    <script>
                        window.AgroplanterUser = "${user.id}";
                        window.AgroplanterUserFull = "${user.fullName}";
                        window.AgroplanterRole = "${user.role}";
                    </script>
                    <style>
                        .v3-search-nexus {
                            background: rgba(15, 23, 42, 0.4);
                            border: 1px solid rgba(59, 130, 246, 0.2);
                            border-radius: 100px;
                            padding: 10px 10px 10px 40px;
                            display: flex;
                            align-items: center;
                            gap: 20px;
                            backdrop-filter: blur(40px);
                            margin-bottom: 50px;
                            transition: 0.3s;
                        }

                        .v3-search-nexus:focus-within {
                            border-color: #3b82f6;
                            box-shadow: 0 0 40px rgba(59, 130, 246, 0.2);
                        }

                        .v3-search-nexus input {
                            background: none;
                            border: none;
                            color: white;
                            flex: 1;
                            outline: none;
                            font-family: 'Outfit';
                            font-weight: 500;
                            font-size: 18px;
                        }

                        .v3-sourcing-card {
                            background: rgba(15, 23, 42, 0.4);
                            border: 1px solid rgba(255, 255, 255, 0.05);
                            border-radius: 35px;
                            padding: 40px;
                            height: 100%;
                            transition: 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
                            backdrop-filter: blur(30px);
                            display: flex;
                            flex-direction: column;
                            justify-content: space-between;
                        }

                        .v3-sourcing-card:hover {
                            transform: translateY(-12px);
                            border-color: rgba(59, 130, 246, 0.3);
                            background: rgba(15, 23, 42, 0.6);
                        }

                        .v3-valuation-display {
                            font-size: 32px;
                            font-weight: 950;
                            color: #3b82f6;
                            letter-spacing: -1.5px;
                        }

                        .v3-asset-node {
                            background: rgba(255, 255, 255, 0.02);
                            border: 1px solid rgba(255, 255, 255, 0.05);
                            border-radius: 20px;
                            padding: 25px;
                        }

                        .v3-identity-label {
                            font-size: 9px;
                            font-weight: 950;
                            color: #475569;
                            letter-spacing: 2px;
                            text-transform: uppercase;
                            margin-bottom: 10px;
                            display: block;
                        }

                        .v3-terminal-input {
                            background: rgba(15, 23, 42, 0.6) !important;
                            border: 1px solid rgba(255, 255, 255, 0.05) !important;
                            border-radius: 12px !important;
                            color: #fff !important;
                            padding: 12px 20px !important;
                            font-family: 'Outfit' !important;
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
                                    class="sidebar-nav-item active mb-2"><span class="nav-icon">🛒</span> Global
                                    Market</a>
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
                                            style="font-size: 2.2rem; letter-spacing: -1.5px;">Global Sourcing</h1>
                                        <span class="v3-page-subtitle text-info uppercase"
                                            style="letter-spacing: 1px; font-weight: 800;">🌐 VERIFIED CROP ASSETS |
                                            REAL-TIME TRACEABILITY | SECURE NODE</span>
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
                                <form action="${pageContext.request.contextPath}/buyer/marketplace" method="get">
                                    <div class="v3-search-nexus">
                                        <span class="fs-4">🔍</span>
                                        <input type="text" name="search"
                                            placeholder="Search premium crop telemetery (e.g. Organic, Batch ID)..."
                                            value="${search}">
                                        <button type="submit" class="btn btn-quantum px-5 me-2"
                                            style="background: #3b82f6 !important;">ANALYZE MARKET</button>
                                    </div>
                                </form>

                                <div class="d-flex justify-content-between align-items-center mb-5">
                                    <h4 class="fw-950 text-white m-0" style="letter-spacing: -1px;">📡 VERIFIED CROP
                                        STREAMS</h4>
                                    <div class="badge bg-info bg-opacity-10 text-info fw-950 px-3 py-2 rounded-pill x-small"
                                        style="letter-spacing: 1px;">${fn:length(listings)} BATCHES DETECTED</div>
                                </div>

                                <div class="row g-5">
                                    <c:forEach items="${listings}" var="l">
                                        <div class="col-xl-4 col-md-6">
                                            <div class="v3-sourcing-card">
                                                <div>
                                                    <div class="d-flex justify-content-between align-items-start mb-4">
                                                        <h3 class="fw-950 text-white m-0" style="letter-spacing: -1px;">
                                                            ${l.cropName}</h3>
                                                        <span
                                                            class="badge bg-success bg-opacity-10 text-success fw-950 px-3 py-2 rounded-pill"
                                                            style="font-size: 8px; border: 1px solid rgba(34, 197, 94, 0.2);">ACTIVE</span>
                                                    </div>
                                                    <div class="v3-valuation-display mb-4">₹
                                                        <fmt:formatNumber value="${l.pricePerUnit}" /> <span
                                                            class="text-white-50 fs-6 fw-normal">/ ${l.unit}</span>
                                                    </div>

                                                    <div class="v3-asset-node mb-5">
                                                        <div class="d-flex justify-content-between mb-3">
                                                            <span
                                                                class="v3-identity-label mb-0 opacity-50">QUANTITY</span>
                                                            <span class="fw-950 text-white">${l.quantity}
                                                                ${l.unit}</span>
                                                        </div>
                                                        <div class="d-flex justify-content-between mb-3">
                                                            <span
                                                                class="v3-identity-label mb-0 opacity-50">ORIGIN</span>
                                                            <span
                                                                class="fw-950 text-white text-end">${l.location}</span>
                                                        </div>
                                                        <div class="d-flex justify-content-between mb-3">
                                                            <span
                                                                class="v3-identity-label mb-0 opacity-50">PRODUCER</span>
                                                            <span
                                                                class="fw-950 text-white d-flex align-items-center gap-2">${l.farmer.fullName}
                                                                <c:if test="${l.farmer.verified}"><span
                                                                        class="badge bg-info p-1">✔️</span></c:if>
                                                            </span>
                                                        </div>
                                                        <div class="d-flex justify-content-between">
                                                            <span class="v3-identity-label mb-0 opacity-50">TRUST
                                                                SCORE</span>
                                                            <span
                                                                class="fw-950 text-info">${l.farmer.trustScore}%</span>
                                                        </div>
                                                        <div class="trust-bar mt-2" style="height: 4px;">
                                                            <div class="trust-progress"
                                                                style="width: ${l.farmer.trustScore}%; background: #3b82f6;">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="d-flex flex-column gap-3">
                                                    <c:if test="${not empty l.traceabilityRecord}">
                                                        <a href="${pageContext.request.contextPath}/traceability/${l.traceabilityRecord.traceabilityId}"
                                                            class="btn btn-quantum text-center py-3"
                                                            style="background: rgba(16, 185, 129, 0.1) !important; border: 1px solid rgba(16, 185, 129, 0.2) !important; color: #10b981 !important;">
                                                            🌐 VIEW PROVENANCE PROTOCOL
                                                        </a>
                                                    </c:if>
                                                    <div class="d-flex gap-3">
                                                        <a href="${pageContext.request.contextPath}/buyer/contact-farmer/${l.id}"
                                                            class="btn btn-quantum flex-fill text-center"
                                                            style="background: rgba(255,255,255,0.05) !important; color: #fff !important; box-shadow: none !important;">CONTACT</a>
                                                        <button class="btn btn-quantum flex-fill text-center"
                                                            style="background: #3b82f6 !important;"
                                                            data-bs-toggle="modal"
                                                            data-bs-target="#buyModal${l.id}">PROCURE →</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- V3 Procurement Modal -->
                                        <div class="modal fade" id="buyModal${l.id}" tabindex="-1">
                                            <div class="modal-dialog modal-dialog-centered">
                                                <div class="modal-content overflow-hidden border-0"
                                                    style="border-radius: 40px; background: #020617; border: 1px solid rgba(255,255,255,0.05) !important;">
                                                    <div class="modal-header border-0 p-5 pb-0">
                                                        <h3 class="fw-950 text-white m-0"
                                                            style="letter-spacing: -1.5px;">📦 PROCUREMENT PROTOCOL</h3>
                                                        <button type="button" class="btn-close btn-close-white"
                                                            data-bs-dismiss="modal"></button>
                                                    </div>
                                                    <form
                                                        action="${pageContext.request.contextPath}/buyer/purchase/${l.id}"
                                                        method="post">
                                                        <div class="modal-body p-5 pt-4">
                                                            <c:if test="${not empty l.traceabilityRecord}">
                                                                <div class="p-4 rounded-4 mb-4"
                                                                    style="background: rgba(16, 185, 129, 0.05); border: 1px solid rgba(16, 185, 129, 0.2);">
                                                                    <div
                                                                        class="d-flex justify-content-between align-items-center mb-3">
                                                                        <span
                                                                            class="v3-identity-label text-success mb-0">🛡️
                                                                            PROVENANCE VERIFIED</span>
                                                                        <a href="${pageContext.request.contextPath}/traceability/${l.traceabilityRecord.traceabilityId}"
                                                                            class="text-info fw-950 uppercase"
                                                                            style="font-size: 9px; letter-spacing: 1px; text-decoration: none;">FULL
                                                                            REPORT →</a>
                                                                    </div>
                                                                    <div class="row g-2">
                                                                        <div class="col-4">
                                                                            <div class="small fw-800 text-white-50 uppercase"
                                                                                style="font-size: 8px;">PLANTED</div>
                                                                            <div class="text-white fw-950 small">
                                                                                ${l.traceabilityRecord.plantingDate}
                                                                            </div>
                                                                        </div>
                                                                        <div
                                                                            class="col-4 border-start border-white border-opacity-10 ps-3">
                                                                            <div class="small fw-800 text-white-50 uppercase"
                                                                                style="font-size: 8px;">HARVESTED</div>
                                                                            <div class="text-white fw-950 small">
                                                                                ${l.traceabilityRecord.harvestDate}
                                                                            </div>
                                                                        </div>
                                                                        <div
                                                                            class="col-4 border-start border-white border-opacity-10 ps-3">
                                                                            <div class="small fw-800 text-white-50 uppercase"
                                                                                style="font-size: 8px;">PROTOCOL</div>
                                                                            <div
                                                                                class="text-white fw-950 small text-truncate">
                                                                                ${l.traceabilityRecord.fertilizerUsage}
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </c:if>

                                                            <div class="row g-4 mb-4">
                                                                <div class="col-md-6">
                                                                    <span class="v3-identity-label">REQUISITION VOLUME
                                                                        (${l.unit})</span>
                                                                    <input type="number" name="quantity"
                                                                        class="form-control v3-terminal-input"
                                                                        min="0.01" max="${l.quantity}" value="1"
                                                                        step="0.01" required />
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <span class="v3-identity-label">UNIT COST
                                                                        (LOCKED)</span>
                                                                    <div class="v3-terminal-input opacity-75">
                                                                        ₹${l.pricePerUnit}</div>
                                                                </div>
                                                            </div>
                                                            <div class="mb-4">
                                                                <span class="v3-identity-label">DELIVERY
                                                                    DESTINATION</span>
                                                                <textarea name="shippingAddress"
                                                                    class="form-control v3-terminal-input" rows="3"
                                                                    placeholder="Specify full logistics point..."
                                                                    required></textarea>
                                                            </div>
                                                            <span class="v3-identity-label mb-3">SETTLEMENT
                                                                METHOD</span>
                                                            <div class="d-flex gap-2 mb-4">
                                                                <input type="radio" class="btn-check"
                                                                    name="paymentMethod" id="upi${l.id}" value="UPI"
                                                                    checked
                                                                    onchange="togglePaymentDetails('${l.id}', 'upi')">
                                                                <label
                                                                    class="btn btn-quantum flex-fill py-3 settlement-btn"
                                                                    for="upi${l.id}">📱 UPI</label>
                                                                <input type="radio" class="btn-check"
                                                                    name="paymentMethod" id="card${l.id}" value="CARD"
                                                                    onchange="togglePaymentDetails('${l.id}', 'card')">
                                                                <label
                                                                    class="btn btn-quantum flex-fill py-3 settlement-btn"
                                                                    for="card${l.id}">💳 CARD</label>
                                                            </div>

                                                            <style>
                                                                .settlement-btn {
                                                                    background: rgba(255, 255, 255, 0.02);
                                                                    color: #fff;
                                                                    border: 1px solid rgba(255, 255, 255, 0.1);
                                                                    box-shadow: none;
                                                                    transition: all 0.3s ease;
                                                                }

                                                                .btn-check:checked+.settlement-btn {
                                                                    background: rgba(59, 130, 246, 0.2) !important;
                                                                    border-color: #3b82f6 !important;
                                                                    color: #3b82f6 !important;
                                                                    box-shadow: 0 0 20px rgba(59, 130, 246, 0.2);
                                                                }
                                                            </style>

                                                            <!-- UPI Sub-options -->
                                                            <div id="upi_details_${l.id}" class="payment-details mb-4">
                                                                <span class="v3-identity-label mb-2">CHOOSE
                                                                    GATEWAY</span>
                                                                <div class="d-flex gap-2">
                                                                    <div class="flex-fill p-3 rounded-4 text-center gateway-node"
                                                                        style="background: rgba(255,255,255,0.02); border: 1px solid rgba(255,255,255,0.1); cursor: pointer;"
                                                                        onclick="selectGateway(this)">
                                                                        <img src="https://img.icons8.com/color/48/google-pay.png"
                                                                            style="width: 24px;" alt="GPay"><br><span
                                                                            class="x-small fw-800 mt-1 d-block opacity-50">GPAY</span>
                                                                    </div>
                                                                    <div class="flex-fill p-3 rounded-4 text-center gateway-node"
                                                                        style="background: rgba(255,255,255,0.02); border: 1px solid rgba(255,255,255,0.1); cursor: pointer;"
                                                                        onclick="selectGateway(this)">
                                                                        <img src="https://img.icons8.com/color/48/phone-pe.png"
                                                                            style="width: 24px;" alt="PhonePe"><br><span
                                                                            class="x-small fw-800 mt-1 d-block opacity-50">PHONEPE</span>
                                                                    </div>
                                                                    <div class="flex-fill p-3 rounded-4 text-center gateway-node"
                                                                        style="background: rgba(255,255,255,0.02); border: 1px solid rgba(255,255,255,0.1); cursor: pointer;"
                                                                        onclick="selectGateway(this)">
                                                                        <img src="https://img.icons8.com/color/48/paytm.png"
                                                                            style="width: 24px;" alt="Paytm"><br><span
                                                                            class="x-small fw-800 mt-1 d-block opacity-50">PAYTM</span>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <!-- Card Details Section -->
                                                            <div id="card_details_${l.id}"
                                                                class="payment-details mb-4 d-none">
                                                                <div class="mb-3">
                                                                    <span class="v3-identity-label">CARD NUMBER</span>
                                                                    <input type="text" name="cardNumber"
                                                                        id="cardNumber_${l.id}"
                                                                        class="form-control v3-terminal-input"
                                                                        placeholder="0000 0000 0000 0000">
                                                                </div>
                                                                <div class="row g-3">
                                                                    <div class="col-7">
                                                                        <span class="v3-identity-label">EXPIRY</span>
                                                                        <input type="text" name="cardExpiry"
                                                                            id="cardExpiry_${l.id}"
                                                                            class="form-control v3-terminal-input"
                                                                            placeholder="MM/YY">
                                                                    </div>
                                                                    <div class="col-5">
                                                                        <span class="v3-identity-label">CVV</span>
                                                                        <input type="password" name="cardCvv"
                                                                            id="cardCvv_${l.id}"
                                                                            class="form-control v3-terminal-input"
                                                                            placeholder="***">
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="p-3 rounded-4 text-info x-small text-center fw-950 uppercase mb-5"
                                                                style="background: rgba(59, 130, 246, 0.1); border: 1px solid rgba(59, 130, 246, 0.2); letter-spacing: 2px;">
                                                                ESCROW PROTECTION ENABLED</div>
                                                        </div>
                                                        <div class="modal-footer border-0 p-5 pt-0">
                                                            <button type="submit" class="btn btn-quantum w-100 py-3"
                                                                style="background: #3b82f6 !important;">FINALIZE
                                                                PROCUREMENT →</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </main>
                    </div>

                    <script src="${pageContext.request.contextPath}/js/voice-assistant.js"></script>
                    <script src="${pageContext.request.contextPath}/js/background-switcher.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                    <script>
                        function toggleSidebar() { document.getElementById('sidebar').classList.toggle('open'); }

                        function togglePaymentDetails(listingId, method) {
                            const upiDetails = document.getElementById("upi_details_" + listingId);
                            const cardDetails = document.getElementById("card_details_" + listingId);

                            if (method === 'upi') {
                                if (upiDetails) upiDetails.classList.remove('d-none');
                                if (cardDetails) cardDetails.classList.add('d-none');
                            } else {
                                if (upiDetails) upiDetails.classList.add('d-none');
                                if (cardDetails) cardDetails.classList.remove('d-none');
                            }
                        }

                        function selectGateway(element) {
                            const siblings = element.parentElement.children;
                            for (let sibling of siblings) {
                                sibling.style.background = 'rgba(255,255,255,0.02)';
                                sibling.style.borderColor = 'rgba(255,255,255,0.1)';
                                sibling.querySelector('span').style.opacity = '0.5';
                            }
                            element.style.background = 'rgba(59, 130, 246, 0.1)';
                            element.style.borderColor = 'rgba(59, 130, 246, 0.4)';
                            element.querySelector('span').style.opacity = '1';
                        }
                    </script>
                </body>

                </html>