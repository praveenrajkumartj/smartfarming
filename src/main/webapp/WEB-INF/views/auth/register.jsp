<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <title>📝 ASSET REGISTRATION - AGROPLANTER</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
            <link rel="icon"
                href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>📝</text></svg>" />
            <style>
                body {
                    background: #020617;
                    min-height: 100vh;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    padding: 40px 20px;
                    font-family: 'Outfit', sans-serif;
                    color: #f8fafc;
                }

                .auth-scene {
                    position: fixed;
                    inset: 0;
                    background:
                        radial-gradient(circle at 10% 10%, rgba(16, 185, 129, 0.05) 0%, transparent 50%),
                        radial-gradient(circle at 90% 90%, rgba(59, 130, 246, 0.05) 0%, transparent 50%);
                    z-index: -1;
                }

                .auth-card-premium {
                    width: 100%;
                    max-width: 600px;
                    background: rgba(15, 23, 42, 0.6);
                    backdrop-filter: blur(30px);
                    border: 1px solid rgba(255, 255, 255, 0.1);
                    border-radius: 40px;
                    padding: 40px;
                    box-shadow: 0 40px 100px rgba(0, 0, 0, 0.8);
                    animation: cardEnter 0.8s cubic-bezier(0.16, 1, 0.3, 1);
                }

                @keyframes cardEnter {
                    from {
                        opacity: 0;
                        transform: translateY(20px);
                    }

                    to {
                        opacity: 1;
                        transform: translateY(0);
                    }
                }

                .role-selector-premium {
                    display: flex;
                    gap: 12px;
                    margin-bottom: 30px;
                }

                .role-item {
                    flex: 1;
                }

                .role-item input {
                    display: none;
                }

                .role-label {
                    display: flex;
                    flex-direction: column;
                    align-items: center;
                    padding: 15px;
                    background: rgba(0, 0, 0, 0.2);
                    border: 1px solid rgba(255, 255, 255, 0.1);
                    border-radius: 20px;
                    cursor: pointer;
                    transition: 0.3s;
                }

                .role-item input:checked+.role-label {
                    border-color: #10b981;
                    background: rgba(16, 185, 129, 0.1);
                    transform: translateY(-5px);
                    box-shadow: 0 10px 20px rgba(16, 185, 129, 0.1);
                }

                .auth-input {
                    background: rgba(0, 0, 0, 0.3) !important;
                    border: 1px solid rgba(255, 255, 255, 0.1) !important;
                    border-radius: 16px !important;
                    padding: 12px 20px !important;
                    color: #fff !important;
                    transition: 0.3s;
                    font-size: 14px !important;
                }

                .auth-input:focus {
                    border-color: #10b981 !important;
                    box-shadow: 0 0 20px rgba(16, 185, 129, 0.2) !important;
                }

                .col-md-12 {
                    position: relative;
                }

                .password-toggle {
                    position: absolute;
                    right: 30px;
                    top: 38px;
                    color: rgba(255, 255, 255, 0.4);
                    cursor: pointer;
                    transition: 0.3s;
                    z-index: 10;
                }

                .password-toggle:hover {
                    color: #10b981;
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
                    padding: 16px;
                    border-radius: 100px;
                    background: linear-gradient(135deg, #10b981, #3b82f6);
                    border: none;
                    color: white;
                    font-weight: 900;
                    text-transform: uppercase;
                    letter-spacing: 1px;
                    margin-top: 20px;
                    transition: 0.3s;
                }

                .btn-auth:hover {
                    transform: scale(1.02);
                    box-shadow: 0 20px 40px rgba(16, 185, 129, 0.4);
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
                    gap: 12px;
                }

                .brand-icon-box {
                    width: 40px;
                    height: 40px;
                    background: linear-gradient(135deg, rgba(16, 185, 129, 0.2), rgba(6, 182, 212, 0.2));
                    border: 1px solid rgba(16, 185, 129, 0.3);
                    border-radius: 12px;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    font-size: 18px;
                    color: #10b981;
                }
            </style>
        </head>

        <body>
            <div class="auth-scene"></div>

            <div class="auth-card-premium">
                <div class="text-center mb-4">
                    <div class="d-flex justify-content-center mb-3">
                        <div class="brand-premium">
                            <div class="brand-icon-box">
                                <i class="fas fa-leaf"></i>
                            </div>
                            AGROPLANTER
                        </div>
                    </div>
                    <h2 class="fw-900 text-white mb-1" style="font-size: 1.5rem; letter-spacing: 2px;">ASSET ONBOARDING
                    </h2>
                    <p class="text-white-50 small text-uppercase fw-bold letter-spacing-1">Join the AGROPLANTER
                        Ecosystem</p>
                </div>

                <c:if test="${not empty errorMessage}">
                    <div
                        class="alert bg-danger bg-opacity-10 border-danger border-opacity-25 text-danger small mb-4 py-2 rounded-4 text-center">
                        ${errorMessage}
                    </div>
                </c:if>

                <form action="${pageContext.request.contextPath}/register" method="post" autocomplete="off">
                    <div class="role-selector-premium">
                        <div class="role-item">
                            <input type="radio" id="farmer" name="role" value="FARMER" checked>
                            <label for="farmer" class="role-label">
                                <span class="fs-4 mb-2">👨‍🌾</span>
                                <span class="small fw-bold">FARMER</span>
                            </label>
                        </div>
                        <div class="role-item">
                            <input type="radio" id="buyer" name="role" value="BUYER">
                            <label for="buyer" class="role-label">
                                <span class="fs-4 mb-2">🛒</span>
                                <span class="small fw-bold">BUYER</span>
                            </label>
                        </div>
                        <div class="role-item">
                            <input type="radio" id="industry" name="role" value="B2B_BUYER">
                            <label for="industry" class="role-label">
                                <span class="fs-4 mb-2">🏭</span>
                                <span class="small fw-bold">B2B</span>
                            </label>
                        </div>
                    </div>

                    <div class="row g-3">
                        <div class="col-md-6">
                            <label class="auth-label">LEGAL FULL NAME</label>
                            <input type="text" name="fullName" class="form-control auth-input"
                                placeholder="e.g. Rahul Sharma" required autocomplete="none" />
                        </div>
                        <div class="col-md-6">
                            <label class="auth-label">MOBILE TELEMETRY</label>
                            <input type="text" name="phone" class="form-control auth-input"
                                placeholder="10-digit primary" required autocomplete="none" />
                        </div>
                        <div class="col-md-12">
                            <label class="auth-label">SECURE EMAIL ENDPOINT</label>
                            <input type="email" name="email" id="email" class="form-control auth-input"
                                placeholder="operator@Agroplanter.com" required autocomplete="none" />
                        </div>
                        <div class="col-md-6">
                            <label class="auth-label">STATE JURISDICTION</label>
                            <select name="state" class="form-select auth-input">
                                <option value="">Select Region</option>
                                <option value="Andhra Pradesh">Andhra Pradesh</option>
                                <option value="Bihar">Bihar</option>
                                <option value="Delhi">Delhi</option>
                                <option value="Gujarat">Gujarat</option>
                                <option value="Karnataka">Karnataka</option>
                                <option value="Maharashtra">Maharashtra</option>
                                <option value="Punjab">Punjab</option>
                                <option value="Tamil Nadu">Tamil Nadu</option>
                                <option value="Uttar Pradesh">Uttar Pradesh</option>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label class="auth-label">DISTRICT SECTOR</label>
                            <input type="text" name="district" class="form-control auth-input"
                                placeholder="Specify district" />
                        </div>
                        <div class="col-md-12">
                            <label class="auth-label">ACCESS PASSWORD</label>
                            <input type="password" name="password" id="password" class="form-control auth-input"
                                placeholder="Create high-entropy key" required autocomplete="new-password" />
                            <i class="fas fa-eye password-toggle" id="togglePassword"></i>
                        </div>
                    </div>

                    <button type="submit" class="btn btn-auth">FINALIZE ENROLLMENT →</button>
                </form>

                <div class="text-center mt-4 pt-3 border-top border-white border-opacity-10">
                    <p class="text-white-50 small">ALREADY REGISTERED? <a
                            href="${pageContext.request.contextPath}/login"
                            class="text-white fw-bold text-decoration-none">DECRYPT SESSION</a></p>
                    <div class="d-flex justify-content-center gap-4 mt-2">
                        <p class="small text-muted mb-0">Expert? <a
                                href="${pageContext.request.contextPath}/clinic/expert/register"
                                class="text-info text-decoration-none">APPLY FOR CLINIC ACCESS</a></p>
                    </div>
                </div>
            </div>

            <script>
                document.addEventListener('DOMContentLoaded', function () {
                    const registerForm = document.querySelector('form');
                    // Force clear form on load to bypass browser memory
                    setTimeout(() => {
                        registerForm.reset();
                        // Explicitly clear specific fields if needed
                        document.querySelectorAll('.auth-input').forEach(input => {
                            if (input.tagName === 'INPUT') input.value = '';
                        });
                    }, 100);

                    document.getElementById('togglePassword').addEventListener('click', function () {
                        const password = document.getElementById('password');
                        const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
                        password.setAttribute('type', type);
                        this.classList.toggle('fa-eye');
                        this.classList.toggle('fa-eye-slash');
                    });
                });
            </script>
            <script src="${pageContext.request.contextPath}/js/background-switcher.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>