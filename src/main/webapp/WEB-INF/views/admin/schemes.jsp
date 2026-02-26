<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>Govt Schemes - Admin Panel</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                <link rel="icon" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🏛️</text></svg>" />
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
                            <a href="${pageContext.request.contextPath}/admin/market-prices"><span
                                    class="nav-icon">📈</span> Market Prices</a>
                            <a href="${pageContext.request.contextPath}/admin/schemes" class="active"><span
                                    class="nav-icon">🏛️</span> Govt. Schemes</a>
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
                                <span class="page-title">🏛️ Manage Govt. Schemes</span>
                            </div>
                            <div class="top-nav-right">
                                <button class="btn btn-primary" onclick="openModal('addSchemeModal')">+ Add
                                    Scheme</button>
                            </div>
                        </header>
                        <div class="page-body">
                            <c:if test="${not empty successMessage}">
                                <div class="alert alert-success">✅ <span>${successMessage}</span></div>
                            </c:if>
                            <div class="card">
                                <div class="card-header">
                                    <span class="card-title">🏛️ Government Scheme Database</span>
                                    <span class="badge badge-success">${fn:length(schemes)} schemes</span>
                                </div>
                                <div class="table-container">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Scheme Title</th>
                                                <th>Category</th>
                                                <th>Eligibility</th>
                                                <th>Benefits</th>
                                                <th>Deadline</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${schemes}" var="s" varStatus="iStat">
                                                <tr>
                                                    <td style="color:#6b7280;font-size:11px;">${iStat.count}</td>
                                                    <td>
                                                        <div
                                                            style="font-weight:700;color:#f0fdf4;font-size:13px;max-width:200px;">
                                                            ${s.title}</div>
                                                        <div style="font-size:11px;color:#6b7280;max-width:200px;">
                                                            <c:choose>
                                                                <c:when test="${fn:length(s.description) > 60}">
                                                                    ${fn:substring(s.description, 0, 60)}...
                                                                </c:when>
                                                                <c:otherwise>
                                                                    ${s.description}
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </div>
                                                    </td>
                                                    <td><span class="badge badge-success">${s.category}</span></td>
                                                    <td style="font-size:12px;color:#9ca3af;max-width:150px;">
                                                        <c:choose>
                                                            <c:when test="${fn:length(s.eligibility) > 60}">
                                                                ${fn:substring(s.eligibility, 0, 60)}...
                                                            </c:when>
                                                            <c:otherwise>
                                                                ${s.eligibility}
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td style="font-size:12px;color:#9ca3af;max-width:150px;">
                                                        <c:choose>
                                                            <c:when test="${fn:length(s.benefits) > 60}">
                                                                ${fn:substring(s.benefits, 0, 60)}...
                                                            </c:when>
                                                            <c:otherwise>
                                                                ${s.benefits}
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td style="font-size:12px;color:#fcd34d;">${s.lastDate}</td>
                                                    <td>
                                                        <form
                                                            action="${pageContext.request.contextPath}/admin/schemes/delete/${s.id}"
                                                            method="post"
                                                            onsubmit="return confirm('Delete this scheme?')">
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

                <!-- Add Scheme Modal -->
                <div class="modal-overlay" id="addSchemeModal">
                    <div class="modal" style="max-width:600px;">
                        <div class="modal-header">
                            <span class="modal-title">🏛️ Add Government Scheme</span>
                            <div class="modal-close" onclick="closeModal('addSchemeModal')"></div>
                        </div>
                        <form action="${pageContext.request.contextPath}/admin/schemes/add" method="post">
                            <div class="modal-body">
                                <div class="form-group">
                                    <label class="form-label">Scheme Title</label>
                                    <input type="text" name="title" class="form-control"
                                        placeholder="e.g. PM-KISAN Scheme" required />
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Description</label>
                                    <textarea name="description" class="form-control" rows="3"
                                        placeholder="Detailed description of the scheme..." required></textarea>
                                </div>
                                <div style="display:grid;grid-template-columns:1fr 1fr;gap:14px;">
                                    <div class="form-group">
                                        <label class="form-label">Category</label>
                                        <select name="category" class="form-control">
                                            <option value="Financial Aid">Financial Aid</option>
                                            <option value="Insurance">Insurance</option>
                                            <option value="Technology">Technology</option>
                                            <option value="Irrigation">Irrigation</option>
                                            <option value="Organic Farming">Organic Farming</option>
                                            <option value="Marketing">Marketing</option>
                                            <option value="Training">Training</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Application Deadline</label>
                                        <input type="date" name="lastDate" class="form-control" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Eligibility Criteria</label>
                                    <textarea name="eligibility" class="form-control" rows="2"
                                        placeholder="Who can apply..."></textarea>
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Benefits</label>
                                    <textarea name="benefits" class="form-control" rows="2"
                                        placeholder="What farmers will get..."></textarea>
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Application Link (URL)</label>
                                    <input type="url" name="applicationLink" class="form-control"
                                        placeholder="https://..." />
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary"
                                    onclick="closeModal('addSchemeModal')">Cancel</button>
                                <button type="submit" class="btn btn-primary">🏛️ Add Scheme</button>
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
