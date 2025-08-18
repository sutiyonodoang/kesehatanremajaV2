<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Spatie\Activitylog\Models\Activity;

class ActivityLogController extends Controller
{
    public function index()
    {
        $activityLogs = Activity::latest()->paginate(20); // Fetch latest 20 activity logs per page

        return view('admin.activity_logs.index', compact('activityLogs'));
    }
}
