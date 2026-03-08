<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>⛈️ Climate Intelligence - AGROPLANTER</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/voice-assistant.css" />
                <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800;900&display=swap"
                    rel="stylesheet">
                <link rel="icon"
                    href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>⛈️</text></svg>" />
                <script>
                    window.AgroplanterUser = "${user.id}";
                    window.AgroplanterUserFull = "${user.fullName}";
                    window.AgroplanterRole = "${user.role}";
                </script>
                <style>
                    .v3-climate-nexus {
                        background: rgba(15, 23, 42, 0.4);
                        border: 1px solid rgba(255, 255, 255, 0.05);
                        border-radius: 40px;
                        padding: 60px;
                        margin-bottom: 50px;
                        backdrop-filter: blur(30px);
                        position: relative;
                        overflow: hidden;
                    }

                    .v3-climate-nexus::before {
                        content: '';
                        position: absolute;
                        top: 0;
                        left: 0;
                        width: 100%;
                        height: 100%;
                        background: radial-gradient(circle at top right, rgba(59, 130, 246, 0.1), transparent 40%);
                        pointer-events: none;
                    }

                    .v3-temp-nexus {
                        font-size: 7rem;
                        font-weight: 950;
                        background: linear-gradient(180deg, #fff 20%, rgba(255, 255, 255, 0.4) 100%);
                        -webkit-background-clip: text;
                        background-clip: text;
                        -webkit-text-fill-color: transparent;
                        line-height: 0.8;
                        letter-spacing: -6px;
                    }

                    .v3-weather-orb {
                        font-size: 8rem;
                        filter: drop-shadow(0 0 40px rgba(59, 130, 246, 0.4));
                        animation: v3-orb-float 6s ease-in-out infinite;
                    }

                    @keyframes v3-orb-float {

                        0%,
                        100% {
                            transform: translateY(0) rotate(0deg) scale(1);
                        }

                        50% {
                            transform: translateY(-25px) rotate(8deg) scale(1.05);
                        }
                    }

                    .v3-forecast-node {
                        background: rgba(15, 23, 42, 0.4);
                        border: 1px solid rgba(255, 255, 255, 0.05);
                        border-radius: 30px;
                        padding: 35px 20px;
                        text-align: center;
                        transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
                        backdrop-filter: blur(30px);
                        height: 100%;
                    }

                    .v3-forecast-node:hover {
                        border-color: rgba(59, 130, 246, 0.3);
                        background: rgba(15, 23, 42, 0.6);
                        transform: translateY(-15px) scale(1.05);
                        box-shadow: 0 20px 40px rgba(0, 0, 0, 0.4);
                    }

                    .v3-risk-shield {
                        background: rgba(15, 23, 42, 0.4);
                        border: 1px solid rgba(255, 255, 255, 0.05);
                        border-radius: 35px;
                        overflow: hidden;
                        backdrop-filter: blur(30px);
                    }

                    .v3-risk-node {
                        padding: 40px;
                        border-right: 1px solid rgba(255, 255, 255, 0.03);
                        transition: 0.3s;
                        height: 100%;
                    }

                    .v3-risk-node:hover {
                        background: rgba(255, 255, 255, 0.02);
                    }

                    .v3-advisory-panel {
                        background: linear-gradient(135deg, rgba(16, 185, 129, 0.08) 0%, rgba(16, 185, 129, 0.03) 100%);
                        border-left: 6px solid #10b981;
                        padding: 40px;
                        border-radius: 25px;
                        position: relative;
                        overflow: hidden;
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
                            <div class="nav-section-title px-2 mb-2"
                                style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">
                                STRATEGIC CORE</div>
                            <a href="${pageContext.request.contextPath}/farmer/dashboard"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">📊</span> Command Center</a>
                            <a href="${pageContext.request.contextPath}/farmer/crop-recommendation"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">🌱</span> Strategic Intel</a>
                            <a href="${pageContext.request.contextPath}/farmer/disease-detection"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">🔬</span> Bio-Diagnostics</a>
                            <a href="${pageContext.request.contextPath}/clinic/farmer/dashboard"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">🌿</span> Plant Clinic</a>

                            <div class="nav-section-title px-2 mt-4 mb-2"
                                style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">MARKET
                                OPS</div>
                            <a href="${pageContext.request.contextPath}/farmer/marketplace"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">🛍️</span> Global Market</a>
                            <a href="${pageContext.request.contextPath}/farmer/orders"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">📈</span> Trade Orders</a>
                            <a href="${pageContext.request.contextPath}/farmer/equipment-rental"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">🚜</span> Agri-Uber</a>

                            <div class="nav-section-title px-2 mt-4 mb-2"
                                style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">
                                INTELLIGENCE</div>
                            <a href="${pageContext.request.contextPath}/farmer/weather"
                                class="sidebar-nav-item active mb-2"><span class="nav-icon">⛈️</span> Weather Intel</a>
                            <a href="${pageContext.request.contextPath}/farmer/market-prices"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">📊</span> Live Mandi</a>
                            <a href="${pageContext.request.contextPath}/farmer/schemes"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">🏛️</span> Institutional</a>
                            <a href="${pageContext.request.contextPath}/farmer/learning"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">🎓</span> Agri-Academy</a>
                            <a href="${pageContext.request.contextPath}/farmer/mentors"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">👨‍🏫</span> Expert Panel</a>

                            <div class="nav-section-title px-2 mt-4 mb-2"
                                style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">
                                PROFESSIONAL</div>
                            <c:choose>
                                <c:when test="${user.role == 'MENTOR'}">
                                    <a href="${pageContext.request.contextPath}/mentor/dashboard"
                                        class="sidebar-nav-item mb-2" style="color: #fbbf24;"><span
                                            class="nav-icon">🎓</span> Advisor Workspace</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="${pageContext.request.contextPath}/mentor/become"
                                        class="sidebar-nav-item mb-2" style="color: #fbbf24;"><span
                                            class="nav-icon">🌟</span> Become Advisor</a>
                                </c:otherwise>
                            </c:choose>

                            <div class="nav-section-title px-2 mt-4 mb-2"
                                style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">FINANCE
                                & SAFETY</div>
                            <a href="${pageContext.request.contextPath}/farmer/finance"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">💰</span> Capital Hub</a>
                            <a href="${pageContext.request.contextPath}/farmer/safety-hub"
                                class="sidebar-nav-item mb-2"><span class="nav-icon">🛡️</span> Safety HQ</a>

                            <div class="nav-section-title px-2 mt-4 mb-2"
                                style="color: #475569; font-size: 11px; font-weight: 800; letter-spacing: 2px;">ACCOUNT
                                OPS</div>
                            <a href="${pageContext.request.contextPath}/farmer/profile"
                                class="sidebar-nav-item mb-2"><span class="nav-icon" style="color: #8b5cf6;">👤</span>
                                Profile Node</a>
                            <a href="${pageContext.request.contextPath}/chat" class="sidebar-nav-item mb-2"><span
                                    class="nav-icon">💬</span> Message Core</a>

                            <div class="mt-auto px-2">
                                <a href="${pageContext.request.contextPath}/logout"
                                    class="sidebar-nav-item text-danger mt-4" style="border-radius: 12px;"><span
                                        class="nav-icon">🚪</span> Terminate Session</a>
                            </div>
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
                                        style="font-size: 2.2rem; letter-spacing: -1.5px;">Climate Intel</h1>
                                    <span class="v3-page-subtitle text-success uppercase"
                                        style="letter-spacing: 1px; font-weight: 800;">
                                        📡 REAL-TIME ATMOSPHERIC TELEMETRY | GEOSPATIAL NODE: ${not empty user.district
                                        ? user.district.toUpperCase() : 'GLOBAL'} | NODE: SECURED
                                    </span>
                                </div>
                            </div>
                        </header>

                        <div class="page-body px-5 py-5">
                            <div class="v3-climate-nexus">
                                <div class="row align-items-center">
                                    <div class="col-lg-8">
                                        <span class="trust-label uppercase mb-4 d-block"
                                            style="font-size: 11px; letter-spacing: 3px; color: #3b82f6;">LIVE
                                            ATMOSPHERIC FEED</span>
                                        <div class="d-flex align-items-center gap-5">
                                            <div class="v3-weather-orb" id="currentIcon">☀️</div>
                                            <div>
                                                <div class="v3-temp-nexus"><span id="tempValue">28</span><span
                                                        style="font-size: 3.5rem; vertical-align: super; font-weight: 400; opacity: 0.3; margin-left: 10px;">°C</span>
                                                </div>
                                                <div class="text-white-50 fw-950 fs-3 uppercase mt-2" id="weatherDesc"
                                                    style="letter-spacing: 2px; opacity: 0.8;">CLEAR ATMOSPHERE</div>
                                            </div>
                                        </div>
                                        <div class="mt-5 d-flex gap-5 flex-wrap">
                                            <div class="p-4 rounded-4"
                                                style="background: rgba(255,255,255,0.02); border: 1px solid rgba(255,255,255,0.05); min-width: 160px;">
                                                <span class="trust-label uppercase d-block mb-1"
                                                    style="font-size: 9px; letter-spacing: 1px; color: #475569;">HUMIDITY
                                                    MATRIX</span>
                                                <div class="text-white fw-950 fs-3"><span
                                                        id="humidityValue">65</span><span class="text-white-50 small">%
                                                        Flux</span></div>
                                            </div>
                                            <div class="p-4 rounded-4"
                                                style="background: rgba(255,255,255,0.02); border: 1px solid rgba(255,255,255,0.05); min-width: 160px;">
                                                <span class="trust-label uppercase d-block mb-1"
                                                    style="font-size: 9px; letter-spacing: 1px; color: #475569;">WIND
                                                    VECTORS</span>
                                                <div class="text-white fw-950 fs-3"><span id="windValue">5.5</span><span
                                                        class="text-white-50 small"> km/h</span></div>
                                            </div>
                                            <div class="p-4 rounded-4"
                                                style="background: rgba(255,255,255,0.02); border: 1px solid rgba(255,255,255,0.05); min-width: 160px;">
                                                <span class="trust-label uppercase d-block mb-1"
                                                    style="font-size: 9px; letter-spacing: 1px; color: #475569;">VISUAL
                                                    RADIUS</span>
                                                <div class="text-white fw-950 fs-3">12<span class="text-white-50 small">
                                                        km</span></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 mt-5 mt-lg-0">
                                        <div class="v3-advisory-panel">
                                            <div class="d-flex align-items-center gap-3 mb-4">
                                                <div class="pulse-green"></div>
                                                <h6 class="text-success fw-950 m-0 uppercase"
                                                    style="letter-spacing: 2px; font-size: 11px;">STRATEGIC ADVISORY
                                                </h6>
                                            </div>
                                            <h4 class="text-white fw-900 mb-3 fs-3" style="letter-spacing: -1px;">
                                                Optimal Phasing Detected</h4>
                                            <p class="text-white-50 fs-6 lh-lg mb-0" style="opacity: 0.8;">Atmospheric
                                                stability indices indicate sub-nominal turbulence. Ideal window for
                                                pesticide deployment and harvest logistics. Zero precipitation events
                                                predicted for current 72h-cycle.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="d-flex justify-content-between align-items-center mb-4 px-2">
                                <span class="trust-label uppercase m-0"
                                    style="font-size: 11px; letter-spacing: 3px; color: #475569;">7-DAY STRATEGIC
                                    FORECAST MATRIX</span>
                                <div class="badge fw-950 px-4 py-2 rounded-pill uppercase"
                                    style="font-size: 9px; letter-spacing: 2px; border: 1px solid rgba(255,255,255,0.1); background: rgba(255, 255, 255, 0.05); color: rgba(255, 255, 255, 0.5);">
                                    PROBABILITY INDEX: 98.4%</div>
                            </div>

                            <div class="row row-cols-2 row-cols-md-4 row-cols-xl-7 g-4">
                                <c:forEach var="i" begin="1" end="7">
                                    <div class="col">
                                        <div class="v3-forecast-node">
                                            <span class="trust-label uppercase d-block mb-3"
                                                style="font-size: 9px; letter-spacing: 1px; color: #475569;">NODE
                                                +${i}</span>
                                            <div class="fs-1 mb-3">${i % 3 == 0 ? '🌦️' : (i % 5 == 0 ? '⛈️' : '☀️')}
                                            </div>
                                            <div class="text-white fw-950 fs-4">${25 + i}°C</div>
                                            <span class="badge text-white fw-950 uppercase mt-3 px-3 py-1 rounded-pill"
                                                style="font-size: 7px; letter-spacing: 1.5px; background: rgba(255, 255, 255, 0.05);">
                                                ${i % 3 == 0 ? 'FLUX' : 'STABLE'}</span>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>

                            <div class="v3-risk-shield mt-5">
                                <div class="px-5 py-4 d-flex align-items-center justify-content-between"
                                    style="background: rgba(255, 255, 255, 0.03);">
                                    <div class="d-flex align-items-center gap-3">
                                        <span class="fs-4">🛡️</span>
                                        <span class="trust-label uppercase m-0"
                                            style="font-size: 11px; letter-spacing: 3px; color: #ef4444;">CLIMATE RISK
                                            SHIELD CORE</span>
                                    </div>
                                    <div class="d-flex align-items-center gap-2">
                                        <div class="pulse-red"></div>
                                        <span class="text-white-50 x-small fw-950 uppercase"
                                            style="font-size: 8px; letter-spacing: 1.5px;">ACTIVE MONITORING</span>
                                    </div>
                                </div>
                                <div class="row g-0">
                                    <div class="col-md-4">
                                        <div class="v3-risk-node">
                                            <div class="d-flex align-items-start gap-3">
                                                <div class="fs-2 text-warning">🔥</div>
                                                <div>
                                                    <h6 class="text-white fw-950 uppercase mb-2 fs-6">Heat Wave Vector
                                                    </h6>
                                                    <p class="text-white-50 fs-6 lh-base m-0" style="opacity: 0.6;">
                                                        Thermal spike detected in distal quadrant. Activate supplemental
                                                        irrigation protocol to mitigate evapotranspiration losses.</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="v3-risk-node">
                                            <div class="d-flex align-items-start gap-3">
                                                <div class="fs-2 text-info">💧</div>
                                                <div>
                                                    <h6 class="text-white fw-950 uppercase mb-2 fs-6">Water Flux Lag
                                                    </h6>
                                                    <p class="text-white-50 fs-6 lh-base m-0" style="opacity: 0.6;">
                                                        Hydration baseline is sub-nominal. Reprioritize water
                                                        conservation algorithms for high-value biological assets.</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="v3-risk-node border-0">
                                            <div class="d-flex align-items-start gap-3">
                                                <div class="fs-2 text-success">🌪️</div>
                                                <div>
                                                    <h6 class="text-white fw-950 uppercase mb-2 fs-6">Atmospheric Null
                                                    </h6>
                                                    <p class="text-white-50 fs-6 lh-base m-0" style="opacity: 0.6;">No
                                                        cyclonic anomalies within 500km radius. All mechanized logistics
                                                        and field operations cleared for standard execution.</p>
                                                </div>
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

                    async function fetchWeather() {
                        try {
                            const response = await fetch('${pageContext.request.contextPath}/api/weather?city=${user.district}');
                            const data = await response.json();
                            if (data.main) {
                                document.getElementById('tempValue').innerText = Math.round(data.main.temp);
                                document.getElementById('humidityValue').innerText = data.main.humidity;
                                document.getElementById('windValue').innerText = data.wind.speed;
                                if (data.weather && data.weather[0]) {
                                    document.getElementById('weatherDesc').innerText = data.weather[0].description.toUpperCase();
                                    const iconCode = data.weather[0].icon;
                                    const iconMap = { '01': '☀️', '02': '☁️', '03': '☁️', '04': '☁️', '09': '🌧️', '10': '🌧️', '11': '⛈️', '13': '❄️' };
                                    document.getElementById('currentIcon').innerText = iconMap[iconCode.substring(0, 2)] || '🌫️';
                                }
                            }
                        } catch (err) { console.error("Climate API Error:", err); }
                    }
                    fetchWeather();
                    setInterval(fetchWeather, 600000); 
                </script>
            </body>

            </html>