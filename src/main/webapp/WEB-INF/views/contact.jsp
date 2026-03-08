<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <title>Contact Command | AGROPLANTER</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
            <script src="${pageContext.request.contextPath}/js/agroplanter-ui.js"></script>
            <link rel="icon"
                href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>📡</text></svg>" />
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

                main {
                    flex: 1;
                    padding: 60px 20px;
                }

                .contact-wrapper {
                    max-width: 1200px;
                    margin: 0 auto;
                    position: relative;
                }

                .contact-header {
                    text-align: center;
                    margin-bottom: 60px;
                    animation: slideUp 0.6s cubic-bezier(0.16, 1, 0.3, 1);
                }

                .contact-header h1 {
                    font-size: clamp(2.5rem, 6vw, 4rem);
                    font-weight: 900;
                    letter-spacing: -2px;
                    background: linear-gradient(135deg, white, #94a3b8);
                    -webkit-background-clip: text;
                    background-clip: text;
                    -webkit-text-fill-color: transparent;
                    margin-bottom: 15px;
                }

                .contact-header p {
                    color: #94a3b8;
                    font-size: 1.2rem;
                    max-width: 600px;
                    margin: 0 auto;
                }

                .grid-container {
                    display: grid;
                    grid-template-columns: 1fr 1fr;
                    gap: 40px;
                    align-items: stretch;
                    animation: slideUp 0.8s cubic-bezier(0.16, 1, 0.3, 1) forwards;
                }

                @media(max-width: 992px) {
                    .grid-container {
                        grid-template-columns: 1fr;
                    }
                }

                .info-panel {
                    background: rgba(30, 41, 59, 0.4);
                    border: 1px solid rgba(255, 255, 255, 0.05);
                    backdrop-filter: blur(20px);
                    border-radius: 24px;
                    padding: 50px;
                    position: relative;
                    overflow: hidden;
                    display: flex;
                    flex-direction: column;
                    justify-content: center;
                }

                .info-panel::before {
                    content: '';
                    position: absolute;
                    top: 0;
                    left: 0;
                    width: 4px;
                    height: 100%;
                    background: linear-gradient(180deg, #10b981, #3b82f6);
                }

                .info-item {
                    display: flex;
                    align-items: center;
                    gap: 20px;
                    margin-bottom: 35px;
                    transition: 0.3s;
                }

                .info-item:last-child {
                    margin-bottom: 0;
                }

                .info-item:hover {
                    transform: translateX(10px);
                }

                .info-icon {
                    width: 60px;
                    height: 60px;
                    background: rgba(16, 185, 129, 0.1);
                    border-radius: 16px;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    font-size: 24px;
                    color: #10b981;
                    border: 1px solid rgba(16, 185, 129, 0.2);
                    box-shadow: 0 0 20px rgba(16, 185, 129, 0.1);
                    transition: 0.3s;
                }

                .info-item:hover .info-icon {
                    background: #10b981;
                    color: #020617;
                    box-shadow: 0 0 30px rgba(16, 185, 129, 0.4);
                }

                .info-text h4 {
                    color: white;
                    font-size: 1.1rem;
                    margin-bottom: 5px;
                    font-weight: 700;
                }

                .info-text span {
                    color: #94a3b8;
                    font-size: 0.95rem;
                }

                .form-panel {
                    background: rgba(15, 23, 42, 0.6);
                    border: 1px solid rgba(255, 255, 255, 0.05);
                    backdrop-filter: blur(20px);
                    border-radius: 24px;
                    padding: 50px;
                    box-shadow: 0 20px 50px rgba(0, 0, 0, 0.5);
                }

                .form-group-contact {
                    margin-bottom: 24px;
                }

                .form-group-contact label {
                    display: flex;
                    align-items: center;
                    gap: 8px;
                    color: #cbd5e1;
                    font-size: 0.9rem;
                    margin-bottom: 10px;
                    font-weight: 600;
                    text-transform: uppercase;
                    letter-spacing: 1px;
                }

                .form-group-contact input,
                .form-group-contact select,
                .form-group-contact textarea {
                    width: 100%;
                    padding: 16px 20px;
                    border-radius: 12px;
                    background: rgba(2, 6, 23, 0.5);
                    border: 1px solid rgba(255, 255, 255, 0.1);
                    color: white;
                    font-size: 1rem;
                    transition: all 0.3s cubic-bezier(0.16, 1, 0.3, 1);
                    font-family: inherit;
                }

                .form-group-contact select option {
                    background: #0f172a;
                    color: white;
                    padding: 10px;
                }

                .form-group-contact input:focus,
                .form-group-contact select:focus,
                .form-group-contact textarea:focus {
                    outline: none;
                    border-color: #3b82f6;
                    box-shadow: 0 0 0 4px rgba(59, 130, 246, 0.1);
                    background: rgba(2, 6, 23, 0.8);
                }

                .btn-submit {
                    background: linear-gradient(135deg, #10b981, #3b82f6);
                    color: white;
                    padding: 18px 30px;
                    border: none;
                    border-radius: 100px;
                    font-size: 1rem;
                    font-weight: 800;
                    letter-spacing: 1px;
                    cursor: pointer;
                    width: 100%;
                    transition: 0.4s;
                    text-transform: uppercase;
                    box-shadow: 0 10px 30px rgba(16, 185, 129, 0.3);
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    gap: 10px;
                }

                .btn-submit:hover {
                    transform: translateY(-3px);
                    box-shadow: 0 15px 40px rgba(59, 130, 246, 0.5);
                    color: white;
                }

                /* Custom Toast Match */
                #toastContainer {
                    z-index: 10000;
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
                <a href="${pageContext.request.contextPath}/"
                    class="text-decoration-none d-flex align-items-center gap-3">
                    <div class="brand-icon-box"><i class="fas fa-leaf"></i></div>
                        style="height: 32px; border-radius: 8px;">
                    <span class="brand-premium">AGROPLANTER <span class="text-white opacity-50">V3.0</span></span>
                </a>
                <div class="d-none d-md-flex gap-4 align-items-center">
                    <a href="${pageContext.request.contextPath}/"
                        class="btn btn-outline-light rounded-pill px-4 btn-sm"><i class="fas fa-arrow-left me-2"></i>
                        COMMAND CENTER</a>
                </div>
            </header>

            <main>
                <div class="contact-wrapper">
                    <div class="contact-header">
                        <div class="badge rounded-pill px-4 py-2 border mb-4"
                            style="background: rgba(16, 185, 129, 0.1); border-color: rgba(16, 185, 129, 0.3) !important; color: #34d399 !important; font-weight: 800; font-size: 13px; letter-spacing: 1px;">
                            SECURE TRANSMISSION PROTOCOL
                        </div>
                        <h1>INITIALIZE CONTACT</h1>
                        <p>Transmit an encrypted inquiry to our organic command center. Standby for a tier-2 cognitive
                            engineer to process your request.</p>
                    </div>

                    <div class="grid-container">
                        <!-- Info Panel -->
                        <div class="info-panel">
                            <h2 class="text-white mb-5 fw-bold" style="font-size: 1.8rem;">Global Operating Nodes</h2>

                            <div class="info-item">
                                <div class="info-icon"><i class="fas fa-map-marker-alt"></i></div>
                                <div class="info-text">
                                    <h4>Central Nexus (HQ)</h4>
                                    <span>123 Agri-Tech Grid, Cyber Sector, Bangalore, 560001</span>
                                </div>
                            </div>

                            <div class="info-item">
                                <div class="info-icon"
                                    style="color: #3b82f6; border-color: rgba(59, 130, 246, 0.2); background: rgba(59, 130, 246, 0.1);">
                                    <i class="fas fa-satellite-dish"></i>
                                </div>
                                <div class="info-text">
                                    <h4>Direct Audio Uplink</h4>
                                    <span>1800-SMART-FARM (1800-123-4567)</span>
                                </div>
                            </div>

                            <div class="info-item">
                                <div class="info-icon"
                                    style="color: #8b5cf6; border-color: rgba(139, 92, 246, 0.2); background: rgba(139, 92, 246, 0.1);">
                                    <i class="fas fa-envelope-open-text"></i>
                                </div>
                                <div class="info-text">
                                    <h4>Encrypted Comms</h4>
                                    <span>comm@Agroplanter-network.in</span>
                                </div>
                            </div>

                            <div class="info-item">
                                <div class="info-icon"
                                    style="color: #f59e0b; border-color: rgba(245, 158, 11, 0.2); background: rgba(245, 158, 11, 0.1);">
                                    <i class="fas fa-clock"></i>
                                </div>
                                <div class="info-text">
                                    <h4>Human Operating Hours</h4>
                                    <span>Solar Cycle: 0900 to 1800 (Mon-Sat)</span>
                                </div>
                            </div>
                        </div>

                        <!-- Form Panel -->
                        <div class="form-panel">
                            <h2 class="text-white mb-4 fw-bold" style="font-size: 1.8rem;">Transmission Terminal</h2>

                            <form action="#" method="get"
                                onsubmit="event.preventDefault(); window.showToast ? showToast('Signal broadcast successful! An operative will intercept shortly.', 'success') : alert('Signal Broadcast Successful!'); this.reset();">

                                <div class="form-group-contact">
                                    <label><i class="fas fa-user-astronaut text-white-50"></i> Operator
                                        Designation</label>
                                    <input type="text" placeholder="Enter full name or callsign" required />
                                </div>

                                <div class="form-group-contact">
                                    <label><i class="fas fa-link text-white-50"></i> Return Vector (Email/Phone)</label>
                                    <input type="text" placeholder="Enter secure reply address" required />
                                </div>

                                <div class="form-group-contact">
                                    <label><i class="fas fa-folder-tree text-white-50"></i> Mission Category</label>
                                    <select required>
                                        <option value="" disabled selected>Select routing parameter...</option>
                                        <option>Node Authentication Failure (Login)</option>
                                        <option>Bio-Diagnostics Anomaly</option>
                                        <option>Liquid Market Integration</option>
                                        <option>Government Data Ingestion</option>
                                        <option>General Systemic Query</option>
                                    </select>
                                </div>

                                <div class="form-group-contact">
                                    <label><i class="fas fa-terminal text-white-50"></i> Data Payload</label>
                                    <textarea rows="4" placeholder="Input parameters of your inquiry..."
                                        required></textarea>
                                </div>

                                <button type="submit" class="btn-submit">
                                    <i class="fas fa-paper-plane"></i> INITIATE UPLOAD
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </main>

            <jsp:include page="footer.jsp" />

            <script src="${pageContext.request.contextPath}/js/i18n.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>




