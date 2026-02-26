<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>Disease Detection - Smart Farming Platform</title>
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
                                <h3>Smart Farming</h3><span>Farmer Portal</span>
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
                            <a href="${pageContext.request.contextPath}/farmer/disease-detection" class="active"><span
                                    class="nav-icon">🔬</span> Disease
                                Detection</a>
                            <a href="${pageContext.request.contextPath}/farmer/marketplace"><span
                                    class="nav-icon">🛒</span> My Marketplace</a>
                            <a href="${pageContext.request.contextPath}/farmer/schemes"><span
                                    class="nav-icon">🏛️</span> Govt. Schemes</a>
                            <a href="${pageContext.request.contextPath}/farmer/learning"><span
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
                                <span class="page-title">🌿 Plant Disease Detection</span>
                            </div>
                        </header>

                        <div class="page-body">
                            <!-- Alert -->
                            <c:if test="${not empty successMessage}">
                                <div class="alert alert-success">
                                    ✅ <span>${successMessage}</span>
                                </div>
                            </c:if>

                            <div class="grid-2">
                                <!-- Submit Form -->
                                <div class="card">
                                    <div class="card-header">
                                        <span class="card-title">📝 Submit Disease Query</span>
                                    </div>
                                    <div class="card-body">
                                        <form
                                            action="${pageContext.request.contextPath}/farmer/disease-detection/submit"
                                            method="post" enctype="multipart/form-data">
                                            <div class="form-group">
                                                <label class="form-label">Crop Name</label>
                                                <input type="text" name="cropName" class="form-control"
                                                    placeholder="e.g. Wheat, Rice, Tomato" required />
                                            </div>

                                            <div class="form-group">
                                                <label class="form-label">Describe Symptoms</label>
                                                <textarea name="symptoms" class="form-control" rows="5"
                                                    placeholder="Describe the symptoms you see on your plant. E.g. yellow leaves, brown spots, wilting, rust colored patches..."
                                                    required></textarea>
                                                <div style="font-size:11px;color:#6b7280;margin-top:4px;">
                                                    💡 Tips: yellowing, brown spots, wilting, rust will get instant AI
                                                    diagnosis
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="form-label">Upload Plant Image (Optional)</label>
                                                <div class="upload-area"
                                                    onclick="document.getElementById('imageFile').click()">
                                                    <div class="upload-icon">📍</div>
                                                    <div class="upload-text">Click to upload or drag & drop</div>
                                                    <div style="font-size:11px;color:#6b7280;margin-top:4px;">JPEG, PNG
                                                        up to 10MB
                                                    </div>
                                                </div>
                                                <input type="file" id="imageFile" name="image" accept="image/*"
                                                    style="display:none;" onchange="showFileName(this)" />
                                                <div id="fileName" style="font-size:12px;color:#22c55e;margin-top:6px;">
                                                </div>
                                            </div>

                                            <button type="submit" class="btn btn-primary" style="width:100%;">
                                                🔍 Analyze Disease
                                            </button>
                                        </form>
                                    </div>
                                </div>

                                <!-- Info Panel -->
                                <div>
                                    <!-- Disease Guide -->
                                    <div class="card" style="margin-bottom:16px;">
                                        <div class="card-header">
                                            <span class="card-title">📖 Quick Disease Guide</span>
                                        </div>
                                        <div class="card-body">
                                            <div style="display:flex;flex-direction:column;gap:10px;">
                                                <div
                                                    style="padding:12px;background:var(--surface);border-radius:10px;border:1px solid var(--border);">
                                                    <div
                                                        style="font-size:13px;font-weight:700;color:#fcd34d;margin-bottom:4px;">🟡 Yellow Leaves</div>
                                                    <div style="font-size:12px;color:#9ca3af;">Possible nitrogen
                                                        deficiency or viral
                                                        infection</div>
                                                </div>
                                                <div
                                                    style="padding:12px;background:var(--surface);border-radius:10px;border:1px solid var(--border);">
                                                    <div
                                                        style="font-size:13px;font-weight:700;color:#f87171;margin-bottom:4px;">🟤 Brown Spots</div>
                                                    <div style="font-size:12px;color:#9ca3af;">Fungal infection - leaf
                                                        spot disease
                                                    </div>
                                                </div>
                                                <div
                                                    style="padding:12px;background:var(--surface);border-radius:10px;border:1px solid var(--border);">
                                                    <div
                                                        style="font-size:13px;font-weight:700;color:#c4b5fd;margin-bottom:4px;">
                                                        🥀 Wilting Plant</div>
                                                    <div style="font-size:12px;color:#9ca3af;">Root rot or fusarium wilt
                                                        fungal
                                                        disease</div>
                                                </div>
                                                <div
                                                    style="padding:12px;background:var(--surface);border-radius:10px;border:1px solid var(--border);">
                                                    <div
                                                        style="font-size:13px;font-weight:700;color:#fdba74;margin-bottom:4px;">
                                                        🍂 Rust Patches</div>
                                                    <div style="font-size:12px;color:#9ca3af;">Rust disease - fungal
                                                        infection on
                                                        leaves</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Stats -->
                                    <div class="card">
                                        <div class="card-header"><span class="card-title">📋 Your Submissions</span>
                                        </div>
                                        <div class="card-body" style="padding:16px;">
                                            <div style="text-align:center;padding:8px;">
                                                <div style="font-size:32px;font-weight:800;color:#22c55e;">
                                                    ${fn:length(myQueries)}</div>
                                                <div style="font-size:13px;color:#9ca3af;">Total Queries Submitted</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Query History -->
                            <div class="card" style="margin-top:24px;">
                                <div class="card-header">
                                    <span class="card-title">✨ Your Query History</span>
                                </div>
                                <div class="card-body" style="padding:0;">
                                    <c:if test="${empty myQueries}">
                                        <div class="empty-state">
                                            <div class="empty-state-icon">📍</div>
                                            <h3>No queries yet</h3>
                                            <p>Submit your first disease query above</p>
                                        </div>
                                    </c:if>

                                    <c:forEach items="${myQueries}" var="q">
                                        <div class="disease-result-card" style="margin:12px;">
                                            <div
                                                class="disease-status-banner ${q.status == 'PENDING' ? 'pending' : 'diagnosed'}">
                                                <c:choose>
                                                    <c:when test="${q.status == 'PENDING'}">⏳ Pending Review</c:when>
                                                    <c:when test="${q.status == 'DIAGNOSED'}">Diagnosed</c:when>
                                                    <c:when test="${q.status == 'RESOLVED'}">Resolved</c:when>
                                                </c:choose>
                                            </div>
                                            <div style="padding:16px;">
                                                <div
                                                    style="display:flex;justify-content:space-between;align-items:center;margin-bottom:10px;">
                                                    <strong style="color:#22c55e;font-size:15px;">${q.cropName}</strong>
                                                    <span style="font-size:11px;color:#6b7280;">${q.createdAt}</span>
                                                </div>
                                                <div style="font-size:13px;color:#9ca3af;margin-bottom:10px;">
                                                    <strong style="color:#f0fdf4;">Symptoms:</strong>
                                                    <span>${q.symptoms}</span>
                                                </div>
                                                <c:if test="${not empty q.diseaseName}">
                                                    <div
                                                        style="margin-top: 12px; display: flex; justify-content: space-between; align-items: center; background: rgba(22,163,74,0.05); padding: 12px; border-radius: 8px; border: 1px solid rgba(22,163,74,0.1);">
                                                        <div>
                                                            <div
                                                                style="font-size:11px; font-weight:700; color:#22c55e; margin-bottom:4px;">
                                                                🤖 AI DIAGNOSIS</div>
                                                            <div
                                                                style="font-size:14px; font-weight:600; color:#f0fdf4;">
                                                                ${q.diseaseName}</div>
                                                        </div>
                                                        <a href="${pageContext.request.contextPath}/farmer/disease-detection/result/${q.id}"
                                                            class="btn btn-primary btn-sm"
                                                            style="text-decoration:none;">
                                                            📄 View Full Report
                                                        </a>
                                                    </div>
                                                </c:if>
                                                <c:if test="${empty q.diseaseName}">
                                                    <div
                                                        style="margin-top: 12px; padding: 12px; font-size: 13px; color: #f59e0b; background: rgba(245,158,11,0.05); border-radius: 8px; border: 1px solid rgba(245,158,11,0.1);">
                                                        ⏳ Waiting for AI/Expert analysis...
                                                    </div>
                                                </c:if>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <script>
                    function toggleSidebar() { document.getElementById('sidebar').classList.toggle('open'); }
                    function showFileName(input) {
                        if (input.files.length > 0) {
                            document.getElementById('fileName').textContent = '? ' + input.files[0].name;
                        }
                    }
                </script>
            
<script src="${pageContext.request.contextPath}/js/i18n.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

            </html>
