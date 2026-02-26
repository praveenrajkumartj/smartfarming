<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>💬 Contact Farmer - Smart Farming Platform</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                <link rel="icon" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🤝</text></svg>" />
            </head>

            <body>
                <div class="dashboard-layout">
                    <aside class="sidebar" id="sidebar">
                        <div class="sidebar-brand" style="cursor: pointer;" onclick="window.location.href='${pageContext.request.contextPath}/'">
                            <div class="brand-icon">🌾</div>
                            <div class="brand-text">
                                <h3>Smart Farming</h3><span>Buyer Portal</span>
                            </div>
                        </div>
                        <nav class="sidebar-nav">
                            <div class="nav-section-title">Main Menu</div>
                            <a href="${pageContext.request.contextPath}/buyer/dashboard"><span
                                    class="nav-icon">📊</span> Dashboard</a>
                            <a href="${pageContext.request.contextPath}/buyer/marketplace" class="active"><span
                                    class="nav-icon">✨</span> Browse
                                Marketplace</a>
                            <a href="${pageContext.request.contextPath}/buyer/market-prices"><span
                                    class="nav-icon">📈</span> Market Prices</a>
                            <a href="${pageContext.request.contextPath}/buyer/schemes"><span class="nav-icon">🏛️</span>
                                Govt. Schemes</a>
                            <div class="nav-section-title">Account</div>
                            <a href="${pageContext.request.contextPath}/logout"><span class="nav-icon">🚪</span> Logout</a>
                        </nav>
                    </aside>

                    <div class="main-content">
                        <header class="top-nav">
                            <div class="top-nav-left">
                                <div class="hamburger" onclick="toggleSidebar()"><span></span><span></span><span></span>
                                </div>
                                <span class="page-title">💬 Contact Farmer</span>
                            </div>
                            <div class="top-nav-right">
                                <a href="${pageContext.request.contextPath}/buyer/marketplace"
                                    class="btn btn-secondary btn-sm">Back to Marketplace</a>
                            </div>
                        </header>

                        <div class="page-body">
                            <div style="max-width:800px;margin:0 auto;">

                                <!-- Listing Details Card -->
                                <div class="card" style="margin-bottom:24px;">
                                    <div class="card-header">
                                        <span class="card-title">✨ Listing Details</span>
                                        <span class="badge badge-success">Available</span>
                                    </div>
                                    <div class="card-body">
                                        <div style="display:grid;grid-template-columns:1fr 1fr;gap:20px;">
                                            <div>
                                                <div
                                                    style="font-size:32px;font-weight:900;color:#22c55e;margin-bottom:4px;">
                                                    ${listing.cropName}</div>
                                                <div
                                                    style="font-size:28px;font-weight:800;background:linear-gradient(135deg,#f59e0b,#fbbf24);-webkit-background-clip:text;-webkit-text-fill-color:transparent;background-clip:text;">
                                                    ₹${listing.pricePerUnit} / ${listing.unit}
                                                </div>

                                                <div
                                                    style="margin-top:16px;display:flex;flex-direction:column;gap:10px;">
                                                    <div
                                                        style="display:flex;align-items:center;gap:10px;padding:10px;background:var(--surface);border-radius:10px;">
                                                        <span style="font-size:20px;"></span>
                                                        <div>
                                                            <div style="font-size:11px;color:#6b7280;font-weight:600;">
                                                                AVAILABLE QUANTITY</div>
                                                            <div style="font-size:15px;font-weight:700;color:#f0fdf4;">
                                                                ${listing.quantity} ${listing.unit}</div>
                                                        </div>
                                                    </div>
                                                    <div
                                                        style="display:flex;align-items:center;gap:10px;padding:10px;background:var(--surface);border-radius:10px;">
                                                        <span style="font-size:20px;"></span>
                                                        <div>
                                                            <div style="font-size:11px;color:#6b7280;font-weight:600;">
                                                                TOTAL VALUE</div>
                                                            <div style="font-size:15px;font-weight:700;color:#fcd34d;">
                                                                ₹${listing.quantity * listing.pricePerUnit}</div>
                                                        </div>
                                                    </div>
                                                    <div
                                                        style="display:flex;align-items:center;gap:10px;padding:10px;background:var(--surface);border-radius:10px;">
                                                        <span style="font-size:20px;"></span>
                                                        <div>
                                                            <div style="font-size:11px;color:#6b7280;font-weight:600;">
                                                                LOCATION</div>
                                                            <div style="font-size:15px;font-weight:700;color:#f0fdf4;">
                                                                ${listing.location}</div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div>
                                                <div
                                                    style="background:linear-gradient(135deg,#0d2515,#1a3824);border:1px solid rgba(22,163,74,0.2);border-radius:16px;padding:24px;text-align:center;">
                                                    <div style="font-size:60px;margin-bottom:12px;">🛒</div>
                                                    <div
                                                        style="font-size:18px;font-weight:800;color:#f0fdf4;margin-bottom:4px;">
                                                        ${listing.farmer.fullName}</div>
                                                    <div style="font-size:13px;color:#22c55e;margin-bottom:16px;">
                                                        Verified Farmer</div>

                                                    <div
                                                        style="background:rgba(22,163,74,0.1);border:1px solid rgba(22,163,74,0.2);border-radius:12px;padding:16px;text-align:left;">
                                                        <div
                                                            style="display:flex;align-items:center;gap:8px;margin-bottom:10px;">
                                                            <span></span>
                                                            <div>
                                                                <div style="font-size:10px;color:#6b7280;">PHONE</div>
                                                                <div
                                                                    style="font-size:16px;font-weight:700;color:#22c55e;">
                                                                    ${listing.farmer.phone}</div>
                                                            </div>
                                                        </div>
                                                        <div style="display:flex;align-items:center;gap:8px;">
                                                            <span></span>
                                                            <div>
                                                                <div style="font-size:10px;color:#6b7280;">EMAIL</div>
                                                                <div
                                                                    style="font-size:13px;font-weight:600;color:#7dd3fc;">
                                                                    ${listing.farmer.email}</div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div
                                                        style="margin-top:16px;display:flex;flex-direction:column;gap:10px;">
                                                        <a href="tel:${listing.farmer.phone}" class="btn btn-primary"
                                                            style="justify-content:center;">
                                                            📞 Call Farmer
                                                        </a>
                                                        <a href="https://wa.me/91${listing.farmer.phone}"
                                                            target="_blank" class="btn btn-secondary"
                                                            style="justify-content:center;border-color:rgba(34,197,94,0.4);color:#22c55e;">
                                                            💬 WhatsApp
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <c:if test="${not empty listing.description}">
                                            <div
                                                style="margin-top:16px;padding:16px;background:var(--surface);border-radius:12px;">
                                                <div
                                                    style="font-size:12px;font-weight:600;color:#6b7280;margin-bottom:4px;">
                                                    CROP DESCRIPTION</div>
                                                <div style="font-size:14px;color:#f0fdf4;">${listing.description}</div>
                                            </div>
                                        </c:if>
                                    </div>
                                </div>

                                <!-- Tips Card -->
                                <div class="card">
                                    <div class="card-header">
                                        <span class="card-title">✨ Buying Tips</span>
                                    </div>
                                    <div class="card-body">
                                        <div style="display:flex;flex-direction:column;gap:10px;">
                                            <div
                                                style="display:flex;align-items:center;gap:12px;padding:12px;background:var(--surface);border-radius:10px;">
                                                <span style="font-size:20px;"></span>
                                                <span style="font-size:13px;color:#9ca3af;">Always verify crop quality
                                                    before making payment</span>
                                            </div>
                                            <div
                                                style="display:flex;align-items:center;gap:12px;padding:12px;background:var(--surface);border-radius:10px;">
                                                <span style="font-size:20px;"></span>
                                                <span style="font-size:13px;color:#9ca3af;">Negotiate price based on
                                                    current market rates</span>
                                            </div>
                                            <div
                                                style="display:flex;align-items:center;gap:12px;padding:12px;background:var(--surface);border-radius:10px;">
                                                <span style="font-size:20px;"></span>
                                                <span style="font-size:13px;color:#9ca3af;">Get a written agreement for
                                                    large transactions</span>
                                            </div>
                                            <div
                                                style="display:flex;align-items:center;gap:12px;padding:12px;background:var(--surface);border-radius:10px;">
                                                <span style="font-size:20px;"></span>
                                                <span style="font-size:13px;color:#9ca3af;">Prefer UPI or bank transfer
                                                    over cash payments</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <script>function toggleSidebar() { document.getElementById('sidebar').classList.toggle('open'); }</script>
            
<script src="${pageContext.request.contextPath}/js/i18n.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

            </html>
