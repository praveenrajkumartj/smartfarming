<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <title>🔐 SECURE AUTHENTICATION - AGROPLANTER</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
            <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800;900&display=swap"
                rel="stylesheet">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
            <link rel="icon"
                href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🔐</text></svg>" />
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
                    margin-bottom: 24px;
                    position: relative;
                }

                .password-toggle {
                    position: absolute;
                    right: 20px;
                    top: 48px;
                    color: rgba(255, 255, 255, 0.4);
                    cursor: pointer;
                    transition: 0.3s;
                    z-index: 10;
                }

                .password-toggle:hover {
                    color: #10b981;
                }

                .auth-input {
                    background: rgba(0, 0, 0, 0.3) !important;
                    border: 1px solid rgba(255, 255, 255, 0.1) !important;
                    border-radius: 16px !important;
                    padding: 16px 20px !important;
                    color: #fff !important;
                    transition: 0.3s;
                }

                .auth-input:focus {
                    border-color: #10b981 !important;
                    box-shadow: 0 0 20px rgba(16, 185, 129, 0.2) !important;
                    background: rgba(0, 0, 0, 0.5) !important;
                }

                .auth-label {
                    font-size: 11px;
                    font-weight: 800;
                    color: #94a3b8;
                    text-transform: uppercase;
                    letter-spacing: 1px;
                    margin-bottom: 8px;
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
                    margin-top: 10px;
                    transition: 0.3s;
                    box-shadow: 0 20px 40px rgba(16, 185, 129, 0.2);
                }

                .btn-auth:hover {
                    transform: translateY(-3px);
                    box-shadow: 0 30px 60px rgba(16, 185, 129, 0.4);
                }

                .brand-logo {
                    width: 60px;
                    height: 60px;
                    background: linear-gradient(135deg, #10b981, #3b82f6);
                    border-radius: 20px;
                    margin: 0 auto 30px;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    font-size: 30px;
                    box-shadow: 0 0 30px rgba(16, 185, 129, 0.3);
                }

                .brand-premium {
                    font-size: 28px;
                    font-weight: 900;
                    letter-spacing: -1.5px;
                    background: linear-gradient(135deg, #10b981 0%, #06b6d4 100%);
                    -webkit-background-clip: text;
                    background-clip: text;
                    -webkit-text-fill-color: transparent;
                    display: flex;
                    align-items: center;
                    gap: 10px;
                }

                .brand-icon-box {
                    width: 38px;
                    height: 38px;
                    background: linear-gradient(135deg, rgba(16, 185, 129, 0.2), rgba(6, 182, 212, 0.2));
                    border: 1px solid rgba(16, 185, 129, 0.3);
                    border-radius: 10px;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    font-size: 20px;
                    color: #10b981;
                }
            </style>
        </head>

        <body>
            <div class="auth-scene">
                <div class="cyber-grid"></div>
            </div>

            <div class="auth-card-premium">
                <div class="text-center mb-5">
                    <div class="d-flex justify-content-center mb-4">
                        <div class="brand-premium">
                            <div class="brand-icon-box">
                                <i class="fas fa-leaf"></i>
                            </div>
                            AGROPLANTER <span class="text-white opacity-25"
                                style="font-size: 14px; font-weight: 400; letter-spacing: 0;">v.3</span>
                        </div>
                    </div>
                    <p class="text-white-50 small text-uppercase fw-bold letter-spacing-1">Digital Command Center Access
                    </p>
                </div>

                <c:if test="${not empty errorMessage}">
                    <div
                        class="alert bg-danger bg-opacity-10 border-danger border-opacity-25 text-danger small mb-4 py-3 rounded-4">
                        ⚠️ AUTHENTICATION FAILURE: ${errorMessage}
                    </div>
                </c:if>

                <c:if test="${not empty successMessage}">
                    <div
                        class="alert bg-success bg-opacity-10 border-success border-opacity-25 text-success small mb-4 py-3 rounded-4">
                        ✅ SUCCESS: ${successMessage}
                    </div>
                </c:if>

                <c:if test="${not empty logoutMessage}">
                    <div
                        class="alert bg-info bg-opacity-10 border-info border-opacity-25 text-info small mb-4 py-3 rounded-4">
                        ℹ️ LOGOUT: ${logoutMessage}
                    </div>
                </c:if>

                <form action="${pageContext.request.contextPath}/login" method="post" autocomplete="off">
                    <div class="auth-input-group">
                        <label class="auth-label" for="email">IDENTIFIER (EMAIL)</label>
                        <input type="email" id="email" name="email" class="form-control auth-input" autocomplete="off"
                            placeholder="Enter secure UID" required />
                    </div>

                    <div class="auth-input-group">
                        <label class="auth-label" for="password">ENCRYPTION KEY (PASSWORD)</label>
                        <input type="password" id="password" name="password" class="form-control auth-input"
                            autocomplete="off" placeholder="••••••••" required />
                        <i class="fas fa-eye password-toggle" id="togglePassword"></i>
                    </div>

                    <div class="d-flex justify-content-between align-items-center mb-4 px-2">
                        <div class="form-check d-flex align-items-center gap-2">
                            <input class="form-check-input shadow-none bg-transparent border-white border-opacity-25"
                                type="checkbox" id="remember" name="remember-me" value="true"
                                style="width: 18px; height: 18px; border-radius: 4px; cursor: pointer;">
                            <label class="form-check-label text-white fw-bold small" for="remember"
                                style="cursor: pointer; opacity: 0.8;">Remember Me</label>
                        </div>
                        <a href="${pageContext.request.contextPath}/recovery"
                            class="text-decoration-none text-success small fw-bold">RECOVER KEY</a>
                    </div>

                    <button type="submit" class="btn btn-auth">INITIALIZE DASHBOARD →</button>
                </form>

                <div class="text-center mt-5 pt-3 border-top border-white border-opacity-10">
                    <p class="text-white-50 small">NEW OPERATOR? <a href="${pageContext.request.contextPath}/register"
                            class="text-white fw-bold text-decoration-none">REGISTER ASSET</a></p>
                    <a href="${pageContext.request.contextPath}/" class="text-muted small text-decoration-none">← ABORT
                        TO PUBLIC DOMAIN</a>
                </div>
            </div>

            <script src="${pageContext.request.contextPath}/js/background-switcher.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
            <script>
                document.addEventListener('DOMContentLoaded', function () {
                    const loginForm = document.querySelector('form');
                    const emailField = document.getElementById('email');
                    const passwordField = document.getElementById('password');

                    // FORCE EMPTY FORM ON LOAD
                    // This clears any persistent browser autofill data initially
                    setTimeout(() => {
                        loginForm.reset();
                        emailField.value = '';
                        passwordField.value = '';
                    }, 100);

                    // Security/UX: Clearing password when email starts changing
                    // to ensure correct credentials for each unique user
                    emailField.addEventListener('input', function () {
                        if (passwordField.value) {
                            passwordField.value = '';
                        }
                    });

                    document.getElementById('togglePassword').addEventListener('click', function () {
                        const type = passwordField.getAttribute('type') === 'password' ? 'text' : 'password';
                        passwordField.setAttribute('type', type);
                        this.classList.toggle('fa-eye');
                        this.classList.toggle('fa-eye-slash');
                    });
                });
            </script>
            <style>
                /* Prevent browser autofill from turning the inputs white */
                input:-webkit-autofill,
                input:-webkit-autofill:hover,
                input:-webkit-autofill:focus,
                input:-webkit-autofill:active {
                    -webkit-box-shadow: 0 0 0 40px #0c111d inset !important;
                    -webkit-text-fill-color: #ffffff !important;
                    transition: background-color 5000s ease-in-out 0s;
                }
            </style>
        </body>

        </html>