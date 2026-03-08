<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>🏢 Industrial Intelligence - AGROPLANTER B2B</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/voice-assistant.css">
                <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800;900&display=swap"
                    rel="stylesheet">
                <link rel="icon"
                    href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🏢</text></svg>" />
                <script>
                    window.AgroplanterUser = "${user.id}";
                    window.AgroplanterUserFull = "${user.fullName}";
                    window.AgroplanterRole = "${user.role}";
                </script>
                <style>
                    .v3-b2b-hero {
                        background: linear-gradient(135deg, rgba(59, 130, 246, 0.4) 0%, rgba(29, 78, 216, 0.4) 100%);
                        border: 1px solid rgba(59, 130, 246, 0.2);
                        border-radius: 40px;
                        padding: 60px;
                        margin-bottom: 50px;
                        backdrop-filter: blur(40px);
                        position: relative;
                        overflow: hidden;
                    }

                    .v3-b2b-hero::after {
                        content: '🏭';
                        position: absolute;
                        right: -30px;
                        bottom: -30px;
                        font-size: 200px;
                        opacity: 0.03;
                        transform: rotate(15deg);
                    }

                    .v3-surplus-node {
                        background: rgba(15, 23, 42, 0.4);
                        border: 1px solid rgba(255, 255, 255, 0.05);
                        border-radius: 40px;
                        padding: 40px;
                        margin-bottom: 30px;
                        backdrop-filter: blur(30px);
                        transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
                        display: flex;
                        flex-direction: column;
                        height: 100%;
                    }

                    .v3-surplus-node:hover {
                        transform: translateY(-15px) scale(1.02);
                        background: rgba(15, 23, 42, 0.6);
                        border-color: rgba(59, 130, 246, 0.3);
                        box-shadow: 0 30px 60px rgba(0, 0, 0, 0.5);
                    }

                    .v3-clearance-badge {
                        background: linear-gradient(90deg, #ef4444, #f59e0b);
                        color: white;
                        padding: 8px 20px;
                        border-radius: 15px;
                        font-size: 10px;
                        font-weight: 950;
                        letter-spacing: 2px;
                        text-transform: uppercase;
                        box-shadow: 0 10px 20px rgba(239, 68, 68, 0.3);
                    }

                    .v3-trust-pill {
                        background: rgba(16, 185, 129, 0.1);
                        color: #10b981;
                        border: 1px solid rgba(16, 185, 129, 0.2);
                        font-size: 8px;
                        padding: 4px 12px;
                        border-radius: 100px;
                        font-weight: 950;
                        text-transform: uppercase;
                        letter-spacing: 1px;
                        width: fit-content;
                    }

                    .v3-price-tag {
                        color: #fbbf24;
                        font-size: 32px;
                        font-weight: 950;
                        letter-spacing: -1.5px;
                    }

                    .v3-original-price {
                        text-decoration: line-through;
                        color: #475569;
                        font-size: 13px;
                        font-weight: 700;
                    }

                    .v3-action-btn {
                        background: rgba(59, 130, 246, 0.1);
                        border: 1px solid rgba(59, 130, 246, 0.2);
                        color: #3b82f6;
                        padding: 20px;
                        border-radius: 20px;
                        font-size: 11px;
                        font-weight: 950;
                        text-transform: uppercase;
                        text-decoration: none;
                        transition: 0.3s;
                        letter-spacing: 2px;
                        width: 100%;
                    }

                    .v3-action-btn:hover {
                        background: #3b82f6;
                        color: #fff;
                        box-shadow: 0 15px 30px rgba(59, 130, 246, 0.3);
                        transform: translateY(-2px);
                    }

                    .v3-data-grid {
                        display: grid;
                        grid-template-columns: 1fr 1fr;
                        gap: 15px;
                        margin: 25px 0;
                    }

                    .v3-data-box {
                        background: rgba(0, 0, 0, 0.2);
                        padding: 20px;
                        border-radius: 20px;
                        border: 1px solid rgba(255, 255, 255, 0.03);
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
                                        style="font-size: 10px; color: #3b82f6; font-weight: 800; letter-spacing: 1px;">B2B
                                        TERMINAL V3</span>
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
                            <a href="${pageContext.request.contextPath}/b2b/dashboard"
                                class="sidebar-nav-item active mb-2"><span class="nav-icon">🏬</span> Surplus Hub</a>
                            <a href="${pageContext.request.contextPath}/chat" class="sidebar-nav-item mb-2"><span
                                    class="nav-icon">💬</span> Secure Chat</a>
                            <a href="${pageContext.request.contextPath}/buyer/market-prices"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">📈</span> Mandi Intel</a>
                            <a href="${pageContext.request.contextPath}/buyer/orders"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">📦</span> Purchase Ledger</a>
                            <a href="${pageContext.request.contextPath}/buyer/schemes"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">🏛️</span> Institutional Feed</a>
                            <c:if test="${user.role eq 'MENTOR'}">
                                <div class="nav-section-title px-2 mt-4 mb-2"
                                    style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">
                                    PROFESSIONAL</div>
                                <a href="${pageContext.request.contextPath}/mentor/dashboard"
                                    class="sidebar-nav-item mb-2" style="color: #fbbf24;"><span
                                        class="nav-icon">🎓</span> Advisor Workspace</a>
                            </c:if>

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
                                        style="font-size: 2.2rem; letter-spacing: -1.5px;">Industrial Surplus Hub</h1>
                                    <span class="v3-page-subtitle text-info uppercase"
                                        style="letter-spacing: 1px; font-weight: 800;">
                                        🏢 REDIRECTION TERMINAL | SECTOR: INDUSTRIAL | B2B: SECURED
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
                                            style="font-size: 9px; color: #3b82f6; letter-spacing: 1px;">INDUSTRIAL
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
                                                    ${fn:substring(user.fullName, 0, 1)}
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                        </header>

                        <div class="page-body px-5 py-5">
                            <c:if test="${not empty param.success}">
                                <div class="alert alert-success border-0 bg-success bg-opacity-10 text-success rounded-4 mb-5 p-4 fw-800 uppercase x-small"
                                    style="letter-spacing: 1px;">
                                    ⚡ PROTOCOL UPDATE: Bulk requisition processed successfully.
                                </div>
                            </c:if>

                            <div class="v3-b2b-hero">
                                <div class="row align-items-center">
                                    <div class="col-md-9">
                                        <h1 class="fw-950 text-white mb-3 display-4" style="letter-spacing: -3px;">
                                            Industrial Asset Redirection</h1>
                                        <p class="text-info fw-800 uppercase x-small mb-0"
                                            style="letter-spacing: 2px; opacity: 0.8;">
                                            ACQUIRE HIGH-VOLUME SURPLUS INVENTORY AT UNDERVALUED CLEARANCE RATES
                                            DIRECTLY FROM VERIFIED FARMER NODES.
                                        </p>
                                    </div>
                                </div>
                            </div>

                            <div class="row g-5">
                                <c:forEach var="item" items="${surplusListings}">
                                    <div class="col-lg-4 col-md-6">
                                        <div class="v3-surplus-node">
                                            <div class="d-flex justify-content-between align-items-start mb-5">
                                                <div class="d-flex align-items-center gap-3">
                                                    <div
                                                        style="width: 60px; height: 60px; background: rgba(59,130,246,0.1); border-radius: 20px; display: flex; align-items:center; justify-content:center; font-size: 28px; border: 1px solid rgba(59,130,246,0.2);">
                                                        📦</div>
                                                    <div>
                                                        <h5 class="fw-950 text-white fs-4 m-0"
                                                            style="letter-spacing: -1px;">${item.cropName}</h5>
                                                        <div class="v3-trust-pill mt-2">TRUST SCORE:
                                                            ${item.farmer.trustScore}%</div>
                                                    </div>
                                                </div>
                                                <span class="v3-clearance-badge">CLEARANCE</span>
                                            </div>

                                            <div class="mb-4 pt-2">
                                                <label class="trust-label uppercase d-block mb-1"
                                                    style="font-size: 8px; letter-spacing: 2px; color: #475569;">ORIGIN
                                                    NODE (FARMER)</label>
                                                <div class="text-white fw-950 fs-6">👨‍🌾
                                                    ${item.farmer.fullName.toUpperCase()}</div>
                                                <div class="text-white-50 x-small fw-600 uppercase mt-1"
                                                    style="letter-spacing: 1px;">${item.location.toUpperCase()}</div>
                                            </div>

                                            <div class="v3-data-grid">
                                                <div class="v3-data-box">
                                                    <label class="trust-label uppercase d-block mb-1"
                                                        style="font-size: 8px; letter-spacing: 1.5px; color: #475569;">AVAILABLE
                                                        VOLUME</label>
                                                    <div class="text-info fw-950 fs-5">${item.quantity} ${item.unit}
                                                    </div>
                                                </div>
                                                <div class="v3-data-box">
                                                    <label class="trust-label uppercase d-block mb-1"
                                                        style="font-size: 8px; letter-spacing: 1.5px; color: #475569;">TOTAL
                                                        VALUATION</label>
                                                    <div class="text-success fw-950 fs-5">₹${item.clearancePrice *
                                                        item.quantity}</div>
                                                </div>
                                            </div>

                                            <div class="mt-auto pt-4 border-top border-white border-opacity-5">
                                                <div class="d-flex justify-content-between align-items-end mb-4">
                                                    <div>
                                                        <div class="v3-original-price">
                                                            ₹${item.pricePerUnit}/${item.unit}</div>
                                                        <div class="v3-price-tag">₹${item.clearancePrice}<span
                                                                style="font-size: 14px; opacity: 0.6; font-weight: 700; margin-left: 5px;">/${item.unit}</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="d-flex flex-column gap-2">
                                                    <c:if test="${not empty item.traceabilityRecord}">
                                                        <a href="${pageContext.request.contextPath}/traceability/${item.traceabilityRecord.traceabilityId}"
                                                            class="v3-action-btn text-center"
                                                            style="background: rgba(16, 185, 129, 0.1); border-color: rgba(16, 185, 129, 0.2); color: #10b981;">
                                                            🚜 VIEW BATCH TRACEABILITY
                                                        </a>
                                                    </c:if>
                                                    <button type="button" class="v3-action-btn" data-bs-toggle="modal"
                                                        data-bs-target="#procurementModal${item.id}">ACQUIRE INVENTORY
                                                        →</button>

                                                    <!-- Procurement Modal -->
                                                    <div class="modal fade" id="procurementModal${item.id}"
                                                        tabindex="-1" aria-hidden="true">
                                                        <div class="modal-dialog modal-dialog-centered modal-lg">
                                                            <div class="modal-content"
                                                                style="background: #0f172a; border: 1px solid rgba(59, 130, 246, 0.2); border-radius: 40px; overflow: hidden; color: white;">
                                                                <form
                                                                    action="${pageContext.request.contextPath}/b2b/purchase/${item.id}"
                                                                    method="post">
                                                                    <div class="modal-header border-0 p-5 pb-0">
                                                                        <h3 class="fw-950 m-0"
                                                                            style="letter-spacing: -2px;">⚡ Industrial
                                                                            Acquisition</h3>
                                                                        <button type="button"
                                                                            class="btn-close btn-close-white"
                                                                            data-bs-dismiss="modal"></button>
                                                                    </div>
                                                                    <div class="modal-body p-5">
                                                                        <div class="v3-asset-preview p-4 rounded-4 mb-4"
                                                                            style="background: rgba(255,255,255,0.03); border: 1px solid rgba(255,255,255,0.05);">
                                                                            <div
                                                                                class="d-flex justify-content-between align-items-center">
                                                                                <div>
                                                                                    <span
                                                                                        class="v3-identity-label">ASSET:
                                                                                        ${item.cropName}</span>
                                                                                    <div class="fw-950 fs-5">
                                                                                        ${item.quantity} ${item.unit}
                                                                                    </div>
                                                                                </div>
                                                                                <div class="v3-valuation-display">
                                                                                    ₹${item.clearancePrice *
                                                                                    item.quantity}</div>
                                                                            </div>
                                                                        </div>

                                                                        <c:if
                                                                            test="${not empty item.traceabilityRecord}">
                                                                            <div class="p-4 rounded-4 mb-4"
                                                                                style="background: rgba(16, 185, 129, 0.05); border: 1px solid rgba(16, 185, 129, 0.2);">
                                                                                <div
                                                                                    class="d-flex justify-content-between align-items-center mb-3">
                                                                                    <span
                                                                                        class="v3-identity-label text-success mb-0">🛡️
                                                                                        PROVENANCE VERIFIED</span>
                                                                                    <a href="${pageContext.request.contextPath}/traceability/${item.traceabilityRecord.traceabilityId}"
                                                                                        class="text-info fw-950 uppercase"
                                                                                        style="font-size: 9px; letter-spacing: 1px; text-decoration: none;">FULL
                                                                                        BATCH DATA →</a>
                                                                                </div>
                                                                                <div class="row g-2">
                                                                                    <div class="col-4">
                                                                                        <div class="small fw-800 text-white-50 uppercase"
                                                                                            style="font-size: 8px;">
                                                                                            PLANTED</div>
                                                                                        <div
                                                                                            class="text-white fw-950 small">
                                                                                            ${item.traceabilityRecord.plantingDate}
                                                                                        </div>
                                                                                    </div>
                                                                                    <div
                                                                                        class="col-4 border-start border-white border-opacity-10 ps-3">
                                                                                        <div class="small fw-800 text-white-50 uppercase"
                                                                                            style="font-size: 8px;">
                                                                                            HARVESTED</div>
                                                                                        <div
                                                                                            class="text-white fw-950 small">
                                                                                            ${item.traceabilityRecord.harvestDate}
                                                                                        </div>
                                                                                    </div>
                                                                                    <div
                                                                                        class="col-4 border-start border-white border-opacity-10 ps-3">
                                                                                        <div class="small fw-800 text-white-50 uppercase"
                                                                                            style="font-size: 8px;">
                                                                                            IRRIGATION</div>
                                                                                        <div
                                                                                            class="text-white fw-950 small text-truncate">
                                                                                            ${item.traceabilityRecord.irrigationMethod}
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </c:if>


                                                                        <div class="mb-4">
                                                                            <span class="v3-identity-label">LOGISTICS
                                                                                DESTINATION</span>
                                                                            <textarea name="shippingAddress"
                                                                                class="form-control v3-terminal-input"
                                                                                rows="3"
                                                                                placeholder="Specify full industrial drop point..."
                                                                                required></textarea>
                                                                        </div>

                                                                        <span class="v3-identity-label mb-3">SETTLEMENT
                                                                            PROTOCOL</span>
                                                                        <div class="d-flex gap-2 mb-4">
                                                                            <input type="radio" class="btn-check"
                                                                                name="paymentMethod" id="upi${item.id}"
                                                                                value="UPI" checked
                                                                                onchange="togglePaymentDetails('${item.id}', 'upi')">
                                                                            <label
                                                                                class="btn btn-quantum flex-fill py-3 settlement-btn"
                                                                                for="upi${item.id}">📱 UPI</label>
                                                                            <input type="radio" class="btn-check"
                                                                                name="paymentMethod" id="card${item.id}"
                                                                                value="CARD"
                                                                                onchange="togglePaymentDetails('${item.id}', 'card')">
                                                                            <label
                                                                                class="btn btn-quantum flex-fill py-3 settlement-btn"
                                                                                for="card${item.id}">💳 CARD</label>
                                                                        </div>

                                                                        <!-- UPI Sub-options -->
                                                                        <div id="upi_details_${item.id}"
                                                                            class="payment-details mb-4">
                                                                            <span class="v3-identity-label mb-2">CHOOSE
                                                                                GATEWAY</span>
                                                                            <div class="d-flex gap-2">
                                                                                <div class="flex-fill p-3 rounded-4 text-center gateway-node"
                                                                                    style="background: rgba(255,255,255,0.02); border: 1px solid rgba(255,255,255,0.1); cursor: pointer;"
                                                                                    onclick="selectGateway(this)">
                                                                                    <img src="https://img.icons8.com/color/48/google-pay.png"
                                                                                        style="width: 24px;"
                                                                                        alt="GPay"><br><span
                                                                                        class="x-small fw-800 mt-1 d-block opacity-50">GPAY</span>
                                                                                </div>
                                                                                <div class="flex-fill p-3 rounded-4 text-center gateway-node"
                                                                                    style="background: rgba(255,255,255,0.02); border: 1px solid rgba(255,255,255,0.1); cursor: pointer;"
                                                                                    onclick="selectGateway(this)">
                                                                                    <img src="https://img.icons8.com/color/48/phone-pe.png"
                                                                                        style="width: 24px;"
                                                                                        alt="PhonePe"><br><span
                                                                                        class="x-small fw-800 mt-1 d-block opacity-50">PHONEPE</span>
                                                                                </div>
                                                                                <div class="flex-fill p-3 rounded-4 text-center gateway-node"
                                                                                    style="background: rgba(255,255,255,0.02); border: 1px solid rgba(255,255,255,0.1); cursor: pointer;"
                                                                                    onclick="selectGateway(this)">
                                                                                    <img src="https://img.icons8.com/color/48/paytm.png"
                                                                                        style="width: 24px;"
                                                                                        alt="Paytm"><br><span
                                                                                        class="x-small fw-800 mt-1 d-block opacity-50">PAYTM</span>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <!-- Card Details Section -->
                                                                        <div id="card_details_${item.id}"
                                                                            class="payment-details mb-4 d-none">
                                                                            <div class="mb-3">
                                                                                <span class="v3-identity-label">CARD
                                                                                    NUMBER</span>
                                                                                <input type="text" name="cardNumber"
                                                                                    class="form-control v3-terminal-input"
                                                                                    placeholder="0000 0000 0000 0000">
                                                                            </div>
                                                                            <div class="row g-3">
                                                                                <div class="col-7">
                                                                                    <span
                                                                                        class="v3-identity-label">EXPIRY</span>
                                                                                    <input type="text" name="cardExpiry"
                                                                                        class="form-control v3-terminal-input"
                                                                                        placeholder="MM/YY">
                                                                                </div>
                                                                                <div class="col-5">
                                                                                    <span
                                                                                        class="v3-identity-label">CVV</span>
                                                                                    <input type="password"
                                                                                        name="cardCvv"
                                                                                        class="form-control v3-terminal-input"
                                                                                        placeholder="***">
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <div class="p-3 rounded-4 text-info x-small text-center fw-950 uppercase"
                                                                            style="background: rgba(59, 130, 246, 0.1); border: 1px solid rgba(59, 130, 246, 0.2); letter-spacing: 2px;">
                                                                            ESCROW PROTECTION ENABLED</div>
                                                                    </div>
                                                                    <div class="modal-footer border-0 p-5 pt-0">
                                                                        <button type="submit"
                                                                            class="btn btn-quantum w-100 py-3"
                                                                            style="background: #3b82f6 !important;">CONFIRM
                                                                            ACQUISITION →</button>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>

                                <c:if test="${empty surplusListings}">
                                    <div class="col-12 py-5 text-center">
                                        <div class="display-1 opacity-10 mb-5">🏭</div>
                                        <div class="text-white-50 fw-950 uppercase"
                                            style="letter-spacing: 4px; font-size: 16px;">NO SURPLUS REQUISITIONS
                                            DETECTED</div>
                                        <div class="text-muted small fw-800 uppercase mt-3"
                                            style="font-size: 10px; letter-spacing: 2px;">B2B SECTOR IS CURRENTLY AT
                                            EQUILIBRIUM</div>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </main>
                </div>

                <script src="${pageContext.request.contextPath}/js/background-switcher.js"></script>
                <script src="${pageContext.request.contextPath}/js/voice-assistant.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                <script>
                    function toggleSidebar() { document.getElementById('sidebar').classList.toggle('open'); }

                    function togglePaymentDetails(itemId, method) {
                        const upiDetails = document.getElementById("upi_details_" + itemId);
                        const cardDetails = document.getElementById("card_details_" + itemId);

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

                    .v3-terminal-input {
                        background: rgba(15, 23, 42, 0.6) !important;
                        border: 1px solid rgba(255, 255, 255, 0.05) !important;
                        border-radius: 12px !important;
                        color: #fff !important;
                        padding: 12px 20px !important;
                        font-family: 'Outfit' !important;
                    }

                    .v3-valuation-display {
                        font-size: 32px;
                        font-weight: 950;
                        color: #3b82f6;
                        letter-spacing: -1.5px;
                    }
                </style>
            </body>

            </html>
            drum





