/**
 * Background Switcher for Smart Farming Platform
 * Changes background images every second
 */

(function () {
    const farmingImages = [
        'https://images.unsplash.com/photo-1500382017468-9049fed747ef?auto=format&fit=crop&q=80&w=1600',
        'https://images.unsplash.com/photo-1523348837708-15d4a09cfac2?auto=format&fit=crop&q=80&w=1600',
        'https://images.unsplash.com/photo-1444858291040-58f756a3bdd6?auto=format&fit=crop&q=80&w=1600',
        'https://images.unsplash.com/photo-1544923246-77265be722f6?auto=format&fit=crop&q=80&w=1600',
        'https://images.unsplash.com/photo-1464226184884-fa280b87c399?auto=format&fit=crop&q=80&w=1600',
        'https://images.unsplash.com/photo-1595113316349-9fa4eb24f884?auto=format&fit=crop&q=80&w=1600',
        'https://images.unsplash.com/photo-1558449028-b53a39d100fc?auto=format&fit=crop&q=80&w=1600',
        'https://images.unsplash.com/photo-1500937386664-56d1dfef3854?auto=format&fit=crop&q=80&w=1600',
        'https://images.unsplash.com/photo-1527847263472-aa5338d178b8?auto=format&fit=crop&q=80&w=1600',
        'https://images.unsplash.com/photo-1560493676-04071c5f467b?auto=format&fit=crop&q=80&w=1600'
    ];

    let currentIndex = 0;

    function createBackgroundLayer() {
        if (document.getElementById('global-bg-layer')) return document.getElementById('global-bg-layer');

        const layer = document.createElement('div');
        layer.id = 'global-bg-layer';
        Object.assign(layer.style, {
            position: 'fixed',
            top: 0,
            left: 0,
            width: '100%',
            height: '100%',
            zIndex: -1,
            backgroundSize: 'cover',
            backgroundPosition: 'center',
            backgroundRepeat: 'no-repeat',
            transition: 'background-image 0.8s ease-in-out',
            filter: 'brightness(0.35) contrast(1.1)',
            pointerEvents: 'none'
        });

        // Add a gradient overlay to make text more readable
        const overlay = document.createElement('div');
        Object.assign(overlay.style, {
            position: 'absolute',
            top: 0,
            left: 0,
            width: '100%',
            height: '100%',
            background: 'linear-gradient(rgba(5, 10, 5, 0.4), rgba(5, 10, 5, 0.7))'
        });

        layer.appendChild(overlay);
        document.body.prepend(layer);
        return layer;
    }

    function changeBackground() {
        const layer = createBackgroundLayer();
        currentIndex = (currentIndex + 1) % farmingImages.length;
        const nextImage = farmingImages[currentIndex];

        // Preload next image
        const img = new Image();
        img.src = nextImage;
        img.onload = () => {
            layer.style.backgroundImage = `url('${nextImage}')`;
        };
    }

    // Start shifting
    document.addEventListener('DOMContentLoaded', () => {
        // Set initial background immediately if possible
        const layer = createBackgroundLayer();
        layer.style.backgroundImage = `url('${farmingImages[0]}')`;

        // Change every 1 second
        setInterval(changeBackground, 1000);
    });
})();
