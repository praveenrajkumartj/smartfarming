<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>Help Center & Support | AGROPLANTER</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                <link rel="icon"
                    href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>❓</text></svg>" />
                <style>
                    :root {
                        --primary-glow: #16a34a;
                        --secondary-glow: #0ea5e9;
                        --accent-glow: #8b5cf6;
                    }

                    html {
                        scroll-behavior: smooth;
                    }

                    body {
                        background: #020617;
                        color: #f8fafc;
                        overflow-x: hidden;
                        font-family: 'Outfit', sans-serif;
                        min-height: 100vh;
                        display: flex;
                        flex-direction: column;
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

                    .brand-premium {
                        font-size: 24px;
                        font-weight: 900;
                        letter-spacing: -1px;
                        background: linear-gradient(135deg, #10b981, #3b82f6);
                        -webkit-background-clip: text;
                        background-clip: text;
                        -webkit-text-fill-color: transparent;
                    }

                    .hero-premium {
                        position: relative;
                        background: url('${pageContext.request.contextPath}/images/hero-landscape.png') no-repeat center center;
                        background-size: cover;
                        padding: 100px 0 120px;
                        text-align: center;
                    }

                    .hero-premium::before {
                        content: '';
                        position: absolute;
                        inset: 0;
                        background: linear-gradient(180deg, rgba(2, 6, 23, 0.8) 0%, rgba(2, 6, 23, 1) 100%);
                        z-index: 1;
                    }

                    .hero-content {
                        position: relative;
                        z-index: 2;
                    }

                    .hero-headline {
                        font-size: clamp(2.5rem, 6vw, 4rem);
                        font-weight: 900;
                        line-height: 1.1;
                        letter-spacing: -2px;
                        margin-bottom: 1.5rem;
                        animation: slideUp 0.8s cubic-bezier(0.16, 1, 0.3, 1);
                    }

                    .hero-subtext {
                        font-size: 1.25rem;
                        color: #94a3b8;
                        max-width: 600px;
                        margin: 0 auto 2.5rem;
                        line-height: 1.6;
                        animation: slideUp 1s cubic-bezier(0.16, 1, 0.3, 1);
                    }

                    .search-container {
                        max-width: 650px;
                        margin: 0 auto;
                        position: relative;
                        animation: slideUp 1.2s cubic-bezier(0.16, 1, 0.3, 1);
                    }

                    .search-container input {
                        width: 100%;
                        padding: 20px 30px 20px 60px;
                        border-radius: 100px;
                        background: rgba(30, 41, 59, 0.6);
                        border: 1px solid rgba(255, 255, 255, 0.1);
                        color: white;
                        font-size: 1.1rem;
                        backdrop-filter: blur(10px);
                        transition: all 0.3s ease;
                    }

                    .search-container input:focus {
                        outline: none;
                        border-color: var(--primary-glow);
                        box-shadow: 0 0 30px rgba(22, 163, 74, 0.2);
                        background: rgba(30, 41, 59, 0.8);
                    }

                    .search-container input::placeholder {
                        color: #64748b;
                    }

                    .search-container .search-icon {
                        position: absolute;
                        left: 25px;
                        top: 50%;
                        transform: translateY(-50%);
                        color: #64748b;
                        font-size: 1.2rem;
                    }

                    .card-premium {
                        background: rgba(30, 41, 59, 0.4);
                        border: 1px solid rgba(255, 255, 255, 0.05);
                        backdrop-filter: blur(10px);
                        border-radius: 24px;
                        padding: 40px;
                        transition: 0.4s;
                        height: 100%;
                        display: flex;
                        flex-direction: column;
                    }

                    .card-premium:hover {
                        background: rgba(30, 41, 59, 0.7);
                        border-color: var(--primary-glow);
                        transform: translateY(-5px);
                        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
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
                        border: 1px solid rgba(16, 185, 129, 0.2);
                    }

                    .read-articles-btn {
                        background: none;
                        border: none;
                        color: var(--primary-glow);
                        font-weight: 700;
                        padding: 0;
                        display: flex;
                        align-items: center;
                        gap: 8px;
                        margin-top: auto;
                        transition: 0.3s;
                    }

                    .read-articles-btn:hover {
                        color: #22c55e;
                        transform: translateX(5px);
                    }

                    .article-content {
                        display: none;
                        margin-top: 20px;
                        padding-top: 20px;
                        border-top: 1px solid rgba(255, 255, 255, 0.1);
                    }

                    .article-content.active {
                        display: block;
                        animation: fadeIn 0.4s ease;
                    }

                    .article-item {
                        padding: 12px 0;
                        color: #e2e8f0;
                        cursor: pointer;
                        transition: 0.3s;
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        font-weight: 500;
                        border-bottom: 1px solid rgba(255, 255, 255, 0.03);
                    }

                    .article-item:last-child {
                        border-bottom: none;
                    }

                    .article-item:hover {
                        color: var(--primary-glow);
                    }

                    .article-item i {
                        font-size: 0.8rem;
                        color: #64748b;
                        transition: 0.3s;
                    }

                    .article-item.open i {
                        transform: rotate(180deg);
                        color: var(--primary-glow);
                    }

                    .article-answer {
                        display: none;
                        padding: 15px 20px;
                        background: rgba(15, 23, 42, 0.6);
                        border-left: 3px solid var(--primary-glow);
                        margin: 5px 0 15px;
                        font-size: 0.95rem;
                        color: #94a3b8;
                        line-height: 1.6;
                        border-radius: 0 8px 8px 0;
                    }

                    .article-answer.open {
                        display: block;
                        animation: fadeIn 0.4s ease;
                    }

                    .btn-premium {
                        padding: 16px 36px;
                        border-radius: 100px;
                        font-weight: 800;
                        letter-spacing: 1px;
                        font-size: 14px;
                        transition: 0.4s;
                        position: relative;
                        overflow: hidden;
                        border: none;
                        text-transform: uppercase;
                    }

                    .btn-glow {
                        background: linear-gradient(135deg, var(--primary-glow), var(--secondary-glow));
                        color: white;
                        box-shadow: 0 0 20px rgba(16, 185, 129, 0.3);
                    }

                    .btn-glow:hover {
                        transform: scale(1.05);
                        box-shadow: 0 0 40px rgba(16, 185, 129, 0.5);
                        color: white;
                    }

                    /* Support CTA Section */
                    .support-cta {
                        background: rgba(30, 41, 59, 0.3);
                        border: 1px dashed rgba(255, 255, 255, 0.1);
                        border-radius: 24px;
                        padding: 50px;
                        text-align: center;
                        margin: 60px auto;
                        max-width: 800px;
                    }

                    /* AI Chat Widget */
                    .chat-widget-btn {
                        position: fixed;
                        bottom: 30px;
                        right: 30px;
                        width: 64px;
                        height: 64px;
                        background: linear-gradient(135deg, var(--primary-glow), var(--secondary-glow));
                        border-radius: 50%;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        font-size: 24px;
                        color: white;
                        box-shadow: 0 10px 30px rgba(16, 185, 129, 0.4);
                        cursor: pointer;
                        z-index: 9999;
                        transition: 0.3s;
                        border: 1px solid rgba(255, 255, 255, 0.2);
                        animation: float 3s ease-in-out infinite;
                    }

                    @keyframes float {

                        0%,
                        100% {
                            transform: translateY(0);
                        }

                        50% {
                            transform: translateY(-10px);
                        }
                    }

                    .chat-widget-btn:hover {
                        transform: scale(1.1) rotate(5deg);
                        box-shadow: 0 15px 40px rgba(16, 185, 129, 0.6);
                    }

                    .chat-window {
                        position: fixed;
                        bottom: 110px;
                        right: 30px;
                        width: 380px;
                        max-width: calc(100vw - 40px);
                        background: rgba(15, 23, 42, 0.95);
                        backdrop-filter: blur(20px);
                        border: 1px solid rgba(255, 255, 255, 0.1);
                        border-radius: 24px;
                        box-shadow: 0 20px 50px rgba(0, 0, 0, 0.5);
                        z-index: 10000;
                        display: none;
                        flex-direction: column;
                        overflow: hidden;
                        opacity: 0;
                        transform: translateY(20px);
                        transition: opacity 0.4s cubic-bezier(0.16, 1, 0.3, 1), transform 0.4s cubic-bezier(0.16, 1, 0.3, 1);
                    }

                    .chat-window.open {
                        display: flex;
                        opacity: 1;
                        transform: translateY(0);
                    }

                    .chat-header {
                        background: rgba(255, 255, 255, 0.05);
                        padding: 20px;
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        border-bottom: 1px solid rgba(255, 255, 255, 0.05);
                    }

                    .chat-title {
                        color: white;
                        font-weight: 700;
                        display: flex;
                        align-items: center;
                        gap: 12px;
                        font-size: 1.1rem;
                    }

                    .ai-avatar {
                        width: 36px;
                        height: 36px;
                        background: linear-gradient(135deg, var(--primary-glow), var(--secondary-glow));
                        border-radius: 50%;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        font-size: 16px;
                    }

                    .chat-close {
                        color: #94a3b8;
                        cursor: pointer;
                        background: transparent;
                        border: none;
                        font-size: 1.5rem;
                        transition: 0.3s;
                    }

                    .chat-close:hover {
                        color: white;
                        transform: rotate(90deg);
                    }

                    .chat-body {
                        height: 400px;
                        padding: 24px;
                        overflow-y: auto;
                        display: flex;
                        flex-direction: column;
                        gap: 16px;
                    }

                    .chat-message {
                        max-width: 85%;
                        padding: 14px 18px;
                        border-radius: 16px;
                        font-size: 0.95rem;
                        line-height: 1.5;
                        animation: slideIn 0.3s ease forwards;
                    }

                    .chat-message.bot {
                        background: rgba(30, 41, 59, 0.8);
                        color: #f8fafc;
                        align-self: flex-start;
                        border-bottom-left-radius: 4px;
                        border: 1px solid rgba(255, 255, 255, 0.05);
                    }

                    .chat-message.user {
                        background: linear-gradient(135deg, var(--primary-glow), var(--secondary-glow));
                        color: white;
                        align-self: flex-end;
                        border-bottom-right-radius: 4px;
                    }

                    .chat-input-area {
                        padding: 20px;
                        background: rgba(15, 23, 42, 1);
                        border-top: 1px solid rgba(255, 255, 255, 0.05);
                        display: flex;
                        gap: 12px;
                    }

                    .chat-input-area input {
                        flex: 1;
                        padding: 14px 20px;
                        border-radius: 100px;
                        border: 1px solid rgba(255, 255, 255, 0.1);
                        background: rgba(30, 41, 59, 0.5);
                        color: white;
                        outline: none;
                        font-size: 0.95rem;
                        transition: 0.3s;
                    }

                    .chat-input-area input:focus {
                        border-color: var(--primary-glow);
                        background: rgba(30, 41, 59, 0.8);
                    }

                    .chat-input-area button {
                        background: linear-gradient(135deg, var(--primary-glow), var(--secondary-glow));
                        color: white;
                        border: none;
                        width: 48px;
                        height: 48px;
                        border-radius: 50%;
                        cursor: pointer;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        transition: 0.3s;
                        box-shadow: 0 4px 15px rgba(16, 185, 129, 0.3);
                    }

                    .chat-input-area button:hover {
                        transform: scale(1.05);
                        box-shadow: 0 6px 20px rgba(16, 185, 129, 0.5);
                    }

                    .typing-indicator {
                        display: none;
                        align-items: center;
                        gap: 5px;
                        padding: 12px 18px;
                        background: rgba(30, 41, 59, 0.8);
                        align-self: flex-start;
                        border-radius: 16px;
                        border-bottom-left-radius: 4px;
                        border: 1px solid rgba(255, 255, 255, 0.05);
                        width: fit-content;
                    }

                    .typing-dot {
                        width: 6px;
                        height: 6px;
                        background: var(--primary-glow);
                        border-radius: 50%;
                        animation: typing 1.4s infinite ease-in-out both;
                    }

                    .typing-dot:nth-child(1) {
                        animation-delay: -0.32s;
                    }

                    .typing-dot:nth-child(2) {
                        animation-delay: -0.16s;
                    }

                    @keyframes typing {

                        0%,
                        80%,
                        100% {
                            transform: scale(0.5);
                            opacity: 0.3;
                        }

                        40% {
                            transform: scale(1);
                            opacity: 1;
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

                    @keyframes slideIn {
                        from {
                            opacity: 0;
                            transform: translateY(10px);
                        }

                        to {
                            opacity: 1;
                            transform: translateY(0);
                        }
                    }

                    @keyframes fadeIn {
                        from {
                            opacity: 0;
                        }

                        to {
                            opacity: 1;
                        }
                    }

                    ::-webkit-scrollbar {
                        width: 6px;
                    }

                    ::-webkit-scrollbar-track {
                        background: transparent;
                    }

                    ::-webkit-scrollbar-thumb {
                        background: rgba(255, 255, 255, 0.1);
                        border-radius: 10px;
                    }

                    ::-webkit-scrollbar-thumb:hover {
                        background: rgba(255, 255, 255, 0.2);
                    }

                    /* Make main content stretch so footer pushes to bottom */
                    main {
                        flex: 1;
                    }
                </style>
            </head>

            <body>
                <header class="nav-glass d-flex justify-content-between align-items-center">
                    <a href="${pageContext.request.contextPath}/"
                        class="text-decoration-none d-flex align-items-center gap-3">
                        <div class="brand-icon-box"><i class="fas fa-leaf"></i></div>
                            style="height: 32px; border-radius: 8px;">
                        <span class="brand-premium">AGROPLANTER <span class="text-white opacity-50">V3.0</span></span>
                    </a>
                    <div class="d-none d-md-flex gap-4 align-items-center">
                        <a href="${pageContext.request.contextPath}/"
                            class="btn btn-outline-light rounded-pill px-4 btn-sm"><i
                                class="fas fa-arrow-left me-2"></i> COMMAND CENTER</a>
                    </div>
                </header>

                <main>
                    <section class="hero-premium">
                        <div class="container hero-content">
                            <div class="badge rounded-pill px-4 py-2 border mb-4"
                                style="background: rgba(14, 165, 233, 0.1); border-color: rgba(14, 165, 233, 0.3) !important; color: #38bdf8 !important; font-weight: 800; font-size: 13px; letter-spacing: 1px;">
                                INTELLIGENT SUPPORT PROTOCOL
                            </div>
                            <h1 class="hero-headline">HOW CAN WE <span style="color: var(--secondary-glow)">HELP
                                    YOU?</span></h1>
                            <p class="hero-subtext">Access our neural knowledge base or interact with our AI support
                                agent to resolve issues, configure modules, and optimize your agricultural strategy.</p>

                            <div class="search-container">
                                <i class="fas fa-search search-icon"></i>
                                <input type="text" id="searchInput"
                                    placeholder="Search for 'disease detection', 'market prices', 'login'..."
                                    onkeyup="filterArticles()" />
                            </div>
                        </div>
                    </section>

                    <section class="container"
                        style="margin-top: -60px; position: relative; z-index: 10; margin-bottom: 80px;">
                        <div class="row g-4 justify-content-center" id="helpGrid">

                            <!-- Card 1 -->
                            <div class="col-md-4">
                                <div class="card-premium searchable">
                                    <div class="feature-icon-premium" style="color: #3b82f6;">
                                        <i class="fas fa-fingerprint"></i>
                                    </div>
                                    <h4 class="fw-bold mb-3">Identity & Access</h4>
                                    <p class="text-white-50 small mb-4 flex-grow-1">Troubleshoot authentication
                                        protocols, password resets, and ecosystem role configurations (Farmer, Buyer,
                                        Admin).</p>

                                    <button class="read-articles-btn" onclick="toggleArticles('acc-articles', this)">
                                        <span>View Protocols</span> <i class="fas fa-chevron-down ms-1"></i>
                                    </button>

                                    <div class="article-content" id="acc-articles">
                                        <div class="article-item" onclick="toggleAnswer('ans1', this)">
                                            <span>Password Reset Protocol</span> <i class="fas fa-chevron-down"></i>
                                        </div>
                                        <div class="article-answer" id="ans1">
                                            Navigate to the Secure Login interface and select 'Key Recovery'. The system
                                            will generate a cryptographic reset link via your registered comms channel.
                                        </div>

                                        <div class="article-item" onclick="toggleAnswer('ans2', this)">
                                            <span>Ecosystem Roles Explained</span> <i class="fas fa-chevron-down"></i>
                                        </div>
                                        <div class="article-answer" id="ans2">
                                            <strong>Farmer:</strong> Full access to AI diagnostics, telemetry, and
                                            marketplace distribution.<br><br>
                                            <strong>Buyer:</strong> Market intelligence access, procurement
                                            capabilities, and automated farmer liaison.<br><br>
                                            <strong>Admin:</strong> Command center override, system health monitoring,
                                            and neural network reinforcement.
                                        </div>

                                        <div class="article-item" onclick="toggleAnswer('ans3', this)">
                                            <span>Role Reconfiguration</span> <i class="fas fa-chevron-down"></i>
                                        </div>
                                        <div class="article-answer" id="ans3">
                                            For security reasons, primary identity roles cannot be dynamically swapped
                                            once initialized. You must register a secondary systemic identity to access
                                            alternate ecosystem features.
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Card 2 -->
                            <div class="col-md-4">
                                <div class="card-premium searchable">
                                    <div class="feature-icon-premium" style="color: #10b981;">
                                        <i class="fas fa-microscope"></i>
                                    </div>
                                    <h4 class="fw-bold mb-3">Bio-Diagnostic AI</h4>
                                    <p class="text-white-50 small mb-4 flex-grow-1">Optimize your usage of the neural
                                        visual engine for accurate plant pathogen identification and treatment.</p>

                                    <button class="read-articles-btn" onclick="toggleArticles('ai-articles', this)">
                                        <span>View Protocols</span> <i class="fas fa-chevron-down ms-1"></i>
                                    </button>

                                    <div class="article-content" id="ai-articles">
                                        <div class="article-item" onclick="toggleAnswer('ans4', this)">
                                            <span>Optimal Image Capture</span> <i class="fas fa-chevron-down"></i>
                                        </div>
                                        <div class="article-answer" id="ans4">
                                            For maximum AI precision, ensure optimal photon levels (natural light),
                                            isolate the infected tissue against a neutral background, and maintain
                                            visual stability during capture.
                                        </div>

                                        <div class="article-item" onclick="toggleAnswer('ans5', this)">
                                            <span>Confidence Metrics (>80%)</span> <i class="fas fa-chevron-down"></i>
                                        </div>
                                        <div class="article-answer" id="ans5">
                                            A high confidence score indicates definitive neural agreement on the
                                            pathogen. Metrics falling below the threshold will automatically route to
                                            human biological experts.
                                        </div>

                                        <div class="article-item" onclick="toggleAnswer('ans7', this)">
                                            <span>Actionable Treatments</span> <i class="fas fa-chevron-down"></i>
                                        </div>
                                        <div class="article-answer" id="ans7">
                                            The engine formulates dual-pathway solutions: biochemical applications
                                            (commercial) and ecological (organic) remediation strategies tailored to
                                            your specific zone.
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Card 3 -->
                            <div class="col-md-4">
                                <div class="card-premium searchable">
                                    <div class="feature-icon-premium" style="color: #8b5cf6;">
                                        <i class="fas fa-chart-line"></i>
                                    </div>
                                    <h4 class="fw-bold mb-3">Market Intelligence</h4>
                                    <p class="text-white-50 small mb-4 flex-grow-1">Understand the data pipelines
                                        driving Mandi prices, volatile forecasting, and secure global trade network.</p>

                                    <button class="read-articles-btn" onclick="toggleArticles('market-articles', this)">
                                        <span>View Protocols</span> <i class="fas fa-chevron-down ms-1"></i>
                                    </button>

                                    <div class="article-content" id="market-articles">
                                        <div class="article-item" onclick="toggleAnswer('ans8', this)">
                                            <span>Algorithmic Refresh Rates</span> <i class="fas fa-chevron-down"></i>
                                        </div>
                                        <div class="article-answer" id="ans8">
                                            Market telemetry is synchronized at high frequencies with national
                                            agricultural exchange nodes, delivering sub-minute accuracy for your exact
                                            coordinate district.
                                        </div>

                                        <div class="article-item" onclick="toggleAnswer('ans9', this)">
                                            <span>Optimizing Trade Listings</span> <i class="fas fa-chevron-down"></i>
                                        </div>
                                        <div class="article-answer" id="ans9">
                                            Enhance liquidity by providing high-res media, establishing competitive
                                            price structures relative to the AI median curve, and guaranteeing
                                            transparent volume metrics.
                                        </div>

                                        <div class="article-item" onclick="toggleAnswer('ans10', this)">
                                            <span>P2P Logistics & Negotiation</span> <i class="fas fa-chevron-down"></i>
                                        </div>
                                        <div class="article-answer" id="ans10">
                                            Trade execution is decentralized. Verified buyers will initialize encrypted
                                            communication via your registered channel to finalize mass transit and
                                            compensation protocols.
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="support-cta">
                            <i class="fas fa-headset mb-4" style="font-size: 3rem; color: #94a3b8;"></i>
                            <h2 class="fw-bold mb-3">REQUIRE HUMAN INTERVENTION?</h2>
                            <p class="text-white-50 mb-4 mx-auto" style="max-width: 500px;">If the automated protocols
                                are insufficient, our elite tier 2 systemic engineers are synchronized and ready to
                                assist.</p>
                            <a href="${pageContext.request.contextPath}/contact"
                                class="btn btn-premium btn-glow">INITIALIZE HUMAN CONTACT</a>
                        </div>
                    </section>
                </main>

                <!-- AI Chatbot Widget -->
                <div class="chat-widget-btn" onclick="toggleChat()">
                    <i class="fas fa-robot"></i>
                </div>

                <div class="chat-window" id="chatWindow">
                    <div class="chat-header">
                        <div class="chat-title">
                            <div class="ai-avatar"><i class="fas fa-robot text-white"></i></div>
                            <span>Neural Assistant</span>
                        </div>
                        <button class="chat-close" onclick="toggleChat()"><i class="fas fa-times"></i></button>
                    </div>
                    <div class="chat-body" id="chatBody">
                        <div class="chat-message bot">
                            System initialized. I am your AGROPLANTER Neural operative. Query me on diagnostics,
                            telemetry, or network navigation.
                        </div>
                        <div class="typing-indicator" id="typingIndicator">
                            <div class="typing-dot"></div>
                            <div class="typing-dot"></div>
                            <div class="typing-dot"></div>
                        </div>
                    </div>
                    <div class="chat-input-area">
                        <input type="text" id="chatInput" placeholder="Input query parameters..."
                            onkeypress="handleKeyPress(event)" />
                        <button onclick="sendMessage()"><i class="fas fa-paper-plane"></i></button>
                    </div>
                </div>

                <jsp:include page="footer.jsp" />

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                <script>
                    // Article Toggle Logic
                    function toggleArticles(id, btn) {
                        const content = document.getElementById(id);
                        const icon = btn.querySelector('i');
                        if (content.classList.contains('active')) {
                            content.classList.remove('active');
                            icon.classList.remove('fa-chevron-up');
                            icon.classList.add('fa-chevron-down');
                        } else {
                            content.classList.add('active');
                            icon.classList.remove('fa-chevron-down');
                            icon.classList.add('fa-chevron-up');
                        }
                    }

                    // Search Filter Logic
                    function filterArticles() {
                        const input = document.getElementById('searchInput').value.toLowerCase();
                        const cards = document.querySelectorAll('.searchable');

                        cards.forEach(card => {
                            const text = card.textContent.toLowerCase();
                            if (text.includes(input)) {
                                card.style.display = 'flex'; // Keep flex layout for card
                                // UX Enhancement: Auto-expand the articles if there is search text
                                const content = card.querySelector('.article-content');
                                const icon = card.querySelector('.read-articles-btn i');
                                if (input.length > 2) {
                                    content.classList.add('active');
                                    icon.classList.remove('fa-chevron-down');
                                    icon.classList.add('fa-chevron-up');
                                } else if (input.length === 0) {
                                    content.classList.remove('active');
                                    icon.classList.remove('fa-chevron-up');
                                    icon.classList.add('fa-chevron-down');

                                    // Collapse answers
                                    const answers = card.querySelectorAll('.article-answer');
                                    const itemIcons = card.querySelectorAll('.article-item');
                                    answers.forEach(ans => ans.classList.remove('open'));
                                    itemIcons.forEach(item => item.classList.remove('open'));
                                }
                            } else {
                                card.style.display = 'none';
                            }
                        });
                    }

                    function toggleAnswer(id, element) {
                        const answer = document.getElementById(id);
                        if (answer.classList.contains('open')) {
                            answer.classList.remove('open');
                            element.classList.remove('open');
                        } else {
                            answer.classList.add('open');
                            element.classList.add('open');
                        }
                    }

                    // Chatbot Logic
                    const chatWindow = document.getElementById('chatWindow');
                    const chatBody = document.getElementById('chatBody');
                    const chatInput = document.getElementById('chatInput');
                    const typingIndicator = document.getElementById('typingIndicator');

                    let isChatOpen = false;

                    function toggleChat() {
                        isChatOpen = !isChatOpen;
                        if (isChatOpen) {
                            chatWindow.classList.add('open');
                            setTimeout(() => chatInput.focus(), 300);
                        } else {
                            chatWindow.classList.remove('open');
                        }
                    }

                    function handleKeyPress(event) {
                        if (event.key === 'Enter') {
                            sendMessage();
                        }
                    }

                    function sendMessage() {
                        const messageText = chatInput.value.trim();
                        if (messageText === '') return;

                        addMessage(messageText, 'user');
                        chatInput.value = '';

                        chatBody.appendChild(typingIndicator);
                        typingIndicator.style.display = 'flex';
                        chatBody.scrollTop = chatBody.scrollHeight;

                        setTimeout(() => {
                            let response = generateBotResponse(messageText.toLowerCase());
                            typingIndicator.style.display = 'none';
                            addMessage(response, 'bot');
                        }, 1000 + Math.random() * 800);
                    }

                    function addMessage(text, sender) {
                        const msgDiv = document.createElement('div');
                        msgDiv.classList.add('chat-message', sender);
                        msgDiv.textContent = text;
                        chatBody.insertBefore(msgDiv, typingIndicator);
                        chatBody.scrollTop = chatBody.scrollHeight;
                    }

                    function generateBotResponse(text) {
                        if (text.match(/\b(hi|hello|hey|system|init)\b/)) {
                            return "Protocol acknowledged. Accessing agricultural databanks. Query me on market volatility, diagnostic imaging, or platform traversal.";
                        } else if (text.match(/\b(password|login|account|register|role)\b/)) {
                            return "Identity management protocols are strictly enforced. Visit the Secure Login gateway for automated recovery options. Roles are immutable post-registration.";
                        } else if (text.match(/\b(disease|sick|spot|fungus|wilt|rust|health)\b/)) {
                            return "Biological threat detected pattern match. Initiate the Bio-Diagnostic engine with high-res optical input. You will receive an immediate probability matrix for the pathogen and counter-measures.";
                        } else if (text.match(/\b(price|mandi|market|sell|cost|buy)\b/)) {
                            return "The intelligence grid actively tracks Mandi economic data. Utilize the Market Intelligence dashboard to cross-reference real-time regional liquidity.";
                        } else if (text.match(/\b(weather|temperature|humidity|rain)\b/)) {
                            return "Atmospheric anomalies highly correlate with fungal propagation. Maintain active monitoring of the Weather Intel module for your registered geofence.";
                        } else if (text.match(/\b(admin|support|contact|human)\b/)) {
                            return "Escalation requested. High-level organic intelligence is accessible via the 'Initialize Human Contact' protocol under the Support CTA. Standby for human operative.";
                        } else {
                            return "Query parameters unparseable. Please refine inputs (e.g., 'market strategy', 'pathogen diagnostics', 'login constraints').";
                        }
                    }
                </script>
            </body>

            </html>



