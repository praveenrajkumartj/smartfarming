<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>🔔 Notification Hub - AGROPLANTER</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
                        rel="stylesheet">
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
                    <link rel="stylesheet"
                        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
                    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800;900&display=swap"
                        rel="stylesheet">
                    <style>
                        .notification-card {
                            background: rgba(15, 23, 42, 0.4);
                            border: 1px solid rgba(255, 255, 255, 0.05);
                            border-radius: 25px;
                            padding: 30px;
                            margin-bottom: 20px;
                            transition: 0.3s;
                            backdrop-filter: blur(20px);
                            position: relative;
                            overflow: hidden;
                        }

                        .notification-card.unread {
                            border-left: 5px solid #10b981;
                            background: rgba(16, 185, 129, 0.05);
                        }

                        .notification-card:hover {
                            transform: scale(1.01);
                            background: rgba(15, 23, 42, 0.6);
                        }
                    </style>
                </head>

                <body>
                    <div class="dashboard-scene"></div>
                    <div class="dashboard-layout">
                        <aside class="sidebar sidebar-premium" id="sidebar">
                            <!-- Sidebar content same as dashboard -->
                            <div class="sidebar-brand px-4 py-4" style="cursor: pointer;"
                                onclick="window.location.href='${pageContext.request.contextPath}/farmer/dashboard'">
                                <div class="brand-premium" style="font-size: 20px;">
                                    <div class="brand-icon-box"><i class="fas fa-leaf"></i></div>
                                    <div class="brand-text">
                                        <h3 class="m-0"
                                            style="font-size: 18px; font-weight: 900; background: linear-gradient(135deg, #10b981 0%, #06b6d4 100%); -webkit-background-clip: text; background-clip: text; -webkit-text-fill-color: transparent;">
                                            AGROPLANTER</h3>
                                        <span
                                            style="font-size: 9px; color: #94a3b8; font-weight: 800; letter-spacing: 1px;">FARMER
                                            NODE V3</span>
                                    </div>
                                </div>
                            </div>
                            <nav class="sidebar-nav px-3 py-4">
                                <a href="${pageContext.request.contextPath}/farmer/dashboard"
                                    class="sidebar-nav-item mb-2"><span class="nav-icon">📊</span> Command Center</a>
                                <a href="${pageContext.request.contextPath}/farmer/notifications"
                                    class="sidebar-nav-item active mb-2"><span class="nav-icon">🔔</span> Alerts
                                    Control</a>
                                <!-- Other items... keeping it short for brevity -->
                            </nav>
                        </aside>

                        <main class="main-content">
                            <header class="top-nav">
                                <div class="page-title">
                                    <h1 class="m-0 fw-900 text-white"
                                        style="font-size: 2.2rem; letter-spacing: -1.5px;">Notification Hub</h1>
                                    <span class="v3-page-subtitle text-success uppercase"
                                        style="letter-spacing: 1px; font-weight: 800;">🛰️ SIGNAL INTERCEPTION | NODE:
                                        ${user.district}</span>
                                </div>
                            </header>

                            <div class="page-body px-5 py-5">
                                <div class="row">
                                    <div class="col-lg-8 mx-auto">
                                        <c:forEach items="${notifications}" var="n">
                                            <div class="notification-card ${n.read ? '' : 'unread'}">
                                                <div class="d-flex justify-content-between align-items-center mb-3">
                                                    <h5 class="text-white fw-900 m-0">${n.title}</h5>
                                                    <span
                                                        class="text-white-50 x-small fw-800 uppercase">${n.formattedTime}</span>
                                                </div>
                                                <p class="text-white-50 small fw-600 lh-lg">${n.message}</p>
                                                <div class="mt-4">
                                                    <span
                                                        class="badge bg-white bg-opacity-5 text-white-50 x-small fw-950 uppercase px-3 py-1 rounded-pill">${n.type}</span>
                                                    <c:if test="${!n.read}">
                                                        <button onclick="markAsRead(${n.id})"
                                                            class="btn btn-link text-success x-small fw-950 uppercase p-0 ms-4 text-decoration-none">ACKNOWLEDGE
                                                            SIGNAL ✓</button>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </c:forEach>
                                        <c:if test="${empty notifications}">
                                            <div class="text-center py-5 opacity-30">
                                                <div class="display-1 mb-4">📡</div>
                                                <h4 class="text-white fw-900 uppercase">NO SIGNALS DETECTED</h4>
                                                <p class="text-white-50 small fw-800 uppercase">WAVELENGTH STABLE,
                                                    MONITORING ACTIVE</p>
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </main>
                    </div>
                    <script>
                        function markAsRead(id) {
                            fetch('${pageContext.request.contextPath}/api/notifications/mark-read/' + id, { method: 'POST' })
                                .then(() => location.reload());
                        }
                    </script>
                </body>

                </html>