<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\ZoomRoom;
use App\Models\UserProgress;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;

class ZoomRoomController extends Controller
{
    public function index()
    {
        $user = Auth::user();
        // Tampilkan semua zoom rooms, diurutkan berdasarkan jadwal (yang akan datang dulu, lalu yang sudah lewat)
        $zoomRooms = ZoomRoom::orderByRaw('CASE WHEN jadwal >= NOW() THEN 0 ELSE 1 END, jadwal ASC')
                             ->paginate(50);

        // Get completed Zoom Room IDs for the current user
        $completedZoomRoomIds = UserProgress::where('user_id', $user->id)
                                            ->where('content_type', 'zoom_room')
                                            ->where('is_completed', true)
                                            ->pluck('content_id')
                                            ->toArray();

        $viewedZoomRoomIds = UserProgress::where('user_id', $user->id)
            ->where('content_type', 'zoom_detail_viewed')
            ->pluck('content_id')
            ->toArray();

        return view('user.zoom-rooms.index', compact('zoomRooms', 'completedZoomRoomIds', 'viewedZoomRoomIds'));
    }

    public function show(ZoomRoom $zoomRoom)
    {
        return view('user.zoom-rooms.show', compact('zoomRoom'));
    }

    public function getDetail(ZoomRoom $zoomRoom)
    {
        return view('user.zoom-rooms.show', compact('zoomRoom'))->render();
    }
}
