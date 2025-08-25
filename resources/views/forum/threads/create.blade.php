@extends('layouts.app')

@section('title', 'Buat Thread Baru - ' . $forum->name)

@section('content')
<div class="mb-3">
    <a href="{{ route('forum.show', $forum) }}" class="btn btn-secondary">
        <i class="bi bi-arrow-left"></i> Kembali
    </a>
</div>

<!-- Breadcrumb -->
<nav aria-label="breadcrumb" class="mb-3">
    <ol class="breadcrumb bg-light rounded-3 p-3">
        <li class="breadcrumb-item"><a href="{{ route('forum.index') }}" class="text-decoration-none">Forum</a></li>
        <li class="breadcrumb-item"><a href="{{ route('forum.show', $forum) }}" class="text-decoration-none">{{ $forum->name }}</a></li>
        <li class="breadcrumb-item active">Buat Thread Baru</li>
    </ol>
</nav>

<div class="row">
    <div class="col-md-8 mx-auto">
        <div class="card shadow rounded-4">
            <div class="card-header bg-primary text-white rounded-top-4">
                <h5 class="fw-bold mb-0"><i class="bi bi-plus-circle"></i> Buat Thread Baru di {{ $forum->name }}</h5>
            </div>
            <div class="card-body">
                <form action="{{ route('forum.threads.store', $forum) }}" method="POST">
                    @csrf
                    
                    <div class="mb-4">
                        <label for="title" class="form-label fw-bold">Judul Thread *</label>
                        <input type="text" 
                               class="form-control @error('title') is-invalid @enderror" 
                               id="title" 
                               name="title" 
                               value="{{ old('title') }}" 
                               required
                               placeholder="Masukkan judul thread yang deskriptif"
                               style="border-radius: 8px;">
                        @error('title')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                        <div class="form-text">Buat judul yang menarik dan deskriptif (5-255 karakter)</div>
                    </div>

                    <div class="mb-4">
                        <label for="content" class="form-label fw-bold">Isi Thread *</label>
                        <textarea class="form-control @error('content') is-invalid @enderror" 
                                  id="content" 
                                  name="content" 
                                  rows="10" 
                                  required
                                  placeholder="Tulis konten thread Anda di sini..."
                                  style="border-radius: 8px;">{{ old('content') }}</textarea>
                        @error('content')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                        <div class="form-text">Jelaskan topik diskusi Anda dengan detail (minimal 10 karakter)</div>
                    </div>

                    <div class="d-flex justify-content-between">
                        <a href="{{ route('forum.show', $forum) }}" class="btn btn-outline-secondary">
                            <i class="bi bi-arrow-left"></i> Kembali
                        </a>
                        <button type="submit" class="btn btn-primary">
                            <i class="bi bi-send"></i> Buat Thread
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection
