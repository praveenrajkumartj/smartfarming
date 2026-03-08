<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>🎓 Knowledge Repository - AGROPLANTER Admin</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                <link rel="icon"
                    href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🎓</text></svg>" />
                <style>
                    .video-grid {
                        display: grid;
                        grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
                        gap: 20px;
                    }

                    .video-admin-card {
                        background: rgba(30, 41, 59, 0.5);
                        border: 1px solid rgba(124, 58, 237, 0.1);
                        border-radius: 16px;
                        overflow: hidden;
                        transition: 0.3s;
                    }

                    .video-admin-card:hover {
                        transform: translateY(-5px);
                        border-color: rgba(124, 58, 237, 0.4);
                        background: rgba(30, 41, 59, 0.8);
                    }

                    .video-preview-box {
                        position: relative;
                        padding-top: 56.25%;
                        /* 16:9 */
                        background: #000;
                    }

                    .video-preview-box iframe {
                        position: absolute;
                        top: 0;
                        left: 0;
                        width: 100%;
                        height: 100%;
                        pointer-events: none;
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
                                class="sidebar-nav-item mb-2"><span class="nav-icon">📈</span> Data Streams</a>
                            <a href="${pageContext.request.contextPath}/admin/schemes"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">🏛️</span> Institutional</a>
                            <a href="${pageContext.request.contextPath}/admin/learning-videos"
                                class="sidebar-nav-item active mb-2"><span class="nav-icon">🎓</span> Academy
                                Manager</a>

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
                                <span class="page-title">🎓 Knowledge Asset Management</span>
                            </div>
                            <div class="top-nav-right">
                                <button class="btn btn-primary px-4 rounded-pill fw-bold me-3"
                                    onclick="openModal('addVideoModal')">+ INGEST EDUCATION ASSET</button>
                                <div class="user-info"
                                    style="gap: 15px; cursor: pointer; display: flex; align-items: center;"
                                    onclick="window.location.href='${pageContext.request.contextPath}/admin/learning-videos'">
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

                            <div class="section-header mb-4">
                                <h2 class="section-title">Educational Assets</h2>
                                <p class="section-subtitle">Curating digital training modules for the rural workforce.
                                </p>
                            </div>

                            <div class="video-grid">
                                <c:forEach items="${videos}" var="video">
                                    <div class="video-admin-card">
                                        <div class="video-preview-box">
                                            <iframe src="${video.videoUrl}" frameborder="0"></iframe>
                                        </div>
                                        <div class="p-4">
                                            <div class="badge bg-primary bg-opacity-10 text-primary mb-2"
                                                style="font-size: 10px;">${video.category}</div>
                                            <h5 class="text-white fw-bold truncate-2 mb-2" style="font-size: 15px;">
                                                ${video.title}</h5>
                                            <p class="text-muted small truncate-2 mb-4">${video.description}</p>

                                            <div class="d-flex justify-content-between align-items-center">
                                                <div class="d-flex gap-2">
                                                    <button class="btn btn-sm btn-outline-info"
                                                        onclick="editVideo('${video.id}', '${fn:escapeXml(video.title)}', '${video.videoUrl}', '${video.category}', '${fn:escapeXml(video.description)}')">EDIT</button>
                                                    <form
                                                        action="${pageContext.request.contextPath}/admin/learning-videos/delete/${video.id}"
                                                        method="post">
                                                        <button type="submit" class="btn btn-sm btn-outline-danger"
                                                            onclick="return confirm('PURGE EDUCATION ASSET?')">PURGE</button>
                                                    </form>
                                                </div>
                                                <span class="text-muted small italic">ID: #${video.id}</span>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                                <c:if test="${empty videos}">
                                    <div class="col-12 text-center py-5 opacity-25">Knowledge repository is currently
                                        empty.</div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Ingest Video Modal -->
                <div class="sc-modal-overlay" id="addVideoModal">
                    <div class="sc-modal" style="max-width: 500px;">
                        <div class="sc-modal-header border-0 bg-surface">
                            <span class="sc-modal-title">🎓 Education Asset Ingestion</span>
                            <div class="sc-modal-close" onclick="closeModal('addVideoModal')"></div>
                        </div>
                        <form action="${pageContext.request.contextPath}/admin/learning-videos/add" method="post">
                            <div class="sc-modal-body bg-dark p-4">
                                <div class="mb-4">
                                    <label class="form-label text-muted small">MODULE TITLE</label>
                                    <input type="text" name="title" class="form-control"
                                        placeholder="e.g. Precision Irrigation v2.0" required />
                                </div>
                                <div class="mb-4">
                                    <label class="form-label text-muted small">DOMAIN CATEGORY</label>
                                    <select name="category" class="form-control" required>
                                        <option value="crop">Crop Optimization</option>
                                        <option value="organic">Organic Protocols</option>
                                        <option value="disease">Bio-Security</option>
                                        <option value="machinery">Automation & Machinery</option>
                                        <option value="general">Rural Economics</option>
                                    </select>
                                </div>
                                <div class="mb-4">
                                    <label class="form-label text-muted small">YOUTUBE SOURCE URL</label>
                                    <input type="text" name="videoUrl" class="form-control"
                                        placeholder="https://youtube.com/..." required />
                                </div>
                                <div class="mb-4">
                                    <label class="form-label text-muted small">CONCEPTUAL OVERVIEW</label>
                                    <textarea name="description" class="form-control" rows="3"
                                        placeholder="Learning objectives..." required></textarea>
                                </div>
                            </div>
                            <div class="sc-modal-footer border-0 bg-surface">
                                <button type="button" class="btn btn-outline-secondary px-4"
                                    onclick="closeModal('addVideoModal')">ABORT</button>
                                <button type="submit" class="btn btn-primary px-5">DEPLOY ASSET</button>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- Edit Video Modal -->
                <div class="sc-modal-overlay" id="editVideoModal">
                    <div class="sc-modal" style="max-width: 500px;">
                        <div class="sc-modal-header border-0 bg-surface">
                            <span class="sc-modal-title">⚙️ Reconfigure Education Asset</span>
                            <div class="sc-modal-close" onclick="closeModal('editVideoModal')"></div>
                        </div>
                        <form action="${pageContext.request.contextPath}/admin/learning-videos/edit" method="post">
                            <input type="hidden" name="id" id="edit-id">
                            <div class="sc-modal-body bg-dark p-4">
                                <div class="mb-4">
                                    <label class="form-label text-muted small">MODULE TITLE</label>
                                    <input type="text" name="title" id="edit-title" class="form-control" required />
                                </div>
                                <div class="mb-4">
                                    <label class="form-label text-muted small">DOMAIN CATEGORY</label>
                                    <select name="category" id="edit-category" class="form-control" required>
                                        <option value="crop">Crop Optimization</option>
                                        <option value="organic">Organic Protocols</option>
                                        <option value="disease">Bio-Security</option>
                                        <option value="machinery">Automation & Machinery</option>
                                        <option value="general">Rural Economics</option>
                                    </select>
                                </div>
                                <div class="mb-4">
                                    <label class="form-label text-muted small">YOUTUBE SOURCE URL</label>
                                    <input type="text" name="videoUrl" id="edit-videoUrl" class="form-control"
                                        required />
                                </div>
                                <div class="mb-4">
                                    <label class="form-label text-muted small">CONCEPTUAL OVERVIEW</label>
                                    <textarea name="description" id="edit-description" class="form-control" rows="3"
                                        required></textarea>
                                </div>
                            </div>
                            <div class="sc-modal-footer border-0 bg-surface">
                                <button type="button" class="btn btn-outline-secondary px-4"
                                    onclick="closeModal('editVideoModal')">ABORT</button>
                                <button type="submit" class="btn btn-info px-5 text-white fw-bold">UPDATE ASSET</button>
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

                    function editVideo(id, title, url, cat, desc) {
                        document.getElementById('edit-id').value = id;
                        document.getElementById('edit-title').value = title;
                        document.getElementById('edit-videoUrl').value = url;
                        document.getElementById('edit-category').value = cat;
                        document.getElementById('edit-description').value = desc;
                        openModal('editVideoModal');
                    }
                </script>
            </body>

            </html>