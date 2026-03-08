<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>AGROPLANTER | Artificial Intelligence for Modern Agriculture</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                <link rel="icon"
                    href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🌾</text></svg>" />
                <style>
                    :root {
                        --primary-glow: #16a34a;
                        --secondary-glow: #0ea5e9;
                        --accent-glow: #8b5cf6;
                    }

                    html {
                        scroll-behavior: smooth;
                        scroll-padding-top: 80px;
                    }

                    body {
                        background: #020617;
                        color: #f8fafc;
                        overflow-x: hidden;
                        font-family: 'Outfit', sans-serif;
                    }

                    .hero-premium {
                        min-height: 100vh;
                        position: relative;
                        background: url('${pageContext.request.contextPath}/images/hero-landscape.png') no-repeat center center;
                        background-size: cover;
                        display: flex;
                        flex-direction: column;
                    }

                    .hero-premium::before {
                        content: '';
                        position: absolute;
                        inset: 0;
                        background: linear-gradient(180deg, rgba(2, 6, 23, 0.7) 0%, rgba(2, 6, 23, 0.95) 100%);
                        z-index: 1;
                    }

                    .hero-content-wrapper {
                        position: relative;
                        z-index: 2;
                        flex: 1;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        padding: 40px;
                    }

                    .nav-glass {
                        background: rgba(15, 23, 42, 0.5);
                        backdrop-filter: blur(20px);
                        border-bottom: 1px solid rgba(255, 255, 255, 0.05);
                        padding: 15px 40px;
                        position: sticky;
                        top: 0;
                        z-index: 1000;
                    }

                    html {
                        scroll-behavior: smooth;
                        scroll-padding-top: 100px;
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
                        gap: 10px;
                    }

                    .brand-icon-box {
                        width: 38px;
                        height: 38px;
                        background: linear-gradient(135deg, rgba(16, 185, 129, 0.2), rgba(6, 182, 212, 0.2));
                        border: 1px solid rgba(16, 185, 129, 0.3);
                        border-radius: 10px;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        font-size: 20px;
                        color: #10b981;
                    }

                    .hero-headline {
                        font-size: clamp(3rem, 10vw, 5rem);
                        font-weight: 900;
                        line-height: 1;
                        letter-spacing: -3px;
                        margin-bottom: 2rem;
                        animation: slideUp 1s cubic-bezier(0.16, 1, 0.3, 1);
                    }

                    .hero-subtext {
                        font-size: 1.25rem;
                        color: #94a3b8;
                        max-width: 700px;
                        margin: 0 auto 3rem;
                        line-height: 1.6;
                        animation: slideUp 1.2s cubic-bezier(0.16, 1, 0.3, 1);
                    }

                    .cta-group {
                        display: flex;
                        gap: 20px;
                        justify-content: center;
                        animation: slideUp 1.4s cubic-bezier(0.16, 1, 0.3, 1);
                    }

                    .btn-premium {
                        padding: 18px 40px;
                        border-radius: 100px;
                        font-weight: 800;
                        text-transform: uppercase;
                        letter-spacing: 1px;
                        font-size: 14px;
                        transition: 0.4s;
                        position: relative;
                        overflow: hidden;
                        border: none;
                    }

                    .btn-glow {
                        background: linear-gradient(135deg, var(--primary-glow), var(--secondary-glow));
                        color: white;
                        box-shadow: 0 0 30px rgba(16, 185, 129, 0.3);
                    }

                    .btn-glow:hover {
                        transform: scale(1.05);
                        box-shadow: 0 0 50px rgba(16, 185, 129, 0.5);
                        color: #fff;
                    }

                    .card-premium {
                        background: rgba(30, 41, 59, 0.4);
                        border: 1px solid rgba(255, 255, 255, 0.05);
                        backdrop-filter: blur(10px);
                        border-radius: 32px;
                        padding: 40px;
                        transition: 0.4s;
                        height: 100%;
                    }

                    .card-premium:hover {
                        background: rgba(30, 41, 59, 0.7);
                        border-color: var(--primary-glow);
                        transform: translateY(-10px);
                    }

                    .sos-floating {
                        position: fixed;
                        left: 32px;
                        bottom: 32px;
                        width: 70px;
                        height: 70px;
                        background: #ef4444;
                        color: white;
                        border-radius: 50%;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        font-weight: 900;
                        font-size: 18px;
                        box-shadow: 0 10px 30px rgba(239, 68, 68, 0.4);
                        z-index: 9999;
                        text-decoration: none;
                        animation: sosPulse 2s infinite;
                        border: 3px solid rgba(255, 255, 255, 0.2);
                    }

                    @keyframes sosPulse {
                        0% {
                            transform: scale(1);
                            box-shadow: 0 0 0 0 rgba(239, 68, 68, 0.7);
                        }

                        70% {
                            transform: scale(1.1);
                            box-shadow: 0 0 0 30px rgba(239, 68, 68, 0);
                        }

                        100% {
                            transform: scale(1);
                            box-shadow: 0 0 0 0 rgba(239, 68, 68, 0);
                        }
                    }

                    @keyframes slideUp {
                        from {
                            opacity: 0;
                            transform: translateY(40px);
                        }

                        to {
                            opacity: 1;
                            transform: translateY(0);
                        }
                    }

                    .voice-orb {
                        width: 120px;
                        height: 120px;
                        background: radial-gradient(circle, #3b82f6 0%, transparent 70%);
                        border-radius: 50%;
                        margin: 0 auto 20px;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        cursor: pointer;
                        transition: 0.4s;
                        position: relative;
                        animation: orbPulse 3s infinite ease-in-out;
                        font-size: 40px;
                        border: 2px solid rgba(59, 130, 246, 0.2);
                    }

                    @keyframes orbPulse {
                        0% {
                            transform: scale(1);
                            box-shadow: 0 0 0 0 rgba(59, 130, 246, 0.4);
                        }

                        50% {
                            transform: scale(1.05);
                            box-shadow: 0 0 30px 10px rgba(59, 130, 246, 0.2);
                        }

                        100% {
                            transform: scale(1);
                            box-shadow: 0 0 0 0 rgba(59, 130, 246, 0.4);
                        }
                    }

                    .voice-orb:hover {
                        transform: scale(1.15) rotate(15deg);
                        background: radial-gradient(circle, #3b82f6 0%, rgba(59, 130, 246, 0.1) 70%);
                        border-color: #3b82f6;
                    }

                    .feature-icon-premium {
                        width: 64px;
                        height: 64px;
                        border-radius: 20px;
                        background: rgba(16, 185, 129, 0.1);
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        font-size: 32px;
                        margin-bottom: 24px;
                    }

                    .hover-white:hover {
                        color: white !important;
                    }

                    .letter-spacing-2 {
                        letter-spacing: 2px;
                    }

                    .uppercase {
                        text-transform: uppercase;
                    }

                    .x-small {
                        font-size: 11px;
                    }
                </style>
            </head>

            <body>
                <a href="${pageContext.request.contextPath}/farmer/safety-hub" class="sos-floating" id="sosLink">SOS</a>


                <script>
                    <c:if test="${not empty user}">
                        window.AgroplanterUser = "${user.id}";
                        window.AgroplanterUserFull = "${user.fullName}";
                        window.AgroplanterRole = "${user.role}";
                    </c:if>
                </script>

                <header class="nav-glass d-flex justify-content-between align-items-center">
                    <a href="/" class="text-decoration-none d-flex align-items-center">
                        <div class="brand-premium">
                            <div class="brand-icon-box">
                                <i class="fas fa-leaf"></i>
                            </div>
                            AGROPLANTER <span class="text-white opacity-25"
                                style="font-size: 14px; font-weight: 400; letter-spacing: 0;">v.3</span>
                        </div>
                    </a>
                    <div class="d-none d-md-flex gap-4 align-items-center">
                        <a href="#intelligence" class="nav-link text-white-50">Intelligence</a>
                        <a href="#pricing-tiers" class="nav-link text-white-50">Strategic Plans</a>
                        <a href="#faq" class="nav-link text-white-50">FAQ</a>
                        <a href="#ecosystem" class="nav-link text-white-50">Ecosystem</a>

                        <c:choose>
                            <c:when test="${not empty user}">
                                <a href="${pageContext.request.contextPath}/${fn:toLowerCase(user.role)}/dashboard"
                                    class="btn btn-primary rounded-pill px-4 btn-sm fw-bold">COMMAND CENTER</a>
                                <c:set var="profilePath">
                                    <c:choose>
                                        <c:when test="${user.role == 'EXPERT'}">clinic/expert/profile</c:when>
                                        <c:when test="${user.role == 'MENTOR'}">mentor/profile</c:when>
                                        <c:when test="${user.role == 'B2B_BUYER'}">buyer/profile</c:when>
                                        <c:otherwise>${fn:toLowerCase(user.role)}/profile</c:otherwise>
                                    </c:choose>
                                </c:set>
                                <a href="${pageContext.request.contextPath}/${profilePath}"
                                    class="user-identity text-decoration-none">
                                    <div class="avatar-box"
                                        style="width: 36px; height: 36px; background: var(--primary-glow); border-radius: 50%; display: flex; align-items: center; justify-content: center; font-weight: 900; color: white; overflow: hidden; border: 1px solid rgba(255,255,255,0.2);">
                                        <c:choose>
                                            <c:when test="${not empty user.profileImagePath}">
                                                <img src="${pageContext.request.contextPath}${user.profileImagePath}"
                                                    alt="Profile" style="width: 100%; height: 100%; object-fit: cover;">
                                            </c:when>
                                            <c:otherwise>
                                                <i class="fas fa-user-circle" style="font-size: 24px;"></i>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </a>
                                <a href="${pageContext.request.contextPath}/logout"
                                    class="nav-link text-white-50 x-small fw-bold">LOGOUT</a>
                            </c:when>
                            <c:otherwise>
                                <a href="${pageContext.request.contextPath}/login"
                                    class="btn btn-outline-light rounded-pill px-4 btn-sm">LOGIN ACCESS</a>
                                <a href="${pageContext.request.contextPath}/register"
                                    class="btn btn-primary rounded-pill px-4 btn-sm fw-bold">JOIN PLATFORM</a>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </header>

                <main class="hero-premium">
                    <div class="hero-content-wrapper text-center">
                        <div class="container">
                            <div class="badge rounded-pill px-4 py-2 border mb-4"
                                style="background: rgba(16, 185, 129, 0.2); border-color: rgba(16, 185, 129, 0.4) !important; color: #22c55e !important; font-weight: 800; font-size: 13px;">
                                ⚡ WORLD'S FIRST AI-DECENTRALIZED AGRI-PLATFORM
                            </div>
                            <h1 class="hero-headline">THE <span style="color: var(--primary-glow)">QUANTUM
                                    LEAP</span><br />OF INDIAN FARMS</h1>
                            <p class="hero-subtext">Precision agriculture meets artificial intelligence. Manage soil
                                health,
                                market volatility, and biological threats from one unified command center.</p>
                            <div class="cta-group">
                                <a href="${pageContext.request.contextPath}/register"
                                    class="btn btn-premium btn-glow px-5">START HARVESTING SMART</a>
                                <a href="#intelligence" class="btn btn-premium btn-outline-light px-5">WATCH OPERATION
                                    DEMO</a>
                            </div>
                        </div>
                    </div>
                </main>

                <!-- Unified Intelligence Hub -->
                <section class="py-5" id="intelligence"
                    style="background: #020617; position: relative; overflow: hidden;">
                    <!-- Decorative Background Elements -->
                    <div
                        style="position: absolute; top: -10%; right: -10%; width: 500px; height: 500px; background: radial-gradient(circle, rgba(16, 185, 129, 0.05) 0%, transparent 70%); pointer-events: none;">
                    </div>
                    <div
                        style="position: absolute; bottom: -10%; left: -10%; width: 500px; height: 500px; background: radial-gradient(circle, rgba(30, 58, 138, 0.05) 0%, transparent 70%); pointer-events: none;">
                    </div>

                    <div class="container py-5" style="position: relative; z-index: 1;">
                        <div class="row align-items-center mb-5">
                            <div class="col-lg-12 text-center">
                                <div class="badge rounded-pill px-4 py-2 border mb-4"
                                    style="background: rgba(16, 185, 129, 0.1); border-color: rgba(16, 185, 129, 0.3) !important; color: #10b981 !important; font-weight: 800; font-size: 13px; text-transform: uppercase; letter-spacing: 2px;">
                                    PLATFORM ECOSYSTEM
                                </div>
                                <h2 class="display-4 fw-900 mb-4" style="color: #ffffff; letter-spacing: -2px;">THE
                                    <span
                                        style="color: #10b981; text-shadow: 0 0 20px rgba(16, 185, 129, 0.3);">PULSE</span>
                                    ARCHITECTURE
                                </h2>
                                <p class="lead mx-auto" style="max-width: 800px; color: #94a3b8 !important;">
                                    A holistic, mission-critical ecosystem designed to empower every node in the
                                    agricultural supply chain through decentralized intelligence and real-time
                                    connectivity.
                                </p>
                            </div>
                        </div>

                        <style>
                            .feature-alt-container {
                                padding: 60px 0;
                                max-width: 1300px;
                                margin: 0 auto;
                            }

                            .feature-alt-item {
                                display: flex;
                                align-items: center;
                                background: rgba(15, 23, 42, 0.4);
                                backdrop-filter: blur(20px);
                                -webkit-backdrop-filter: blur(20px);
                                border-radius: 24px;
                                margin-bottom: 40px;
                                overflow: hidden;
                                border: 1px solid rgba(255, 255, 255, 0.08);
                                transition: 0.5s cubic-bezier(0.16, 1, 0.3, 1);
                                min-height: 420px;
                                position: relative;
                            }

                            .feature-alt-item::before {
                                content: '';
                                position: absolute;
                                inset: 0;
                                background: linear-gradient(135deg, rgba(255, 255, 255, 0.05), transparent);
                                pointer-events: none;
                            }

                            .feature-alt-item:hover {
                                transform: translateY(-10px);
                                border-color: rgba(16, 185, 129, 0.3);
                                background: rgba(15, 23, 42, 0.6);
                                box-shadow: 0 30px 60px rgba(0, 0, 0, 0.4);
                            }

                            .feature-alt-item:nth-child(even) {
                                flex-direction: row-reverse;
                            }

                            .feat-alt-img-wrapper {
                                flex: 1.3;
                                position: relative;
                                height: 420px;
                                overflow: hidden;
                            }

                            .feature-alt-item:nth-child(odd) .feat-alt-img-wrapper::after {
                                content: '';
                                position: absolute;
                                inset: 0;
                                background: linear-gradient(to right, transparent 50%, #020617 100%);
                            }

                            .feature-alt-item:nth-child(even) .feat-alt-img-wrapper::after {
                                content: '';
                                position: absolute;
                                inset: 0;
                                background: linear-gradient(to left, transparent 50%, #020617 100%);
                            }

                            .feat-alt-img-wrapper img {
                                width: 100%;
                                height: 100%;
                                object-fit: cover;
                                display: block;
                                transition: 1.5s ease;
                                opacity: 0.85;
                            }

                            .feature-alt-item:hover .feat-alt-img-wrapper img {
                                transform: scale(1.08);
                                opacity: 1;
                            }

                            .feat-alt-content {
                                flex: 1;
                                padding: 60px;
                                position: relative;
                                z-index: 2;
                            }

                            .feat-alt-tag {
                                font-size: 11px;
                                font-weight: 800;
                                color: #10b981;
                                text-transform: uppercase;
                                letter-spacing: 2.5px;
                                margin-bottom: 20px;
                                display: inline-block;
                                padding: 6px 14px;
                                background: rgba(16, 185, 129, 0.1);
                                border-radius: 8px;
                                border: 1px solid rgba(16, 185, 129, 0.2);
                            }

                            .feat-alt-title {
                                font-size: 2.4rem;
                                font-weight: 800;
                                margin-bottom: 25px;
                                line-height: 1.2;
                                color: #ffffff;
                                letter-spacing: -1px;
                            }

                            .feat-alt-description {
                                font-size: 1.15rem;
                                color: #94a3b8;
                                line-height: 1.8;
                                margin-bottom: 0;
                                font-weight: 400;
                            }

                            @media (max-width: 991px) {

                                .feature-alt-item,
                                .feature-alt-item:nth-child(even) {
                                    flex-direction: column !important;
                                    text-align: center;
                                }

                                .feat-alt-img-wrapper {
                                    width: 100%;
                                    height: 320px;
                                }

                                .feature-alt-item:nth-child(odd) .feat-alt-img-wrapper::after,
                                .feature-alt-item:nth-child(even) .feat-alt-img-wrapper::after {
                                    background: linear-gradient(to bottom, transparent 40%, #020617 100%);
                                }

                                .feat-alt-content {
                                    padding: 40px 30px;
                                }

                                .feat-alt-title {
                                    font-size: 1.8rem;
                                }
                            }
                        </style>

                        <div class="feature-alt-container">
                            <!-- 1 -->
                            <div class="feature-alt-item">
                                <div class="feat-alt-img-wrapper">
                                    <img src="${pageContext.request.contextPath}/images/features_v2/m_role.png"
                                        alt="Multi-Role">
                                </div>
                                <div class="feat-alt-content">
                                    <span class="feat-alt-tag">CORE ACCESS</span>
                                    <h4 class="feat-alt-title">Multi-Role Sync Engine</h4>
                                    <p class="feat-alt-description">Dynamic identity registry balancing Farmers, Buyers,
                                        Admins, and Mentors in one unified, real-time authenticated ecosystem.</p>
                                </div>
                            </div>

                            <!-- 2 -->
                            <div class="feature-alt-item">
                                <div class="feat-alt-img-wrapper">
                                    <img src="${pageContext.request.contextPath}/images/features_v2/b2c.png"
                                        alt="B2C Marketplace">
                                </div>
                                <div class="feat-alt-content">
                                    <span class="feat-alt-tag">MARKET</span>
                                    <h4 class="feat-alt-title">B2C Agri-Marketplace</h4>
                                    <p class="feat-alt-description">A premium direct-to-consumer exchange eliminating
                                        middlemen, maximizing farmer profit and consumer transparency.</p>
                                </div>
                            </div>

                            <!-- 3 -->
                            <div class="feature-alt-item">
                                <div class="feat-alt-img-wrapper">
                                    <img src="${pageContext.request.contextPath}/images/features_v2/b2b.png"
                                        alt="B2B Surplus">
                                </div>
                                <div class="feat-alt-content">
                                    <span class="feat-alt-tag">B2B LOGISTICS</span>
                                    <h4 class="feat-alt-title">Smart Surplus Redirection</h4>
                                    <p class="feat-alt-description">Algorithmically redirecting agricultural surplus to
                                        bulk buyers, minimizing post-harvest waste across the supply chain.</p>
                                </div>
                            </div>

                            <!-- 4 -->
                            <div class="feature-alt-item">
                                <div class="feat-alt-img-wrapper">
                                    <img src="${pageContext.request.contextPath}/images/features_v2/rental.png"
                                        alt="Equipment Rental">
                                </div>
                                <div class="feat-alt-content">
                                    <span class="feat-alt-tag">HUB</span>
                                    <h4 class="feat-alt-title">Agri-Uber Rental Hub</h4>
                                    <p class="feat-alt-description">Securely rent high-tech machinery. A decentralized
                                        sharing economy for modern tractors, drones, and harvesters.</p>
                                </div>
                            </div>

                            <!-- 5 -->
                            <div class="feature-alt-item">
                                <div class="feat-alt-img-wrapper">
                                    <img src="${pageContext.request.contextPath}/images/features_v2/traceability.png"
                                        alt="Traceability">
                                </div>
                                <div class="feat-alt-content">
                                    <span class="feat-alt-tag">BLOCKCHAIN</span>
                                    <h4 class="feat-alt-title">Real-Time Traceability</h4>
                                    <p class="feat-alt-description">Full supply chain transparency from seed-to-shelf
                                        using digital audit trails and immutable origin tracking.</p>
                                </div>
                            </div>

                            <!-- 6 -->
                            <div class="feature-alt-item">
                                <div class="feat-alt-img-wrapper">
                                    <img src="${pageContext.request.contextPath}/images/features_v2/clinic.png"
                                        alt="Plant Clinic">
                                </div>
                                <div class="feat-alt-content">
                                    <span class="feat-alt-tag">TELE-CONSULT</span>
                                    <h4 class="feat-alt-title">Bio-Consult Clinic</h4>
                                    <p class="feat-alt-description">Instant tele-consultation with agronomists. Expert
                                        medical advice for crops delivered via encrypted video terminals.</p>
                                </div>
                            </div>

                            <!-- 7 -->
                            <div class="feature-alt-item">
                                <div class="feat-alt-img-wrapper">
                                    <img src="${pageContext.request.contextPath}/images/features_v2/video_rooms.png"
                                        alt="Video Rooms">
                                </div>
                                <div class="feat-alt-content">
                                    <span class="feat-alt-tag">LIVE CO-LAB</span>
                                    <h4 class="feat-alt-title">Interactive Video Rooms</h4>
                                    <p class="feat-alt-description">Synchronous collaboration spaces for farmer
                                        peer-groups and virtual training workshops with low-latency streaming.</p>
                                </div>
                            </div>

                            <!-- 8 -->
                            <div class="feature-alt-item">
                                <div class="feat-alt-img-wrapper">
                                    <img src="${pageContext.request.contextPath}/images/features_v2/prescriptions.png"
                                        alt="Prescriptions">
                                </div>
                                <div class="feat-alt-content">
                                    <span class="feat-alt-tag">SMART DOCS</span>
                                    <h4 class="feat-alt-title">Digital Agri-Prescriptions</h4>
                                    <p class="feat-alt-description">Precision input recommendations generated by
                                        experts, ensuring optimal fertilizer and biocide application.</p>
                                </div>
                            </div>

                            <!-- 9 -->
                            <div class="feature-alt-item">
                                <div class="feat-alt-img-wrapper">
                                    <img src="${pageContext.request.contextPath}/images/features_v2/ai_disease.png"
                                        alt="AI Disease">
                                </div>
                                <div class="feat-alt-content">
                                    <span class="feat-alt-tag">AI SCAN</span>
                                    <h4 class="feat-alt-title">Neural Disease Diagnostic</h4>
                                    <p class="feat-alt-description">Computer vision algorithms analyzing plant pathology
                                        in seconds, providing instant viral and fungal identification.</p>
                                </div>
                            </div>

                            <!-- 10 -->
                            <div class="feature-alt-item">
                                <div class="feat-alt-img-wrapper">
                                    <img src="${pageContext.request.contextPath}/images/features_v2/market_prices.png"
                                        alt="Market Prices">
                                </div>
                                <div class="feat-alt-content">
                                    <span class="feat-alt-tag">FINANCE</span>
                                    <h4 class="feat-alt-title">Live Mandi Ticker</h4>
                                    <p class="feat-alt-description">Real-time price streams from 500+ regional hubs,
                                        empowering farmers with peak liquidity data and sell-signals.</p>
                                </div>
                            </div>

                            <!-- 11 -->
                            <div class="feature-alt-item">
                                <div class="feat-alt-img-wrapper">
                                    <img src="${pageContext.request.contextPath}/images/features_v2/weather.png"
                                        alt="Weather">
                                </div>
                                <div class="feat-alt-content">
                                    <span class="feat-alt-tag">SAT-INTEL</span>
                                    <h4 class="feat-alt-title">Geospatial Forecast Hub</h4>
                                    <p class="feat-alt-description">Meteorological telemetry for hyper-local weather
                                        patterns, essential for precision irrigation and harvest planning.</p>
                                </div>
                            </div>

                            <!-- 12 -->
                            <div class="feature-alt-item">
                                <div class="feat-alt-img-wrapper">
                                    <img src="${pageContext.request.contextPath}/images/features_v2/gov_schemes.png"
                                        alt="Gov Schemes">
                                </div>
                                <div class="feat-alt-content">
                                    <span class="feat-alt-tag">INSTITUTIONAL</span>
                                    <h4 class="feat-alt-title">Welfare Protocol Gateway</h4>
                                    <p class="feat-alt-description">Simplified access to government subsidies and
                                        financial schemes, removing bureaucratic friction for the rural workforce.</p>
                                </div>
                            </div>

                            <!-- 13 -->
                            <div class="feature-alt-item">
                                <div class="feat-alt-img-wrapper">
                                    <img src="${pageContext.request.contextPath}/images/features_v2/mentorship.png"
                                        alt="Mentorship">
                                </div>
                                <div class="feat-alt-content">
                                    <span class="feat-alt-tag">MENTORSHIP</span>
                                    <h4 class="feat-alt-title">Agri-Mentor Bridge</h4>
                                    <p class="feat-alt-description">Direct connectivity with veteran agricultural
                                        experts for long-term guidance and strategic farm evolution.</p>
                                </div>
                            </div>

                            <!-- 14 -->
                            <div class="feature-alt-item">
                                <div class="feat-alt-img-wrapper">
                                    <img src="${pageContext.request.contextPath}/images/features_v2/learning_videos.png"
                                        alt="Academy">
                                </div>
                                <div class="feat-alt-content">
                                    <span class="feat-alt-tag">ACADEMY</span>
                                    <h4 class="feat-alt-title">AGROPLANTER Academy</h4>
                                    <p class="feat-alt-description">A vast library of 4K educational assets covering
                                        precision farming, organic certification, and rural finance.</p>
                                </div>
                            </div>

                            <!-- 15 -->
                            <div class="feature-alt-item">
                                <div class="feat-alt-img-wrapper">
                                    <img src="${pageContext.request.contextPath}/images/features_v2/secure_payments.png"
                                        alt="Payments">
                                </div>
                                <div class="feat-alt-content">
                                    <span class="feat-alt-tag">SECURITY</span>
                                    <h4 class="feat-alt-title">Vault Transaction Layer</h4>
                                    <p class="feat-alt-description">Military-grade encryption for all financial flows,
                                        providing instant settlements and auditable payment logs.</p>
                                </div>
                            </div>

                            <!-- 16 -->
                            <div class="feature-alt-item">
                                <div class="feat-alt-img-wrapper">
                                    <img src="${pageContext.request.contextPath}/images/features_v2/chat_system.png"
                                        alt="Chat">
                                </div>
                                <div class="feat-alt-content">
                                    <span class="feat-alt-tag">NEXUS</span>
                                    <h4 class="feat-alt-title">End-to-End Chat Nexus</h4>
                                    <p class="feat-alt-description">Encrypted messaging terminals connecting farmers,
                                        buyers, and experts for zero-latency communication.</p>
                                </div>
                            </div>

                            <!-- 17 -->
                            <div class="feature-alt-item">
                                <div class="feat-alt-img-wrapper">
                                    <img src="${pageContext.request.contextPath}/images/features_v2/financial_dashboard.png"
                                        alt="Finance">
                                </div>
                                <div class="feat-alt-content">
                                    <span class="feat-alt-tag">FIN-TECH</span>
                                    <h4 class="feat-alt-title">Farmer Financial Radar</h4>
                                    <p class="feat-alt-description">Complete P&L oversight, revenue tracking, and
                                        cash-flow diagnostics tailored specifically for agricultural cycles.</p>
                                </div>
                            </div>

                            <!-- 18 -->
                            <div class="feature-alt-item">
                                <div class="feat-alt-img-wrapper">
                                    <img src="${pageContext.request.contextPath}/images/features_v2/analytics.png"
                                        alt="Analytics">
                                </div>
                                <div class="feat-alt-content">
                                    <span class="feat-alt-tag">ADMIN-CORE</span>
                                    <h4 class="feat-alt-title">Predictive Analytics</h4>
                                    <p class="feat-alt-description">Predictive modeling for administrative oversight,
                                        tracking regional productivity and systemic health metrics.</p>
                                </div>
                            </div>

                            <!-- 19 -->
                            <div class="feature-alt-item">
                                <div class="feat-alt-img-wrapper">
                                    <img src="${pageContext.request.contextPath}/images/features_v2/notifications.png"
                                        alt="Alerts">
                                </div>
                                <div class="feat-alt-content">
                                    <span class="feat-alt-tag">ALERTS</span>
                                    <h4 class="feat-alt-title">Emergency Response</h4>
                                    <p class="feat-alt-description">Urgent notification protocol for pest outbreaks,
                                        frost warnings, and critical market liquidity events.</p>
                                </div>
                            </div>

                            <!-- 20 -->
                            <div class="feature-alt-item">
                                <div class="feat-alt-img-wrapper">
                                    <img src="${pageContext.request.contextPath}/images/features_v2/crop_recommendation.png"
                                        alt="Recommendation">
                                </div>
                                <div class="feat-alt-content">
                                    <span class="feat-alt-tag">AI-ADVISOR</span>
                                    <h4 class="feat-alt-title">Yield Marketplace</h4>
                                    <p class="feat-alt-description">AI-driven planting strategies recommending optimal
                                        crops based on soil ph, moisture, and market demand.</p>
                                </div>
                            </div>

                            <!-- 21 -->
                            <div class="feature-alt-item">
                                <div class="feat-alt-img-wrapper">
                                    <img src="${pageContext.request.contextPath}/images/features_v2/voice_assistant.png"
                                        alt="Voice AI">
                                </div>
                                <div class="feat-alt-content">
                                    <span class="feat-alt-tag">VOICE</span>
                                    <h4 class="feat-alt-title">Polyglot Voice AI</h4>
                                    <p class="feat-alt-description">Hands-free smart assistant supporting regional
                                        dialects for field-level advisory and platform navigation.</p>
                                </div>
                            </div>

                            <!-- 22 -->
                            <div class="feature-alt-item">
                                <div class="feat-alt-img-wrapper">
                                    <img src="${pageContext.request.contextPath}/images/features_v2/fraud_detection.png"
                                        alt="Fraud">
                                </div>
                                <div class="feat-alt-content">
                                    <span class="feat-alt-tag">TRUST</span>
                                    <h4 class="feat-alt-title">Fraud Defense Matrix</h4>
                                    <p class="feat-alt-description">Machine learning patterns detecting suspicious
                                        trades and ensuring ecosystem integrity through Trust Score modeling.</p>
                                </div>
                            </div>

                            <!-- 23 -->
                            <div class="feature-alt-item">
                                <div class="feat-alt-img-wrapper">
                                    <img src="${pageContext.request.contextPath}/images/features_v2/safety.png"
                                        alt="Safety">
                                </div>
                                <div class="feat-alt-content">
                                    <span class="feat-alt-tag">SAFETY</span>
                                    <h4 class="feat-alt-title">Operational Safety Shield</h4>
                                    <p class="feat-alt-description">Critical SOS protocols and safety educational assets
                                        for night-farming operations and emergency handling.</p>
                                </div>
                            </div>

                            <!-- 24 -->
                            <div class="feature-alt-item">
                                <div class="feat-alt-img-wrapper">
                                    <img src="${pageContext.request.contextPath}/images/features_v2/inventory.png"
                                        alt="Inventory">
                                </div>
                                <div class="feat-alt-content">
                                    <span class="feat-alt-tag">LOGISTICS</span>
                                    <h4 class="feat-alt-title">Shipment Management</h4>
                                    <p class="feat-alt-description">Comprehensive order management and inventory
                                        diagnostics for large-scale agricultural warehouse operations.</p>
                                </div>
                            </div>
                        </div>


                    </div>
                </section>

                <!-- Subscription Strategic Plans -->
                <section class="py-5" id="pricing"
                    style="background: #020617; position: relative; border-top: 1px solid rgba(255,255,255,0.05);">
                    <div class="container py-5">
                        <!-- The AGROPLANTER Advantage: Competitive Comparison -->
                        <div class="text-center mb-5">
                            <div class="badge rounded-pill px-4 py-2 border mb-4"
                                style="background: rgba(16, 185, 129, 0.1); border-color: rgba(16, 185, 129, 0.3) !important; color: #10b981 !important; font-weight: 800; font-size: 13px; text-transform: uppercase;">
                                STRATEGIC SUPERIORITY
                            </div>
                            <h2 class="display-4 fw-900 mb-4" style="color: #ffffff;">WHY CHOOSE <span
                                    style="color: #10b981;">AGROPLANTER?</span></h2>
                            <p class="lead mx-auto" style="max-width: 700px; color: #94a3b8;">
                                We don't just provide tools; we provide a paradigm shift. See how our integrated
                                ecosystem outperforms fragmented traditional solutions.
                            </p>
                        </div>

                        <div class="row g-4 justify-content-center mb-5">
                            <div class="col-lg-12">
                                <div
                                    style="background: rgba(15, 23, 42, 0.4); backdrop-filter: blur(20px); border-radius: 32px; border: 1px solid rgba(255, 255, 255, 0.08); overflow: hidden; box-shadow: 0 40px 100px rgba(0,0,0,0.5);">
                                    <!-- Matrix Header -->
                                    <div class="row g-0 text-center py-4"
                                        style="background: rgba(255,255,255,0.02); border-bottom: 1px solid rgba(255,255,255,0.05);">
                                        <div class="col-md-4 py-2 px-4 text-start">
                                            <span
                                                style="color: #94a3b8; font-weight: 800; letter-spacing: 2px; font-size: 0.8rem; text-transform: uppercase;">Core
                                                Capability</span>
                                        </div>
                                        <div class="col-md-4 py-2">
                                            <span
                                                style="color: #ef4444; font-weight: 800; letter-spacing: 2px; font-size: 0.8rem; text-transform: uppercase;">Traditional
                                                Systems</span>
                                        </div>
                                        <div class="col-md-4 py-2" style="background: rgba(16, 185, 129, 0.05);">
                                            <span
                                                style="color: #10b981; font-weight: 800; letter-spacing: 2px; font-size: 0.8rem; text-transform: uppercase;">AGROPLANTER
                                                Core</span>
                                        </div>
                                    </div>

                                    <!-- Matrix Rows -->
                                    <!-- Row 1 -->
                                    <div class="row g-0 text-center align-items-center border-bottom"
                                        style="border-color: rgba(255,255,255,0.05) !important;">
                                        <div class="col-md-4 py-4 px-5 text-start">
                                            <h4 class="h6 mb-0 fw-800" style="color: #ffffff;">Market Dynamics</h4>
                                            <small style="color: #64748b;">Economic structure & access</small>
                                        </div>
                                        <div class="col-md-4 py-4 px-3">
                                            <div style="color: #94a3b8; font-size: 0.95rem;">Intermediary-Heavy Layers
                                            </div>
                                        </div>
                                        <div class="col-md-4 py-4 px-3" style="background: rgba(16, 185, 129, 0.03);">
                                            <div class="fw-800" style="color: #10b981; font-size: 1.1rem;">100%
                                                Direct-to-Consumer</div>
                                        </div>
                                    </div>

                                    <!-- Row 2 -->
                                    <div class="row g-0 text-center align-items-center border-bottom"
                                        style="border-color: rgba(255,255,255,0.05) !important;">
                                        <div class="col-md-4 py-4 px-5 text-start">
                                            <h4 class="h6 mb-0 fw-800" style="color: #ffffff;">Data Fidelity</h4>
                                            <small style="color: #64748b;">Insight accuracy & speed</small>
                                        </div>
                                        <div class="col-md-4 py-4 px-3">
                                            <div style="color: #94a3b8; font-size: 0.95rem;">Static / Historical Reports
                                            </div>
                                        </div>
                                        <div class="col-md-4 py-4 px-3" style="background: rgba(16, 185, 129, 0.03);">
                                            <div class="fw-800" style="color: #10b981; font-size: 1.1rem;">Live
                                                Satellite Telemetry</div>
                                        </div>
                                    </div>

                                    <!-- Row 3 -->
                                    <div class="row g-0 text-center align-items-center border-bottom"
                                        style="border-color: rgba(255,255,255,0.05) !important;">
                                        <div class="col-md-4 py-4 px-5 text-start">
                                            <h4 class="h6 mb-0 fw-800" style="color: #ffffff;">Trust & Origin</h4>
                                            <small style="color: #64748b;">Verification & safety</small>
                                        </div>
                                        <div class="col-md-4 py-4 px-3">
                                            <div style="color: #94a3b8; font-size: 0.95rem;">Manual Paper Ledgers</div>
                                        </div>
                                        <div class="col-md-4 py-4 px-3" style="background: rgba(16, 185, 129, 0.03);">
                                            <div class="fw-800" style="color: #10b981; font-size: 1.1rem;">Immutable
                                                Blockchain Logs</div>
                                        </div>
                                    </div>

                                    <!-- Row 4 -->
                                    <div class="row g-0 text-center align-items-center border-bottom"
                                        style="border-color: rgba(255,255,255,0.05) !important;">
                                        <div class="col-md-4 py-4 px-5 text-start">
                                            <h4 class="h6 mb-0 fw-800" style="color: #ffffff;">Diagnostics</h4>
                                            <small style="color: #64748b;">Problem detection</small>
                                        </div>
                                        <div class="col-md-4 py-4 px-3">
                                            <div style="color: #94a3b8; font-size: 0.95rem;">72-Hour Lab Turnaround
                                            </div>
                                        </div>
                                        <div class="col-md-4 py-4 px-3" style="background: rgba(16, 185, 129, 0.03);">
                                            <div class="fw-800" style="color: #10b981; font-size: 1.1rem;">Instant AI
                                                Neuro-Scan</div>
                                        </div>
                                    </div>

                                    <!-- Row 5 -->
                                    <div class="row g-0 text-center align-items-center" style="border-bottom: none;">
                                        <div class="col-md-4 py-4 px-5 text-start">
                                            <h4 class="h6 mb-0 fw-800" style="color: #ffffff;">Expert Access</h4>
                                            <small style="color: #64748b;">Guidance & mentorship</small>
                                        </div>
                                        <div class="col-md-4 py-4 px-3">
                                            <div style="color: #94a3b8; font-size: 0.95rem;">Scheduled Appointments
                                            </div>
                                        </div>
                                        <div class="col-md-4 py-4 px-3" style="background: rgba(16, 185, 129, 0.03);">
                                            <div class="fw-800" style="color: #10b981; font-size: 1.1rem;">On-Demand
                                                Neural Link</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Highlight Cards -->
                        <div class="row g-4 mt-5 mb-5 pb-5 border-bottom"
                            style="border-color: rgba(255,255,255,0.05) !important;">
                            <div class="col-md-4">
                                <div class="p-4"
                                    style="background: rgba(255,255,255,0.02); border-radius: 20px; border: 1px solid rgba(255,255,255,0.05);">
                                    <div class="h3 fw-900 mb-3" style="color: #10b981;">32%</div>
                                    <p class="mb-0" style="color: #94a3b8; font-size: 0.9rem;">Average increase in net
                                        farmer revenue compared to traditional brokerage models.</p>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="p-4"
                                    style="background: rgba(255,255,255,0.02); border-radius: 20px; border: 1px solid rgba(255,255,255,0.05);">
                                    <div class="h3 fw-900 mb-3" style="color: #10b981;">Real-Time</div>
                                    <p class="mb-0" style="color: #94a3b8; font-size: 0.9rem;">Intelligence latency
                                        reduced from days to milliseconds across the supply chain.</p>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="p-4"
                                    style="background: rgba(255,255,255,0.02); border-radius: 20px; border: 1px solid rgba(255,255,255,0.05);">
                                    <div class="h3 fw-900 mb-3" style="color: #10b981;">Zero</div>
                                    <p class="mb-0" style="color: #94a3b8; font-size: 0.9rem;">Traceability gaps,
                                        ensuring 100% confidence for global export compliance.</p>
                                </div>
                            </div>
                        </div>

                        <!-- Scalable Intelligence Header -->
                        <div class="text-center mt-5 pt-5">
                            <div class="badge rounded-pill px-4 py-2 border mb-4"
                                style="background: rgba(16, 185, 129, 0.1); border-color: rgba(16, 185, 129, 0.3) !important; color: #10b981 !important; font-weight: 800; font-size: 13px; letter-spacing: 2px;">
                                SCALABLE INTELLIGENCE
                            </div>
                            <h2 class="display-4 fw-900 mb-2" id="pricing-tiers"
                                style="color: #ffffff; letter-spacing: -2px;">STRATEGIC
                                <span
                                    style="background: linear-gradient(135deg, #a855f7 0%, #3b82f6 100%); -webkit-background-clip: text; background-clip: text; -webkit-text-fill-color: transparent;">TIERS</span>
                            </h2>
                            <p class="lead mb-5 mx-auto" style="max-width: 650px; color: #94a3b8;">Select the
                                intelligence
                                level that matches your agricultural ambition. Role-specific protocols available for
                                Farmers
                                and Buyers.</p>

                            <div class="row g-4 justify-content-center">
                                <div class="col-lg-10">
                                    <div
                                        style="background: rgba(15, 23, 42, 0.4); backdrop-filter: blur(24px); -webkit-backdrop-filter: blur(24px); border: 1px solid rgba(255, 255, 255, 0.08); border-radius: 32px; padding: 60px; box-shadow: 0 40px 100px rgba(0,0,0,0.5); position: relative; overflow: hidden;">
                                        <div
                                            style="position: absolute; top: 0; left: 0; width: 100%; height: 2px; background: linear-gradient(90deg, transparent, rgba(16, 185, 129, 0.3), transparent);">
                                        </div>
                                        <div class="row align-items-center">
                                            <div class="col-md-7 text-start">
                                                <h3 class="fw-800 mb-3" style="color: #ffffff; font-size: 2rem;">
                                                    Protocol
                                                    Selection</h3>
                                                <p style="color: #94a3b8; font-size: 1.1rem; line-height: 1.6;">Our
                                                    ecosystem provides specialized plans for both agricultural producers
                                                    and
                                                    procurement agents. Access AI diagnostics, market prediction models,
                                                    and
                                                    supply chain automation.</p>
                                            </div>
                                            <div class="col-md-5 text-end">
                                                <a href="${pageContext.request.contextPath}/subscription"
                                                    class="btn px-5 py-3 rounded-pill fw-800"
                                                    style="background: linear-gradient(135deg, #10b981 0%, #06b6d4 100%); color: #ffffff; border: none; box-shadow: 0 10px 30px rgba(16, 185, 129, 0.3); transition: 0.3s; letter-spacing: 1px;">
                                                    VIEW ALL PLANS
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                </section>

                <!-- Neural Voice Interface -->
                <section class="py-5" id="voice-interface"
                    style="background: #020617; position: relative; border-top: 1px solid rgba(255,255,255,0.05);">
                    <div class="container py-5">
                        <div class="row justify-content-center">
                            <div class="col-lg-10">
                                <div
                                    style="background: rgba(15, 23, 42, 0.4); backdrop-filter: blur(24px); border: 1px solid rgba(16, 185, 129, 0.2); border-radius: 40px; padding: 80px 40px; text-align: center; position: relative; overflow: hidden;">
                                    <div
                                        style="position: absolute; top: -20%; left: -10%; width: 400px; height: 400px; background: radial-gradient(circle, rgba(59, 130, 246, 0.05) 0%, transparent 70%); pointer-events: none;">
                                    </div>

                                    <div class="voice-orb" id="voiceOrb" style="margin: 0 auto 40px;">
                                        <i class="fas fa-microphone"></i>
                                    </div>

                                    <div class="badge rounded-pill px-4 py-2 border mb-4"
                                        style="background: rgba(59, 130, 246, 0.1); border-color: rgba(59, 130, 246, 0.3) !important; color: #3b82f6 !important; font-weight: 800; font-size: 13px; letter-spacing: 2px;">
                                        NEURAL VOICE LINK
                                    </div>

                                    <h2 class="display-5 fw-900 mb-4" style="color: #ffffff; letter-spacing: -1px;">
                                        INITIALIZE <span style="color: #3b82f6;">AGRO-VOICE</span> COMMANDS
                                    </h2>

                                    <p class="lead mb-5 mx-auto" style="max-width: 700px; color: #94a3b8;">
                                        Experience the platform hands-free. Click the pulse above or use "Hey
                                        Agroplanter" to access market diagnostics, clinic advisory, and command center
                                        navigation using regional dialect processing.
                                    </p>

                                    <div id="voiceStatus"
                                        style="display: none; justify-content: center; align-items: center; gap: 15px;"
                                        class="mt-4">
                                        <div class="spinner-grow text-primary" role="status"></div>
                                        <span id="voiceText" class="fw-800 uppercase letter-spacing-2"
                                            style="color: #3b82f6;">AGROPLANTER LISTENING...</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- FAQ Section -->
                <section class="py-5" id="faq"
                    style="background: #020617; position: relative; border-top: 1px solid rgba(255,255,255,0.05);">
                    <div class="container py-5">
                        <div class="text-center mb-5">
                            <div class="badge rounded-pill px-4 py-2 border mb-4"
                                style="background: rgba(16, 185, 129, 0.1); border-color: rgba(16, 185, 129, 0.3) !important; color: #10b981 !important; font-weight: 800; font-size: 13px; text-transform: uppercase;">
                                KNOWLEDGE BASE
                            </div>
                            <h2 class="display-4 fw-900 mb-4" style="color: #ffffff;">STRATEGIC <span
                                    style="color: #10b981;">FAQ</span></h2>
                            <p class="lead mx-auto" style="max-width: 700px; color: #94a3b8;">
                                Everything you need to know about the AGROPLANTER ecosystem and our mission to digitize
                                the global harvest.
                            </p>
                        </div>

                        <div class="row justify-content-center">
                            <div class="col-lg-10">
                                <div class="accordion accordion-flush" id="faqAccordion">
                                    <style>
                                        .faq-glass-item {
                                            background: rgba(15, 23, 42, 0.4) !important;
                                            backdrop-filter: blur(20px);
                                            border: 1px solid rgba(255, 255, 255, 0.05) !important;
                                            border-radius: 20px !important;
                                            margin-bottom: 15px;
                                            overflow: hidden;
                                        }

                                        .accordion-button {
                                            background: transparent !important;
                                            color: #ffffff !important;
                                            font-weight: 700;
                                            padding: 25px 30px;
                                            box-shadow: none !important;
                                        }

                                        .accordion-button:not(.collapsed) {
                                            color: #10b981 !important;
                                            border-bottom: 1px solid rgba(255, 255, 255, 0.05);
                                        }

                                        .accordion-button:hover {
                                            color: #10b981 !important;
                                        }

                                        .accordion-button::after {
                                            filter: brightness(0) invert(1);
                                        }

                                        .accordion-body {
                                            background: transparent !important;
                                            color: #94a3b8 !important;
                                            padding: 30px;
                                            line-height: 1.8;
                                            font-size: 1.05rem;
                                        }
                                    </style>

                                    <!-- FAQ 1 -->
                                    <div class="accordion-item faq-glass-item">
                                        <h2 class="accordion-header">
                                            <button class="accordion-button collapsed" type="button"
                                                data-bs-toggle="collapse" data-bs-target="#faq1">
                                                WHAT IS THE CORE PURPOSE OF AGROPLANTER?
                                            </button>
                                        </h2>
                                        <div id="faq1" class="accordion-collapse collapse"
                                            data-bs-parent="#faqAccordion">
                                            <div class="accordion-body">
                                                AGROPLANTER is an AI-driven decentralized agricultural platform designed
                                                to bridge the gap between rural producers and global consumers. By
                                                leveraging satellite telemetry, blockchain transparency, and AI-powered
                                                logistics, we eliminate unnecessary intermediaries to increase farmer
                                                revenue and consumer food security.
                                            </div>
                                        </div>
                                    </div>

                                    <!-- FAQ 2 -->
                                    <div class="accordion-item faq-glass-item">
                                        <h2 class="accordion-header">
                                            <button class="accordion-button collapsed" type="button"
                                                data-bs-toggle="collapse" data-bs-target="#faq2">
                                                HOW DO AI DIAGNOSTICS PROTECT MY CROPS?
                                            </button>
                                        </h2>
                                        <div id="faq2" class="accordion-collapse collapse"
                                            data-bs-parent="#faqAccordion">
                                            <div class="accordion-body">
                                                Our "Neural Pulse" engine analyzes real-time field data, including soil
                                                moisture, nutrient levels, and satellite-detected thermal variations. It
                                                provides predictive alerts for pest infestations and biological threats
                                                up to 48 hours before they become visible to the naked eye, allowing for
                                                targeted, cost-effective intervention.
                                            </div>
                                        </div>
                                    </div>

                                    <!-- FAQ 3 -->
                                    <div class="accordion-item faq-glass-item">
                                        <h2 class="accordion-header">
                                            <button class="accordion-button collapsed" type="button"
                                                data-bs-toggle="collapse" data-bs-target="#faq3">
                                                IS MY DATA AND TRADE HISTORY SECURE?
                                            </button>
                                        </h2>
                                        <div id="faq3" class="accordion-collapse collapse"
                                            data-bs-parent="#faqAccordion">
                                            <div class="accordion-body">
                                                Absolute security is non-negotiable. Every transaction, quality
                                                certificate, and supply chain movement is hashed and recorded on our
                                                private blockchain. Combined with AES-256 military-grade encryption for
                                                personal data, we ensure that your trade history is immutable and
                                                protected from unauthorized access.
                                            </div>
                                        </div>
                                    </div>

                                    <!-- FAQ 4 -->
                                    <div class="accordion-item faq-glass-item">
                                        <h2 class="accordion-header">
                                            <button class="accordion-button collapsed" type="button"
                                                data-bs-toggle="collapse" data-bs-target="#faq4">
                                                CAN I USE THE PLATFORM WITHOUT SMART HARDWARE?
                                            </button>
                                        </h2>
                                        <div id="faq4" class="accordion-collapse collapse"
                                            data-bs-parent="#faqAccordion">
                                            <div class="accordion-body">
                                                Yes. While our IoT integrations provide the highest fidelity data, you
                                                can still access market dynamics, direct-to-consumer trading, and our
                                                Bio-Clinic advisory through any smartphone or local common service
                                                center. Our "Regional Voice AI" is also optimized to assist users in
                                                their native dialects.
                                            </div>
                                        </div>
                                    </div>

                                    <!-- FAQ 5 -->
                                    <div class="accordion-item faq-glass-item">
                                        <h2 class="accordion-header">
                                            <button class="accordion-button collapsed" type="button"
                                                data-bs-toggle="collapse" data-bs-target="#faq5">
                                                HOW DO I UPGRADE TO A STRATEGIC TIER?
                                            </button>
                                        </h2>
                                        <div id="faq5" class="accordion-collapse collapse"
                                            data-bs-parent="#faqAccordion">
                                            <div class="accordion-body">
                                                Once logged into your Command Center, navigate to the 'Security and
                                                Protocols' section to view available strategic plans. You can also visit
                                                our <a href="#pricing-tiers"
                                                    style="color: #10b981; text-decoration: none;">Strategic Tiers</a>
                                                section on this page to compare the features of Basic, Professional, and
                                                Enterprise protocols.
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- Newsletter Subscription -->
                <section class="py-5" id="ecosystem"
                    style="background: #020617; position: relative; overflow: hidden; border-top: 1px solid rgba(255,255,255,0.05);">
                    <div
                        style="position: absolute; bottom: -20%; right: -10%; width: 400px; height: 400px; background: radial-gradient(circle, rgba(16, 185, 129, 0.05) 0%, transparent 70%); pointer-events: none;">
                    </div>

                    <div class="container py-5 text-center" style="position: relative; z-index: 1;">
                        <div class="row justify-content-center">
                            <div class="col-lg-8">
                                <h2 class="fw-900 mb-4" style="color: #ffffff; letter-spacing: -1px;">CONNECT TO THE
                                    <span
                                        style="background: linear-gradient(135deg, #10b981 0%, #34d399 100%); -webkit-background-clip: text; background-clip: text; -webkit-text-fill-color: transparent;">NEURAL
                                        PULSE</span>
                                </h2>
                                <p class="mb-5 lead" style="color: #94a3b8;">Join 100,000+ modern farmers receiving
                                    weekly AI agricultural insights directly to their inbox.</p>

                                <form class="d-flex gap-3 flex-column flex-md-row justify-content-center mx-auto"
                                    id="pulseForm" style="max-width: 600px;">
                                    <input type="email" id="pulseEmail" class="form-control px-4 text-white"
                                        placeholder="Enter your encrypted email address" required
                                        style="height: 60px; background: rgba(15, 23, 42, 0.6); border: 1px solid rgba(255, 255, 255, 0.1); border-radius: 30px; backdrop-filter: blur(10px);">
                                    <button type="submit" class="btn px-5 rounded-pill fw-800"
                                        style="background: linear-gradient(135deg, #10b981 0%, #06b6d4 100%); color: #ffffff; border: none; box-shadow: 0 10px 30px rgba(16, 185, 129, 0.3); transition: 0.3s; height: 60px; min-width: 200px;">
                                        LINK TO PULSE
                                    </button>
                                </form>
                                <div id="pulseStatus" class="mt-4 fw-800 x-small uppercase letter-spacing-2"
                                    style="display: none; color: #10b981;">
                                    ⚡ ENCRYPTED CONNECTION ESTABLISHED. SUBSCRIBED TO NEURAL PULSE.
                                </div>
                                <p class="mt-4 x-small" style="color: #64748b; letter-spacing: 1px;">AES-256 PROTECTED.
                                    NO SPAM, ONLY INTELLIGENCE.</p>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- Footer Premium (Included Component) -->
                <jsp:include page="footer.jsp" />



                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/voice-assistant.css" />
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                <script src="${pageContext.request.contextPath}/js/agroplanter-ui.js"></script>
                <script src="${pageContext.request.contextPath}/js/voice-assistant.js"></script>
                <script>
                    window.AgroplanterContext = "${pageContext.request.contextPath}";
                    const orb = document.getElementById('voiceOrb');
                    if (orb) {
                        orb.onclick = (e) => {
                            e.preventDefault();

                            // Check for obvious signs of login before forcing a redirect
                            const hasSessionUI = document.querySelector('.user-identity') ||
                                document.querySelector('.avatar-box') ||
                                document.body.innerText.includes('COMMAND CENTER') ||
                                document.body.innerText.includes('LOGOUT');

                            if (window.agriVoice) {
                                window.agriVoice.toggle();
                            } else if (hasSessionUI || window.AgroplanterUser) {
                                console.log("Voice assistant initializing, please wait...");
                                // If we see UI tokens but agriVoice is not ready, give it a second
                                setTimeout(() => { if (window.agriVoice) window.agriVoice.toggle(); }, 500);
                            } else {
                                window.location.href = window.AgroplanterContext + '/login';
                            }
                        };
                    }

                    // Pulse Form Logic
                    const pulseForm = document.getElementById('pulseForm');
                    if (pulseForm) {
                        pulseForm.onsubmit = (e) => {
                            e.preventDefault();
                            const status = document.getElementById('pulseStatus');
                            status.style.display = 'block';
                            pulseForm.style.opacity = '0.5';
                            pulseForm.style.pointerEvents = 'none';
                            document.getElementById('pulseEmail').value = '';
                        };
                    }
                </script>
            </body>

            </html>