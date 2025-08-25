<?php

namespace App\Http\Controllers;

use App\Models\Forum;
use App\Models\ForumThread;
use Illuminate\Http\Request;
use Illuminate\Http\RedirectResponse;
use Illuminate\View\View;

class ForumController extends Controller
{
    public function index(): View
    {
        $forums = Forum::where('is_active', true)
            ->orderBy('sort_order')
            ->orderBy('name')
            ->withCount('threads')
            ->with(['latestThreads' => function($query) {
                $query->with('user')->take(3);
            }])
            ->get();

        return view('forum.index', compact('forums'));
    }

    public function show(Forum $forum): View
    {
        $threads = $forum->threads()
            ->with(['user', 'latestPost' => function($query) {
                $query->with('user');
            }])
            ->withCount('posts')
            ->orderBy('is_pinned', 'desc')
            ->orderBy('last_activity', 'desc')
            ->paginate(15);

        return view('forum.show', compact('forum', 'threads'));
    }

    public function search(Request $request)
    {
        $query = $request->get('q');
        
        if (empty($query)) {
            return redirect()->route('forum.index');
        }

        $threads = ForumThread::where('title', 'LIKE', "%{$query}%")
            ->orWhere('content', 'LIKE', "%{$query}%")
            ->with(['user', 'forum', 'latestPost' => function($q) {
                $q->with('user');
            }])
            ->withCount('posts')
            ->orderBy('last_activity', 'desc')
            ->paginate(15);

        return view('forum.search', compact('threads', 'query'));
    }
}
