@extends('layouts.app')

@section('title', 'Buat Thread Baru')

@section('content')
<div class="mb-3">
    <a href="{{ route('forum.index') }}" class="btn btn-secondary">
        <i class="bi bi-arrow-left"></i> Kembali ke Forum
    </a>
</div>

<div class="card shadow rounded-4">
    <div class="card-header bg-success text-white rounded-top-4">
        <h5 class="fw-bold mb-0">
            <i class="bi bi-plus-circle"></i> Buat Thread Diskusi Baru
        </h5>
    </div>
    <div class="card-body">
        @if ($errors->any())
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <strong><i class="bi bi-exclamation-triangle"></i> Ada kesalahan:</strong>
                <ul class="mb-0 mt-2">
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        @endif

        <form action="{{ route('forum.threads.store.category') }}" method="POST">
            @csrf
            
            <!-- Category Selection -->
            <div class="mb-4">
                <label for="forum_id" class="form-label fw-bold">
                    <i class="bi bi-folder"></i> Pilih Kategori Forum <span class="text-danger">*</span>
                </label>
                <select class="form-select @error('forum_id') is-invalid @enderror" id="forum_id" name="forum_id" required>
                    <option value="">-- Pilih Kategori --</option>
                    @foreach($forums as $forum)
                        <option value="{{ $forum->id }}" {{ old('forum_id') == $forum->id ? 'selected' : '' }}>
                            {{ $forum->name }} - {{ $forum->description }}
                        </option>
                    @endforeach
                </select>
                @error('forum_id')
                    <div class="invalid-feedback">{{ $message }}</div>
                @enderror
                <small class="form-text text-muted">Pilih kategori yang sesuai dengan topik diskusi Anda</small>
            </div>

            <!-- Thread Title -->
            <div class="mb-4">
                <label for="title" class="form-label fw-bold">
                    <i class="bi bi-chat-left-text"></i> Judul Thread <span class="text-danger">*</span>
                </label>
                <input type="text" 
                       class="form-control @error('title') is-invalid @enderror" 
                       id="title" 
                       name="title" 
                       value="{{ old('title') }}" 
                       placeholder="Masukkan judul thread yang menarik..." 
                       maxlength="255"
                       required>
                @error('title')
                    <div class="invalid-feedback">{{ $message }}</div>
                @enderror
                <small class="form-text text-muted">Buat judul yang jelas dan menarik (5-255 karakter)</small>
            </div>

            <!-- Thread Content -->
            <div class="mb-4">
                <label for="content" class="form-label fw-bold">
                    <i class="bi bi-file-text"></i> Isi Thread <span class="text-danger">*</span>
                </label>
                <textarea class="form-control @error('content') is-invalid @enderror" 
                          id="content" 
                          name="content" 
                          rows="8" 
                          placeholder="Tulis pertanyaan atau topik diskusi Anda dengan detail..."
                          maxlength="10000"
                          required>{{ old('content') }}</textarea>
                @error('content')
                    <div class="invalid-feedback">{{ $message }}</div>
                @enderror
                <small class="form-text text-muted">Jelaskan topik diskusi dengan detail (10-10.000 karakter)</small>
            </div>

            <!-- Guidelines -->
            <div class="alert alert-info border-0 rounded-3">
                <h6 class="fw-bold text-info mb-2">
                    <i class="bi bi-info-circle"></i> Panduan Membuat Thread
                </h6>
                <ul class="mb-0 small">
                    <li>Pilih kategori yang sesuai dengan topik diskusi</li>
                    <li>Gunakan judul yang jelas dan spesifik</li>
                    <li>Jelaskan pertanyaan atau topik dengan detail</li>
                    <li>Gunakan bahasa yang sopan dan mudah dipahami</li>
                    <li>Pastikan topik belum pernah dibahas sebelumnya</li>
                </ul>
            </div>

            <!-- Action Buttons -->
            <div class="d-flex justify-content-between">
                <a href="{{ route('forum.index') }}" class="btn btn-outline-secondary">
                    <i class="bi bi-x-circle"></i> Batal
                </a>
                <button type="submit" class="btn btn-success">
                    <i class="bi bi-send"></i> Buat Thread
                </button>
            </div>
        </form>
    </div>
</div>

<style>
.card {
    border: none;
    box-shadow: 0 4px 12px rgba(0,0,0,0.1);
}

.form-control:focus, .form-select:focus {
    border-color: #28a745;
    box-shadow: 0 0 0 0.2rem rgba(40, 167, 69, 0.25);
}

.btn-success {
    background: linear-gradient(45deg, #28a745, #20c997);
    border: none;
    padding: 0.75rem 2rem;
    font-weight: 600;
}

.btn-success:hover {
    background: linear-gradient(45deg, #218838, #1ea085);
    transform: translateY(-1px);
    box-shadow: 0 4px 12px rgba(40, 167, 69, 0.3);
}

.alert-info {
    background: linear-gradient(45deg, #d1ecf1, #bee5eb);
    border-left: 4px solid #17a2b8;
}

label {
    color: #495057;
}

.form-text {
    font-size: 0.875rem;
}
</style>
@endsection
