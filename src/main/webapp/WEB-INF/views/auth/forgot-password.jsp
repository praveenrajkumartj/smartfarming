<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <title>Forgot Password - Smart Farming Platform</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet"
                href="${pageContext.request.contextPath}/css/style.css?v=<%= System.currentTimeMillis() %>" />
            <link rel="icon" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🔒</text></svg>" />
            <style>
                body {
                    background: transparent;
                    min-height: 100vh;
                    display: flex;
                    flex-direction: column;
                }

                .auth-container {
                    flex: 1;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    padding: 40px 20px;
                }

                .auth-box {
                    width: 100%;
                    max-width: 440px;
                }

                .auth-logo {
                    text-align: center;
                    margin-bottom: 32px;
                }

                .auth-logo-icon {
                    width: 64px;
                    height: 64px;
                    background: linear-gradient(135deg, #16a34a, #22c55e);
                    border-radius: 16px;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    font-size: 32px;
                    margin: 0 auto 16px;
                    box-shadow: 0 8px 32px rgba(22, 163, 74, 0.4);
                }

                .auth-logo h1 {
                    font-size: 22px;
                    font-weight: 800;
                    color: #f0fdf4;
                    margin-bottom: 4px;
                }

                .auth-logo p {
                    font-size: 14px;
                    color: #6b7280;
                }

                .auth-card {
                    background: #0d150d;
                    border: 1px solid rgba(22, 163, 74, 0.15);
                    border-radius: 24px;
                    padding: 32px;
                    box-shadow: 0 24px 80px rgba(0, 0, 0, 0.6);
                }

                .auth-title {
                    font-size: 24px;
                    font-weight: 800;
                    color: #f0fdf4;
                    margin-bottom: 6px;
                }

                .auth-subtitle {
                    font-size: 14px;
                    color: #6b7280;
                    margin-bottom: 28px;
                }

                .input-group {
                    position: relative;
                    margin-bottom: 18px;
                }

                .input-icon {
                    position: absolute;
                    left: 14px;
                    top: 50%;
                    transform: translateY(-50%);
                    font-size: 16px;
                    color: #6b7280;
                    pointer-events: none;
                }

                .password-toggle {
                    position: absolute;
                    right: 14px;
                    top: 50%;
                    transform: translateY(-50%);
                    font-size: 16px;
                    cursor: pointer;
                    opacity: 0.6;
                    transition: opacity 0.2s;
                    user-select: none;
                    background: none;
                    border: none;
                    padding: 0;
                }

                .password-toggle:hover {
                    opacity: 1;
                }

                .input-group input {
                    width: 100%;
                    padding: 12px 14px 12px 42px;
                    background: #1a2b1a;
                    border: 1px solid rgba(22, 163, 74, 0.15);
                    border-radius: 12px;
                    color: #f0fdf4;
                    font-size: 14px;
                    font-family: 'Inter', sans-serif;
                    transition: all 0.3s;
                }

                .input-group input:focus {
                    outline: none;
                    border-color: #16a34a;
                    box-shadow: 0 0 0 3px rgba(22, 163, 74, 0.15);
                    background: #1f3520;
                }

                .input-group input::placeholder {
                    color: #4b5563;
                }

                .input-label {
                    display: block;
                    font-size: 12px;
                    font-weight: 600;
                    color: #86efac;
                    margin-bottom: 6px;
                    text-transform: uppercase;
                    letter-spacing: 0.5px;
                }

                .submit-btn {
                    width: 100%;
                    padding: 14px;
                    background: linear-gradient(135deg, #16a34a, #22c55e);
                    color: white;
                    border: none;
                    border-radius: 12px;
                    font-size: 15px;
                    font-weight: 700;
                    cursor: pointer;
                    transition: all 0.3s;
                    font-family: 'Inter', sans-serif;
                    margin-top: 8px;
                }

                .submit-btn:hover {
                    transform: translateY(-2px);
                    box-shadow: 0 8px 32px rgba(22, 163, 74, 0.4);
                }

                .auth-footer {
                    text-align: center;
                    margin-top: 24px;
                    font-size: 14px;
                    color: #6b7280;
                }

                .auth-footer a {
                    color: #22c55e;
                    font-weight: 600;
                }

                .auth-footer a:hover {
                    color: #16a34a;
                }

                .back-link {
                    text-align: center;
                    padding: 20px;
                }

                .back-link a {
                    color: #6b7280;
                    font-size: 13px;
                    text-decoration: none;
                    display: inline-flex;
                    align-items: center;
                    gap: 6px;
                }

                .back-link a:hover {
                    color: #22c55e;
                }
            </style>
        </head>

        <body>
            <div class="auth-container">
                <div class="auth-box">
                    <div class="auth-logo" style="cursor: pointer;" onclick="window.location.href='${pageContext.request.contextPath}/'">
                        <div class="auth-logo-icon">🌾</div>
                        <h1>Smart Farming Platform</h1>
                        <p>Digital Agriculture for Modern India</p>
                    </div>

                    <div class="auth-card">
                        <h2 class="auth-title">Reset Password 🛡️</h2>
                        <p class="auth-subtitle">Enter your registered phone number</p>

                        <!-- Alerts -->
                        <c:if test="${not empty errorMessage}">
                            <div class="alert alert-error" style="margin-bottom:16px;">
                                ❌ <span>${errorMessage}</span>
                            </div>
                        </c:if>

                        <form action="${pageContext.request.contextPath}/forgot-password" method="post">
                            <div class="form-group">
                                <label class="input-label">Phone Number</label>
                                <div class="input-group">
                                    <span class="input-icon">🌾</span>
                                    <input type="text" name="phone" id="phone"
                                        placeholder="Enter your 10-digit phone number" required />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="input-label">New Password</label>
                                <div class="input-group">
                                    <span class="input-icon">🌾</span>
                                    <input type="password" name="newPassword" id="newPassword"
                                        placeholder="Enter your new password" required style="padding-right: 42px;" />
                                    <span class="password-toggle" onclick="togglePassword('newPassword', this)"
                                        title="Toggle password visibility">👁️</span>
                                </div>
                            </div>

                            <button type="submit" class="submit-btn">
                                🔄 Update Password
                            </button>
                        </form>

                        <div class="auth-footer">
                            Remembered your password?
                            <a href="${pageContext.request.contextPath}/login">Login Here</a>
                        </div>
                    </div>

                    <div class="back-link">
                        <a href="${pageContext.request.contextPath}/">← Back to Home</a>
                    </div>
                </div>
            </div>
            <script src="${pageContext.request.contextPath}/js/background-switcher.js"></script>
            <script>
                function togglePassword(inputId, icon) {
                    const input = document.getElementById(inputId);
                    if (input.type === 'password') {
                        input.type = 'text';
                        icon.innerText = '👁️';
                    } else {
                        input.type = 'password';
                        icon.innerText = '🙈';
                    }
                }
            </script>
        
<script src="${pageContext.request.contextPath}/js/i18n.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

        </html>
