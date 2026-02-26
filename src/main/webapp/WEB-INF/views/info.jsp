<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <title>${infoTitle} - Smart Farming Platform</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
            <style>
                .info-page-container {
                    max-width: 800px;
                    margin: 80px auto;
                    padding: 40px;
                    background: rgba(3, 7, 3, 0.6);
                    backdrop-filter: blur(10px);
                    border: 1px solid rgba(34, 197, 94, 0.2);
                    border-radius: 24px;
                    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.4);
                    text-align: center;
                }

                .info-icon {
                    font-size: 64px;
                    margin-bottom: 20px;
                }

                .info-title {
                    font-size: 32px;
                    font-weight: 800;
                    color: #22c55e;
                    margin-bottom: 24px;
                }

                .info-content {
                    font-size: 18px;
                    color: #d1d5db;
                    line-height: 1.8;
                    margin-bottom: 40px;
                }

                .back-btn {
                    display: inline-block;
                    padding: 12px 24px;
                    background: rgba(34, 197, 94, 0.1);
                    color: #22c55e;
                    border: 1px solid rgba(34, 197, 94, 0.3);
                    border-radius: 8px;
                    text-decoration: none;
                    font-weight: 600;
                    transition: all 0.2s;
                }

                .back-btn:hover {
                    background: rgba(34, 197, 94, 0.2);
                    color: #fff;
                    transform: translateY(-2px);
                }
            </style>
            <link rel="icon" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>ℹ️</text></svg>" />
            </head>

        <body style="background-color: var(--bg-dark); color: var(--text-light); font-family: 'Inter', sans-serif;">
            <div class="info-page-container">
                <div class="info-icon">
                    <c:choose>
                        <c:when test="${param.page == 'help'}">💡</c:when>
                        <c:when test="${param.page == 'terms'}">📜</c:when>
                        <c:when test="${param.page == 'privacy'}">🔒</c:when>
                        <c:when test="${param.page == 'contact'}">📞</c:when>
                        <c:otherwise>ℹ️</c:otherwise>
                    </c:choose>
                </div>
                <h1 class="info-title">${infoTitle}</h1>
                <p class="info-content">${infoContent}</p>
                <a href="${pageContext.request.contextPath}/" class="back-btn">← Back to Home</a>
            </div>
        
<script src="${pageContext.request.contextPath}/js/i18n.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

        </html>
