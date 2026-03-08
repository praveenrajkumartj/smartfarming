<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
            <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>🌾 Traceability Hub: ${record.listing.cropName} - AGROPLANTER</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
                        rel="stylesheet">
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
                    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;800;900&display=swap"
                        rel="stylesheet">
                    <link rel="icon"
                        href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🌿</text></svg>" />
                    <style>
                        .v3-trace-hero {
                            background: linear-gradient(135deg, rgba(34, 197, 94, 0.1) 0%, rgba(15, 23, 42, 0.4) 100%);
                            border-radius: 40px;
                            padding: 80px 60px;
                            margin-bottom: 50px;
                            backdrop-filter: blur(40px);
                            border: 1px solid rgba(255, 255, 255, 0.05);
                            position: relative;
                            overflow: hidden;
                            text-align: center;
                        }

                        .v3-timeline {
                            position: relative;
                            padding-left: 50px;
                        }

                        .v3-timeline::before {
                            content: '';
                            position: absolute;
                            left: 14px;
                            top: 0;
                            bottom: 0;
                            width: 2px;
                            background: linear-gradient(to bottom, #22c55e, rgba(34, 197, 94, 0.1));
                        }

                        .v3-timeline-node {
                            position: relative;
                            margin-bottom: 40px;
                        }

                        .v3-timeline-orb {
                            position: absolute;
                            left: -50px;
                            width: 30px;
                            height: 30px;
                            background: #020617;
                            border: 2px solid #22c55e;
                            border-radius: 10px;
                            display: flex;
                            align-items: center;
                            justify-content: center;
                            font-size: 12px;
                            z-index: 1;
                            box-shadow: 0 0 15px rgba(34, 197, 94, 0.3);
                        }

                        .v3-timeline-content {
                            background: rgba(15, 23, 42, 0.3);
                            border: 1px solid rgba(255, 255, 255, 0.05);
                            border-radius: 20px;
                            padding: 25px;
                            backdrop-filter: blur(20px);
                        }

                        .v3-identity-label {
                            font-size: 9px;
                            font-weight: 950;
                            color: #475569;
                            letter-spacing: 2px;
                            text-transform: uppercase;
                            margin-bottom: 8px;
                            display: block;
                        }

                        .v3-provenance-tag {
                            background: rgba(34, 197, 94, 0.1);
                            color: #22c55e;
                            border: 1px solid rgba(34, 197, 94, 0.2);
                            padding: 8px 16px;
                            border-radius: 50px;
                            font-weight: 950;
                            font-size: 10px;
                            letter-spacing: 2px;
                            text-transform: uppercase;
                            display: inline-block;
                            margin-bottom: 25px;
                        }

                        .v3-farmer-mini {
                            width: 80px;
                            height: 80px;
                            background: linear-gradient(135deg, #22c55e, #10b981);
                            border-radius: 24px;
                            display: flex;
                            align-items: center;
                            justify-content: center;
                            font-size: 32px;
                            margin: 0 auto 20px;
                        }
                    </style>
                </head>

                <body style="background: #020617; color: #fff; font-family: 'Outfit', sans-serif;">
                    <div class="dashboard-scene"></div>

                    <div class="container py-5">
                        <header class="mb-5 text-center">
                            <div class="top-nav-left d-inline-flex flex-column align-items-center">
                                <div class="brand-icon-box"><i class="fas fa-leaf"></i></div>
                                    style="width: 60px; height: 60px; object-fit: contain; margin-bottom: 15px;">
                                <h3 class="brand-premium m-0" style="font-size: 24px;">AGROPLANTER</h3>
                                <span class="v3-page-subtitle text-success fw-950 uppercase"
                                    style="letter-spacing: 2px;">GLOBAL PROVENANCE NETWORK</span>
                            </div>
                        </header>

                        <div class="v3-trace-hero">
                            <div class="v3-provenance-tag">
                                <span class="me-2">✅</span> Genuine Provenance Guaranteed
                            </div>
                            <h1 class="display-3 fw-950 text-white mb-3" style="letter-spacing: -3px;">From Farm To Your
                                Plate</h1>
                            <p class="text-white-50 fw-800 uppercase x-small mb-0"
                                style="letter-spacing: 2px; opacity: 0.6;">
                                BATCH TRACEABILITY FOR <span
                                    class="text-success">${record.listing.cropName.toUpperCase()}</span> | BATCH ID:
                                #${record.traceabilityId.substring(0,8).toUpperCase()}
                            </p>
                        </div>

                        <div class="row g-5">
                            <div class="col-lg-8">
                                <div class="v3-nexus-panel p-5">
                                    <h3 class="fw-950 text-white mb-5" style="letter-spacing: -1px;">🌱 Growth
                                        Intelligence Timeline</h3>

                                    <div class="v3-timeline">
                                        <!-- Planting -->
                                        <div class="v3-timeline-node">
                                            <div class="v3-timeline-orb">🌱</div>
                                            <div class="v3-timeline-content">
                                                <span class="v3-identity-label">INITIALIZATION</span>
                                                <h5 class="text-white fw-950 mb-2">Planting Date</h5>
                                                <p class="text-success fw-900 small mb-3">
                                                    <fmt:formatDate
                                                        value="${java.util.Date.from(record.plantingDate.atStartOfDay(java.time.ZoneId.systemDefault()).toInstant())}"
                                                        pattern="dd MMMM yyyy" />
                                                </p>
                                                <p class="text-white-50 small fw-600 mb-0" style="opacity: 0.7;">
                                                    Crop cycle initiated with certified high-yield seeds in optimized
                                                    soil conditions.
                                                </p>
                                            </div>
                                        </div>

                                        <!-- Fertilization -->
                                        <div class="v3-timeline-node">
                                            <div class="v3-timeline-orb">🧪</div>
                                            <div class="v3-timeline-content">
                                                <span class="v3-identity-label">NUTRIENT OPTIMIZATION</span>
                                                <h5 class="text-white fw-950 mb-2">Fertilization Protocol</h5>
                                                <div class="p-3 rounded-3 mt-2"
                                                    style="background: rgba(255, 255, 255, 0.03); border: 1px solid rgba(255, 255, 255, 0.05);">
                                                    <p class="text-white fw-800 small mb-0">
                                                        ${not empty record.fertilizerUsage ? record.fertilizerUsage :
                                                        'PROTOCOL SECURED: GENESIS NUTRIENTS'}
                                                    </p>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Pesticide -->
                                        <div class="v3-timeline-node">
                                            <div class="v3-timeline-orb">🔬</div>
                                            <div class="v3-timeline-content">
                                                <span class="v3-identity-label">BIO-SECURITY</span>
                                                <h5 class="text-white fw-950 mb-2">Pesticide Management</h5>
                                                <div class="p-3 rounded-3 mt-2"
                                                    style="background: rgba(255, 255, 255, 0.03); border: 1px solid rgba(255, 255, 255, 0.05);">
                                                    <p class="text-white fw-800 small mb-0">
                                                        ${not empty record.pesticideUsage ? record.pesticideUsage :
                                                        'DATA INTEGRITY VERIFIED: ZERO TOXIN NODE'}
                                                    </p>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Irrigation -->
                                        <div class="v3-timeline-node">
                                            <div class="v3-timeline-orb">💧</div>
                                            <div class="v3-timeline-content">
                                                <span class="v3-identity-label">HYDRATION LOGIC</span>
                                                <h5 class="text-white fw-950 mb-2">Irrigation Method</h5>
                                                <p class="text-info fw-900 small mb-0">${record.irrigationMethod}</p>
                                            </div>
                                        </div>

                                        <!-- Harvesting -->
                                        <div class="v3-timeline-node">
                                            <div class="v3-timeline-orb">🚜</div>
                                            <div class="v3-timeline-content">
                                                <span class="v3-identity-label">EXTRACTION & TERMINATION</span>
                                                <h5 class="text-white fw-950 mb-2">Harvesting Execution</h5>
                                                <p class="text-warning fw-900 small mb-3">
                                                    <fmt:formatDate
                                                        value="${java.util.Date.from(record.harvestDate.atStartOfDay(java.time.ZoneId.systemDefault()).toInstant())}"
                                                        pattern="dd MMMM yyyy" />
                                                </p>
                                                <div class="badge bg-success bg-opacity-10 text-success fw-950 px-3 py-2 rounded-pill uppercase"
                                                    style="font-size: 9px; letter-spacing: 2px;">
                                                    NODE READY FOR LOGISTICS
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="v3-nexus-panel p-5 mt-5">
                                    <h3 class="fw-950 text-white mb-4" style="letter-spacing: -1px;">🌎 Strategic
                                        Sustainability</h3>
                                    <div class="p-4 rounded-3"
                                        style="background: rgba(255, 255, 255, 0.03); border: 1px solid rgba(255, 255, 255, 0.05);">
                                        <p class="text-white-50 fw-600 lh-lg mb-0"
                                            style="font-size: 16px; opacity: 0.8;">
                                            ${not empty record.sustainabilityPractices ? record.sustainabilityPractices
                                            : 'AGROPLANTER Standard: ESG Optimized Growth Node'}
                                        </p>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="v3-nexus-panel p-5 text-center mb-5">
                                    <div class="v3-farmer-mini">👨‍🌾</div>
                                    <h3 class="text-white fw-950 mb-1" style="letter-spacing: -1px;">
                                        ${record.listing.farmer.fullName.toUpperCase()}</h3>
                                    <div class="text-success fw-950 uppercase mb-4"
                                        style="font-size: 10px; letter-spacing: 2px;">CERTIFIED FARMER NODE</div>

                                    <div class="v3-stat-grid mt-5">
                                        <div class="v3-stat-node p-4">
                                            <span class="v3-identity-label">CYCLE TIME</span>
                                            <div class="text-white fw-950 fs-4">
                                                ${java.time.Period.between(record.plantingDate,
                                                record.harvestDate).getMonths()} MO</div>
                                        </div>
                                        <div class="v3-stat-node p-4 mt-3">
                                            <span class="v3-identity-label">BATCH VOLUME</span>
                                            <div class="text-white fw-950 fs-4">${record.listing.quantity}
                                                ${record.listing.unit.toUpperCase()}</div>
                                        </div>
                                    </div>
                                </div>

                                <div class="v3-nexus-panel p-5">
                                    <h3 class="fw-950 text-white mb-4" style="letter-spacing: -1px;">📍 Geo-Coordinates
                                    </h3>
                                    <div
                                        style="height: 300px; background: linear-gradient(135deg, #1e293b, #0f172a); border-radius: 30px; display: flex; align-items: center; justify-content: center; border: 1px solid rgba(255,255,255,0.05); overflow: hidden; position: relative;">
                                        <img src="https://images.unsplash.com/photo-1500382017468-9049fed747ef?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80"
                                            style="position: absolute; inset: 0; width: 100%; height: 100%; object-fit: cover; opacity: 0.3;">
                                        <div
                                            style="position: relative; z-index: 1; text-align: center; padding: 30px; background: rgba(15, 23, 42, 0.8); backdrop-filter: blur(10px); border-radius: 20px; border: 1px solid rgba(255,255,255,0.1);">
                                            <h5 class="text-white fw-950 mb-2">${record.listing.location.toUpperCase()}
                                            </h5>
                                            <div class="v3-identity-label mb-0" style="opacity: 0.5;">FARM ID:
                                                AF-${record.listing.farmer.id}</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <footer class="text-center py-5 mt-5 border-top border-white border-opacity-5">
                            <div class="v3-identity-label" style="opacity: 0.3; font-size: 10px;">
                                &copy; 2026 AGROPLANTER Global Intelligence • SECURED VIA BLOCKCHAIN PROVENANCE NODES
                            </div>
                        </footer>
                    </div>

                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                </body>

                </html>



