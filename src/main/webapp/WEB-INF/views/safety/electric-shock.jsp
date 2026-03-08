<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <title>Electric Shock First Aid - AGROPLANTER</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <style>
            :root {
                --primary-green: #2e7d32;
            }

            body {
                background-color: #f8f9fa;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }

            .hero {
                background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), url('https://images.unsplash.com/photo-1544724569-5f546fd6f2b5?auto=format&fit=crop&w=1350&q=80');
                background-size: cover;
                color: white;
                padding: 60px 0;
                text-align: center;
            }

            .card {
                border: none;
                border-radius: 15px;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
                margin-bottom: 30px;
            }

            .step-icon {
                width: 50px;
                height: 50px;
                background: #fff3e0;
                color: #ef6c00;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 24px;
                margin-bottom: 15px;
            }
        </style>
    </head>

    <body>
        <div class="hero">
            <div class="container">
                <h1><i class="fas fa-bolt me-2"></i>Electric Shock First Aid</h1>
                <p class="lead">Immediate actions to take in case of electrical accidents in the farm.</p>
            </div>
        </div>

        <div class="container my-5">
            <div class="row">
                <div class="col-md-8 mx-auto">
                    <div class="card p-4 mb-4" style="border-left: 5px solid #d32f2f;">
                        <h4 class="text-danger"><i class="fas fa-exclamation-triangle me-2"></i>CRITICAL: DO NOT TOUCH
                            THE VICTIM</h4>
                        <p>If the victim is still in contact with the electrical source, touching them will pass the
                            current to you. <strong>Turn off the main power source immediately</strong> before
                            approaching.</p>
                    </div>

                    <h3>Steps to Follow:</h3>
                    <div class="list-group">
                        <div class="list-group-item">
                            <div class="step-icon"><i class="fas fa-power-off"></i></div>
                            <h5>1. Break the Contact</h5>
                            <p>Turn off the power or use a dry wooden stick/rubber pipe to pull the victim away. Never
                                use metal or wet items.</p>
                        </div>
                        <div class="list-group-item">
                            <div class="step-icon"><i class="fas fa-phone-alt"></i></div>
                            <h5>2. Call Emergency Services</h5>
                            <p>Contact the nearest hospital or ambulance service immediately. Even if the victim looks
                                fine, internal burns are possible.</p>
                        </div>
                        <div class="list-group-item">
                            <div class="step-icon"><i class="fas fa-heartbeat"></i></div>
                            <h5>3. Check Breathing and Pulse</h5>
                            <p>If the victim is not breathing, start CPR if you are trained to do so.</p>
                        </div>
                    </div>

                    <div class="mt-4">
                        <a href="/safety" class="btn btn-outline-success"><i class="fas fa-arrow-left me-2"></i>Back to
                            Safety Center</a>
                    </div>
                </div>
            </div>
        </div>
    </body>

    </html>


