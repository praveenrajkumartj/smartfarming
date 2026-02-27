<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <title>Help Center & Support | Smart Farming Platform</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
            <style>
                .help-hero {
                    background: linear-gradient(rgba(10, 15, 10, 0.8), rgba(10, 15, 10, 0.9)), url('https://images.unsplash.com/photo-1599839619722-39751411ea63?q=80&w=2070') center/cover;
                    padding: 100px 20px;
                    text-align: center;
                    border-bottom: 1px solid var(--border);
                }

                .help-hero h1 {
                    font-size: 48px;
                    color: #22c55e;
                    margin-bottom: 20px;
                }

                .help-hero p {
                    font-size: 18px;
                    color: #d1d5db;
                    max-width: 600px;
                    margin: 0 auto 40px;
                }

                .search-box {
                    max-width: 600px;
                    margin: 0 auto;
                    position: relative;
                }

                .search-box input {
                    width: 100%;
                    padding: 20px 30px;
                    border-radius: 50px;
                    background: rgba(255, 255, 255, 0.1);
                    border: 1px solid rgba(255, 255, 255, 0.2);
                    color: white;
                    font-size: 18px;
                    backdrop-filter: blur(10px);
                    transition: all 0.3s;
                }

                .search-box input:focus {
                    outline: none;
                    border-color: #22c55e;
                    box-shadow: 0 0 20px rgba(34, 197, 94, 0.2);
                    background: rgba(255, 255, 255, 0.15);
                }

                .help-grid {
                    display: grid;
                    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
                    gap: 30px;
                    max-width: 1200px;
                    margin: -40px auto 60px;
                    padding: 0 20px;
                    position: relative;
                    z-index: 10;
                }

                .help-card {
                    background: var(--surface);
                    border: 1px solid var(--border);
                    border-radius: 16px;
                    padding: 30px;
                    transition: transform 0.3s ease, box-shadow 0.3s ease;
                }

                .help-card:hover {
                    transform: translateY(-5px);
                    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
                    border-color: rgba(34, 197, 94, 0.4);
                }

                .help-card-icon {
                    font-size: 40px;
                    margin-bottom: 20px;
                    background: rgba(34, 197, 94, 0.1);
                    width: 80px;
                    height: 80px;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    border-radius: 20px;
                }

                .help-card h3 {
                    font-size: 20px;
                    color: #f0fdf4;
                    margin-bottom: 15px;
                }

                .help-card p {
                    color: #9ca3af;
                    line-height: 1.6;
                    margin-bottom: 20px;
                }

                .read-articles-btn {
                    color: #22c55e;
                    text-decoration: none;
                    font-weight: 600;
                    display: flex;
                    align-items: center;
                    gap: 5px;
                    cursor: pointer;
                    background: none;
                    border: none;
                    padding: 0;
                    font-size: 15px;
                }

                .read-articles-btn:hover {
                    color: #4ade80;
                }

                .article-content {
                    display: none;
                    margin-top: 15px;
                    padding-top: 15px;
                    border-top: 1px solid rgba(255, 255, 255, 0.1);
                }

                .article-content.active {
                    display: block;
                    animation: fadeIn 0.3s ease;
                }

                @keyframes fadeIn {
                    from {
                        opacity: 0;
                        transform: translateY(-10px);
                    }

                    to {
                        opacity: 1;
                        transform: translateY(0);
                    }
                }

                .article-item {
                    padding: 10px 0;
                    border-bottom: 1px dashed rgba(255, 255, 255, 0.05);
                    cursor: pointer;
                    color: #d1d5db;
                    transition: color 0.2s;
                }

                .article-item:last-child {
                    border-bottom: none;
                }

                .article-item:hover {
                    color: #22c55e;
                }

                .article-answer {
                    display: none;
                    padding: 12px 16px;
                    background: rgba(34, 197, 94, 0.05);
                    border-left: 3px solid #22c55e;
                    margin-top: 5px;
                    margin-bottom: 10px;
                    font-size: 14px;
                    color: #9ca3af;
                    line-height: 1.5;
                    border-radius: 0 4px 4px 0;
                }

                .article-answer.open {
                    display: block;
                    animation: fadeIn 0.3s ease;
                }

                /* Chatbot Widget Styles */
                .chat-widget-btn {
                    position: fixed;
                    bottom: 30px;
                    right: 30px;
                    width: 60px;
                    height: 60px;
                    background: linear-gradient(135deg, #22c55e, #16a34a);
                    border-radius: 50%;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    font-size: 28px;
                    color: white;
                    box-shadow: 0 4px 15px rgba(34, 197, 94, 0.4);
                    cursor: pointer;
                    z-index: 1000;
                    transition: transform 0.3s, box-shadow 0.3s;
                    border: 2px solid rgba(255, 255, 255, 0.2);
                }

                .chat-widget-btn:hover {
                    transform: scale(1.1);
                    box-shadow: 0 6px 20px rgba(34, 197, 94, 0.6);
                }

                .chat-window {
                    position: fixed;
                    bottom: 100px;
                    right: 30px;
                    width: 350px;
                    max-width: calc(100vw - 40px);
                    background: var(--surface);
                    border: 1px solid var(--border);
                    border-radius: 20px;
                    box-shadow: 0 10px 40px rgba(0, 0, 0, 0.5);
                    z-index: 1000;
                    display: none;
                    flex-direction: column;
                    overflow: hidden;
                    opacity: 0;
                    transform: translateY(20px);
                    transition: opacity 0.3s, transform 0.3s;
                }

                .chat-window.open {
                    display: flex;
                    opacity: 1;
                    transform: translateY(0);
                }

                .chat-header {
                    background: linear-gradient(135deg, #16a34a, #14532d);
                    padding: 15px 20px;
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                }

                .chat-title {
                    color: white;
                    font-weight: 700;
                    display: flex;
                    align-items: center;
                    gap: 10px;
                }

                .chat-close {
                    color: white;
                    cursor: pointer;
                    background: rgba(255, 255, 255, 0.2);
                    border-radius: 50%;
                    width: 25px;
                    height: 25px;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    border: none;
                }

                .chat-close:hover {
                    background: rgba(255, 255, 255, 0.4);
                }

                .chat-body {
                    height: 350px;
                    padding: 20px;
                    overflow-y: auto;
                    display: flex;
                    flex-direction: column;
                    gap: 15px;
                    background: rgba(10, 15, 10, 0.6);
                }

                .chat-message {
                    max-width: 80%;
                    padding: 12px 16px;
                    border-radius: 12px;
                    font-size: 14px;
                    line-height: 1.5;
                    animation: slideIn 0.3s ease forwards;
                }

                .chat-message.bot {
                    background: rgba(34, 197, 94, 0.15);
                    color: #f0fdf4;
                    align-self: flex-start;
                    border-bottom-left-radius: 4px;
                    border: 1px solid rgba(34, 197, 94, 0.3);
                }

                .chat-message.user {
                    background: #22c55e;
                    color: white;
                    align-self: flex-end;
                    border-bottom-right-radius: 4px;
                    box-shadow: 0 4px 10px rgba(34, 197, 94, 0.2);
                }

                .chat-input-area {
                    padding: 15px;
                    background: var(--surface);
                    border-top: 1px solid var(--border);
                    display: flex;
                    gap: 10px;
                }

                .chat-input-area input {
                    flex: 1;
                    padding: 10px 15px;
                    border-radius: 20px;
                    border: 1px solid rgba(255, 255, 255, 0.2);
                    background: rgba(255, 255, 255, 0.05);
                    color: white;
                    outline: none;
                }

                .chat-input-area input:focus {
                    border-color: #22c55e;
                }

                .chat-input-area button {
                    background: #22c55e;
                    color: white;
                    border: none;
                    width: 40px;
                    height: 40px;
                    border-radius: 50%;
                    cursor: pointer;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    transition: background 0.2s;
                }

                .chat-input-area button:hover {
                    background: #16a34a;
                }

                .typing-indicator {
                    display: none;
                    align-items: center;
                    gap: 5px;
                    padding: 10px 15px;
                    background: rgba(34, 197, 94, 0.1);
                    align-self: flex-start;
                    border-radius: 12px;
                    border-bottom-left-radius: 4px;
                    border: 1px solid rgba(34, 197, 94, 0.2);
                    width: fit-content;
                }

                .typing-dot {
                    width: 6px;
                    height: 6px;
                    background: #22c55e;
                    border-radius: 50%;
                    animation: typing 1.4s infinite ease-in-out both;
                }

                .typing-dot:nth-child(1) {
                    animation-delay: -0.32s;
                }

                .typing-dot:nth-child(2) {
                    animation-delay: -0.16s;
                }

                @keyframes typing {

                    0%,
                    80%,
                    100% {
                        transform: scale(0);
                    }

                    40% {
                        transform: scale(1);
                    }
                }

                @keyframes slideIn {
                    from {
                        opacity: 0;
                        transform: translateY(10px);
                    }

                    to {
                        opacity: 1;
                        transform: translateY(0);
                    }
                }

                ::-webkit-scrollbar {
                    width: 6px;
                }

                ::-webkit-scrollbar-track {
                    background: transparent;
                }

                ::-webkit-scrollbar-thumb {
                    background: rgba(255, 255, 255, 0.1);
                    border-radius: 10px;
                }

                ::-webkit-scrollbar-thumb:hover {
                    background: rgba(255, 255, 255, 0.2);
                }
            </style>
            <link rel="icon"
                href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>❓</text></svg>" />
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
                <div class="top-nav-right">
                    <a href="${pageContext.request.contextPath}/" class="btn btn-secondary">← Back to Home</a>
                </div>
            </nav>

            <div class="help-hero">
                <h1>How can we help you?</h1>
                <p>Search our knowledge base or browse categories below to find answers to your questions about the
                    Smart Farming Platform.</p>
                <div class="search-box">
                    <input type="text" id="searchInput" placeholder="Search for 'disease detection', 'market prices'..."
                        onkeyup="filterArticles()" />
                </div>
            </div>

            <div class="help-grid" id="helpGrid">
                <div class="help-card searchable">
                    <div class="help-card-icon">💡</div>
                    <h3>Account & Login</h3>
                    <p>Troubleshoot login issues, password resets, and role registrations (Farmer, Buyer,
                        Admin).</p>
                    <button class="read-articles-btn" onclick="toggleArticles('acc-articles', this)">
                        <span>Read Articles</span> <span>↓</span>
                    </button>
                    <div class="article-content" id="acc-articles">
                        <div class="article-item" onclick="toggleAnswer('ans1')">Resetting your forgotten
                            password <span style="float:right;">+</span></div>
                        <div class="article-answer" id="ans1">Go to the Login page and click 'Forgot Password'.
                            You will
                            be able to reset it by verifying your registered phone number.</div>

                        <div class="article-item" onclick="toggleAnswer('ans2')">Documentation: Roles Explained
                            <span style="float:right;">+</span>
                        </div>
                        <div class="article-answer" id="ans2">
                            <strong>Farmer:</strong> Access crop recommendations, AI disease diagnosis, scheme
                            apps, and
                            marketplace listing.<br>
                            <strong>Buyer:</strong> Browse marketplace, contact farmers, and check live mandi
                            prices.<br>
                            <strong>Admin:</strong> Full control over platform verification, marketplace audits,
                            and AI
                            assistance.
                        </div>

                        <div class="article-item" onclick="toggleAnswer('ans3')">Can I change my account type?
                            <span style="float:right;">+</span>
                        </div>
                        <div class="article-answer" id="ans3">Currently, you cannot change an existing
                            registered role.
                            You must create a new account to switch from Buyer to Farmer or vice versa.</div>
                    </div>
                </div>

                <div class="help-card searchable">
                    <div class="help-card-icon">🌿</div>
                    <h3>AI Disease Detection</h3>
                    <p>Learn how to take accurate photos, upload symptoms, and interpret the AI & Expert
                        diagnostic
                        reports.</p>
                    <button class="read-articles-btn" onclick="toggleArticles('ai-articles', this)">
                        <span>Read Articles</span> <span>↓</span>
                    </button>
                    <div class="article-content" id="ai-articles">
                        <div class="article-item" onclick="toggleAnswer('ans4')">How to take high-quality leaf
                            photos
                            for AI <span style="float:right;">+</span></div>
                        <div class="article-answer" id="ans4">Ensure good natural lighting, focus on a single
                            infected
                            leaf on a neutral background, and avoid blurry or shaky captures for maximum
                            accuracy.</div>

                        <div class="article-item" onclick="toggleAnswer('ans5')">Understanding Confidence Scores
                            (0-100%) <span style="float:right;">+</span></div>
                        <div class="article-answer" id="ans5">A high score (>80%) means the AI is highly
                            confident in
                            its diagnosis. Lower scores trigger manual expert reviews.</div>

                        <div class="article-item" onclick="toggleAnswer('ans6')">What does "Awaiting Expert
                            Analysis"
                            mean? <span style="float:right;">+</span></div>
                        <div class="article-answer" id="ans6">The AI was unable to confidently identify the
                            disease due
                            to atypical symptoms. A human agricultural administrator will review your query
                            shortly.
                        </div>

                        <div class="article-item" onclick="toggleAnswer('ans7')">Organic vs Chemical Treatment
                            recommendations <span style="float:right;">+</span></div>
                        <div class="article-answer" id="ans7">We provide <em>Organic</em> solutions leveraging
                            natural
                            remedies (like Neem oil) alongside <em>Chemical</em> options (like commercial
                            fungicides) so
                            you can choose based on your farming style.</div>
                    </div>
                </div>

                <div class="help-card searchable">
                    <div class="help-card-icon">📈</div>
                    <h3>Market & Prices</h3>
                    <p>Understand how live Mandi prices are fetched and how to list your agricultural products
                        successfully.</p>
                    <button class="read-articles-btn" onclick="toggleArticles('market-articles', this)">
                        <span>Read Articles</span> <span>↓</span>
                    </button>
                    <div class="article-content" id="market-articles">
                        <div class="article-item" onclick="toggleAnswer('ans8')">How often are live Mandi prices
                            updated? <span style="float:right;">+</span></div>
                        <div class="article-answer" id="ans8">Prices are updated rapidly based on national
                            agricultural
                            market data streams directly matching your state.</div>

                        <div class="article-item" onclick="toggleAnswer('ans9')">Guide to creating an attractive
                            Marketplace Listing <span style="float:right;">+</span></div>
                        <div class="article-answer" id="ans9">Upload clear crop photos, set highly competitive
                            pricing
                            relative to mandi rates, and accurately describe the quantity.</div>

                        <div class="article-item" onclick="toggleAnswer('ans10')">Negotiating prices with buyers
                            through
                            the platform <span style="float:right;">+</span></div>
                        <div class="article-answer" id="ans10">Buyers will contact you directly via the
                            registered phone
                            number you provided on your Marketplace Listing to discuss logistics and pricing.
                        </div>

                        <div class="article-item" onclick="toggleAnswer('ans11')">State & District level price
                            filtering
                            <span style="float:right;">+</span>
                        </div>
                        <div class="article-answer" id="ans11">Use the dropdown selectors in the Market Prices
                            module to
                            filter data specifically for your localized region.</div>
                    </div>
                </div>
            </div>

            <div
                style="max-width: 800px; margin: 0 auto 100px; padding: 40px; background: var(--surface); border-radius: 16px; border: 1px solid var(--border); text-align: center;">
                <h2 style="font-size: 28px; color: #f0fdf4; margin-bottom: 15px;">Still need help?</h2>
                <p style="color: #9ca3af; margin-bottom: 30px;">Our AI Support Bot is available instantly, or
                    you can
                    contact our human support team 24/7.</p>
                <a href="${pageContext.request.contextPath}/contact" class="btn btn-primary"
                    style="padding: 15px 40px; font-size: 16px;">Contact Human Support</a>
            </div>

            <!-- AI Chatbot Widget -->
            <div class="chat-widget-btn" onclick="toggleChat()">
                🤖
            </div>

            <div class="chat-window" id="chatWindow">
                <div class="chat-header">
                    <div class="chat-title">
                        🤖 AI Support Assistant
                    </div>
                    <button class="chat-close" onclick="toggleChat()">×</button>
                </div>
                <div class="chat-body" id="chatBody">
                    <div class="chat-message bot">
                        Hello! 👋 I'm the Smart Farming AI Assistant. How can I help you today?
                    </div>
                    <div class="typing-indicator" id="typingIndicator">
                        <div class="typing-dot"></div>
                        <div class="typing-dot"></div>
                        <div class="typing-dot"></div>
                    </div>
                </div>
                <div class="chat-input-area">
                    <input type="text" id="chatInput" placeholder="Type your message..."
                        onkeypress="handleKeyPress(event)" />
                    <button onclick="sendMessage()">➤</button>
                </div>
            </div>

            <script>
                // Article Toggle Logic
                function toggleArticles(id, btn) {
                    const content = document.getElementById(id);
                    const icon = btn.querySelector('span:nth-child(2)');
                    if (content.classList.contains('active')) {
                        content.classList.remove('active');
                        icon.textContent = '↓';
                    } else {
                        content.classList.add('active');
                        icon.textContent = '↑';
                    }
                }

                // Search Filter Logic
                function filterArticles() {
                    const input = document.getElementById('searchInput').value.toLowerCase();
                    const cards = document.querySelectorAll('.searchable');

                    cards.forEach(card => {
                        const text = card.textContent.toLowerCase();
                        if (text.includes(input)) {
                            card.style.display = 'block';
                            // UX Enhancement: Auto-expand the articles if there is search text
                            const content = card.querySelector('.article-content');
                            const icon = card.querySelector('.read-articles-btn span:nth-child(2)');
                            if (input.length > 0) {
                                content.classList.add('active');
                                icon.textContent = '↑';
                            } else {
                                content.classList.remove('active');
                                icon.textContent = '↓';
                                // Also collapse answers when search is cleared
                                const answers = card.querySelectorAll('.article-answer');
                                answers.forEach(ans => ans.classList.remove('open'));
                            }
                        } else {
                            card.style.display = 'none';
                        }
                    });
                }

                function toggleAnswer(id) {
                    const answer = document.getElementById(id);
                    if (answer.classList.contains('open')) {
                        answer.classList.remove('open');
                    } else {
                        answer.classList.add('open');
                    }
                }

                // Chatbot Logic
                const chatWindow = document.getElementById('chatWindow');
                const chatBody = document.getElementById('chatBody');
                const chatInput = document.getElementById('chatInput');
                const typingIndicator = document.getElementById('typingIndicator');

                let isChatOpen = false;

                function toggleChat() {
                    isChatOpen = !isChatOpen;
                    if (isChatOpen) {
                        chatWindow.classList.add('open');
                        setTimeout(() => chatInput.focus(), 300);
                    } else {
                        chatWindow.classList.remove('open');
                    }
                }

                function handleKeyPress(event) {
                    if (event.key === 'Enter') {
                        sendMessage();
                    }
                }

                function sendMessage() {
                    const messageText = chatInput.value.trim();
                    if (messageText === '') return;

                    // Add user message
                    addMessage(messageText, 'user');
                    chatInput.value = '';

                    // Simulate AI thinking
                    chatBody.appendChild(typingIndicator);
                    typingIndicator.style.display = 'flex';
                    chatBody.scrollTop = chatBody.scrollHeight;

                    // Simple Pattern Matching for AI Bot Responses
                    setTimeout(() => {
                        let response = generateBotResponse(messageText.toLowerCase());
                        typingIndicator.style.display = 'none';
                        addMessage(response, 'bot');
                    }, 1000 + Math.random() * 1000);
                }

                function addMessage(text, sender) {
                    const msgDiv = document.createElement('div');
                    msgDiv.classList.add('chat-message', sender);
                    msgDiv.textContent = text;
                    chatBody.insertBefore(msgDiv, typingIndicator);
                    chatBody.scrollTop = chatBody.scrollHeight;
                }

                function generateBotResponse(text) {
                    // Greetings
                    if (text.match(/\b(hi|hello|hey|greetings|morning|afternoon)\b/)) {
                        return "Hello! 👋 I'm the Smart Farming AI Assistant. You can ask me about crop recommendations, disease treatments, live mandi prices, or platform support.";
                    }
                    // Platform Account Help
                    else if (text.match(/\b(password|login|account|register|role)\b/)) {
                        return "To manage your account or reset a password, visit the Login or Registration pages. Note: Roles (Farmer/Buyer/Admin) cannot be changed after registration without creating a new account.";
                    }
                    // Disease & Health
                    else if (text.match(/\b(disease|sick|spot|yellow|fungus|wilt|rust|symptom|health)\b/)) {
                        return "It sounds like you're dealing with a plant health issue. Use our 'Disease Detection' tool—describe the symptoms (like yellowing leaves or brown spots) and our AI will give you an instant Confidence Score with Organic and Chemical treatment options!";
                    }
                    // Pricing & Mandi Market
                    else if (text.match(/\b(price|mandi|market|sell|cost|rate|buy)\b/)) {
                        return "Live Mandi prices are fetched based on your specific State and District. Check the 'Market Prices' section in your dashboard. If you're a farmer, you can use the 'Marketplace' to list your crop directly to buyers at these competitive rates.";
                    }
                    // Farming techniques & Soil
                    else if (text.match(/\b(soil|fertilizer|npk|nitrogen|urea|compost|organic|ph)\b/)) {
                        return "For rich soil, maintaining a balanced pH (typically 6.0 to 7.0) is crucial. Before applying chemical NPK fertilizers, consider organic alternatives like compost tea or neem cake to improve soil microbiology. Always test your soil before heavy chemical treatments!";
                    }
                    // Crop Specific
                    else if (text.match(/\b(wheat|rice|paddy|cotton|sugarcane|maize|tomato|potato)\b/)) {
                        return "Different crops have unique needs. For example, paddy requires high water retention, while cotton needs deep, well-drained soil. You can use our 'Crop Recommendation' AI tool where you input Nitrogen, Phosphorus, Potassium, and weather data to see exactly what crop fits your land!";
                    }
                    // Weather & Seasons
                    else if (text.match(/\b(weather|rain|temperature|humidity|season|monsoon)\b/)) {
                        return "Weather plays a massive role in agriculture! High humidity often speeds up fungal diseases like Rust or Blight. Keep an eye on local forecasts and consider protective fungicidal sprays if heavy, unexpected rains are approaching.";
                    }
                    // Government Schemes
                    else if (text.match(/\b(scheme|subsidy|government|loan|pm|kisan)\b/)) {
                        return "You can explore various agricultural subsidies like PM-KISAN, crop insurance schemes, and solar pump subsidies under the 'Government Schemes' module on your platform dashboard.";
                    }
                    // Admin Support
                    else if (text.match(/\b(admin|support|contact|help|human)\b/)) {
                        return "If you need an expert human to look into an issue, reach out via the 'Contact Us' page. Our Admins review complex disease queries and update market prices daily. Only authorized personnel have Admin access.";
                    }
                    // Fallback response for unhandled agricultural terms
                    else if (text.match(/\b(farm|agriculture|crop|plant|grow|harvest|tractor|water)\b/)) {
                        return "Farming is a complex science! To get the best help, let me know if you are looking to treat a disease, check current market prices, or choose the best crop for your soil.";
                    }
                    // Catch-all
                    else {
                        return "I'm not quite sure I understand. 🤖 Could you rephrase your question? Try asking me about 'mandi prices', 'crop diseases', 'soil fertilizer', or 'account help'.";
                    }
                }
            </script>

            <script src="${pageContext.request.contextPath}/js/i18n.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>