/**
 * VERIDIA UI Helpers
 * Replaces native alert() and confirm() with custom on-screen UI.
 */

// --- Toast System ---
function showToast(message, type = 'info') {
    let container = document.querySelector('.toast-container');
    if (!container) {
        container = document.createElement('div');
        container.className = 'toast-container';
        document.body.appendChild(container);
    }

    const toast = document.createElement('div');
    toast.className = `sc-toast ${type}`;

    let icon = '🔔';
    if (type === 'success') icon = '✅';
    if (type === 'error') icon = '❌';
    if (type === 'info') icon = 'ℹ️';

    toast.innerHTML = `
        <span class="sc-toast-icon">${icon}</span>
        <span class="sc-toast-message">${message}</span>
    `;

    container.appendChild(toast);

    // Auto remove after 4 seconds
    setTimeout(() => {
        toast.style.animation = 'slideOutRight 0.3s ease forwards';
        setTimeout(() => toast.remove(), 300);
    }, 4000);
}

// --- Confirmation System ---
let confirmCallback = null;

function showConfirm(message, onConfirm) {
    let overlay = document.querySelector('.sc-confirm-overlay');
    if (!overlay) {
        overlay = document.createElement('div');
        overlay.className = 'sc-confirm-overlay';
        overlay.innerHTML = `
            <div class="sc-confirm-box">
                <div class="sc-confirm-icon">❓</div>
                <div class="sc-confirm-message" style="font-size: 16px; margin-bottom: 20px;"></div>
                <div class="sc-confirm-btns">
                    <button class="btn btn-secondary" onclick="closeConfirm(false)" style="border-radius: 10px; padding: 10px 25px;">Cancel</button>
                    <button class="btn btn-primary" onclick="closeConfirm(true)" style="border-radius: 10px; padding: 10px 25px; background: linear-gradient(135deg, #16a34a, #22c55e); border: none;">Confirm</button>
                </div>
            </div>
        `;
        document.body.appendChild(overlay);
    }

    overlay.querySelector('.sc-confirm-message').innerText = message;
    overlay.style.display = 'flex';
    confirmCallback = onConfirm;
}

function closeConfirm(result) {
    const overlay = document.querySelector('.sc-confirm-overlay');
    if (overlay) overlay.style.display = 'none';
    if (result && confirmCallback) {
        confirmCallback();
    }
    confirmCallback = null;
}

// Override native methods? (Optional, but safer to call showToast directly)
// window.alert = (msg) => showToast(msg);
// window.confirm = (msg) => { console.warn("Native confirm used. Use showConfirm instead for async support."); return true; };
