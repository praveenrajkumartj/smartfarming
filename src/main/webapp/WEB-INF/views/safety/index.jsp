<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Farmer Safety - AGROPLANTER</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <style>
            .safety-card {
                border-radius: 20px;
                background: #0d1a0d;
                border: 1px solid rgba(22, 163, 74, 0.2);
                transition: transform 0.3s;
                height: 100%;
                padding: 20px;
            }

            .safety-card:hover {
                transform: translateY(-5px);
                border-color: #22c55e;
            }

            .sos-btn {
                width: 100px;
                height: 100px;
                border-radius: 50%;
                background: #dc3545;
                color: white;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 24px;
                font-weight: 800;
                border: 8px solid rgba(220, 53, 69, 0.2);
                margin: 0 auto 30px;
                cursor: pointer;
                animation: pulse 2s infinite;
            }

            @keyframes pulse {
                0% {
                    transform: scale(1);
                    box-shadow: 0 0 0 0 rgba(220, 53, 69, 0.4);
                }

                70% {
                    transform: scale(1.1);
                    box-shadow: 0 0 0 20px rgba(220, 53, 69, 0);
                }

                100% {
                    transform: scale(1);
                    box-shadow: 0 0 0 0 rgba(220, 53, 69, 0);
                }
            }

            .guide-link {
                text-decoration: none;
                color: #22c55e;
                font-weight: 600;
            }
        </style>
        <script src="${pageContext.request.contextPath}/js/agroplanter-ui.js"></script>
    </head>

    <body class="bg-dark text-light">
        <div class="container py-5">
            <div class="text-center mb-5">
                <h1 class="display-4 fw-bold">Farmer Safety & Emergency</h1>
                <p class="text-secondary">Your well-being is our priority. Safety guides for rural farming.</p>
            </div>

            <div class="row mb-5">
                <div class="col-12 text-center">
                    <div class="sos-btn" onclick="triggerSOS()">SOS</div>
                    <h3>Emergency Alert System</h3>
                    <p class="text-secondary">Clicking this button will send an emergency SMS to your registered
                        contacts and local authorities.</p>
                </div>
            </div>

            <div class="row g-4">
                <div class="col-md-4">
                    <div class="safety-card">
                        <span class="fs-1 mb-3 d-block">🐍</span>
                        <h4>Snake Bite Guide</h4>
                        <p class="text-secondary">Immediate first aid steps for various snake bites found in rural
                            India.</p>
                        <a href="${pageContext.request.contextPath}/safety/first-aid/snake-bite" class="guide-link">Read
                            Guide &rarr;</a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="safety-card">
                        <span class="fs-1 mb-3 d-block">⚡</span>
                        <h4>Electric Shock Prevention</h4>
                        <p class="text-secondary">Safe handling of irrigation pumps and electric fences.</p>
                        <a href="${pageContext.request.contextPath}/safety/first-aid/electric-shock"
                            class="guide-link">Read Guide &rarr;</a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="safety-card">
                        <span class="fs-1 mb-3 d-block">🌙</span>
                        <h4>Night Farming Tips</h4>
                        <p class="text-secondary">Essential safety tips for watering crops at night.</p>
                        <a href="${pageContext.request.contextPath}/safety/tips/night-farming" class="guide-link">Read
                            Guide &rarr;</a>
                    </div>
                </div>
            </div>
        </div>

        <script>
            function triggerSOS() {
                showConfirm("Confirm: Send Emergency Alert to Authorities?", () => {
                    showToast("Alert Sent! Help is on the way. (Demo)", "error");
                });
            }
        </script>
    </body>

    </html>



