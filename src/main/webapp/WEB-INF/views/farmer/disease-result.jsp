<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>AI Disease Analysis Report</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                <style>
                    .report-header {
                        background: linear-gradient(135deg, rgba(22, 163, 74, 0.1), rgba(22, 163, 74, 0.05));
                        border: 1px solid rgba(22, 163, 74, 0.2);
                        border-radius: 16px;
                        padding: 24px;
                        margin-bottom: 24px;
                        display: flex;
                        align-items: center;
                        justify-content: space-between;
                        flex-wrap: wrap;
                        gap: 20px;
                    }

                    .ai-badge {
                        display: inline-flex;
                        align-items: center;
                        gap: 6px;
                        background: rgba(14, 165, 233, 0.15);
                        color: #38bdf8;
                        padding: 6px 14px;
                        border-radius: 50px;
                        font-size: 13px;
                        font-weight: 700;
                        border: 1px solid rgba(14, 165, 233, 0.3);
                    }

                    .main-disease-title {
                        font-size: 32px;
                        font-weight: 800;
                        color: #f0fdf4;
                        margin-top: 8px;
                        margin-bottom: 4px;
                    }

                    .confidence-circle {
                        width: 80px;
                        height: 80px;
                        border-radius: 50%;

                        background: conic-gradient(#22c55e $ {
                                query.confidenceScore
                            }

                            %, rgba(22, 163, 74, 0.1) 0);
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        position: relative;
                        box-shadow: 0 0 20px rgba(34, 197, 94, 0.3);
                    }

                    .confidence-circle::after {
                        content: '';
                        position: absolute;
                        inset: 6px;
                        background: #0a0f0a;
                        border-radius: 50%;
                    }

                    .confidence-val {
                        position: relative;
                        z-index: 2;
                        font-size: 18px;
                        font-weight: 800;
                        color: #f0fdf4;
                    }

                    .report-grid {
                        display: grid;
                        grid-template-columns: 1fr 1fr;
                        gap: 24px;
                    }

                    .info-card {
                        background: var(--surface);
                        border: 1px solid var(--border);
                        border-radius: 16px;
                        padding: 24px;
                    }

                    .info-card-title {
                        font-size: 14px;
                        font-weight: 700;
                        color: #9ca3af;
                        text-transform: uppercase;
                        letter-spacing: 1px;
                        margin-bottom: 16px;
                        display: flex;
                        align-items: center;
                        gap: 8px;
                    }

                    .treatment-step {
                        display: flex;
                        gap: 12px;
                        margin-bottom: 16px;
                    }

                    .treatment-icon {
                        width: 32px;
                        height: 32px;
                        border-radius: 8px;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        flex-shrink: 0;
                        font-size: 16px;
                    }

                    .treatment-icon.organic {
                        background: rgba(132, 204, 22, 0.15);
                        color: #84cc16;
                    }

                    .treatment-icon.chemical {
                        background: rgba(239, 68, 68, 0.15);
                        color: #ef4444;
                    }

                    .treatment-icon.preventive {
                        background: rgba(59, 130, 246, 0.15);
                        color: #3b82f6;
                    }

                    @media (max-width: 768px) {
                        .report-grid {
                            grid-template-columns: 1fr;
                        }
                    }
                </style>
                <link rel="icon" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🧪</text></svg>" />
            </head>

            <body>
                <div class="dashboard-layout">
                    <!-- Reusing Farmer Sidebar -->
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
                                    class="nav-icon">🔬</span> Disease Detection</a>
                            <a href="${pageContext.request.contextPath}/farmer/marketplace"><span
                                    class="nav-icon">🛒</span> My Marketplace</a>
                            <a href="${pageContext.request.contextPath}/farmer/schemes"><span
                                    class="nav-icon">🏛️</span> Govt. Schemes</a>
                            <a href="${pageContext.request.contextPath}/farmer/learning"><span
                                    class="nav-icon">🎓</span> Learning Videos</a>
                        </nav>
                    </aside>

                    <div class="main-content">
                        <header class="top-nav">
                            <div class="top-nav-left">
                                <div class="hamburger" onclick="toggleSidebar()"><span></span><span></span><span></span>
                                </div>
                                <a href="${pageContext.request.contextPath}/farmer/disease-detection"
                                    style="color:#9ca3af;text-decoration:none;margin-right:12px;">Back</a>
                                <span class="page-title">✨ Comprehensive AI Analysis Report</span>
                            </div>
                        </header>

                        <div class="page-body">
                            <div class="report-header">
                                <div>
                                    <div class="ai-badge">AI + Expert Verified</div>
                                    <h1 class="main-disease-title">${query.diseaseName}</h1>
                                    <div style="font-size: 15px; color: #9ca3af; margin-top: 8px;">
                                        Detected on: <strong style="color:#f0fdf4;">${query.cropName}</strong>
                                        &nbsp;|&nbsp;
                                        Severity: <strong
                                            style="color:${query.severityLevel == 'CRITICAL' ? '#ef4444' : (query.severityLevel == 'HIGH' ? '#f59e0b' : '#22c55e')};">${query.severityLevel}</strong>
                                        &nbsp;|&nbsp;
                                        Status: <span
                                            class="badge ${query.status == 'DIAGNOSED' ? 'badge-success' : 'badge-warning'}">${query.status}</span>
                                    </div>
                                </div>
                                <div style="display: flex; align-items: center; gap: 16px;">
                                    <div style="text-align:right;">
                                        <div style="font-size:12px;color:#9ca3af;font-weight:700;">CONFIDENCE SCORE
                                        </div>
                                        <div style="font-size:11px;color:#6b7280;margin-top:2px;">Accuracy based on
                                            symptoms</div>
                                    </div>
                                    <div class="confidence-circle">
                                        <span class="confidence-val">
                                            <fmt:formatNumber type="number" maxFractionDigits="1"
                                                value="${query.confidenceScore}" />%
                                        </span>
                                    </div>
                                </div>
                            </div>

                            <div class="report-grid">
                                <div class="info-card">
                                    <div class="info-card-title">🩺 General Diagnosis & Symptoms</div>
                                    <c:if test="${not empty query.imagePath}">
                                        <img src="${pageContext.request.contextPath}${query.imagePath}" alt="Crop Issue"
                                            style="width:100%; height:200px; object-fit:cover; border-radius:12px; margin-bottom:16px; border:1px solid rgba(255,255,255,0.1);" />
                                    </c:if>
                                    <div
                                        style="background:rgba(255,255,255,0.02); padding:16px; border-radius:12px; margin-bottom:12px;">
                                        <div style="font-size:12px;color:#6b7280;margin-bottom:6px;">Submitted Symptoms:
                                        </div>
                                        <div style="color:#f0fdf4;font-style:italic;">"${query.symptoms}"</div>
                                    </div>
                                    <div style="color:#d1d5db; line-height:1.7;">
                                        ${query.diagnosis}
                                    </div>
                                </div>

                                <div class="info-card">
                                    <div class="info-card-title">📋 Recommended Action Plan</div>

                                    <c:if test="${not empty query.organicTreatment}">
                                        <div class="treatment-step">
                                            <div class="treatment-icon organic"></div>
                                            <div>
                                                <div
                                                    style="font-size:14px;font-weight:700;color:#84cc16;margin-bottom:4px;">
                                                    Organic Treatment</div>
                                                <div style="font-size:14px;color:#d1d5db;line-height:1.6;">
                                                    ${query.organicTreatment}</div>
                                            </div>
                                        </div>
                                    </c:if>

                                    <c:if test="${not empty query.chemicalTreatment}">
                                        <div class="treatment-step">
                                            <div class="treatment-icon chemical"></div>
                                            <div>
                                                <div
                                                    style="font-size:14px;font-weight:700;color:#ef4444;margin-bottom:4px;">
                                                    Chemical Treatment</div>
                                                <div style="font-size:14px;color:#d1d5db;line-height:1.6;">
                                                    ${query.chemicalTreatment}</div>
                                            </div>
                                        </div>
                                    </c:if>

                                    <c:if test="${not empty query.preventiveMeasures}">
                                        <div class="treatment-step" style="margin-bottom:0;">
                                            <div class="treatment-icon preventive">🛒</div>
                                            <div>
                                                <div
                                                    style="font-size:14px;font-weight:700;color:#3b82f6;margin-bottom:4px;">
                                                    Preventive Measures</div>
                                                <div style="font-size:14px;color:#d1d5db;line-height:1.6;">
                                                    ${query.preventiveMeasures}</div>
                                            </div>
                                        </div>
                                    </c:if>

                                    <c:if
                                        test="${empty query.organicTreatment && empty query.chemicalTreatment && empty query.preventiveMeasures}">
                                        <div style="text-align:center;padding:30px;color:#6b7280;">
                                            ⏳ The expert treatment plan is currently being generated. Please check back
                                            shortly.
                                        </div>
                                    </c:if>
                                </div>
                            </div>

                            <div style="margin-top: 24px; text-align: center;">
                                <a href="${pageContext.request.contextPath}/farmer/disease-detection"
                                    class="btn btn-secondary">Go Back to Queries</a>
                            </div>
                        </div>
                    </div>
                </div>
                <script>function toggleSidebar() { document.getElementById('sidebar').classList.toggle('open'); }</script>
            
<script src="${pageContext.request.contextPath}/js/i18n.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

            </html>
