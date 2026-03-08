<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>🌐 Node Discovery - AGROPLANTER Premium</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
                <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;700;800;900&display=swap"
                    rel="stylesheet">
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
                <style>
                    :root {
                        --accent: #10b981;
                        --accent-soft: rgba(16, 185, 129, 0.1);
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
                            radial-gradient(circle at 10% 20%, rgba(16, 185, 129, 0.05) 0%, transparent 40%),
                            radial-gradient(circle at 90% 80%, rgba(59, 130, 246, 0.05) 0%, transparent 40%);
                    }

                    .premium-container {
                        max-width: 1100px;
                        margin: 0 auto;
                        padding: 60px 20px;
                    }

                    .discovery-header {
                        margin-bottom: 50px;
                        position: relative;
                    }

                    .discovery-header h1 {
                        font-size: 48px;
                        font-weight: 900;
                        letter-spacing: -2px;
                        background: linear-gradient(135deg, #fff 0%, #94a3b8 100%);
                        -webkit-background-clip: text;
                        -webkit-text-fill-color: transparent;
                        margin-bottom: 15px;
                    }

                    .discovery-header p {
                        font-size: 18px;
                        color: #94a3b8;
                        font-weight: 500;
                        max-width: 600px;
                    }

                    .node-grid {
                        display: grid;
                        grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
                        gap: 25px;
                    }

                    .node-card {
                        background: var(--glass);
                        backdrop-filter: blur(20px);
                        -webkit-backdrop-filter: blur(20px);
                        border: 1px solid var(--border);
                        border-radius: 32px;
                        padding: 35px;
                        transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
                        display: flex;
                        flex-direction: column;
                        gap: 25px;
                        position: relative;
                        overflow: hidden;
                    }

                    .node-card::before {
                        content: '';
                        position: absolute;
                        top: 0;
                        left: 0;
                        width: 100%;
                        height: 4px;
                        background: linear-gradient(90deg, transparent, var(--accent), transparent);
                        opacity: 0;
                        transition: 0.4s;
                    }

                    .node-card:hover {
                        transform: translateY(-10px);
                        border-color: rgba(16, 185, 129, 0.3);
                        box-shadow: 0 20px 40px rgba(0, 0, 0, 0.4);
                        background: rgba(15, 23, 42, 0.8);
                    }

                    .node-card:hover::before {
                        opacity: 1;
                    }

                    .node-avatar-orb {
                        width: 80px;
                        height: 80px;
                        border-radius: 24px;
                        background: linear-gradient(135deg, rgba(16, 185, 129, 0.1), rgba(16, 185, 129, 0.05));
                        border: 1px solid rgba(16, 185, 129, 0.2);
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        font-size: 32px;
                        font-weight: 800;
                        color: var(--accent);
                        text-shadow: 0 0 15px rgba(16, 185, 129, 0.5);
                        overflow: hidden;
                    }

                    .node-identity h4 {
                        font-weight: 800;
                        font-size: 22px;
                        margin-bottom: 8px;
                        letter-spacing: -0.5px;
                    }

                    .node-role-tag {
                        display: inline-flex;
                        align-items: center;
                        padding: 6px 16px;
                        background: var(--accent-soft);
                        border: 1px solid rgba(16, 185, 129, 0.2);
                        border-radius: 100px;
                        color: var(--accent);
                        font-size: 11px;
                        font-weight: 800;
                        letter-spacing: 1px;
                        text-transform: uppercase;
                    }

                    .btn-sync-node {
                        width: 100%;
                        padding: 16px;
                        border-radius: 18px;
                        background: var(--accent);
                        color: #020617;
                        font-weight: 800;
                        border: none;
                        transition: 0.3s;
                        text-transform: uppercase;
                        letter-spacing: 1px;
                        font-size: 13px;
                    }

                    .btn-sync-node:hover {
                        background: #34d399;
                        transform: translateY(-2px);
                        box-shadow: 0 10px 20px rgba(16, 185, 129, 0.3);
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
                        color: var(--accent);
                        border-color: var(--accent);
                    }

                    /* Success Alert Premium */
                    .sync-initiated-alert {
                        background: rgba(16, 185, 129, 0.1);
                        border: 1px solid rgba(16, 185, 129, 0.2);
                        border-radius: 20px;
                        padding: 20px 25px;
                        color: #10b981;
                        margin-bottom: 40px;
                        display: flex;
                        align-items: center;
                        gap: 15px;
                        backdrop-filter: blur(10px);
                    }

                    .empty-state-v3 {
                        text-align: center;
                        padding: 100px 20px;
                    }

                    .empty-icon {
                        font-size: 80px;
                        margin-bottom: 30px;
                        filter: drop-shadow(0 0 30px rgba(16, 185, 129, 0.2));
                        opacity: 0.5;
                    }
                </style>
            </head>

            <body>
                <div class="return-node">
                    <a href="${pageContext.request.contextPath}/chat" class="quantum-back-btn">
                        <span class="me-2">←</span> RETURN TO CORE
                    </a>
                </div>

                <div class="premium-container">
                    <header class="discovery-header">
                        <div class="small fw-900 text-uppercase mb-2"
                            style="color: var(--accent); letter-spacing: 3px;">Network Expansion</div>
                        <h1>Explore Nodes</h1>
                        <p>Establish secure protocol connections with industry experts, buyers, and fellow farmers
                            across the global AGROPLANTER network.</p>
                    </header>

                    <c:if test="${param.requested == 1}">
                        <div class="sync-initiated-alert">
                            <span style="font-size: 24px;">🚀</span>
                            <div>
                                <div class="fw-800">Connection Protocol Initiated</div>
                                <div class="small fw-600 opacity-75">Your sync request has been transmitted.
                                    Communication terminal will initialize upon nodal acceptance.</div>
                            </div>
                        </div>
                    </c:if>

                    <div class="node-grid">
                        <c:forEach var="u" items="${users}">
                            <div class="node-card">
                                <div class="d-flex align-items-center gap-4">
                                    <div class="node-avatar-orb">
                                        <c:choose>
                                            <c:when test="${not empty u.profileImagePath}">
                                                <img src="${fn:startsWith(u.profileImagePath, 'http') ? '' : pageContext.request.contextPath}${u.profileImagePath}"
                                                    onerror="this.src='https://ui-avatars.com/api/?name=${fn:replace(not empty u.fullName ? u.fullName : 'Node', ' ', '+')}&background=10b981&color=fff';"
                                                    alt="${u.fullName}"
                                                    style="width: 100%; height: 100%; object-fit: cover; border-radius: 20px;">
                                            </c:when>
                                            <c:otherwise>
                                                <i class="fas fa-user-astronaut"></i>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="node-identity">
                                        <div class="node-role-tag mb-2">${u.role} Node</div>
                                        <h4>${u.fullName}</h4>
                                        <div class="small fw-600 text-white-50">Verified AGROPLANTER Node ✓</div>
                                    </div>
                                </div>

                                <div class="mt-auto">
                                    <form action="${pageContext.request.contextPath}/chat/connect/${u.id}"
                                        method="POST">
                                        <button type="submit" class="btn-sync-node">Establish Sync</button>
                                    </form>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                    <c:if test="${empty users}">
                        <div class="empty-state-v3">
                            <div class="empty-icon">🗺️</div>
                            <h2 class="fw-900 mb-3">No Discoverable Nodes</h2>
                            <p class="text-white-50 fw-600 px-5">All available industrial nodes are currently
                                synchronized or have pending requisitions. Check back later for new network
                                participants.</p>
                        </div>
                    </c:if>
                </div>
            </body>

            </html>


