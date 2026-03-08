<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>💬 Message Core - AGROPLANTER Premium</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/voice-assistant.css">
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;700;800;900&display=swap"
                    rel="stylesheet">
                <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
                <style>
                    :root {
                        --accent: #10b981;
                        --bg-deep: #020617;
                        --glass: rgba(15, 23, 42, 0.4);
                        --border: rgba(255, 255, 255, 0.05);
                    }

                    body {
                        background: var(--bg-deep);
                        color: white;
                        height: 100vh;
                        overflow: hidden;
                        font-family: 'Outfit', sans-serif;
                        background-image: radial-gradient(circle at top right, rgba(16, 185, 129, 0.05), transparent 800px);
                    }

                    .chat-nexus-layout {
                        display: grid;
                        grid-template-columns: 400px 1fr;
                        height: 100vh;
                    }

                    /* Tray Styling */
                    .user-nexus-tray {
                        background: var(--glass);
                        border-right: 1px solid var(--border);
                        display: flex;
                        flex-direction: column;
                        backdrop-filter: blur(40px);
                        -webkit-backdrop-filter: blur(40px);
                    }

                    .tray-premium-header {
                        padding: 40px 30px;
                        border-bottom: 1px solid var(--border);
                    }

                    .nexus-search-orb {
                        background: rgba(255, 255, 255, 0.03);
                        border: 1px solid var(--border);
                        border-radius: 16px;
                        padding: 14px 20px;
                        color: white;
                        width: 100%;
                        font-size: 13px;
                        font-weight: 500;
                        transition: 0.3s;
                    }

                    .nexus-search-orb:focus {
                        outline: none;
                        border-color: var(--accent);
                        background: rgba(255, 255, 255, 0.05);
                    }

                    .user-scroll-terminal {
                        flex: 1;
                        overflow-y: auto;
                        padding: 25px;
                    }

                    .user-node-item {
                        display: flex;
                        align-items: center;
                        gap: 18px;
                        padding: 20px;
                        border-radius: 24px;
                        cursor: pointer;
                        transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
                        margin-bottom: 12px;
                        border: 1px solid transparent;
                    }

                    .user-node-item:hover {
                        background: rgba(255, 255, 255, 0.03);
                        transform: translateX(5px);
                    }

                    .user-node-item.active {
                        background: rgba(16, 185, 129, 0.08);
                        border-color: rgba(16, 185, 129, 0.2);
                    }

                    .node-avatar {
                        width: 55px;
                        height: 55px;
                        border-radius: 18px;
                        background: linear-gradient(135deg, rgba(16, 185, 129, 0.1), rgba(16, 185, 129, 0.05));
                        border: 1px solid rgba(16, 185, 129, 0.2);
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        font-weight: 800;
                        color: var(--accent);
                        position: relative;
                        font-size: 20px;
                        overflow: hidden;
                    }

                    .node-status-pulse {
                        width: 14px;
                        height: 14px;
                        background: var(--accent);
                        border: 3px solid #0f172a;
                        border-radius: 50%;
                        position: absolute;
                        bottom: -3px;
                        right: -3px;
                        box-shadow: 0 0 10px var(--accent);
                    }

                    /* Message Portal */
                    .message-nexus-portal {
                        display: flex;
                        flex-direction: column;
                        background: rgba(2, 6, 23, 0.2);
                        height: 100%;
                        overflow: hidden;
                    }

                    .portal-header {
                        padding: 15px 40px;
                        background: rgba(15, 23, 42, 0.3);
                        backdrop-filter: blur(20px);
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        border-bottom: 1px solid var(--border);
                    }

                    .message-stream {
                        flex: 1;
                        overflow-y: auto;
                        padding: 45px 60px;
                        display: flex;
                        flex-direction: column;
                        gap: 24px;
                        min-height: 0;
                    }

                    .premium-bubble {
                        max-width: 550px;
                        padding: 18px 25px;
                        border-radius: 24px;
                        font-size: 15px;
                        line-height: 1.6;
                        font-weight: 500;
                        position: relative;
                    }

                    .bubble-sent {
                        align-self: flex-end;
                        background: var(--accent);
                        color: #020617;
                        border-bottom-right-radius: 4px;
                        box-shadow: 0 10px 25px rgba(16, 185, 129, 0.2);
                    }

                    .bubble-received {
                        align-self: flex-start;
                        background: rgba(255, 255, 255, 0.05);
                        border: 1px solid var(--border);
                        border-bottom-left-radius: 4px;
                    }

                    .input-anchor {
                        padding: 20px 40px;
                        background: rgba(15, 23, 42, 0.5);
                        border-top: 1px solid var(--border);
                        backdrop-filter: blur(20px);
                    }

                    .quantum-input-orb {
                        background: rgba(255, 255, 255, 0.02);
                        border-radius: 100px;
                        padding: 12px 30px;
                        display: flex;
                        gap: 20px;
                        align-items: center;
                        border: 1px solid var(--border);
                        transition: 0.3s;
                    }

                    .quantum-input-orb:focus-within {
                        border-color: var(--accent);
                        background: rgba(255, 255, 255, 0.04);
                        box-shadow: 0 0 20px rgba(16, 185, 129, 0.1);
                    }

                    .quantum-input-orb input {
                        flex: 1;
                        background: transparent;
                        border: none;
                        color: white;
                        outline: none;
                        font-size: 14px;
                        font-weight: 600;
                    }

                    .msg-delete-btn {
                        position: absolute;
                        top: -10px;
                        right: -10px;
                        width: 22px;
                        height: 22px;
                        border-radius: 50%;
                        background: rgba(239, 68, 68, 0.9);
                        color: white;
                        border: none;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        font-size: 9px;
                        cursor: pointer;
                        opacity: 0;
                        transition: 0.2s;
                        z-index: 10;
                        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
                    }

                    .premium-bubble:hover .msg-delete-btn {
                        opacity: 1;
                        transform: scale(1.1);
                    }

                    .bubble-received .msg-delete-btn {
                        right: auto;
                        left: -10px;
                    }

                    .btn-packet-send {
                        width: 50px;
                        height: 50px;
                        border-radius: 50%;
                        background: var(--accent);
                        color: #020617;
                        border: none;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        font-size: 20px;
                        transition: 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
                    }

                    .btn-packet-send:hover {
                        transform: scale(1.1) rotate(15deg);
                        box-shadow: 0 0 20px var(--accent);
                    }

                    .btn-quantum-nav {
                        padding: 10px 20px;
                        border-radius: 12px;
                        font-weight: 800;
                        font-size: 11px;
                        text-transform: uppercase;
                        letter-spacing: 1px;
                        transition: 0.3s;
                        text-decoration: none;
                        display: inline-flex;
                        align-items: center;
                        gap: 8px;
                    }

                    .nav-explore {
                        background: rgba(16, 185, 129, 0.1);
                        color: var(--accent);
                        border: 1px solid rgba(16, 185, 129, 0.2);
                    }

                    .nav-requests {
                        background: rgba(59, 130, 246, 0.1);
                        color: #3b82f6;
                        border: 1px solid rgba(59, 130, 246, 0.2);
                    }

                    .nav-back {
                        background: rgba(255, 255, 255, 0.05);
                        color: white;
                        border: 1px solid var(--border);
                    }

                    .nav-explore:hover,
                    .nav-requests:hover,
                    .nav-back:hover {
                        background: rgba(255, 255, 255, 0.1);
                        color: white;
                        transform: translateY(-2px);
                    }
                </style>
            </head>

            <body>
                <div class="chat-nexus-layout">
                    <!-- Discovery Sidebar -->
                    <div class="user-nexus-tray">
                        <div class="tray-premium-header">
                            <div class="d-flex align-items-center justify-content-between mb-4">
                                <div class="d-flex align-items-center gap-3">
                                    <div class="node-avatar"
                                        style="width: 45px; height: 45px; border-radius: 12px; font-size: 16px;">
                                        <c:choose>
                                            <c:when test="${not empty user.profileImagePath}">
                                                <c:set var="userFb"
                                                    value="https://ui-avatars.com/api/?name=${fn:replace(not empty user.fullName ? user.fullName : 'User', ' ', '+')}&background=10b981&color=fff" />
                                                <img src="${fn:startsWith(user.profileImagePath, 'http') ? '' : pageContext.request.contextPath}${user.profileImagePath}"
                                                    onerror="this.src='${userFb}';"
                                                    style="width: 100%; height: 100%; object-fit: cover; border-radius: 12px;">
                                            </c:when>
                                            <c:otherwise>
                                                <i class="fas fa-user-astronaut" style="font-size: 14px;"></i>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div>
                                        <div class="fw-900 text-white" style="font-size: 16px; letter-spacing: -0.5px;">
                                            ${user.fullName}</div>
                                        <div class="small fw-800 text-success text-uppercase"
                                            style="font-size: 8px; letter-spacing: 2px;">AUTHORITY: ${user.role}</div>
                                    </div>
                                </div>
                                <a href="${dashboardUrl}" class="btn-packet-send"
                                    style="width: 40px; height: 40px; font-size: 18px; text-decoration: none;"
                                    title="Return to Dashboard">🏠</a>
                            </div>

                            <div class="d-flex gap-2 mb-4">
                                <a href="${pageContext.request.contextPath}/chat/explore"
                                    class="btn-quantum-nav nav-explore flex-fill justify-content-center">
                                    👥 NODAL DISCOVERY
                                </a>
                                <a href="${pageContext.request.contextPath}/chat/requests"
                                    class="btn-quantum-nav nav-requests flex-fill justify-content-center position-relative">
                                    📩 PROTOCOLS
                                    <c:if test="${pendingCount > 0}">
                                        <span
                                            class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger"
                                            style="font-size: 8px; padding: 4px 6px;">
                                            ${pendingCount}
                                        </span>
                                    </c:if>
                                </a>
                            </div>

                            <div class="position-relative">
                                <input type="text" class="nexus-search-orb" placeholder="Filter active syncs...">
                                <span
                                    class="position-absolute end-0 top-50 translate-middle-y me-3 opacity-30">🔍</span>
                            </div>
                        </div>

                        <div class="user-scroll-terminal">
                            <c:forEach var="u" items="${users}">
                                <div class="user-node-item"
                                    onclick="selectUser('${u.id}', '${u.fullName}', '${u.role}', '${u.profileImagePath}')"
                                    id="user-${u.id}">
                                    <div class="node-avatar">
                                        <c:choose>
                                            <c:when test="${not empty u.profileImagePath}">
                                                <c:set var="nodeFb"
                                                    value="https://ui-avatars.com/api/?name=${fn:replace(not empty u.fullName ? u.fullName : 'Node', ' ', '+')}&background=10b981&color=fff" />
                                                <img src="${fn:startsWith(u.profileImagePath, 'http') ? '' : pageContext.request.contextPath}${u.profileImagePath}"
                                                    onerror="this.src='${nodeFb}';"
                                                    style="width: 100%; height: 100%; object-fit: cover; border-radius: 16px;">
                                            </c:when>
                                            <c:otherwise>
                                                <i class="fas fa-user-astronaut" style="font-size: 14px;"></i>
                                            </c:otherwise>
                                        </c:choose>
                                        <div class="node-status-pulse"></div>
                                    </div>
                                    <div style="overflow: hidden;">
                                        <div class="fw-800 text-white text-truncate" style="font-size: 16px;">
                                            ${u.fullName}</div>
                                        <div class="small fw-700 text-white-50 text-uppercase"
                                            style="font-size: 9px; letter-spacing: 1px;">${u.role} Node</div>
                                    </div>
                                </div>
                            </c:forEach>

                            <c:if test="${empty users}">
                                <div class="text-center py-5">
                                    <div style="font-size: 50px; opacity: 0.2; margin-bottom: 20px;">📡</div>
                                    <h5 class="fw-800 text-white-50 uppercase mb-3"
                                        style="font-size: 12px; letter-spacing: 1px;">No Active Syncs</h5>
                                    <p class="small text-white-50 px-4 mb-4">Initialize a secure protocol link via
                                        Discovery hub.</p>
                                    <a href="${pageContext.request.contextPath}/chat/explore"
                                        class="btn-quantum-nav nav-explore">Start Discovery</a>
                                </div>
                            </c:if>
                        </div>
                    </div>

                    <!-- Terminal Portal -->
                    <div class="message-nexus-portal">
                        <div id="emptyView"
                            class="d-flex flex-column align-items-center justify-content-center h-100 text-center">
                            <div style="font-size: 80px; filter: grayscale(1); opacity: 0.15;">⚙️</div>
                            <h2 class="fw-900 text-white uppercase mt-4" style="letter-spacing: 4px; font-size: 24px;">
                                Terminal Standby</h2>
                            <p class="text-white-50 fw-600 px-5 opacity-50">Authorized nodal synchronization required
                                for data exchange.</p>
                        </div>

                        <div id="activeView" class="d-none flex-column overflow-hidden" style="height: 100%;">
                            <header class="portal-header">
                                <div class="d-flex align-items-center gap-4">
                                    <div class="node-avatar" id="targetAvatar"
                                        style="width: 50px; height: 50px; border-radius: 14px;">
                                        <i class="fas fa-user-astronaut"></i>
                                    </div>
                                    <div>
                                        <h5 class="mb-0 fw-900 text-white" id="targetName" style="font-size: 18px;">
                                            Loading...</h5>
                                        <div class="d-flex align-items-center gap-2 mt-1">
                                            <div
                                                style="width: 8px; height: 8px; background: var(--accent); border-radius: 50%; box-shadow: 0 0 10px var(--accent);">
                                            </div>
                                            <span class="text-success fw-800 text-uppercase"
                                                style="font-size: 9px; letter-spacing: 1px;">Secure Sync Active</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="d-flex gap-2">
                                    <button class="btn-quantum-nav nav-back" onclick="clearTerminal()"
                                        style="opacity: 0.8;">CLEAR TERMINAL</button>
                                </div>
                            </header>

                            <div class="message-stream" id="messages"></div>

                            <div class="input-anchor">
                                <div class="quantum-input-orb">
                                    <button class="btn btn-link text-white-50 p-0"
                                        onclick="document.getElementById('fileInput').click()" title="Attach File">
                                        <i class="fas fa-paperclip"></i>
                                    </button>
                                    <button id="micBtn" class="btn btn-link text-white-50 p-0"
                                        onclick="toggleRecording()" title="Record Voice">
                                        <i class="fas fa-microphone"></i>
                                    </button>
                                    <input type="file" id="fileInput" class="d-none" onchange="handleFileUpload(this)">
                                    <input type="text" id="messageInput" placeholder="Buffer secure packet..."
                                        onkeypress="if(event.key=='Enter') sendMessage()">
                                    <button class="btn-packet-send" onclick="sendMessage()">🚀</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="statusToast"
                    style="position: fixed; top: 100px; right: 30px; background: rgba(15, 23, 42, 0.9); border: 1px solid #10b981; border-radius: 20px; padding: 20px 30px; z-index: 9999; display: flex; align-items: center; gap: 15px; opacity: 0; pointer-events: none; transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275); transform: translateX(50px); backdrop-filter: blur(10px); box-shadow: 0 20px 40px rgba(0,0,0,0.5), 0 0 20px rgba(16, 185, 129, 0.2);">
                    <div id="toastIcon" style="font-size: 24px; color: #10b981;"><i class="fas fa-check-circle"></i>
                    </div>
                    <div>
                        <div id="toastTitle" class="text-success fw-900 uppercase"
                            style="font-size: 13px; letter-spacing: 1px;">PROTOCOL SUCCESS</div>
                        <div id="toastMessage" class="text-white-50 fw-600" style="font-size: 11px; margin-top: 4px;">
                            Operation has been successfully completed.</div>
                    </div>
                </div>

                <!-- Custom Confirmation Modal -->
                <div class="modal fade" id="clearConfirmModal" tabindex="-1" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered modal-sm">
                        <div class="modal-content v3-modal-nexus border-0"
                            style="background: rgba(15, 23, 42, 0.95); backdrop-filter: blur(20px);">
                            <div class="modal-body p-4 text-center">
                                <div class="mb-3" style="font-size: 40px;">🧹</div>
                                <h5 class="text-white fw-900 uppercase mb-3"
                                    style="letter-spacing: 1px; font-size: 14px;">Clear Stream?</h5>
                                <p class="text-white-50 small fw-600 mb-4">This will purge the local terminal view.
                                    Permanent database logs will remain intact.</p>
                                <div class="d-flex gap-2">
                                    <button type="button" class="btn btn-quantum flex-fill py-2 small fw-900"
                                        data-bs-dismiss="modal">CANCEL</button>
                                    <button type="button" class="btn btn-danger flex-fill py-2 small fw-900"
                                        onclick="executeClear()"
                                        style="background: #ef4444; border: none;">PURGE</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Delete Message Confirmation Modal -->
                <div class="modal fade" id="deleteConfirmModal" tabindex="-1" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered modal-sm">
                        <div class="modal-content border-0"
                            style="background: rgba(15, 23, 42, 0.95); backdrop-filter: blur(20px); border-radius: 24px; box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5);">
                            <div class="modal-body p-4 text-center">
                                <div class="mb-3" style="font-size: 40px;">🗑️</div>
                                <h5 class="text-white fw-900 text-uppercase mb-3"
                                    style="letter-spacing: 1px; font-size: 14px;">Erase Data?</h5>
                                <p class="text-white-50 small fw-600 mb-4">Are you sure you want to terminate this
                                    secure data packet? This action cannot be reversed.</p>
                                <div class="d-flex gap-2">
                                    <button type="button" class="btn btn-dark flex-fill py-2 small fw-900"
                                        style="border-radius: 12px; background: rgba(255,255,255,0.05); border: 1px solid rgba(255,255,255,0.1);"
                                        data-bs-dismiss="modal">CANCEL</button>
                                    <button type="button" class="btn btn-danger flex-fill py-2 small fw-900"
                                        onclick="confirmDelete()"
                                        style="background: #ef4444; border: none; border-radius: 12px; box-shadow: 0 4px 15px rgba(239, 68, 68, 0.3);">ERASE</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <script>
                    let stompClient = null;
                    let selectedUserId = null;
                    let currentUserId = '${currentUserId}';
                    let mediaRecorder = null;
                    let audioChunks = [];
                    let isRecording = false;
                    let pendingDeleteId = null;

                    function showToast(title, message, isError = false) {
                        const toast = document.getElementById('statusToast');
                        const titleEl = document.getElementById('toastTitle');
                        const msgEl = document.getElementById('toastMessage');
                        const iconEl = document.getElementById('toastIcon');

                        titleEl.innerText = title;
                        msgEl.innerText = message;

                        if (isError) {
                            toast.style.borderColor = '#ef4444';
                            titleEl.style.color = '#ef4444';
                            iconEl.style.color = '#ef4444';
                            iconEl.innerHTML = '<i class="fas fa-exclamation-circle"></i>';
                        } else {
                            toast.style.borderColor = '#10b981';
                            titleEl.style.color = '#10b981';
                            iconEl.style.color = '#10b981';
                            iconEl.innerHTML = '<i class="fas fa-check-circle"></i>';
                        }

                        toast.style.opacity = '1';
                        toast.style.transform = 'translateX(0)';
                        toast.style.pointerEvents = 'auto';

                        setTimeout(() => {
                            toast.style.opacity = '0';
                            toast.style.transform = 'translateX(50px)';
                            toast.style.pointerEvents = 'none';
                        }, 4000);
                    }

                    function connect() {
                        const socket = new SockJS('${pageContext.request.contextPath}/ws');
                        stompClient = Stomp.over(socket);
                        stompClient.debug = null;
                        stompClient.connect({}, function (frame) {
                            stompClient.subscribe('/user/queue/messages', function (message) {
                                const msg = JSON.parse(message.body);
                                if (msg.type === 'DELETE') {
                                    const el = document.getElementById('msg-' + msg.messageId);
                                    if (el) el.remove();
                                } else {
                                    if (selectedUserId == msg.sender.id) {
                                        appendMessage(msg, 'received');
                                    } else if (currentUserId == msg.sender.id && selectedUserId == msg.recipient.id) {
                                        // Update or append local message with ID
                                        appendMessage(msg, 'sent');
                                    }
                                }
                            });
                        });
                    }

                    function selectUser(id, name, role, imagePath) {
                        selectedUserId = id;
                        document.getElementById('emptyView').classList.add('d-none');
                        const activeView = document.getElementById('activeView');
                        activeView.classList.remove('d-none');
                        activeView.classList.add('d-flex');

                        document.getElementById('targetName').innerText = name;

                        const avatarEl = document.getElementById('targetAvatar');
                        if (imagePath && imagePath !== 'null' && imagePath !== '') {
                            let src = imagePath.startsWith('http') ? imagePath : '${pageContext.request.contextPath}/' + imagePath;
                            src = src.replace(/\/+/g, '/');
                            if (imagePath.startsWith('http')) src = imagePath;

                            avatarEl.innerHTML = '<img src="' + src + '" ' +
                                'onerror="this.src=\'https://ui-avatars.com/api/?name=' + encodeURIComponent(name) + '&background=10b981&color=fff\';" ' +
                                'style="width:100%; height:100%; object-fit:cover; border-radius:14px;">';
                        } else {
                            avatarEl.innerHTML = `<i class="fas fa-user-astronaut"></i>`;
                        }

                        document.getElementById('messages').innerHTML = '';

                        document.querySelectorAll('.user-node-item').forEach(function (el) { el.classList.remove('active'); });
                        const selectedNode = document.getElementById('user-' + id);
                        if (selectedNode) selectedNode.classList.add('active');

                        fetch('${pageContext.request.contextPath}/api/chat/history/' + id)
                            .then(function (res) { return res.json(); })
                            .then(function (data) {
                                data.forEach(function (msg) {
                                    appendMessage(msg, msg.sender.id == currentUserId ? 'sent' : 'received');
                                });
                            });
                    }

                    // Initialize targeted session if provided
                    window.addEventListener('load', function () {
                        var targetId = '${selectWith}';
                        if (targetId && targetId !== '') {
                            var node = document.getElementById('user-' + targetId);
                            if (node) node.click();
                        }
                    });

                    function sendMessage() {
                        const input = document.getElementById('messageInput');
                        const content = input.value.trim();
                        if (content && selectedUserId) {
                            const msgObj = {
                                recipientId: selectedUserId,
                                content: content,
                                fileUrl: null,
                                fileType: null
                            };
                            stompClient.send("/app/chat.sendMessage", {}, JSON.stringify(msgObj));
                            input.value = '';
                        }
                    }

                    function handleFileUpload(input) {
                        const file = input.files[0];
                        if (!file || !selectedUserId) return;

                        const formData = new FormData();
                        formData.append('file', file);

                        fetch('${pageContext.request.contextPath}/api/chat/upload', {
                            method: 'POST',
                            body: formData
                        })
                            .then(res => res.json())
                            .then(data => {
                                if (data.fileUrl) {
                                    const msgObj = {
                                        recipientId: selectedUserId,
                                        content: "",
                                        fileUrl: data.fileUrl,
                                        fileType: data.fileType
                                    };
                                    stompClient.send("/app/chat.sendMessage", {}, JSON.stringify(msgObj));
                                } else {
                                    showToast("UPLOAD ERROR", data.error || "Data packet transmission failed.", true);
                                }
                            });
                        input.value = '';
                    }

                    async function toggleRecording() {
                        const micBtn = document.getElementById('micBtn');
                        if (!isRecording) {
                            try {
                                const stream = await navigator.mediaDevices.getUserMedia({ audio: true });
                                mediaRecorder = new MediaRecorder(stream);
                                audioChunks = [];

                                mediaRecorder.ondataavailable = (event) => {
                                    audioChunks.push(event.data);
                                };

                                mediaRecorder.onstop = () => {
                                    const audioBlob = new Blob(audioChunks, { type: 'audio/webm' });
                                    uploadAudio(audioBlob);
                                };

                                mediaRecorder.start();
                                isRecording = true;
                                micBtn.classList.add('text-danger', 'recording-pulse');
                                micBtn.innerHTML = '<i class="fas fa-stop-circle"></i>';
                            } catch (err) {
                                console.error("Error accessing mic:", err);
                                showToast("HARDWARE ERROR", "Microphone access denied or not available.", true);
                            }
                        } else {
                            mediaRecorder.stop();
                            isRecording = false;
                            micBtn.classList.remove('text-danger', 'recording-pulse');
                            micBtn.innerHTML = '<i class="fas fa-microphone"></i>';
                            // Stop all tracks to release mic
                            mediaRecorder.stream.getTracks().forEach(track => track.stop());
                        }
                    }

                    function uploadAudio(blob) {
                        const formData = new FormData();
                        formData.append('file', blob, 'voice_message.webm');

                        fetch('${pageContext.request.contextPath}/api/chat/upload', {
                            method: 'POST',
                            body: formData
                        })
                            .then(res => res.json())
                            .then(data => {
                                if (data.fileUrl) {
                                    const msgObj = {
                                        recipientId: selectedUserId,
                                        content: "",
                                        fileUrl: data.fileUrl,
                                        fileType: data.fileType
                                    };
                                    stompClient.send("/app/chat.sendMessage", {}, JSON.stringify(msgObj));
                                }
                            });
                    }

                    function requestDelete(msgId) {
                        pendingDeleteId = msgId;
                        const modal = new bootstrap.Modal(document.getElementById('deleteConfirmModal'));
                        modal.show();
                    }

                    function confirmDelete() {
                        if (!pendingDeleteId) return;
                        const msgId = pendingDeleteId;

                        fetch('${pageContext.request.contextPath}/api/chat/delete/' + msgId, {
                            method: 'POST'
                        })
                            .then(res => res.json())
                            .then(data => {
                                if (data.success) {
                                    const el = document.getElementById('msg-' + msgId);
                                    if (el) el.remove();
                                    bootstrap.Modal.getInstance(document.getElementById('deleteConfirmModal')).hide();
                                    showToast("DATA ERASED", "Secure data packet has been terminated.");
                                } else {
                                    showToast("ERASURE FAILED", data.error || "Execution error.", true);
                                }
                            });
                    }

                    function appendMessage(msg, type) {
                        if (msg.id && document.getElementById('msg-' + msg.id)) return;

                        const div = document.createElement('div');
                        div.className = 'premium-bubble bubble-' + type;
                        if (msg.id) div.id = 'msg-' + msg.id;

                        let html = '';
                        if (type === 'sent' && msg.id) {
                            html += '<button class="msg-delete-btn" onclick="requestDelete(\'' + msg.id + '\')" title="Delete Message"><i class="fas fa-trash-can"></i></button>';
                        }

                        if (msg.fileUrl) {
                            const isImage = msg.fileType && msg.fileType.startsWith('image/');
                            const fullUrl = msg.fileUrl.startsWith('http') ? msg.fileUrl : '${pageContext.request.contextPath}' + msg.fileUrl;

                            if (isImage) {
                                html += '<img src="' + fullUrl + '" style="max-width: 100%; border-radius: 12px; margin-bottom: 10px; display: block;">';
                            } else if (msg.fileType && msg.fileType.startsWith('audio/')) {
                                html += '<div class="audio-player-v3 mb-2">' +
                                    '<audio controls style="height: 35px; border-radius: 20px;">' +
                                    '<source src="' + fullUrl + '" type="' + msg.fileType + '">' +
                                    'Your browser does not support the audio element.' +
                                    '</audio>' +
                                    '</div>';
                            } else {
                                const fileName = msg.fileUrl.split('/').pop();
                                html += '<div class="d-flex align-items-center gap-2 mb-2 p-2" style="background: rgba(0,0,0,0.1); border-radius: 8px;">' +
                                    '<i class="fas fa-file-alt"></i>' +
                                    '<span class="small text-truncate" style="max-width: 150px;">' + fileName + '</span>' +
                                    '<a href="' + fullUrl + '" download class="ms-auto btn btn-sm btn-light" style="font-size: 10px;">' +
                                    '<i class="fas fa-download"></i>' +
                                    '</a>' +
                                    '</div>';
                            }
                        }

                        if (msg.content) {
                            html += '<span>' + msg.content + '</span>';
                        }

                        div.innerHTML = html;
                        const stream = document.getElementById('messages');
                        stream.appendChild(div);
                        stream.scrollTop = stream.scrollHeight;
                    }

                    function clearTerminal() {
                        const modal = new bootstrap.Modal(document.getElementById('clearConfirmModal'));
                        modal.show();
                    }

                    function executeClear() {
                        document.getElementById('messages').innerHTML = '';
                        bootstrap.Modal.getInstance(document.getElementById('clearConfirmModal')).hide();
                    }

                    connect();
                </script>
            </body>

            </html>