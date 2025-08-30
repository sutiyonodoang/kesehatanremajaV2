<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\Materi;
use App\Models\DownloadLog;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Auth;
use App\Models\UserProgress;

class MateriController extends Controller
{
    public function index(Request $request)
    {
        $user = Auth::user();
        $query = Materi::withCount(['komentar', 'likes']);

        // filter kategori
        if ($request->filled('kategori')) {
            $query->where('kategori', $request->kategori);
        }

        // daftar materi terbaru
        $materis = $query->orderByDesc('created_at')->paginate(50);

        // dropdown
        $kategoriList = Materi::select('kategori')->distinct()->pluck('kategori');

        // Get completed materi IDs for the current user for all relevant types
        $completedMateriIds = UserProgress::where('user_id', $user->id)
                                        ->whereIn('content_type', ['materi_pdf', 'materi_pdf_scroll', 'materi_video'])
                                        ->where('is_completed', true)
                                        ->pluck('content_id')
                                        ->toArray();

        return view('user.materi.index', compact('materis', 'kategoriList', 'completedMateriIds'));
    }


    public function show(Materi $materi)
    {
        $user = Auth::user();
        $materi->load('komentar.user')->loadCount(['komentar', 'likes', 'downloads']);

        $isPdfDownloaded = UserProgress::where('user_id', $user->id)
                                        ->where('content_type', 'materi_pdf')
                                        ->where('content_id', $materi->id)
                                        ->where('is_completed', true)
                                        ->exists();

        $isPdfScrolled = UserProgress::where('user_id', $user->id)
                                        ->where('content_type', 'materi_pdf_scroll')
                                        ->where('content_id', $materi->id)
                                        ->where('is_completed', true)
                                        ->exists();

        $isVideoWatched = UserProgress::where('user_id', $user->id)
                                        ->where('content_type', 'materi_video')
                                        ->where('content_id', $materi->id)
                                        ->where('is_completed', true)
                                        ->exists();

        return view('user.materi.show', compact('materi', 'isPdfDownloaded', 'isPdfScrolled', 'isVideoWatched'));
    }

    public function downloadFile(Materi $materi)
    {
        if (!Storage::disk('public')->exists($materi->file_path)) {
            abort(404, 'File not found.');
        }

        // Log the download
        DownloadLog::create([
            'user_id' => Auth::id(),
            'materi_id' => $materi->id,
        ]);

        // Track progress for PDF download
        UserProgress::updateOrCreate(
            [
                'user_id' => Auth::id(),
                'content_type' => 'materi_pdf',
                'content_id' => $materi->id,
            ],
            [
                'is_completed' => true,
            ]
        );

        return response()->download(storage_path('app/public/' . $materi->file_path));
    }

    public function streamFile(Materi $materi)
    {
        if (!Storage::disk('public')->exists($materi->file_path)) {
            abort(404, 'File not found.');
        }

        return response()->file(storage_path('app/public/' . $materi->file_path));
    }
}