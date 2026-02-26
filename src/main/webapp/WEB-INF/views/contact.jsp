<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <title>Contact Us | Smart Farming Platform</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
            <style>
                .contact-container {
                    max-width: 1200px;
                    margin: 60px auto;
                    padding: 20px;
                    display: grid;
                    grid-template-columns: 1fr 1fr;
                    gap: 50px;
                }

                @media(max-width: 768px) {
                    .contact-container {
                        grid-template-columns: 1fr;
                    }
                }

                .contact-info {
                    background: linear-gradient(145deg, rgba(22, 163, 74, 0.1), rgba(10, 15, 10, 0.8));
                    border: 1px solid rgba(34, 197, 94, 0.2);
                    padding: 40px;
                    border-radius: 20px;
                    backdrop-filter: blur(10px);
                }

                .contact-info h1 {
                    font-size: 36px;
                    color: #22c55e;
                    margin-bottom: 20px;
                }

                .contact-info p {
                    color: #d1d5db;
                    font-size: 16px;
                    line-height: 1.6;
                    margin-bottom: 40px;
                }

                .info-item {
                    display: flex;
                    align-items: center;
                    gap: 15px;
                    margin-bottom: 30px;
                }

                .info-icon {
                    width: 50px;
                    height: 50px;
                    background: rgba(34, 197, 94, 0.15);
                    border-radius: 12px;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    font-size: 24px;
                    color: #22c55e;
                }

                .info-text h4 {
                    color: #f0fdf4;
                    font-size: 16px;
                    margin-bottom: 5px;
                }

                .info-text span {
                    color: #9ca3af;
                    font-size: 14px;
                }

                .contact-form {
                    background: var(--surface);
                    padding: 40px;
                    border-radius: 20px;
                    border: 1px solid var(--border);
                    box-shadow: 0 20px 40px rgba(0, 0, 0, 0.5);
                }

                .form-group-contact {
                    margin-bottom: 20px;
                }

                .form-group-contact label {
                    display: block;
                    color: #9ca3af;
                    font-size: 14px;
                    margin-bottom: 8px;
                }

                .form-group-contact input,
                .form-group-contact textarea {
                    width: 100%;
                    padding: 15px;
                    border-radius: 10px;
                    background: rgba(10, 15, 10, 0.5);
                    border: 1px solid var(--border);
                    color: #fff;
                    font-size: 16px;
                    transition: all 0.3s;
                }

                .form-group-contact input:focus,
                .form-group-contact textarea:focus {
                    outline: none;
                    border-color: #22c55e;
                    box-shadow: 0 0 10px rgba(34, 197, 94, 0.2);
                }

                .btn-submit {
                    background: linear-gradient(90deg, #16a34a, #22c55e);
                    color: white;
                    padding: 15px 30px;
                    border: none;
                    border-radius: 10px;
                    font-size: 16px;
                    font-weight: 700;
                    cursor: pointer;
                    width: 100%;
                    transition: transform 0.2s, box-shadow 0.2s;
                }

                .btn-submit:hover {
                    transform: translateY(-2px);
                    box-shadow: 0 10px 20px rgba(34, 197, 94, 0.3);
                }
            </style>
            <link rel="icon" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>📧</text></svg>" />
            </head>

        <body style="background-color: var(--bg-dark); color: var(--text-light); font-family: 'Inter', sans-serif;">
            <nav
                style="padding: 20px 40px; border-bottom: 1px solid var(--border); display: flex; justify-content: space-between; align-items: center; background: rgba(10, 15, 10, 0.9); backdrop-filter: blur(10px); position: sticky; top: 0; z-index: 100;">
                <a href="${pageContext.request.contextPath}/"
                    style="text-decoration: none; display: flex; align-items: center; gap: 10px;">
                    <span style="font-size: 24px;">🌾</span>
                    <span style="font-size: 20px; font-weight: 800; color: #fff;">Smart <span
                            style="color: #22c55e;">Farming</span></span>
                </a>
                <a href="${pageContext.request.contextPath}/" class="btn btn-secondary">← Back to Home</a>
            </nav>

            <div class="contact-container">
                <div class="contact-info">
                    <h1>Get in Touch</h1>
                    <p>Our dedicated support team is available to assist farmers, buyers, and agricultural experts
                        around the clock. Please reach out with any inquiries regarding our AI tools or marketplace.</p>

                    <div class="info-item">
                        <div class="info-icon">📍</div>
                        <div class="info-text">
                            <h4>Head Office</h4>
                            <span>123 Agri-Tech Park, Cyber City, Bangalore, 560001</span>
                        </div>
                    </div>
                    <div class="info-item">
                        <div class="info-icon">📞</div>
                        <div class="info-text">
                            <h4>Toll-Free Helpline</h4>
                            <span>1800-SMART-FARM (1800-123-4567)</span>
                        </div>
                    </div>
                    <div class="info-item">
                        <div class="info-icon">✉️</div>
                        <div class="info-text">
                            <h4>Email Support</h4>
                            <span>contact@smartfarmingplatform.in</span>
                        </div>
                    </div>
                    <div class="info-item">
                        <div class="info-icon">🕒</div>
                        <div class="info-text">
                            <h4>Working Hours</h4>
                            <span>Mon - Sat: 9:00 AM to 6:00 PM</span>
                        </div>
                    </div>
                </div>

                <div class="contact-form">
                    <h2 style="font-size: 24px; color: #f0fdf4; margin-bottom: 30px;">Send us a Message</h2>
                    <form action="#" method="get"
                        onsubmit="event.preventDefault(); alert('Message sent successfully! Our agricultural experts will contact you soon.'); this.reset();">
                        <div class="form-group-contact">
                            <label>Full Name</label>
                            <input type="text" placeholder="Enter your full name" required />
                        </div>
                        <div class="form-group-contact">
                            <label>Email Address / Phone Number</label>
                            <input type="text" placeholder="Enter email or phone" required />
                        </div>
                        <div class="form-group-contact">
                            <label>Inquiry Type</label>
                            <select
                                style="width:100%; padding:15px; border-radius:10px; background:rgba(10,15,10,0.5); border:1px solid var(--border); color:#fff; font-size:16px;">
                                <option>App Login Issue</option>
                                <option>Disease Dashboard Assistance</option>
                                <option>Marketplace Selling</option>
                                <option>Government Scheme Info</option>
                                <option>Other</option>
                            </select>
                        </div>
                        <div class="form-group-contact">
                            <label>Message</label>
                            <textarea rows="5" placeholder="How can we help you today?" required></textarea>
                        </div>
                        <button type="submit" class="btn-submit">📩 Send Message →</button>
                    </form>
                </div>
            </div>
        
<script src="${pageContext.request.contextPath}/js/i18n.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

        </html>
