<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\InformasiKesehatan;
use App\Models\UserProgress;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;

class InformasiKesehatanController extends Controller
{
    public function index()
    {
        $user = Auth::user();
        $infos = InformasiKesehatan::orderByDesc('created_at')->paginate(10);

        // Get completed info IDs for the current user
        $completedInfoIds = UserProgress::where('user_id', $user->id)
                                        ->where('content_type', 'informasi_kesehatan')
                                        ->where('is_completed', true)
                                        ->pluck('content_id')
                                        ->toArray();

        return view('user.informasi-kesehatan.index', compact('infos', 'completedInfoIds'));
    }

    public function show(InformasiKesehatan $informasiKesehatan)
    {
        return view('user.informasi-kesehatan.show', compact('informasiKesehatan'));
    }
}