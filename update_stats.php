<?php

/**
 * Dynamic Statistics Display for Documentation
 * File: update_stats.php
 * Purpose: Updates documentation statistics with real-time data
 */

require_once __DIR__ . '/vendor/autoload.php';

$app = require_once __DIR__ . '/bootstrap/app.php';
$app->make(Illuminate\Contracts\Console\Kernel::class)->bootstrap();

try {
    // Get current statistics
    $totalUsers = \App\Models\User::where('role', 'user')->count();
    $totalMateri = \App\Models\Materi::count();
    $totalInformasiKesehatan = \App\Models\InformasiKesehatan::count();
    $totalZoomRooms = \App\Models\ZoomRoom::count();
    $totalForumThreads = \App\Models\ForumThread::count();
    $totalConsultations = \App\Models\Consultation::count();

    $totalContent = $totalMateri + $totalInformasiKesehatan + $totalZoomRooms;

    // Generate updated HTML content
    $statsHtml = "
        <div class=\"row text-center\">
            <div class=\"col-md-4 mb-3\">
                <div class=\"h5 fw-bold text-primary-custom\">" . number_format($totalContent) . "+</div>
                <small class=\"text-muted\">Konten Edukasi</small>
            </div>
            <div class=\"col-md-4 mb-3\">
                <div class=\"h5 fw-bold text-success-custom\">" . number_format($totalUsers) . "+</div>
                <small class=\"text-muted\">Pengguna Aktif</small>
            </div>
            <div class=\"col-md-4 mb-3\">
                <div class=\"h5 fw-bold text-info-custom\">" . number_format($totalMateri) . "+</div>
                <small class=\"text-muted\">Materi Interaktif</small>
            </div>
        </div>
    ";

    // Additional statistics for features section
    $featureStats = [
        'forum_threads' => number_format($totalForumThreads) . '+',
        'consultations' => number_format($totalConsultations) . '+',
        'zoom_rooms' => number_format($totalZoomRooms) . '+',
        'health_info' => number_format($totalInformasiKesehatan) . '+'
    ];

    // Return JSON response
    header('Content-Type: application/json');
    echo json_encode([
        'success' => true,
        'stats_html' => $statsHtml,
        'feature_stats' => $featureStats,
        'raw_data' => [
            'total_content' => $totalContent,
            'total_users' => $totalUsers,
            'total_materi' => $totalMateri,
            'total_forum_threads' => $totalForumThreads,
            'total_consultations' => $totalConsultations,
            'total_zoom_rooms' => $totalZoomRooms,
            'total_health_info' => $totalInformasiKesehatan
        ],
        'last_updated' => date('Y-m-d H:i:s')
    ], JSON_PRETTY_PRINT);

} catch (Exception $e) {
    header('Content-Type: application/json');
    echo json_encode([
        'success' => false,
        'error' => $e->getMessage(),
        'timestamp' => date('Y-m-d H:i:s')
    ], JSON_PRETTY_PRINT);
}
?>
