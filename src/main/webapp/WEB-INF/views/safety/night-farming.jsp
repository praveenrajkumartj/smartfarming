<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <title>Night Farming Safety Tips - AGROPLANTER</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <style>
            :root {
                --primary-green: #2e7d32;
            }

            body {
                background-color: #0d1b2a;
                color: #e0e1dd;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }

            .hero {
                background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)), url('https://images.unsplash.com/photo-1472120482482-d44b5447dd1b?auto=format&fit=crop&w=1350&q=80');
                background-size: cover;
                color: white;
                padding: 80px 0;
                text-align: center;
                border-bottom: 3px solid #778da9;
            }

            .tip-card {
                background: #1b263b;
                border: none;
                border-radius: 15px;
                padding: 25px;
                margin-bottom: 20px;
                transition: transform 0.3s;
            }

            .tip-card:hover {
                transform: translateY(-5px);
                background: #415a77;
            }

            .icon-box {
                font-size: 30px;
                color: #e0e1dd;
                margin-bottom: 15px;
            }
        </style>
    </head>

    <body>
        <div class="hero">
            <div class="container">
                <h1><i class="fas fa-moon me-3"></i>Night Farming Safety</h1>
                <p class="lead">Essential tips for farmers working during dark hours or late shifts.</p>
            </div>
        </div>

        <div class="container my-5">
            <div class="row">
                <div class="col-md-4">
                    <div class="tip-card text-center">
                        <div class="icon-box"><i class="fas fa-flashlight"></i></div>
                        <h5>Proper Lighting</h5>
                        <p>Always carry a powerful LED torch and wear a headlamp to keep your hands free for work.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="tip-card text-center">
                        <div class="icon-box"><i class="fas fa-eye"></i></div>
                        <h5>Reflective Gear</h5>
                        <p>Wear high-visibility reflective vests so that vehicle drivers and other farmers can see you
                            from a distance.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="tip-card text-center">
                        <div class="icon-box"><i class="fas fa-shoe-prints"></i></div>
                        <h5>Watch for Wildlife</h5>
                        <p>Night is when many animals are active. Use a stick to make noise while walking to alert
                            snakes or other animals.</p>
                    </div>
                </div>
            </div>

            <div class="row mt-4">
                <div class="col-md-6">
                    <div class="tip-card">
                        <h4><i class="fas fa-users me-2"></i>Buddy System</h4>
                        <p>Avoid working alone at night. If you must, always inform someone about your exact location
                            and expected return time.</p>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="tip-card">
                        <h4><i class="fas fa-battery-full me-2"></i>Communication</h4>
                        <p>Ensure your mobile phone is fully charged. Keep emergency contacts on speed dial. Use the SOS
                            button on our app if needed.</p>
                    </div>
                </div>
            </div>

            <div class="text-center mt-5">
                <a href="/safety" class="btn btn-lg btn-light text-dark"><i class="fas fa-arrow-left me-2"></i>Return to
                    Safety Portal</a>
            </div>
        </div>
    </body>

    </html>


