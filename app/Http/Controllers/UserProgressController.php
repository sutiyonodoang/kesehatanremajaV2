<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\UserProgress;
use Illuminate\Support\Facades\Auth;

class UserProgressController extends Controller
{
    public function track(Request $request)
    {
        $request->validate([
            'content_type' => 'required|string',
            'content_id' => 'required|integer',
        ]);

        $user = Auth::user();

        UserProgress::updateOrCreate(
            [
                'user_id' => $user->id,
                'content_type' => $request->content_type,
                'content_id' => $request->content_id,
            ],
            [
                'is_completed' => true,
            ]
        );

        return response()->json(['message' => 'Progress tracked successfully.']);
    }
}