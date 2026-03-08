<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>🛡️ Farmer Safety Hub - AGROPLANTER</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/voice-assistant.css" />
                <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800;900&display=swap"
                    rel="stylesheet">
                <link rel="icon"
                    href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🛡️</text></svg>" />
                <script>
                    window.AgroplanterUser = "${user.id}";
                    window.AgroplanterUserFull = "${user.fullName}";
                    window.AgroplanterRole = "${user.role}";
                </script>
                <style>
                    .v3-safety-nexus {
                        background: linear-gradient(135deg, rgba(127, 29, 29, 0.5) 0%, rgba(220, 38, 38, 0.3) 100%);
                        border-radius: 40px;
                        padding: 70px;
                        position: relative;
                        overflow: hidden;
                        border: 1px solid rgba(239, 68, 68, 0.1);
                        backdrop-filter: blur(30px);
                        margin-bottom: 50px;
                    }

                    .v3-safety-nexus::after {
                        content: 'CRITICAL';
                        position: absolute;
                        right: -5vw;
                        bottom: -5vw;
                        font-size: 15vw;
                        font-weight: 950;
                        color: white;
                        opacity: 0.02;
                        letter-spacing: -5px;
                        pointer-events: none;
                    }

                    .v3-sos-pulse {
                        width: 220px;
                        height: 220px;
                        border-radius: 50%;
                        background: #ef4444;
                        color: white;
                        border: 15px solid rgba(239, 68, 68, 0.2);
                        font-family: 'Outfit';
                        font-size: 48px;
                        font-weight: 950;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        cursor: pointer;
                        transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
                        animation: v3-sos-ring 2s infinite;
                        box-shadow: 0 0 60px rgba(239, 68, 68, 0.4);
                        z-index: 2;
                        position: relative;
                        letter-spacing: -2px;
                    }

                    .v3-sos-pulse:hover {
                        transform: scale(1.1) rotate(-5deg);
                        background: #dc2626;
                        box-shadow: 0 0 80px rgba(239, 68, 68, 0.6);
                    }

                    @keyframes v3-sos-ring {
                        0% {
                            box-shadow: 0 0 0 0 rgba(239, 68, 68, 0.4);
                        }

                        70% {
                            box-shadow: 0 0 0 40px rgba(239, 68, 68, 0);
                        }

                        100% {
                            box-shadow: 0 0 0 0 rgba(239, 68, 68, 0);
                        }
                    }

                    .v3-protocol-node {
                        background: rgba(15, 23, 42, 0.4);
                        border: 1px solid rgba(255, 255, 255, 0.05);
                        border-radius: 35px;
                        padding: 45px;
                        height: 100%;
                        transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
                        backdrop-filter: blur(30px);
                        display: flex;
                        flex-direction: column;
                        position: relative;
                        overflow: hidden;
                    }

                    .v3-protocol-node::before {
                        content: '';
                        position: absolute;
                        top: 0;
                        left: 0;
                        width: 100%;
                        height: 6px;
                        background: linear-gradient(90deg, transparent, rgba(239, 68, 68, 0.5), transparent);
                        opacity: 0;
                        transition: 0.3s;
                    }

                    .v3-protocol-node:hover {
                        border-color: rgba(239, 68, 68, 0.2);
                        background: rgba(15, 23, 42, 0.6);
                        transform: translateY(-15px) scale(1.02);
                        box-shadow: 0 30px 60px rgba(0, 0, 0, 0.4);
                    }

                    .v3-protocol-node:hover::before {
                        opacity: 1;
                    }

                    .v3-safety-icon {
                        width: 80px;
                        height: 80px;
                        background: rgba(255, 255, 255, 0.02);
                        border: 1px solid rgba(255, 255, 255, 0.05);
                        border-radius: 24px;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        font-size: 40px;
                        margin-bottom: 30px;
                        transition: 0.3s;
                    }

                    .v3-protocol-node:hover .v3-safety-icon {
                        transform: scale(1.1) rotate(-10deg);
                        background: rgba(239, 68, 68, 0.05);
                        border-color: rgba(239, 68, 68, 0.2);
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
                                class="sidebar-nav-item mb-2"><span class="nav-icon">⛈️</span> Weather Intel</a>
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
                                class="sidebar-nav-item active mb-2"><span class="nav-icon">🛡️</span> Safety HQ</a>

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
                                        style="font-size: 2.2rem; letter-spacing: -1.5px;">Safety HQ</h1>
                                    <span class="v3-page-subtitle text-danger uppercase"
                                        style="letter-spacing: 1px; font-weight: 800;">
                                        📡 SECURE EMERGENCY CHANNEL | CRISIS PROTOCOLS: ENGAGED | NODE: SECURED
                                    </span>
                                </div>
                            </div>
                        </header>

                        <div class="page-body px-5 py-5">
                            <div class="v3-safety-nexus">
                                <div class="row align-items-center">
                                    <div class="col-xl-8">
                                        <span class="trust-label uppercase mb-3 d-block"
                                            style="font-size: 11px; letter-spacing: 3px; color: #fca5a5;">EMERGENCY
                                            BROADCAST NODE</span>
                                        <h1 class="fw-900 text-white mb-4"
                                            style="font-size: 4.5rem; letter-spacing: -3px; line-height: 1;">Critical
                                            Response</h1>
                                        <p class="text-white-50 fs-5 mb-5 lh-lg"
                                            style="max-width: 750px; opacity: 0.8;">
                                            A single trigger broadcasts high-priority alerts to regional helplines and
                                            neighboring nodes with real-time GPS coordinates. Network latency minimized
                                            for sub-second delivery.
                                        </p>
                                        <div class="d-flex gap-4 align-items-center flex-wrap">
                                            <div class="badge bg-danger bg-opacity-10 text-danger fw-950 px-4 py-3 rounded-pill uppercase d-flex align-items-center gap-2"
                                                style="font-size: 10px; letter-spacing: 2px; border: 1px solid rgba(239, 68, 68, 0.2);">
                                                <div class="pulse-red"></div>
                                                HELPLINE: 108 / 112
                                            </div>
                                            <div class="badge fw-950 px-4 py-3 rounded-pill uppercase"
                                                style="font-size: 10px; letter-spacing: 2px; border: 1px solid rgba(255, 255, 255, 0.2); background: rgba(255, 255, 255, 0.1); color: #ffffff;">
                                                AMBULANCE: 102</div>
                                        </div>
                                    </div>
                                    <div
                                        class="col-xl-4 d-flex justify-content-xl-end justify-content-center mt-5 mt-xl-0">
                                        <button class="v3-sos-pulse" id="sosBtn" onclick="triggerSOS()">SOS</button>
                                    </div>
                                </div>
                                <div id="sosStatus" class="mt-5 p-5 rounded-5 animate__animated animate__fadeInUp"
                                    style="display:none; background: rgba(0,0,0,0.6); border: 2px solid #ef4444; backdrop-filter: blur(20px);">
                                </div>
                            </div>

                            <div class="row g-5">
                                <div class="col-xl-4 col-md-6">
                                    <div class="v3-protocol-node">
                                        <div class="v3-safety-icon text-danger">🐍</div>
                                        <h4 class="text-white fw-900 mb-3 fs-3" style="letter-spacing: -1px;">Serpent
                                            Encounter</h4>
                                        <p class="text-white-50 mb-5 lh-lg"
                                            style="min-height: 84px; font-size: 14px; opacity: 0.6;">Critical biosafety
                                            protocols for venomous encounters. Anti-venom hub mapping and preventative
                                            thermal gear analytics for field operations.</p>
                                        <a href="${pageContext.request.contextPath}/farmer/safety/snake-bite"
                                            class="btn btn-quantum w-100 py-4 mt-auto">ACCESS PROTOCOL →</a>
                                    </div>
                                </div>
                                <div class="col-xl-4 col-md-6">
                                    <div class="v3-protocol-node">
                                        <div class="v3-safety-icon text-warning">⚡</div>
                                        <h4 class="text-white fw-900 mb-3 fs-3" style="letter-spacing: -1px;">Neural
                                            Shock Core</h4>
                                        <p class="text-white-50 mb-5 lh-lg"
                                            style="min-height: 84px; font-size: 14px; opacity: 0.6;">High-tension
                                            terminal safety, grounding installation benchmarks, and safe pump operation
                                            telemetry protocols for grid management.</p>
                                        <a href="${pageContext.request.contextPath}/farmer/safety/electrical"
                                            class="btn btn-quantum w-100 py-4 mt-auto">WIRING STANDARDS →</a>
                                    </div>
                                </div>
                                <div class="col-xl-4 col-md-6">
                                    <div class="v3-protocol-node">
                                        <div class="v3-safety-icon text-success">🧪</div>
                                        <h4 class="text-white fw-900 mb-3 fs-3" style="letter-spacing: -1px;">Chemical
                                            Biosafety</h4>
                                        <p class="text-white-50 mb-5 lh-lg"
                                            style="min-height: 84px; font-size: 14px; opacity: 0.6;">Precision PPE
                                            analytics, vapor direction telemetry, and secure biosynthetic handling
                                            procedures for advanced crop management.</p>
                                        <a href="${pageContext.request.contextPath}/farmer/safety/pesticide"
                                            class="btn btn-quantum w-100 py-4 mt-auto">HANDLING CORE →</a>
                                    </div>
                                </div>
                                <div class="col-xl-4 col-md-6">
                                    <div class="v3-protocol-node">
                                        <div class="v3-safety-icon text-info">🚜</div>
                                        <h4 class="text-white fw-900 mb-3 fs-3" style="letter-spacing: -1px;">Hardware
                                            Security</h4>
                                        <p class="text-white-50 mb-5 lh-lg"
                                            style="min-height: 84px; font-size: 14px; opacity: 0.6;">Tractor stability
                                            telemetry, PTO kinetic shielding, and safe hardware maintenance protocols
                                            for high-torque mechanization.</p>
                                        <a href="${pageContext.request.contextPath}/farmer/safety/hardware"
                                            class="btn btn-quantum w-100 py-4 mt-auto">ACCESS STANDARDS →</a>
                                    </div>
                                </div>
                                <div class="col-xl-4 col-md-6">
                                    <div class="v3-protocol-node">
                                        <div class="v3-safety-icon text-warning">☀️</div>
                                        <h4 class="text-white fw-900 mb-3 fs-3" style="letter-spacing: -1px;">Thermal
                                            Hazard</h4>
                                        <p class="text-white-50 mb-5 lh-lg"
                                            style="min-height: 84px; font-size: 14px; opacity: 0.6;">Hydration
                                            telemetry, UV index peak-hour protocols, and early thermal stress detection
                                            for high-fidelity personal protection.</p>
                                        <a href="${pageContext.request.contextPath}/farmer/safety/thermal"
                                            class="btn btn-quantum w-100 py-4 mt-auto">THERMAL NODES →</a>
                                    </div>
                                </div>
                                <div class="col-xl-4 col-md-6">
                                    <div class="v3-protocol-node">
                                        <div class="v3-safety-icon text-primary">🌙</div>
                                        <h4 class="text-white fw-900 mb-3 fs-3" style="letter-spacing: -1px;">Nocturnal
                                            Ops</h4>
                                        <p class="text-white-50 mb-5 lh-lg"
                                            style="min-height: 84px; font-size: 14px; opacity: 0.6;">Low-light
                                            irrigation telemetry, visual augment best practices, and wildlife awareness
                                            protocols for strategic night-phasing.</p>
                                        <a href="${pageContext.request.contextPath}/farmer/safety/night-farming"
                                            class="btn btn-quantum w-100 py-4 mt-auto">LUNAR PROTOCOL →</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </main>
                </div>

                <script src="${pageContext.request.contextPath}/js/background-switcher.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                <script>
                    const safetyAudio = {
                        ctx: null,
                        init() { if (!this.ctx) this.ctx = new (window.AudioContext || window.webkitAudioContext)(); },
                        playSiren() {
                            this.init(); if (this.ctx.state === 'suspended') this.ctx.resume();
                            const osc = this.ctx.createOscillator(); const gain = this.ctx.createGain();
                            osc.type = 'triangle'; osc.frequency.setValueAtTime(400, this.ctx.currentTime);
                            for (let i = 0; i < 4; i++) {
                                osc.frequency.exponentialRampToValueAtTime(800, this.ctx.currentTime + i * 0.8 + 0.4);
                                osc.frequency.exponentialRampToValueAtTime(400, this.ctx.currentTime + i * 0.8 + 0.8);
                            }
                            gain.gain.setValueAtTime(0.15, this.ctx.currentTime);
                            gain.gain.exponentialRampToValueAtTime(0.01, this.ctx.currentTime + 3);
                            osc.connect(gain); gain.connect(this.ctx.destination);
                            osc.start(); osc.stop(this.ctx.currentTime + 3);
                        },
                        playBeep(freq = 880, vol = 0.1, dur = 0.1) {
                            this.init(); if (this.ctx.state === 'suspended') this.ctx.resume();
                            const osc = this.ctx.createOscillator(); const gain = this.ctx.createGain();
                            osc.type = 'sine'; osc.frequency.setValueAtTime(freq, this.ctx.currentTime);
                            gain.gain.setValueAtTime(vol, this.ctx.currentTime);
                            gain.gain.exponentialRampToValueAtTime(0.01, this.ctx.currentTime + dur);
                            osc.connect(gain); gain.connect(this.ctx.destination);
                            osc.start(); osc.stop(this.ctx.currentTime + dur);
                        }
                    };

                    document.addEventListener('DOMContentLoaded', () => {
                        const sosBtn = document.getElementById('sosBtn');
                        if (sosBtn) {
                            sosBtn.addEventListener('mouseenter', () => safetyAudio.playBeep(440, 0.05, 0.05));
                        }
                    });

                    function toggleSidebar() { document.getElementById('sidebar').classList.toggle('open'); }
                    function triggerSOS() {
                        const status = document.getElementById('sosStatus');
                        safetyAudio.playBeep(660, 0.2, 0.2);
                        status.style.display = 'block';
                        status.innerHTML = `
                            <div class="text-center py-2 animate__animated animate__fadeIn">
                                <div class="text-danger fw-950 fs-2 mb-3 uppercase" style="letter-spacing:-1px;">⚠️ CONFIRM EMERGENCY BROADCAST?</div>
                                <div class="text-white-50 mb-4">This will transmit your live coordinates to regional authorities.</div>
                                <div class="d-flex justify-content-center gap-4">
                                    <button onclick="executeSOS()" class="btn btn-danger px-5 py-3 fw-950 uppercase" style="border-radius: 15px; box-shadow: 0 0 30px rgba(239, 68, 68, 0.3);">YES - ACTIVATE</button>
                                    <button onclick="cancelSOS()" class="btn btn-outline-light px-5 py-3 fw-950 uppercase" style="border-radius: 15px;">CANCEL</button>
                                </div>
                            </div>
                        `;
                    }

                    function cancelSOS() {
                        const status = document.getElementById('sosStatus');
                        status.style.display = 'none';
                        safetyAudio.playBeep(440, 0.1, 0.05);
                    }

                    async function executeSOS() {
                        const btn = document.getElementById('sosBtn');
                        const status = document.getElementById('sosStatus');

                        safetyAudio.playSiren();
                        btn.disabled = true; btn.innerText = 'WAIT';
                        status.innerHTML = `<div class="text-center py-4"><div class="spinner-border text-danger mb-3" role="status"></div><div class="text-white fw-950 uppercase">Broadcasting Strategic Alert...</div></div>`;

                        try {
                            const response = await fetch('${pageContext.request.contextPath}/farmer/safety/sos', { method: 'POST' });
                            const data = await response.json();
                            status.innerHTML = `
                                <div class="text-center animate__animated animate__pulse">
                                    <div class="text-white fw-950 fs-2 mb-3 uppercase" style="letter-spacing:-1px;">🚀 ALERT BROADCASTED</div>
                                    <div class="text-white-50 fs-5 lh-base" style="opacity:0.8;">${data.message}</div>
                                    <button onclick="cancelSOS()" class="btn btn-outline-success mt-4 px-4 py-2 fw-950 uppercase" style="font-size:10px; border-radius:10px;">DISMISS</button>
                                </div>`;
                            btn.innerText = 'SENT'; btn.style.background = '#10b981'; btn.style.borderColor = 'rgba(16,185,129,0.2)';
                        } catch (e) {
                            status.className = 'mt-5 p-5 rounded-5 border-danger border animate__animated animate__shakeX';
                            status.innerHTML = `
                                <div class="text-center">
                                    <div class="text-danger fw-950 fs-2 mb-3 uppercase" style="letter-spacing:-1px;">❌ BROADCAST FAILED</div>
                                    <div class="text-white-50 fs-5 lh-base">NETWORK ARCHITECTURE ERROR. CONTACT HELPLINE 112 IMMEDIATELY.</div>
                                    <button onclick="cancelSOS()" class="btn btn-danger mt-4 px-4 py-2 fw-950 uppercase" style="font-size:10px; border-radius:10px;">RETRY</button>
                                </div>`;
                            btn.innerText = 'FAIL'; btn.disabled = false;
                        }
                    }
                </script>
            </body>

            </html>
            drum





