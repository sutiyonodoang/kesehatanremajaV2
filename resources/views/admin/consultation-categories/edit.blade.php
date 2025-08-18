@extends('layouts.app')

@section('title', 'Edit Kategori Konsultasi')

@section('content')
<div class="container-fluid">
    <div class="row">
        <div class="col-12">
            <div class="page-title-box d-flex align-items-center justify-content-between">
                <h4 class="mb-0">Edit Kategori Konsultasi</h4>
                <div class="page-title-right">
                    <a href="{{ route('admin.consultation-categories.index') }}" class="btn btn-secondary">
                        <i class="fas fa-arrow-left"></i> Kembali
                    </a>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <form action="{{ route('admin.consultation-categories.update', $consultationCategory) }}" method="POST">
                        @csrf
                        @method('PUT')
                        
                        <div class="mb-3">
                            <label for="name" class="form-label">Nama Kategori *</label>
                            <input type="text" name="name" id="name" class="form-control @error('name') is-invalid @enderror" 
                                   value="{{ old('name', $consultationCategory->name) }}" required maxlength="255">
                            @error('name')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        <div class="mb-3">
                            <label for="description" class="form-label">Deskripsi</label>
                            <textarea name="description" id="description" rows="3" class="form-control">{{ old('description', $consultationCategory->description) }}</textarea>
                        </div>

                        <div class="mb-3">
                            <label for="color" class="form-label">Warna *</label>
                            <input type="color" name="color" id="color" class="form-control form-control-color @error('color') is-invalid @enderror" 
                                   value="{{ old('color', $consultationCategory->color) }}" required>
                            @error('color')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        <div class="mb-3">
                            <div class="form-check">
                                <input type="checkbox" name="is_active" id="is_active" class="form-check-input" value="1" {{ old('is_active', $consultationCategory->is_active) ? 'checked' : '' }}>
                                <label for="is_active" class="form-check-label">Kategori Aktif</label>
                            </div>
                        </div>

                        <div class="d-flex gap-2">
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-save"></i> Update Kategori
                            </button>
                            <a href="{{ route('admin.consultation-categories.index') }}" class="btn btn-secondary">
                                Batal
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
