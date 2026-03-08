<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8" />
                    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                    <title>Advisor Identity - AGROPLANTER Mentor</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
                        rel="stylesheet">
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/voice-assistant.css" />
                    <link rel="stylesheet"
                        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
                    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800;900&display=swap"
                        rel="stylesheet">
                    <link rel="icon"
                        href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>👨‍🏫</text></svg>" />
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

                        .v3-terminal-input {
                            background: rgba(15, 23, 42, 0.6) !important;
                            border: 1px solid rgba(255, 255, 255, 0.05) !important;
                            border-radius: 16px !important;
                            color: #fff !important;
                            padding: 18px 25px !important;
                            font-family: 'Outfit', sans-serif !important;
                            font-weight: 500 !important;
                            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1) !important;
                        }

                        .v3-terminal-input:focus {
                            background: rgba(15, 23, 42, 0.8) !important;
                            border-color: #fbbf24 !important;
                            box-shadow: 0 0 25px rgba(251, 191, 36, 0.1) !important;
                            transform: translateY(-2px);
                        }

                        .v3-identity-label {
                            font-size: 10px;
                            font-weight: 950;
                            color: #475569;
                            letter-spacing: 2px;
                            text-transform: uppercase;
                            margin-bottom: 10px;
                            display: block;
                        }

                        .v3-profile-orb {
                            width: 120px;
                            height: 120px;
                            border-radius: 35px;
                            background: linear-gradient(135deg, #fbbf24, #f59e0b);
                            display: flex;
                            align-items: center;
                            justify-content: center;
                            font-size: 48px;
                            font-weight: 950;
                            color: white;
                            box-shadow: 0 0 40px rgba(251, 191, 36, 0.3);
                            position: relative;
                            overflow: hidden;
                            border: 2px solid rgba(255, 255, 255, 0.1);
                        }

                        .v3-orb-glow {
                            position: absolute;
                            inset: 0;
                            background: radial-gradient(circle at center, rgba(255, 255, 255, 0.2), transparent 70%);
                            animation: v3-orb-pulse 4s infinite ease-in-out;
                        }

                        @keyframes v3-orb-pulse {

                            0%,
                            100% {
                                opacity: 0.5;
                                transform: scale(1);
                            }

                            50% {
                                opacity: 0.8;
                                transform: scale(1.1);
                            }
                        }

                        .v3-nexus-panel {
                            background: rgba(15, 23, 42, 0.4);
                            border: 1px solid rgba(255, 255, 255, 0.05);
                            border-radius: 40px;
                            padding: 35px;
                            backdrop-filter: blur(40px);
                        }
                    </style>
                </head>

                <body style="background: #020617; color: #fff; font-family: 'Outfit', sans-serif;">
                    <div class="dashboard-scene"></div>
                    <div class="dashboard-layout">
                        <!-- V3 Premium Sidebar -->
                        <aside class="sidebar sidebar-premium" id="sidebar">
                            <div class="sidebar-brand px-4 py-4"
                                style="border-bottom: 1px solid rgba(255,255,255,0.05); cursor: pointer;"
                                onclick="window.location.href='${pageContext.request.contextPath}/'">
                                <div class="brand-premium" style="font-size: 20px;">
                                    <div class="brand-icon-box"><i class="fas fa-leaf"></i></div>
                                    <div class="brand-text">
                                        <h3 class="brand-premium m-0" style="font-size: 20px;">AGROPLANTER</h3>
                                        <span
                                            style="font-size: 10px; color: #fbbf24; font-weight: 800; letter-spacing: 1px;">ADVISOR
                                            NODE V3</span>
                                    </div>
                                </div>
                            </div>
                            <nav class="sidebar-nav px-3 py-4">
                                <div class="nav-section-title px-2 mb-2"
                                    style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">
                                    STRATEGIC ADVISORY</div>
                                <a href="${pageContext.request.contextPath}/mentor/dashboard"
                                    class="sidebar-nav-item mb-2"><span class="nav-icon">📊</span> Advisor Dashboard</a>
                                <a href="${pageContext.request.contextPath}/mentor/ledger"
                                    class="sidebar-nav-item mb-2"><span class="nav-icon">📖</span> Advisory Ledger</a>
                                <a href="${pageContext.request.contextPath}/mentor/reviews"
                                    class="sidebar-nav-item mb-2"><span class="nav-icon">⭐</span> Advisor Reviews</a>
                                <a href="${pageContext.request.contextPath}/chat" class="sidebar-nav-item mb-2"><span
                                        class="nav-icon">💬</span> Consultation Core</a>
                                <div class="nav-section-title px-2 mt-4 mb-2"
                                    style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">USER
                                    IDENTITY</div>
                                <a href="${pageContext.request.contextPath}/mentor/profile"
                                    class="sidebar-nav-item active mb-2"><span class="nav-icon"
                                        style="color:#fbbf24;">👤</span> Advisor Profile</a>
                                <div class="mt-auto px-2"><a href="${pageContext.request.contextPath}/logout"
                                        class="sidebar-nav-item text-danger mt-4" style="border-radius: 12px;"><span
                                            class="nav-icon">🚪</span> Terminate Session</a></div>
                            </nav>
                        </aside>

                        <!-- Main Hub -->
                        <main class="main-content">
                            <header class="top-nav">
                                <div class="top-nav-left d-flex align-items-center gap-3">
                                    <div class="hamburger" onclick="toggleSidebar()">
                                        <span></span><span></span><span></span>
                                    </div>
                                    <div class="page-title">
                                        <h1 class="m-0 fw-950 text-white"
                                            style="font-size: 2.2rem; letter-spacing: -1.5px;">Advisor Profile</h1>
                                        <span class="v3-page-subtitle text-warning uppercase"
                                            style="letter-spacing: 1px; font-weight: 800;">👨‍🏫 STRATEGIC NODE |
                                            IDENTITY: ${user.fullName.toUpperCase()} | STATUS: ACTIVE</span>
                                    </div>
                                </div>
                                <div class="top-nav-right">
                                    <div class="user-info"
                                        style="gap: 15px; cursor: pointer; display: flex; align-items: center;"
                                        onclick="window.location.href='${pageContext.request.contextPath}/mentor/profile'">
                                        <div class="user-details d-none d-md-flex flex-column text-end">
                                            <span class="user-name text-white fw-800"
                                                style="font-size: 14px; letter-spacing: -0.5px;">${user.fullName}</span>
                                            <span class="user-role uppercase fw-950"
                                                style="font-size: 9px; color: #fbbf24; letter-spacing: 1px;">${user.role}</span>
                                        </div>
                                        <div class="user-avatar"
                                            style="width: 48px; height: 48px; border-radius: 16px; display: flex; align-items: center; justify-content: center; overflow: hidden; border: 1px solid rgba(255,255,255,0.1); box-shadow: 0 10px 20px rgba(251, 191, 36, 0.2);">
                                            <c:choose>
                                                <c:when test="${not empty user.profileImagePath}">
                                                    <img src="${pageContext.request.contextPath}${user.profileImagePath}"
                                                        alt="Profile"
                                                        style="width: 100%; height: 100%; object-fit: cover;">
                                                </c:when>
                                                <c:otherwise>
                                                    <div
                                                        style="width: 100%; height: 100%; background: linear-gradient(135deg, #fbbf24, #f59e0b); display: flex; align-items: center; justify-content: center; font-weight: 950; font-size: 20px; color: white;">
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
                                    <div class="alert alert-success border-0 rounded-4 mb-5 text-center fw-900 uppercase"
                                        style="background: rgba(251, 191, 36, 0.1); color: #fbbf24; letter-spacing: 1px;">
                                        ${successMessage}</div>
                                </c:if>

                                <div class="row g-4 mb-5">
                                    <div class="col-md-4">
                                        <div class="v3-nexus-panel p-4 text-center">
                                            <span class="v3-identity-label">CONSULTATION SESSIONS</span>
                                            <div class="h2 fw-950 text-white m-0">${totalSessions}</div>
                                            <div class="x-small text-warning fw-800 uppercase mt-1">Sessions Completed
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="v3-nexus-panel p-4 text-center">
                                            <span class="v3-identity-label">ADVISORY EARNINGS</span>
                                            <div class="h2 fw-950 text-success m-0">₹
                                                <fmt:formatNumber value="${totalEarnings}" pattern="#,###" />
                                            </div>
                                            <div class="x-small text-success fw-800 uppercase mt-1">Net Revenue Stream
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="v3-nexus-panel p-4 text-center">
                                            <span class="v3-identity-label">TRUST RATING</span>
                                            <div class="h2 fw-950 text-info m-0">${avgRating} / 5.0</div>
                                            <div class="x-small text-white-50 fw-800 uppercase mt-1">Peer Validated
                                                Intel</div>
                                        </div>
                                    </div>
                                </div>

                                <div class="v3-profile-nexus">
                                    <h3 class="fw-950 text-white mb-5" style="letter-spacing: -1px;">✏️ Edit Advisor
                                        Identity</h3>
                                    <form action="${pageContext.request.contextPath}/mentor/profile/update"
                                        method="post" enctype="multipart/form-data">
                                        <div class="d-flex align-items-center gap-4 mb-5 p-4 rounded-4"
                                            style="background: rgba(255,255,255,0.02); border: 1px solid rgba(255,255,255,0.05);">
                                            <div class="v3-profile-orb">
                                                <div class="v3-orb-glow"></div>
                                                <c:choose>
                                                    <c:when test="${not empty user.profileImagePath}">
                                                        <img src="${pageContext.request.contextPath}${user.profileImagePath}"
                                                            style="width: 100%; height: 100%; object-fit: cover; position: relative; z-index: 1;" />
                                                    </c:when>
                                                    <c:otherwise>
                                                        <i class="fas fa-user-circle"
                                                            style="position: relative; z-index: 1;"></i>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                            <div class="flex-grow-1">
                                                <span class="v3-identity-label">ADVISOR AVATAR</span>
                                                <input type="file" name="profileImage"
                                                    class="form-control v3-terminal-input" accept="image/*" />
                                                <p class="text-white-50 x-small mt-2 mb-0 fw-600">High-fidelity profile
                                                    visuals enhance trust within the network.</p>
                                            </div>
                                        </div>

                                        <div class="row g-4 mb-4">
                                            <div class="col-md-6">
                                                <span class="v3-identity-label">FULL LEGAL NAME</span>
                                                <input type="text" name="fullName"
                                                    class="form-control v3-terminal-input" value="${user.fullName}"
                                                    required />
                                            </div>
                                            <div class="col-md-6">
                                                <span class="v3-identity-label">ADVISORY SPECIALIZATION</span>
                                                <input type="text" name="expertise"
                                                    class="form-control v3-terminal-input" value="${mentor.expertise}"
                                                    required />
                                            </div>
                                        </div>

                                        <div class="form-group mb-4">
                                            <span class="v3-identity-label">PROFESSIONAL BIOGRAPHY</span>
                                            <textarea name="bio" class="form-control v3-terminal-input" rows="4"
                                                style="height: auto !important;">${mentor.bio}</textarea>
                                        </div>

                                        <div class="row g-4 mb-4">
                                            <div class="col-md-6">
                                                <span class="v3-identity-label">SESSION FEE (INR)</span>
                                                <input type="number" name="consultationFee"
                                                    class="form-control v3-terminal-input"
                                                    value="${mentor.consultationFee}" step="0.01" required />
                                            </div>
                                            <div class="col-md-6">
                                                <span class="v3-identity-label">YEARS OF INTEL (EXPERIENCE)</span>
                                                <input type="text" name="experience"
                                                    class="form-control v3-terminal-input" value="${mentor.experience}"
                                                    required placeholder="e.g., 10+ Years" />
                                            </div>
                                        </div>

                                        <div class="row g-4 mb-5">
                                            <div class="col-md-6">
                                                <span class="v3-identity-label">ENCRYPTION PROTOCOL (PHONE)</span>
                                                <input type="text" name="phone" class="form-control v3-terminal-input"
                                                    value="${user.phone}" required />
                                            </div>
                                            <div class="col-md-6 opacity-75">
                                                <span class="v3-identity-label">SECURE EMAIL ADDRESS
                                                    (UNMODIFIABLE)</span>
                                                <input type="email" class="form-control v3-terminal-input"
                                                    value="${user.email}" disabled />
                                            </div>
                                        </div>

                                        <div class="row g-4 mb-5">
                                            <div class="col-md-6">
                                                <span class="v3-identity-label">GEOGRAPHIC STATE</span>
                                                <input type="text" name="state" class="form-control v3-terminal-input"
                                                    value="${user.state}" />
                                            </div>
                                            <div class="col-md-6">
                                                <span class="v3-identity-label">DISTRICT NODE</span>
                                                <input type="text" name="district"
                                                    class="form-control v3-terminal-input" value="${user.district}" />
                                            </div>
                                        </div>

                                        <div class="text-end">
                                            <button type="submit" class="btn btn-quantum px-5"
                                                style="background: linear-gradient(135deg, #fbbf24, #f59e0b); border: none; color: #000; font-weight: 900;">COMMIT
                                                IDENTITY UPDATES</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </main>
                    </div>
                    <script src="${pageContext.request.contextPath}/js/background-switcher.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                    <script>function toggleSidebar() { document.getElementById('sidebar').classList.toggle('open'); }</script>
                </body>

                </html>