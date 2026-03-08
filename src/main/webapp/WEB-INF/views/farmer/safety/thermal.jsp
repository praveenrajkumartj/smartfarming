<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>☀️ Thermal Hazard - AGROPLANTER</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/voice-assistant.css" />
                <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800;900&display=swap"
                    rel="stylesheet">
                <link rel="icon"
                    href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>☀️</text></svg>" />
                <script>
                    window.AgroplanterUser = "${user.id}";
                    window.AgroplanterUserFull = "${user.fullName}";
                    window.AgroplanterRole = "${user.role}";
                </script>
                <style>
                    .safety-hero {
                        background: linear-gradient(135deg, rgba(234, 88, 12, 0.4), rgba(249, 115, 22, 0.4));
                        border: 1px solid rgba(255, 255, 255, 0.05);
                        border-radius: 40px;
                        padding: 60px;
                        margin-bottom: 40px;
                        backdrop-filter: blur(20px);
                    }

                    .protocol-node {
                        background: rgba(15, 23, 42, 0.4);
                        border: 1px solid rgba(255, 255, 255, 0.05);
                        border-radius: 24px;
                        padding: 30px;
                        margin-bottom: 25px;
                        backdrop-filter: blur(20px);
                    }

                    .node-digit {
                        width: 45px;
                        height: 45px;
                        background: rgba(249, 115, 22, 0.1);
                        color: #f97316;
                        border-radius: 14px;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        font-weight: 900;
                        font-size: 1.2rem;
                        border: 1px solid rgba(249, 115, 22, 0.2);
                        flex-shrink: 0;
                    }

                    .gear-pill {
                        padding: 10px 20px;
                        background: rgba(249, 115, 22, 0.05);
                        border: 1px solid rgba(249, 115, 22, 0.1);
                        border-radius: 12px;
                        font-size: 11px;
                        font-weight: 800;
                        color: #f97316;
                        text-align: center;
                    }
                </style>
            </head>

            <body>
                <div class="dashboard-scene"></div>
                <div class="dashboard-layout">
                    <aside class="sidebar sidebar-premium" id="sidebar">
                        <div class="sidebar-brand px-4 py-4"
                            style="border-bottom: 1px solid rgba(255,255,255,0.05); cursor: pointer;"
                            onclick="window.location.href='${pageContext.request.contextPath}/'">
                            <div class="brand-premium" style="font-size: 20px;">
                                <div class="brand-icon-box"><i class="fas fa-leaf"></i></div>
                                <div class="brand-text">
                                    <h3 class="brand-premium m-0" style="font-size: 20px;">AGROPLANTER</h3>
                                    <span
                                        style="font-size: 10px; color: #94a3b8; font-weight: 800; letter-spacing: 1px;">FARMER
                                        NODE V3</span>
                                </div>
                            </div>
                        </div>
                        <nav class="sidebar-nav px-3 py-4">
                            <a href="${pageContext.request.contextPath}/farmer/dashboard"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">📊</span> Command Center</a>
                            <a href="${pageContext.request.contextPath}/farmer/safety-hub"
                                class="sidebar-nav-item active mb-2"><span class="nav-icon">🛡️</span> Safety HQ</a>
                        </nav>
                    </aside>

                    <main class="main-content">
                        <header class="top-nav">
                            <div class="top-nav-left d-flex align-items-center gap-3">
                                <div class="hamburger" onclick="toggleSidebar()">
                                    <span></span><span></span><span></span>
                                </div>
                                <div class="page-title">
                                    <h1 class="m-0 fw-900 text-white"
                                        style="font-size: 2.2rem; letter-spacing: -1.5px;">
                                        <span style="color: #f97316;">☀️</span> Thermal Hazard
                                    </h1>
                                    <span class="v3-page-subtitle text-warning">
                                        📡 HEAT INDEX MONITORING ACTIVE | HYPERTHERMIA PREVENTION
                                    </span>
                                </div>
                            </div>
                            <div class="top-nav-right">
                                <a href="${pageContext.request.contextPath}/farmer/safety-hub"
                                    class="btn btn-quantum px-4" style="font-size: 11px;">BACK TO HUB</a>
                            </div>
                        </header>

                        <div class="page-body px-5 py-5">
                            <div class="safety-hero mb-5">
                                <div class="badge bg-warning bg-opacity-10 text-warning fw-900 px-3 py-1 mb-3"
                                    style="font-size: 10px; letter-spacing: 1.5px; border: 1px solid rgba(249, 115, 22, 0.2);">
                                    THERMAL DEFENSE V3</div>
                                <h2 class="text-white fw-900" style="font-size: 3.5rem; letter-spacing: -2px;">
                                    Hyperthermia Prevention &<br>Hydration Telemetry</h2>
                                <p class="text-white-50 mt-3 fs-5">Protocols for extreme temperature field operations
                                    and physiological heat management.</p>
                            </div>

                            <div class="row g-5">
                                <div class="col-lg-8">
                                    <span class="trust-label uppercase mb-4 d-block">🌓 HEAT SURVIVAL SEQUENCE</span>

                                    <div class="protocol-node d-flex gap-4">
                                        <div class="node-digit">01</div>
                                        <div>
                                            <h5 class="text-white fw-900">Hydration Telemetry</h5>
                                            <p class="text-white-50 small m-0">Maintain high fluid intake (electrolyte
                                                base). Target 500ml per 30 minutes of high-intensity solar exposure.
                                                Never wait for thirst-triggers.</p>
                                        </div>
                                    </div>

                                    <div class="protocol-node d-flex gap-4">
                                        <div class="node-digit">02</div>
                                        <div>
                                            <h5 class="text-white fw-900">UV Index Protocols</h5>
                                            <p class="text-white-50 small m-0">Neutralize field operations during peak
                                                UV hours (11:00 - 15:00). Utilize shade-structures for active recovery
                                                cycles.</p>
                                        </div>
                                    </div>

                                    <div class="protocol-node d-flex gap-4">
                                        <div class="node-digit">03</div>
                                        <div>
                                            <h5 class="text-white fw-900">Heat Stroke Identification</h5>
                                            <p class="text-white-50 small m-0">Detecting disorientation, non-sweating
                                                hot skin, or nausea. If symptoms initiate, terminate operations and
                                                deploy rapid-cooling (ice/water).</p>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-4">
                                    <span class="trust-label uppercase mb-4 d-block" style="color: #f97316;">🛡️ SOLAR
                                        DEFENSE GEAR</span>
                                    <div class="protocol-node">
                                        <div class="row g-3">
                                            <div class="col-12">
                                                <div class="gear-pill mb-2">VENTILATED BROAD-BRIM HATS</div>
                                            </div>
                                            <div class="col-12">
                                                <div class="gear-pill mb-2">BREATHABLE LINEN FABRICS</div>
                                            </div>
                                            <div class="col-12">
                                                <div class="gear-pill mb-2">ISO-CRYSTAL NECK COLLARS</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </main>
                </div>

                <script src="${pageContext.request.contextPath}/js/background-switcher.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                <script>
                    function toggleSidebar() { document.getElementById('sidebar').classList.toggle('open'); }
                </script>
            </body>

            </html>





