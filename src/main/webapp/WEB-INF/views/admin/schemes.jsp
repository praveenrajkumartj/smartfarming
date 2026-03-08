<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>🏛️ Institutional Schemes - AGROPLANTER Admin</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                <link rel="icon"
                    href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🏛️</text></svg>" />
                <style>
                    .scheme-badge {
                        font-size: 10px;
                        font-weight: 700;
                        padding: 4px 10px;
                        border-radius: 6px;
                        letter-spacing: 0.5px;
                    }

                    .deadline-highlight {
                        color: #fcd34d;
                        font-family: 'JetBrains Mono', monospace;
                        font-size: 11px;
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
                                class="sidebar-nav-item active mb-2"><span class="nav-icon">🏛️</span> Institutional</a>
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
                                <span class="page-title">🏛️ Govt. Scheme Governance</span>
                            </div>
                            <div class="top-nav-right">
                                <button class="btn btn-primary px-4 rounded-pill fw-bold me-3"
                                    onclick="openModal('addSchemeModal')">+ ANNOUNCE SCHEME</button>
                                <div class="user-info"
                                    style="gap: 15px; cursor: pointer; display: flex; align-items: center;"
                                    onclick="window.location.href='${pageContext.request.contextPath}/admin/schemes'">
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
                                    <span class="card-title">📜 National Welfare Database</span>
                                    <div class="badge bg-primary bg-opacity-10 text-primary fw-950 px-4 py-2 rounded-pill uppercase"
                                        style="font-size: 10px; letter-spacing: 1px; border: 1px solid rgba(59, 130, 246, 0.2);">
                                        ${fn:length(schemes)} ACTIVE PROGRAMS</div>
                                </div>

                                <div class="table-container p-0">
                                    <table class="v3-data-table mb-0">
                                        <thead>
                                            <tr>
                                                <th class="ps-4">PROGRAM TITLE</th>
                                                <th>CLASSIFICATION</th>
                                                <th>ELIGIBILITY PROTOCOL</th>
                                                <th>DEADLINE</th>
                                                <th>ACTIONS</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${schemes}" var="s">
                                                <tr>
                                                    <td class="ps-4" style="max-width: 300px;">
                                                        <div class="text-white fw-bold truncate-2 mb-1">${s.title}</div>
                                                        <div class="text-muted small truncate-2">${s.description}</div>
                                                    </td>
                                                    <td>
                                                        <span
                                                            class="scheme-badge bg-info bg-opacity-10 text-info">${s.category}</span>
                                                    </td>
                                                    <td style="max-width: 250px;">
                                                        <div class="text-white-50 small truncate-2">${s.eligibility}
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="deadline-highlight">📅 ${not empty s.lastDate ?
                                                            s.lastDate : 'PERMANENT'}</div>
                                                    </td>
                                                    <td>
                                                        <div class="d-flex gap-2">
                                                            <button class="btn btn-sm btn-outline-info"
                                                                onclick="editScheme('${s.id}', '${fn:escapeXml(s.title)}', '${fn:escapeXml(s.description)}', '${s.category}', '${s.lastDate}', '${fn:escapeXml(s.eligibility)}', '${fn:escapeXml(s.benefits)}', '${s.applicationLink}')">EDIT</button>
                                                            <form
                                                                action="${pageContext.request.contextPath}/admin/schemes/delete/${s.id}"
                                                                method="post" class="d-inline">
                                                                <button type="submit"
                                                                    class="btn btn-sm btn-outline-danger"
                                                                    onclick="return confirm('RETIRE PROGRAM: ${s.title}?')">RETIRE</button>
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

                <!-- Announce Scheme Modal -->
                <div class="sc-modal-overlay" id="addSchemeModal">
                    <div class="sc-modal" style="max-width: 700px;">
                        <div class="sc-modal-header border-0 bg-surface">
                            <span class="sc-modal-title">🏛️ Institutional Program Announcement</span>
                            <div class="sc-modal-close" onclick="closeModal('addSchemeModal')"></div>
                        </div>
                        <form action="${pageContext.request.contextPath}/admin/schemes/add" method="post">
                            <div class="sc-modal-body bg-dark p-4">
                                <div class="row g-4">
                                    <div class="col-12">
                                        <label class="form-label text-muted small">SCHEME / PROGRAM TITLE</label>
                                        <input type="text" name="title" class="form-control"
                                            placeholder="e.g. PM-KISAN Digital Credit" required />
                                    </div>
                                    <div class="col-12">
                                        <label class="form-label text-muted small">EXECUTIVE DESCRIPTION</label>
                                        <textarea name="description" class="form-control" rows="3" required></textarea>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label text-muted small">DOMAIN CATEGORY</label>
                                        <select name="category" class="form-control">
                                            <option value="Financial Aid">Financial Aid</option>
                                            <option value="Insurance">Insurance</option>
                                            <option value="Technology">Technology Hub</option>
                                            <option value="Irrigation">Irrigation Logistics</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label text-muted small">APPLICATION DEADLINE</label>
                                        <input type="date" name="lastDate" class="form-control" />
                                    </div>
                                    <div class="col-12">
                                        <label class="form-label text-muted small">ELIGIBILITY PROTOCOL</label>
                                        <textarea name="eligibility" class="form-control" rows="2"></textarea>
                                    </div>
                                    <div class="col-12">
                                        <label class="form-label text-muted small">BENEFICIARY ENTITLEMENTS</label>
                                        <textarea name="benefits" class="form-control" rows="2"></textarea>
                                    </div>
                                    <div class="col-12">
                                        <label class="form-label text-muted small">DIRECT PORTAL LINK (URL)</label>
                                        <input type="url" name="applicationLink" class="form-control"
                                            placeholder="https://govt.portal/apply" />
                                    </div>
                                </div>
                            </div>
                            <div class="sc-modal-footer border-0 bg-surface">
                                <button type="button" class="btn btn-outline-secondary px-4"
                                    onclick="closeModal('addSchemeModal')">ABORT</button>
                                <button type="submit" class="btn btn-primary px-5">PUBLISH PROGRAM</button>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- Edit Scheme Modal -->
                <div class="sc-modal-overlay" id="editSchemeModal">
                    <div class="sc-modal" style="max-width: 700px;">
                        <div class="sc-modal-header border-0 bg-surface">
                            <span class="sc-modal-title">⚙️ Reconfigure Institutional Program</span>
                            <div class="sc-modal-close" onclick="closeModal('editSchemeModal')"></div>
                        </div>
                        <form action="${pageContext.request.contextPath}/admin/schemes/edit" method="post">
                            <input type="hidden" name="id" id="edit-id">
                            <div class="sc-modal-body bg-dark p-4">
                                <div class="row g-4">
                                    <div class="col-12">
                                        <label class="form-label text-muted small">SCHEME / PROGRAM TITLE</label>
                                        <input type="text" name="title" id="edit-title" class="form-control" required />
                                    </div>
                                    <div class="col-12">
                                        <label class="form-label text-muted small">EXECUTIVE DESCRIPTION</label>
                                        <textarea name="description" id="edit-description" class="form-control" rows="3"
                                            required></textarea>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label text-muted small">DOMAIN CATEGORY</label>
                                        <select name="category" id="edit-category" class="form-control">
                                            <option value="Financial Aid">Financial Aid</option>
                                            <option value="Insurance">Insurance</option>
                                            <option value="Technology">Technology Hub</option>
                                            <option value="Irrigation">Irrigation Logistics</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label text-muted small">APPLICATION DEADLINE</label>
                                        <input type="date" name="lastDate" id="edit-lastDate" class="form-control" />
                                    </div>
                                    <div class="col-12">
                                        <label class="form-label text-muted small">ELIGIBILITY PROTOCOL</label>
                                        <textarea name="eligibility" id="edit-eligibility" class="form-control"
                                            rows="2"></textarea>
                                    </div>
                                    <div class="col-12">
                                        <label class="form-label text-muted small">BENEFICIARY ENTITLEMENTS</label>
                                        <textarea name="benefits" id="edit-benefits" class="form-control"
                                            rows="2"></textarea>
                                    </div>
                                    <div class="col-12">
                                        <label class="form-label text-muted small">DIRECT PORTAL LINK (URL)</label>
                                        <input type="url" name="applicationLink" id="edit-applicationLink"
                                            class="form-control" />
                                    </div>
                                </div>
                            </div>
                            <div class="sc-modal-footer border-0 bg-surface">
                                <button type="button" class="btn btn-outline-secondary px-4"
                                    onclick="closeModal('editSchemeModal')">ABORT</button>
                                <button type="submit" class="btn btn-info px-5 text-white fw-bold">UPDATE
                                    PROGRAM</button>
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

                    function editScheme(id, title, desc, cat, date, elig, benefits, link) {
                        document.getElementById('edit-id').value = id;
                        document.getElementById('edit-title').value = title;
                        document.getElementById('edit-description').value = desc;
                        document.getElementById('edit-category').value = cat;
                        document.getElementById('edit-lastDate').value = date;
                        document.getElementById('edit-eligibility').value = elig;
                        document.getElementById('edit-benefits').value = benefits;
                        document.getElementById('edit-applicationLink').value = link;
                        openModal('editSchemeModal');
                    }
                </script>
            </body>

            </html>