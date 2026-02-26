<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <title>Privacy Policy | Smart Farming Platform</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
            <style>
                .doc-container {
                    max-width: 900px;
                    margin: 60px auto;
                    padding: 40px;
                    background: var(--surface);
                    border: 1px solid var(--border);
                    border-radius: 20px;
                    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
                    line-height: 1.8;
                    color: #d1d5db;
                }

                .doc-header {
                    text-align: center;
                    margin-bottom: 50px;
                    padding-bottom: 30px;
                    border-bottom: 1px solid rgba(255, 255, 255, 0.1);
                }

                .doc-header h1 {
                    font-size: 36px;
                    color: #3b82f6;
                    margin-bottom: 10px;
                }

                .doc-header p {
                    font-size: 16px;
                    color: #9ca3af;
                }

                .doc-content h2 {
                    font-size: 24px;
                    color: #f0fdf4;
                    margin-top: 40px;
                    margin-bottom: 15px;
                    display: flex;
                    align-items: center;
                    gap: 10px;
                }

                .doc-content h2::before {
                    content: '';
                    display: inline-block;
                    width: 8px;
                    height: 24px;
                    background: #3b82f6;
                    border-radius: 4px;
                }

                .doc-content p {
                    margin-bottom: 20px;
                }

                .doc-content ul {
                    margin-left: 20px;
                    margin-bottom: 20px;
                }

                .doc-content li {
                    margin-bottom: 10px;
                }

                .highlight-box {
                    background: rgba(59, 130, 246, 0.05);
                    border-left: 4px solid #3b82f6;
                    padding: 20px;
                    border-radius: 0 8px 8px 0;
                    margin: 30px 0;
                }
            </style>
            <link rel="icon" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🛡️</text></svg>" />
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

            <div class="doc-container">
                <div class="doc-header">
                    <h1>Privacy Policy</h1>
                    <p>Transparency regarding your data and privacy.</p>
                </div>

                <div class="doc-content">
                    <div class="highlight-box">
                        Smart Farming Platform is committed to protecting the privacy and security of our Farmers and
                        Buyers. We do not sell your personal data to third-party data brokers.
                    </div>

                    <h2>1. Information We Collect</h2>
                    <p>To provide our services efficiently, we collect the following types of information when you
                        register and use the platform:</p>
                    <ul>
                        <li><strong>Profile Information:</strong> Full name, email address, phone number, state, and
                            district.</li>
                        <li><strong>Farm Data:</strong> Crop details, soil types, and marketplace listings explicitly
                            uploaded by you.</li>
                        <li><strong>Uploaded Images:</strong> Plant disease images uploaded to our AI Diagnostic tool.
                        </li>
                    </ul>

                    <h2>2. How We Use Your Information</h2>
                    <p>Your agricultural data is utilized exclusively for generating accurate insights and expanding
                        your market reach:</p>
                    <ul>
                        <li>To provide instantaneous <strong>AI Crop Recommendations</strong> based on your location and
                            soil type.</li>
                        <li>To process and analyze crop disease images via our AI models and Expert Admins.</li>
                        <li>To display your contact information (phone number) securely to Buyers only when you create a
                            Marketplace Listing.</li>
                    </ul>

                    <h2>3. Data Protection and Deletion</h2>
                    <p>Your password is cryptographically hashed and cannot be viewed by Administrators. You possess the
                        right to request full account deletion via your settings or by contacting Support, which will
                        remove all traces of your personal data and listings from our servers.</p>
                </div>
            </div>
        
<script src="${pageContext.request.contextPath}/js/i18n.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

        </html>
