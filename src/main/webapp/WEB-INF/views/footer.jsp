<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>

        <style>
            .footer-premium {
                border-top: 1px solid rgba(255, 255, 255, 0.05);
                background: #020617;
                font-family: 'Outfit', sans-serif;
            }

            .brand-premium {
                font-size: 28px;
                font-weight: 900;
                letter-spacing: -1.5px;
                background: linear-gradient(135deg, #10b981 0%, #06b6d4 100%);
                -webkit-background-clip: text;
                background-clip: text;
                -webkit-text-fill-color: transparent;
                display: flex;
                align-items: center;
                gap: 10px;
            }

            .brand-icon-box {
                width: 32px;
                height: 32px;
                background: linear-gradient(135deg, rgba(16, 185, 129, 0.2), rgba(6, 182, 212, 0.2));
                border: 1px solid rgba(16, 185, 129, 0.3);
                border-radius: 8px;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 16px;
                color: #10b981;
            }

            .hover-white {
                transition: color 0.3s ease;
            }

            .hover-white:hover {
                color: white !important;
            }

            .letter-spacing-2 {
                letter-spacing: 2px;
            }

            .uppercase {
                text-transform: uppercase;
            }

            .x-small {
                font-size: 11px;
            }

            .social-link {
                transition: transform 0.3s ease, color 0.3s ease;
                display: inline-block;
            }

            .social-link:hover {
                transform: translateY(-3px);
                color: #10b981 !important;
            }
        </style>

        <footer class="py-5 footer-premium" id="ecosystem">
            <div class="container">
                <div class="row g-5">
                    <div class="col-lg-4">
                        <div class="brand-premium mb-3">
                            <div class="brand-icon-box">
                                <i class="fas fa-leaf"></i>
                            </div>
                            AGROPLANTER
                        </div>
                        <p class="text-white-50 small mb-4">
                            Building the digital infrastructure for the next generation of global agriculture.
                            Empowering 100M+ farmers with precision technology and AI-driven insights.
                        </p>
                        <div class="d-flex gap-3">
                            <a href="https://twitter.com/agroplanter" target="_blank"
                                class="text-white-50 fs-5 social-link"><i class="fab fa-twitter"></i> 𝕏</a>
                            <a href="https://linkedin.com/company/agroplanter" target="_blank"
                                class="text-white-50 fs-5 social-link"><i class="fab fa-linkedin"></i> 🔗</a>
                            <a href="https://github.com/agroplanter" target="_blank"
                                class="text-white-50 fs-5 social-link"><i class="fab fa-github"></i> 💻</a>
                        </div>
                    </div>
                    <div class="col-lg-8">
                        <div class="row row-cols-2 row-cols-md-4 g-4">
                            <div class="col">
                                <h6 class="fw-bold text-white mb-4 x-small letter-spacing-2 uppercase">ECOSYSTEM</h6>
                                <ul class="list-unstyled small text-white-50">
                                    <li class="mb-2"><a href="${pageContext.request.contextPath}/farmer/market-prices"
                                            class="text-decoration-none text-white-50 hover-white">Market
                                            Intelligence</a></li>
                                    <li class="mb-2"><a
                                            href="${pageContext.request.contextPath}/farmer/disease-detection"
                                            class="text-decoration-none text-white-50 hover-white">Bio-Labs</a></li>
                                    <li class="mb-2"><a
                                            href="${pageContext.request.contextPath}/farmer/equipment-rental"
                                            class="text-decoration-none text-white-50 hover-white">Equipment Fleet</a>
                                    </li>
                                    <li class="mb-2"><a href="${pageContext.request.contextPath}/farmer/marketplace"
                                            class="text-decoration-none text-white-50 hover-white">Global Trade</a></li>
                                </ul>
                            </div>
                            <div class="col">
                                <h6 class="fw-bold text-white mb-4 x-small letter-spacing-2 uppercase">RESOURCES</h6>
                                <ul class="list-unstyled small text-white-50">
                                    <li class="mb-2"><a href="${pageContext.request.contextPath}/farmer/learning"
                                            class="text-decoration-none text-white-50 hover-white">Neural Academy</a>
                                    </li>
                                    <li class="mb-2"><a href="${pageContext.request.contextPath}/farmer/mentors"
                                            class="text-decoration-none text-white-50 hover-white">Expert Panel</a></li>
                                    <li class="mb-2"><a href="${pageContext.request.contextPath}/farmer/schemes"
                                            class="text-decoration-none text-white-50 hover-white">Govt. Schemes</a>
                                    </li>
                                    <li class="mb-2"><a href="${pageContext.request.contextPath}/farmer/weather"
                                            class="text-decoration-none text-white-50 hover-white">Weather Intel</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="col">
                                <h6 class="fw-bold text-white mb-4 x-small letter-spacing-2 uppercase">COMPANY</h6>
                                <ul class="list-unstyled small text-white-50">
                                    <li class="mb-2"><a href="${pageContext.request.contextPath}/subscription"
                                            class="text-decoration-none text-white-50 hover-white">Subscription
                                            Plans</a></li>
                                    <li class="mb-2"><a href="${pageContext.request.contextPath}/help"
                                            class="text-decoration-none text-white-50 hover-white">Help Center</a></li>
                                    <li class="mb-2"><a href="${pageContext.request.contextPath}/contact"
                                            class="text-decoration-none text-white-50 hover-white">Partnerships</a></li>
                                    <li class="mb-2"><a href="${pageContext.request.contextPath}/register"
                                            class="text-decoration-none text-white-50 hover-white">Join Us</a></li>
                                </ul>
                            </div>
                            <div class="col">
                                <h6 class="fw-bold text-white mb-4 x-small letter-spacing-2 uppercase">SECURITY</h6>
                                <ul class="list-unstyled small text-white-50">
                                    <li class="mb-2"><a href="${pageContext.request.contextPath}/farmer/safety-hub"
                                            class="text-decoration-none text-white-50 hover-white">Safety Center</a>
                                    </li>
                                    <li class="mb-2"><a href="${pageContext.request.contextPath}/privacy"
                                            class="text-decoration-none text-white-50 hover-white">Privacy Protocol</a>
                                    </li>
                                    <li class="mb-2"><a href="${pageContext.request.contextPath}/terms"
                                            class="text-decoration-none text-white-50 hover-white">Terms of Action</a>
                                    </li>
                                    <li class="mb-2"><a href="${pageContext.request.contextPath}/recovery"
                                            class="text-decoration-none text-white-50 hover-white">Key Recovery</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <hr class="my-5 opacity-10" style="border-top: 1px solid rgba(255,255,255,0.1);">
                <div
                    class="d-flex flex-column flex-md-row justify-content-between align-items-center gap-3 small text-white-50">
                    <div class="d-flex align-items-center gap-2">
                        <span class="p-1 bg-success rounded-circle" style="width: 8px; height: 8px;"></span>
                        <span>ALL SYSTEMS OPERATIONAL</span>
                    </div>
                    <span>&copy; 2026 AGROPLANTER TECHNOLOGY GROUP. POWERED BY AI DECENTRALIZATION.</span>
                    <div class="d-flex gap-4">
                        <a href="${pageContext.request.contextPath}/help"
                            class="text-decoration-none text-white-50 hover-white">SITEMAP</a>
                        <a href="${pageContext.request.contextPath}/terms"
                            class="text-decoration-none text-white-50 hover-white">ISO 9001:2026</a>
                    </div>
                </div>
            </div>
        </footer>

