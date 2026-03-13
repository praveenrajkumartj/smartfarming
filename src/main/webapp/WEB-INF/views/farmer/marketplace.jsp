<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8" />
                    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                    <title>🛒 Global Marketplace - AGROPLANTER</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
                        rel="stylesheet">
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/voice-assistant.css" />
                    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800;900&display=swap"
                        rel="stylesheet">
                    <link rel="icon"
                        href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🛒</text></svg>" />
                    <script>
                        window.AgroplanterUser = "${user.id}";
                        window.AgroplanterUserFull = "${user.fullName}";
                        window.AgroplanterRole = "${user.role}";
                    </script>
                    <style>
                        .trading-nexus-terminal {
                            background: rgba(15, 23, 42, 0.4);
                            border: 1px solid rgba(255, 255, 255, 0.05);
                            border-radius: 35px;
                            overflow: hidden;
                            backdrop-filter: blur(30px);
                            position: relative;
                        }

                        .v3-trading-table {
                            width: 100%;
                            border-collapse: separate;
                            border-spacing: 0 12px;
                        }

                        .v3-trading-table thead th {
                            color: #475569;
                            font-size: 10px;
                            font-weight: 900;
                            letter-spacing: 2px;
                            text-transform: uppercase;
                            padding: 20px 30px;
                            border: none;
                        }

                        .v3-trading-table tbody tr td {
                            background: rgba(255, 255, 255, 0.02);
                            padding: 25px 30px;
                            border-top: 1px solid rgba(255, 255, 255, 0.05);
                            border-bottom: 1px solid rgba(255, 255, 255, 0.05);
                            vertical-align: middle;
                        }

                        .v3-trading-table tbody tr td:first-child {
                            border-left: 1px solid rgba(255, 255, 255, 0.05);
                            border-radius: 20px 0 0 20px;
                        }

                        .v3-trading-table tbody tr td:last-child {
                            border-right: 1px solid rgba(255, 255, 255, 0.05);
                            border-radius: 0 20px 20px 0;
                        }

                        .v3-trading-table tbody tr:hover td {
                            background: rgba(16, 185, 129, 0.05);
                            border-color: rgba(16, 185, 129, 0.2);
                        }

                        .qr-flux-node {
                            width: 65px;
                            height: 65px;
                            background: white;
                            padding: 6px;
                            border-radius: 15px;
                            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
                            cursor: pointer;
                        }

                        .qr-flux-node:hover {
                            transform: scale(1.2) rotate(5deg);
                            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.5);
                        }

                        .v3-market-input {
                            background: rgba(255, 255, 255, 0.03) !important;
                            border: 1px solid rgba(255, 255, 255, 0.05) !important;
                            border-radius: 14px !important;
                            color: white !important;
                            padding: 15px 22px !important;
                            font-weight: 600 !important;
                            font-family: 'Outfit';
                        }

                        .v3-market-input:focus {
                            border-color: #10b981 !important;
                            background: rgba(255, 255, 255, 0.05) !important;
                            box-shadow: 0 0 0 4px rgba(16, 185, 129, 0.1) !important;
                        }

                        .v3-modal-nexus {
                            background: #0f1728;
                            border: 1px solid rgba(255, 255, 255, 0.05);
                            border-radius: 40px;
                            overflow: hidden;
                            box-shadow: 0 30px 60px rgba(0, 0, 0, 0.6);
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
                                    class="sidebar-nav-item mb-2"><span class="nav-icon">🌿</span> Plant Clinic</a>

                                <div class="nav-section-title px-2 mt-4 mb-2"
                                    style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">
                                    MARKET OPS</div>
                                <a href="${pageContext.request.contextPath}/farmer/marketplace"
                                    class="sidebar-nav-item active mb-2"><span class="nav-icon">🛍️</span> Global
                                    Market</a>
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
                                            style="font-size: 2.2rem; letter-spacing: -1.5px;">Global Marketplace</h1>
                                        <span class="v3-page-subtitle text-success uppercase"
                                            style="letter-spacing: 1px; font-weight: 800;">
                                            📡 COMMODITY EXCHANGE TERMINAL | NODE: ${not empty user.district ?
                                            user.district : 'SECURED'}
                                        </span>
                                    </div>
                                </div>
                                <div class="top-nav-right">
                                    <button class="btn btn-quantum px-5 py-3 fw-900 uppercase small"
                                        data-bs-toggle="modal" data-bs-target="#newListingModal">DEPLOY NEW ASSET
                                        +</button>
                                </div>
                            </header>

                            <div class="page-body px-5 py-5">
                                <c:if test="${not empty successMessage}">
                                    <div class="alert alert-success border-0 rounded-4 mb-5 text-center fw-900 uppercase small"
                                        style="background: rgba(16, 185, 129, 0.1); color: #10b981; border: 1px solid rgba(16, 185, 129, 0.2); letter-spacing: 1px;">
                                        ✅ ${successMessage}
                                    </div>
                                </c:if>

                                <div class="trading-nexus-terminal p-4">
                                    <div class="d-flex justify-content-between align-items-center mb-4 px-3">
                                        <div>
                                            <span class="trust-label uppercase d-block mb-1"
                                                style="font-size: 9px; color: #64748b;">ACTIVE TRADING INVENTORY</span>
                                            <h4 class="text-white fw-900 m-0" style="letter-spacing: -1px;">
                                                ${fn:length(myListings)} SECURE ASSETS LISTED</h4>
                                        </div>
                                        <div class="v3-node-pulse"
                                            style="width: 12px; height: 12px; background: #10b981; border-radius: 50%; box-shadow: 0 0 15px #10b981;">
                                        </div>
                                    </div>

                                    <div class="table-responsive">
                                        <table class="v3-trading-table">
                                            <thead>
                                                <tr>
                                                    <th>CROP ASSET / NODE</th>
                                                    <th>NET VOLUME</th>
                                                    <th>VALUATION</th>
                                                    <th>BIO-TRACEABILITY</th>
                                                    <th class="text-end">CONTROL</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${myListings}" var="l">
                                                    <tr>
                                                        <td>
                                                            <div class="text-white fw-900 mb-1"
                                                                style="font-size: 16px;">${l.cropName}</div>
                                                            <div class="text-white-50 x-small fw-800 uppercase"
                                                                style="letter-spacing: 0.5px; font-size: 8px;">LOC:
                                                                ${l.location} | ID: #${l.id}</div>
                                                        </td>
                                                        <td>
                                                            <div class="text-white fw-900" style="font-size: 15px;">
                                                                ${l.quantity} ${l.unit}</div>
                                                            <span
                                                                class="badge bg-success bg-opacity-10 text-success x-small fw-900 uppercase p-0">${l.status}</span>
                                                        </td>
                                                        <td>
                                                            <div class="text-success fw-900" style="font-size: 20px;">
                                                                ₹${l.pricePerUnit}<span
                                                                    class="text-white-50 x-small fw-400">/${l.unit}</span>
                                                            </div>
                                                            <div class="text-white-50 x-small fw-800 uppercase">TTL:
                                                                ₹${l.quantity * l.pricePerUnit}</div>
                                                        </td>
                                                        <td>
                                                            <div class="d-flex align-items-center gap-4">
                                                                <c:set var="qr" value="${qrCodes[l.id]}" />
                                                                <c:if test="${not empty qr}">
                                                                    <img src="${qr}" alt="QR" class="qr-flux-node">
                                                                </c:if>
                                                                <div>
                                                                    <div class="text-info x-small fw-900 uppercase mb-1"
                                                                        style="letter-spacing: 0.5px;">📍 GIS VERIFIED
                                                                    </div>
                                                                    <a href="${pageContext.request.contextPath}/traceability/${l.traceabilityRecord.traceabilityId}"
                                                                        class="text-white-50 x-small fw-800 text-decoration-none"
                                                                        style="border-bottom: 1px dotted rgba(255,255,255,0.2);">AUDIT
                                                                        GENESIS →</a>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td class="text-end">
                                                            <button type="button"
                                                                class="btn btn-outline-danger px-4 py-2 rounded-3 fw-900 uppercase small"
                                                                style="font-size: 10px; border-width: 1.5px;"
                                                                onclick="confirmAssetTermination('${l.id}', '${l.cropName}')">TERMINATE</button>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>

                                    <c:if test="${empty myListings}">
                                        <div class="text-center py-5" style="opacity: 0.2;">
                                            <div class="display-1 mb-3">📍</div>
                                            <h5 class="text-white fw-900 uppercase">NO ACTIVE ASSET BLOCKS</h5>
                                            <p class="text-white-50 fw-600 uppercase x-small">TRADING QUEUE EMPTY</p>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </main>
                    </div>

                    <!-- Modal: Asset Deployment -->
                    <div class="modal fade" id="newListingModal" tabindex="-1">
                        <div class="modal-dialog modal-lg modal-dialog-centered">
                            <div class="modal-content"
                                style="background: #0f1728; border: 1px solid rgba(255, 255, 255, 0.05); border-radius: 40px; overflow: hidden; box-shadow: 0 30px 60px rgba(0,0,0,0.6);">
                                <div class="modal-header border-0 p-5 pb-0">
                                    <div class="page-title">
                                        <h4 class="modal-title fw-900 text-white uppercase m-0"
                                            style="letter-spacing: -1px;">Asset Deployment</h4>
                                        <span class="text-success x-small fw-800 uppercase"
                                            style="letter-spacing: 1px;">INITIALIZING COMMODITY BLOCK</span>
                                    </div>
                                    <button type="button" class="btn-close btn-close-white"
                                        data-bs-dismiss="modal"></button>
                                </div>
                                <form action="${pageContext.request.contextPath}/farmer/marketplace/add" method="post">
                                    <div class="modal-body p-5">
                                        <div class="row g-4 mb-5">
                                            <div class="col-md-6">
                                                <span class="trust-label uppercase mb-2 d-block"
                                                    style="font-size: 8px;">CROP VARIETY IDENTIFIER</span>
                                                <input type="text" name="cropName" class="form-control v3-market-input"
                                                    placeholder="e.g. Premium Basmati S-72" required />
                                            </div>
                                            <div class="col-md-3">
                                                <span class="trust-label uppercase mb-2 d-block"
                                                    style="font-size: 8px;">MEASUREMENT UNIT</span>
                                                <select name="unit" class="form-select v3-market-input">
                                                    <option value="Quintal">QUINTAL</option>
                                                    <option value="Kg">KG</option>
                                                    <option value="Ton">TON</option>
                                                </select>
                                            </div>
                                            <div class="col-md-3">
                                                <span class="trust-label uppercase mb-2 d-block"
                                                    style="font-size: 8px;">UNIT VALUATION (₹)</span>
                                                <input type="number" name="pricePerUnit"
                                                    class="form-control v3-market-input" placeholder="0.00" step="0.01"
                                                    required />
                                            </div>
                                            <div class="col-md-6">
                                                <span class="trust-label uppercase mb-2 d-block"
                                                    style="font-size: 8px;">TOTAL INVENTORY VOLUME</span>
                                                <input type="number" name="quantity"
                                                    class="form-control v3-market-input" placeholder="50" required />
                                            </div>
                                            <div class="col-md-6">
                                                <span class="trust-label uppercase mb-2 d-block"
                                                    style="font-size: 8px;">DEBARKATION POINT</span>
                                                <input type="text" name="location" class="form-control v3-market-input"
                                                    value="${not empty user.district ? user.district : ''}${not empty user.district and not empty user.state ? ', ' : ''}${not empty user.state ? user.state : ''}"
                                                    placeholder="e.g. Warehouse 04, District Alpha" required />
                                            </div>
                                        </div>

                                        <div class="trace-quantum-hub">
                                            <div class="d-flex align-items-center gap-3 mb-4">
                                                <div
                                                    style="width: 8px; height: 8px; background: #10b981; border-radius: 50%;">
                                                </div>
                                                <h6 class="text-white fw-900 m-0 uppercase small"
                                                    style="letter-spacing: 1px;">GENESIS TELEMETRY (TRACEABILITY)</h6>
                                            </div>
                                            <div class="row g-4">
                                                <div class="col-md-6">
                                                    <span class="trust-label uppercase mb-2 d-block"
                                                        style="font-size: 8px;">PLANTING TIMESTAMP</span>
                                                    <input type="date" name="plantingDate"
                                                        class="form-control v3-market-input" required />
                                                </div>
                                                <div class="col-md-6">
                                                    <span class="trust-label uppercase mb-2 d-block"
                                                        style="font-size: 8px;">HARVEST TIMESTAMP</span>
                                                    <input type="date" name="harvestDate"
                                                        class="form-control v3-market-input" required />
                                                </div>
                                                <div class="col-md-6">
                                                    <span class="trust-label uppercase mb-2 d-block"
                                                        style="font-size: 8px;">NUTRIENT UTILIZATION LOG</span>
                                                    <input type="text" name="fertilizerUsage"
                                                        class="form-control v3-market-input"
                                                        placeholder="NPK / Bio-Compost Matrix" required />
                                                </div>
                                                <div class="col-md-6">
                                                    <span class="trust-label uppercase mb-2 d-block"
                                                        style="font-size: 8px;">PESTICIDE UTILIZATION LOG</span>
                                                    <input type="text" name="pesticideUsage"
                                                        class="form-control v3-market-input"
                                                        placeholder="Neem Oil / Organic Pest-Shield" required />
                                                </div>
                                                <div class="col-md-6">
                                                    <span class="trust-label uppercase mb-2 d-block"
                                                        style="font-size: 8px;">IRRIGATION PROTOCOL</span>
                                                    <input type="text" name="irrigationMethod"
                                                        class="form-control v3-market-input"
                                                        placeholder="Smart Drip / Rainfed" required />
                                                </div>
                                                <div class="col-md-6">
                                                    <span class="trust-label uppercase mb-2 d-block"
                                                        style="font-size: 8px;">SUSTAINABILITY PROTOCOLS</span>
                                                    <input type="text" name="sustainabilityPractices"
                                                        class="form-control v3-market-input"
                                                        placeholder="Crop Rotation / Zero Tillage" required />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer border-0 p-5 pt-0">
                                        <button type="submit" class="btn btn-quantum w-100 py-4 fw-900 uppercase">DEPLOY
                                            TO GLOBAL INDEX →</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                    <!-- Modal: Tactical Asset Termination -->
                    <div class="modal fade" id="deleteConfirmModal" tabindex="-1">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content v3-modal-nexus">
                                <div class="modal-header border-0 p-5 pb-0">
                                    <div class="page-title">
                                        <h4 class="modal-title fw-900 text-white uppercase m-0"
                                            style="letter-spacing: -1px;">Protocol Abort</h4>
                                        <span class="text-danger x-small fw-800 uppercase"
                                            style="letter-spacing: 1px;">TERMINATION SEQUENCE INITIATED</span>
                                    </div>
                                    <button type="button" class="btn-close btn-close-white"
                                        data-bs-dismiss="modal"></button>
                                </div>
                                <div class="modal-body p-5">
                                    <p class="text-white fw-600 mb-0" style="opacity: 0.8;">
                                        ARE YOU ABSOLUTELY SURE YOU WANT TO <span class="text-danger fw-900">ABORT THE
                                            TRADING PROTOCOL</span>
                                        FOR <span id="assetNamePlaceholder" class="text-white fw-950"></span>?
                                        THIS ACTION IS IRREVERSIBLE.
                                    </p>
                                </div>
                                <div class="modal-footer border-0 p-5 pt-0">
                                    <div class="w-100 d-flex gap-3">
                                        <button type="button"
                                            class="btn btn-outline-secondary w-100 py-3 fw-900 uppercase"
                                            data-bs-dismiss="modal">RESUME MISSION</button>
                                        <form id="deleteAssetForm" method="post" class="w-100">
                                            <button type="submit"
                                                class="btn btn-danger w-100 py-3 fw-900 uppercase">ABORT
                                                PROTOCOL</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <script src="${pageContext.request.contextPath}/js/voice-assistant.js"></script>
                    <script src="${pageContext.request.contextPath}/js/background-switcher.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                    <script>
                        function toggleSidebar() { document.getElementById('sidebar').classList.toggle('open'); }

                        function confirmAssetTermination(id, name) {
                            const modal = new bootstrap.Modal(document.getElementById('deleteConfirmModal'));
                            document.getElementById('assetNamePlaceholder').textContent = name.toUpperCase();
                            document.getElementById('deleteAssetForm').action = '${pageContext.request.contextPath}/farmer/marketplace/delete/' + id;
                            modal.show();
                        }
                    </script>
                </body>

                </html>