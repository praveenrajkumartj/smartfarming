<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>Manage Crops - Admin Panel</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                <link rel="icon" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🌱</text></svg>" />
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
                            <a href="${pageContext.request.contextPath}/admin/crops" class="active"><span
                                    class="nav-icon">🌾</span> Manage Crops</a>
                            <a href="${pageContext.request.contextPath}/admin/market-prices"><span
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
                                <span class="page-title">🌱 Manage Crops</span>
                            </div>
                            <div class="top-nav-right">
                                <button class="btn btn-primary" onclick="openModal('addCropModal')">+ Add Crop</button>
                            </div>
                        </header>
                        <div class="page-body">
                            <c:if test="${not empty successMessage}">
                                <div class="alert alert-success">✅ <span>${successMessage}</span></div>
                            </c:if>

                            <div class="card">
                                <div class="card-header">
                                    <span class="card-title">🌱 Crop Database</span>
                                    <span class="badge badge-success">${fn:length(crops)} crops</span>
                                </div>
                                <div class="table-container">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Crop Name</th>
                                                <th>Season</th>
                                                <th>Soil Type</th>
                                                <th>Water Needed</th>
                                                <th>Duration</th>
                                                <th>Temp Range</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${crops}" var="crop" varStatus="iStat">
                                                <tr>
                                                    <td style="color:#6b7280;font-size:12px;">${iStat.count}</td>
                                                    <td><strong style="color:#22c55e;">${crop.name}</strong></td>
                                                    <td><span class="badge badge-success">${crop.season}</span></td>
                                                    <td style="font-size:13px;">${crop.soilType}</td>
                                                    <td style="font-size:13px;">${crop.waterRequirement}</td>
                                                    <td style="font-size:13px;">${crop.growthDuration}</td>
                                                    <td style="font-size:13px;">
                                                        ${crop.minTemperature}°C - ${crop.maxTemperature}°C
                                                    </td>
                                                    <td style="display:flex;gap:8px;">
                                                        <button class="btn btn-secondary btn-sm" data-id="${crop.id}"
                                                            data-name="${crop.name}" data-season="${crop.season}"
                                                            data-soil="${crop.soilType}"
                                                            data-water="${crop.waterRequirement}"
                                                            data-mint="${crop.minTemperature}"
                                                            data-maxt="${crop.maxTemperature}"
                                                            data-duration="${crop.growthDuration}"
                                                            data-desc="${crop.description}" data-img="${crop.imageUrl}"
                                                            onclick="handleEditClick(this)">Edit</button>
                                                        <form
                                                            action="${pageContext.request.contextPath}/admin/crops/delete/${crop.id}"
                                                            method="post"
                                                            onsubmit="return confirm('Delete this crop?')">
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

                <!-- Add Crop Modal -->
                <div class="modal-overlay" id="addCropModal">
                    <div class="modal">
                        <div class="modal-header">
                            <span class="modal-title">Add New Crop</span>
                            <div class="modal-close" onclick="closeModal('addCropModal')"></div>
                        </div>
                        <form action="${pageContext.request.contextPath}/admin/crops/add" method="post"
                            enctype="multipart/form-data">
                            <div class="modal-body">
                                <div style="display:grid;grid-template-columns:1fr 1fr;gap:14px;">
                                    <div class="form-group">
                                        <label class="form-label">Crop Name</label>
                                        <input type="text" name="name" class="form-control" placeholder="e.g. Wheat"
                                            required />
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Season</label>
                                        <select name="season" class="form-control">
                                            <option value="Kharif">Kharif</option>
                                            <option value="Rabi">Rabi</option>
                                            <option value="Annual">Annual</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Soil Type</label>
                                        <select name="soilType" class="form-control">
                                            <option value="Loamy">Loamy</option>
                                            <option value="Clay">Clay</option>
                                            <option value="Sandy">Sandy</option>
                                            <option value="Sandy Loam">Sandy Loam</option>
                                            <option value="Black">Black</option>
                                            <option value="Clay Loam">Clay Loam</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Water Requirement</label>
                                        <select name="waterRequirement" class="form-control">
                                            <option value="Low">Low</option>
                                            <option value="Medium">Medium</option>
                                            <option value="High">High</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Min Temp (°C)</label>
                                        <input type="number" name="minTemperature" class="form-control" placeholder="15"
                                            step="0.1" required />
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Max Temp (°C)</label>
                                        <input type="number" name="maxTemperature" class="form-control" placeholder="35"
                                            step="0.1" required />
                                    </div>
                                    <div class="form-group" style="grid-column:1/-1;">
                                        <label class="form-label">Growth Duration</label>
                                        <input type="text" name="growthDuration" class="form-control"
                                            placeholder="e.g. 90-120 days" required />
                                    </div>
                                    <div class="form-group" style="grid-column:1/-1;">
                                        <label class="form-label">Description</label>
                                        <textarea name="description" class="form-control" rows="3"
                                            placeholder="Brief description of the crop..."></textarea>
                                    </div>
                                    <div class="form-group" style="grid-column:1/-1; margin-top:10px;">
                                        <label class="form-label">Crop Image Source</label>
                                        <div style="display:grid;grid-template-columns:1fr 1fr;gap:20px;">
                                            <div>
                                                <span
                                                    style="font-size:11px;color:#22c55e;display:block;margin-bottom:4px;">Option
                                                    1: Image URL</span>
                                                <input type="text" name="imageUrl" class="form-control"
                                                    placeholder="https://example.com/image.jpg" />
                                            </div>
                                            <div>
                                                <span
                                                    style="font-size:11px;color:#22c55e;display:block;margin-bottom:4px;">Option
                                                    2: Upload File</span>
                                                <input type="file" name="imageFile" class="form-control"
                                                    accept="image/*" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary"
                                    onclick="closeModal('addCropModal')">Cancel</button>
                                <button type="submit" class="btn btn-primary">Add Crop</button>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- Edit Crop Modal -->
                <div class="modal-overlay" id="editCropModal">
                    <div class="modal">
                        <div class="modal-header">
                            <span class="modal-title">Edit Crop</span>
                            <div class="modal-close" onclick="closeModal('editCropModal')"></div>
                        </div>
                        <form action="${pageContext.request.contextPath}/admin/crops/edit" method="post"
                            enctype="multipart/form-data">
                            <input type="hidden" name="id" id="edit-id" />
                            <div class="modal-body">
                                <div style="display:grid;grid-template-columns:1fr 1fr;gap:14px;">
                                    <div class="form-group">
                                        <label class="form-label">Crop Name</label>
                                        <input type="text" name="name" id="edit-name" class="form-control" required />
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Season</label>
                                        <select name="season" id="edit-season" class="form-control">
                                            <option value="Kharif">Kharif</option>
                                            <option value="Rabi">Rabi</option>
                                            <option value="Annual">Annual</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Soil Type</label>
                                        <select name="soilType" id="edit-soilType" class="form-control">
                                            <option value="Loamy">Loamy</option>
                                            <option value="Clay">Clay</option>
                                            <option value="Sandy">Sandy</option>
                                            <option value="Sandy Loam">Sandy Loam</option>
                                            <option value="Black">Black</option>
                                            <option value="Clay Loam">Clay Loam</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Water Requirement</label>
                                        <select name="waterRequirement" id="edit-waterRequirement" class="form-control">
                                            <option value="Low">Low</option>
                                            <option value="Medium">Medium</option>
                                            <option value="High">High</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Min Temp (°C)</label>
                                        <input type="number" name="minTemperature" id="edit-minTemp"
                                            class="form-control" step="0.1" required />
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Max Temp (°C)</label>
                                        <input type="number" name="maxTemperature" id="edit-maxTemp"
                                            class="form-control" step="0.1" required />
                                    </div>
                                    <div class="form-group" style="grid-column:1/-1;">
                                        <label class="form-label">Growth Duration</label>
                                        <input type="text" name="growthDuration" id="edit-duration" class="form-control"
                                            required />
                                    </div>
                                    <div class="form-group" style="grid-column:1/-1;">
                                        <label class="form-label">Description</label>
                                        <textarea name="description" id="edit-description" class="form-control"
                                            rows="3"></textarea>
                                    </div>
                                    <div class="form-group" style="grid-column:1/-1; margin-top:10px;">
                                        <label class="form-label">Crop Image Source</label>
                                        <div style="display:grid;grid-template-columns:1fr 1fr;gap:20px;">
                                            <div>
                                                <span
                                                    style="font-size:11px;color:#22c55e;display:block;margin-bottom:4px;">Option
                                                    1: Update URL</span>
                                                <input type="text" name="imageUrl" id="edit-imageUrl"
                                                    class="form-control" placeholder="https://example.com/image.jpg" />
                                            </div>
                                            <div>
                                                <span
                                                    style="font-size:11px;color:#22c55e;display:block;margin-bottom:4px;">Option
                                                    2: Upload New File</span>
                                                <input type="file" name="imageFile" class="form-control"
                                                    accept="image/*" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary"
                                    onclick="closeModal('editCropModal')">Cancel</button>
                                <button type="submit" class="btn btn-primary">Save Changes</button>
                            </div>
                        </form>
                    </div>
                </div>

                <script>
                    function handleEditClick(btn) {
                        const id = btn.getAttribute('data-id');
                        const name = btn.getAttribute('data-name');
                        const season = btn.getAttribute('data-season');
                        const soil = btn.getAttribute('data-soil');
                        const water = btn.getAttribute('data-water');
                        const mint = btn.getAttribute('data-mint');
                        const maxt = btn.getAttribute('data-maxt');
                        const duration = btn.getAttribute('data-duration');
                        const desc = btn.getAttribute('data-desc');
                        const img = btn.getAttribute('data-img');
                        openEditModal(id, name, season, soil, water, mint, maxt, duration, desc, img);
                    }
                    function openEditModal(id, name, season, soil, water, minT, maxT, duration, desc, img) {
                        document.getElementById('edit-id').value = id;
                        document.getElementById('edit-name').value = name;
                        document.getElementById('edit-season').value = season;
                        document.getElementById('edit-soilType').value = soil;
                        document.getElementById('edit-waterRequirement').value = water;
                        document.getElementById('edit-minTemp').value = minT;
                        document.getElementById('edit-maxTemp').value = maxT;
                        document.getElementById('edit-duration').value = duration;
                        document.getElementById('edit-description').value = desc;
                        document.getElementById('edit-imageUrl').value = img;
                        openModal('editCropModal');
                    }
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
