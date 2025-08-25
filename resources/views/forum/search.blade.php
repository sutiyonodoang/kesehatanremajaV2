@extends('layouts.app')

@section('title', 'Pencarian Forum - ' . $query)

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <!-- Search Form -->
            <div class="card mb-4">
                <div class="card-body">
                    <form action="{{ route('forum.search') }}" method="GET" class="d-flex">
                        <input type="text" class="form-control me-2" name="q" value="{{ $query }}" placeholder="Cari thread atau topik...">
                        <button type="submit" class="btn btn-primary">
                            <i class="bi bi-search"></i> Cari
                        </button>
                    </form>
                </div>
            </div>

            <!-- Search Results -->
            <div class="card">
                <div class="card-header">
                    <h4 class="mb-0">
                        Hasil Pencarian untuk: "{{ $query }}"
                        <small class="text-muted">({{ $threads->total() }} thread ditemukan)</small>
                    </h4>
                </div>
                <div class="card-body">
                    @if($threads->count() > 0)
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead class="table-light">
                                    <tr>
                                        <th>Thread</th>
                                        <th width="150">Forum</th>
                                        <th width="100" class="text-center">Balasan</th>
                                        <th width="200">Aktivitas Terakhir</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($threads as $thread)
                                        <tr>
                                            <td>
                                                <div class="d-flex align-items-start">
                                                    @if($thread->is_pinned)
                                                        <span class="badge bg-warning me-2">📌</span>
                                                    @endif
                                                    @if($thread->is_locked)
                                                        <span class="badge bg-secondary me-2">🔒</span>
                                                    @endif
                                                    <div>
                                                        <h6 class="mb-1">
                                                            <a href="{{ route('forum.threads.show', [$thread->forum, $thread]) }}" class="text-decoration-none">
                                                                {{ $thread->title }}
                                                            </a>
                                                        </h6>
                                                        <small class="text-muted">
                                                            oleh <strong>{{ $thread->user->name }}</strong> 
                                                            - {{ $thread->created_at->diffForHumans() }}
                                                        </small>
                                                        <div class="mt-1">
                                                            <small class="text-muted">
                                                                {{ Str::limit(strip_tags($thread->content), 100) }}
                                                            </small>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <a href="{{ route('forum.show', $thread->forum) }}" class="text-decoration-none">
                                                    {{ $thread->forum->name }}
                                                </a>
                                            </td>
                                            <td class="text-center">
                                                <span class="badge bg-light text-dark">{{ $thread->posts_count }}</span>
                                            </td>
                                            <td>
                                                @if($thread->latestPost)
                                                    <small>
                                                        oleh <strong>{{ $thread->latestPost->user->name }}</strong><br>
                                                        {{ $thread->latestPost->created_at->diffForHumans() }}
                                                    </small>
                                                @else
                                                    <small class="text-muted">Belum ada balasan</small>
                                                @endif
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>

                        <!-- Pagination -->
                        <div class="d-flex justify-content-center">
                            {{ $threads->appends(['q' => $query])->links() }}
                        </div>
                    @else
                        <div class="text-center py-5">
                            <h5 class="text-muted">Tidak ada thread yang ditemukan</h5>
                            <p class="text-muted">Coba gunakan kata kunci yang berbeda atau lebih umum.</p>
                            <a href="{{ route('forum.index') }}" class="btn btn-primary">
                                <i class="bi bi-arrow-left"></i> Kembali ke Forum
                            </a>
                        </div>
                    @endif
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
