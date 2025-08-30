<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\Materi;
use App\Models\ZoomRoom;
use App\Models\InformasiKesehatan;
use App\Models\UserProgress;
use Illuminate\Support\Facades\Auth;

use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function index()
    {
        $user = Auth::user();
        
        // Progress per kategori
        $categoryProgress = $this->getCategoryProgress($user->id);
        
        // Statistik umum
        $totalMateri = Materi::count();
        $totalInformasi = InformasiKesehatan::count();
        $totalZoom = ZoomRoom::count();
        
        $completedMateri = UserProgress::where('user_id', $user->id)
            ->whereIn('content_type', ['materi_pdf', 'materi_video'])
            ->where('is_completed', true)
            ->count();
            
        $completedInformasi = UserProgress::where('user_id', $user->id)
            ->where('content_type', 'informasi_kesehatan')
            ->where('is_completed', true)
            ->count();
            
        $completedZoom = UserProgress::where('user_id', $user->id)
            ->where('content_type', 'zoom_room')
            ->where('is_completed', true)
            ->count();

        $totalProgress = $totalMateri + $totalInformasi + $totalZoom;
        $completedProgress = $completedMateri + $completedInformasi + $completedZoom;
        $progressPercentage = $totalProgress > 0 ? round(($completedProgress / $totalProgress) * 100, 1) : 0;

        // Data tambahan untuk kompatibilitas
        $materis = Materi::latest()->limit(500)->get();
        $zoomRoom = ZoomRoom::where('jadwal', '>=', now())->orderBy('jadwal')->limit(5)->get();
        $infos = InformasiKesehatan::latest()->limit(1000)->get();

        return view('user.dashboard', compact(
            'categoryProgress',
            'totalMateri',
            'totalInformasi', 
            'totalZoom',
            'completedMateri',
            'completedInformasi',
            'completedZoom',
            'progressPercentage',
            'materis', 
            'zoomRoom', 
            'infos'
        ));
    }

    private function getCategoryProgress($userId)
    {
        // Progress per kategori materi
        $materiCategories = Materi::select('kategori')
            ->distinct()
            ->get()
            ->map(function($category) use ($userId) {
                $total = Materi::where('kategori', $category->kategori)->count();
                $completed = UserProgress::where('user_id', $userId)
                    ->whereIn('content_type', ['materi_pdf', 'materi_video'])
                    ->where('is_completed', true)
                    ->join('materis', 'user_progress.content_id', '=', 'materis.id')
                    ->where('materis.kategori', $category->kategori)
                    ->count();
                
                return [
                    'name' => $category->kategori,
                    'total' => $total,
                    'completed' => $completed,
                    'percentage' => $total > 0 ? round(($completed / $total) * 100, 1) : 0,
                    'color' => $this->getCategoryColor($category->kategori)
                ];
            });

        // Tambahkan kategori lainnya
        $informasiProgress = [
            'name' => 'Informasi Kesehatan',
            'total' => InformasiKesehatan::count(),
            'completed' => UserProgress::where('user_id', $userId)
                ->where('content_type', 'informasi_kesehatan')
                ->where('is_completed', true)
                ->count(),
            'color' => '#17a2b8' // Cyan (variasi biru)
        ];
        $informasiProgress['percentage'] = $informasiProgress['total'] > 0 ? 
            round(($informasiProgress['completed'] / $informasiProgress['total']) * 100, 1) : 0;

        $zoomProgress = [
            'name' => 'Zoom Meeting',
            'total' => ZoomRoom::count(),
            'completed' => UserProgress::where('user_id', $userId)
                ->where('content_type', 'zoom_room')
                ->where('is_completed', true)
                ->count(),
            'color' => '#fd7e14' // Orange (variasi kuning)
        ];
        $zoomProgress['percentage'] = $zoomProgress['total'] > 0 ? 
            round(($zoomProgress['completed'] / $zoomProgress['total']) * 100, 1) : 0;

        $allCategories = $materiCategories->push($informasiProgress)->push($zoomProgress);
        
        return $allCategories->filter(function($category) {
            return $category['total'] > 0;
        })->values();
    }

    private function getCategoryColor($category)
    {
        // Warna untuk kategori level 1: Biru, Hijau, Kuning
        $level1Colors = [
            'Kesehatan Reproduksi' => '#007bff', // Biru
            'Kesehatan Mental' => '#28a745',     // Hijau
            'Gizi dan Nutrisi' => '#ffc107',     // Kuning
        ];

        // Jika kategori adalah level 1, gunakan warna yang diminta
        if (isset($level1Colors[$category])) {
            return $level1Colors[$category];
        }

        // Warna untuk kategori lainnya
        $otherColors = [
            'Olahraga' => '#6f42c1',
            'Pencegahan Penyakit' => '#20c997',
            'default' => '#6c757d'
        ];

        return $otherColors[$category] ?? $otherColors['default'];
    }
}