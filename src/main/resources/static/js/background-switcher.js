/**
 * Background Switcher for Smart Farming Platform
 * Revised: Deactivated dynamic images and stabilized dashboard colors.
 * This ensures high text visibility and a premium, distraction-free UI.
 */

(function () {
    function applyPremiumStabilization() {
        // Stabilize the theme variables to a solid premium navy
        const root = document.documentElement;

        // Update CSS variables dynamically for global reach
        root.style.setProperty('--bg-dark', '#020617');
        root.style.setProperty('--bg-card', '#0f172a');
        root.style.setProperty('--bg-sidebar', '#010409');
        root.style.setProperty('--surface', '#1e293b');
        root.style.setProperty('--surface-light', '#334155');

        // Ensure muted text is visible enough on ultra-dark backgrounds
        root.style.setProperty('--text-muted', '#94a3b8');
        root.style.setProperty('--text-secondary', '#cbd5e1');

        // Stabilize borders
        root.style.setProperty('--border', 'rgba(255, 255, 255, 0.1)');
        root.style.setProperty('--border-light', 'rgba(255, 255, 255, 0.05)');

        // Finalize body styling - Solid, non-distracting colors
        document.body.style.backgroundColor = '#020617';
        document.body.style.backgroundImage = 'radial-gradient(circle at 50% 10%, #0f172a 0%, #020617 100%)';
        document.body.style.backgroundAttachment = 'fixed';
        document.body.style.color = '#ffffff';

        // Remove the dynamic layer if it exists to clean up the DOM
        const layer = document.getElementById('global-bg-layer');
        if (layer) {
            layer.innerHTML = ''; // Clear sub-overlays
            layer.style.backgroundImage = 'none';
            layer.style.backgroundColor = 'transparent';
            layer.remove();
        }
    }

    // Apply immediately to prevent flash of old background
    applyPremiumStabilization();

    // Re-verify on DOM content loaded
    document.addEventListener('DOMContentLoaded', applyPremiumStabilization);

    // Safety check: ensure no intervals from previous versions are running
    // Note: We can't easily kill anonymous intervals, but since we've 
    // overwritten the file and the browser reloads the script, 
    // the old intervals will disappear unless the page hasn't been refreshed.
})();
