<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>👥 Identity Registry - AGROPLANTER Admin</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/voice-assistant.css" />
                <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800;900&display=swap"
                    rel="stylesheet">
                <link rel="icon"
                    href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>👥</text></svg>" />
                <script>
                    window.AgroplanterUser = "${user.id}";
                    window.AgroplanterUserFull = "${user.fullName}";
                    window.AgroplanterRole = "${user.role}";
                </script>
                <style>
                    .v3-admin-hero {
                        background: linear-gradient(135deg, rgba(30, 41, 59, 0.4) 0%, rgba(15, 23, 42, 0.4) 100%);
                        border-radius: 40px;
                        padding: 60px;
                        margin-bottom: 50px;
                        backdrop-filter: blur(40px);
                        border: 1px solid rgba(255, 255, 255, 0.05);
                        position: relative;
                        overflow: hidden;
                    }

                    .v3-admin-hero::after {
                        content: 'IDENTITIES';
                        position: absolute;
                        right: -20px;
                        bottom: -20px;
                        font-size: 100px;
                        font-weight: 950;
                        color: white;
                        opacity: 0.02;
                    }

                    .v3-nexus-panel {
                        background: rgba(15, 23, 42, 0.4);
                        border: 1px solid rgba(255, 255, 255, 0.05);
                        border-radius: 40px;
                        padding: 35px;
                        backdrop-filter: blur(30px);
                    }

                    .v3-identity-avatar {
                        width: 45px;
                        height: 45px;
                        border-radius: 12px;
                        background: linear-gradient(135deg, #3b82f6, #8b5cf6);
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        font-weight: 900;
                        color: #fff;
                        font-size: 18px;
                        box-shadow: 0 8px 20px rgba(59, 130, 246, 0.2);
                    }

                    .v3-status-pill {
                        padding: 6px 14px;
                        border-radius: 10px;
                        font-size: 9px;
                        font-weight: 950;
                        letter-spacing: 1px;
                        text-transform: uppercase;
                        border: 1px solid rgba(255, 255, 255, 0.05);
                    }

                    .v3-action-btn {
                        background: rgba(255, 255, 255, 0.03);
                        border: 1px solid rgba(255, 255, 255, 0.05);
                        color: #94a3b8;
                        padding: 10px 20px;
                        border-radius: 12px;
                        font-size: 10px;
                        font-weight: 950;
                        text-transform: uppercase;
                        transition: 0.3s;
                        letter-spacing: 1px;
                    }

                    .v3-action-btn:hover {
                        background: rgba(255, 255, 255, 0.08);
                        color: #fff;
                        border-color: rgba(255, 255, 255, 0.2);
                    }
                </style>
            </head>

            <body>
                <div class="dashboard-scene"></div>
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
                            <a href="${pageContext.request.contextPath}/admin/users"
                                class="sidebar-nav-item active mb-2"><span class="nav-icon">👥</span> Identity
                                Registry</a>
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

                    <main class="main-content">
                        <header class="top-nav">
                            <div class="top-nav-left d-flex align-items-center gap-3">
                                <div class="hamburger" onclick="toggleSidebar()">
                                    <span></span><span></span><span></span>
                                </div>
                                <div class="page-title">
                                    <h1 class="m-0 fw-950 text-white"
                                        style="font-size: 2.2rem; letter-spacing: -1.5px;">Identity Registry</h1>
                                    <span class="v3-page-subtitle text-danger uppercase"
                                        style="letter-spacing: 1px; font-weight: 800;">
                                        👥 CENTRAL PERSONA INDEX | SECURITY: LEVEL 4 | NODE: SECURED
                                    </span>
                                </div>
                            </div>
                            <div class="top-nav-right">
                                <div class="user-info"
                                    style="gap: 15px; cursor: pointer; display: flex; align-items: center;"
                                    onclick="window.location.href='${pageContext.request.contextPath}/admin/users'">
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

                        <div class="page-body px-5 py-5">
                            <c:if test="${not empty successMessage}">
                                <div class="alert alert-success border-0 bg-success bg-opacity-10 text-success rounded-4 mb-5 p-4 fw-800 uppercase x-small"
                                    style="letter-spacing: 1px;">
                                    ⚡ REGISTRY UPDATE: ${successMessage}
                                </div>
                            </c:if>

                            <div class="v3-admin-hero">
                                <div class="row align-items-center">
                                    <div class="col-md-9">
                                        <h1 class="fw-950 text-white mb-3 display-4" style="letter-spacing: -3px;">
                                            Strategic Persona Management</h1>
                                        <p class="text-white-50 fw-800 uppercase x-small mb-0"
                                            style="letter-spacing: 2px; opacity: 0.6;">
                                            MONITOR AND MANAGE CROSS-PLATFORM IDENTITIES, SERVICE TIERS, AND REGIONAL
                                            DISTRIBUTIONS WITHIN THE SECURE RADIUS.
                                        </p>
                                    </div>
                                    <div class="col-md-3 text-md-end">
                                        <div class="badge bg-danger bg-opacity-10 text-danger fw-950 px-4 py-2 rounded-pill uppercase"
                                            style="font-size: 10px; letter-spacing: 1px; border: 1px solid rgba(239, 68, 68, 0.2);">
                                            ${fn:length(users)} REGISTERED NODES
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="v3-nexus-panel">
                                <div class="table-responsive">
                                    <table class="v3-data-table">
                                        <thead>
                                            <tr>
                                                <th>PERSONA / IDENTITY</th>
                                                <th>SECURE EMAIL</th>
                                                <th class="text-center">CLASSIFICATION</th>
                                                <th>GEOLOCATION</th>
                                                <th class="text-center">SERVICE TIER</th>
                                                <th class="text-end">OVERSIGHT</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${users}" var="u">
                                                <tr>
                                                    <td>
                                                        <div class="d-flex align-items-center gap-3">
                                                            <div class="v3-identity-avatar" style="overflow: hidden;">
                                                                <c:choose>
                                                                    <c:when test="${not empty u.profileImagePath}">
                                                                        <img src="${fn:startsWith(u.profileImagePath, 'http') ? '' : pageContext.request.contextPath}${u.profileImagePath}"
                                                                            onerror="this.src='https://ui-avatars.com/api/?name=${fn:replace(not empty u.fullName ? u.fullName : 'User', ' ', '+')}&background=10b981&color=fff';"
                                                                            style="width: 100%; height: 100%; object-fit: cover;">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        ${fn:substring(u.fullName, 0, 1).toUpperCase()}
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </div>
                                                            <div>
                                                                <div class="text-white fw-950 fs-6"
                                                                    style="letter-spacing: -0.5px;">
                                                                    ${u.fullName.toUpperCase()}</div>
                                                                <div class="text-white-50 x-small fw-800 uppercase"
                                                                    style="font-size: 9px; opacity: 0.5;">ID:
                                                                    #NODE-${u.id}</div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td><span class="text-white-50 fw-600 fs-7">${u.email}</span></td>
                                                    <td class="text-center">
                                                        <span
                                                            class="v3-status-pill ${u.role == 'FARMER' ? 'bg-success bg-opacity-10 text-success' : 'bg-info bg-opacity-10 text-info'}">
                                                            ${u.role}
                                                        </span>
                                                    </td>
                                                    <td>
                                                        <div class="text-white fw-800 uppercase"
                                                            style="font-size: 11px;">${u.state.toUpperCase()}</div>
                                                        <div class="text-white-50 x-small fw-800 uppercase"
                                                            style="font-size: 9px; opacity: 0.5;">
                                                            ${u.district.toUpperCase()}</div>
                                                    </td>
                                                    <td class="text-center">
                                                        <c:if test="${not empty u.subscriptionPlan}">
                                                            <span
                                                                class="v3-status-pill bg-primary bg-opacity-10 text-primary border-primary border-opacity-20 fw-950 uppercase"
                                                                style="font-size: 8px; letter-spacing: 1px; padding: 6px 12px;">${u.subscriptionPlan}</span>
                                                        </c:if>
                                                        <c:if test="${empty u.subscriptionPlan}">
                                                            <span class="text-white-50 italic x-small opacity-50">NO
                                                                PLAN</span>
                                                        </c:if>
                                                    </td>
                                                    <td class="text-end">
                                                        <c:if test="${u.role != 'ADMIN'}">
                                                            <div class="dropdown">
                                                                <button class="v3-action-btn dropdown-toggle"
                                                                    type="button" data-bs-toggle="dropdown">MANAGE
                                                                    OPS</button>
                                                                <ul
                                                                    class="dropdown-menu dropdown-menu-dark v3-modal-content border-0 shadow-lg">
                                                                    <li>
                                                                        <button
                                                                            class="dropdown-item text-info fw-950 uppercase small py-2 px-4"
                                                                            style="font-size: 10px; letter-spacing: 1px;"
                                                                            onclick="editUser('${u.id}', '${fn:escapeXml(u.fullName)}', '${u.email}', '${u.phone}', '${u.state}', '${u.district}', '${u.role}')">
                                                                            MODIFY IDENTITY
                                                                        </button>
                                                                    </li>
                                                                    <li>
                                                                        <hr class="dropdown-divider">
                                                                    </li>
                                                                    <li>
                                                                        <form
                                                                            action="${pageContext.request.contextPath}/admin/users/delete/${u.id}"
                                                                            method="post" class="m-0">
                                                                            <button type="submit"
                                                                                class="dropdown-item text-danger fw-950 uppercase small py-2 px-4"
                                                                                style="font-size: 10px; letter-spacing: 1px;"
                                                                                onclick="return confirm('🚨 DEACTIVATE PERSONA: ${u.fullName}? This procedure is restricted.')">PURGE
                                                                                IDENTITY</button>
                                                                        </form>
                                                                    </li>
                                                                    <c:if
                                                                        test="${u.subscriptionPlan != 'Basic Plan' && u.subscriptionPlan != 'Local Buyer'}">
                                                                        <li>
                                                                            <form
                                                                                action="${pageContext.request.contextPath}/admin/users/deactivate-plan/${u.id}"
                                                                                method="post" class="m-0">
                                                                                <button type="submit"
                                                                                    class="dropdown-item text-warning fw-950 uppercase small py-2 px-4"
                                                                                    style="font-size: 10px; letter-spacing: 1px;">DOWNGRADE
                                                                                    TIER</button>
                                                                            </form>
                                                                        </li>
                                                                    </c:if>
                                                                </ul>
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${u.role == 'ADMIN'}">
                                                            <span class="text-white-50 italic fw-800 uppercase"
                                                                style="font-size: 9px; letter-spacing: 1px; opacity: 0.4;">CORE
                                                                PROTECTED</span>
                                                        </c:if>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </main>
                </div>

                <!-- Edit User Modal -->
                <div class="modal fade" id="editUserModal" tabindex="-1" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content v3-modal-nexus border-0 overflow-hidden"
                            style="border-radius: 30px; background: rgba(15, 23, 42, 0.95); backdrop-filter: blur(20px);">
                            <div class="modal-header border-0 bg-surface p-4">
                                <h5 class="modal-title fw-950 text-white" style="letter-spacing: -1px;">⚙️ MODIFY
                                    PERSONA INDEX</h5>
                                <button type="button" class="btn-close btn-close-white"
                                    data-bs-dismiss="modal"></button>
                            </div>
                            <form action="${pageContext.request.contextPath}/admin/users/edit" method="post">
                                <input type="hidden" name="id" id="edit-id">
                                <div class="modal-body p-4 bg-dark">
                                    <div class="row g-4">
                                        <div class="col-12">
                                            <label class="form-label text-muted small fw-800 uppercase"
                                                style="letter-spacing: 1px;">Full Legal Name</label>
                                            <input type="text" name="fullName" id="edit-fullName"
                                                class="form-control auth-input" required>
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label text-muted small fw-800 uppercase"
                                                style="letter-spacing: 1px;">Phone Vector</label>
                                            <input type="text" name="phone" id="edit-phoneNumber"
                                                class="form-control auth-input">
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label text-muted small fw-800 uppercase"
                                                style="letter-spacing: 1px;">Persona Classification</label>
                                            <select name="role" id="edit-role" class="form-control auth-input">
                                                <option value="FARMER">FARMER</option>
                                                <option value="BUYER">BUYER</option>
                                                <option value="B2B_BUYER">B2B BUYER</option>
                                                <option value="CLINIC_EXPERT">CLINIC EXPERT</option>
                                            </select>
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label text-muted small fw-800 uppercase"
                                                style="letter-spacing: 1px;">State Jurisdiction</label>
                                            <input type="text" name="state" id="edit-state"
                                                class="form-control auth-input">
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label text-muted small fw-800 uppercase"
                                                style="letter-spacing: 1px;">District Node</label>
                                            <input type="text" name="district" id="edit-district"
                                                class="form-control auth-input">
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer border-0 bg-surface p-4">
                                    <button type="submit"
                                        class="btn btn-primary w-100 py-3 rounded-pill fw-950 uppercase"
                                        style="letter-spacing: 1px;">COMMIT IDENTITY UPDATE →</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <script src="${pageContext.request.contextPath}/js/background-switcher.js"></script>
                <script src="${pageContext.request.contextPath}/js/voice-assistant.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                <script>
                    function toggleSidebar() { document.getElementById('sidebar').classList.toggle('open'); }

                    const editModal = new bootstrap.Modal(document.getElementById('editUserModal'));

                    function editUser(id, name, email, phone, state, district, role) {
                        document.getElementById('edit-id').value = id;
                        document.getElementById('edit-fullName').value = name;
                        document.getElementById('edit-phoneNumber').value = phone;
                        document.getElementById('edit-state').value = state;
                        document.getElementById('edit-district').value = district;
                        document.getElementById('edit-role').value = role;
                        editModal.show();
                    }
                </script>
            </body>

            </html>