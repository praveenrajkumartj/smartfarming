<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <title>Privacy Policy | AGROPLANTER</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
            <link rel="icon"
                href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🛡️</text></svg>" />
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

                main {
                    flex: 1;
                    padding: 60px 20px;
                    display: flex;
                    justify-content: center;
                }

                .doc-container {
                    max-width: 900px;
                    width: 100%;
                    background: rgba(30, 41, 59, 0.4);
                    border: 1px solid rgba(255, 255, 255, 0.05);
                    backdrop-filter: blur(20px);
                    border-radius: 24px;
                    padding: 50px;
                    box-shadow: 0 10px 40px rgba(0, 0, 0, 0.3);
                    position: relative;
                    animation: slideUp 0.8s cubic-bezier(0.16, 1, 0.3, 1);
                }

                .doc-container::before {
                    content: '';
                    position: absolute;
                    top: 0;
                    left: 50%;
                    transform: translateX(-50%);
                    width: 150px;
                    height: 4px;
                    background: linear-gradient(90deg, transparent, #3b82f6, transparent);
                    border-radius: 0 0 10px 10px;
                }

                .doc-header {
                    text-align: center;
                    margin-bottom: 50px;
                    padding-bottom: 30px;
                    border-bottom: 1px solid rgba(255, 255, 255, 0.05);
                    position: relative;
                }

                .doc-header h1 {
                    font-size: clamp(2rem, 5vw, 3rem);
                    font-weight: 900;
                    letter-spacing: -1px;
                    background: linear-gradient(135deg, #38bdf8, #8b5cf6);
                    -webkit-background-clip: text;
                    background-clip: text;
                    -webkit-text-fill-color: transparent;
                    margin-bottom: 10px;
                }

                .doc-header p {
                    font-size: 1.1rem;
                    color: #94a3b8;
                    letter-spacing: 1px;
                    text-transform: uppercase;
                }

                .doc-content h2 {
                    font-size: 1.6rem;
                    color: white;
                    margin-top: 50px;
                    margin-bottom: 20px;
                    display: flex;
                    align-items: center;
                    gap: 12px;
                    font-weight: 700;
                }

                .doc-content h2 i {
                    color: #3b82f6;
                    font-size: 1.2rem;
                    background: rgba(59, 130, 246, 0.1);
                    padding: 10px;
                    border-radius: 10px;
                    box-shadow: 0 0 15px rgba(59, 130, 246, 0.2);
                }

                .doc-content p {
                    color: #cbd5e1;
                    font-size: 1.05rem;
                    line-height: 1.8;
                    margin-bottom: 20px;
                    font-weight: 300;
                }

                .doc-content ul {
                    margin-left: 0;
                    padding-left: 20px;
                    margin-bottom: 30px;
                }

                .doc-content li {
                    color: #cbd5e1;
                    font-size: 1.05rem;
                    margin-bottom: 15px;
                    line-height: 1.6;
                    font-weight: 300;
                }

                .doc-content li strong {
                    color: white;
                    font-weight: 600;
                }

                .highlight-box {
                    background: rgba(59, 130, 246, 0.05);
                    border-left: 4px solid #3b82f6;
                    padding: 25px;
                    border-radius: 0 16px 16px 0;
                    margin: 40px 0;
                    color: #e2e8f0;
                    font-size: 1.1rem;
                    line-height: 1.7;
                    backdrop-filter: blur(5px);
                    border-top: 1px solid rgba(255, 255, 255, 0.02);
                    border-right: 1px solid rgba(255, 255, 255, 0.02);
                    border-bottom: 1px solid rgba(255, 255, 255, 0.02);
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
            </style>
        </head>

        <body>
            <header class="nav-glass d-flex justify-content-between align-items-center">
                <a href="${pageContext.request.contextPath}/" class="text-decoration-none d-flex align-items-center">
                    <div class="brand-premium">
                        <div class="brand-icon-box">
                            <i class="fas fa-leaf"></i>
                        </div>
                        AGROPLANTER <span class="text-white opacity-25"
                            style="font-size: 14px; font-weight: 400; letter-spacing: 0;">v.3</span>
                    </div>
                </a>
                <div class="d-none d-md-flex gap-4 align-items-center">
                    <a href="${pageContext.request.contextPath}/"
                        class="btn btn-outline-light rounded-pill px-4 btn-sm"><i class="fas fa-arrow-left me-2"></i>
                        COMMAND CENTER</a>
                </div>
            </header>

            <main>
                <div class="doc-container">
                    <div class="doc-header">
                        <h1>PRIVACY PROTOCOL</h1>
                        <p>Data Sovereignty and Encryption Standards</p>
                    </div>

                    <div class="doc-content">
                        <div class="highlight-box">
                            AGROPLANTER is committed to protecting the privacy and security of our Ecosystem
                            Participants
                            (Farmers, Buyers, Mentors). We enforce strict cryptographic data isolation. We do not
                            synthesize or distribute your personal metrics to unauthorized third-party brokers.
                        </div>

                        <h2><i class="fas fa-database"></i> 1. Telemetry & Data Acquired</h2>
                        <p>To initialize your node and provide our algorithmic services efficiently, we securely index
                            the following parameters upon registration and platform interaction:</p>
                        <ul>
                            <li><strong>Biometric/Profile Node:</strong> Full identification matrix, verified email
                                address, cellular link, active state, and designated operational district.</li>
                            <li><strong>Agricultural Telemetry:</strong> Cultivation signatures, soil composition
                                indexes (NPK sensors), and decentralized marketplace listings explicitly authorized by
                                you.</li>
                            <li><strong>Visual Diagnostics:</strong> High-resolution optical data (plant tissue,
                                pathogen signatures) uploaded locally to our AI Diagnostic engine for neural processing.
                            </li>
                        </ul>

                        <h2><i class="fas fa-microchip"></i> 2. Algorithmic Utilization of Data</h2>
                        <p>Your agricultural telemetry is utilized exclusively within isolated sub-routines for
                            generating precise insights and expanding your node's market liquidity:</p>
                        <ul>
                            <li>To compute instantaneous <strong>Neural Crop Trajectories</strong> based on dynamic
                                weather inputs and localized soil chemistry.</li>
                            <li>To process and analyze pathological anomalies via our multi-layered AI models and
                                verified Expert Admins, returning high-confidence treatment protocols.</li>
                            <li>To seamlessly broadcast your authorized contact vectors to verified Tier-1 Buyers only
                                upon initialization of a Smart Marketplace Listing.</li>
                        </ul>

                        <h2><i class="fas fa-shield-halved"></i> 3. Cryptographic Shielding & Erasure</h2>
                        <p>Your access keys and passwords are one-way cryptographically hashed using industry-leading
                            algorithms; not even System Administrators possess decryption capabilities. You maintain
                            complete sovereignty over your data node.</p>
                        <p>You hold the intrinsic right to request a complete <strong>System Purge</strong> via your
                            profile settings or by initiating contact with Support. Upon authorization, this process
                            structurally annihilates all traces of your personal data, telemetry, and marketplace
                            history from our distributed servers within standard compliance timeframes.</p>
                    </div>
                </div>
            </main>

            <jsp:include page="footer.jsp" />

            <script src="${pageContext.request.contextPath}/js/i18n.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>

