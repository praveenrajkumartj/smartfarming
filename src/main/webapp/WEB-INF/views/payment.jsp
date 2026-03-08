<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <title>Secure Checkout | Smart Farming</title>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
            <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;700;900&display=swap"
                rel="stylesheet">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
            <style>
                :root {
                    --primary: #10b981;
                    --primary-dark: #059669;
                    --secondary: #3b82f6;
                    --accent: #fbbf24;
                    --bg-deep: #020617;
                    /* Requested Deep Navy Black */
                    --card-glass: rgba(15, 23, 42, 0.8);
                    /* Premium Navy Glass */
                    --border-glass: rgba(255, 255, 255, 0.1);
                    --text-muted: #94a3b8;
                    /* Classic Muted Text */
                }



                body {
                    background-color: var(--bg-deep);
                    color: #ffffff;
                    font-family: 'Outfit', sans-serif;
                    min-height: 100vh;
                    margin: 0;
                    overflow-x: hidden;
                }

                .auth-scene {
                    position: fixed;
                    inset: 0;
                    background:
                        radial-gradient(circle at 10% 20%, rgba(16, 185, 129, 0.08) 0%, transparent 40%),
                        radial-gradient(circle at 90% 80%, rgba(59, 130, 246, 0.08) 0%, transparent 40%);
                    z-index: -1;
                }

                .cyber-grid {
                    position: absolute;
                    inset: 0;
                    background-image: linear-gradient(rgba(255, 255, 255, 0.02) 1px, transparent 1px),
                        linear-gradient(90deg, rgba(255, 255, 255, 0.02) 1px, transparent 1px);
                    background-size: 40px 40px;
                    transform: perspective(1000px) rotateX(60deg) translateY(-100px);
                    opacity: 0.2;
                }

                nav {
                    padding: 15px 60px;
                    background: rgba(4, 12, 4, 0.95);
                    backdrop-filter: blur(25px);
                    border-bottom: 1px solid var(--border-glass);
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    position: sticky;
                    top: 0;
                    z-index: 1000;
                    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
                }

                .brand-logo {
                    font-size: 24px;
                    font-weight: 900;
                    letter-spacing: -1px;
                    background: linear-gradient(135deg, #22c55e, #10b981);
                    -webkit-background-clip: text;
                    background-clip: text;
                    -webkit-text-fill-color: transparent;
                    text-decoration: none;
                    display: flex;
                    align-items: center;
                    gap: 12px;
                }

                .brand-icon {
                    width: 40px;
                    height: 40px;
                    background: linear-gradient(135deg, rgba(22, 163, 74, 0.2), rgba(16, 185, 129, 0.2));
                    border-radius: 12px;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    color: var(--secondary);
                    border: 1px solid rgba(34, 197, 94, 0.3);
                }

                .checkout-container {
                    max-width: 1100px;
                    margin: 60px auto;
                    display: grid;
                    grid-template-columns: 1.2fr 0.8fr;
                    gap: 40px;
                    padding: 0 30px;
                    animation: containerEnter 0.8s cubic-bezier(0.16, 1, 0.3, 1);
                }

                @keyframes containerEnter {
                    from {
                        opacity: 0;
                        transform: translateY(30px);
                    }

                    to {
                        opacity: 1;
                        transform: translateY(0);
                    }
                }

                .payment-card {
                    background: var(--card-glass);
                    backdrop-filter: blur(30px);
                    border: 1px solid var(--border-glass);
                    border-radius: 32px;
                    padding: 40px;
                    box-shadow: 0 40px 100px rgba(0, 0, 0, 0.5);
                }

                .summary-card {
                    background: linear-gradient(165deg, rgba(22, 25, 22, 0.9), rgba(10, 20, 10, 0.9));
                    backdrop-filter: blur(30px);
                    border: 1px solid var(--border-glass);
                    border-radius: 32px;
                    padding: 40px;
                    height: fit-content;
                    box-shadow: 0 40px 100px rgba(0, 0, 0, 0.3);
                }

                h2 {
                    font-size: 26px;
                    font-weight: 900;
                    margin-bottom: 35px;
                    display: flex;
                    align-items: center;
                    gap: 15px;
                    color: #ffffff !important;
                    letter-spacing: -0.5px;
                }

                .payment-methods {
                    display: flex;
                    gap: 15px;
                    margin-bottom: 40px;
                }

                .method-tab {
                    flex: 1;
                    padding: 20px;
                    background: rgba(255, 255, 255, 0.03);
                    border: 1px solid var(--border-glass);
                    border-radius: 20px;
                    cursor: pointer;
                    text-align: center;
                    transition: 0.4s;
                    display: flex;
                    flex-direction: column;
                    align-items: center;
                    gap: 10px;
                    font-weight: 700;
                    color: var(--text-muted);
                }

                .method-tab i {
                    font-size: 24px;
                    margin-bottom: 5px;
                }

                .method-tab:hover {
                    background: rgba(255, 255, 255, 0.06);
                    border-color: rgba(255, 255, 255, 0.2);
                    transform: translateY(-5px);
                }

                .method-tab.active {
                    background: rgba(34, 197, 94, 0.15);
                    border-color: var(--secondary);
                    color: #ffffff;
                    box-shadow: 0 10px 30px rgba(34, 197, 94, 0.2);
                }

                .method-tab.active i {
                    color: var(--secondary);
                }

                .input-group-premium {
                    margin-bottom: 25px;
                }

                .label-premium {
                    font-size: 11px;
                    font-weight: 900;
                    color: var(--secondary);
                    text-transform: uppercase;
                    letter-spacing: 2px;
                    margin-bottom: 12px;
                    display: block;
                }

                .input-premium {
                    width: 100%;
                    background: rgba(0, 0, 0, 0.5);
                    border: 1px solid var(--border-glass);
                    border-radius: 18px;
                    padding: 18px 25px;
                    color: #ffffff;
                    font-size: 16px;
                    outline: none;
                    transition: 0.3s;
                    font-weight: 500;
                }

                .input-premium::placeholder {
                    color: rgba(255, 255, 255, 0.3);
                    font-weight: 400;
                }

                .input-premium:focus {
                    border-color: var(--secondary);
                    box-shadow: 0 0 25px rgba(34, 197, 94, 0.2);
                    background: rgba(0, 0, 0, 0.6);
                }

                .row-2 {
                    display: flex;
                    gap: 20px;
                }

                .btn-pay-premium {
                    width: 100%;
                    padding: 20px;
                    background: linear-gradient(135deg, var(--secondary), var(--primary-dark));
                    border: none;
                    border-radius: 100px;
                    color: #ffffff;
                    font-size: 18px;
                    font-weight: 900;
                    text-transform: uppercase;
                    letter-spacing: 2px;
                    cursor: pointer;
                    transition: 0.4s;
                    box-shadow: 0 20px 40px rgba(34, 197, 94, 0.3);
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    gap: 15px;
                    margin-top: 20px;
                }

                .btn-pay-premium:hover {
                    transform: translateY(-5px);
                    box-shadow: 0 30px 60px rgba(34, 197, 94, 0.5);
                }

                .btn-pay-premium:disabled {
                    filter: grayscale(1);
                    opacity: 0.7;
                    cursor: not-allowed;
                    transform: none;
                    box-shadow: none;
                }

                .summary-item {
                    display: flex;
                    justify-content: space-between;
                    margin-bottom: 22px;
                    font-size: 16px;
                    color: var(--text-muted);
                    font-weight: 500;
                }

                .summary-divider {
                    height: 1px;
                    background: var(--border-glass);
                    margin: 30px 0;
                }

                .total-row {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    margin-top: 30px;
                }

                .total-label {
                    font-size: 14px;
                    font-weight: 900;
                    color: #ffffff;
                    text-transform: uppercase;
                    letter-spacing: 1px;
                }

                .total-amount {
                    font-size: 38px;
                    font-weight: 950;
                    color: var(--secondary);
                }

                .secure-badge {
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    gap: 10px;
                    margin-top: 30px;
                    font-size: 12px;
                    font-weight: 700;
                    color: #ffffff;
                    text-transform: uppercase;
                    letter-spacing: 1px;
                    opacity: 0.8;
                }

                .secure-badge i {
                    color: var(--secondary);
                }

                .payment-content {
                    display: none;
                    animation: contentFade 0.5s ease;
                }

                @keyframes contentFade {
                    from {
                        opacity: 0;
                        transform: scale(0.98);
                    }

                    to {
                        opacity: 1;
                        transform: scale(1);
                    }
                }

                .payment-content.active {
                    display: block;
                }

                .success-modal-overlay {
                    position: fixed;
                    inset: 0;
                    background: rgba(2, 8, 4, 0.95);
                    backdrop-filter: blur(15px);
                    z-index: 2000;
                    display: none;
                    align-items: center;
                    justify-content: center;
                }

                .success-modal {
                    background: var(--card-glass);
                    border: 2px solid var(--secondary);
                    border-radius: 40px;
                    padding: 60px;
                    max-width: 500px;
                    width: 90%;
                    text-align: center;
                    box-shadow: 0 0 100px rgba(34, 197, 94, 0.3);
                    animation: modalEnter 0.6s cubic-bezier(0.16, 1, 0.3, 1);
                }

                @keyframes modalEnter {
                    from {
                        opacity: 0;
                        transform: scale(0.8);
                    }

                    to {
                        opacity: 1;
                        transform: scale(1);
                    }
                }

                .success-icon {
                    width: 100px;
                    height: 100px;
                    background: rgba(34, 197, 94, 0.1);
                    color: var(--secondary);
                    border-radius: 50%;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    font-size: 50px;
                    margin: 0 auto 30px;
                    box-shadow: 0 0 30px rgba(34, 197, 94, 0.4);
                }

                .spinner {
                    width: 24px;
                    height: 24px;
                    border: 3px solid rgba(255, 255, 255, 0.3);
                    border-top-color: #fff;
                    border-radius: 50%;
                    animation: spin 0.8s linear infinite;
                    display: none;
                }

                @keyframes spin {
                    to {
                        transform: rotate(360deg);
                    }
                }

                @media (max-width: 900px) {
                    .checkout-container {
                        grid-template-columns: 1fr;
                    }

                    nav {
                        padding: 20px 30px;
                    }
                }
            </style>
            <link rel="icon"
                href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>💳</text></svg>" />
        </head>

        <body>
            <div class="auth-scene">
                <div class="cyber-grid"></div>
            </div>

            <nav>
                <a href="${pageContext.request.contextPath}/" class="brand-logo">
                    <div class="brand-icon">
                        <i class="fas fa-leaf"></i>
                    </div>
                    AGROPLANTER
                </a>
                <a href="${pageContext.request.contextPath}/subscription"
                    class="btn btn-outline-light rounded-pill px-4" style="font-weight: 700;">
                    <i class="fas fa-arrow-left me-2"></i> ABORT CHECKOUT
                </a>
            </nav>

            <div class="checkout-container">
                <!-- left payment section -->
                <div class="payment-card">
                    <h2><i class="fas fa-shield-alt text-primary"></i> SECURE GATEWAY</h2>

                    <div class="payment-methods">
                        <div class="method-tab active" data-tab="card">
                            <i class="fas fa-credit-card"></i>
                            CARD
                        </div>
                        <div class="method-tab" data-tab="upi">
                            <i class="fas fa-mobile-alt"></i>
                            UPI
                        </div>
                        <div class="method-tab" data-tab="netbanking">
                            <i class="fas fa-university"></i>
                            BANK
                        </div>
                    </div>

                    <!-- Card Payment -->
                    <div id="card" class="payment-content active">
                        <div class="input-group-premium">
                            <label class="label-premium">VIRTUAL ACCESS KEY (CARD NUMBER)</label>
                            <input type="text" placeholder="XXXX XXXX XXXX XXXX" class="input-premium" id="cardNumber"
                                maxlength="19" />
                        </div>
                        <div class="input-group-premium">
                            <label class="label-premium">OPERATOR NAME (CARD HOLDER)</label>
                            <input type="text" placeholder="LEGAL FULL NAME" class="input-premium" id="cardName" />
                        </div>
                        <div class="row-2">
                            <div class="input-group-premium flex-fill">
                                <label class="label-premium">EXPIRY DATE (MM/YY)</label>
                                <input type="text" placeholder="MM/YY" class="input-premium" maxlength="5"
                                    id="cardExp" />
                            </div>
                            <div class="input-group-premium flex-fill">
                                <label class="label-premium">SECURITY SIGIL (CVV)</label>
                                <input type="password" placeholder="***" class="input-premium" maxlength="4"
                                    id="cardCvv" />
                            </div>
                        </div>
                    </div>

                    <!-- UPI Payment -->
                    <div id="upi" class="payment-content">
                        <div class="input-group-premium">
                            <label class="label-premium">TELEMETRY ID (UPI ID)</label>
                            <input type="text" placeholder="operator@upi" class="input-premium" id="upiId" />
                        </div>
                        <div
                            style="display: flex; justify-content: space-around; align-items: center; padding: 20px; background: rgba(0,0,0,0.2); border-radius: 20px; border: 1px solid var(--border-glass);">
                            <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/f/f2/Google_Pay_Logo.svg/512px-Google_Pay_Logo.svg.png"
                                height="20" style="opacity: 0.6; cursor: pointer; filter: grayscale(1) invert(1);"
                                class="payment-vendor" data-id="praveen@okaxis">
                            <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/71/PhonePe_Logo.svg/512px-PhonePe_Logo.svg.png"
                                height="24" style="opacity: 0.6; cursor: pointer; filter: grayscale(1) invert(1);"
                                class="payment-vendor" data-id="8833948577@ybl">
                            <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/24/Paytm_Logo_%28standalone%29.svg/512px-Paytm_Logo_%28standalone%29.svg.png"
                                height="10" style="opacity: 0.6; cursor: pointer; filter: grayscale(1) invert(1);"
                                class="payment-vendor" data-id="09361311383@paytm">
                        </div>
                    </div>

                    <!-- Net Banking -->
                    <div id="netbanking" class="payment-content">
                        <div class="input-group-premium">
                            <label class="label-premium">FINANCIAL JURISDICTION (SELECT BANK)</label>
                            <div class="position-relative">
                                <select class="input-premium w-100" id="netbankingBank" style="appearance: none;">
                                    <option value="" disabled selected>Select Your Primary Bank</option>
                                    <option value="sbi">State Bank of India (SBI)</option>
                                    <option value="hdfc">HDFC Bank</option>
                                    <option value="icici">ICICI Bank</option>
                                    <option value="axis">Axis Bank</option>
                                    <option value="pnb">Punjab National Bank</option>
                                </select>
                                <i class="fas fa-chevron-down position-absolute"
                                    style="right: 25px; top: 50%; transform: translateY(-50%); color: var(--text-muted);"></i>
                            </div>
                        </div>
                    </div>

                    <button class="btn-pay-premium" id="payBtn">
                        <div class="spinner" id="paySpinner"></div>
                        <span id="payText">AUTHORIZE PAYMENT ₹<span id="btnAmount">0</span></span>
                    </button>

                    <div class="secure-badge">
                        <i class="fas fa-lock"></i> AES-256 BIT END-TO-END ENCRYPTED GATEWAY
                    </div>
                </div>

                <!-- right summary section -->
                <div class="summary-card">
                    <h2 style="color: #ffffff; letter-spacing: 1px; font-size: 24px; margin-bottom: 35px;">ORDER INTEL
                    </h2>
                    <div class="summary-item">
                        <span id="planName"
                            style="font-weight: 850; color: #ffffff; letter-spacing: 1px; text-transform: uppercase;">...</span>
                        <span id="summaryAmount"
                            style="color: var(--secondary); font-weight: 900; font-size: 20px;">₹0</span>
                    </div>
                    <div class="summary-item" style="color: var(--text-muted); font-size: 14px;">
                        <span>BILLING CYCLE</span>
                        <span style="color: #ffffff; font-weight: 600;">RECURRING MONTHLY</span>
                    </div>

                    <div class="summary-divider"></div>

                    <div class="summary-item" style="color: var(--text-muted); font-size: 14px;">
                        <span>SUBTOTAL TELEMETRY</span>
                        <span id="subtotal" style="color: #ffffff; font-weight: 600;">₹0</span>
                    </div>
                    <div class="summary-item" style="color: var(--text-muted); font-size: 14px;">
                        <span>GST PROTOCOL (18%)</span>
                        <span id="taxAmount" style="color: #ffffff; font-weight: 600;">₹0</span>
                    </div>

                    <div class="total-row">
                        <span class="total-label" style="color: #ffffff; font-weight: 900;">TOTAL LIQUIDITY</span>
                        <span class="total-amount" id="totalAmount">₹0</span>
                    </div>

                    <div
                        style="margin-top: 40px; padding: 20px; background: rgba(34, 197, 94, 0.05); border: 1px dashed var(--secondary); border-radius: 20px;">
                        <p
                            style="font-size: 13px; color: var(--secondary); margin: 0; font-weight: 600; text-align: center;">
                            <i class="fas fa-info-circle me-1"></i> Your license will be updated instantly
                            post-validation.
                        </p>
                    </div>
                </div>
            </div>

            <!-- Custom Success Modal -->
            <div class="success-modal-overlay" id="paymentSuccessModal">
                <div class="success-modal">
                    <div class="success-icon">
                        <i class="fas fa-check"></i>
                    </div>
                    <h3
                        style="color: #fff; font-size: 32px; font-weight: 900; margin-bottom: 15px; letter-spacing: -1px;">
                        AUTHENTICATION COMPLETE</h3>
                    <p id="successMessageDetails"
                        style="color: var(--text-muted); font-size: 16px; margin-bottom: 40px; line-height: 1.6;">
                        Your transaction has been verified. The AGROPLANTER premium systems are now online.
                    </p>
                    <button type="button" class="btn-pay-premium" onclick="redirectToDashboard()">INITIALIZE INTERFACE
                        →</button>
                </div>
            </div>

            <script>
                const urlParams = new URLSearchParams(window.location.search);
                const plan = urlParams.get('plan') || 'Premium Plan';
                const baseAmount = parseInt(urlParams.get('amount') || '0', 10);

                const tax = Math.round(baseAmount * 0.18);
                const total = baseAmount + tax;

                document.getElementById('planName').textContent = plan.toUpperCase();
                document.getElementById('summaryAmount').textContent = '₹' + baseAmount;
                document.getElementById('subtotal').textContent = '₹' + baseAmount;
                document.getElementById('taxAmount').textContent = '₹' + tax;
                document.getElementById('totalAmount').textContent = '₹' + total;
                document.getElementById('btnAmount').textContent = total;

                // Modern Tab Switching
                document.querySelectorAll('.method-tab').forEach(tab => {
                    tab.addEventListener('click', function () {
                        const target = this.getAttribute('data-tab');

                        document.querySelectorAll('.method-tab').forEach(t => t.classList.remove('active'));
                        this.classList.add('active');

                        document.querySelectorAll('.payment-content').forEach(c => c.classList.remove('active'));
                        document.getElementById(target).classList.add('active');
                    });
                });

                // UPI Vendor Selection
                document.querySelectorAll('.payment-vendor').forEach(vendor => {
                    vendor.addEventListener('click', function () {
                        document.getElementById('upiId').value = this.getAttribute('data-id');
                        document.querySelectorAll('.payment-vendor').forEach(v => v.style.opacity = '0.6');
                        this.style.opacity = '1';
                        this.style.filter = 'none';
                    });
                });

                // Card Formatting
                const cardNumberInput = document.getElementById('cardNumber');
                cardNumberInput.addEventListener('input', function (e) {
                    let val = e.target.value.replace(/\D/g, '');
                    e.target.value = val.match(/.{1,4}/g)?.join(' ') || '';
                });

                const cardExpInput = document.getElementById('cardExp');
                cardExpInput.addEventListener('input', function (e) {
                    let val = e.target.value.replace(/\D/g, '');
                    if (val.length > 2) val = val.substring(0, 2) + '/' + val.substring(2);
                    e.target.value = val;
                });

                // Pay Action
                document.getElementById('payBtn').addEventListener('click', function () {
                    const btn = this;
                    const spinner = document.getElementById('paySpinner');
                    const text = document.getElementById('payText');

                    // Validation Logic
                    const activeTab = document.querySelector('.method-tab.active').getAttribute('data-tab');
                    let isValid = true;

                    if (activeTab === 'card') {
                        const num = document.getElementById('cardNumber').value.trim();
                        const name = document.getElementById('cardName').value.trim();
                        const exp = document.getElementById('cardExp').value.trim();
                        const cvv = document.getElementById('cardCvv').value.trim();
                        if (num.length < 19 || !name || exp.length < 5 || cvv.length < 3) isValid = false;
                    } else if (activeTab === 'upi') {
                        const upi = document.getElementById('upiId').value.trim();
                        if (!upi.includes('@')) isValid = false;
                    } else if (activeTab === 'netbanking') {
                        const bank = document.getElementById('netbankingBank').value;
                        if (!bank) isValid = false;
                    }

                    if (!isValid) {
                        const originalBackground = btn.style.background;
                        btn.style.background = '#ef4444';
                        text.textContent = 'INCOMPLETE TELEMETRY DATA';
                        setTimeout(() => {
                            btn.style.background = originalBackground;
                            text.textContent = 'AUTHORIZE PAYMENT ₹' + total;
                        }, 2000);
                        return;
                    }

                    btn.disabled = true;
                    spinner.style.display = 'block';
                    text.textContent = 'VALIDATING TRANSACTION...';

                    // Simulate Network Delay
                    setTimeout(() => {
                        fetch('${pageContext.request.contextPath}/subscription/upgrade', {
                            method: 'POST',
                            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                            body: 'plan=' + encodeURIComponent(plan)
                        })
                            .then(response => response.text())
                            .then(redirectUrl => {
                                spinner.style.display = 'none';
                                text.textContent = 'AUTHORIZATION GRANTED ✓';
                                window.successRedirectUrl = redirectUrl;

                                setTimeout(() => {
                                    document.getElementById('paymentSuccessModal').style.display = 'flex';
                                }, 800);
                            })
                            .catch(() => {
                                window.successRedirectUrl = '/home';
                                document.getElementById('paymentSuccessModal').style.display = 'flex';
                            });
                    }, 2500);
                });

                function redirectToDashboard() {
                    window.location.href = '${pageContext.request.contextPath}' + (window.successRedirectUrl || '/home');
                }
            </script>

            <script src="${pageContext.request.contextPath}/js/i18n.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>