@extends('layouts.app')

@section('title', 'Edit Konsultasi')

@section('content')
<div class="container-fluid">
    <div class="row mb-3">
    <div class="col-12 d-flex justify-content-end">
        <a href="{{ route('admin.consultations.show', $consultation) }}" class="btn btn-secondary">
            <i class="fas fa-arrow-left"></i> Kembali
        </a>
    </div>
</div>

    <div class="row">
        <div class="col-12">
            <div class="card shadow rounded-4">
                <div class="card-header bg-primary text-white rounded-top-4">
                    <h5 class="fw-bold mb-0">Edit Konsultasi</h5>
                </div>
                <div class="card-body">
                    <form action="{{ route('admin.consultations.update', $consultation) }}" method="POST">
                        @csrf
                        @method('PUT')
                        
                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="category_id" class="form-label">Kategori *</label>
                                    <select name="category_id" id="category_id" class="form-select @error('category_id') is-invalid @enderror" required>
                                        <option value="">Pilih Kategori</option>
                                        @foreach($categories as $category)
                                            <option value="{{ $category->id }}" {{ old('category_id', $consultation->category_id) == $category->id ? 'selected' : '' }}>
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
                                    <label for="status" class="form-label">Status *</label>
                                    <select name="status" id="status" class="form-select @error('status') is-invalid @enderror" required>
                                        <option value="pending" {{ old('status', $consultation->status) == 'pending' ? 'selected' : '' }}>Menunggu</option>
                                        <option value="in_progress" {{ old('status', $consultation->status) == 'in_progress' ? 'selected' : '' }}>Diproses</option>
                                        <option value="resolved" {{ old('status', $consultation->status) == 'resolved' ? 'selected' : '' }}>Selesai</option>
                                        <option value="closed" {{ old('status', $consultation->status) == 'closed' ? 'selected' : '' }}>Ditutup</option>
                                        <option value="reopened" {{ old('status', $consultation->status) == 'reopened' ? 'selected' : '' }}>Dibuka Kembali</option>
                                    </select>
                                    @error('status')
                                        <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="title" class="form-label">Judul Konsultasi *</label>
                            <input type="text" name="title" id="title" class="form-control @error('title') is-invalid @enderror" 
                                   value="{{ old('title', $consultation->title) }}" required maxlength="255">
                            @error('title')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        <div class="mb-3">
                            <label for="description" class="form-label">Deskripsi *</label>
                            <textarea name="description" id="description" rows="5" class="form-control @error('description') is-invalid @enderror" required>{{ old('description', $consultation->description) }}</textarea>
                            @error('description')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="priority" class="form-label">Prioritas *</label>
                                    <select name="priority" id="priority" class="form-select @error('priority') is-invalid @enderror" required>
                                        <option value="">Pilih Prioritas</option>
                                        <option value="low" {{ old('priority', $consultation->priority) == 'low' ? 'selected' : '' }}>Rendah</option>
                                        <option value="medium" {{ old('priority', $consultation->priority) == 'medium' ? 'selected' : '' }}>Sedang</option>
                                        <option value="high" {{ old('priority', $consultation->priority) == 'high' ? 'selected' : '' }}>Tinggi</option>
                                    </select>
                                    @error('priority')
                                        <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                        </div>

                        <div class="d-flex gap-2">
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-save"></i> Update Konsultasi
                            </button>
                            <a href="{{ route('admin.consultations.show', $consultation) }}" class="btn btn-secondary">
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
