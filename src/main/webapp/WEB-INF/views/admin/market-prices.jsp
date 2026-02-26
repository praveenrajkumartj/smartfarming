<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>Market Prices - Admin Panel</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                <link rel="icon" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>📈</text></svg>" />
            </head>

            <body>
                <div class="dashboard-layout">
                    <aside class="sidebar" id="sidebar">
                        <div class="sidebar-brand" style="cursor: pointer;" onclick="window.location.href='${pageContext.request.contextPath}/'">
                            <div class="brand-icon">🌾</div>
                            <div class="brand-text">
                                <h3>Smart Farming</h3><span>Admin Panel</span>
                            </div>
                        </div>
                        <nav class="sidebar-nav">
                            <div class="nav-section-title">Admin Menu</div>
                            <a href="${pageContext.request.contextPath}/admin/dashboard"><span
                                    class="nav-icon">📊</span> Dashboard</a>
                            <a href="${pageContext.request.contextPath}/admin/users"><span class="nav-icon">👥</span> Manage Users</a>
                            <a href="${pageContext.request.contextPath}/admin/crops"><span class="nav-icon">🌾</span> Manage Crops</a>
                            <a href="${pageContext.request.contextPath}/admin/market-prices" class="active"><span
                                    class="nav-icon">📈</span> Market Prices</a>
                            <a href="${pageContext.request.contextPath}/admin/schemes"><span class="nav-icon">🏛️</span>
                                Govt. Schemes</a>
                            <a href="${pageContext.request.contextPath}/admin/disease-queries"><span
                                    class="nav-icon">🔬</span> Disease Queries</a>
                            <a href="${pageContext.request.contextPath}/admin/marketplace"><span
                                    class="nav-icon">📈</span> Marketplace</a>
                            <a href="${pageContext.request.contextPath}/admin/learning-videos"><span
                                    class="nav-icon">🎓</span> Learning Videos</a>
                            <div class="nav-section-title">Account</div>
                            <a href="${pageContext.request.contextPath}/logout"><span class="nav-icon">🚪</span> Logout</a>
                        </nav>
                    </aside>
                    <div class="main-content">
                        <header class="top-nav">
                            <div class="top-nav-left">
                                <div class="hamburger" onclick="toggleSidebar()"><span></span><span></span><span></span>
                                </div>
                                <span class="page-title">✨ Manage Market Prices</span>
                            </div>
                            <div class="top-nav-right">
                                <button class="btn btn-primary" onclick="openModal('addPriceModal')">+ Add
                                    Price</button>
                            </div>
                        </header>
                        <div class="page-body">
                            <c:if test="${not empty successMessage}">
                                <div class="alert alert-success">✅ <span>${successMessage}</span></div>
                            </c:if>
                            <div class="card">
                                <div class="card-header">
                                    <span class="card-title">✨ Mandi Price Records</span>
                                    <span class="badge badge-success">${fn:length(prices)} records</span>
                                </div>
                                <div class="table-container">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Crop</th>
                                                <th>Market/Mandi</th>
                                                <th>State</th>
                                                <th>Min ?</th>
                                                <th>Max ?</th>
                                                <th>Modal ?</th>
                                                <th>Unit</th>
                                                <th>Date</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${prices}" var="p" varStatus="iStat">
                                                <tr>
                                                    <td style="color:#6b7280;font-size:11px;">${iStat.count}</td>
                                                    <td><strong style="color:#22c55e;">${p.cropName}</strong></td>
                                                    <td style="font-size:12px;">${p.market}</td>
                                                    <td><span class="badge badge-info">${p.state}</span></td>
                                                    <td>${p.minPrice}</td>
                                                    <td>${p.maxPrice}</td>
                                                    <td><strong style="color:#4ade80;">${p.modalPrice}</strong></td>
                                                    <td style="font-size:12px;">${p.unit}</td>
                                                    <td style="font-size:11px;color:#9ca3af;">${p.priceDate}</td>
                                                    <td>
                                                        <form
                                                            action="${pageContext.request.contextPath}/admin/market-prices/delete/${p.id}"
                                                            method="post"
                                                            onsubmit="return confirm('Delete this price record?')">
                                                            <button type="submit"
                                                                class="btn btn-danger btn-sm">Delete</button>
                                                        </form>
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

                <!-- Add Price Modal -->
                <div class="modal-overlay" id="addPriceModal">
                    <div class="modal">
                        <div class="modal-header">
                            <span class="modal-title">Add Market Price</span>
                            <div class="modal-close" onclick="closeModal('addPriceModal')"></div>
                        </div>
                        <form action="${pageContext.request.contextPath}/admin/market-prices/add" method="post">
                            <div class="modal-body">
                                <div style="display:grid;grid-template-columns:1fr 1fr;gap:14px;">
                                    <div class="form-group">
                                        <label class="form-label">Crop Name</label>
                                        <input type="text" name="cropName" class="form-control" placeholder="e.g. Wheat"
                                            required />
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Market / Mandi</label>
                                        <input type="text" name="market" class="form-control"
                                            placeholder="e.g. Azadpur Mandi" required />
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">State</label>
                                        <select name="state" class="form-control">
                                            <option value="Punjab">Punjab</option>
                                            <option value="Haryana">Haryana</option>
                                            <option value="Uttar Pradesh">Uttar Pradesh</option>
                                            <option value="Maharashtra">Maharashtra</option>
                                            <option value="Gujarat">Gujarat</option>
                                            <option value="Rajasthan">Rajasthan</option>
                                            <option value="Madhya Pradesh">Madhya Pradesh</option>
                                            <option value="Karnataka">Karnataka</option>
                                            <option value="Delhi">Delhi</option>
                                            <option value="Bihar">Bihar</option>
                                            <option value="West Bengal">West Bengal</option>
                                            <option value="Tamil Nadu">Tamil Nadu</option>
                                            <option value="Andhra Pradesh">Andhra Pradesh</option>
                                            <option value="Telangana">Telangana</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Unit</label>
                                        <select name="unit" class="form-control">
                                            <option value="Quintal">Quintal</option>
                                            <option value="Kg">Kilogram</option>
                                            <option value="Ton">Ton</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Min Price (?)</label>
                                        <input type="number" name="minPrice" class="form-control" placeholder="2000"
                                            step="0.01" required />
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Max Price (?)</label>
                                        <input type="number" name="maxPrice" class="form-control" placeholder="3000"
                                            step="0.01" required />
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Modal Price (?)</label>
                                        <input type="number" name="modalPrice" class="form-control" placeholder="2500"
                                            step="0.01" required />
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Price Date</label>
                                        <input type="date" name="priceDate" class="form-control" required />
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary"
                                    onclick="closeModal('addPriceModal')">Cancel</button>
                                <button type="submit" class="btn btn-primary">Add Price Record</button>
                            </div>
                        </form>
                    </div>
                </div>

                <script>
                    function toggleSidebar() { document.getElementById('sidebar').classList.toggle('open'); }
                    function openModal(id) { document.getElementById(id).classList.add('show'); }
                    function closeModal(id) { document.getElementById(id).classList.remove('show'); }
                    document.querySelectorAll('.modal-overlay').forEach(o => {
                        o.addEventListener('click', e => { if (e.target === o) o.classList.remove('show'); });
                    });
                    document.querySelector('input[type="date"]').valueAsDate = new Date();
                </script>
            
<script src="${pageContext.request.contextPath}/js/i18n.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

            </html>
