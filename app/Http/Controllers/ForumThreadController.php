<?php

namespace App\Http\Controllers;

use App\Models\Forum;
use App\Models\ForumThread;
use App\Http\Requests\StoreForumThreadRequest;
use Illuminate\Http\Request;
use Illuminate\Http\RedirectResponse;
use Illuminate\View\View;
use Illuminate\Support\Facades\Auth;

class ForumThreadController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth')->except(['show']);
    }

    public function createWithCategory(): View
    {
        $forums = Forum::orderBy('name')->get();
        return view('forum.threads.create-with-category', compact('forums'));
    }

    public function storeWithCategory(StoreForumThreadRequest $request): RedirectResponse
    {
        $forum = Forum::findOrFail($request->input('forum_id'));
        
        $thread = $forum->threads()->create([
            'user_id' => Auth::id(),
            'title' => $request->input('title'),
            'content' => $request->input('content'),
            'last_activity' => now()
        ]);

        return redirect()->route('forum.threads.show', [$forum, $thread])
            ->with('success', 'Thread berhasil dibuat!');
    }

    public function create(Forum $forum): View
    {
        return view('forum.threads.create', compact('forum'));
    }

    public function store(StoreForumThreadRequest $request, Forum $forum): RedirectResponse
    {
        $thread = $forum->threads()->create([
            'user_id' => Auth::id(),
            'title' => $request->input('title'),
            'content' => $request->input('content'),
            'last_activity' => now()
        ]);

        return redirect()->route('forum.threads.show', [$forum, $thread])
            ->with('success', 'Thread berhasil dibuat!');
    }

    public function show(Forum $forum, ForumThread $thread): View
    {
        $thread->incrementViews();
        
        $posts = $thread->posts()
            ->with('user')
            ->orderBy('created_at')
            ->paginate(10);

        return view('forum.threads.show', compact('forum', 'thread', 'posts'));
    }

    public function edit(Forum $forum, ForumThread $thread): View
    {
        $this->authorize('update', $thread);
        
        return view('forum.threads.edit', compact('forum', 'thread'));
    }

    public function update(StoreForumThreadRequest $request, Forum $forum, ForumThread $thread): RedirectResponse
    {
        $this->authorize('update', $thread);
        
        $thread->update([
            'title' => $request->input('title'),
            'content' => $request->input('content')
        ]);

        return redirect()->route('forum.threads.show', [$forum, $thread])
            ->with('success', 'Thread berhasil diupdate!');
    }

    public function destroy(Forum $forum, ForumThread $thread): RedirectResponse
    {
        $this->authorize('delete', $thread);
        
        $thread->delete();

        return redirect()->route('forum.show', $forum)
            ->with('success', 'Thread berhasil dihapus!');
    }
}
