<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\UserProgress;
use App\Models\Materi;
use App\Models\Consultation;
use App\Models\ConsultationCategory;
use App\Models\Forum;
use App\Models\ForumThread;
use App\Models\ForumPost;
use Illuminate\Support\Facades\DB;
use App\Models\Komentar;
use Carbon\Carbon;

class ReportController extends Controller
{
    public function index()
    {
        // Ambil total content untuk setiap jenis
        $totalInformasiKesehatan = \App\Models\InformasiKesehatan::count();
        $totalMateriPdf = Materi::where('jenis', 'pdf')->count();
        $totalMateriVideo = Materi::where('jenis', 'video')->count();
        $totalZoomRooms = \App\Models\ZoomRoom::count();

        // Ambil semua user (non-admin dan non-konsultan)
        $users = User::where('role', 'user')->get();

        $completedUsersCount = 0;
        $inProgressUsersCount = 0;

        $barChartData = [];

        foreach ($users as $user) {
            // Hitung progress untuk setiap jenis content (sama seperti di dashboard user)
            $completedInformasiKesehatan = UserProgress::where('user_id', $user->id)
                                                      ->where('content_type', 'informasi_kesehatan')
                                                      ->where('is_completed', true)
                                                      ->distinct('content_id')
                                                      ->count('content_id');
            $completedMateriPdf = UserProgress::where('user_id', $user->id)
                                             ->where('content_type', 'materi_pdf')
                                             ->where('is_completed', true)
                                             ->distinct('content_id')
                                             ->count('content_id');
            $completedMateriVideo = UserProgress::where('user_id', $user->id)
                                               ->where('content_type', 'materi_video')
                                               ->where('is_completed', true)
                                               ->distinct('content_id')
                                               ->count('content_id');
            $completedZoomRooms = UserProgress::where('user_id', $user->id)
                                             ->where('content_type', 'zoom_room')
                                             ->where('is_completed', true)
                                             ->distinct('content_id')
                                             ->count('content_id');

            // Hitung persentase untuk setiap jenis content
            $percentInformasiKesehatan = $totalInformasiKesehatan > 0 ? ($completedInformasiKesehatan / $totalInformasiKesehatan) * 100 : 0;
            $percentMateriPdf = $totalMateriPdf > 0 ? ($completedMateriPdf / $totalMateriPdf) * 100 : 0;
            $percentMateriVideo = $totalMateriVideo > 0 ? ($completedMateriVideo / $totalMateriVideo) * 100 : 0;
            $percentZoomRooms = $totalZoomRooms > 0 ? ($completedZoomRooms / $totalZoomRooms) * 100 : 0;

            // Hitung rata-rata keseluruhan (sama seperti di dashboard user)
            $totalContentTypes = 0;
            $sumPercentages = 0;

            if ($totalInformasiKesehatan > 0) { $totalContentTypes++; $sumPercentages += $percentInformasiKesehatan; }
            if ($totalMateriPdf > 0) { $totalContentTypes++; $sumPercentages += $percentMateriPdf; }
            if ($totalMateriVideo > 0) { $totalContentTypes++; $sumPercentages += $percentMateriVideo; }
            if ($totalZoomRooms > 0) { $totalContentTypes++; $sumPercentages += $percentZoomRooms; }

            $overallProgress = $totalContentTypes > 0 ? round($sumPercentages / $totalContentTypes, 2) : 0;

            // Tentukan status berdasarkan progress keseluruhan
            $isCompleted = $overallProgress >= 100;

            if ($isCompleted) {
                $completedUsersCount++;
            } else {
                $inProgressUsersCount++;
            }

            $barChartData[] = [
                'name' => $user->name,
                'progress' => $overallProgress,
                'status' => $isCompleted ? 'completed' : 'in-progress'
            ];
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

        // Forum Statistics
        $forumStats = $this->getForumStatistics();

        return view('admin.reports.index', compact('pieChartData', 'barChartData',
            'consultationStatusLabels', 'consultationStatusCounts',
            'consultationTrendLabels', 'consultationTrendCounts',
            'consultationCategoryLabels', 'consultationCategoryCounts',
            'totalUsers', 'usersWithConsultations', 'percentageUsersWithConsultations',
            'totalZoomRooms', 'upcomingZoomRooms', 'pastZoomRooms',
            'usersCompletedZoom', 'totalZoomCompletions',
            'totalComments', 'commentsPerMateri', 'commentsPerUser', 'recentComments',
            'forumStats'
        ));
    }

    /**
     * Get comprehensive forum statistics
     */
    private function getForumStatistics()
    {
        try {
            // Basic statistics
            $totalForums = Forum::count();
            $totalThreads = ForumThread::count();
            $totalPosts = ForumPost::count();
            $totalActiveUsers = User::whereHas('forumThreads')->orWhereHas('forumPosts')->count();
            
            // User engagement data
            $topUsers = User::select('users.*')
                ->withCount(['forumThreads', 'forumPosts'])
                ->having('forum_threads_count', '>', 0)
                ->orHaving('forum_posts_count', '>', 0)
                ->orderByRaw('(forum_threads_count + forum_posts_count) DESC')
                ->limit(10)
                ->get()
                ->map(function($user) {
                    $user->total_activity = $user->forum_threads_count + $user->forum_posts_count;
                    
                    // Calculate engagement score
                    $monthlyThreads = ForumThread::where('user_id', $user->id)
                        ->where('created_at', '>=', Carbon::now()->startOfMonth())
                        ->count();
                    $monthlyPosts = ForumPost::where('user_id', $user->id)
                        ->where('created_at', '>=', Carbon::now()->startOfMonth())
                        ->count();
                    
                    $user->engagement_score = min(100, 
                        ($user->forum_threads_count * 3) + 
                        ($user->forum_posts_count * 1) + 
                        (($monthlyThreads + $monthlyPosts) * 2)
                    );
                    
                    // Engagement level
                    if ($user->engagement_score >= 50) {
                        $user->engagement_level = 'Sangat Aktif';
                        $user->engagement_color = 'success';
                    } elseif ($user->engagement_score >= 25) {
                        $user->engagement_level = 'Aktif';
                        $user->engagement_color = 'primary';
                    } elseif ($user->engagement_score >= 10) {
                        $user->engagement_level = 'Cukup Aktif';
                        $user->engagement_color = 'warning';
                    } else {
                        $user->engagement_level = 'Kurang Aktif';
                        $user->engagement_color = 'secondary';
                    }
                    
                    return $user;
                });

            // Popular threads
            $popularThreads = ForumThread::select('forum_threads.*')
                ->withCount('posts')
                ->with(['forum', 'user'])
                ->orderByDesc('views_count')
                ->limit(10)
                ->get();

            // Forum activity by category
            $forumActivity = Forum::withCount(['threads', 'threads as posts_count' => function($query) {
                $query->join('forum_posts', 'forum_threads.id', '=', 'forum_posts.thread_id')
                      ->select(DB::raw('count(forum_posts.id)'));
            }])->orderByDesc('threads_count')->get();

            // Daily activity for the last 30 days
            $dailyActivity = $this->getForumDailyActivity(30);
            
            // Engagement level distribution
            $engagementDistribution = [
                'Sangat Aktif' => $topUsers->where('engagement_level', 'Sangat Aktif')->count(),
                'Aktif' => $topUsers->where('engagement_level', 'Aktif')->count(),
                'Cukup Aktif' => $topUsers->where('engagement_level', 'Cukup Aktif')->count(),
                'Kurang Aktif' => $topUsers->where('engagement_level', 'Kurang Aktif')->count(),
            ];

            return [
                'totalForums' => $totalForums,
                'totalThreads' => $totalThreads,
                'totalPosts' => $totalPosts,
                'totalActiveUsers' => $totalActiveUsers,
                'topUsers' => $topUsers,
                'popularThreads' => $popularThreads,
                'forumActivity' => $forumActivity,
                'dailyActivity' => $dailyActivity,
                'engagementDistribution' => $engagementDistribution
            ];
        } catch (\Exception $e) {
            // Return default empty data if there's an error
            return [
                'totalForums' => 0,
                'totalThreads' => 0,
                'totalPosts' => 0,
                'totalActiveUsers' => 0,
                'topUsers' => collect(),
                'popularThreads' => collect(),
                'forumActivity' => collect(),
                'dailyActivity' => [],
                'engagementDistribution' => [
                    'Sangat Aktif' => 0,
                    'Aktif' => 0,
                    'Cukup Aktif' => 0,
                    'Kurang Aktif' => 0,
                ]
            ];
        }
    }

    /**
     * Get forum daily activity
     */
    private function getForumDailyActivity($days = 30)
    {
        try {
            $startDate = Carbon::now()->subDays($days);
            
            $threads = ForumThread::select(
                    DB::raw('DATE(created_at) as date'),
                    DB::raw('COUNT(*) as count')
                )
                ->where('created_at', '>=', $startDate)
                ->groupBy('date')
                ->orderBy('date')
                ->get()
                ->keyBy('date');

            $posts = ForumPost::select(
                    DB::raw('DATE(created_at) as date'),
                    DB::raw('COUNT(*) as count')
                )
                ->where('created_at', '>=', $startDate)
                ->groupBy('date')
                ->orderBy('date')
                ->get()
                ->keyBy('date');

            $data = [];
            for ($i = $days - 1; $i >= 0; $i--) {
                $date = Carbon::now()->subDays($i)->format('Y-m-d');
                $threadsCount = $threads->get($date)->count ?? 0;
                $postsCount = $posts->get($date)->count ?? 0;
                
                $data[] = [
                    'date' => $date,
                    'threads' => $threadsCount,
                    'posts' => $postsCount,
                    'total' => $threadsCount + $postsCount
                ];
            }

            return $data;
        } catch (\Exception $e) {
            // Return empty data array if there's an error
            $data = [];
            for ($i = $days - 1; $i >= 0; $i--) {
                $date = Carbon::now()->subDays($i)->format('Y-m-d');
                $data[] = [
                    'date' => $date,
                    'threads' => 0,
                    'posts' => 0,
                    'total' => 0
                ];
            }
            return $data;
        }
    }
}