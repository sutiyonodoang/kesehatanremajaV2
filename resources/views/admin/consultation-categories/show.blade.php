@extends('layouts.app')

@section('title', 'Detail Kategori Konsultasi')

@section('content')
<div class="container-fluid">
    <div class="row">
        <div class="col-12">
            <div class="page-title-box d-flex align-items-center justify-content-between">
                <h4 class="mb-0">Detail Kategori: {{ $consultationCategory->name }}</h4>
                <div class="page-title-right">
                    <a href="{{ route('admin.consultation-categories.index') }}" class="btn btn-secondary">
                        <i class="fas fa-arrow-left"></i> Kembali
                    </a>
                    <a href="{{ route('admin.consultation-categories.edit', $consultationCategory) }}" class="btn btn-warning">
                        <i class="fas fa-edit"></i> Edit
                    </a>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-8">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Informasi Kategori</h5>
                    
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <p><strong>Nama:</strong> 
                                <span class="badge" style="background-color: {{ $consultationCategory->color }}; color: white;">
                                    {{ $consultationCategory->name }}
                                </span>
                            </p>
                            <p><strong>Deskripsi:</strong> {{ $consultationCategory->description ?? 'Tidak ada deskripsi' }}</p>
                        </div>
                        <div class="col-md-6">
                            <p><strong>Warna:</strong> 
                                <div class="d-flex align-items-center">
                                    <div class="color-preview me-2" style="width: 30px; height: 30px; background-color: {{ $consultationCategory->color }}; border-radius: 6px; border: 2px solid #ddd;"></div>
                                    <span>{{ $consultationCategory->color }}</span>
                                </div>
                            </p>
                            <p><strong>Status:</strong> 
                                @if($consultationCategory->is_active)
                                    <span class="badge bg-success">Aktif</span>
                                @else
                                    <span class="badge bg-secondary">Nonaktif</span>
                                @endif
                            </p>
                        </div>
                    </div>

                    <div class="mb-3">
                        <p><strong>Tanggal Dibuat:</strong> {{ $consultationCategory->created_at->format('d/m/Y H:i') }}</p>
                        <p><strong>Terakhir Diupdate:</strong> {{ $consultationCategory->updated_at->format('d/m/Y H:i') }}</p>
                    </div>
                </div>
            </div>

            <!-- Consultations in this category -->
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Konsultasi dalam Kategori Ini</h5>
                    
                    @if($consultationCategory->consultations->count() > 0)
                    <div class="table-responsive">
                        <table class="table table-sm">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Judul</th>
                                    <th>User</th>
                                    <th>Status</th>
                                    <th>Tanggal</th>
                                    <th>Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($consultationCategory->consultations as $consultation)
                                <tr>
                                    <td>#{{ $consultation->id }}</td>
                                    <td>{{ Str::limit($consultation->title, 40) }}</td>
                                    <td>{{ $consultation->user->name }}</td>
                                    <td>
                                        @if($consultation->status === 'pending')
                                            <span class="badge bg-warning">Menunggu</span>
                                        @elseif($consultation->status === 'in_progress')
                                            <span class="badge bg-info">Diproses</span>
                                        @elseif($consultation->status === 'resolved')
                                            <span class="badge bg-success">Selesai</span>
                                        @elseif($consultation->status === 'closed')
                                            <span class="badge bg-secondary">Ditutup</span>
                                        @else
                                            <span class="badge bg-primary">Dibuka Kembali</span>
                                        @endif
                                    </td>
                                    <td>{{ $consultation->created_at->format('d/m/Y') }}</td>
                                    <td>
                                        <a href="{{ route('admin.consultations.show', $consultation) }}" 
                                           class="btn btn-sm btn-outline-primary">
                                            <i class="fas fa-eye"></i>
                                        </a>
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                    @else
                    <p class="text-muted text-center py-3">Belum ada konsultasi dalam kategori ini</p>
                    @endif
                </div>
            </div>
        </div>

        <div class="col-lg-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Statistik</h5>
                    
                    <div class="text-center mb-3">
                        <div class="display-4 text-primary">{{ $consultationCategory->consultations->count() }}</div>
                        <p class="text-muted">Total Konsultasi</p>
                    </div>

                    <div class="row text-center">
                        <div class="col-6">
                            <div class="h4 text-warning">{{ $consultationCategory->consultations->where('status', 'pending')->count() }}</div>
                            <small class="text-muted">Menunggu</small>
                        </div>
                        <div class="col-6">
                            <div class="h4 text-success">{{ $consultationCategory->consultations->where('status', 'resolved')->count() }}</div>
                            <small class="text-muted">Selesai</small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
