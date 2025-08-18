@extends('layouts.app')
@section('title', 'Edit Konsultasi')

@section('content')
<div class="card shadow rounded-4">
    <div class="card-header bg-primary text-white fw-bold fs-5 rounded-top-4">
        Edit Konsultasi
    </div>
    <div class="card-body">
        <form action="{{ route('user.consultations.update', $consultation->id) }}" method="POST" enctype="multipart/form-data">
            @csrf
            @method('PUT')

            {{-- Kategori --}}
            <div class="mb-3">
                <label for="category_id" class="form-label fw-semibold text-primary">Kategori</label>
                <select name="category_id" id="category_id" class="form-select @error('category_id') is-invalid @enderror" required>
                    @foreach($categories as $category)
                        <option value="{{ $category->id }}" {{ $consultation->category_id == $category->id ? 'selected' : '' }}>{{ $category->name }}</option>
                    @endforeach
                </select>
                @error('category_id')
                    <div class="invalid-feedback">{{ $message }}</div>
                @enderror
            </div>

            {{-- Judul --}}
            <div class="mb-3">
                <label for="title" class="form-label fw-semibold text-primary">Judul</label>
                <input type="text" name="title" id="title"
                    class="form-control @error('title') is-invalid @enderror"
                    value="{{ old('title', $consultation->title) }}" required>
                @error('title')
                    <div class="invalid-feedback">{{ $message }}</div>
                @enderror
            </div>

            {{-- Deskripsi --}}
            <div class="mb-3">
                <label for="description" class="form-label fw-semibold text-primary">Deskripsi</label>
                <textarea name="description" class="form-control @error('description') is-invalid @enderror"
                          rows="4">{{ old('description', $consultation->description) }}</textarea>
                @error('description')
                    <div class="invalid-feedback">{{ $message }}</div>
                @enderror
            </div>

            {{-- Prioritas --}}
            <div class="mb-3">
                <label for="priority" class="form-label fw-semibold text-primary">Prioritas</label>
                <select name="priority" id="priority" class="form-select @error('priority') is-invalid @enderror" required>
                    <option value="low" {{ $consultation->priority == 'low' ? 'selected' : '' }}>Rendah</option>
                    <option value="medium" {{ $consultation->priority == 'medium' ? 'selected' : '' }}>Sedang</option>
                    <option value="high" {{ $consultation->priority == 'high' ? 'selected' : '' }}>Tinggi</option>
                </select>
                @error('priority')
                    <div class="invalid-feedback">{{ $message }}</div>
                @enderror
            </div>

            {{-- Lampiran --}}
            <div class="mb-3">
                <label for="attachments" class="form-label fw-semibold text-primary">Upload Lampiran</label>
                <input type="file" name="attachments[]" class="form-control @error('attachments') is-invalid @enderror" multiple>
                <small class="text-muted">File yang didukung: pdf, doc, jpg, png, etc.</small>
                @error('attachments')
                    <div class="invalid-feedback">{{ $message }}</div>
                @enderror
                @if ($consultation->attachments->count() > 0)
                    <div class="mt-2">
                        <p class="mb-0">Lampiran saat ini:</p>
                        <ul>
                            @foreach($consultation->attachments as $attachment)
                                <li><a href="{{ Storage::url($attachment->file_path) }}" target="_blank">{{ $attachment->original_name }}</a></li>
                            @endforeach
                        </ul>
                        <small class="text-muted">Biarkan kosong jika tidak ingin mengubah lampiran.</small>
                    </div>
                @endif
            </div>

            {{-- Tombol --}}
            <a href="{{ route('user.consultations.index') }}" class="btn btn-secondary">Kembali</a>
            <button type="submit" class="btn btn-primary">Update</button>
        </form>
    </div>
</div>
@endsection