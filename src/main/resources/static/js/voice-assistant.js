/**
 * AGROPLANTER Voice Assistant - Browser Based (No Python)
 * Uses Web Speech API for STT and TTS
 */

class AgriVoiceAssistant {
    constructor() {
        this.recognition = null;
        this.isListening = false;
        this.synth = window.speechSynthesis;
        this.currentLang = 'hi-IN'; // Default to Hindi
        this.assistantBtn = null;
        this.statusContainer = null;
        this.statusText = null;
        this.userRole = window.AgroplanterRole || 'FARMER';
        this.targetElement = null;

        // Context-based Role Detection (Virtual Roles)
        if (window.location.pathname.includes('/mentor/')) {
            this.userRole = 'MENTOR';
        } else if (window.location.pathname.includes('/clinic/expert/')) {
            this.userRole = 'EXPERT';
        } else if (window.location.pathname.includes('/admin/')) {
            this.userRole = 'ADMIN';
        } else if (window.location.pathname.includes('/b2b/')) {
            this.userRole = 'B2B_BUYER';
        } else if (window.location.pathname.includes('/buyer/')) {
            this.userRole = 'BUYER';
        }

        this.ROUTES = {
            'FARMER': {
                'dashboard': '/farmer/dashboard',
                'command center': '/farmer/dashboard',
                'graph': '/farmer/dashboard',
                'crop': '/farmer/crop-recommendation',
                'predict': '/farmer/crop-recommendation',
                'intel': '/farmer/crop-recommendation',
                'mandi': '/farmer/market-prices',
                'price': '/farmer/market-prices',
                'weather': '/farmer/weather',
                'mausam': '/farmer/weather',
                'climate': '/farmer/weather',
                'disease': '/farmer/disease-detection',
                'check': '/farmer/disease-detection',
                'scanner': '/farmer/disease-detection',
                'clinic': '/clinic/farmer/dashboard',
                'medical': '/clinic/farmer/dashboard',
                'sell': '/farmer/marketplace',
                'shop': '/farmer/marketplace',
                'government': '/farmer/schemes',
                'scheme': '/farmer/schemes',
                'learn': '/farmer/learning',
                'video': '/farmer/learning',
                'academy': '/farmer/learning',
                'expert': '/farmer/mentors',
                'mentor': '/farmer/mentors',
                'money': '/farmer/finance',
                'earnings': '/farmer/finance',
                'finance': '/farmer/finance',
                'safety': '/farmer/safety-hub',
                'sos': '/farmer/safety-hub',
                'emergency': '/farmer/safety-hub',
                'profile': '/farmer/profile',
                'connect': '/chat/connections/explore',
                'discover': '/chat/connections/explore',
                'logout': '/logout',
                'exit': '/logout'
            },
            'BUYER': {
                'dashboard': '/buyer/dashboard',
                'command center': '/buyer/dashboard',
                'buy': '/buyer/marketplace',
                'browse': '/buyer/marketplace',
                'shop': '/buyer/marketplace',
                'market': '/buyer/marketplace',
                'terminal': '/buyer/marketplace',
                'order': '/buyer/orders',
                'purchase': '/buyer/orders',
                'price': '/buyer/market-prices',
                'mandi': '/buyer/market-prices',
                'scheme': '/buyer/schemes',
                'government': '/buyer/schemes',
                'profile': '/buyer/profile',
                'connect': '/chat/connections/explore',
                'discover': '/chat/connections/explore',
                'logout': '/logout',
                'exit': '/logout'
            },
            'ADMIN': {
                'dashboard': '/admin/dashboard',
                'command center': '/admin/dashboard',
                'users': '/admin/users',
                'crops': '/admin/crops',
                'market': '/admin/marketplace',
                'scheme': '/admin/schemes',
                'video': '/admin/learning-videos',
                'price': '/admin/market-prices',
                'payout': '/admin/admin-payouts',
                'b2b': '/admin/b2b-deals',
                'expert': '/admin/clinic-experts',
                'disease': '/admin/disease-queries',
                'approval': '/admin/equipment-approvals',
                'rental': '/admin/rental-transactions',
                'trace': '/admin/traceability-monitor',
                'profile': '/admin/profile',
                'connect': '/chat/connections/explore',
                'discover': '/chat/connections/explore',
                'logout': '/logout',
                'exit': '/logout'
            },
            'MENTOR': {
                'dashboard': '/mentor/dashboard',
                'portal': '/mentor/dashboard',
                'chat': '/chat',
                'message': '/chat',
                'consultation': '/chat',
                'profile': '/mentor/profile',
                'logout': '/logout',
                'exit': '/logout'
            },
            'EXPERT': {
                'dashboard': '/clinic/expert/dashboard',
                'desk': '/clinic/expert/dashboard',
                'lab': '/clinic/expert/dashboard',
                'queue': '/clinic/expert/dashboard',
                'chat': '/chat',
                'secure': '/chat',
                'intelligence': '/clinic/expert/disease-queries',
                'telemetry': '/clinic/expert/disease-queries',
                'profile': '/clinic/expert/profile',
                'connect': '/chat/connections/explore',
                'discover': '/chat/connections/explore',
                'logout': '/logout',
                'exit': '/logout'
            },
            'B2B_BUYER': {
                'dashboard': '/b2b/dashboard',
                'industry': '/b2b/dashboard',
                'surplus': '/b2b/dashboard',
                'bulk': '/b2b/dashboard',
                'redirection': '/b2b/dashboard',
                'connect': '/chat/connections/explore',
                'discover': '/chat/connections/explore',
                'logout': '/logout',
                'exit': '/logout'
            },
            'MENTOR': {
                'dashboard': '/mentor/dashboard',
                'portal': '/mentor/dashboard',
                'chat': '/chat',
                'message': '/chat',
                'consultation': '/chat',
                'profile': '/mentor/profile',
                'connect': '/chat/connections/explore',
                'discover': '/chat/connections/explore',
                'logout': '/logout',
                'exit': '/logout'
            }
        };

        this.initRecognition();
        this.initUI();
        console.log("🌱 AGROPLANTER Voice Assistant Ready (Role: " + this.userRole + ")");
    }

    checkIsLoggedIn() {
        const hasUserIdentity = window.AgroplanterUser && window.AgroplanterUser.trim().length > 0;
        const hasUserUI = document.querySelector('.user-name') ||
            document.querySelector('.user-identity') ||
            document.querySelector('.user-avatar') ||
            document.querySelector('.avatar-box');

        const hasLogoutLink = document.querySelector("a[href*='logout']") ||
            document.querySelector("a[href*='signout']");

        const pageText = document.body.innerText.toLowerCase();
        const hasSessionText = pageText.includes('logout') ||
            pageText.includes('terminate session') ||
            pageText.includes('लॉग आउट') ||
            pageText.includes('sign out') ||
            pageText.includes('command center') ||
            pageText.includes('my profile');

        // Check for dashboard links which imply a session
        const hasDashboardLink = document.querySelector("a[href*='dashboard']");

        const onPrivatePage = window.location.pathname.includes('/farmer/') ||
            window.location.pathname.includes('/buyer/') ||
            window.location.pathname.includes('/clinic/') ||
            window.location.pathname.includes('/admin/');

        const isLoggedIn = !!(hasUserIdentity || hasUserUI || hasLogoutLink || hasSessionText || onPrivatePage || hasDashboardLink);
        console.log("AGROPLANTER Login Check:", isLoggedIn, { hasUserIdentity, hasUserUI, hasLogoutLink, hasSessionText, onPrivatePage, hasDashboardLink });
        return isLoggedIn;
    }

    initRecognition() {
        if (!('webkitSpeechRecognition' in window) && !('SpeechRecognition' in window)) {
            console.warn("Speech Recognition not supported.");
            return;
        }

        // Check for secure origin (required by most browsers for Web Speech API)
        if (window.location.protocol !== 'https:' && window.location.hostname !== 'localhost' && window.location.hostname !== '127.0.0.1') {
            console.error("Web Speech API requires HTTPS or localhost.");
            this.showStatus("SSL/HTTPS Required for Voice", "error");
        }

        const SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;
        this.recognition = new SpeechRecognition();
        this.recognition.continuous = false;
        this.recognition.interimResults = false;

        this.recognition.onstart = () => {
            console.log("Voice recognition started");
            this.isListening = true;
            this.updateUI(true);
        };

        this.recognition.onresult = (event) => {
            const transcript = event.results[0][0].transcript;
            this.handleVoiceCommand(transcript);
        };

        this.recognition.onerror = (event) => {
            console.error("Voice Error:", event.error);
            if (event.error === 'not-allowed') {
                this.speak("Microphone access denied. Please allow it in settings.");
            }
            this.showStatus("Error: " + event.error, "error");
            this.stopListening();
        };

        this.recognition.onend = () => {
            console.log("Voice recognition ended");
            this.stopListening();
        };
    }

    initUI() {
        // Try to find existing UI components from JSP
        this.assistantBtn = document.getElementById('voiceAssistant') || document.getElementById('voice-toggle-btn');
        this.statusContainer = document.getElementById('voiceStatus') || document.getElementById('voice-status');
        this.statusText = document.getElementById('voiceText') || document.getElementById('voice-status-content');

        console.log("Assistant UI detection - Button:", !!this.assistantBtn, "Container:", !!this.statusContainer);

        if (!this.assistantBtn) {
            this.createDynamicUI();
        } else {
            // Force override onclick to avoid conflicts
            this.assistantBtn.onclick = (e) => {
                if (e) e.preventDefault();
                this.toggle();
            };
        }
    }

    createDynamicUI() {
        const assistantContainer = document.createElement('div');
        assistantContainer.id = 'agroplanter-voice-assistant-root';
        assistantContainer.innerHTML = `
            <div id="voice-status" class="voice-status-terminal voice-status-hidden">
                <div class="waves">
                    <div class="wave"></div>
                    <div class="wave"></div>
                    <div class="wave"></div>
                </div>
                <div id="voice-status-content">AGROPLANTER Listening...</div>
            </div>
            <button id="voice-toggle-btn" class="voice-assistant-fab">
                <span class="voice-icon">🎤</span>
            </button>
        `;
        document.body.appendChild(assistantContainer);
        this.assistantBtn = document.getElementById('voice-toggle-btn');
        this.statusContainer = document.getElementById('voice-status');
        this.statusText = document.getElementById('voice-status-content');
        this.assistantBtn.onclick = (e) => {
            if (e) e.preventDefault();
            this.toggle();
        };
    }

    toggle() {
        if (this.isListening) this.stopListening();
        else this.startListening();
    }

    startListening() {
        this.targetElementId = null; // Clear any previous target
        this._executeStart();
    }

    startListeningFor(elementId) {
        this.targetElementId = elementId;
        const el = document.getElementById(elementId);
        if (el) {
            el.focus();
            el.classList.add('listening-pulse');
        }
        this._executeStart();
    }

    _executeStart() {
        if (!this.checkIsLoggedIn()) {
            console.warn("User not logged in, redirecting to login.");
            const context = window.AgroplanterContext || '';
            window.location.href = context + '/login';
            return;
        }

        if (this.recognition) {
            // Check if we are already listening to avoid errors
            if (this.isListening) {
                console.log("Already listening, restarting for fresh capture...");
                this.recognition.stop();
            }

            this.recognition.lang = document.documentElement.lang === 'hi' ? 'hi-IN' : 'en-IN';
            try {
                this.recognition.start();
                this.showStatus("Waking up AGROPLANTER...");
            } catch (e) {
                console.error("Speech Recognition failed to start:", e);
                this.isListening = false;
                this.updateUI(false);
            }
        } else {
            this.showStatus("Voice not supported in this browser", "error");
        }
    }

    stopListening() {
        if (this.recognition) {
            try {
                this.recognition.stop();
            } catch (e) { }
        }
        this.isListening = false;
        this.updateUI(false);
    }

    updateUI(listening) {
        if (!this.assistantBtn || !this.statusContainer) return;

        if (listening) {
            this.assistantBtn.classList.add('listening');
            this.statusContainer.classList.add('active');
            this.statusContainer.classList.remove('voice-status-hidden');
            this.statusContainer.style.display = 'flex';
            if (this.statusText) this.statusText.textContent = "AGROPLANTER Listening...";
        } else {
            this.assistantBtn.classList.remove('listening');
            setTimeout(() => {
                if (!this.isListening) {
                    this.statusContainer.classList.remove('active');
                    this.statusContainer.classList.add('voice-status-hidden');
                    if (this.statusContainer.id === 'voiceStatus') this.statusContainer.style.display = 'none';
                }
            }, 3000);
        }
    }

    async handleVoiceCommand(transcript) {
        console.log("Transcribed Command:", transcript);
        this.showStatus("Processing: " + transcript);

        // 1. Target Element Logic (Form Filling)
        if (this.targetElementId) {
            const el = document.getElementById(this.targetElementId);
            if (el) {
                el.value = transcript;
                el.classList.remove('listening-pulse');
                this.speak("Entered " + transcript);
                this.showStatus("Filled: " + transcript);
                this.targetElementId = null; // Reset
                return;
            }
        }

        const query = transcript.toLowerCase();

        // 2. Personalized Conversational Layer (Small Talk)
        const greetings = {
            'morning': `Good morning, ${window.AgroplanterUserFull || 'Farmer'}. Ready to check your crops?`,
            'hello': `Hello! This is your AGROPLANTER companion. How can I help with your harvest today?`,
            'hi': `Hi there! I'm ready to assist with your biological diagnostics or market prices.`,
            'namaste': `Namaste! How may I help you in your field today?`,
            'how are you': `I'm operational and monitoring all biological telemetry systems. Ready for your command.`
        };

        for (const [key, response] of Object.entries(greetings)) {
            if (query.includes(key)) {
                this.speak(response);
                return;
            }
        }

        // 3. Strict Role-Based Navigation Logic
        const role = window.AgroplanterRole || 'FARMER';
        const roleRoutes = this.ROUTES[role];

        if (roleRoutes) {
            for (const [command, path] of Object.entries(roleRoutes)) {
                if (query.includes(command)) {
                    this.speak("Accessing " + command);
                    setTimeout(() => window.location.href = path, 1000);
                    return;
                }
            }
        }

        // 3. Fallback to AI Advisory
        try {
            const response = await fetch('/api/voice/advisory', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ query: transcript, role: role })
            });
            const data = await response.json();
            this.speak(data.advisory);
        } catch (err) {
            this.speak("Consulting offline logs. Please check your network.");
        }
    }

    showStatus(text, type = "info") {
        if (!this.statusContainer || !this.statusText) return;

        this.statusText.textContent = text;
        this.statusText.style.color = type === "error" ? "#f87171" : "white";
        this.statusContainer.classList.remove('voice-status-hidden');
        this.statusContainer.classList.add('active');
        if (this.statusContainer.id === 'voiceStatus' || this.statusContainer.id === 'voice-status') {
            this.statusContainer.style.display = 'flex';
        }
    }

    speak(text) {
        if (!this.synth) return;

        // Ensure voices are loaded before trying to speak
        const attemptSpeak = () => {
            if (this.synth.speaking) this.synth.cancel();

            const utterance = new SpeechSynthesisUtterance(text);
            utterance.lang = this.currentLang;

            const voices = this.synth.getVoices();
            if (voices.length === 0) {
                // If voices aren't loaded yet, wait a bit and try again once (to avoid infinite recursion)
                return setTimeout(attemptSpeak, 100);
            }

            const localVoice = voices.find(v => v.lang.includes('hi') || v.lang.includes('IN')) || voices[0];
            if (localVoice) utterance.voice = localVoice;

            this.showStatus("AI: " + text);
            this.synth.speak(utterance);
        };

        attemptSpeak();
    }
}

// Global initialization
document.addEventListener('DOMContentLoaded', () => {
    window.agriVoice = new AgriVoiceAssistant();
});

// JSP Global Bridge
function toggleVoiceAssistant() {
    if (window.agriVoice) window.agriVoice.toggle();
}

