<?php

namespace App\Http\Controllers;

use App\Models\Forum;
use App\Models\ForumThread;
use App\Models\ForumPost;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\View\View;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

/**
 * Class ForumReportController
 * 
 * Controller untuk generate laporan dan analisis forum
 */
class ForumReportController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('roleadmin'); // Menggunakan middleware yang sudah ada
    }

    /**
     * Dashboard laporan forum
     */
    public function index(): View
    {
        // Statistik Umum
        $totalForums = Forum::count();
        $totalThreads = ForumThread::count();
        $totalPosts = ForumPost::count();
        $totalUsers = User::whereHas('forumThreads')->orWhereHas('forumPosts')->count();
        
        // User paling aktif (berdasarkan jumlah thread + post)
        $topUsers = User::select('users.*')
            ->withCount(['forumThreads', 'forumPosts'])
            ->having('forum_threads_count', '>', 0)
            ->orHaving('forum_posts_count', '>', 0)
            ->orderByRaw('(forum_threads_count + forum_posts_count) DESC')
            ->limit(10)
            ->get()
            ->map(function($user) {
                $user->total_activity = $user->forum_threads_count + $user->forum_posts_count;
                return $user;
            });

        // Thread paling populer (berdasarkan views dan replies)
        $popularThreads = ForumThread::select('forum_threads.*')
            ->withCount('posts')
            ->with(['forum', 'user'])
            ->orderByDesc('views_count')
            ->limit(10)
            ->get();

        // Aktivitas 30 hari terakhir
        $dailyActivity = $this->getDailyActivity(30);
        
        // Forum paling aktif
        $activeForums = Forum::withCount(['threads', 'threads as posts_count' => function($query) {
            $query->join('forum_posts', 'forum_threads.id', '=', 'forum_posts.thread_id')
                  ->select(DB::raw('count(forum_posts.id)'));
        }])->orderByDesc('threads_count')->get();

        return view('admin.forum-reports.index', compact(
            'totalForums', 'totalThreads', 'totalPosts', 'totalUsers',
            'topUsers', 'popularThreads', 'dailyActivity', 'activeForums'
        ));
    }

    /**
     * Laporan engagement user detail
     */
    public function userEngagement(): View
    {
        $users = User::select('users.*')
            ->withCount([
                'forumThreads',
                'forumPosts',
                'forumThreads as threads_this_month' => function($query) {
                    $query->where('created_at', '>=', Carbon::now()->startOfMonth());
                },
                'forumPosts as posts_this_month' => function($query) {
                    $query->where('created_at', '>=', Carbon::now()->startOfMonth());
                }
            ])
            ->having('forum_threads_count', '>', 0)
            ->orHaving('forum_posts_count', '>', 0)
            ->orderByRaw('(forum_threads_count + forum_posts_count) DESC')
            ->paginate(20);

        // Hitung engagement score untuk setiap user
        $users->getCollection()->transform(function($user) {
            $user->total_activity = $user->forum_threads_count + $user->forum_posts_count;
            $user->monthly_activity = $user->threads_this_month + $user->posts_this_month;
            
            // Engagement Score (0-100)
            // Berdasarkan: jumlah thread (weight 3), jumlah post (weight 1), aktivitas bulan ini (weight 2)
            $user->engagement_score = min(100, 
                ($user->forum_threads_count * 3) + 
                ($user->forum_posts_count * 1) + 
                ($user->monthly_activity * 2)
            );
            
            // Kategori engagement
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

        return view('admin.forum-reports.user-engagement', compact('users'));
    }

    /**
     * Laporan aktivitas harian
     */
    public function dailyActivity(Request $request): View
    {
        $days = $request->get('days', 30);
        $data = $this->getDailyActivity($days);
        
        return view('admin.forum-reports.daily-activity', compact('data', 'days'));
    }

    /**
     * Laporan konten populer
     */
    public function popularContent(): View
    {
        // Thread dengan views terbanyak
        $topViewedThreads = ForumThread::with(['forum', 'user'])
            ->withCount('posts')
            ->orderByDesc('views_count')
            ->limit(20)
            ->get();

        // Thread dengan balasan terbanyak
        $mostRepliedThreads = ForumThread::with(['forum', 'user'])
            ->withCount('posts')
            ->orderByDesc('posts_count')
            ->limit(20)
            ->get();

        // Forum paling aktif
        $activeForums = Forum::withCount(['threads'])
            ->withCount(['threads as total_posts' => function($query) {
                $query->join('forum_posts', 'forum_threads.id', '=', 'forum_posts.thread_id')
                      ->select(DB::raw('count(forum_posts.id)'));
            }])
            ->orderByDesc('threads_count')
            ->get();

        return view('admin.forum-reports.popular-content', compact(
            'topViewedThreads', 'mostRepliedThreads', 'activeForums'
        ));
    }

    /**
     * Export laporan ke CSV
     */
    public function export(Request $request)
    {
        $type = $request->get('type', 'overview');
        
        switch($type) {
            case 'user-engagement':
                return $this->exportUserEngagement();
            case 'daily-activity':
                return $this->exportDailyActivity();
            case 'popular-content':
                return $this->exportPopularContent();
            default:
                return $this->exportOverview();
        }
    }

    /**
     * Helper: Ambil data aktivitas harian
     */
    private function getDailyActivity($days = 30)
    {
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
            $data[] = [
                'date' => $date,
                'threads' => $threads->get($date)->count ?? 0,
                'posts' => $posts->get($date)->count ?? 0,
                'total' => ($threads->get($date)->count ?? 0) + ($posts->get($date)->count ?? 0)
            ];
        }

        return $data;
    }

    /**
     * Export overview data
     */
    private function exportOverview()
    {
        $filename = 'forum-overview-' . date('Y-m-d') . '.csv';
        
        $headers = [
            'Content-Type' => 'text/csv',
            'Content-Disposition' => 'attachment; filename="' . $filename . '"',
        ];

        $callback = function() {
            $file = fopen('php://output', 'w');
            
            // Header CSV
            fputcsv($file, [
                'Metrik', 'Jumlah', 'Keterangan'
            ]);
            
            // Data statistik
            fputcsv($file, ['Total Forum', Forum::count(), 'Jumlah kategori forum']);
            fputcsv($file, ['Total Thread', ForumThread::count(), 'Jumlah diskusi']);
            fputcsv($file, ['Total Post', ForumPost::count(), 'Jumlah balasan']);
            fputcsv($file, ['User Aktif', User::whereHas('forumThreads')->orWhereHas('forumPosts')->count(), 'User yang pernah posting']);
            
            fclose($file);
        };

        return response()->stream($callback, 200, $headers);
    }

    /**
     * Export user engagement data
     */
    private function exportUserEngagement()
    {
        $filename = 'user-engagement-' . date('Y-m-d') . '.csv';
        
        $headers = [
            'Content-Type' => 'text/csv',
            'Content-Disposition' => 'attachment; filename="' . $filename . '"',
        ];

        $callback = function() {
            $file = fopen('php://output', 'w');
            
            // Header CSV
            fputcsv($file, [
                'Nama User', 'Email', 'Total Thread', 'Total Post', 'Total Aktivitas', 
                'Thread Bulan Ini', 'Post Bulan Ini', 'Engagement Score', 'Level Engagement'
            ]);
            
            // Data users
            $users = User::withCount([
                'forumThreads',
                'forumPosts',
                'forumThreads as threads_this_month' => function($query) {
                    $query->where('created_at', '>=', Carbon::now()->startOfMonth());
                },
                'forumPosts as posts_this_month' => function($query) {
                    $query->where('created_at', '>=', Carbon::now()->startOfMonth());
                }
            ])
            ->having('forum_threads_count', '>', 0)
            ->orHaving('forum_posts_count', '>', 0)
            ->orderByRaw('(forum_threads_count + forum_posts_count) DESC')
            ->get();

            foreach($users as $user) {
                $totalActivity = $user->forum_threads_count + $user->forum_posts_count;
                $monthlyActivity = $user->threads_this_month + $user->posts_this_month;
                $engagementScore = min(100, 
                    ($user->forum_threads_count * 3) + 
                    ($user->forum_posts_count * 1) + 
                    ($monthlyActivity * 2)
                );
                
                $engagementLevel = $engagementScore >= 50 ? 'Sangat Aktif' : 
                                  ($engagementScore >= 25 ? 'Aktif' : 
                                  ($engagementScore >= 10 ? 'Cukup Aktif' : 'Kurang Aktif'));
                
                fputcsv($file, [
                    $user->name,
                    $user->email,
                    $user->forum_threads_count,
                    $user->forum_posts_count,
                    $totalActivity,
                    $user->threads_this_month,
                    $user->posts_this_month,
                    $engagementScore,
                    $engagementLevel
                ]);
            }
            
            fclose($file);
        };

        return response()->stream($callback, 200, $headers);
    }
}
