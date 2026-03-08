<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>📈 Market Intelligence Data - AGROPLANTER Admin</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                <link rel="icon"
                    href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>📈</text></svg>" />
                <style>
                    .price-badge {
                        background: rgba(16, 185, 129, 0.1);
                        border: 1px solid rgba(16, 185, 129, 0.2);
                        padding: 4px 12px;
                        border-radius: 8px;
                        color: #10b981;
                        font-weight: 700;
                    }
                </style>
            </head>

            <body>
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
                                        style="font-size: 10px; color: #ef4444; font-weight: 800; letter-spacing: 1px;">ROOT
                                        ACCESS V3</span>
                                </div>
                            </div>
                        </div>
                        <nav class="sidebar-nav px-3 py-4">
                            <div class="nav-section-title px-2 mb-2"
                                style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">
                                STRATEGIC CONTROL</div>
                            <a href="${pageContext.request.contextPath}/admin/dashboard"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">🛡️</span>
                                Intelligence</a>
                            <a href="${pageContext.request.contextPath}/admin/users" class="sidebar-nav-item mb-2"><span
                                    class="nav-icon">👥</span> Identity Registry</a>
                            <a href="${pageContext.request.contextPath}/admin/marketplace"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">🛒</span> Market Oversight</a>
                            <a href="${pageContext.request.contextPath}/admin/disease-queries"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">🔬</span> Bio-Triage</a>
                            <a href="${pageContext.request.contextPath}/chat" class="sidebar-nav-item mb-2"><span
                                    class="nav-icon">💬</span> Message Core</a>

                            <div class="nav-section-title px-2 mt-4 mb-2"
                                style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">
                                OVERSIGHT & MONITORING</div>
                            <a href="${pageContext.request.contextPath}/admin/traceability-monitor"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">🛡️</span> Traceability</a>
                            <a href="${pageContext.request.contextPath}/admin/rental-transactions"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">🚜</span> Rental Logs</a>
                            <a href="${pageContext.request.contextPath}/admin/b2b-deals"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">🏢</span> B2B Deals</a>

                            <div class="nav-section-title px-2 mt-4 mb-2"
                                style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">
                                SYSTEM ASSETS</div>
                            <a href="${pageContext.request.contextPath}/admin/crops" class="sidebar-nav-item mb-2"><span
                                    class="nav-icon">🌾</span> Crop Index</a>
                            <a href="${pageContext.request.contextPath}/admin/market-prices"
                                class="sidebar-nav-item active mb-2"><span class="nav-icon">📈</span> Data Streams</a>
                            <a href="${pageContext.request.contextPath}/admin/schemes"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">🏛️</span> Institutional</a>
                            <a href="${pageContext.request.contextPath}/admin/learning-videos"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">🎓</span> Academy Manager</a>

                            <div class="nav-section-title px-2 mt-4 mb-2"
                                style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">
                                OPERATIONS</div>
                            <a href="${pageContext.request.contextPath}/admin/equipment-approvals"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">🚜</span> Agri-Uber</a>
                            <a href="${pageContext.request.contextPath}/admin/clinic-experts"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">🩺</span> Clinic Panel</a>
                            <a href="${pageContext.request.contextPath}/admin/payouts"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">💰</span> Payout Registry</a>

                            <div class="mt-auto px-2">
                                <a href="${pageContext.request.contextPath}/logout"
                                    class="sidebar-nav-item text-danger mt-4"><span class="nav-icon">🚪</span>
                                    Terminate Session</a>
                            </div>
                        </nav>
                    </aside>

                    <div class="main-content">
                        <header class="top-nav">
                            <div class="top-nav-left">
                                <div class="hamburger" onclick="toggleSidebar()"><span></span><span></span><span></span>
                                </div>
                                <span class="page-title">📈 Mandi Data Management</span>
                            </div>
                            <div class="top-nav-right">
                                <button class="btn btn-primary px-4 rounded-pill fw-bold me-3"
                                    onclick="openModal('addPriceModal')">+ INJECT PRICE FEED</button>
                                <div class="user-info"
                                    style="gap: 15px; cursor: pointer; display: flex; align-items: center;"
                                    onclick="window.location.href='${pageContext.request.contextPath}/admin/market-prices'">
                                    <div class="user-details d-none d-md-flex flex-column text-end">
                                        <span class="user-name text-white fw-800"
                                            style="font-size: 14px; letter-spacing: -0.5px;">${admin.fullName}</span>
                                        <span class="user-role uppercase fw-950"
                                            style="font-size: 9px; color: #7c3aed; letter-spacing: 1px;">ROOT ACCESS:
                                            ${admin.role}</span>
                                    </div>
                                    <div class="user-avatar"
                                        style="width: 48px; height: 48px; border-radius: 16px; display: flex; align-items: center; justify-content: center; overflow: hidden; border: 1px solid rgba(255,255,255,0.1); box-shadow: 0 10px 20px rgba(124, 58, 237, 0.2);">
                                        <c:choose>
                                            <c:when test="${not empty admin.profileImagePath}">
                                                <img src="${pageContext.request.contextPath}${admin.profileImagePath}"
                                                    alt="Profile" style="width: 100%; height: 100%; object-fit: cover;">
                                            </c:when>
                                            <c:otherwise>
                                                <div
                                                    style="width: 100%; height: 100%; background: linear-gradient(135deg, #7c3aed, #4f46e5); display: flex; align-items: center; justify-content: center; font-weight: 950; font-size: 20px; color: white;">
                                                    ${fn:substring(admin.fullName, 0, 1)}
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                        </header>

                        <div class="page-body">
                            <c:if test="${not empty successMessage}">
                                <div class="alert alert-success border-0 shadow-sm">${successMessage}</div>
                            </c:if>

                            <div class="card overkill-card">
                                <div class="card-header border-0 d-flex justify-content-between align-items-center">
                                    <span class="card-title">💸 Active Mandi Quotations</span>
                                    <div class="badge bg-info bg-opacity-10 text-info fw-950 px-4 py-2 rounded-pill uppercase"
                                        style="font-size: 10px; letter-spacing: 1px; border: 1px solid rgba(6, 182, 212, 0.2);">
                                        ${fn:length(prices)} FEED NODES</div>
                                </div>

                                <div class="table-container p-0">
                                    <table class="v3-data-table mb-0">
                                        <thead>
                                            <tr>
                                                <th class="ps-4">CROP TYPE</th>
                                                <th>MARKET / MANDI</th>
                                                <th>JURISDICTION</th>
                                                <th>MODAL VALUE</th>
                                                <th>UNIT</th>
                                                <th>TIMESTAMP</th>
                                                <th>ACTIONS</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${prices}" var="p">
                                                <tr>
                                                    <td class="ps-4">
                                                        <div class="text-white fw-bold">${p.cropName}</div>
                                                    </td>
                                                    <td>
                                                        <div class="text-white-50">${p.market}</div>
                                                    </td>
                                                    <td>
                                                        <span class="badge bg-primary bg-opacity-10 text-primary"
                                                            style="font-size: 10px;">${p.state}</span>
                                                    </td>
                                                    <td>
                                                        <div class="price-badge">₹${p.modalPrice}</div>
                                                        <div class="text-muted"
                                                            style="font-size: 10px; margin-top: 4px;">Spread:
                                                            ₹${p.minPrice} - ₹${p.maxPrice}</div>
                                                    </td>
                                                    <td class="text-muted">${p.unit}</td>
                                                    <td class="text-muted italic" style="font-size: 11px;">
                                                        ${p.priceDate}</td>
                                                    <td>
                                                        <div class="d-flex gap-2">
                                                            <button class="btn btn-sm btn-outline-info"
                                                                onclick="editPrice('${p.id}', '${p.cropName}', '${p.market}', '${p.state}', '${p.unit}', '${p.minPrice}', '${p.maxPrice}', '${p.modalPrice}', '${p.priceDate}')">EDIT</button>
                                                            <form
                                                                action="${pageContext.request.contextPath}/admin/market-prices/delete/${p.id}"
                                                                method="post" class="d-inline">
                                                                <button type="submit"
                                                                    class="btn btn-sm btn-outline-danger"
                                                                    onclick="return confirm('PURGE PRICE RECORD?')">PURGE</button>
                                                            </form>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Inject Price Modal -->
                <div class="sc-modal-overlay" id="addPriceModal">
                    <div class="sc-modal" style="max-width: 600px;">
                        <div class="sc-modal-header border-0 bg-surface">
                            <span class="sc-modal-title">📈 Inject Market Price Telemetry</span>
                            <div class="sc-modal-close" onclick="closeModal('addPriceModal')"></div>
                        </div>
                        <form action="${pageContext.request.contextPath}/admin/market-prices/add" method="post">
                            <div class="sc-modal-body bg-dark p-4">
                                <div class="row g-4">
                                    <div class="col-md-6">
                                        <label class="form-label text-muted small">CROP IDENTIFIER</label>
                                        <input type="text" name="cropName" class="form-control"
                                            placeholder="e.g. Wheat (Kanal)" required />
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label text-muted small">MANDI / MARKET HUB</label>
                                        <input type="text" name="market" class="form-control" placeholder="Hub Location"
                                            required />
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label text-muted small">STATE JURISDICTION</label>
                                        <select name="state" class="form-control">
                                            <option value="Punjab">Punjab</option>
                                            <option value="Haryana">Haryana</option>
                                            <option value="Maharashtra">Maharashtra</option>
                                            <option value="Gujarat">Gujarat</option>
                                            <option value="Karnataka">Karnataka</option>
                                            <option value="Tamil Nadu">Tamil Nadu</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label text-muted small">MEASUREMENT UNIT</label>
                                        <select name="unit" class="form-control">
                                            <option value="Quintal">Quintal (100Kg)</option>
                                            <option value="Kg">Kilogram</option>
                                            <option value="Ton">Metric Ton</option>
                                        </select>
                                    </div>
                                    <div class="col-md-4">
                                        <label class="form-label text-muted small">MIN RATE (₹)</label>
                                        <input type="number" name="minPrice" class="form-control" step="0.01"
                                            required />
                                    </div>
                                    <div class="col-md-4">
                                        <label class="form-label text-muted small">MAX RATE (₹)</label>
                                        <input type="number" name="maxPrice" class="form-control" step="0.01"
                                            required />
                                    </div>
                                    <div class="col-md-4">
                                        <label class="form-label text-muted small">MODAL RATE (₹)</label>
                                        <input type="number" name="modalPrice" class="form-control" step="0.01"
                                            required />
                                    </div>
                                    <div class="col-12">
                                        <label class="form-label text-muted small">VALUATION TIMESTAMP</label>
                                        <input type="date" name="priceDate" class="form-control" required id="pdate" />
                                    </div>
                                </div>
                            </div>
                            <div class="sc-modal-footer border-0 bg-surface">
                                <button type="button" class="btn btn-outline-secondary px-4"
                                    onclick="closeModal('addPriceModal')">ABORT</button>
                                <button type="submit" class="btn btn-primary px-5">COMMIT FEED</button>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- Edit Price Modal -->
                <div class="sc-modal-overlay" id="editPriceModal">
                    <div class="sc-modal" style="max-width: 600px;">
                        <div class="sc-modal-header border-0 bg-surface">
                            <span class="sc-modal-title">⚙️ Reconfigure Price Node</span>
                            <div class="sc-modal-close" onclick="closeModal('editPriceModal')"></div>
                        </div>
                        <form action="${pageContext.request.contextPath}/admin/market-prices/edit" method="post">
                            <input type="hidden" name="id" id="edit-id">
                            <div class="sc-modal-body bg-dark p-4">
                                <div class="row g-4">
                                    <div class="col-md-6">
                                        <label class="form-label text-muted small">CROP IDENTIFIER</label>
                                        <input type="text" name="cropName" id="edit-cropName" class="form-control"
                                            required />
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label text-muted small">MANDI / MARKET HUB</label>
                                        <input type="text" name="market" id="edit-market" class="form-control"
                                            required />
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label text-muted small">STATE JURISDICTION</label>
                                        <select name="state" id="edit-state" class="form-control">
                                            <option value="Punjab">Punjab</option>
                                            <option value="Haryana">Haryana</option>
                                            <option value="Maharashtra">Maharashtra</option>
                                            <option value="Gujarat">Gujarat</option>
                                            <option value="Karnataka">Karnataka</option>
                                            <option value="Tamil Nadu">Tamil Nadu</option>
                                            <option value="Uttar Pradesh">Uttar Pradesh</option>
                                            <option value="Delhi">Delhi</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label text-muted small">MEASUREMENT UNIT</label>
                                        <select name="unit" id="edit-unit" class="form-control">
                                            <option value="Quintal">Quintal (100Kg)</option>
                                            <option value="Kg">Kilogram</option>
                                            <option value="Ton">Metric Ton</option>
                                        </select>
                                    </div>
                                    <div class="col-md-4">
                                        <label class="form-label text-muted small">MIN RATE (₹)</label>
                                        <input type="number" name="minPrice" id="edit-minPrice" class="form-control"
                                            step="0.01" required />
                                    </div>
                                    <div class="col-md-4">
                                        <label class="form-label text-muted small">MAX RATE (₹)</label>
                                        <input type="number" name="maxPrice" id="edit-maxPrice" class="form-control"
                                            step="0.01" required />
                                    </div>
                                    <div class="col-md-4">
                                        <label class="form-label text-muted small">MODAL RATE (₹)</label>
                                        <input type="number" name="modalPrice" id="edit-modalPrice" class="form-control"
                                            step="0.01" required />
                                    </div>
                                    <div class="col-12">
                                        <label class="form-label text-muted small">VALUATION TIMESTAMP</label>
                                        <input type="date" name="priceDate" id="edit-priceDate" class="form-control"
                                            required />
                                    </div>
                                </div>
                            </div>
                            <div class="sc-modal-footer border-0 bg-surface">
                                <button type="button" class="btn btn-outline-secondary px-4"
                                    onclick="closeModal('editPriceModal')">ABORT</button>
                                <button type="submit" class="btn btn-info px-5 text-white fw-bold">UPDATE FEED</button>
                            </div>
                        </form>
                    </div>
                </div>

                <script src="${pageContext.request.contextPath}/js/background-switcher.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                <script>
                    function toggleSidebar() { document.getElementById('sidebar').classList.toggle('open'); }
                    function openModal(id) { document.getElementById(id).classList.add('show'); }
                    function closeModal(id) { document.getElementById(id).classList.remove('show'); }
                    document.getElementById('pdate').valueAsDate = new Date();

                    function editPrice(id, crop, market, state, unit, min, max, modal, date) {
                        document.getElementById('edit-id').value = id;
                        document.getElementById('edit-cropName').value = crop;
                        document.getElementById('edit-market').value = market;
                        document.getElementById('edit-state').value = state;
                        document.getElementById('edit-unit').value = unit;
                        document.getElementById('edit-minPrice').value = min;
                        document.getElementById('edit-maxPrice').value = max;
                        document.getElementById('edit-modalPrice').value = modal;
                        document.getElementById('edit-priceDate').value = date;
                        openModal('editPriceModal');
                    }
                </script>
            </body>

            </html>