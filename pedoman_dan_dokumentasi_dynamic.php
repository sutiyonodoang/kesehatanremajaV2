<?php
/**
 * Dynamic Documentation with Real-time Statistics
 * File: pedoman_dan_dokumentasi_dynamic.php
 * Purpose: Documentation page with automatic statistics updates
 */

// Include Laravel bootstrap
require_once __DIR__ . '/vendor/autoload.php';
$app = require_once __DIR__ . '/bootstrap/app.php';
$app->make(Illuminate\Contracts\Console\Kernel::class)->bootstrap();

// Get real-time statistics
try {
    $totalUsers = \App\Models\User::where('role', 'user')->count();
    $totalMateri = \App\Models\Materi::count();
    $totalInformasiKesehatan = \App\Models\InformasiKesehatan::count();
    $totalZoomRooms = \App\Models\ZoomRoom::count();
    $totalForumThreads = \App\Models\ForumThread::count();
    $totalConsultations = \App\Models\Consultation::count();
    $totalContent = $totalMateri + $totalInformasiKesehatan + $totalZoomRooms;
    $lastUpdated = date('d M Y H:i');
} catch (Exception $e) {
    // Fallback values if database is unavailable
    $totalContent = 13;
    $totalUsers = 74;
    $totalMateri = 10;
    $totalForumThreads = 1;
    $totalConsultations = 8;
    $lastUpdated = 'Data offline';
}
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pedoman dan Dokumentasi - Platform Kesehatan Remaja (Real-time)</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body { background-color: #f8f9fa; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        .hero-section { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white; padding: 60px 0; margin-bottom: 40px; }
        .card { border: none; border-radius: 15px; box-shadow: 0 10px 30px rgba(0,0,0,0.1); transition: transform 0.3s ease; }
        .card:hover { transform: translateY(-5px); }
        .feature-icon { width: 60px; height: 60px; border-radius: 50%; display: flex; align-items: center; justify-content: center; margin: 0 auto 20px; }
        .bg-primary-custom { background-color: #007bff; }
        .bg-success-custom { background-color: #28a745; }
        .bg-info-custom { background-color: #17a2b8; }
        .text-primary-custom { color: #007bff; }
        .text-success-custom { color: #28a745; }
        .text-info-custom { color: #17a2b8; }
        .stats-updated { font-size: 0.8em; color: #6c757d; margin-top: 10px; }
        .update-indicator { display: inline-block; width: 8px; height: 8px; border-radius: 50%; background: #28a745; margin-right: 5px; }
        .update-indicator.updating { background: #ffc107; animation: pulse 1s infinite; }
        @keyframes pulse { 0% { opacity: 1; } 50% { opacity: 0.5; } 100% { opacity: 1; } }
    </style>
</head>
<body>

    <!-- Hero Section -->
    <section class="hero-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 mx-auto text-center">
                    <h1 class="display-4 fw-bold mb-4">
                        <i class="fas fa-book-open me-3"></i>
                        Pedoman dan Dokumentasi
                    </h1>
                    <p class="lead mb-0">
                        Platform Pembelajaran Kesehatan Remaja Interaktif
                    </p>
                    <p class="mt-3">
                        Panduan lengkap dengan statistik real-time
                    </p>
                </div>
            </div>
        </div>
    </section>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm sticky-top">
        <div class="container">
            <a class="navbar-brand fw-bold text-primary" href="#home">
                <i class="fas fa-heartbeat me-2"></i>
                Kesehatan Remaja
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="#tentang">Tentang</a></li>
                    <li class="nav-item"><a class="nav-link" href="#fitur">Fitur</a></li>
                    <li class="nav-item"><a class="nav-link" href="#panduan">Panduan</a></li>
                    <li class="nav-item"><a class="nav-link" href="#teknis">Teknis</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container my-5">

        <!-- Tentang Platform -->
        <section id="tentang" class="mb-5">
            <div class="row">
                <div class="col-lg-8 mx-auto">
                    <div class="card p-4">
                        <div class="text-center mb-4">
                            <div class="feature-icon bg-primary-custom text-white mx-auto">
                                <i class="fas fa-info-circle fa-2x"></i>
                            </div>
                            <h2 class="h3 fw-bold">Tentang Platform</h2>
                        </div>
                        <p class="lead text-center mb-4">
                            Platform pembelajaran kesehatan remaja yang dirancang untuk memberikan edukasi kesehatan yang komprehensif, interaktif, dan mudah diakses oleh remaja Indonesia.
                        </p>
                        <div class="row text-center">
                            <div class="col-md-4 mb-3">
                                <div class="h5 fw-bold text-primary-custom"><?php echo number_format($totalContent); ?>+</div>
                                <small class="text-muted">Konten Edukasi</small>
                            </div>
                            <div class="col-md-4 mb-3">
                                <div class="h5 fw-bold text-success-custom"><?php echo number_format($totalUsers); ?>+</div>
                                <small class="text-muted">Pengguna Aktif</small>
                            </div>
                            <div class="col-md-4 mb-3">
                                <div class="h5 fw-bold text-info-custom"><?php echo number_format($totalMateri); ?>+</div>
                                <small class="text-muted">Materi Interaktif</small>
                            </div>
                        </div>
                        <div class="stats-updated text-center">
                            <span class="update-indicator"></span>
                            Terakhir diperbarui: <?php echo $lastUpdated; ?>
                            <button class="btn btn-sm btn-outline-primary ms-2 update-stats-btn">
                                <i class="fas fa-sync-alt"></i> Update
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Fitur Utama -->
        <section id="fitur" class="mb-5">
            <div class="text-center mb-5">
                <h2 class="h1 fw-bold">Fitur Utama Platform</h2>
                <p class="lead text-muted">Temukan berbagai fitur yang membuat pembelajaran kesehatan menjadi menarik dan efektif</p>
            </div>

            <div class="row">
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card h-100 p-4">
                        <div class="feature-icon bg-success-custom text-white">
                            <i class="fas fa-book-open fa-2x"></i>
                        </div>
                        <h5 class="fw-bold mb-3">Materi Edukasi</h5>
                        <p class="text-muted mb-3">
                            Koleksi lengkap materi kesehatan remaja dalam format PDF dan video interaktif dengan konten yang up-to-date dan mudah dipahami.
                        </p>
                        <ul class="list-unstyled small">
                            <li><i class="fas fa-check text-success me-2"></i>PDF Pembelajaran</li>
                            <li><i class="fas fa-check text-success me-2"></i>Video Edukasi</li>
                            <li><i class="fas fa-check text-success me-2"></i>Konten Interaktif</li>
                            <li><i class="fas fa-check text-success me-2"></i><span data-stat="materi"><?php echo number_format($totalMateri); ?> materi tersedia</span></li>
                        </ul>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card h-100 p-4">
                        <div class="feature-icon bg-info-custom text-white">
                            <i class="fas fa-users fa-2x"></i>
                        </div>
                        <h5 class="fw-bold mb-3">Forum Diskusi</h5>
                        <p class="text-muted mb-3">
                            Platform diskusi interaktif untuk berbagi pengalaman, bertanya, dan belajar bersama dengan sesama remaja.
                        </p>
                        <ul class="list-unstyled small">
                            <li><i class="fas fa-check text-success me-2"></i>Thread Diskusi</li>
                            <li><i class="fas fa-check text-success me-2"></i>Komunitas Support</li>
                            <li><i class="fas fa-check text-success me-2"></i>Moderasi Konten</li>
                            <li><i class="fas fa-check text-success me-2"></i><span data-stat="forum_threads"><?php echo number_format($totalForumThreads); ?> thread aktif</span></li>
                        </ul>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card h-100 p-4">
                        <div class="feature-icon bg-warning-custom text-white">
                            <i class="fas fa-video fa-2x"></i>
                        </div>
                        <h5 class="fw-bold mb-3">Konsultasi Online</h5>
                        <p class="text-muted mb-3">
                            Sesi konsultasi langsung dengan ahli kesehatan melalui platform untuk mendapatkan jawaban langsung.
                        </p>
                        <ul class="list-unstyled small">
                            <li><i class="fas fa-check text-success me-2"></i>Konsultasi Ahli</li>
                            <li><i class="fas fa-check text-success me-2"></i>Jadwal Fleksibel</li>
                            <li><i class="fas fa-check text-success me-2"></i>Sesi Privat</li>
                            <li><i class="fas fa-check text-success me-2"></i><span data-stat="consultations"><?php echo number_format($totalConsultations); ?> konsultasi selesai</span></li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>

        <!-- Footer -->
        <footer class="text-center py-5 border-top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 mx-auto">
                        <p class="text-muted mb-3">
                            Platform Pembelajaran Kesehatan Remaja © 2025. Dibuat dengan ❤️ untuk kesehatan generasi muda Indonesia.
                        </p>
                        <p class="text-muted small">
                            <i class="fas fa-chart-line me-1"></i>
                            Statistik diperbarui secara real-time dari database
                        </p>
                    </div>
                </div>
            </div>
        </footer>
    </div>

    <!-- Include Statistics Updater -->
    <script src="public/assets/js/stats-updater.js"></script>
    <script>
        // Initialize real-time statistics updater
        document.addEventListener('DOMContentLoaded', function() {
            const statsUpdater = new StatsUpdater();
            statsUpdater.init();

            // Add click handler for manual update button
            document.querySelector('.update-stats-btn').addEventListener('click', function() {
                const indicator = document.querySelector('.update-indicator');
                indicator.classList.add('updating');

                statsUpdater.forceUpdate().then(() => {
                    setTimeout(() => {
                        indicator.classList.remove('updating');
                    }, 1000);
                });
            });
        });
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
