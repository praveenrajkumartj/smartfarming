<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>💬 Producer Connection - AGROPLANTER V3</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/voice-assistant.css" />
                <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800;900&display=swap"
                    rel="stylesheet">
                <link rel="icon"
                    href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>💬</text></svg>" />
                <style>
                    .v3-contact-nexus {
                        background: rgba(15, 23, 42, 0.4);
                        border: 1px solid rgba(255, 255, 255, 0.05);
                        border-radius: 40px;
                        padding: 50px;
                        backdrop-filter: blur(40px);
                        position: relative;
                        overflow: hidden;
                        height: 100%;
                    }

                    .v3-contact-nexus::before {
                        content: '';
                        position: absolute;
                        top: 0;
                        left: 0;
                        width: 100%;
                        height: 4px;
                        background: linear-gradient(90deg, transparent, #3b82f6, transparent);
                    }

                    .v3-asset-preview {
                        background: rgba(15, 23, 42, 0.6);
                        border: 1px solid rgba(59, 130, 246, 0.1);
                        border-radius: 30px;
                        padding: 35px;
                        margin-bottom: 25px;
                        transition: all 0.3s ease;
                    }

                    .v3-asset-preview:hover {
                        border-color: rgba(59, 130, 246, 0.3);
                        box-shadow: 0 10px 40px rgba(0, 0, 0, 0.3);
                    }

                    .v3-producer-hub {
                        display: flex;
                        flex-direction: column;
                        align-items: center;
                        text-align: center;
                    }

                    .v3-producer-orb {
                        width: 140px;
                        height: 140px;
                        background: linear-gradient(135deg, #3b82f6, #6366f1);
                        border-radius: 50%;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        font-size: 50px;
                        font-weight: 950;
                        margin-bottom: 25px;
                        box-shadow: 0 0 50px rgba(59, 130, 246, 0.3);
                        border: 6px solid rgba(15, 23, 42, 0.8);
                        position: relative;
                    }

                    .v3-producer-orb::after {
                        content: '✓';
                        position: absolute;
                        bottom: 5px;
                        right: 5px;
                        width: 35px;
                        height: 35px;
                        background: #10b981;
                        border-radius: 50%;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        font-size: 18px;
                        border: 4px solid #020617;
                    }

                    .v3-identity-label {
                        font-size: 10px;
                        font-weight: 950;
                        color: #64748b;
                        letter-spacing: 2px;
                        text-transform: uppercase;
                        margin-bottom: 10px;
                        display: block;
                    }

                    .v3-tip-node {
                        background: rgba(255, 255, 255, 0.02);
                        border: 1px solid rgba(255, 255, 255, 0.05);
                        border-radius: 20px;
                        padding: 22px;
                        display: flex;
                        align-items: center;
                        gap: 15px;
                        transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
                    }

                    .v3-tip-node:hover {
                        background: rgba(59, 130, 246, 0.08);
                        border-color: rgba(59, 130, 246, 0.3);
                        transform: translateY(-5px);
                    }

                    .v3-quantum-tag {
                        background: rgba(59, 130, 246, 0.1);
                        border: 1px solid rgba(59, 130, 246, 0.2);
                        color: #3b82f6;
                        padding: 6px 16px;
                        border-radius: 50px;
                        font-size: 11px;
                        font-weight: 900;
                        letter-spacing: 1px;
                        display: inline-flex;
                        align-items: center;
                        gap: 8px;
                    }

                    .v3-terminal-stat {
                        border-left: 2px solid rgba(59, 130, 246, 0.3);
                        padding-left: 20px;
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
                                class="sidebar-nav-item active mb-2"><span class="nav-icon">🛒</span> Global Market</a>
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
                                class="sidebar-nav-item mb-2"><span class="nav-icon">🏛️</span> Institutional Feed</a>
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
                                <div class="hamburger" onclick="toggleSidebar()"><span></span><span></span><span></span>
                                </div>
                                <div class="page-title">
                                    <h1 class="m-0 fw-950 text-white"
                                        style="font-size: 2.2rem; letter-spacing: -1.5px;">Producer
                                        Connection</h1>
                                    <div class="d-flex align-items-center gap-3 mt-1">
                                        <span class="v3-quantum-tag"><span class="pulse-ring"></span> SECURE
                                            CHANNEL</span>
                                        <span class="v3-page-subtitle text-white-50 uppercase"
                                            style="letter-spacing: 1px; font-weight: 800; font-size: 11px;">DIRECT
                                            NEGOTIATION HUB |
                                            REAL-TIME ASSET ACCESS</span>
                                    </div>
                                </div>
                            </div>
                            <div class="top-nav-right">
                                <a href="${pageContext.request.contextPath}/buyer/marketplace"
                                    class="btn btn-quantum px-4 py-2"
                                    style="background: rgba(255,255,255,0.05) !important; color: #fff !important; box-shadow: none !important; border: 1px solid rgba(255,255,255,0.1) !important;">RETURN
                                    TO MARKET</a>
                            </div>
                        </header>

                        <div class="page-body px-5 py-5">
                            <div class="container-fluid" style="max-width: 1300px;">
                                <div class="row g-5">
                                    <div class="col-lg-7">
                                        <div class="v3-contact-nexus">
                                            <div class="v3-asset-preview">
                                                <div class="d-flex justify-content-between align-items-start mb-5">
                                                    <div>
                                                        <span class="v3-identity-label">ASSET UNDER NEGOTIATION</span>
                                                        <h2 class="fw-950 text-white m-0"
                                                            style="font-size: 3.5rem; letter-spacing: -3px; line-height: 1;">
                                                            ${listing.cropName}</h2>
                                                    </div>
                                                    <div class="text-end">
                                                        <span class="v3-identity-label">CURRENT VALUATION</span>
                                                        <div class="fw-950 text-info"
                                                            style="font-size: 2.2rem; letter-spacing: -1px;">
                                                            ₹${listing.pricePerUnit} <span
                                                                class="text-white-50 fs-6 fw-normal">/
                                                                ${listing.unit}</span></div>
                                                    </div>
                                                </div>

                                                <div class="row g-4 mb-5">
                                                    <div class="col-md-6">
                                                        <div class="v3-terminal-stat">
                                                            <span class="v3-identity-label">AVAILABLE VOLUME</span>
                                                            <div class="fw-950 text-white fs-3">${listing.quantity}
                                                                ${listing.unit}</div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="v3-terminal-stat">
                                                            <span class="v3-identity-label">BATCH ESTIMATION</span>
                                                            <div class="fw-950 text-info fs-3">₹${listing.quantity *
                                                                listing.pricePerUnit}</div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="v3-terminal-stat">
                                                    <span class="v3-identity-label">LOGISTICS ORIGIN</span>
                                                    <div class="fw-950 text-white d-flex align-items-center gap-2">
                                                        <span class="fs-5">📍</span> ${listing.location.toUpperCase()}
                                                    </div>
                                                </div>
                                            </div>

                                            <c:if test="${not empty listing.description}">
                                                <div class="mb-5">
                                                    <span class="v3-identity-label opacity-50">CROP METADATA &
                                                        TELEMETRY</span>
                                                    <div class="p-4 rounded-4"
                                                        style="background: rgba(255,255,255,0.02); border: 1px solid rgba(255,255,255,0.05);">
                                                        <p class="text-white-50 fw-500 m-0 lh-lg"
                                                            style="font-size: 1.1rem;">
                                                            ${listing.description}</p>
                                                    </div>
                                                </div>
                                            </c:if>

                                            <div class="mt-auto">
                                                <h4 class="fw-950 text-white mb-4" style="letter-spacing: -1px;">⛓️
                                                    PROCUREMENT PROTOCOLS</h4>
                                                <div class="row g-3">
                                                    <div class="col-md-6">
                                                        <div class="v3-tip-node">
                                                            <div class="p-3 rounded-circle"
                                                                style="background: rgba(59, 130, 246, 0.1); font-size: 20px;">
                                                                🛡️
                                                            </div>
                                                            <span class="x-small fw-950 uppercase opacity-75">QUALITY
                                                                VERIFICATION</span>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="v3-tip-node">
                                                            <div class="p-3 rounded-circle"
                                                                style="background: rgba(59, 130, 246, 0.1); font-size: 20px;">
                                                                📉
                                                            </div>
                                                            <span class="x-small fw-950 uppercase opacity-75">MARKET
                                                                PRICE
                                                                SYNC</span>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="v3-tip-node">
                                                            <div class="p-3 rounded-circle"
                                                                style="background: rgba(59, 130, 246, 0.1); font-size: 20px;">
                                                                📄
                                                            </div>
                                                            <span class="x-small fw-950 uppercase opacity-75">SMART
                                                                AGREEMENTS</span>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="v3-tip-node">
                                                            <div class="p-3 rounded-circle"
                                                                style="background: rgba(59, 130, 246, 0.1); font-size: 20px;">
                                                                💳
                                                            </div>
                                                            <span class="x-small fw-950 uppercase opacity-75">ESCROW
                                                                SETTLEMENT</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-5">
                                        <div class="v3-contact-nexus">
                                            <div class="v3-producer-hub py-4">
                                                <div class="v3-producer-orb">
                                                    ${fn:substring(listing.farmer.fullName, 0, 1)}
                                                </div>
                                                <h2 class="fw-950 text-white mb-2"
                                                    style="font-size: 3rem; letter-spacing: -2px;">
                                                    ${listing.farmer.fullName}
                                                </h2>
                                                <div class="d-flex justify-content-center gap-2 mb-4">
                                                    <span
                                                        class="badge bg-success bg-opacity-10 text-success fw-950 px-3 py-2 rounded-pill x-small"
                                                        style="letter-spacing: 1px; border: 1px solid rgba(34, 197, 94, 0.2);">VERIFIED
                                                        PRODUCER</span>
                                                    <span
                                                        class="badge bg-info bg-opacity-10 text-info fw-950 px-3 py-2 rounded-pill x-small"
                                                        style="letter-spacing: 1px; border: 1px solid rgba(59, 130, 246, 0.2);">TRUST
                                                        ${listing.farmer.trustScore}%</span>
                                                </div>

                                                <div class="w-100 p-4 rounded-4 mb-5 text-start"
                                                    style="background: rgba(15, 23, 42, 0.6); border: 1px solid rgba(255,255,255,0.05);">
                                                    <div class="mb-4 d-flex align-items-center gap-4">
                                                        <div class="p-3 rounded-4"
                                                            style="background: rgba(255,255,255,0.02);"><span
                                                                class="fs-4">📱</span></div>
                                                        <div>
                                                            <span
                                                                class="v3-identity-label opacity-50 mb-1">COMMUNICATION
                                                                FREQUENCY</span>
                                                            <div class="fw-950 text-white fs-5">${listing.farmer.phone}
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="d-flex align-items-center gap-4">
                                                        <div class="p-3 rounded-4"
                                                            style="background: rgba(255,255,255,0.02);"><span
                                                                class="fs-4">🔑</span></div>
                                                        <div>
                                                            <span class="v3-identity-label opacity-50 mb-1">DIGITAL
                                                                IDENTITY</span>
                                                            <div class="fw-800 text-info small">${listing.farmer.email}
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="d-flex flex-column gap-3 w-100">
                                                    <a href="tel:${listing.farmer.phone}"
                                                        class="btn btn-quantum w-100 py-3 d-flex align-items-center justify-content-center gap-3"
                                                        style="background: #3b82f6 !important; font-size: 1.1rem; border-radius: 20px;">
                                                        <span>📞</span> INITIATE VOICE CALL
                                                    </a>
                                                    <a href="https://wa.me/91${listing.farmer.phone}" target="_blank"
                                                        class="btn btn-quantum w-100 py-3 d-flex align-items-center justify-content-center gap-3"
                                                        style="background: rgba(34, 197, 94, 0.05) !important; color: #10b981 !important; border: 1px solid rgba(34, 197, 94, 0.2) !important; font-size: 1.1rem; border-radius: 20px;">
                                                        <span>💬</span> WHATSAPP ESCROW TUNNEL
                                                    </a>
                                                    <a href="${pageContext.request.contextPath}/chat?with=${listing.farmer.id}"
                                                        class="btn btn-quantum w-100 py-3 d-flex align-items-center justify-content-center gap-3"
                                                        style="background: rgba(255,255,255,0.03) !important; color: #fff !important; box-shadow: none !important; border: 1px solid rgba(255,255,255,0.1) !important; font-size: 1.1rem; border-radius: 20px;">
                                                        <span>🛡️</span> AGROPLANTER SECURE CHAT
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </main>
                </div>

                <script src="${pageContext.request.contextPath}/js/voice-assistant.js"></script>
                <script src="${pageContext.request.contextPath}/js/background-switcher.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                <script>function toggleSidebar() { document.getElementById('sidebar').classList.toggle('open'); }</script>
            </body>

            </html>




