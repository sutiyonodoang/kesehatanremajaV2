@extends('layouts.app')

@section('title', 'Forum Diskusi')

@section('content')
<div class="mb-3">
    <a href="{{ route('dashboard') }}" class="btn btn-secondary">
        <i class="bi bi-arrow-left"></i> Kembali
    </a>
</div>

<div class="card shadow rounded-4">
    <div class="card-header bg-primary text-white rounded-top-4">
        <h5 class="fw-bold mb-0">Forum Diskusi</h5>
    </div>
    <div class="card-body">
        <!-- Search Form -->
        <div class="row mb-4">
            <div class="col-md-8 mx-auto">
                <form action="{{ route('forum.search') }}" method="GET" class="d-flex">
                    <input type="text" class="form-control me-2" name="q" placeholder="Cari thread atau topik..." style="border-radius: 8px;">
                    <button type="submit" class="btn btn-primary">
                        <i class="bi bi-search"></i> Cari
                    </button>
                </form>
            </div>
        </div>

        @if($forums->count() > 0)
            <!-- Unified Forum Container -->
            <div class="card shadow-sm border-0 rounded-3 hover-card mb-4">
                <div class="card-body p-4">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <div class="d-flex align-items-center">
                            <div class="forum-icon me-3">
                                <i class="bi bi-chat-dots-fill text-primary fs-2"></i>
                            </div>
                            <div>
                                <h5 class="card-title mb-1 fw-bold">Forum Diskusi Kesehatan Remaja</h5>
                                <p class="card-text text-muted mb-0">Tempat berbagi informasi dan diskusi seputar kesehatan remaja</p>
                            </div>
                        </div>
                        <div class="text-end">
                            <a href="{{ route('forum.threads.create') }}" class="btn btn-success">
                                <i class="bi bi-plus-circle"></i> Buat Thread Baru
                            </a>
                        </div>
                    </div>

                    <!-- Combined Statistics -->
                    <div class="row text-center mb-4">
                        <div class="col-md-3 col-6 mb-3">
                            <div class="stats-box bg-light rounded-3 p-3" style="border: 1px solid #dee2e6;">
                                <strong class="text-primary fs-4">{{ $forums->count() }}</strong>
                                <small class="d-block text-muted">Kategori</small>
                            </div>
                        </div>
                        <div class="col-md-3 col-6 mb-3">
                            <div class="stats-box bg-light rounded-3 p-3" style="border: 1px solid #dee2e6;">
                                <strong class="text-info fs-4">{{ $forums->sum('threads_count') }}</strong>
                                <small class="d-block text-muted">Total Thread</small>
                            </div>
                        </div>
                        <div class="col-md-3 col-6 mb-3">
                            <div class="stats-box bg-light rounded-3 p-3" style="border: 1px solid #dee2e6;">
                                <strong class="text-success fs-4">{{ $forums->sum(function($forum) { return $forum->threads->sum(function($thread) { return $thread->posts_count ?? 0; }); }) }}</strong>
                                <small class="d-block text-muted">Total Post</small>
                            </div>
                        </div>
                        <div class="col-md-3 col-6 mb-3">
                            <div class="stats-box bg-light rounded-3 p-3" style="border: 1px solid #dee2e6;">
                                <strong class="text-warning fs-4">{{ $forums->flatMap->latestThreads->count() }}</strong>
                                <small class="d-block text-muted">Thread Aktif</small>
                            </div>
                        </div>
                    </div>

                    <!-- Categories Section -->
                    <div class="row mb-4">
                        <div class="col-md-6">
                            <div class="category-section bg-light rounded-3 p-3" style="border: 1px solid #dee2e6;">
                                <h6 class="text-primary mb-3">
                                    <i class="bi bi-folder"></i> Kategori Forum
                                </h6>
                                @foreach($forums as $forum)
                                    <div class="category-item d-flex justify-content-between align-items-center mb-2 p-2 rounded hover-item">
                                        <div>
                                            <strong class="text-dark">{{ $forum->name }}</strong>
                                            <small class="d-block text-muted">{{ Str::limit($forum->description, 50) }}</small>
                                        </div>
                                        <div class="text-end">
                                            <span class="badge bg-primary">{{ $forum->threads_count }}</span>
                                            <a href="{{ route('forum.show', $forum) }}" class="btn btn-sm btn-outline-primary ms-1">
                                                <i class="bi bi-arrow-right"></i>
                                            </a>
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                        
                        <div class="col-md-6">
                            <div class="latest-activity bg-light rounded-3 p-3" style="border: 1px solid #dee2e6;">
                                <h6 class="text-success mb-3">
                                    <i class="bi bi-clock"></i> Aktivitas Terbaru
                                </h6>
                                @php
                                    $latestThreads = $forums->flatMap->latestThreads->sortByDesc('created_at')->take(6);
                                @endphp
                                
                                @if($latestThreads->count() > 0)
                                    @foreach($latestThreads as $thread)
                                        <div class="activity-item mb-3 p-2 rounded hover-item">
                                            <div class="d-flex justify-content-between align-items-start">
                                                <div class="flex-grow-1">
                                                    <a href="{{ route('forum.threads.show', [$thread->forum, $thread]) }}" class="text-decoration-none fw-semibold text-dark">
                                                        {{ Str::limit($thread->title, 45) }}
                                                    </a>
                                                    <div class="small text-muted mt-1">
                                                        <span class="badge bg-secondary me-1">{{ $thread->forum->name }}</span>
                                                        <i class="bi bi-person"></i> {{ $thread->user->name }}
                                                        <i class="bi bi-clock ms-2"></i> {{ $thread->created_at->diffForHumans() }}
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    @endforeach
                                @else
                                    <div class="text-center py-3">
                                        <small class="text-muted">Belum ada aktivitas</small>
                                    </div>
                                @endif
                            </div>
                        </div>
                    </div>

                    <!-- Quick Actions -->
                    <div class="text-center pt-3 border-top">
                        <div class="d-flex justify-content-center gap-3 flex-wrap">
                            <a href="{{ route('forum.threads.create') }}" class="btn btn-primary">
                                <i class="bi bi-plus-circle"></i> Mulai Diskusi Baru
                            </a>
                            <a href="{{ route('forum.search') }}" class="btn btn-outline-secondary">
                                <i class="bi bi-search"></i> Cari Thread
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        @else
            <div class="text-center py-5">
                <div class="empty-state">
                    <i class="bi bi-chat-dots text-muted" style="font-size: 4rem;"></i>
                    <h5 class="text-muted mt-3">Belum ada forum tersedia</h5>
                    <p class="text-muted">Silahkan hubungi admin untuk membuat forum baru.</p>
                </div>
            </div>
        @endif
    </div>
</div>

<style>
.hover-card {
    transition: transform 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
}

.hover-card:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 25px rgba(0,0,0,0.15) !important;
}

.stats-box {
    transition: all 0.2s ease-in-out;
}

.stats-box:hover {
    background-color: #e3f2fd !important;
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(0,123,255,0.15);
}

.category-section, .latest-activity {
    border-left: 4px solid #007bff;
}

.hover-item {
    transition: all 0.2s ease-in-out;
}

.hover-item:hover {
    background-color: #ffffff !important;
    transform: translateX(5px);
    box-shadow: 0 2px 8px rgba(0,0,0,0.1);
}

.activity-item {
    border-left: 3px solid transparent;
    transition: all 0.2s ease-in-out;
}

.activity-item:hover {
    border-left-color: #28a745;
}

.empty-state i {
    opacity: 0.5;
}

.category-item .btn {
    opacity: 0;
    transition: opacity 0.2s ease-in-out;
}

.category-item:hover .btn {
    opacity: 1;
}
</style>
@endsection
