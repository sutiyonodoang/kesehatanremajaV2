@extends('layouts.app')

@section('title', 'Detail Konsultasi')

@section('content')
<div class="container-fluid">
    <div class="row mb-3">
        <div class="col-12 d-flex justify-content-between">
            <a href="{{ route('konsultan.consultations.index') }}" class="btn btn-secondary">
                <i class="fas fa-arrow-left"></i> Kembali
            </a>
            @if($consultation->status !== 'selesai')
                <form action="{{ route('konsultan.consultations.finish', $consultation) }}" method="POST">
                    @csrf
                    @method('PATCH')
                    <button type="submit" class="btn btn-success" onclick="return confirm('Yakin ingin menyelesaikan konsultasi ini?')">
                        <i class="fas fa-check-circle"></i> Konsultasi Selesai
                    </button>
                </form>
            @endif
        </div>
    </div>

    <div class="row">
        <!-- Left Column: Consultation Details -->
        <div class="col-lg-6 mb-4">
            <div class="card shadow rounded-4 h-100">
                <div class="card-header bg-primary text-white rounded-top-4">
                    <h5 class="fw-bold mb-0">Detail Konsultasi</h5>
                </div>
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h5 class="mb-0">{{ $consultation->title }}</h5>
                        <div class="d-flex gap-2">
                            @if($consultation->priority === 'high')
                                <span class="badge bg-danger">Prioritas Tinggi</span>
                            @elseif($consultation->priority === 'medium')
                                <span class="badge bg-warning">Prioritas Sedang</span>
                            @else
                                <span class="badge bg-success">Prioritas Rendah</span>
                            @endif
                            
                            @if($consultation->status === 'menunggu')
                                <span class="badge bg-warning">Menunggu</span>
                            @elseif($consultation->status === 'proses')
                                <span class="badge bg-info">Diproses</span>
                            @elseif($consultation->status === 'selesai')
                                <span class="badge bg-success">Selesai</span>
                            @endif
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <p><strong>User:</strong> {{ $consultation->user->name }} ({{ $consultation->user->email }})</p>
                            <p><strong>Kategori:</strong> 
                                <span class="badge" style="background-color: {{ $consultation->category->color }}; color: white;">
                                    {{ $consultation->category->name }}
                                </span>
                            </p>
                        </div>
                        <div class="col-md-6">
                            <p><strong>Tanggal Dibuat:</strong> {{ $consultation->created_at->format('d/m/Y H:i') }}</p>
                            @if($consultation->resolved_at)
                                <p><strong>Tanggal Selesai:</strong> {{ $consultation->resolved_at->format('d/m/Y H:i') }}</p>
                            @endif
                        </div>
                    </div>
                    <div class="mb-3">
                        <h6>Deskripsi:</h6>
                        <div class="border rounded p-3 bg-light">
                            {!! nl2br(e($consultation->description)) !!}
                        </div>
                    </div>
                    @if($consultation->attachments->count() > 0)
                    <div class="mb-3">
                        <h6>File Pendukung Awal:</h6>
                        <div class="row">
                            @foreach($consultation->attachments as $attachment)
                            <div class="col-md-4 mb-2">
                                <div class="border rounded p-2">
                                    <i class="fas fa-file me-2"></i>
                                    <a href="{{ Storage::url($attachment->file_path) }}" target="_blank" class="text-decoration-none">
                                        {{ $attachment->original_name }}
                                    </a>
                                </div>
                            </div>
                            @endforeach
                        </div>
                    </div>
                    @endif
                </div>
            </div>
        </div>

        <!-- Right Column: Chat and Response Form -->
        <div class="col-lg-6 mb-4">
            <!-- Chat/Responses Card -->
            <div class="card shadow rounded-4 mb-4">
                <div class="card-header bg-primary text-white rounded-top-4">
                    <h5 class="fw-bold mb-0">Percakapan</h5>
                </div>
                <div class="card-body">
                    @forelse($consultation->responses->sortBy('created_at') as $response)
                        <div class="d-flex mb-3 {{ $response->is_responder ? 'justify-content-end' : '' }}">
                            <div class="card" style="max-width: 80%;">
                                <div class="card-body p-2">
                                    <p class="card-text">{!! nl2br(e($response->response)) !!}</p>
                                    @if($response->attachments->count() > 0)
                                        <hr>
                                        @foreach($response->attachments as $attachment)
                                        <a href="{{ Storage::url($attachment->file_path) }}" target="_blank" class="d-block">
                                            <i class="fas fa-file me-1"></i> {{ $attachment->original_name }}
                                        </a>
                                        @endforeach
                                    @endif
                                </div>
                                <div class="card-footer text-muted p-1 px-2" style="font-size: 0.8rem;">
                                    {{ $response->user->name }} - {{ $response->created_at->format('d/m/Y H:i') }}
                                </div>
                            </div>
                        </div>
                    @empty
                        <p class="text-muted text-center">Belum ada percakapan.</p>
                    @endforelse
                </div>
            </div>

            <!-- Response Form Card -->
            <div class="card shadow rounded-4">
                <div class="card-header bg-primary text-white rounded-top-4">
                    <h5 class="fw-bold mb-0">Balas Percakapan</h5>
                </div>
                <div class="card-body">
                    @if($consultation->status !== 'selesai')
                        <form action="{{ route('konsultan.consultations.response', $consultation) }}" method="POST" enctype="multipart/form-data">
                            @csrf
                            <div class="mb-3">
                                <label for="response" class="form-label">Respon *</label>
                                <textarea name="response" id="response" rows="4" class="form-control @error('response') is-invalid @enderror" required>{{ old('response') }}</textarea>
                                @error('response')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>
                            <div class="mb-3">
                                <div class="form-check">
                                    <input type="checkbox" name="is_public" id="is_public" class="form-check-input" value="1" {{ old('is_public', true) ? 'checked' : '' }}>
                                    <label for="is_public" class="form-check-label">Respon visible untuk user</label>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="attachments" class="form-label">File Pendukung</label>
                                <input type="file" name="attachments[]" id="attachments" class="form-control" multiple>
                                <small class="text-muted">Maksimal 10MB per file</small>
                            </div>
                            <button type="submit" class="btn btn-primary w-100">
                                <i class="fas fa-paper-plane"></i> Kirim Respon
                            </button>
                        </form>
                    @else
                        <p class="text-center text-muted">Konsultasi ini sudah selesai.</p>
                    @endif
                </div>
            </div>
        </div>
    </div>
</div>
@endsection