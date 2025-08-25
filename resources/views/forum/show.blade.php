@extends('layouts.app')

@section('title', $forum->name)

@section('content')
<div class="mb-3">
    <a href="{{ route('forum.index') }}" class="btn btn-secondary">
        <i class="bi bi-arrow-left"></i> Kembali ke Forum
    </a>
</div>

<!-- Breadcrumb -->
<nav aria-label="breadcrumb" class="mb-3">
    <ol class="breadcrumb bg-light rounded-3 p-3">
        <li class="breadcrumb-item"><a href="{{ route('forum.index') }}" class="text-decoration-none">Forum</a></li>
        <li class="breadcrumb-item active">{{ $forum->name }}</li>
    </ol>
</nav>

<div class="card shadow rounded-4">
    <div class="card-header bg-primary text-white rounded-top-4 d-flex justify-content-between align-items-center">
        <div>
            <h5 class="fw-bold mb-1">{{ $forum->name }}</h5>
            @if($forum->description)
                <small class="opacity-75">{{ $forum->description }}</small>
            @endif
        </div>
        <a href="{{ route('forum.threads.create.specific', $forum) }}" class="btn btn-light btn-sm">
            <i class="bi bi-plus-circle"></i> Buat Thread Baru
        </a>
    </div>
    <div class="card-body">
        @if(session('success'))
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <i class="bi bi-check-circle"></i> {{ session('success') }}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        @endif

        @if($threads->count() > 0)
            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover align-middle">
                    <thead class="table-light text-center">
                        <tr>
                            <th scope="col">Thread</th>
                            <th scope="col" width="100">Balasan</th>
                            <th scope="col" width="100">Views</th>
                            <th scope="col" width="200">Aktivitas Terakhir</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($threads as $thread)
                            <tr>
                                <td>
                                    <div class="d-flex align-items-start">
                                        @if($thread->is_pinned)
                                            <span class="badge bg-warning me-2">📌 Pin</span>
                                        @endif
                                        @if($thread->is_locked)
                                            <span class="badge bg-secondary me-2">🔒 Lock</span>
                                        @endif
                                        <div>
                                            <h6 class="mb-1">
                                                <a href="{{ route('forum.threads.show', [$forum, $thread]) }}" class="text-decoration-none fw-bold">
                                                    {{ $thread->title }}
                                                </a>
                                            </h6>
                                            <small class="text-muted">
                                                <i class="bi bi-person"></i> {{ $thread->user->name }} • 
                                                <i class="bi bi-clock"></i> {{ $thread->created_at->diffForHumans() }}
                                            </small>
                                        </div>
                                    </div>
                                </td>
                                <td class="text-center">
                                    <span class="badge bg-info">{{ $thread->posts_count }}</span>
                                </td>
                                <td class="text-center">
                                    <span class="badge bg-secondary">{{ $thread->views_count }}</span>
                                </td>
                                <td>
                                    @if($thread->latestPost)
                                        <small>
                                            <i class="bi bi-person"></i> <strong>{{ $thread->latestPost->user->name }}</strong><br>
                                            <i class="bi bi-clock"></i> {{ $thread->latestPost->created_at->diffForHumans() }}
                                        </small>
                                    @else
                                        <small class="text-muted"><i class="bi bi-chat"></i> Belum ada balasan</small>
                                    @endif
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>

            <!-- Pagination -->
            @if($threads->hasPages())
                <div class="d-flex justify-content-center mt-4">
                    {{ $threads->links('pagination::bootstrap-5') }}
                </div>
            @endif
        </div>
        @else
            <div class="text-center py-5">
                <div class="empty-state">
                    <i class="bi bi-chat-dots text-muted" style="font-size: 4rem; opacity: 0.5;"></i>
                    <h5 class="text-muted mt-3">Belum ada thread di forum ini</h5>
                    <p class="text-muted">Jadilah yang pertama membuat diskusi!</p>
                    <a href="{{ route('forum.threads.create.specific', $forum) }}" class="btn btn-primary">
                        <i class="bi bi-plus-circle"></i> Buat Thread Pertama
                    </a>
                </div>
            </div>
        @endif
    </div>
</div>
@endsection
