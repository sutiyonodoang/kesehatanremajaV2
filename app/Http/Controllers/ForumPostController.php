<?php

namespace App\Http\Controllers;

use App\Models\Forum;
use App\Models\ForumThread;
use App\Models\ForumPost;
use App\Http\Requests\StoreForumPostRequest;
use Illuminate\Http\Request;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\Auth;

class ForumPostController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function store(StoreForumPostRequest $request, Forum $forum, ForumThread $thread): RedirectResponse
    {
        $post = $thread->posts()->create([
            'user_id' => Auth::id(),
            'content' => $request->input('content')
        ]);

        // Update thread last activity
        $thread->update(['last_activity' => now()]);

        return redirect()->route('forum.threads.show', [$forum, $thread])
            ->with('success', 'Balasan berhasil ditambahkan!');
    }

    public function edit(Forum $forum, ForumThread $thread, ForumPost $post)
    {
        $this->authorize('update', $post);
        
        return response()->json([
            'content' => $post->content
        ]);
    }

    public function update(StoreForumPostRequest $request, Forum $forum, ForumThread $thread, ForumPost $post): RedirectResponse
    {
        $this->authorize('update', $post);
        
        $post->update([
            'content' => $request->input('content')
        ]);

        return redirect()->route('forum.threads.show', [$forum, $thread])
            ->with('success', 'Post berhasil diupdate!');
    }

    public function destroy(Forum $forum, ForumThread $thread, ForumPost $post): RedirectResponse
    {
        $this->authorize('delete', $post);
        
        $post->delete();

        return redirect()->route('forum.threads.show', [$forum, $thread])
            ->with('success', 'Post berhasil dihapus!');
    }
}
