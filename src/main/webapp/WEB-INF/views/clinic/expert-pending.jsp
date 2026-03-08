<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>⏳ VERIFICATION PENDING - AGROPLANTER</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
        <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800;900&display=swap"
            rel="stylesheet">
        <link rel="icon"
            href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>⏳</text></svg>" />
        <style>
            body {
                background: #020617;
                height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
                font-family: 'Outfit', sans-serif;
                color: #fff;
                overflow: hidden;
            }

            .v3-auth-scene {
                position: fixed;
                inset: 0;
                background: radial-gradient(circle at 50% 50%, rgba(245, 158, 11, 0.05) 0%, transparent 60%);
                z-index: -1;
            }

            .v3-pending-nexus {
                width: 100%;
                max-width: 600px;
                background: rgba(15, 23, 42, 0.4);
                backdrop-filter: blur(40px);
                border: 1px solid rgba(255, 255, 255, 0.05);
                border-radius: 50px;
                padding: 70px;
                text-align: center;
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

            .v3-pulse-orb {
                width: 120px;
                height: 120px;
                background: rgba(245, 158, 11, 0.1);
                border: 2px solid rgba(245, 158, 11, 0.3);
                border-radius: 40px;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 50px;
                margin: 0 auto 40px;
                animation: v3-orb-float 4s ease-in-out infinite;
                position: relative;
            }

            .v3-pulse-orb::after {
                content: '';
                position: absolute;
                inset: -10px;
                border: 2px solid rgba(245, 158, 11, 0.1);
                border-radius: 45px;
                animation: pulse 2s infinite;
            }

            @keyframes v3-orb-float {

                0%,
                100% {
                    transform: translateY(0);
                }

                50% {
                    transform: translateY(-15px);
                }
            }

            @keyframes pulse {
                0% {
                    box-shadow: 0 0 0 0 rgba(245, 158, 11, 0.2);
                }

                70% {
                    box-shadow: 0 0 40px 20px rgba(245, 158, 11, 0);
                }

                100% {
                    box-shadow: 0 0 0 0 rgba(245, 158, 11, 0);
                }
            }
        </style>
    </head>

    <body>
        <div class="v3-auth-scene"></div>

        <div class="v3-pending-nexus">
            <div class="v3-pulse-orb">⏳</div>
            <div class="badge rounded-pill px-4 py-2 border mb-4"
                style="background: rgba(245, 158, 11, 0.1); border-color: rgba(245, 158, 11, 0.3); color: #f59e0b; font-weight: 950; font-size: 11px; letter-spacing: 4px;">
                TELEMETRY RECEIVED
            </div>
            <h1 class="fw-950 text-white mb-3" style="letter-spacing: -2px;">Expert Registry <span
                    style="color: #f59e0b;">Verification</span></h1>
            <p class="text-white-50 fw-600 mb-5 lh-lg" style="opacity: 0.7; font-size: 15px;">
                Your biological credentials and professional certifications are currently being reviewed by the central
                authority.
                Deploy back shortly for dashboard activation.
            </p>
            <div class="pt-5 border-top border-white border-opacity-5">
                <a href="${pageContext.request.contextPath}/logout" class="btn btn-quantum px-5 py-3 fw-950 uppercase"
                    style="font-size: 11px; letter-spacing: 2px;">
                    TERMINATE TEMPORARY SESSION
                </a>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>

    </html>


