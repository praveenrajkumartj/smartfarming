<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <title>Terms & Policies | Smart Farming Platform</title>
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
                    color: #22c55e;
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
                    background: #22c55e;
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
                    background: rgba(34, 197, 94, 0.05);
                    border-left: 4px solid #22c55e;
                    padding: 20px;
                    border-radius: 0 8px 8px 0;
                    margin: 30px 0;
                }
            </style>
            <link rel="icon" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>📜</text></svg>" />
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
                    <h1>Terms of Service</h1>
                    <p>Last Updated: October 2026</p>
                </div>

                <div class="doc-content">
                    <div class="highlight-box">
                        Please read these terms carefully before accessing or using the Smart Farming Platform. By
                        accessing or using any part of the site, you agree to be bound by these Terms of Service.
                    </div>

                    <h2>1. AI Disease Diagnostics Disclaimer</h2>
                    <p>The disease detection features provided by the Smart Farming Platform are powered by artificial
                        intelligence and preliminary expert models. They are intended for <strong>informational purposes
                            only</strong>.</p>
                    <ul>
                        <li>The Confidence Score is an algorithmic estimation, not a guarantee.</li>
                        <li>Farmers must physically verify crop issues or consult with local agricultural extension
                            officers before applying heavy chemical treatments.</li>
                        <li>The Platform is not liable for crop loss due to misdiagnosis or incorrect application of
                            suggested treatments.</li>
                    </ul>

                    <h2>2. Marketplace Usage & Transactions</h2>
                    <p>The Smart Farming Marketplace connects Farmers directly with Buyers. The Platform provides the
                        listing infrastructure but does not intermediate financial transactions.</p>
                    <ul>
                        <li>All negotiations, payments, and delivery logistics are strictly between the Farmer and the
                            Buyer.</li>
                        <li>Users are prohibited from listing illegal or highly restricted flora/chemicals.</li>
                        <li>The Platform reserves the right to suspend accounts engaged in fraudulent marketplace
                            activities.</li>
                    </ul>

                    <h2>3. User Account Security</h2>
                    <p>You are responsible for maintaining the confidentiality of your account password and dashboard
                        access. Any activities that occur under your account, including profile updates and disease
                        queries, are your responsibility.</p>
                </div>
            </div>
        
<script src="${pageContext.request.contextPath}/js/i18n.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

        </html>
