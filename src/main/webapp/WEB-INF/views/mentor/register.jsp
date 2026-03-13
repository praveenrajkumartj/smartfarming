<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <title>Strategic Advisor Enrollment - AGROPLANTER</title>
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
                        radial-gradient(circle at 0% 0%, rgba(251, 191, 36, 0.05) 0%, transparent 50%),
                        radial-gradient(circle at 100% 100%, rgba(59, 130, 246, 0.05) 0%, transparent 50%);
                    z-index: -1;
                }

                .v3-enroll-nexus {
                    max-width: 1000px;
                    width: 100%;
                    background: rgba(15, 23, 42, 0.4);
                    backdrop-filter: blur(40px);
                    border: 1px solid rgba(255, 255, 255, 0.05);
                    border-radius: 50px;
                    padding: 70px;
                    box-shadow: 0 50px 100px rgba(0, 0, 0, 0.7);
                    animation: v3-nexus-reveal 1.2s cubic-bezier(0.16, 1, 0.3, 1);
                }

                @keyframes v3-nexus-reveal {
                    from {
                        opacity: 0;
                        transform: translateY(60px) scale(0.98);
                    }

                    to {
                        opacity: 1;
                        transform: translateY(0) scale(1);
                    }
                }

                .v3-sub-header {
                    font-size: 11px;
                    font-weight: 900;
                    color: #fbbf24;
                    text-transform: uppercase;
                    letter-spacing: 3px;
                    margin-bottom: 30px;
                    padding-bottom: 15px;
                    border-bottom: 1px solid rgba(251, 191, 36, 0.1);
                }

                .v3-terminal-input {
                    background: rgba(255, 255, 255, 0.02) !important;
                    border: 1px solid rgba(255, 255, 255, 0.05) !important;
                    border-radius: 20px !important;
                    padding: 16px 24px !important;
                    color: #fff !important;
                    transition: 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
                    font-size: 14px !important;
                    font-family: 'Outfit';
                }

                .v3-terminal-input:focus {
                    border-color: #fbbf24 !important;
                    background: rgba(255, 255, 255, 0.05) !important;
                    box-shadow: 0 0 30px rgba(251, 191, 36, 0.1) !important;
                    transform: translateY(-2px);
                }

                .v3-field-label {
                    font-size: 10px;
                    font-weight: 900;
                    color: #475569;
                    text-transform: uppercase;
                    letter-spacing: 2px;
                    margin-bottom: 10px;
                    margin-left: 5px;
                    display: block;
                }

                .v3-enroll-btn {
                    width: 100%;
                    padding: 24px;
                    border-radius: 25px;
                    background: #fbbf24;
                    border: none;
                    color: #000;
                    font-weight: 950;
                    text-transform: uppercase;
                    letter-spacing: 3px;
                    margin-top: 50px;
                    transition: 0.4s;
                    box-shadow: 0 10px 40px rgba(251, 191, 36, 0.2);
                }

                .v3-enroll-btn:hover {
                    transform: translateY(-8px) scale(1.02);
                    background: #fcd34d;
                    box-shadow: 0 20px 60px rgba(251, 191, 36, 0.4);
                }
            </style>
        </head>

        <body>
            <div class="v3-auth-scene"></div>

            <div class="v3-enroll-nexus">
                <div class="text-center mb-5 pb-4">
                    <div class="badge rounded-pill px-4 py-2 border mb-4"
                        style="background: rgba(251, 191, 36, 0.1); border-color: rgba(251, 191, 36, 0.3); color: #fbbf24; font-weight: 900; font-size: 11px; letter-spacing: 3px;">
                        STRATEGIC ADVISOR ENROLLMENT
                    </div>
                    <h1 class="fw-950 mb-3 display-4" style="letter-spacing: -3px;">Join the <span
                            style="color: #fbbf24;">Expert Protocol</span></h1>
                    <p class="text-white-50 fw-600 uppercase x-small mx-auto"
                        style="letter-spacing: 1.5px; line-height: 1.8; max-width: 600px;">Deploy your expertise nodes
                        to optimize yield vectors and institutional knowledge across the global agricultural network.
                    </p>
                </div>

                <form action="${pageContext.request.contextPath}/mentor/register" method="POST">
                    <div class="row g-5">
                        <div class="col-12 mt-5">
                            <div class="v3-sub-header">01. IDENTITY PARAMETERS</div>
                        </div>
                        <div class="col-md-6">
                            <label class="v3-field-label">Legal Identity</label>
                            <input type="text" name="fullName" class="form-control v3-terminal-input"
                                placeholder="Full Legal Name" required>
                        </div>
                        <div class="col-md-6">
                            <label class="v3-field-label">Professional Email</label>
                            <input type="email" name="email" class="form-control v3-terminal-input"
                                placeholder="Email Address" required>
                        </div>
                        <div class="col-md-6">
                            <label class="v3-field-label">Access Password</label>
                            <input type="password" name="password" class="form-control v3-terminal-input"
                                placeholder="Secure Password" required>
                        </div>
                        <div class="col-md-6">
                            <label class="v3-field-label">Telemetry Link (Phone)</label>
                            <input type="text" name="phone" class="form-control v3-terminal-input"
                                placeholder="10-digit primary" required
                                maxlength="10" pattern="[0-9]{10}"
                                oninput="this.value = this.value.replace(/[^0-9]/g, '').slice(0, 10);"
                                title="Please enter a valid 10-digit mobile number" >
                        </div>

                        <div class="col-12 mt-5">
                            <div class="v3-sub-header" style="color: #3b82f6; border-color: rgba(59, 130, 246, 0.1);">
                                02. ADVISORY CONFIGURATION</div>
                        </div>
                        <div class="col-md-6">
                            <label class="v3-field-label">Expertise Node</label>
                            <input type="text" name="expertise" class="form-control v3-terminal-input"
                                placeholder="e.g. Organic Agronomy, Precision Irrigation" required>
                        </div>
                        <div class="col-md-6">
                            <label class="v3-field-label">Consultation Valuation (₹)</label>
                            <input type="number" name="consultationFee" class="form-control v3-terminal-input"
                                placeholder="Per Session Rate" required>
                        </div>
                        <div class="col-12">
                            <label class="v3-field-label">Service History (Years)</label>
                            <input type="text" name="experience" class="form-control v3-terminal-input"
                                placeholder="Duration of Experience" required>
                        </div>
                        <div class="col-12">
                            <label class="v3-field-label">Mission Statement (Bio)</label>
                            <textarea name="bio" class="form-control v3-terminal-input" rows="5"
                                placeholder="Detail your biological optimization strategies and background..."
                                required></textarea>
                        </div>
                    </div>

                    <button type="submit" class="v3-enroll-btn">FINALIZE ENROLLMENT →</button>
                </form>

                <div class="text-center mt-5 pt-5 border-top border-white border-opacity-5">
                    <p class="text-white-50 small fw-850 uppercase"
                        style="letter-spacing: 1px; font-size: 12px; opacity: 0.5;">Farming Sector? <a
                            href="${pageContext.request.contextPath}/register"
                            style="color: #10b981; text-decoration: none; font-weight: 950; margin-left: 10px;">PEER
                            REGISTRATION →</a></p>
                </div>
            </div>
        </body>

        </html>


