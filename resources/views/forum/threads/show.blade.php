@extends('layouts.app')

@section('title', $thread->title)

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <!-- Breadcrumb -->
            <nav aria-label="breadcrumb" class="mb-4">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{ route('forum.index') }}">Forum</a></li>
                    <li class="breadcrumb-item"><a href="{{ route('forum.show', $forum) }}">{{ $forum->name }}</a></li>
                    <li class="breadcrumb-item active">{{ $thread->title }}</li>
                </ol>
            </nav>

            @if(session('success'))
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    {{ session('success') }}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            @endif

            <!-- Thread Content -->
            <div class="card mb-4">
                <div class="card-header d-flex justify-content-between align-items-start">
                    <div>
                        <h4 class="mb-1">{{ $thread->title }}</h4>
                        <small class="text-muted">
                            <i class="bi bi-eye"></i> {{ $thread->views_count }} views
                            • <i class="bi bi-chat"></i> {{ $posts->total() }} balasan
                        </small>
                    </div>
                    @can('update', $thread)
                        <div class="dropdown">
                            <button class="btn btn-sm btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown">
                                <i class="bi bi-three-dots"></i>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="{{ route('forum.threads.edit', [$forum, $thread]) }}">Edit</a></li>
                                <li>
                                    <form action="{{ route('forum.threads.destroy', [$forum, $thread]) }}" method="POST" onsubmit="return confirm('Yakin ingin menghapus thread ini?')">
                                        @csrf
                                        @method('DELETE')
                                        <button type="submit" class="dropdown-item text-danger">Hapus</button>
                                    </form>
                                </li>
                            </ul>
                        </div>
                    @endcan
                </div>
                <div class="card-body">
                    <div class="d-flex">
                        <div class="me-3">
                            <div class="bg-primary text-white rounded-circle d-flex align-items-center justify-content-center" style="width: 40px; height: 40px;">
                                {{ strtoupper(substr($thread->user->name, 0, 1)) }}
                            </div>
                        </div>
                        <div class="flex-grow-1">
                            <h6 class="mb-1">{{ $thread->user->name }}</h6>
                            <small class="text-muted">{{ $thread->created_at->format('d M Y, H:i') }}</small>
                            <div class="mt-3">
                                {!! nl2br(e($thread->content)) !!}
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Posts -->
            @if($posts->count() > 0)
                @foreach($posts as $post)
                    <div class="card mb-3">
                        <div class="card-body">
                            <div class="d-flex">
                                <div class="me-3">
                                    <div class="bg-secondary text-white rounded-circle d-flex align-items-center justify-content-center" style="width: 40px; height: 40px;">
                                        {{ strtoupper(substr($post->user->name, 0, 1)) }}
                                    </div>
                                </div>
                                <div class="flex-grow-1">
                                    <div class="d-flex justify-content-between align-items-start">
                                        <div>
                                            <h6 class="mb-1">{{ $post->user->name }}</h6>
                                            <small class="text-muted">{{ $post->created_at->format('d M Y, H:i') }}</small>
                                        </div>
                                        @can('update', $post)
                                            <div class="dropdown">
                                                <button class="btn btn-sm btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown">
                                                    <i class="bi bi-three-dots"></i>
                                                </button>
                                                <ul class="dropdown-menu">
                                                    <li><a class="dropdown-item" href="#" onclick="editPost({{ $post->id }})">Edit</a></li>
                                                    <li>
                                                        <form action="{{ route('forum.posts.destroy', [$forum, $thread, $post]) }}" method="POST" onsubmit="return confirm('Yakin ingin menghapus post ini?')">
                                                            @csrf
                                                            @method('DELETE')
                                                            <button type="submit" class="dropdown-item text-danger">Hapus</button>
                                                        </form>
                                                    </li>
                                                </ul>
                                            </div>
                                        @endcan
                                    </div>
                                    <div class="mt-3" id="post-content-{{ $post->id }}">
                                        {!! nl2br(e($post->content)) !!}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                @endforeach

                <!-- Pagination -->
                <div class="d-flex justify-content-center mb-4">
                    {{ $posts->links() }}
                </div>
            @endif

            <!-- Reply Form -->
            @if(!$thread->is_locked)
                <div class="card">
                    <div class="card-header">
                        <h5 class="mb-0">Tulis Balasan</h5>
                    </div>
                    <div class="card-body">
                        <form action="{{ route('forum.posts.store', [$forum, $thread]) }}" method="POST">
                            @csrf
                            <div class="mb-3">
                                <textarea class="form-control @error('content') is-invalid @enderror" 
                                          name="content" 
                                          rows="4" 
                                          required
                                          placeholder="Tulis balasan Anda di sini...">{{ old('content') }}</textarea>
                                @error('content')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                                <div class="form-text">Minimal 10 karakter</div>
                            </div>
                            <button type="submit" class="btn btn-primary">
                                <i class="bi bi-send"></i> Kirim Balasan
                            </button>
                        </form>
                    </div>
                </div>
            @else
                <div class="alert alert-warning">
                    <i class="bi bi-lock"></i> Thread ini telah dikunci. Anda tidak dapat membalas.
                </div>
            @endif
        </div>
    </div>
</div>

<script>
function editPost(postId) {
    // Simple inline editing - you can enhance this with AJAX
    alert('Fitur edit post akan segera tersedia');
}
</script>
@endsection
