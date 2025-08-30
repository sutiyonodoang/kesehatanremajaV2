<?php

require_once 'vendor/autoload.php';
$app = require_once 'bootstrap/app.php';
$app->make(Illuminate\Contracts\Console\Kernel::class)->bootstrap();

// Get real statistics from database
try {
    // Count total users (excluding admin/konsultan if needed)
    $totalUsers = \App\Models\User::where('role', 'user')->count();

    // Count materi (educational content)
    $totalMateri = \App\Models\Materi::count();

    // Count informasi kesehatan
    $totalInformasiKesehatan = \App\Models\InformasiKesehatan::count();

    // Count zoom rooms
    $totalZoomRooms = \App\Models\ZoomRoom::count();

    // Count forum content
    $totalForumThreads = \App\Models\ForumThread::count();
    $totalForumPosts = \App\Models\ForumPost::count();

    // Count consultations
    $totalConsultations = \App\Models\Consultation::count();

    // Count active forum users
    $activeForumUsers = \App\Models\User::whereHas('forumThreads')->orWhereHas('forumPosts')->count();

    echo "=== REAL STATISTICS FROM DATABASE ===\n\n";

    echo "Users (role: user): " . number_format($totalUsers) . "\n";
    echo "Materi: " . number_format($totalMateri) . "\n";
    echo "Informasi Kesehatan: " . number_format($totalInformasiKesehatan) . "\n";
    echo "Zoom Rooms: " . number_format($totalZoomRooms) . "\n";
    echo "Forum Threads: " . number_format($totalForumThreads) . "\n";
    echo "Forum Posts: " . number_format($totalForumPosts) . "\n";
    echo "Consultations: " . number_format($totalConsultations) . "\n";
    echo "Active Forum Users: " . number_format($activeForumUsers) . "\n";

    // Calculate totals for documentation
    $totalContent = $totalMateri + $totalInformasiKesehatan + $totalZoomRooms;
    $totalForumActivity = $totalForumThreads + $totalForumPosts;

    echo "\n=== CALCULATED TOTALS ===\n";
    echo "Total Content (Materi + Info Kesehatan + Zoom): " . number_format($totalContent) . "\n";
    echo "Total Forum Activity: " . number_format($totalForumActivity) . "\n";

    // Generate updated statistics for documentation
    echo "\n=== UPDATED STATISTICS FOR DOCUMENTATION ===\n";
    echo "Konten Edukasi: " . number_format($totalContent) . "+\n";
    echo "Pengguna Aktif: " . number_format($totalUsers) . "+\n";
    echo "Materi Interaktif: " . number_format($totalMateri) . "+\n";
    echo "Forum Diskusi: " . number_format($totalForumThreads) . "+\n";
    echo "Konsultasi: " . number_format($totalConsultations) . "+\n";

} catch (Exception $e) {
    echo "Error getting statistics: " . $e->getMessage() . "\n";
}
