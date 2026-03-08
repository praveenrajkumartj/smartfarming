<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <title>Elevate to Strategic Advisor - AGROPLANTER</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
            <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800;900&display=swap"
                rel="stylesheet">
            <link rel="icon"
                href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🎓</text></svg>" />
            <style>
                body {
                    background: #020617;
                    min-height: 100vh;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    padding: 60px 20px;
                    font-family: 'Outfit', sans-serif;
                    color: #fff;
                    overflow-x: hidden;
                }

                .v3-auth-scene {
                    position: fixed;
                    inset: 0;
                    background:
                        radial-gradient(circle at 10% 10%, rgba(251, 191, 36, 0.08) 0%, transparent 50%),
                        radial-gradient(circle at 90% 90%, rgba(59, 130, 246, 0.08) 0%, transparent 50%);
                    z-index: -1;
                }

                .v3-enroll-card {
                    width: 100%;
                    max-width: 800px;
                    background: rgba(15, 23, 42, 0.4);
                    backdrop-filter: blur(40px);
                    border: 1px solid rgba(255, 255, 255, 0.05);
                    border-radius: 40px;
                    padding: 60px;
                    box-shadow: 0 40px 100px rgba(0, 0, 0, 0.8);
                    animation: v3-card-reveal 1s cubic-bezier(0.16, 1, 0.3, 1);
                    position: relative;
                    overflow: hidden;
                }

                @keyframes v3-card-reveal {
                    from {
                        opacity: 0;
                        transform: translateY(40px) scale(0.95);
                    }

                    to {
                        opacity: 1;
                        transform: translateY(0) scale(1);
                    }
                }

                .v3-enroll-card::before {
                    content: '';
                    position: absolute;
                    top: 0;
                    left: 0;
                    width: 100%;
                    height: 6px;
                    background: linear-gradient(90deg, transparent, #fbbf24, transparent);
                    opacity: 0.5;
                }

                .v3-advisor-badge {
                    background: rgba(251, 191, 36, 0.1);
                    border: 1px solid rgba(251, 191, 36, 0.2);
                    color: #fbbf24;
                    padding: 8px 24px;
                    border-radius: 100px;
                    font-size: 10px;
                    font-weight: 800;
                    letter-spacing: 2.5px;
                    text-transform: uppercase;
                    display: inline-block;
                    margin-bottom: 30px;
                }

                .v3-terminal-input {
                    background: rgba(255, 255, 255, 0.02) !important;
                    border: 1px solid rgba(255, 255, 255, 0.05) !important;
                    border-radius: 20px !important;
                    padding: 18px 24px !important;
                    color: #fff !important;
                    transition: 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
                    font-size: 15px !important;
                    font-family: 'Outfit';
                }

                .v3-terminal-input:focus {
                    border-color: #fbbf24 !important;
                    background: rgba(255, 255, 255, 0.05) !important;
                    box-shadow: 0 0 30px rgba(251, 191, 36, 0.1) !important;
                    transform: translateY(-2px);
                }

                .v3-section-label {
                    font-size: 10px;
                    font-weight: 900;
                    color: #475569;
                    text-transform: uppercase;
                    letter-spacing: 2px;
                    margin-bottom: 12px;
                    margin-left: 6px;
                    display: block;
                }

                .v3-btn-enroll {
                    width: 100%;
                    padding: 22px;
                    border-radius: 20px;
                    background: #fbbf24;
                    border: none;
                    color: #000;
                    font-weight: 950;
                    text-transform: uppercase;
                    letter-spacing: 2px;
                    margin-top: 40px;
                    transition: 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
                    box-shadow: 0 10px 30px rgba(251, 191, 36, 0.2);
                }

                .v3-btn-enroll:hover {
                    transform: translateY(-5px) scale(1.02);
                    background: #fcd34d;
                    box-shadow: 0 20px 50px rgba(251, 191, 36, 0.4);
                }

                .v3-back-link {
                    position: absolute;
                    top: 30px;
                    left: 30px;
                    color: #475569;
                    text-decoration: none;
                    font-size: 11px;
                    font-weight: 800;
                    display: flex;
                    align-items: center;
                    gap: 10px;
                    transition: 0.3s;
                    letter-spacing: 1px;
                }

                .v3-back-link:hover {
                    color: #fff;
                    transform: translateX(-5px);
                }

                .v3-input-prepend {
                    background: rgba(255, 255, 255, 0.01) !important;
                    border: 1px solid rgba(255, 255, 255, 0.05);
                    border-right: none;
                    color: #fbbf24;
                    border-radius: 20px 0 0 20px !important;
                    padding: 0 25px;
                    font-weight: 900;
                }

                .v3-prepended-input {
                    border-radius: 0 20px 20px 0 !important;
                }
            </style>
        </head>

        <body>
            <div class="v3-auth-scene"></div>

            <div class="v3-enroll-card">
                <a href="${pageContext.request.contextPath}/farmer/dashboard" class="v3-back-link uppercase">
                    <span>←</span> BACK TO COMMAND CENTER
                </a>

                <div class="text-center mb-5">
                    <div class="v3-advisor-badge">STRATEGIC ELEVATION</div>
                    <h1 class="fw-950 mb-3 fs-1" style="letter-spacing: -2px;">Deploy Advisor Protocol</h1>
                    <p class="text-white-50 small mb-0 fw-600 uppercase" style="letter-spacing: 1px;">OPTIMIZE GLOBAL
                        YIELD VECTORS | SHARE BIOLOGICAL INTELLIGENCE</p>
                </div>

                <form action="${pageContext.request.contextPath}/mentor/become" method="POST">
                    <div class="row g-5">
                        <div class="col-md-12">
                            <label class="v3-section-label">Nodes of Expertise</label>
                            <input type="text" name="expertise" class="form-control v3-terminal-input"
                                placeholder="Initialize expertise nodes: e.g. Organic Yield, Precision Irrigation..."
                                required />
                        </div>

                        <div class="col-md-6">
                            <label class="v3-section-label">Consultation Valuation (INR)</label>
                            <div class="input-group">
                                <span class="input-group-text v3-input-prepend">₹</span>
                                <input type="number" name="consultationFee"
                                    class="form-control v3-terminal-input v3-prepended-input" placeholder="250.00"
                                    step="0.01" required />
                            </div>
                        </div>

                        <div class="col-md-6">
                            <label class="v3-section-label">Telemetry History (Years)</label>
                            <input type="text" name="experience" class="form-control v3-terminal-input"
                                placeholder="Service duration: e.g. 15 Years Agronomy" required />
                        </div>

                        <div class="col-12">
                            <label class="v3-section-label">Strategic Bio-Log</label>
                            <textarea name="bio" class="form-control v3-terminal-input" rows="5"
                                placeholder="Detail your operational background and specific biological optimization strategies..."
                                required></textarea>
                        </div>
                    </div>

                    <button type="submit" class="v3-btn-enroll uppercase">INITIATE ADVISOR NODE →</button>
                </form>

                <div class="text-center mt-5 pt-4 border-top border-white border-opacity-5">
                    <p class="small text-white-50 fw-950 uppercase"
                        style="letter-spacing: 2px; font-size: 9px; opacity: 0.4;">PROTOCOL ACCESS: SECURED | AGROPLANTER
                        NODE V3.0</p>
                </div>
            </div>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>


