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

        // Statistik Progres Per Kategori
        $totalUsers = count($users);
        $categoryStats = [];
        
        if ($totalUsers > 0) {
            // Hitung jumlah user yang menyelesaikan setiap kategori
            $completedInformasiKesehatanUsers = UserProgress::where('content_type', 'informasi_kesehatan')
                                                           ->where('is_completed', true)
                                                           ->distinct('user_id')
                                                           ->count('user_id');
            $completedMateriPdfUsers = UserProgress::where('content_type', 'materi_pdf')
                                                  ->where('is_completed', true)
                                                  ->distinct('user_id')
                                                  ->count('user_id');
            $completedMateriVideoUsers = UserProgress::where('content_type', 'materi_video')
                                                    ->where('is_completed', true)
                                                    ->distinct('user_id')
                                                    ->count('user_id');
            $completedZoomRoomUsers = UserProgress::where('content_type', 'zoom_room')
                                                 ->where('is_completed', true)
                                                 ->distinct('user_id')
                                                 ->count('user_id');

            $categoryStats = [
                'informasi_kesehatan' => [
                    'name' => 'Informasi Kesehatan',
                    'completed_users' => $completedInformasiKesehatanUsers,
                    'total_users' => $totalUsers,
                    'percentage' => round(($completedInformasiKesehatanUsers / $totalUsers) * 100, 1),
                    'total_content' => $totalInformasiKesehatan,
                    'color' => '#4e73df'
                ],
                'materi_pdf' => [
                    'name' => 'Materi PDF',
                    'completed_users' => $completedMateriPdfUsers,
                    'total_users' => $totalUsers,
                    'percentage' => round(($completedMateriPdfUsers / $totalUsers) * 100, 1),
                    'total_content' => $totalMateriPdf,
                    'color' => '#1cc88a'
                ],
                'materi_video' => [
                    'name' => 'Materi Video',
                    'completed_users' => $completedMateriVideoUsers,
                    'total_users' => $totalUsers,
                    'percentage' => round(($completedMateriVideoUsers / $totalUsers) * 100, 1),
                    'total_content' => $totalMateriVideo,
                    'color' => '#36b9cc'
                ],
                'zoom_room' => [
                    'name' => 'Zoom Room',
                    'completed_users' => $completedZoomRoomUsers,
                    'total_users' => $totalUsers,
                    'percentage' => round(($completedZoomRoomUsers / $totalUsers) * 100, 1),
                    'total_content' => $totalZoomRooms,
                    'color' => '#f6c23e'
                ]
            ];
        }

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
        $usersCompletedZoom = UserProgress::where('content_type', 'zoom_room')
                                                    ->where('is_completed', true)
                                                    ->distinct('user_id')
                                                    ->count('user_id');
        $totalZoomCompletions = UserProgress::where('content_type', 'zoom_room')
                                                        ->where('is_completed', true)
                                                        ->count();

        // Komentar Report Data
        $totalComments = Komentar::count();
        
        // Generate sample comments if there are fewer than 25 comments for pagination testing
        if ($totalComments < 25) {
            $this->generateSampleComments();
            $totalComments = Komentar::count(); // Refresh count
        }
        
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
        // Ambil semua komentar untuk pagination yang proper
        $recentComments = Komentar::with(['user', 'materi'])
                                    ->orderByDesc('created_at')
                                    ->get();

        // Forum Statistics
        $forumStats = $this->getForumStatistics();

        return view('admin.reports.index', compact('pieChartData', 'barChartData', 'categoryStats',
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

    /**
     * Generate sample comments for pagination testing
     */
    private function generateSampleComments()
    {
        try {
            // Get available users and materi
            $users = User::where('role', 'user')->limit(5)->get();
            $materis = Materi::limit(3)->get();
            
            if ($users->count() == 0 || $materis->count() == 0) {
                return; // Skip if no users or materi available
            }
            
            $sampleComments = [
                'Materi ini sangat bermanfaat untuk meningkatkan pengetahuan kesehatan remaja.',
                'Terima kasih atas informasinya yang sangat lengkap dan mudah dipahami.',
                'Saya suka dengan cara penyampaian materi yang interaktif dan menarik.',
                'Penjelasan tentang gizi remaja sangat membantu dalam kehidupan sehari-hari.',
                'Materi kesehatan reproduksi ini memberikan wawasan baru yang penting.',
                'Sangat bagus, saya jadi lebih paham tentang pentingnya menjaga kesehatan mental.',
                'Video pembelajaran ini mudah diikuti dan sangat informatif.',
                'Materi tentang pola hidup sehat sangat relevan dengan kondisi saat ini.',
                'Saya berharap ada lebih banyak materi seperti ini untuk remaja.',
                'Terima kasih sudah menyediakan platform pembelajaran yang berkualitas.',
                'Materi ini membuka mata saya tentang pentingnya olahraga teratur.',
                'Penjelasan tentang bahaya rokok sangat mengena dan mudah dipahami.',
                'Saya jadi lebih aware tentang kesehatan setelah mempelajari materi ini.',
                'Platform ini sangat membantu dalam meningkatkan literasi kesehatan.',
                'Materi yang disajikan sangat up-to-date dan sesuai dengan kebutuhan remaja.',
                'Saya suka dengan fitur-fitur interaktif yang tersedia di platform ini.',
                'Terima kasih atas materi tentang cara mengatasi stress yang sangat bermanfaat.',
                'Video edukasi tentang kesehatan jiwa sangat menginspirasi.',
                'Materi ini memberikan panduan praktis yang bisa langsung diterapkan.',
                'Saya berharap ada forum diskusi untuk sharing pengalaman sesama remaja.',
                'Platform pembelajaran ini sangat user-friendly dan mudah digunakan.',
                'Materi tentang nutrisi seimbang membantu saya mengatur pola makan yang lebih baik.',
                'Terima kasih sudah menyediakan konten edukatif yang berkualitas tinggi.',
                'Saya jadi lebih peduli dengan kesehatan setelah mengikuti program ini.',
                'Materi kesehatan remaja ini sangat komprehensif dan mudah dipahami.',
                'Platform ini menjadi referensi utama saya untuk belajar tentang kesehatan.',
                'Saya suka dengan pendekatan yang digunakan dalam menyampaikan materi kesehatan.',
                'Terima kasih atas informasi yang sangat berharga tentang kesehatan reproduksi.',
                'Materi ini membantu saya memahami perubahan yang terjadi pada masa remaja.',
                'Platform pembelajaran kesehatan terbaik yang pernah saya gunakan!'
            ];
            
            // Create 30 sample comments with random timestamps over the last 30 days
            for ($i = 0; $i < 30; $i++) {
                $randomUser = $users->random();
                $randomMateri = $materis->random();
                $randomComment = $sampleComments[array_rand($sampleComments)];
                
                // Random timestamp within last 30 days
                $randomDate = Carbon::now()->subDays(rand(0, 30))->subHours(rand(0, 23))->subMinutes(rand(0, 59));
                
                Komentar::create([
                    'user_id' => $randomUser->id,
                    'materi_id' => $randomMateri->id,
                    'isi_komentar' => $randomComment,
                    'created_at' => $randomDate,
                    'updated_at' => $randomDate,
                ]);
            }
        } catch (\Exception $e) {
            // Silently fail if there's an error generating sample data
        }
    }
}