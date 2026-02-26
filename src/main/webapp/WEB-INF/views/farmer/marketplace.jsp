<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
                <!DOCTYPE html>
                <html>

                <head>
                    <meta charset="UTF-8" />
                    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                    <title>My Marketplace - Smart Farming Platform</title>
                        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                    <link rel="icon" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🛒</text></svg>" />
                </head>

                <body>
                    <div class="dashboard-layout">
                        <aside class="sidebar" id="sidebar">
                            <div class="sidebar-brand" style="cursor: pointer;" onclick="window.location.href='${pageContext.request.contextPath}/'">
                                <div class="brand-icon">🌾</div>
                                <div class="brand-text">
                                    <h3>Smart Farming</h3><span>Farmer Portal</span>
                                </div>
                            </div>
                            <nav class="sidebar-nav">
                                <div class="nav-section-title">Main Menu</div>
                                <a href="${pageContext.request.contextPath}/farmer/dashboard"><span
                                        class="nav-icon">📊</span> Dashboard</a>
                                <a href="${pageContext.request.contextPath}/farmer/crop-recommendation"><span
                                        class="nav-icon">🌱</span> Crop Recommendation</a>
                                <a href="${pageContext.request.contextPath}/farmer/market-prices"><span
                                        class="nav-icon">📈</span> Market Prices</a>
                                <a href="${pageContext.request.contextPath}/farmer/disease-detection"><span
                                        class="nav-icon">🔬</span> Disease Detection</a>
                                <a href="${pageContext.request.contextPath}/farmer/marketplace" class="active"><span
                                        class="nav-icon">🛒</span> My Marketplace</a>
                                <a href="${pageContext.request.contextPath}/farmer/schemes"><span
                                        class="nav-icon">🏛️</span> Govt. Schemes</a>
                                <a href="${pageContext.request.contextPath}/farmer/learning"><span
                                        class="nav-icon">🎓</span> Learning Videos</a>
                                <div class="nav-section-title">Account</div>
                                <a href="${pageContext.request.contextPath}/logout"><span class="nav-icon">🚪</span> Logout</a>
                            </nav>
                        </aside>

                        <div class="main-content">
                            <header class="top-nav">
                                <div class="top-nav-left">
                                    <div class="hamburger" onclick="toggleSidebar()">
                                        <span></span><span></span><span></span></div>
                                    <span class="page-title">✨ My Marketplace Listings</span>
                                </div>
                                <div class="top-nav-right">
                                    <button class="btn btn-primary" onclick="openModal('addListingModal')">
                                        + Add New Listing
                                    </button>
                                </div>
                            </header>

                            <div class="page-body">
                                <c:if test="${not empty successMessage}">
                                    <div class="alert alert-success">
                                        ✅ <span>${successMessage}</span>
                                    </div>
                                </c:if>

                                <!-- Listings Table -->
                                <div class="card">
                                    <div class="card-header">
                                        <span class="card-title">✨ My Listings</span>
                                        <span class="badge badge-success">${fn:length(myListings)} listings</span>
                                    </div>

                                    <c:if test="${empty myListings}">
                                        <div class="empty-state">
                                            <div class="empty-state-icon">📍</div>
                                            <h3>No listings yet</h3>
                                            <p>Click "Add New Listing" to start selling your crops</p>
                                            <br />
                                            <button class="btn btn-primary" onclick="openModal('addListingModal')">
                                                + Create First Listing
                                            </button>
                                        </div>
                                    </c:if>

                                    <c:if test="${not empty myListings}">
                                        <div class="table-container">
                                            <table>
                                                <thead>
                                                    <tr>
                                                        <th>Crop Name</th>
                                                        <th>Quantity</th>
                                                        <th>Price/Unit</th>
                                                        <th>Total Value</th>
                                                        <th>Location</th>
                                                        <th>Status</th>
                                                        <th>Posted</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${myListings}" var="l">
                                                        <tr>
                                                            <td><strong style="color:#22c55e;">${l.cropName}</strong>
                                                            </td>
                                                            <td>${l.quantity} ${l.unit}</td>
                                                            <td>${l.pricePerUnit}/${l.unit}</td>
                                                            <td><strong style="color:#fcd34d;">${l.quantity *
                                                                    l.pricePerUnit}</strong></td>
                                                            <td style="font-size:12px;">${l.location}</td>
                                                            <td>
                                                                <span
                                                                    class="badge ${l.status == 'AVAILABLE' ? 'badge-success' : (l.status == 'SOLD' ? 'badge-danger' : 'badge-warning')}">
                                                                    ${l.status}
                                                                </span>
                                                            </td>
                                                            <td style="font-size:12px;color:#9ca3af;">
                                                                <fmt:parseDate value="${l.createdAt}"
                                                                    pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDate"
                                                                    type="both" />
                                                                <fmt:formatDate value="${parsedDate}"
                                                                    pattern="dd MMM yyyy" />
                                                            </td>
                                                            <td>
                                                                <form
                                                                    action="${pageContext.request.contextPath}/farmer/marketplace/delete/${l.id}"
                                                                    method="post"
                                                                    onsubmit="return confirm('Delete this listing?')">
                                                                    <button type="submit"
                                                                        class="btn btn-danger btn-sm">Delete</button>
                                                                </form>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Add Listing Modal -->
                    <div class="modal-overlay" id="addListingModal">
                        <div class="modal">
                            <div class="modal-header">
                                <span class="modal-title">Add New Crop Listing</span>
                                <div class="modal-close" onclick="closeModal('addListingModal')"></div>
                            </div>
                            <form action="${pageContext.request.contextPath}/farmer/marketplace/add" method="post">
                                <div class="modal-body">
                                    <div class="form-row" style="display:grid;grid-template-columns:1fr 1fr;gap:16px;">
                                        <div class="form-group">
                                            <label class="form-label">Crop Name</label>
                                            <input type="text" name="cropName" class="form-control"
                                                placeholder="e.g. Wheat" required />
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label">Unit</label>
                                            <select name="unit" class="form-control">
                                                <option value="Quintal">Quintal</option>
                                                <option value="Kg">Kilogram</option>
                                                <option value="Ton">Ton</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="form-row" style="display:grid;grid-template-columns:1fr 1fr;gap:16px;">
                                        <div class="form-group">
                                            <label class="form-label">Available Quantity</label>
                                            <input type="number" name="quantity" class="form-control" placeholder="50"
                                                min="1" step="0.1" required />
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label">Price per Unit (?)</label>
                                            <input type="number" name="pricePerUnit" class="form-control"
                                                placeholder="2500" min="1" step="0.1" required />
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="form-label">Description (Optional)</label>
                                        <textarea name="description" class="form-control" rows="3"
                                            placeholder="Quality of crop, any special details..."></textarea>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary"
                                        onclick="closeModal('addListingModal')">Cancel</button>
                                    <button type="submit" class="btn btn-primary">Post Listing</button>
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
                    </script>
                
<script src="${pageContext.request.contextPath}/js/i18n.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

                </html>
