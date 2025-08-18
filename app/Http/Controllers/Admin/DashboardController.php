<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Materi;
use App\Models\ZoomRoom;
use App\Models\InformasiKesehatan;
use App\Models\UserProgress;
use App\Models\Consultation;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
   public function index()
{
    $userCount = User::count();
    $materiCount = Materi::count(); 
    $zoomCount = ZoomRoom::count();
    $infoCount = InformasiKesehatan::count();
    $unfinishedConsultationsCount = Consultation::whereIn('status', ['menunggu', 'proses'])->count();

    return view('admin.dashboard', compact('userCount', 'materiCount', 'zoomCount', 'infoCount', 'unfinishedConsultationsCount'));
}

    public function reports()
    {
        $progressData = UserProgress::all();
        $totalProgress = $progressData->count();
        $completedProgress = $progressData->where('is_completed', true)->count();

        $pieChartData = [
            'Selesai' => $totalProgress > 0 ? ($completedProgress / $totalProgress) * 100 : 0,
            'Tidak Selesai' => $totalProgress > 0 ? (($totalProgress - $completedProgress) / $totalProgress) * 100 : 0,
        ];

        $users = User::with('progress')->get();
        $barChartData = [];
        foreach ($users as $user) {
            $total = $user->progress->count();
            $completed = $user->progress->where('is_completed', true)->count();
            $barChartData[$user->name] = $total > 0 ? ($completed / $total) * 100 : 0;
        }

        return view('admin.reports.index', compact('pieChartData', 'barChartData'));
    }

}