<?php

/**
 * Real-time Statistics API for Health Education Platform
 * File: get_statistics.php
 * Purpose: Provides current database statistics for documentation
 */

require_once __DIR__ . '/vendor/autoload.php';

$app = require_once __DIR__ . '/bootstrap/app.php';
$app->make(Illuminate\Contracts\Console\Kernel::class)->bootstrap();

header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET');
header('Access-Control-Allow-Headers: Content-Type');

try {
    // Get current statistics from database
    $stats = [];

    // Count users by role
    $stats['total_users'] = \App\Models\User::count();
    $stats['active_users'] = \App\Models\User::where('role', 'user')->count();
    $stats['admin_users'] = \App\Models\User::where('role', 'admin')->count();
    $stats['consultant_users'] = \App\Models\User::where('role', 'konsultan')->count();

    // Count educational content
    $stats['materi_count'] = \App\Models\Materi::count();
    $stats['informasi_kesehatan_count'] = \App\Models\InformasiKesehatan::count();
    $stats['zoom_rooms_count'] = \App\Models\ZoomRoom::count();

    // Calculate total content
    $stats['total_content'] = $stats['materi_count'] + $stats['informasi_kesehatan_count'] + $stats['zoom_rooms_count'];

    // Forum statistics
    $stats['forum_threads'] = \App\Models\ForumThread::count();
    $stats['forum_posts'] = \App\Models\ForumPost::count();
    $stats['total_forum_activity'] = $stats['forum_threads'] + $stats['forum_posts'];

    // Active forum users
    $stats['active_forum_users'] = \App\Models\User::whereHas('forumThreads')
        ->orWhereHas('forumPosts')
        ->count();

    // Consultation statistics
    $stats['consultations_count'] = \App\Models\Consultation::count();
    $stats['consultation_responses_count'] = \App\Models\ConsultationResponse::count();

    // User progress statistics
    $stats['user_progress_count'] = \App\Models\UserProgress::count();
    $stats['download_logs_count'] = \App\Models\DownloadLog::count();

    // Comments and likes
    $stats['comments_count'] = \App\Models\Komentar::count();
    $stats['likes_count'] = \App\Models\Like::count();

    // Consultation categories
    $stats['consultation_categories_count'] = \App\Models\ConsultationCategory::count();

    // Consultation attachments
    $stats['consultation_attachments_count'] = \App\Models\ConsultationAttachment::count();

    // Get last updated timestamp
    $stats['last_updated'] = date('Y-m-d H:i:s');

    // Format for documentation display
    $formatted_stats = [
        'konten_edukasi' => number_format($stats['total_content']) . '+',
        'pengguna_aktif' => number_format($stats['active_users']) . '+',
        'materi_interaktif' => number_format($stats['materi_count']) . '+',
        'forum_diskusi' => number_format($stats['forum_threads']) . '+',
        'konsultasi' => number_format($stats['consultations_count']) . '+',
        'zoom_rooms' => number_format($stats['zoom_rooms_count']) . '+',
        'informasi_kesehatan' => number_format($stats['informasi_kesehatan_count']) . '+'
    ];

    // Return JSON response
    echo json_encode([
        'success' => true,
        'data' => $stats,
        'formatted' => $formatted_stats,
        'timestamp' => $stats['last_updated']
    ], JSON_PRETTY_PRINT);

} catch (Exception $e) {
    // Error handling
    echo json_encode([
        'success' => false,
        'error' => $e->getMessage(),
        'timestamp' => date('Y-m-d H:i:s')
    ], JSON_PRETTY_PRINT);
}
?>
