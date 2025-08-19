<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Materi;
use App\Models\Consultation;
use App\Models\ConsultationCategory;
use Illuminate\Support\Facades\DB;
use App\Models\Komentar;

class ReportController extends Controller
{
    public function index()
    {
        // Ambil semua materi untuk mengetahui total materi
        $totalMaterials = Materi::count();

        // Ambil semua user (non-admin dan non-konsultan) beserta progresnya
        $users = User::where('role', 'user')->with('progress')->get();

        $completedUsersCount = 0;
        $inProgressUsersCount = 0;

        $barChartData = [];

        if ($totalMaterials > 0) {
            foreach ($users as $user) {
                $progressCount = $user->progress->count();
                $progressPercentage = ($progressCount / $totalMaterials) * 100;

                $isCompleted = $progressCount >= $totalMaterials;

                if ($isCompleted) {
                    $completedUsersCount++;
                } else {
                    $inProgressUsersCount++;
                }

                $barChartData[] = [
                    'name' => $user->name,
                    'progress' => round($progressPercentage),
                    'status' => $isCompleted ? 'completed' : 'in-progress'
                ];
            }
        }

        $pieChartData = [
            'completed' => $completedUsersCount,
            'in_progress' => $inProgressUsersCount
        ];

        // Statistik Konsultasi
        // 1. Konsultasi Berdasarkan Status
        $consultationStatuses = Consultation::select('status', DB::raw('count(*) as total'))
                                            ->groupBy('status')
                                            ->pluck('total', 'status')
                                            ->toArray();
        $consultationStatusLabels = array_keys($consultationStatuses);
        $consultationStatusCounts = array_values($consultationStatuses);

        // 2. Tren Konsultasi dari Waktu ke Waktu (per bulan, 6 bulan terakhir)
        $consultationTrends = Consultation::select(
                                    DB::raw('DATE_FORMAT(created_at, "%Y-%m") as month'),
                                    DB::raw('count(*) as total')
                                )
                                ->where('created_at', '>=', now()->subMonths(6))
                                ->groupBy('month')
                                ->orderBy('month')
                                ->pluck('total', 'month')
                                ->toArray();

        // Isi bulan yang kosong dengan 0 untuk grafik yang kontinu
        $months = [];
        for ($i = 6; $i >= 0; $i--) {
            $months[now()->subMonths($i)->format('Y-m')] = 0;
        }
        $consultationTrends = array_merge($months, $consultationTrends);

        $consultationTrendLabels = array_keys($consultationTrends);
        $consultationTrendCounts = array_values($consultationTrends);

        // 3. Konsultasi Berdasarkan Kategori Teratas
        $consultationCategories = Consultation::select('category_id', DB::raw('count(*) as total'))
                                                ->with('category') // Memuat relasi kategori
                                                ->groupBy('category_id')
                                                ->orderByDesc('total')
                                                ->get();

        $consultationCategoryLabels = $consultationCategories->map(function($item) {
            return $item->category ? $item->category->name : 'Tidak Berkategori'; // Pastikan nama kategori ada
        })->toArray();
        $consultationCategoryCounts = $consultationCategories->pluck('total')->toArray();

        // Statistik Pengguna Konsultasi
        $totalUsers = User::where('role', 'user')->count();
        $usersWithConsultations = Consultation::distinct('user_id')->count('user_id');
        $percentageUsersWithConsultations = $totalUsers > 0 ? ($usersWithConsultations / $totalUsers) * 100 : 0;

        // Statistik Zoom Rooms
        $totalZoomRooms = \App\Models\ZoomRoom::count();
        $upcomingZoomRooms = \App\Models\ZoomRoom::where('jadwal', '>=', now())->count();
        $pastZoomRooms = \App\Models\ZoomRoom::where('jadwal', '<', now())->count();

        // Statistik Partisipasi Zoom (berdasarkan UserProgress)
        $usersCompletedZoom = \App\Models\UserProgress::where('content_type', 'zoom_room')
                                                    ->where('is_completed', true)
                                                    ->distinct('user_id')
                                                    ->count('user_id');
        $totalZoomCompletions = \App\Models\UserProgress::where('content_type', 'zoom_room')
                                                        ->where('is_completed', true)
                                                        ->count();

        // Komentar Report Data
        $totalComments = Komentar::count();
        $commentsPerMateri = Komentar::select('materi_id', DB::raw('count(*) as total_comments'))
                                    ->with('materi')
                                    ->groupBy('materi_id')
                                    ->orderByDesc('total_comments')
                                    ->get();
        $commentsPerUser = Komentar::select('user_id', DB::raw('count(*) as total_comments'))
                                    ->with('user')
                                    ->groupBy('user_id')
                                    ->orderByDesc('total_comments')
                                    ->limit(10)
                                    ->get();
        $recentComments = Komentar::with(['user', 'materi'])
                                    ->orderByDesc('created_at')
                                    ->limit(10)
                                    ->get();

        return view('admin.reports.index', compact('pieChartData', 'barChartData',
            'consultationStatusLabels', 'consultationStatusCounts',
            'consultationTrendLabels', 'consultationTrendCounts',
            'consultationCategoryLabels', 'consultationCategoryCounts',
            'totalUsers', 'usersWithConsultations', 'percentageUsersWithConsultations',
            'totalZoomRooms', 'upcomingZoomRooms', 'pastZoomRooms',
            'usersCompletedZoom', 'totalZoomCompletions',
            'totalComments', 'commentsPerMateri', 'commentsPerUser', 'recentComments'
        ));
    }
}