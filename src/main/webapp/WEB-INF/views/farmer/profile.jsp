<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>Farmer Profile - Smart Farming Platform</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                <link rel="icon" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>👤</text></svg>" />
            </head>

            <body>
                <div class="dashboard-layout">
                    <!-- Sidebar -->
                    <aside class="sidebar" id="sidebar">
                        <div class="sidebar-brand" style="cursor: pointer;" onclick="window.location.href='${pageContext.request.contextPath}/'">
                            <div class="brand-icon">🌾</div>
                            <div class="brand-text">
                                <h3>Smart Farming</h3>
                                <span>Farmer Portal</span>
                            </div>
                        </div>

                        <nav class="sidebar-nav">
                            <div class="nav-section-title">Main Menu</div>
                            <a href="${pageContext.request.contextPath}/farmer/dashboard"><span
                                    class="nav-icon">📊</span> Dashboard</a>
                            <a href="${pageContext.request.contextPath}/farmer/crop-recommendation"><span
                                    class="nav-icon">🌱</span> Crop Recommendation</a>
                            <a href="${pageContext.request.contextPath}/farmer/market-prices"><span
                                    class="nav-icon">📈</span> Market Prices</a>
                            <a href="${pageContext.request.contextPath}/farmer/disease-detection"><span
                                    class="nav-icon">🔬</span> Disease Detection</a>
                            <a href="${pageContext.request.contextPath}/farmer/marketplace"><span
                                    class="nav-icon">🛒</span> My Marketplace</a>
                            <a href="${pageContext.request.contextPath}/farmer/schemes"><span
                                    class="nav-icon">🏛️</span> Govt. Schemes</a>
                            <a href="${pageContext.request.contextPath}/farmer/learning"><span
                                    class="nav-icon">🎓</span> Learning Videos</a>
                            <div class="nav-section-title">Account</div>
                            <a href="${pageContext.request.contextPath}/farmer/profile" class="active"><span
                                    class="nav-icon">👤</span> My Profile</a>
                            <a href="${pageContext.request.contextPath}/logout"><span class="nav-icon">🚪</span> Logout</a>
                        </nav>
                    </aside>

                    <!-- Main Content -->
                    <div class="main-content">
                        <header class="top-nav">
                            <div class="top-nav-left">
                                <div class="hamburger" onclick="toggleSidebar()"><span></span><span></span><span></span>
                                </div>
                                <span class="page-title">👤 My Profile</span>
                            </div>
                            <div class="top-nav-right">
                                <div class="user-info">
                                    <div class="user-avatar" <c:if test="${not empty user.profileImagePath}">
                                        style="background: transparent; padding: 0;"</c:if>>
                                        <c:choose>
                                            <c:when test="${not empty user.profileImagePath}">
                                                <img src="${pageContext.request.contextPath}${user.profileImagePath}"
                                                    style="width: 100%; height: 100%; border-radius: 50%; object-fit: cover; display: block;"
                                                    alt="Profile Picture" />
                                            </c:when>
                                            <c:otherwise>
                                                ${fn:substring(user.fullName, 0, 1)}
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div style="display: flex; flex-direction: column; justify-content: center;">
                                        <div class="user-name">${user.fullName}</div>
                                        <div style="display: flex; align-items: center; gap: 8px; margin-top: 4px;">
                                            <div class="user-role" style="margin-bottom: 0;">👨‍🌾 Farmer</div>
                                            <div
                                                style="font-size: 10px; background: rgba(34,197,94,0.15); color: #22c55e; padding: 2px 6px; border-radius: 6px; display: inline-flex; align-items: center; font-weight: 700; border: 1px solid rgba(34,197,94,0.3); letter-spacing: 0.5px;">
                                                ⭐ ${not empty user.subscriptionPlan ? user.subscriptionPlan : 'Basic
                                                Plan'}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </header>

                        <div class="page-body">
                            <c:if test="${not empty successMessage}">
                                <div class="alert alert-success">✅ <span>${successMessage}</span></div>
                            </c:if>

                            <div class="card" style="max-width: 600px; margin: 0 auto;">
                                <div class="card-header">
                                    <span class="card-title">✏️ Edit Profile Details</span>
                                </div>
                                <div class="card-body">
                                    <form action="${pageContext.request.contextPath}/farmer/profile/update"
                                        method="post" enctype="multipart/form-data">

                                        <div
                                            style="display: flex; gap: 20px; align-items: center; margin-bottom: 24px;">
                                            <div
                                                style="width: 80px; height: 80px; border-radius: 50%; background: var(--surface); border: 2px dashed var(--border); display: flex; align-items: center; justify-content: center; overflow: hidden; position: relative;">
                                                <c:choose>
                                                    <c:when test="${not empty user.profileImagePath}">
                                                        <img src="${pageContext.request.contextPath}${user.profileImagePath}"
                                                            style="width: 100%; height: 100%; object-fit: cover;"
                                                            alt="Current Profile Image" />
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span style="font-size: 30px; color: #6b7280;"></span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                            <div style="flex-grow: 1;">
                                                <label class="form-label">Profile Image (optional)</label>
                                                <input type="file" name="profileImage" class="form-control"
                                                    accept="image/*" />
                                                <div style="font-size: 12px; color: #6b7280; margin-top: 4px;">Square
                                                    images work best</div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="form-label">Full Name</label>
                                            <input type="text" name="fullName" class="form-control"
                                                value="${user.fullName}" required />
                                        </div>

                                        <div class="form-group">
                                            <label class="form-label">Email Address (Cannot be changed)</label>
                                            <input type="email" class="form-control" value="${user.email}" disabled
                                                style="background: rgba(255,255,255,0.05);" />
                                        </div>

                                        <div class="form-group">
                                            <label class="form-label">Phone Number</label>
                                            <input type="text" name="phone" class="form-control" value="${user.phone}"
                                                required />
                                        </div>

                                        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 16px;">
                                            <div class="form-group">
                                                <label class="form-label">State</label>
                                                <input type="text" name="state" class="form-control"
                                                    value="${user.state}" />
                                            </div>
                                            <div class="form-group">
                                                <label class="form-label">District/City</label>
                                                <input type="text" name="district" class="form-control"
                                                    value="${user.district}" />
                                            </div>
                                        </div>

                                        <div style="margin-top: 24px; display: flex; justify-content: flex-end;">
                                            <button type="submit" class="btn btn-primary">Save Changes</button>
                                        </div>
                                    </form>
                                </div>
                            </div>

                            <div class="card" style="max-width: 600px; margin: 24px auto 0;">
                                <div class="card-header">
                                    <span class="card-title">⭐ My Subscription</span>
                                </div>
                                <div class="card-body">
                                    <div
                                        style="display: flex; justify-content: space-between; align-items: center; background: rgba(34,197,94,0.05); border: 1px solid rgba(34,197,94,0.2); padding: 16px; border-radius: 8px;">
                                        <div>
                                            <div style="font-size: 14px; color: #9ca3af; margin-bottom: 4px;">Current
                                                Plan</div>
                                            <div style="font-size: 18px; font-weight: 700; color: #22c55e;">
                                                ⭐ ${not empty user.subscriptionPlan ? user.subscriptionPlan : 'Basic
                                                Plan'}
                                            </div>
                                        </div>
                                        <div style="display: flex; gap: 10px;">
                                            <c:if test="${user.subscriptionPlan != 'Basic Plan'}">
                                                <form
                                                    action="${pageContext.request.contextPath}/farmer/profile/deactivate-plan"
                                                    method="post"
                                                    onsubmit="event.preventDefault(); showConfirmModal('Cancel Subscription', 'Are you sure you want to cancel your premium subscription? You will lose access to premium features.', this)">
                                                    <button type="submit" class="btn btn-secondary">Cancel Plan</button>
                                                </form>
                                            </c:if>
                                            <a href="${pageContext.request.contextPath}/subscription"
                                                class="btn btn-primary">Upgrade Plan</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="customConfirmModal"
                    style="display:none; position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0,0,0,0.6); backdrop-filter:blur(4px); z-index:9999; align-items:center; justify-content:center;">
                    <div
                        style="background:var(--surface); border:1px solid var(--border); border-radius:16px; padding:32px; max-width:400px; width:90%; box-shadow:0 20px 40px rgba(0,0,0,0.4); text-align:center;">
                        <div
                            style="font-size: 70px; margin-bottom: 16px; line-height: 1; text-shadow: 0 0 20px rgba(245,158,11,0.5);">
                            🛒</div>
                        <h3 id="confirmModalTitle"
                            style="color:var(--text-primary); font-size:22px; font-weight:700; margin-bottom:12px; margin-top:0;">
                            Confirm Action</h3>
                        <p id="confirmModalMessage"
                            style="color:#9ca3af; font-size:15px; margin-bottom:32px; line-height:1.5;">Are you sure?
                        </p>
                        <div style="display:flex; justify-content:center; gap:16px;">
                            <button type="button" class="btn"
                                style="background:rgba(255,255,255,0.05); border:1px solid var(--border); color:var(--text-primary); padding:10px 24px;"
                                onclick="closeConfirmModal()">Keep Plan</button>
                            <button type="button" class="btn btn-warning"
                                style="background:#f59e0b; color:white; padding:10px 24px;" id="confirmModalBtn">Yes,
                                Cancel Plan</button>
                        </div>
                    </div>
                </div>

                <script>
                    function toggleSidebar() { document.getElementById('sidebar').classList.toggle('open'); }

                    let pendingForm = null;
                    function showConfirmModal(title, message, formElement) {
                        document.getElementById('confirmModalTitle').innerText = title;
                        document.getElementById('confirmModalMessage').innerText = message;
                        pendingForm = formElement;
                        document.getElementById('customConfirmModal').style.display = 'flex';
                    }

                    function closeConfirmModal() {
                        document.getElementById('customConfirmModal').style.display = 'none';
                        pendingForm = null;
                    }

                    document.getElementById('confirmModalBtn').addEventListener('click', function () {
                        if (pendingForm) {
                            pendingForm.submit();
                        }
                    });
                </script>
            
<script src="${pageContext.request.contextPath}/js/i18n.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

            </html>
