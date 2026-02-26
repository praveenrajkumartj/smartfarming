<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <title>Login - Smart Farming Platform</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet"
                href="${pageContext.request.contextPath}/css/style.css?v=<%= System.currentTimeMillis() %>" />
            <link rel="icon" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🔑</text></svg>" />
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

                .demo-accounts {
                    margin-top: 24px;
                    background: rgba(22, 163, 74, 0.08);
                    border: 1px solid rgba(22, 163, 74, 0.15);
                    border-radius: 12px;
                    padding: 16px;
                }

                .demo-title {
                    font-size: 12px;
                    font-weight: 700;
                    color: #22c55e;
                    text-transform: uppercase;
                    letter-spacing: 0.8px;
                    margin-bottom: 12px;
                }

                .demo-item {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    padding: 6px 0;
                    border-bottom: 1px solid rgba(22, 163, 74, 0.08);
                    font-size: 12px;
                }

                .demo-item:last-child {
                    border-bottom: none;
                }

                .demo-role {
                    color: #86efac;
                    font-weight: 600;
                }

                .demo-cred {
                    color: #6b7280;
                    font-family: monospace;
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
                    <div class="auth-logo" style="cursor: pointer;"
                        onclick="window.location.href='${pageContext.request.contextPath}/'">
                        <div class="auth-logo-icon">🌾</div>
                        <h1>Smart Farming Platform</h1>
                        <p>Digital Agriculture for Modern India</p>
                    </div>

                    <div class="auth-card">
                        <h2 class="auth-title">Welcome Back 👋</h2>
                        <p class="auth-subtitle">Login to your farming dashboard</p>

                        <!-- Alerts -->
                        <c:if test="${not empty errorMessage}">
                            <div class="alert alert-error" style="margin-bottom:16px;">
                                ❌ <span>${errorMessage}</span>
                            </div>
                        </c:if>
                        <c:if test="${not empty successMessage}">
                            <div class="alert alert-success" style="margin-bottom:16px;">
                                ✅ <span>${successMessage}</span>
                            </div>
                        </c:if>
                        <c:if test="${not empty logoutMessage}">
                            <div class="alert alert-info" style="margin-bottom:16px;">
                                ℹ️ <span>${logoutMessage}</span>
                            </div>
                        </c:if>

                        <form id="loginForm" action="${pageContext.request.contextPath}/login" method="post">
                            <div class="form-group">
                                <label class="input-label">Email Address</label>
                                <div class="input-group">
                                    <span class="input-icon">🌾</span>
                                    <input type="email" name="email" id="email" placeholder="Enter your email" required
                                        autocomplete="email" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="input-label">Password</label>
                                <div class="input-group" style="margin-bottom: 8px;">
                                    <span class="input-icon">🌾</span>
                                    <input type="password" name="password" id="password"
                                        placeholder="Enter your password" required style="padding-right: 42px;" />
                                    <span class="password-toggle" onclick="togglePassword('password', this)"
                                        title="Toggle password visibility">👁️</span>
                                </div>
                                <div
                                    style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
                                    <div style="display: flex; align-items: center; gap: 8px;">
                                        <input type="checkbox" id="remember-me" name="remember-me" value="true"
                                            style="width: 16px; height: 16px; accent-color: #22c55e; cursor: pointer;">
                                        <label for="remember-me"
                                            style="font-size: 13px; color: #9ca3af; cursor: pointer;">Remember
                                            me</label>
                                    </div>
                                    <a href="${pageContext.request.contextPath}/forgot-password"
                                        style="font-size: 13px; color: #86efac; text-decoration: none; transition: color 0.3s; font-weight: 500;">Forgot
                                        Password?</a>
                                </div>
                            </div>

                            <button type="submit" class="submit-btn">
                                🚀 Login to Dashboard
                            </button>
                        </form>

                        <div class="auth-footer">
                            Don't have an account?
                            <a href="${pageContext.request.contextPath}/register">Register Now</a>
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

                // Remember Me - LocalStorage Logic
                document.addEventListener("DOMContentLoaded", function () {
                    const emailInput = document.getElementById("email");
                    const passwordInput = document.getElementById("password");
                    const rememberMeCb = document.getElementById("remember-me");
                    const loginForm = document.getElementById("loginForm");

                    // Function to populate password if email matches
                    function checkSavedPassword() {
                        const savedPasswords = JSON.parse(localStorage.getItem("smartFarmingSavedPasswords") || "{}");
                        const currentEmail = emailInput.value.trim();
                        if (currentEmail && savedPasswords[currentEmail]) {
                            passwordInput.value = savedPasswords[currentEmail];
                            rememberMeCb.checked = true;
                        }
                    }

                    // Listen for email input changes (typing, copy-paste, autofill)
                    emailInput.addEventListener("input", checkSavedPassword);
                    emailInput.addEventListener("change", checkSavedPassword);
                    emailInput.addEventListener("blur", checkSavedPassword);

                    // Check on load in case the browser auto-filled the email field immediately
                    setTimeout(checkSavedPassword, 100);

                    // On form submit, save or remove credentials based on checkbox
                    loginForm.addEventListener("submit", function () {
                        let savedPasswords = JSON.parse(localStorage.getItem("smartFarmingSavedPasswords") || "{}");
                        const currentEmail = emailInput.value.trim();

                        if (rememberMeCb.checked && currentEmail) {
                            savedPasswords[currentEmail] = passwordInput.value;
                            localStorage.setItem("smartFarmingSavedPasswords", JSON.stringify(savedPasswords));
                        } else if (!rememberMeCb.checked && currentEmail && savedPasswords[currentEmail]) {
                            delete savedPasswords[currentEmail];
                            localStorage.setItem("smartFarmingSavedPasswords", JSON.stringify(savedPasswords));
                        }
                    });
                });
            </script>
        
<script src="${pageContext.request.contextPath}/js/i18n.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

        </html>
