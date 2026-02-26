<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>Manage Users - Admin Panel</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                <link rel="icon" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>👥</text></svg>" />
            </head>

            <body>
                <div class="dashboard-layout">
                    <aside class="sidebar" id="sidebar">
                        <div class="sidebar-brand" style="cursor: pointer;" onclick="window.location.href='${pageContext.request.contextPath}/'">
                            <div class="brand-icon">🌾</div>
                            <div class="brand-text">
                                <h3>Smart Farming</h3><span>Admin Panel</span>
                            </div>
                        </div>
                        <nav class="sidebar-nav">
                            <div class="nav-section-title">Admin Menu</div>
                            <a href="${pageContext.request.contextPath}/admin/dashboard"><span
                                    class="nav-icon">📊</span> Dashboard</a>
                            <a href="${pageContext.request.contextPath}/admin/users" class="active"><span
                                    class="nav-icon">👥</span> Manage Users</a>
                            <a href="${pageContext.request.contextPath}/admin/crops"><span class="nav-icon">🌾</span> Manage Crops</a>
                            <a href="${pageContext.request.contextPath}/admin/market-prices"><span
                                    class="nav-icon">📈</span> Market Prices</a>
                            <a href="${pageContext.request.contextPath}/admin/schemes"><span class="nav-icon">🏛️</span>
                                Govt. Schemes</a>
                            <a href="${pageContext.request.contextPath}/admin/disease-queries"><span
                                    class="nav-icon">🔬</span> Disease Queries</a>
                            <a href="${pageContext.request.contextPath}/admin/marketplace"><span
                                    class="nav-icon">📈</span> Marketplace</a>
                            <a href="${pageContext.request.contextPath}/admin/learning-videos"><span
                                    class="nav-icon">🎓</span> Learning Videos</a>
                            <div class="nav-section-title">Account</div>
                            <a href="${pageContext.request.contextPath}/logout"><span class="nav-icon">🚪</span> Logout</a>
                        </nav>
                    </aside>
                    <div class="main-content">
                        <header class="top-nav">
                            <div class="top-nav-left">
                                <div class="hamburger" onclick="toggleSidebar()"><span></span><span></span><span></span>
                                </div>
                                <span class="page-title">👥 Manage Users</span>
                            </div>
                        </header>
                        <div class="page-body">
                            <c:if test="${not empty successMessage}">
                                <div class="alert alert-success">✅ <span>${successMessage}</span></div>
                            </c:if>
                            <div class="card">
                                <div class="card-header">
                                    <span class="card-title">👥 All Registered Users</span>
                                    <span class="badge badge-success">${fn:length(users)} total users</span>
                                </div>
                                <div class="table-container">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Name</th>
                                                <th>Email</th>
                                                <th>Phone</th>
                                                <th>Role</th>
                                                <th>State</th>
                                                <th>District</th>
                                                <th>Current Plan</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${users}" var="u" varStatus="iStat">
                                                <tr>
                                                    <td style="color:#6b7280;font-size:12px;">${iStat.count}</td>
                                                    <td>
                                                        <div style="display:flex;align-items:center;gap:10px;">
                                                            <div
                                                                style="width:32px;height:32px;border-radius:50%;background:linear-gradient(135deg,#16a34a,#22c55e);display:flex;align-items:center;justify-content:center;font-weight:700;font-size:13px;color:#fff;flex-shrink:0;">
                                                                ${fn:substring(u.fullName, 0, 1)}
                                                            </div>
                                                            <span
                                                                style="font-weight:600;color:#f0fdf4;">${u.fullName}</span>
                                                        </div>
                                                    </td>
                                                    <td style="font-size:13px;color:#9ca3af;">${u.email}</td>
                                                    <td style="font-size:13px;">${u.phone}</td>
                                                    <td>
                                                        <span
                                                            class="badge ${u.role == 'FARMER' ? 'badge-success' : (u.role == 'BUYER' ? 'badge-info' : 'badge-warning')}">${u.role}</span>
                                                    </td>
                                                    <td style="font-size:12px;color:#9ca3af;">${u.state}</td>
                                                    <td style="font-size:12px;color:#9ca3af;">${u.district}</td>
                                                    <td>
                                                        <span
                                                            class="badge ${u.subscriptionPlan == 'Basic Plan' || u.subscriptionPlan == 'Local Buyer' ? 'badge-info' : 'badge-success'}">${u.subscriptionPlan}</span>
                                                    </td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${u.role != 'ADMIN'}">
                                                                <div style="display:flex; gap: 8px;">
                                                                    <form
                                                                        action="${pageContext.request.contextPath}/admin/users/delete/${u.id}"
                                                                        method="post"
                                                                        onsubmit="event.preventDefault(); showConfirmModal('Delete User', 'Are you sure you want to permanently delete user ${fn:escapeXml(u.fullName)}? This action cannot be undone.', this)">
                                                                        <button type="submit"
                                                                            class="btn btn-danger btn-sm">Delete</button>
                                                                    </form>
                                                                    <c:if
                                                                        test="${u.subscriptionPlan != 'Basic Plan' && u.subscriptionPlan != 'Local Buyer'}">
                                                                        <form
                                                                            action="${pageContext.request.contextPath}/admin/users/deactivate-plan/${u.id}"
                                                                            method="post"
                                                                            onsubmit="event.preventDefault(); showConfirmModal('Deactivate Plan', 'Are you sure you want to deactivate the premium subscription for ${fn:escapeXml(u.fullName)}?', this)">
                                                                            <button type="submit"
                                                                                class="btn btn-warning btn-sm"
                                                                                style="background:#f59e0b; color:white; border:none; border-radius:4px; padding:4px 8px; font-weight:600; cursor:pointer;">Deactivate
                                                                                Plan</button>
                                                                        </form>
                                                                    </c:if>
                                                                </div>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span
                                                                    style="color:#6b7280;font-size:12px;">Protected</span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
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
                                onclick="closeConfirmModal()">Cancel</button>
                            <button type="button" class="btn btn-primary" style="padding:10px 24px;"
                                id="confirmModalBtn">Yes, Proceed</button>
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
