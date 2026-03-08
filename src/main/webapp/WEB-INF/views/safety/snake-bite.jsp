<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Snake Bite First Aid - AGROPLANTER</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background: #050a05;
                color: #f0fdf4;
            }

            .emergency-header {
                background: #dc3545;
                padding: 20px;
                text-align: center;
                font-weight: 800;
                text-transform: uppercase;
            }

            .step-card {
                background: rgba(255, 255, 255, 0.05);
                border-radius: 15px;
                padding: 20px;
                margin-bottom: 20px;
                border-left: 5px solid #22c55e;
            }
        </style>
    </head>

    <body>
        <div class="emergency-header">🚨 Emergency Guide: Snake Bite First Aid</div>

        <div class="container py-5">
            <h2 class="mb-4">Immediate Actions (Critical)</h2>

            <div class="step-card">
                <h4>1. Keep Calm and Move Away</h4>
                <p>Back away slowly from the snake to avoid a second strike. Do not try to catch or kill it.</p>
            </div>

            <div class="step-card">
                <h4>2. Immobilize the Limb</h4>
                <p>Keep the bitten area below the level of the heart. Use a splint if possible to keep the limb
                    completely still.</p>
            </div>

            <div class="step-card" style="border-left-color: #dc3545">
                <h4>3. What NOT to do</h4>
                <ul>
                    <li>DO NOT cut the wound or try to suck out the venom.</li>
                    <li>DO NOT apply a tournaquet (tight binding).</li>
                    <li>DO NOT apply ice or chemicals.</li>
                </ul>
            </div>

            <div class="step-card">
                <h4>4. Call for Help</h4>
                <p>Immediately call your local emergency number or use the SOS button on AGROPLANTER.</p>
            </div>

            <a href="${pageContext.request.contextPath}/safety" class="btn btn-outline-success">Back to Safety
                Dashboard</a>
        </div>
    </body>

    </html>


