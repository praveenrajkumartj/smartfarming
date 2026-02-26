<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <title>Register - Smart Farming Platform</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet"
                href="${pageContext.request.contextPath}/css/style.css?v=<%= System.currentTimeMillis() %>" />
            <link rel="icon" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>📝</text></svg>" />
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
                    max-width: 520px;
                }

                .auth-logo {
                    text-align: center;
                    margin-bottom: 28px;
                }

                .auth-logo-icon {
                    width: 56px;
                    height: 56px;
                    background: linear-gradient(135deg, #16a34a, #22c55e);
                    border-radius: 14px;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    font-size: 28px;
                    margin: 0 auto 12px;
                    box-shadow: 0 8px 24px rgba(22, 163, 74, 0.4);
                }

                .auth-logo h1 {
                    font-size: 20px;
                    font-weight: 800;
                    color: #f0fdf4;
                }

                .auth-logo p {
                    font-size: 13px;
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
                    font-size: 22px;
                    font-weight: 800;
                    color: #f0fdf4;
                    margin-bottom: 4px;
                }

                .auth-subtitle {
                    font-size: 13px;
                    color: #6b7280;
                    margin-bottom: 24px;
                }

                .form-row {
                    display: grid;
                    grid-template-columns: 1fr 1fr;
                    gap: 14px;
                }

                .input-group {
                    position: relative;
                    margin-bottom: 16px;
                }

                .input-icon {
                    position: absolute;
                    left: 14px;
                    top: 50%;
                    transform: translateY(-50%);
                    font-size: 15px;
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

                .input-label {
                    display: block;
                    font-size: 11px;
                    font-weight: 600;
                    color: #86efac;
                    margin-bottom: 5px;
                    text-transform: uppercase;
                    letter-spacing: 0.5px;
                }

                .input-group input,
                .input-group select {
                    width: 100%;
                    padding: 11px 14px 11px 40px;
                    background: #1a2b1a;
                    border: 1px solid rgba(22, 163, 74, 0.15);
                    border-radius: 10px;
                    color: #f0fdf4;
                    font-size: 14px;
                    font-family: 'Inter', sans-serif;
                    transition: all 0.3s;
                }

                .input-group input:focus,
                .input-group select:focus {
                    outline: none;
                    border-color: #16a34a;
                    box-shadow: 0 0 0 3px rgba(22, 163, 74, 0.12);
                    background: #1f3520;
                }

                .input-group input::placeholder {
                    color: #4b5563;
                }

                .input-group select option {
                    background: #1a2b1a;
                }

                .role-selector {
                    display: grid;
                    grid-template-columns: repeat(2, 1fr);
                    gap: 10px;
                    margin-bottom: 18px;
                }

                .role-option {
                    display: none;
                }

                .role-label {
                    display: flex;
                    flex-direction: column;
                    align-items: center;
                    gap: 4px;
                    padding: 14px 10px;
                    background: #1a2b1a;
                    border: 1px solid rgba(22, 163, 74, 0.15);
                    border-radius: 12px;
                    cursor: pointer;
                    transition: all 0.2s;
                    text-align: center;
                }

                .role-label:hover {
                    border-color: rgba(22, 163, 74, 0.4);
                    background: #1f3520;
                }

                .role-option:checked+.role-label {
                    border-color: #16a34a;
                    background: rgba(22, 163, 74, 0.15);
                    box-shadow: 0 0 16px rgba(22, 163, 74, 0.2);
                }

                .role-emoji {
                    font-size: 24px;
                }

                .role-name {
                    font-size: 12px;
                    font-weight: 600;
                    color: #f0fdf4;
                }

                .submit-btn {
                    width: 100%;
                    padding: 13px;
                    background: linear-gradient(135deg, #16a34a, #22c55e);
                    color: white;
                    border: none;
                    border-radius: 12px;
                    font-size: 14px;
                    font-weight: 700;
                    cursor: pointer;
                    transition: all 0.3s;
                    font-family: 'Inter', sans-serif;
                }

                .submit-btn:hover {
                    transform: translateY(-2px);
                    box-shadow: 0 8px 28px rgba(22, 163, 74, 0.4);
                }

                .auth-footer {
                    text-align: center;
                    margin-top: 20px;
                    font-size: 13px;
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
                    padding: 16px;
                }

                .back-link a {
                    color: #6b7280;
                    font-size: 13px;
                    text-decoration: none;
                }

                .back-link a:hover {
                    color: #22c55e;
                }

                .form-group {
                    margin-bottom: 0;
                }
            </style>
        </head>

        <body>
            <div class="auth-container">
                <div class="auth-box">
                    <div class="auth-logo" style="cursor: pointer;" onclick="window.location.href='${pageContext.request.contextPath}/'">
                        <div class="auth-logo-icon">🌾</div>
                        <h1>Smart Farming Platform</h1>
                        <p>Create your free account today</p>
                    </div>

                    <div class="auth-card">
                        <h2 class="auth-title">Create Account ✨</h2>
                        <p class="auth-subtitle">Join thousands of farmers on our platform</p>

                        <c:if test="${not empty errorMessage}">
                            <div class="alert alert-error" style="margin-bottom:16px;">
                                ❌ <span>${errorMessage}</span>
                            </div>
                        </c:if>

                        <form action="${pageContext.request.contextPath}/register" method="post">

                            <!-- Choose Role -->
                            <div style="margin-bottom:18px;">
                                <label class="input-label" style="margin-bottom:10px;">I am a:</label>
                                <div class="role-selector">
                                    <div>
                                        <input type="radio" id="roleFarmer" class="role-option" name="role"
                                            value="FARMER" checked />
                                        <label for="roleFarmer" class="role-label">
                                            <span class="role-emoji">👨‍🌾</span>
                                            <span class="role-name">Farmer</span>
                                        </label>
                                    </div>
                                    <div>
                                        <input type="radio" id="roleBuyer" class="role-option" name="role"
                                            value="BUYER" />
                                        <label for="roleBuyer" class="role-label">
                                            <span class="role-emoji">🛒</span>
                                            <span class="role-name">Buyer</span>
                                        </label>
                                    </div>

                                </div>
                            </div>

                            <div class="form-row">
                                <div>
                                    <label class="input-label">Full Name</label>
                                    <div class="input-group" style="margin-bottom:0;">
                                        <span class="input-icon">🌾</span>
                                        <input type="text" name="fullName" value="${user.fullName}"
                                            placeholder="Full name" required />
                                    </div>
                                </div>
                                <div>
                                    <label class="input-label">Phone Number</label>
                                    <div class="input-group" style="margin-bottom:0;">
                                        <span class="input-icon">🌾</span>
                                        <input type="text" name="phone" value="${user.phone}"
                                            placeholder="10-digit phone" required />
                                    </div>
                                </div>
                            </div>

                            <div style="margin-top:16px;">
                                <label class="input-label">Email Address</label>
                                <div class="input-group" style="margin-bottom:0;">
                                    <span class="input-icon">🌾</span>
                                    <input type="email" name="email" value="${user.email}"
                                        placeholder="Enter your email" required />
                                </div>
                            </div>

                            <div class="form-row" style="margin-top:16px;">
                                <div>
                                    <label class="input-label">State</label>
                                    <div class="input-group" style="margin-bottom:0;">
                                        <span class="input-icon">📍</span>
                                        <select name="state">
                                            <option value="">Select State</option>
                                            <option value="Andhra Pradesh" ${user.state=='Andhra Pradesh' ? 'selected'
                                                : '' }>Andhra Pradesh</option>
                                            <option value="Bihar" ${user.state=='Bihar' ? 'selected' : '' }>Bihar
                                            </option>
                                            <option value="Chhattisgarh" ${user.state=='Chhattisgarh' ? 'selected' : ''
                                                }>Chhattisgarh</option>
                                            <option value="Delhi" ${user.state=='Delhi' ? 'selected' : '' }>Delhi
                                            </option>
                                            <option value="Gujarat" ${user.state=='Gujarat' ? 'selected' : '' }>Gujarat
                                            </option>
                                            <option value="Haryana" ${user.state=='Haryana' ? 'selected' : '' }>Haryana
                                            </option>
                                            <option value="Jharkhand" ${user.state=='Jharkhand' ? 'selected' : '' }>
                                                Jharkhand</option>
                                            <option value="Karnataka" ${user.state=='Karnataka' ? 'selected' : '' }>
                                                Karnataka</option>
                                            <option value="Kerala" ${user.state=='Kerala' ? 'selected' : '' }>Kerala
                                            </option>
                                            <option value="Madhya Pradesh" ${user.state=='Madhya Pradesh' ? 'selected'
                                                : '' }>Madhya Pradesh</option>
                                            <option value="Maharashtra" ${user.state=='Maharashtra' ? 'selected' : '' }>
                                                Maharashtra</option>
                                            <option value="Odisha" ${user.state=='Odisha' ? 'selected' : '' }>Odisha
                                            </option>
                                            <option value="Punjab" ${user.state=='Punjab' ? 'selected' : '' }>Punjab
                                            </option>
                                            <option value="Rajasthan" ${user.state=='Rajasthan' ? 'selected' : '' }>
                                                Rajasthan</option>
                                            <option value="Tamil Nadu" ${user.state=='Tamil Nadu' ? 'selected' : '' }>
                                                Tamil Nadu</option>
                                            <option value="Telangana" ${user.state=='Telangana' ? 'selected' : '' }>
                                                Telangana</option>
                                            <option value="Uttar Pradesh" ${user.state=='Uttar Pradesh' ? 'selected'
                                                : '' }>Uttar Pradesh</option>
                                            <option value="Uttarakhand" ${user.state=='Uttarakhand' ? 'selected' : '' }>
                                                Uttarakhand</option>
                                            <option value="West Bengal" ${user.state=='West Bengal' ? 'selected' : '' }>
                                                West Bengal</option>
                                        </select>
                                    </div>
                                </div>
                                <div>
                                    <label class="input-label">District</label>
                                    <div class="input-group" style="margin-bottom:0;">
                                        <span class="input-icon">🌾</span>
                                        <input type="text" name="district" value="${user.district}"
                                            placeholder="Your district" />
                                    </div>
                                </div>
                            </div>

                            <div style="margin-top:16px;">
                                <label class="input-label">Password</label>
                                <div class="input-group" style="margin-bottom:0;">
                                    <span class="input-icon">🌾</span>
                                    <input type="password" name="password" id="password"
                                        placeholder="Create password (min 6 chars)" required
                                        style="padding-right: 42px;" />
                                    <span class="password-toggle" onclick="togglePassword('password', this)"
                                        title="Toggle password visibility">👁️</span>
                                </div>
                            </div>

                            <button type="submit" class="submit-btn" style="margin-top:20px;">
                                🚀 Create My Account
                            </button>
                        </form>

                        <div class="auth-footer">
                            Already have an account? <a href="${pageContext.request.contextPath}/login">Login Here</a>
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
