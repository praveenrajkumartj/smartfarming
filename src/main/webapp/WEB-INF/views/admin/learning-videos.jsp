<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>Manage Learning Videos - Admin Portal</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                <link rel="icon" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🎓</text></svg>" />
                <style>
                    .table-responsive {
                        overflow-x: auto;
                        margin-top: 24px;
                    }

                    .data-table {
                        width: 100%;
                        border-collapse: collapse;
                        background: #111b11;
                        border-radius: 12px;
                        overflow: hidden;
                    }

                    .data-table th,
                    .data-table td {
                        padding: 16px;
                        text-align: left;
                        border-bottom: 1px solid rgba(22, 163, 74, 0.1);
                    }

                    .data-table th {
                        background: #162416;
                        color: #86efac;
                        font-size: 12px;
                        text-transform: uppercase;
                        letter-spacing: 0.5px;
                        font-weight: 600;
                    }

                    .data-table td {
                        color: #e5e7eb;
                        font-size: 14px;
                    }

                    .action-btns {
                        display: flex;
                        gap: 8px;
                    }
                </style>
            </head>

            <body>
                <div class="dashboard-layout">
                    <!-- Sidebar -->
                    <aside class="sidebar" id="sidebar">
                        <div class="sidebar-brand" style="cursor: pointer;" onclick="window.location.href='${pageContext.request.contextPath}/'">
                            <div class="brand-icon">🛒</div>
                            <div class="brand-text">
                                <h3>Admin Portal</h3><span>Smart Farming</span>
                            </div>
                        </div>
                        <nav class="sidebar-nav">
                            <div class="nav-section-title">Overview</div>
                            <a href="${pageContext.request.contextPath}/admin/dashboard"><span
                                    class="nav-icon">📊</span> Dashboard</a>

                            <div class="nav-section-title">Management</div>
                            <a href="${pageContext.request.contextPath}/admin/users"><span class="nav-icon">✨</span>
                                Users</a>
                            <a href="${pageContext.request.contextPath}/admin/crops"><span class="nav-icon">🌱</span> Crops</a>
                            <a href="${pageContext.request.contextPath}/admin/market-prices"><span
                                    class="nav-icon">📈</span> Market
                                Prices</a>
                            <a href="${pageContext.request.contextPath}/admin/schemes"><span class="nav-icon">🏛️</span>
                                Programs</a>
                            <a href="${pageContext.request.contextPath}/admin/marketplace"><span
                                    class="nav-icon">✨</span> Listings</a>
                            <a href="${pageContext.request.contextPath}/admin/learning-videos" class="active"><span
                                    class="nav-icon">🎓</span> Learning Videos</a>

                            <div class="nav-section-title">Support</div>
                            <a href="${pageContext.request.contextPath}/admin/disease-queries"><span
                                    class="nav-icon">🔬</span> Disease Queries</a>

                            <div class="nav-section-title">Account</div>
                            <a href="${pageContext.request.contextPath}/logout"><span class="nav-icon">🚪</span> Logout</a>
                        </nav>
                    </aside>

                    <!-- Main Content -->
                    <div class="main-content">
                        <header class="top-nav">
                            <div class="top-nav-left">
                                <div class="hamburger" onclick="toggleSidebar()"><span></span><span></span><span></span>
                                </div>
                                <span class="page-title">✨ Manage Learning Videos</span>
                            </div>
                        </header>

                        <div class="page-body">
                            <div class="section-header">
                                <div>
                                    <h2 class="section-title">Learning Videos</h2>
                                    <p class="section-subtitle">Add or manage YouTube videos for farmers</p>
                                </div>
                                <button class="btn btn-primary" onclick="openModal('addVideoModal')">Add
                                    Video</button>
                            </div>

                            <c:if test="${not empty successMessage}">
                                <div class="alert alert-success" style="margin-bottom: 24px;">
                                    ? ${successMessage}
                                </div>
                            </c:if>

                            <div class="table-responsive">
                                <table class="data-table">
                                    <thead>
                                        <tr>
                                            <th>Video Preview</th>
                                            <th>Title &amp; Category</th>
                                            <th>Description</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${videos}" var="video">
                                            <tr>
                                                <td>
                                                    <div
                                                        style="width: 140px; height: 80px; background: #000; border-radius: 8px; overflow: hidden; position: relative;">
                                                        <iframe src="${video.videoUrl}"
                                                            style="width: 100%; height: 100%; border: none; pointer-events: none;"></iframe>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div style="font-weight: 600; margin-bottom: 4px;">${video.title}
                                                    </div>
                                                    <span class="badge badge-info">${video.category}</span>
                                                </td>
                                                <td>
                                                    <div
                                                        style="max-width: 300px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; font-size: 13px; color: #9ca3af;">
                                                        ${video.description}
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="action-btns">
                                                        <form
                                                            action="${pageContext.request.contextPath}/admin/learning-videos/delete/${video.id}"
                                                            method="post" style="display:inline;"
                                                            onsubmit="return confirm('Are you sure you want to delete this video?');">
                                                            <button type="submit" class="btn btn-sm btn-danger"
                                                                style="background: rgba(239, 68, 68, 0.1); color: #ef4444; border: 1px solid rgba(239, 68, 68, 0.2);">Delete</button>
                                                        </form>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        <c:if test="${empty videos}">
                                            <tr>
                                                <td colspan="4"
                                                    style="text-align: center; padding: 32px; color: #6b7280;">No videos
                                                    added yet.</td>
                                            </tr>
                                        </c:if>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Add Video Modal -->
                <div class="modal-overlay" id="addVideoModal">
                    <div class="modal" style="max-width: 500px;">
                        <div class="modal-header">
                            <span class="modal-title">Add New Video</span>
                            <div class="modal-close" onclick="closeModal('addVideoModal')"></div>
                        </div>
                        <form action="${pageContext.request.contextPath}/admin/learning-videos/add" method="post">
                            <div class="modal-body">
                                <div class="form-group">
                                    <label class="form-label">Video Title</label>
                                    <input type="text" name="title" class="form-control" required
                                        placeholder="e.g. Modern Farming Techniques">
                                </div>

                                <div class="form-group">
                                    <label class="form-label">Category</label>
                                    <select name="category" class="form-control" required>
                                        <option value="crop">Crop Management</option>
                                        <option value="organic">Organic Farming</option>
                                        <option value="disease">Disease Control</option>
                                        <option value="machinery">Farm Machinery</option>
                                        <option value="general">General Agriculture</option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label class="form-label">YouTube Video Link</label>
                                    <input type="text" name="videoUrl" class="form-control" required
                                        placeholder="e.g. https://www.youtube.com/watch?v=...">
                                    <small style="color: #6b7280; margin-top: 4px; display: block;">Paste any YouTube
                                        watch
                                        link or embed link</small>
                                </div>

                                <div class="form-group">
                                    <label class="form-label">Description</label>
                                    <textarea name="description" class="form-control" rows="3" required
                                        placeholder="Brief description of what farmers will learn..."></textarea>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary"
                                    onclick="closeModal('addVideoModal')">Cancel</button>
                                <button type="submit" class="btn btn-primary">Save Video</button>
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
