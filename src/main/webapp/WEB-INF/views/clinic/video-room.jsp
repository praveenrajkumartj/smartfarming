<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Live Consultation</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    </head>

    <body class="bg-dark text-white vh-100 d-flex flex-column">

        <nav class="navbar navbar-dark bg-black px-4 shadow-sm">
            <span class="navbar-brand mb-0 h1"><span class="text-success">🌿</span> Clinic Room: <span
                    class="fs-6 text-muted">${roomId}</span></span>
            <button class="btn btn-danger btn-sm" onclick="window.close()">End Call</button>
        </nav>

        <div class="flex-grow-1 container-fluid p-4 d-flex justify-content-center align-items-center">
            <!-- Mock Video Interface -->
            <div class="position-relative bg-secondary border border-secondary shadow-lg rounded w-100 overflow-hidden"
                style="max-width: 900px; aspect-ratio: 16/9;">

                <!-- Remote Video (Big) -->
                <video id="remoteVideo" class="w-100 h-100 object-fit-cover bg-black" autoplay playsinline></video>
                <div class="position-absolute top-0 start-0 m-3 badge bg-dark bg-opacity-75" id="remoteStatus">Waiting
                    for participant...</div>

                <!-- Local Video (Small Overlay) -->
                <div class="position-absolute bottom-0 end-0 m-3 shadow-lg rounded overflow-hidden border border-2 border-white"
                    style="width: 200px; aspect-ratio: 16/9;">
                    <video id="localVideo" class="w-100 h-100 object-fit-cover bg-dark" autoplay playsinline
                        muted></video>
                </div>

                <!-- Controls Overlay -->
                <div
                    class="position-absolute bottom-0 start-50 translate-middle-x mb-4 d-flex gap-3 bg-dark bg-opacity-75 p-2 rounded-pill">
                    <button class="btn btn-dark rounded-circle btn-lg text-white" id="toggleAudio">🎤</button>
                    <button class="btn btn-dark rounded-circle btn-lg text-white" id="toggleVideo">📹</button>
                    <button class="btn btn-danger rounded-circle btn-lg text-white" onclick="window.close()">📞</button>
                </div>
            </div>
        </div>

        <!-- WebRTC Placeholder Logic -->
        <script>
            document.addEventListener("DOMContentLoaded", async () => {
                const localVideo = document.getElementById('localVideo');
                const remoteStatus = document.getElementById('remoteStatus');

                try {
                    // Try accessing the local camera immediately for realism
                    const stream = await navigator.mediaDevices.getUserMedia({ video: true, audio: true });
                    localVideo.srcObject = stream;

                    // Placeholder connection logic
                    setTimeout(() => {
                        remoteStatus.textContent = 'Participant Connected (WebRTC Target)';
                        remoteStatus.classList.replace('bg-dark', 'bg-success');
                    }, 3000);
                } catch (err) {
                    console.warn("Camera not accessible", err);
                    // If no camera, show mock UI anyway
                    let mockCtx = document.createElement("canvas").getContext("2d");
                    mockCtx.canvas.width = 640; mockCtx.canvas.height = 480;
                    mockCtx.fillStyle = "#333"; mockCtx.fillRect(0, 0, 640, 480);
                    mockCtx.fillStyle = "#fff"; mockCtx.font = "30px Arial";
                    mockCtx.fillText("Camera Offline", 220, 240);

                    // Mute audio/video toggles visually
                    document.getElementById('toggleAudio').style.opacity = 0.5;
                    document.getElementById('toggleVideo').style.opacity = 0.5;
                }
            });
        </script>
    </body>

    </html>


