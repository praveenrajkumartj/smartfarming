<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <title>🛰️ KEY RECOVERY - AGROPLANTER</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
            <link rel="icon"
                href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🛰️</text></svg>" />
            <style>
                body {
                    background: #020617;
                    height: 100vh;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    overflow: hidden;
                    font-family: 'Outfit', sans-serif;
                }

                .auth-scene {
                    position: fixed;
                    inset: 0;
                    background:
                        radial-gradient(circle at 20% 30%, rgba(16, 185, 129, 0.05) 0%, transparent 50%),
                        radial-gradient(circle at 80% 70%, rgba(59, 130, 246, 0.05) 0%, transparent 50%);
                    z-index: -1;
                }

                .cyber-grid {
                    position: absolute;
                    inset: 0;
                    background-image: linear-gradient(rgba(255, 255, 255, 0.02) 1px, transparent 1px),
                        linear-gradient(90deg, rgba(255, 255, 255, 0.02) 1px, transparent 1px);
                    background-size: 50px 50px;
                    transform: perspective(1000px) rotateX(60deg) translateY(-200px);
                    opacity: 0.3;
                }

                .auth-card-premium {
                    width: 100%;
                    max-width: 450px;
                    background: rgba(15, 23, 42, 0.6);
                    backdrop-filter: blur(30px);
                    border: 1px solid rgba(255, 255, 255, 0.1);
                    border-radius: 40px;
                    padding: 50px;
                    box-shadow: 0 40px 100px rgba(0, 0, 0, 0.8), 0 0 40px rgba(16, 185, 129, 0.05);
                    animation: cardEnter 0.8s cubic-bezier(0.16, 1, 0.3, 1);
                }

                @keyframes cardEnter {
                    from {
                        opacity: 0;
                        transform: scale(0.95) translateY(20px);
                    }

                    to {
                        opacity: 1;
                        transform: scale(1) translateY(0);
                    }
                }

                .auth-input-group {
                    margin-bottom: 20px;
                }

                .auth-input {
                    background: rgba(0, 0, 0, 0.3) !important;
                    border: 1px solid rgba(255, 255, 255, 0.1) !important;
                    border-radius: 16px !important;
                    padding: 14px 20px !important;
                    color: #fff !important;
                    transition: 0.3s;
                    font-size: 14px;
                }

                .auth-input:focus {
                    border-color: #10b981 !important;
                    box-shadow: 0 0 20px rgba(16, 185, 129, 0.2) !important;
                    background: rgba(0, 0, 0, 0.5) !important;
                }

                .auth-label {
                    font-size: 10px;
                    font-weight: 800;
                    color: #94a3b8;
                    text-transform: uppercase;
                    letter-spacing: 1px;
                    margin-bottom: 6px;
                    margin-left: 4px;
                }

                .btn-auth {
                    width: 100%;
                    padding: 18px;
                    border-radius: 100px;
                    background: linear-gradient(135deg, #10b981, #3b82f6);
                    border: none;
                    color: white;
                    font-weight: 900;
                    text-transform: uppercase;
                    letter-spacing: 1px;
                    margin-top: 20px;
                    transition: 0.3s;
                    box-shadow: 0 20px 40px rgba(16, 185, 129, 0.2);
                }

                .btn-auth:hover {
                    transform: translateY(-3px);
                    box-shadow: 0 30px 60px rgba(16, 185, 129, 0.4);
                }

                .brand-logo {
                    width: 50px;
                    height: 50px;
                    background: linear-gradient(135deg, #10b981, #3b82f6);
                    border-radius: 16px;
                    margin: 0 auto 20px;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    font-size: 24px;
                    box-shadow: 0 0 30px rgba(16, 185, 129, 0.3);
                }
            </style>
        </head>

        <body>
            <div class="auth-scene">
                <div class="cyber-grid"></div>
            </div>

            <div class="auth-card-premium">
                <div class="text-center mb-4">
                    <div class="brand-logo">🛰️</div>
                    <h2 class="fw-900 text-white mb-2">KEY RECOVERY</h2>
                    <p class="text-white-50 x-small text-uppercase fw-bold letter-spacing-1">OTP Email
                        Verification
                    </p>
                </div>

                <c:if test="${not empty errorMessage}">
                    <div
                        class="alert bg-danger bg-opacity-10 border-danger border-opacity-25 text-danger x-small mb-4 py-3 rounded-4">
                        ⚠️ ${errorMessage}
                    </div>
                </c:if>

                <c:if test="${not empty successMessage}">
                    <div
                        class="alert bg-success bg-opacity-10 border-success border-opacity-25 text-success x-small mb-4 py-3 rounded-4">
                        ✅ ${successMessage}
                    </div>
                </c:if>

                <form action="${pageContext.request.contextPath}/recovery/send-otp" method="post">
                    <div class="auth-input-group">
                        <label class="auth-label">REGISTERED EMAIL ADDRESS</label>
                        <input type="email" name="email" class="form-control auth-input"
                            placeholder="praveen@example.com" required />
                    </div>

                    <button type="submit" class="btn btn-auth">SEND OTP →</button>
                </form>

                <div class="text-center mt-5 pt-3 border-top border-white border-opacity-10">
                    <a href="${pageContext.request.contextPath}/login" class="text-muted small text-decoration-none">←
                        ABORT
                        TO LOGIN INTERFACE</a>
                </div>
            </div>

            <script src="${pageContext.request.contextPath}/js/background-switcher.js"></script>
        </body>

        </html>