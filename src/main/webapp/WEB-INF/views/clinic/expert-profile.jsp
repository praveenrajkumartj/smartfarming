<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>👤 Expert Credentials - AGROPLANTER</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/voice-assistant.css" />
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
                <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800;900&display=swap"
                    rel="stylesheet">
                <link rel="icon"
                    href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>👤</text></svg>" />
                <script>
                    window.AgroplanterUser = "${user.id}";
                    window.AgroplanterUserFull = "${user.fullName}";
                    window.AgroplanterRole = "${user.role}";
                </script>
                <style>
                    .v3-profile-nexus {
                        background: rgba(15, 23, 42, 0.4);
                        border: 1px solid rgba(255, 255, 255, 0.05);
                        border-radius: 40px;
                        padding: 60px;
                        backdrop-filter: blur(40px);
                        position: relative;
                        overflow: hidden;
                    }

                    .v3-profile-nexus::before {
                        content: '';
                        position: absolute;
                        top: 0;
                        right: 0;
                        width: 300px;
                        height: 300px;
                        background: radial-gradient(circle, rgba(139, 92, 246, 0.1) 0%, transparent 70%);
                        pointer-events: none;
                    }

                    .v3-avatar-nexus {
                        width: 150px;
                        height: 150px;
                        border-radius: 40px;
                        overflow: hidden;
                        border: 2px solid rgba(139, 92, 246, 0.3);
                        position: relative;
                        background: #0f172a;
                    }

                    .v3-terminal-input {
                        background: rgba(255, 255, 255, 0.02) !important;
                        border: 1px solid rgba(255, 255, 255, 0.05) !important;
                        border-radius: 20px !important;
                        padding: 16px 24px !important;
                        color: #fff !important;
                        font-family: 'Outfit';
                        font-weight: 600;
                    }

                    .v3-terminal-input:focus {
                        border-color: #8b5cf6 !important;
                        background: rgba(255, 255, 255, 0.05) !important;
                        box-shadow: 0 0 30px rgba(139, 92, 246, 0.1) !important;
                    }

                    .v3-field-node {
                        margin-bottom: 30px;
                    }

                    .v3-action-btn {
                        background: linear-gradient(135deg, #8b5cf6, #d946ef);
                        color: white;
                        padding: 20px;
                        border-radius: 22px;
                        font-weight: 950;
                        text-transform: uppercase;
                        letter-spacing: 2px;
                        border: none;
                        width: 100%;
                        transition: 0.3s;
                        font-size: 11px;
                    }

                    .v3-action-btn:hover {
                        transform: translateY(-5px);
                        box-shadow: 0 20px 40px rgba(139, 92, 246, 0.3);
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
                                        style="font-size: 10px; color: #8b5cf6; font-weight: 800; letter-spacing: 1px;">EXPERT
                                        CREDENTIALS</span>
                                </div>
                            </div>
                        </div>
                        <nav class="sidebar-nav px-3 py-4">
                            <div class="nav-section-title px-2 mb-2"
                                style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">CLINIC
                                OPS</div>
                            <a href="${pageContext.request.contextPath}/clinic/expert/dashboard"
                                class="sidebar-nav-item mb-2">
                                <span class="nav-icon">📋</span> Queue Desk
                            </a>
                            <a href="${pageContext.request.contextPath}/chat" class="sidebar-nav-item mb-2">
                                <span class="nav-icon">💬</span> Secure Message
                            </a>
                            <a href="${pageContext.request.contextPath}/clinic/expert/reviews"
                                class="sidebar-nav-item mb-2">
                                <span class="nav-icon">⭐</span> Review Intel
                            </a>

                            <div class="nav-section-title px-2 mt-4 mb-2"
                                style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">
                                TELEMETRY</div>
                            <a href="${pageContext.request.contextPath}/clinic/expert/disease-queries"
                                class="sidebar-nav-item mb-2">
                                <span class="nav-icon">🔬</span> Bio-Intelligence
                            </a>

                            <div class="nav-section-title px-2 mt-4 mb-2"
                                style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">ACCOUNT
                            </div>
                            <a href="${pageContext.request.contextPath}/clinic/expert/profile"
                                class="sidebar-nav-item active mb-2">
                                <span class="nav-icon" style="color: #8b5cf6;">👤</span> Profile Node
                            </a>
                            <a href="${pageContext.request.contextPath}/logout"
                                class="sidebar-nav-item text-danger mt-4">
                                <span class="nav-icon">🚪</span> Terminate Session
                            </a>
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
                                        style="font-size: 2.2rem; letter-spacing: -1.5px;">Expert Credentials</h1>
                                    <span class="v3-page-subtitle text-purple uppercase"
                                        style="letter-spacing: 1px; font-weight: 800; color: #8b5cf6;">
                                        👤 IDENTITY CONFIGURATION | AES-256 SECURED | NODE: VERIFIED
                                    </span>
                                </div>
                            </div>
                            <div class="top-nav-right">
                                <div class="user-info"
                                    style="gap: 15px; cursor: pointer; display: flex; align-items: center;"
                                    onclick="window.location.href='${pageContext.request.contextPath}/clinic/expert/profile'">
                                    <div class="user-details d-none d-md-flex flex-column text-end">
                                        <span class="user-name text-white fw-800"
                                            style="font-size: 14px; letter-spacing: -0.5px;">${expert.user.fullName}</span>
                                        <span class="user-role uppercase fw-950"
                                            style="font-size: 9px; color: #3b82f6; letter-spacing: 1px;">DIAGNOSTIC
                                            ${expert.user.role}</span>
                                    </div>
                                    <div class="user-avatar"
                                        style="width: 48px; height: 48px; border-radius: 16px; display: flex; align-items: center; justify-content: center; overflow: hidden; border: 1px solid rgba(255,255,255,0.1); box-shadow: 0 10px 20px rgba(59, 130, 246, 0.2);">
                                        <c:choose>
                                            <c:when test="${not empty expert.user.profileImagePath}">
                                                <img src="${pageContext.request.contextPath}${expert.user.profileImagePath}"
                                                    alt="Profile" style="width: 100%; height: 100%; object-fit: cover;">
                                            </c:when>
                                            <c:otherwise>
                                                <div
                                                    style="width: 100%; height: 100%; background: linear-gradient(135deg, #3b82f6, #6366f1); display: flex; align-items: center; justify-content: center; font-weight: 950; font-size: 20px; color: white;">
                                                    <i class="fas fa-user-circle"></i>
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
                                    ⚡ PROTOCOL UPDATE: Credentials committed successfully.
                                </div>
                            </c:if>

                            <!-- Command Center Quick stats -->
                            <div class="row g-4 mb-5">
                                <div class="col-md-4">
                                    <div class="v3-nexus-panel p-4 text-center">
                                        <span class="v3-identity-label">ACTIVE CONSULTATIONS</span>
                                        <div class="h2 fw-950 text-white m-0">${consultationsCount}</div>
                                        <div class="x-small text-purple fw-800 uppercase mt-1">Nodal Appointments</div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="v3-nexus-panel p-4 text-center">
                                        <span class="v3-identity-label">BIO-DIAGNOSTICS</span>
                                        <div class="h2 fw-950 text-info m-0">${diseaseQueriesCount}</div>
                                        <div class="x-small text-info fw-800 uppercase mt-1">Scans Analyzed</div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="v3-nexus-panel p-4 text-center">
                                        <span class="v3-identity-label">BIO-LINK STATUS</span>
                                        <div class="h2 fw-950 text-success m-0">ENCRYPTED</div>
                                        <div class="x-small text-white-50 fw-800 uppercase mt-1">Verified Credential
                                            Node</div>
                                    </div>
                                </div>
                            </div>

                            <div class="row justify-content-center">
                                <div class="col-xl-8">
                                    <div class="v3-profile-nexus">
                                        <form action="${pageContext.request.contextPath}/clinic/expert/profile/update"
                                            method="post" enctype="multipart/form-data">

                                            <div class="d-flex align-items-center gap-5 mb-5 p-5 rounded-5"
                                                style="background: rgba(255,255,255,0.02); border: 1px solid rgba(255,255,255,0.05);">
                                                <div style="position: relative;">
                                                    <div class="v3-avatar-nexus">
                                                        <c:choose>
                                                            <c:when test="${not empty user.profileImagePath}">
                                                                <img id="profile-preview"
                                                                    src="${pageContext.request.contextPath}${user.profileImagePath}"
                                                                    style="width:100%; height:100%; object-fit:cover;" />
                                                            </c:when>
                                                            <c:otherwise>
                                                                <div
                                                                    style="width:100%; height:100%; display:flex; align-items:center; justify-content:center; font-size:50px; background: linear-gradient(135deg, #8b5cf6, #d946ef); color:white; font-weight:900;">
                                                                    ${fn:substring(user.fullName, 0, 1).toUpperCase()}
                                                                </div>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                    <label for="profileImage"
                                                        style="position: absolute; bottom: -10px; right: -10px; background: #8b5cf6; width: 45px; height: 45px; border-radius: 15px; display: flex; align-items: center; justify-content: center; cursor: pointer; border: 4px solid #020617; transition: 0.3s; box-shadow: 0 10px 20px rgba(139, 92, 246, 0.3);">
                                                        <span>📸</span>
                                                    </label>
                                                    <input type="file" id="profileImage" name="profileImage"
                                                        style="display: none;" accept="image/*"
                                                        onchange="previewFile(this)" />
                                                </div>
                                                <div>
                                                    <h2 class="text-white fw-950 m-0 display-6"
                                                        style="letter-spacing: -2px;">${user.fullName}</h2>
                                                    <div class="badge mt-3 px-3 py-2 rounded-pill"
                                                        style="background: rgba(139,92,246,0.1); border: 1px solid rgba(139,92,246,0.2); color: #c084fc; font-weight: 950; font-size: 10px; letter-spacing: 1px;">
                                                        VERIFIED EXPERT NODAL ID: #EXP-00${user.id}</div>
                                                </div>
                                            </div>

                                            <div class="row g-4">
                                                <div class="col-12 v3-field-node">
                                                    <label class="v3-field-label">Primary Identity (Full Name)</label>
                                                    <input type="text" name="fullName"
                                                        class="form-control v3-terminal-input" value="${user.fullName}"
                                                        required />
                                                </div>
                                                <div class="col-12 v3-field-node">
                                                    <label class="v3-field-label">System Node Address (Email -
                                                        Locked)</label>
                                                    <input type="email" class="form-control v3-terminal-input"
                                                        value="${user.email}" disabled style="opacity: 0.5;" />
                                                </div>
                                                <div class="col-12 v3-field-node">
                                                    <label class="v3-field-label">Nodal Contact (Phone)</label>
                                                    <input type="text" name="phone"
                                                        class="form-control v3-terminal-input" value="${user.phone}"
                                                        required />
                                                </div>
                                                <div class="col-md-6 v3-field-node">
                                                    <label class="v3-field-label">Operational State</label>
                                                    <input type="text" name="state"
                                                        class="form-control v3-terminal-input" value="${user.state}" />
                                                </div>
                                                <div class="col-md-6 v3-field-node">
                                                    <label class="v3-field-label">District Cluster</label>
                                                    <input type="text" name="district"
                                                        class="form-control v3-terminal-input"
                                                        value="${user.district}" />
                                                </div>
                                            </div>

                                            <div class="mt-5">
                                                <button type="submit" class="v3-action-btn">COMMIT CREDENTIAL UPDATES
                                                    →</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </main>
                </div>

                <script src="${pageContext.request.contextPath}/js/background-switcher.js"></script>
                <script src="${pageContext.request.contextPath}/js/voice-assistant.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                <script>
                    function toggleSidebar() { document.getElementById('sidebar').classList.toggle('open'); }
                    function previewFile(input) {
                        if (input.files && input.files[0]) {
                            var reader = new FileReader();
                            reader.onload = function (e) {
                                document.getElementById('profile-preview').src = e.target.result;
                                document.getElementById('profile-preview').style.display = 'block';
                            }
                            reader.readAsDataURL(input.files[0]);
                        }
                    }
                </script>
            </body>

            </html>