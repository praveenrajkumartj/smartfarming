<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>🌾 Master Botanical Index - AGROPLANTER</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                <link rel="icon"
                    href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🌾</text></svg>" />
                <style>
                    .crop-node-card {
                        background: rgba(15, 23, 42, 0.4);
                        border: 1px solid rgba(255, 255, 255, 0.05);
                        border-radius: 20px;
                        padding: 20px;
                        margin-bottom: 20px;
                        transition: 0.3s;
                    }

                    .crop-node-card:hover {
                        border-color: rgba(34, 197, 94, 0.3);
                        background: rgba(34, 197, 94, 0.05);
                    }

                    .crop-icon-orb {
                        width: 44px;
                        height: 44px;
                        background: rgba(34, 197, 94, 0.1);
                        border-radius: 12px;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        font-size: 20px;
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
                            <a href="${pageContext.request.contextPath}/admin/crops"
                                class="sidebar-nav-item active mb-2"><span class="nav-icon">🌾</span> Crop Index</a>
                            <a href="${pageContext.request.contextPath}/admin/market-prices"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">📈</span> Data Streams</a>
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
                                <span class="page-title">🌾 Global Botanical Index Registry</span>
                            </div>
                            <div class="top-nav-right">
                                <button class="btn btn-primary px-4 rounded-pill fw-900 me-3"
                                    onclick="openModal('addCropModal')">+ REGISTER SPECIES</button>
                                <div class="user-info"
                                    style="gap: 15px; cursor: pointer; display: flex; align-items: center;"
                                    onclick="window.location.href='${pageContext.request.contextPath}/admin/crops'">
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
                                <div class="alert alert-success border-0 rounded-4 text-center mb-4">${successMessage}
                                </div>
                            </c:if>

                            <div class="section-header mb-4 d-flex justify-content-between align-items-center">
                                <h5 class="section-title">CROP TAXONOMY DATABASE</h5>
                                <div class="text-muted small">${fn:length(crops)} Taxons Analyzed</div>
                            </div>

                            <div class="card overkill-card border-0 mb-5">
                                <div class="card-body p-0">
                                    <div class="table-responsive">
                                        <table class="v3-data-table mb-0">
                                            <thead>
                                                <tr>
                                                    <th class="ps-4">CROP SPECIES</th>
                                                    <th>ECOLOGICAL VECTOR</th>
                                                    <th>THERMAL TOLERANCE</th>
                                                    <th>CYCLE</th>
                                                    <th class="pe-4 text-end">INTERTOCOLS</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${crops}" var="crop">
                                                    <tr>
                                                        <td class="ps-4 py-4">
                                                            <div class="d-flex align-items-center gap-3">
                                                                <div class="crop-icon-orb">🌾</div>
                                                                <div>
                                                                    <div class="text-white fw-900 fs-6">${crop.name}
                                                                    </div>
                                                                    <span
                                                                        class="badge bg-primary bg-opacity-10 text-primary x-small px-3 rounded-pill fw-bold uppercase">${crop.season}</span>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td class="py-4">
                                                            <div class="mb-2">
                                                                <div class="text-muted x-small fw-bold uppercase mb-1">
                                                                    SOIL VECTOR:</div>
                                                                <div class="text-white-50 small fw-bold">
                                                                    ${crop.soilType}</div>
                                                            </div>
                                                            <div>
                                                                <div class="text-muted x-small fw-bold uppercase mb-1">
                                                                    HYDRATION:</div>
                                                                <div class="text-white-50 small fw-bold">
                                                                    ${crop.waterRequirement}</div>
                                                            </div>
                                                        </td>
                                                        <td class="py-4">
                                                            <div class="text-muted x-small fw-bold uppercase mb-1">
                                                                RANGE:</div>
                                                            <div class="text-info fw-900 fs-5">${crop.minTemperature}°C
                                                                - ${crop.maxTemperature}°C</div>
                                                        </td>
                                                        <td class="py-4">
                                                            <div class="text-muted x-small fw-bold uppercase mb-1">
                                                                DURATION:</div>
                                                            <div class="text-white-50 small fw-bold">
                                                                ${crop.growthDuration}</div>
                                                        </td>
                                                        <td class="pe-4 py-4 text-end">
                                                            <div class="dropdown">
                                                                <button
                                                                    class="btn btn-outline-info rounded-pill px-4 x-small fw-900 dropdown-toggle"
                                                                    type="button"
                                                                    data-bs-toggle="dropdown">MANAGE</button>
                                                                <ul
                                                                    class="dropdown-menu dropdown-menu-dark border-0 shadow-lg rounded-4">
                                                                    <li><button class="dropdown-item py-2"
                                                                            onclick="handleEditClick(this)"
                                                                            data-id="${crop.id}"
                                                                            data-name="${crop.name}"
                                                                            data-season="${crop.season}"
                                                                            data-soil="${crop.soilType}"
                                                                            data-water="${crop.waterRequirement}"
                                                                            data-mint="${crop.minTemperature}"
                                                                            data-maxt="${crop.maxTemperature}"
                                                                            data-duration="${crop.growthDuration}"
                                                                            data-desc="${crop.description}"
                                                                            data-img="${crop.imageUrl}">MODIFY
                                                                            TAXON</button></li>
                                                                    <li>
                                                                        <hr class="dropdown-divider">
                                                                    </li>
                                                                    <li>
                                                                        <form
                                                                            action="${pageContext.request.contextPath}/admin/crops/delete/${crop.id}"
                                                                            method="post">
                                                                            <button type="submit"
                                                                                class="dropdown-item text-danger py-2"
                                                                                onclick="return confirm('PURGE TAXON: ${crop.name}?')">TERMINATE
                                                                                TAXON</button>
                                                                        </form>
                                                                    </li>
                                                                </ul>
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
                </div>

                <!-- Modals -->
                <div class="modal fade" id="addCropModal" tabindex="-1">
                    <div class="modal-dialog modal-dialog-centered modal-lg">
                        <div class="modal-content overflow-hidden border-0"
                            style="border-radius: 30px; background: #0f172a;">
                            <div class="modal-header border-0 bg-surface p-4">
                                <h5 class="modal-title fw-900 text-white">🌾 REGISTER NEW BOTANICAL SPECIES</h5>
                                <button type="button" class="btn-close btn-close-white"
                                    data-bs-dismiss="modal"></button>
                            </div>
                            <form action="${pageContext.request.contextPath}/admin/crops/add" method="post"
                                enctype="multipart/form-data">
                                <div class="modal-body p-5 bg-dark">
                                    <div class="row g-4">
                                        <div class="col-md-6"><label class="auth-label">TAXON NAME</label><input
                                                type="text" name="name" class="form-control auth-input" required></div>
                                        <div class="col-md-6"><label class="auth-label">CULTIVATION
                                                SEASON</label><select name="season" class="form-control auth-input">
                                                <option value="Kharif">Kharif</option>
                                                <option value="Rabi">Rabi</option>
                                                <option value="Annual">Annual</option>
                                            </select></div>
                                        <div class="col-md-6"><label class="auth-label">OPTIMAL SOIL
                                                VECTOR</label><select name="soilType" class="form-control auth-input">
                                                <option value="Loamy">Loamy</option>
                                                <option value="Clay">Clay</option>
                                                <option value="Sandy">Sandy</option>
                                                <option value="Black">Black Soil</option>
                                            </select></div>
                                        <div class="col-md-6"><label class="auth-label">HYDRATION DEMAND</label><select
                                                name="waterRequirement" class="form-control auth-input">
                                                <option value="Low">Low</option>
                                                <option value="Medium">Medium</option>
                                                <option value="High">High</option>
                                            </select></div>
                                        <div class="col-md-3"><label class="auth-label">MIN TEMP (°C)</label><input
                                                type="number" name="minTemperature" class="form-control auth-input"
                                                step="0.1" required></div>
                                        <div class="col-md-3"><label class="auth-label">MAX TEMP (°C)</label><input
                                                type="number" name="maxTemperature" class="form-control auth-input"
                                                step="0.1" required></div>
                                        <div class="col-md-6"><label class="auth-label">GROWTH CYCLE</label><input
                                                type="text" name="growthDuration" class="form-control auth-input"
                                                required></div>
                                        <div class="col-12"><label class="auth-label">BIOLOGICAL
                                                DESCRIPTION</label><textarea name="description"
                                                class="form-control auth-input" rows="3"></textarea></div>
                                        <div class="col-12"><label class="auth-label">IMAGE REFERENCE</label><input
                                                type="text" name="imageUrl" class="form-control auth-input"
                                                placeholder="Remote URL"><input type="file" name="imageFile"
                                                class="form-control auth-input mt-2"></div>
                                    </div>
                                </div>
                                <div class="modal-footer border-0 bg-surface p-4">
                                    <button type="submit" class="btn btn-primary w-100 py-3 rounded-pill fw-900">COMMIT
                                        TO REGISTRY →</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- Edit Modal (simplified for implementation) -->
                <div class="modal fade" id="editCropModal" tabindex="-1">
                    <div class="modal-dialog modal-dialog-centered modal-lg">
                        <div class="modal-content overflow-hidden border-0"
                            style="border-radius: 30px; background: #0f172a;">
                            <div class="modal-header border-0 bg-surface p-4">
                                <h5 class="modal-title fw-900 text-white">⚙️ MODIFY BOTANICAL INDEX</h5>
                                <button type="button" class="btn-close btn-close-white"
                                    data-bs-dismiss="modal"></button>
                            </div>
                            <form action="${pageContext.request.contextPath}/admin/crops/edit" method="post"
                                enctype="multipart/form-data">
                                <input type="hidden" name="id" id="edit-id">
                                <div class="modal-body p-5 bg-dark">
                                    <div class="row g-4">
                                        <div class="col-md-6"><label class="auth-label">TAXON NAME</label><input
                                                type="text" name="name" id="edit-name" class="form-control auth-input">
                                        </div>
                                        <div class="col-md-6"><label class="auth-label">SEASON</label><select
                                                name="season" id="edit-season" class="form-control auth-input">
                                                <option value="Kharif">Kharif</option>
                                                <option value="Rabi">Rabi</option>
                                                <option value="Annual">Annual</option>
                                            </select></div>
                                        <div class="col-md-6"><label class="auth-label">SOIL</label><select
                                                name="soilType" id="edit-soilType" class="form-control auth-input">
                                                <option value="Loamy">Loamy</option>
                                                <option value="Clay">Clay</option>
                                                <option value="Sandy">Sandy</option>
                                                <option value="Black">Black Soil</option>
                                            </select></div>
                                        <div class="col-md-6"><label class="auth-label">WATER</label><select
                                                name="waterRequirement" id="edit-waterRequirement"
                                                class="form-control auth-input">
                                                <option value="Low">Low</option>
                                                <option value="Medium">Medium</option>
                                                <option value="High">High</option>
                                            </select></div>
                                        <div class="col-md-3"><label class="auth-label">MIN T</label><input
                                                type="number" name="minTemperature" id="edit-minTemp"
                                                class="form-control auth-input" step="0.1"></div>
                                        <div class="col-md-3"><label class="auth-label">MAX T</label><input
                                                type="number" name="maxTemperature" id="edit-maxTemp"
                                                class="form-control auth-input" step="0.1"></div>
                                        <div class="col-md-6"><label class="auth-label">GROWTH CYCLE</label><input
                                                type="text" name="growthDuration" id="edit-duration"
                                                class="form-control auth-input"></div>
                                        <div class="col-12"><label class="auth-label">BIOLOGICAL
                                                DESCRIPTION</label><textarea name="description" id="edit-description"
                                                class="form-control auth-input" rows="3"></textarea></div>
                                        <div class="col-12"><label class="auth-label">IMAGE REFERENCE</label><input
                                                type="text" name="imageUrl" id="edit-imageUrl"
                                                class="form-control auth-input" placeholder="Remote URL"><input
                                                type="file" name="imageFile" class="form-control auth-input mt-2"></div>
                                    </div>
                                </div>
                                <div class="modal-footer border-0 bg-surface p-4">
                                    <button type="submit" class="btn btn-primary w-100 py-3 rounded-pill fw-900">Commit
                                        Changes →</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <script src="${pageContext.request.contextPath}/js/background-switcher.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                <script>
                    function toggleSidebar() { document.getElementById('sidebar').classList.toggle('open'); }
                    const addModal = new bootstrap.Modal(document.getElementById('addCropModal'));
                    const editModal = new bootstrap.Modal(document.getElementById('editCropModal'));
                    function openModal(id) { if (id === 'addCropModal') addModal.show(); }
                    function handleEditClick(btn) {
                        document.getElementById('edit-id').value = btn.getAttribute('data-id');
                        document.getElementById('edit-name').value = btn.getAttribute('data-name');
                        document.getElementById('edit-season').value = btn.getAttribute('data-season');
                        document.getElementById('edit-soilType').value = btn.getAttribute('data-soil');
                        document.getElementById('edit-waterRequirement').value = btn.getAttribute('data-water');
                        document.getElementById('edit-minTemp').value = btn.getAttribute('data-mint');
                        document.getElementById('edit-maxTemp').value = btn.getAttribute('data-maxt');
                        document.getElementById('edit-duration').value = btn.getAttribute('data-duration');
                        document.getElementById('edit-description').value = btn.getAttribute('data-description');
                        document.getElementById('edit-imageUrl').value = btn.getAttribute('data-img');
                        editModal.show();
                    }
                </script>
            </body>

            </html>