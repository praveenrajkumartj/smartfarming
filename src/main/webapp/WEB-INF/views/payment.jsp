<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <title>Secure Checkout | Smart Farming</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
            <style>
                .checkout-container {
                    max-width: 1000px;
                    margin: 60px auto;
                    display: grid;
                    grid-template-columns: 1fr 400px;
                    gap: 30px;
                    padding: 0 20px;
                }

                .payment-box {
                    background: var(--surface);
                    border: 1px solid var(--border);
                    border-radius: 16px;
                    padding: 40px;
                }

                .summary-box {
                    background: linear-gradient(135deg, #0d2515, #1a3824);
                    border: 1px solid rgba(34, 197, 94, 0.2);
                    border-radius: 16px;
                    padding: 40px;
                    height: fit-content;
                }

                h2 {
                    font-size: 24px;
                    color: #f0fdf4;
                    margin-bottom: 25px;
                    font-weight: 700;
                }

                .payment-methods {
                    display: grid;
                    grid-template-columns: 1fr 1fr 1fr;
                    gap: 20px;
                    margin-bottom: 30px;
                }

                .method-tab {
                    display: flex;
                    flex-direction: column;
                    align-items: center;
                    justify-content: center;
                    gap: 15px;
                    padding: 25px 20px;
                    background: transparent;
                    border: 1px solid rgba(255, 255, 255, 0.2);
                    border-radius: 16px;
                    color: #fff;
                    cursor: pointer;
                    font-weight: 700;
                    font-size: 18px;
                    transition: all 0.3s;
                }

                .method-tab svg {
                    color: #fbbf24;
                    transition: all 0.3s;
                }

                .method-tab:hover {
                    border-color: rgba(255, 255, 255, 0.4);
                }

                .method-tab.active {
                    border-color: #fbbf24;
                }

                .input-card-box {
                    border: 1px solid rgba(255, 255, 255, 0.1);
                    border-radius: 12px;
                    background: rgba(255, 255, 255, 0.02);
                    padding: 24px;
                }

                .card-input-row {
                    margin-bottom: 16px;
                }

                .card-input-row:last-child {
                    margin-bottom: 0;
                }

                .card-input-field {
                    width: 100%;
                    padding: 16px 20px;
                    background: rgba(10, 15, 10, 0.5);
                    border: 1px solid rgba(255, 255, 255, 0.1);
                    border-radius: 10px;
                    color: white;
                    font-size: 16px;
                    outline: none;
                    transition: border-color 0.3s;
                }

                .card-input-field:focus {
                    border-color: #fbbf24;
                }

                .payment-content {
                    display: none;
                }

                .payment-content.active {
                    display: block;
                    animation: fadeIn 0.3s ease;
                }

                .input-group {
                    margin-bottom: 20px;
                }

                .input-group label {
                    display: block;
                    color: #9ca3af;
                    margin-bottom: 8px;
                    font-size: 14px;
                }

                .input-group input {
                    width: 100%;
                    padding: 14px 20px;
                    background: rgba(10, 15, 10, 0.5);
                    border: 1px solid var(--border);
                    border-radius: 8px;
                    color: white;
                    font-size: 16px;
                    outline: none;
                    transition: border-color 0.3s;
                }

                .input-group input:focus {
                    border-color: #22c55e;
                    box-shadow: 0 0 0 2px rgba(34, 197, 94, 0.2);
                }

                .grid-2 {
                    display: grid;
                    grid-template-columns: 1fr 1fr;
                    gap: 20px;
                }

                .btn-pay {
                    width: 100%;
                    padding: 16px;
                    background: linear-gradient(135deg, #22c55e, #16a34a);
                    color: white;
                    border: none;
                    border-radius: 8px;
                    font-size: 18px;
                    font-weight: bold;
                    cursor: pointer;
                    box-shadow: 0 4px 15px rgba(34, 197, 94, 0.3);
                    transition: all 0.3s;
                    margin-top: 20px;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    gap: 10px;
                }

                .btn-pay:hover {
                    transform: translateY(-2px);
                    box-shadow: 0 6px 20px rgba(34, 197, 94, 0.4);
                }

                .btn-pay:disabled {
                    background: #4b5563;
                    cursor: not-allowed;
                    transform: none;
                    box-shadow: none;
                }

                .summary-item {
                    display: flex;
                    justify-content: space-between;
                    color: #d1d5db;
                    margin-bottom: 15px;
                    font-size: 16px;
                }

                .summary-total {
                    display: flex;
                    justify-content: space-between;
                    color: #22c55e;
                    font-size: 24px;
                    font-weight: bold;
                    margin-top: 20px;
                    padding-top: 20px;
                    border-top: 1px dashed rgba(34, 197, 94, 0.3);
                }

                @keyframes fadeIn {
                    from {
                        opacity: 0;
                        transform: translateY(10px);
                    }

                    to {
                        opacity: 1;
                        transform: translateY(0);
                    }
                }

                /* Loading Spinner */
                .spinner {
                    border: 3px solid rgba(255, 255, 255, 0.3);
                    width: 20px;
                    height: 20px;
                    border-radius: 50%;
                    border-left-color: #fff;
                    animation: spin 1s linear infinite;
                    display: none;
                }

                @keyframes spin {
                    0% {
                        transform: rotate(0deg);
                    }

                    100% {
                        transform: rotate(360deg);
                    }
                }

                .upi-apps {
                    display: flex;
                    gap: 15px;
                    margin-bottom: 20px;
                    justify-content: center;
                }

                .upi-btn {
                    background: rgba(255, 255, 255, 0.05);
                    border: 1px solid var(--border);
                    padding: 15px 25px;
                    border-radius: 8px;
                    color: #f3f4f6;
                    cursor: pointer;
                    font-weight: 600;
                    transition: all 0.3s ease;
                }

                .upi-btn:hover {
                    background: rgba(34, 197, 94, 0.1);
                    border-color: #22c55e;
                }

                .upi-btn.active-upi {
                    background: #22c55e;
                    border-color: #16a34a;
                    color: #fff;
                    box-shadow: 0 4px 12px rgba(34, 197, 94, 0.4);
                }

                @media (max-width: 900px) {
                    .checkout-container {
                        grid-template-columns: 1fr;
                    }
                }
            </style>
            <link rel="icon" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>💳</text></svg>" />
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
                <a href="${pageContext.request.contextPath}/subscription" class="btn btn-secondary">← Back to Plans</a>
            </nav>

            <div class="checkout-container">
                <!-- left payment section -->
                <div class="payment-box">
                    <h2>Payment Details</h2>

                    <div class="payment-methods">
                        <div class="method-tab active" onclick="switchTab('card')">
                            <svg width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <rect x="1" y="4" width="22" height="16" rx="2" ry="2"></rect>
                                <line x1="1" y1="10" x2="23" y2="10"></line>
                            </svg>
                            Card
                        </div>
                        <div class="method-tab" onclick="switchTab('upi')">
                            <svg width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <rect x="5" y="2" width="14" height="20" rx="2" ry="2"></rect>
                                <line x1="12" y1="18" x2="12.01" y2="18"></line>
                            </svg>
                            UPI
                        </div>
                        <div class="method-tab" onclick="switchTab('netbanking')">
                            <svg width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <circle cx="12" cy="12" r="10"></circle>
                                <line x1="2" y1="12" x2="22" y2="12"></line>
                                <path
                                    d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z">
                                </path>
                            </svg>
                            Bank
                        </div>
                    </div>

                    <!-- Card Payment -->
                    <div id="card" class="payment-content active">
                        <div class="input-card-box">
                            <div class="card-input-row">
                                <input type="text" placeholder="Card Number (XXXX XXXX XXXX >" class="card-input-field"
                                    id="cardNumber" maxlength="19" oninput="formatCard(this)" />
                            </div>
                            <div class="card-input-row">
                                <input type="text" placeholder="Card Holder Name" class="card-input-field"
                                    id="cardName" />
                            </div>
                            <div class="grid-2 card-input-row">
                                <input type="text" placeholder="MM/YY" class="card-input-field" maxlength="5"
                                    id="cardExp" oninput="formatExp(this)" />
                                <input type="password" placeholder="CVV" class="card-input-field" maxlength="3"
                                    id="cardCvv" />
                            </div>
                        </div>
                    </div>

                    <!-- UPI Payment -->
                    <div id="upi" class="payment-content">
                        <div class="input-card-box">
                            <input type="text" placeholder="09361311383@paytm" class="card-input-field"
                                style="margin-bottom: 35px;" id="upiId" />
                            <div
                                style="display: flex; justify-content: space-around; align-items: center; padding: 0 10px;">
                                <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/f/f2/Google_Pay_Logo.svg/512px-Google_Pay_Logo.svg.png"
                                    height="24" style="opacity: 0.8; cursor: pointer; transition: 0.3s;"
                                    onmouseover="this.style.opacity=1" onmouseout="this.style.opacity=0.8"
                                    onclick="document.getElementById('upiId').value='praveenrajkumarthangraj@okaxis'">
                                <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/71/PhonePe_Logo.svg/512px-PhonePe_Logo.svg.png"
                                    height="28" style="opacity: 0.8; cursor: pointer; transition: 0.3s;"
                                    onmouseover="this.style.opacity=1" onmouseout="this.style.opacity=0.8"
                                    onclick="document.getElementById('upiId').value='8833948577@ybl'">
                                <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/24/Paytm_Logo_%28standalone%29.svg/512px-Paytm_Logo_%28standalone%29.svg.png"
                                    height="12" style="opacity: 0.8; cursor: pointer; transition: 0.3s;"
                                    onmouseover="this.style.opacity=1" onmouseout="this.style.opacity=0.8"
                                    onclick="document.getElementById('upiId').value='09361311383@paytm'">
                            </div>
                        </div>
                    </div>

                    <!-- Net Banking -->
                    <div id="netbanking" class="payment-content">
                        <div class="input-card-box">
                            <select class="card-input-field" style="appearance: none;">
                                <option value="" disabled selected>Select Your Bank</option>
                                <option value="sbi">State Bank of India (SBI)</option>
                                <option value="hdfc">HDFC Bank</option>
                                <option value="icici">ICICI Bank</option>
                                <option value="axis">Axis Bank</option>
                                <option value="pnb">Punjab National Bank</option>
                            </select>
                        </div>
                    </div>

                    <button class="btn-pay" id="payBtn" onclick="processPayment()">
                        <span class="spinner" id="paySpinner"></span>
                        <span id="payText">Pay Securely ₹<span id="btnAmount">0</span></span>
                    </button>

                    <div
                        style="text-align:center; margin-top:20px; font-size:12px; color:#6b7280; display:flex; align-items:center; justify-content:center; gap:5px;">
                        <span>🔒</span> 256-bit SSL Encrypted Payment Gateway
                    </div>
                </div>

                <!-- right summary section -->
                <div class="summary-box">
                    <h2>Order Summary</h2>
                    <div class="summary-item">
                        <span style="font-weight:600; color:#fff;" id="planName">Loading...</span>
                        <span id="summaryAmount">₹0</span>
                    </div>
                    <div class="summary-item" style="font-size:14px; margin-bottom: 30px;">
                        <span>Billing Cycle</span>
                        <span>Monthly</span>
                    </div>

                    <div class="summary-item">
                        <span>Subtotal</span>
                        <span id="subtotal">₹0</span>
                    </div>
                    <div class="summary-item">
                        <span>GST (18%)</span>
                        <span id="taxAmount">₹0</span>
                    </div>

                    <div class="summary-total">
                        <span>Total Due</span>
                        <span id="totalAmount">₹0</span>
                    </div>
                </div>
            </div>

            <!-- Custom Success Modal -->
            <div id="paymentSuccessModal"
                style="display:none; position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0,0,0,0.7); backdrop-filter:blur(5px); z-index:9999; align-items:center; justify-content:center;">
                <div
                    style="background:var(--surface); border:1px solid #22c55e; border-radius:16px; padding:40px; max-width:450px; width:90%; box-shadow:0 20px 50px rgba(34,197,94,0.3); text-align:center;">
                    <div
                        style="font-size: 80px; margin-bottom: 20px; line-height: 1; text-shadow: 0 0 20px rgba(34,197,94,0.5);">
                        ✅</div>
                    <h3 style="color:#22c55e; font-size:26px; font-weight:800; margin-bottom:12px; margin-top:0;">
                        Payment Successful!</h3>
                    <p id="successMessageDetails"
                        style="color:#d1d5db; font-size:16px; margin-bottom:30px; line-height:1.6;">Your subscription is
                        now active.</p>
                    <button type="button" class="btn btn-primary" style="width:100%; padding:14px; font-size:16px;"
                        onclick="redirectToDashboard()">Proceed to Dashboard</button>
                </div>
            </div>

            <script>
                // Parse URL Parameters for plan details
                const urlParams = new URLSearchParams(window.location.search);
                const plan = urlParams.get('plan') || 'Custom Plan';
                const baseAmount = parseInt(urlParams.get('amount') || '0', 10);

                // Calculate tax and total
                const tax = Math.round(baseAmount * 0.18);
                const total = baseAmount + tax;

                // Apply to DOM
                document.getElementById('planName').textContent = plan + ' Subscription';
                document.getElementById('summaryAmount').textContent = '₹' + baseAmount;
                document.getElementById('subtotal').textContent = '₹' + baseAmount;
                document.getElementById('taxAmount').textContent = '₹' + tax;
                document.getElementById('totalAmount').textContent = '₹' + total;
                document.getElementById('btnAmount').textContent = total;

                // Tab Switching Logic
                function switchTab(tabId) {
                    document.querySelectorAll('.method-tab').forEach(tab => tab.classList.remove('active'));
                    document.querySelectorAll('.payment-content').forEach(content => content.classList.remove('active'));

                    event.target.classList.add('active');
                    document.getElementById(tabId).classList.add('active');
                }

                // Select UPI Logic
                function selectUpi(element) {
                    document.querySelectorAll('.upi-btn').forEach(btn => btn.classList.remove('active-upi'));
                    element.classList.add('active-upi');
                }

                // Card Formatting
                function formatCard(input) {
                    let val = input.value.replace(/\D/g, '');
                    let formatted = val.match(/.{1,4}/g)?.join(' ') || '';
                    input.value = formatted;
                }

                function formatExp(input) {
                    let val = input.value.replace(/\D/g, '');
                    if (val.length > 2) {
                        val = val.substring(0, 2) + '/' + val.substring(2);
                    }
                    input.value = val;
                }

                // Fake Payment Processor
                function processPayment() {
                    const btn = document.getElementById('payBtn');
                    const spinner = document.getElementById('paySpinner');
                    const text = document.getElementById('payText');

                    btn.disabled = true;
                    spinner.style.display = 'block';
                    text.textContent = 'Processing...';

                    setTimeout(() => {
                        spinner.style.display = 'none';
                        text.textContent = 'Payment Successful! ✓';
                        btn.style.background = '#16a34a'; /* Darker success green */

                        // Actually upgrade the plan in the database
                        fetch('${pageContext.request.contextPath}/subscription/upgrade', {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/x-www-form-urlencoded'
                            },
                            body: 'plan=' + encodeURIComponent(plan)
                        }).then(response => response.text()).then(redirectUrl => {
                            setTimeout(() => {
                                document.getElementById('successMessageDetails').textContent = 'Thank you! Your ' + plan + ' subscription is now fully active with premium features unlocked.';
                                document.getElementById('paymentSuccessModal').style.display = 'flex';
                                // Store correct dashboard path dynamically generated by backend based on role
                                window.successRedirectUrl = redirectUrl;
                            }, 500);
                        }).catch(err => {
                            // fallback
                            window.successRedirectUrl = '/home';
                        });

                    }, 3000); // 3 seconds fake loading
                }

                function redirectToDashboard() {
                    window.location.href = '${pageContext.request.contextPath}' + (window.successRedirectUrl || '/home');
                }
            </script>
        
<script src="${pageContext.request.contextPath}/js/i18n.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

        </html>
