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

        // Get total counts for each content type
        $totalInformasiKesehatan = InformasiKesehatan::count();
        $totalMateriPdf = Materi::where('jenis', 'pdf')->count();
        $totalMateriVideo = Materi::where('jenis', 'video')->count();
        $totalZoomRooms = ZoomRoom::count();

        // Get completed counts for each content type
        $completedInformasiKesehatan = UserProgress::where('user_id', $user->id)
                                                    ->where('content_type', 'informasi_kesehatan')
                                                    ->where('is_completed', true)
                                                    ->count();
        $completedMateriPdf = UserProgress::where('user_id', $user->id)
                                        ->where('content_type', 'materi_pdf')
                                        ->where('is_completed', true)
                                        ->count();
        $completedMateriVideo = UserProgress::where('user_id', $user->id)
                                            ->where('content_type', 'materi_video')
                                            ->where('is_completed', true)
                                            ->count();
        $completedZoomRooms = UserProgress::where('user_id', $user->id)
                                        ->where('content_type', 'zoom_room')
                                        ->where('is_completed', true)
                                        ->count();

        // Calculate percentage for each content type
        $percentInformasiKesehatan = $totalInformasiKesehatan > 0 ? ($completedInformasiKesehatan / $totalInformasiKesehatan) * 100 : 0;
        $percentMateriPdf = $totalMateriPdf > 0 ? ($completedMateriPdf / $totalMateriPdf) * 100 : 0;
        $percentMateriVideo = $totalMateriVideo > 0 ? ($completedMateriVideo / $totalMateriVideo) * 100 : 0;
        $percentZoomRooms = $totalZoomRooms > 0 ? ($completedZoomRooms / $totalZoomRooms) * 100 : 0;

        // Calculate overall average percentage
        $totalContentTypes = 0;
        $sumPercentages = 0;

        if ($totalInformasiKesehatan > 0) { $totalContentTypes++; $sumPercentages += $percentInformasiKesehatan; }
        if ($totalMateriPdf > 0) { $totalContentTypes++; $sumPercentages += $percentMateriPdf; }
        if ($totalMateriVideo > 0) { $totalContentTypes++; $sumPercentages += $percentMateriVideo; }
        if ($totalZoomRooms > 0) { $totalContentTypes++; $sumPercentages += $percentZoomRooms; }

        $overallProgress = $totalContentTypes > 0 ? round($sumPercentages / $totalContentTypes, 2) : 0;


        $materis = Materi::latest()->limit(500)->get();
        $zoomRoom = ZoomRoom::where('jadwal', '>=', now())->orderBy('jadwal')->limit(5)->get();
        $infos = InformasiKesehatan::latest()->limit(1000)->get();

        return view('user.dashboard', compact('materis', 'zoomRoom', 'infos', 'overallProgress'));
    }
}