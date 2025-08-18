@extends('layouts.app')

@section('title', 'Buat Konsultasi Baru')

@section('content')
<a href="{{ route('user.consultations.index') }}" class="btn btn-secondary mb-3">
    <i class="fas fa-arrow-left"></i> Kembali
</a>

<div class="card shadow rounded-4">
    <div class="card-header bg-primary text-white fw-bold fs-5 rounded-top-4 d-flex align-items-center justify-content-between">
        <span>Buat Konsultasi Baru</span>
    </div>
    <div class="card-body">
        <div class="alert alert-info">
            <i class="fas fa-info-circle me-2"></i>
            <strong>Panduan:</strong> Buat konsultasi kesehatan Anda dan tim admin akan merespon secepat mungkin.
        </div>

        <form action="{{ route('user.consultations.store') }}" method="POST" enctype="multipart/form-data">
            @csrf
            
            <div class="row">
                <div class="col-md-6">
                    <div class="mb-3">
                        <label for="category_id" class="form-label">Kategori Kesehatan *</label>
                        <select name="category_id" id="category_id" class="form-select @error('category_id') is-invalid @enderror" required>
                            <option value="">Pilih Kategori</option>
                            @foreach($categories as $category)
                                <option value="{{ $category->id }}" {{ old('category_id') == $category->id ? 'selected' : '' }}>
                                    {{ $category->name }}
                                </option>
                            @endforeach
                        </select>
                        @error('category_id')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>
                </div>
                
                <div class="col-md-6">
                    <div class="mb-3">
                        <label for="priority" class="form-label">Prioritas *</label>
                        <select name="priority" id="priority" class="form-select @error('priority') is-invalid @enderror" required>
                            <option value="">Pilih Prioritas</option>
                            <option value="low" {{ old('priority') == 'low' ? 'selected' : '' }}>Rendah - Konsultasi umum</option>
                            <option value="medium" {{ old('priority') == 'medium' ? 'selected' : '' }}>Sedang - Konsultasi rutin</option>
                            <option value="high" {{ old('priority') == 'high' ? 'selected' : '' }}>Tinggi - Konsultasi mendesak</option>
                        </select>
                        @error('priority')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>
                </div>
            </div>

            <div class="mb-3">
                <label for="title" class="form-label">Judul Konsultasi *</label>
                <input type="text" name="title" id="title" class="form-control @error('title') is-invalid @enderror" 
                       value="{{ old('title') }}" required maxlength="255">
                @error('title')
                    <div class="invalid-feedback">{{ $message }}</div>
                @enderror
            </div>

            <div class="mb-3">
                <label for="description" class="form-label">Deskripsi Masalah *</label>
                <textarea name="description" id="description" rows="6" class="form-control @error('description') is-invalid @enderror" 
                          required >{{ old('description') }}</textarea>
                @error('description')
                    <div class="invalid-feedback">{{ $message }}</div>
                @enderror
                <small class="text-muted">Berikan informasi yang detail agar admin dapat memberikan respon yang tepat</small>
            </div>

            <div class="mb-3">
                <label for="attachments" class="form-label">File Pendukung (Opsional)</label>
                <input type="file" name="attachments[]" id="attachments" class="form-control" multiple>
                <small class="text-muted">
                    Upload foto, hasil lab, atau dokumen pendukung lainnya. Maksimal 10MB per file.
                    Format yang didukung: JPG, PNG, PDF, DOC, DOCX
                </small>
            </div>

            <!-- Tombol dipindahkan ke luar form untuk menyamakan gaya dengan halaman materi -->
            
        </form>
        <div class="d-flex gap-2 mt-3">
            <button type="submit" form="consultationForm" class="btn btn-primary">
                <i class="fas fa-paper-plane"></i> Kirim Konsultasi
            </button>
            <a href="{{ route('user.consultations.index') }}" class="btn btn-secondary">
                Batal
            </a>
        </div>
    </div>
</div>
@endsection