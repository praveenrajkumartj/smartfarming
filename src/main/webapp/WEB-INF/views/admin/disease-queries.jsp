<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>Disease Queries - Admin Panel</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                <link rel="icon" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🔬</text></svg>" />
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
                            <a href="${pageContext.request.contextPath}/admin/users"><span class="nav-icon">👥</span> Manage Users</a>
                            <a href="${pageContext.request.contextPath}/admin/crops"><span class="nav-icon">🌾</span> Manage Crops</a>
                            <a href="${pageContext.request.contextPath}/admin/market-prices"><span
                                    class="nav-icon">📈</span> Market Prices</a>
                            <a href="${pageContext.request.contextPath}/admin/schemes"><span class="nav-icon">🏛️</span>
                                Govt. Schemes</a>
                            <a href="${pageContext.request.contextPath}/admin/disease-queries" class="active"><span
                                    class="nav-icon">🔬</span> Disease
                                Queries</a>
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
                                <span class="page-title">🔬 Disease Queries</span>
                            </div>
                        </header>
                        <div class="page-body">
                            <c:if test="${not empty successMessage}">
                                <div class="alert alert-success">✅ <span>${successMessage}</span></div>
                            </c:if>

                            <div class="card">
                                <div class="card-header">
                                    <span class="card-title">🔬 All Disease Queries</span>
                                    <span class="badge badge-warning">${fn:length(queries)} queries</span>
                                </div>
                                <div class="card-body" style="padding:16px;">
                                    <c:if test="${empty queries}">
                                        <div class="empty-state">
                                            <div class="empty-state-icon">📍</div>
                                            <h3>No disease queries yet</h3>
                                            <p>Farmers haven't submitted any disease detection queries</p>
                                        </div>
                                    </c:if>

                                    <c:forEach items="${queries}" var="q">
                                        <div
                                            style="background:var(--surface);border:1px solid var(--border);border-radius:16px;padding:20px;margin-bottom:16px;">
                                            <div
                                                style="display:flex;justify-content:space-between;align-items:start;margin-bottom:14px;flex-wrap:wrap;gap:10px;">
                                                <div>
                                                    <div
                                                        style="font-size:18px;font-weight:800;color:#22c55e;margin-bottom:2px;">
                                                        ${q.cropName}</div>
                                                    <div style="font-size:12px;color:#6b7280;">
                                                        👤 <span>${q.user.fullName}</span>
                                                        &nbsp;•&nbsp; <span>${q.user.phone}</span>
                                                        &nbsp;•&nbsp; <span>${q.createdAt}</span>
                                                    </div>
                                                </div>
                                                <span
                                                    class="badge ${q.status == 'PENDING' ? 'badge-warning' : (q.status == 'DIAGNOSED' ? 'badge-success' : 'badge-info')}">${q.status}</span>
                                            </div>

                                            <div style="margin-bottom:14px;">
                                                <div
                                                    style="font-size:12px;font-weight:600;color:#6b7280;margin-bottom:4px;">
                                                    SYMPTOMS DESCRIBED</div>
                                                <div
                                                    style="font-size:14px;color:#f0fdf4;padding:12px;background:rgba(22,163,74,0.05);border-radius:8px;border:1px solid rgba(22,163,74,0.1);">
                                                    ${q.symptoms}</div>
                                            </div>

                                            <c:if test="${not empty q.diseaseName}">
                                                <div style="margin-bottom:14px;">
                                                    <div style="display:grid;grid-template-columns:1fr 1fr;gap:12px;">
                                                        <div
                                                            style="padding:12px;background:rgba(22,163,74,0.08);border-radius:8px;border:1px solid rgba(22,163,74,0.15);">
                                                            <div
                                                                style="font-size:11px;font-weight:700;color:#22c55e;margin-bottom:4px;">
                                                                🔬 DETECTED DISEASE</div>
                                                            <div style="font-size:15px;color:#f0fdf4;font-weight:700;">
                                                                ${q.diseaseName} <span
                                                                    style="font-size:12px;color:#7dd3fc;background:rgba(14,165,233,0.1);padding:2px 6px;border-radius:4px;margin-left:6px;">${q.confidenceScore}%
                                                                    Confidence</span></div>
                                                            <div
                                                                style="font-size:12px;margin-top:4px;color:${q.severityLevel == 'CRITICAL' ? '#ef4444' : (q.severityLevel == 'HIGH' ? '#f59e0b' : '#22c55e')}">
                                                                Severity: <strong>${q.severityLevel}</strong></div>
                                                        </div>
                                                        <div
                                                            style="padding:12px;background:rgba(251,191,36,0.08);border-radius:8px;border:1px solid rgba(251,191,36,0.15);">
                                                            <div
                                                                style="font-size:11px;font-weight:700;color:#fbbf24;margin-bottom:4px;">
                                                                📋 GENERAL OVERVIEW</div>
                                                            <div style="font-size:13px;color:#f0fdf4;">${q.diagnosis}
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>

                                            <!-- AI Expert Analysis Form -->
                                            <form
                                                action="${pageContext.request.contextPath}/admin/disease-queries/update/${q.id}"
                                                method="post">
                                                <div
                                                    style="background:rgba(0,0,0,0.2);padding:16px;border-radius:12px;border:1px solid rgba(255,255,255,0.05);margin-bottom:16px;">
                                                    <h4
                                                        style="color:#22c55e;margin-bottom:16px;font-size:14px;border-bottom:1px solid rgba(34,197,94,0.2);padding-bottom:8px;">
                                                        🛡️ AI / Expert Analysis Panel</h4>

                                                    <div
                                                        style="display:grid;grid-template-columns:1fr 1fr 1fr;gap:12px;margin-bottom:12px;">
                                                        <div>
                                                            <label class="form-label" style="font-size:11px;">Disease
                                                                Name</label>
                                                            <input type="text" name="diseaseName" class="form-control"
                                                                value="${q.diseaseName}" placeholder="e.g. Leaf Blight"
                                                                required />
                                                        </div>
                                                        <div>
                                                            <label class="form-label" style="font-size:11px;">Confidence %</label>
                                                            <input type="number" step="0.1" name="confidenceScore"
                                                                class="form-control" value="${q.confidenceScore}"
                                                                placeholder="e.g. 95.5" required />
                                                        </div>
                                                        <div>
                                                            <label class="form-label" style="font-size:11px;">Severity</label>
                                                            <select name="severityLevel" class="form-control" required>
                                                                <option value="LOW" ${q.severityLevel=='LOW'
                                                                    ? 'selected' : '' }>LOW</option>
                                                                <option value="MEDIUM" ${q.severityLevel=='MEDIUM'
                                                                    ? 'selected' : '' }>MEDIUM</option>
                                                                <option value="HIGH" ${q.severityLevel=='HIGH'
                                                                    ? 'selected' : '' }>HIGH</option>
                                                                <option value="CRITICAL" ${q.severityLevel=='CRITICAL'
                                                                    ? 'selected' : '' }>CRITICAL</option>
                                                            </select>
                                                        </div>
                                                    </div>

                                                    <div style="margin-bottom:12px;">
                                                        <label class="form-label" style="font-size:11px;">Detailed
                                                            Diagnosis & Impact</label>
                                                        <textarea name="diagnosis" class="form-control" rows="2"
                                                            placeholder="General description...">${q.diagnosis}</textarea>
                                                    </div>

                                                    <div
                                                        style="display:grid;grid-template-columns:1fr 1fr;gap:12px;margin-bottom:12px;">
                                                        <div>
                                                            <label class="form-label"
                                                                style="font-size:11px;color:#84cc16;">Organic
                                                                Treatment</label>
                                                            <textarea name="organicTreatment" class="form-control"
                                                                rows="2"
                                                                placeholder="Bio-fungicides, neem oil...">${q.organicTreatment}</textarea>
                                                        </div>
                                                        <div>
                                                            <label class="form-label"
                                                                style="font-size:11px;color:#ef4444;">Chemical
                                                                Treatment</label>
                                                            <textarea name="chemicalTreatment" class="form-control"
                                                                rows="2"
                                                                placeholder="Chemical fungicides...">${q.chemicalTreatment}</textarea>
                                                        </div>
                                                    </div>

                                                    <div style="margin-bottom:12px;">
                                                        <label class="form-label"
                                                            style="font-size:11px;color:#3b82f6;">Preventive
                                                            Measures</label>
                                                        <textarea name="preventiveMeasures" class="form-control"
                                                            rows="2"
                                                            placeholder="Crop rotation, spacing...">${q.preventiveMeasures}</textarea>
                                                    </div>
                                                </div>
                                                <div style="display:flex;gap:10px;align-items:center;">
                                                    <button type="submit" class="btn btn-primary btn-sm">Save
                                                        Diagnosis</button>
                                                    <c:if test="${not empty q.diagnosis}">
                                                        <div style="font-size:12px;color:#6b7280;">Already has
                                                            diagnosis — update to refine</div>
                                                    </c:if>
                                                </div>
                                            </form>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <script>function toggleSidebar() { document.getElementById('sidebar').classList.toggle('open'); }</script>
            
<script src="${pageContext.request.contextPath}/js/i18n.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

            </html>
