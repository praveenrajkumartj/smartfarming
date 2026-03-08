<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>📩 Sync Requisitions - AGROPLANTER Premium</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
                <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;700;800;900&display=swap"
                    rel="stylesheet">
                <style>
                    :root {
                        --accent: #3b82f6;
                        /* Blue for requests/sync */
                        --accent-success: #10b981;
                        --accent-soft: rgba(59, 130, 246, 0.1);
                        --bg-deep: #020617;
                        --glass: rgba(15, 23, 42, 0.6);
                        --border: rgba(255, 255, 255, 0.08);
                    }

                    body {
                        background-color: var(--bg-deep);
                        color: #f8fafc;
                        font-family: 'Outfit', sans-serif;
                        min-height: 100vh;
                        overflow-x: hidden;
                        background-image:
                            radial-gradient(circle at 10% 20%, rgba(59, 130, 246, 0.05) 0%, transparent 40%),
                            radial-gradient(circle at 90% 80%, rgba(16, 185, 129, 0.05) 0%, transparent 40%);
                    }

                    .premium-container {
                        max-width: 1000px;
                        margin: 0 auto;
                        padding: 60px 20px;
                    }

                    .header-section {
                        margin-bottom: 50px;
                    }

                    .header-section h1 {
                        font-size: 48px;
                        font-weight: 900;
                        letter-spacing: -2px;
                        background: linear-gradient(135deg, #fff 0%, #94a3b8 100%);
                        -webkit-background-clip: text;
                        -webkit-text-fill-color: transparent;
                        margin-bottom: 15px;
                    }

                    .header-section p {
                        font-size: 18px;
                        color: #94a3b8;
                        font-weight: 500;
                    }

                    .request-audit-card {
                        background: var(--glass);
                        backdrop-filter: blur(25px);
                        -webkit-backdrop-filter: blur(25px);
                        border: 1px solid var(--border);
                        border-radius: 32px;
                        padding: 30px;
                        margin-bottom: 20px;
                        display: flex;
                        align-items: center;
                        justify-content: space-between;
                        transition: 0.3s;
                        position: relative;
                        overflow: hidden;
                    }

                    .request-audit-card:hover {
                        border-color: rgba(59, 130, 246, 0.3);
                        background: rgba(15, 23, 42, 0.8);
                        transform: scale(1.01);
                    }

                    .initiator-orb {
                        width: 70px;
                        height: 70px;
                        border-radius: 22px;
                        background: linear-gradient(135deg, rgba(59, 130, 246, 0.1), rgba(59, 130, 246, 0.05));
                        border: 1px solid rgba(59, 130, 246, 0.2);
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        font-size: 28px;
                        font-weight: 800;
                        color: var(--accent);
                        text-shadow: 0 0 15px rgba(59, 130, 246, 0.3);
                    }

                    .nexus-badge {
                        display: inline-flex;
                        padding: 5px 14px;
                        background: rgba(59, 130, 246, 0.1);
                        border: 1px solid rgba(59, 130, 246, 0.2);
                        border-radius: 100px;
                        color: var(--accent);
                        font-size: 10px;
                        font-weight: 800;
                        letter-spacing: 1px;
                        text-transform: uppercase;
                    }

                    .action-group {
                        display: flex;
                        gap: 12px;
                    }

                    .btn-audit-accept {
                        padding: 12px 28px;
                        border-radius: 14px;
                        background: var(--accent-success);
                        color: #020617;
                        font-weight: 800;
                        border: none;
                        font-size: 12px;
                        text-transform: uppercase;
                        letter-spacing: 1px;
                        transition: 0.3s;
                    }

                    .btn-audit-reject {
                        padding: 12px 28px;
                        border-radius: 14px;
                        background: rgba(239, 68, 68, 0.1);
                        color: #ef4444;
                        font-weight: 800;
                        border: 1px solid rgba(239, 68, 68, 0.2);
                        font-size: 12px;
                        text-transform: uppercase;
                        letter-spacing: 1px;
                        transition: 0.3s;
                    }

                    .btn-audit-accept:hover {
                        transform: translateY(-2px);
                        box-shadow: 0 10px 20px rgba(16, 185, 129, 0.2);
                        background: #34d399;
                    }

                    .btn-audit-reject:hover {
                        background: rgba(239, 68, 68, 0.2);
                        color: #ff4d4d;
                    }

                    .return-node {
                        position: fixed;
                        top: 40px;
                        right: 40px;
                        z-index: 100;
                    }

                    .quantum-back-btn {
                        padding: 12px 25px;
                        background: rgba(255, 255, 255, 0.05);
                        border: 1px solid var(--border);
                        border-radius: 14px;
                        color: #fff;
                        text-decoration: none;
                        font-weight: 700;
                        font-size: 12px;
                        text-transform: uppercase;
                        letter-spacing: 1px;
                        backdrop-filter: blur(10px);
                        transition: 0.3s;
                    }

                    .quantum-back-btn:hover {
                        background: rgba(255, 255, 255, 0.1);
                        color: var(--accent-success);
                        border-color: var(--accent-success);
                    }

                    .empty-inbox {
                        text-align: center;
                        padding: 120px 20px;
                    }

                    .empty-orb {
                        font-size: 80px;
                        margin-bottom: 30px;
                        opacity: 0.4;
                        filter: drop-shadow(0 0 40px rgba(59, 130, 246, 0.2));
                    }

                    .sync-status-indicator {
                        display: flex;
                        align-items: center;
                        gap: 10px;
                        font-size: 11px;
                        font-weight: 700;
                        color: #64748b;
                        text-transform: uppercase;
                        letter-spacing: 1px;
                    }

                    .status-pulse {
                        width: 8px;
                        height: 8px;
                        background: #f59e0b;
                        border-radius: 50%;
                        animation: pulse-gold 2s infinite;
                    }

                    @keyframes pulse-gold {
                        0% {
                            box-shadow: 0 0 0 0 rgba(245, 158, 11, 0.7);
                        }

                        70% {
                            box-shadow: 0 0 0 10px rgba(245, 158, 11, 0);
                        }

                        100% {
                            box-shadow: 0 0 0 0 rgba(245, 158, 11, 0);
                        }
                    }
                </style>
            </head>

            <body>
                <div class="return-node">
                    <a href="${pageContext.request.contextPath}/chat" class="quantum-back-btn">
                        <span class="me-2">←</span> BACK TO TERMINAL
                    </a>
                </div>

                <div class="premium-container">
                    <header class="header-section">
                        <div class="small fw-900 text-uppercase mb-2"
                            style="color: var(--accent); letter-spacing: 3px;">Inbound Requisitions</div>
                        <h1>Sync Requests</h1>
                        <p>Audit and authorize incoming protocol connection requisitions from peer nodes.</p>
                    </header>

                    <div class="row">
                        <c:forEach var="req" items="${pendingRequests}">
                            <div class="col-12">
                                <div class="request-audit-card">
                                    <div class="d-flex align-items-center gap-4">
                                        <div class="initiator-orb">
                                            ${fn:substring(req.userA.fullName, 0, 1)}
                                        </div>
                                        <div>
                                            <div class="nexus-badge mb-2">${req.userA.role} Initiator</div>
                                            <h4 class="fw-800 m-0">${req.userA.fullName}</h4>
                                            <div class="sync-status-indicator mt-2">
                                                <div class="status-pulse"></div>
                                                Awaiting Authorization
                                            </div>
                                        </div>
                                    </div>

                                    <div class="action-group">
                                        <form action="${pageContext.request.contextPath}/chat/accept/${req.id}"
                                            method="POST">
                                            <button type="submit" class="btn-audit-accept">Authorize Sync</button>
                                        </form>
                                        <form action="${pageContext.request.contextPath}/chat/reject/${req.id}"
                                            method="POST">
                                            <button type="submit" class="btn-audit-reject">Decline</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                        <c:if test="${empty pendingRequests}">
                            <div class="empty-inbox">
                                <div class="empty-orb">📥</div>
                                <h2 class="fw-900 mb-3 text-white-50">Terminal Synchronized</h2>
                                <p class="text-white-50 fw-600 px-5">There are no pending protocol connection
                                    requisitions at this time. All inbound requests have been audited.</p>
                            </div>
                        </c:if>
                    </div>
                </div>
            </body>

            </html>


