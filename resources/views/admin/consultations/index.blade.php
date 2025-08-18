@extends('layouts.app')

@section('title', 'Kelola Konsultasi')

@section('content')
<div class="container-fluid">
    

    <!-- Statistics Cards -->
    <div class="row">
        <div class="col-lg-6">
            <div class="card shadow rounded-4">
                <div class="card-header bg-primary text-white rounded-top-4">
                    <h5 class="fw-bold mb-0">Statistik Konsultasi</h5>
                </div>
                <div class="card-body" style="padding: 20px;">
                    <div class="d-flex justify-content-around align-items-center">
                        <div class="text-center">
                            <p class="text-muted fw-medium mb-1">Total Konsultasi</p>
                            <h4 class="mb-0">{{ $stats['total'] }}</h4>
                        </div>
                        <div style="border-left: 1px solid #ddd; height: 50px; margin: 0 20px;"></div>
                        <div>
                            <p class="text-muted fw-medium mb-1 text-center">Status Konsultasi</p>
                            <div class="d-flex gap-4">
                                <div class="text-center">
                                    <p class="text-muted fw-medium mb-1">Menunggu</p>
                                    <h4 class="mb-0">{{ $stats['menunggu'] }}</h4>
                                </div>
                                <div class="text-center">
                                    <p class="text-muted fw-medium mb-1">Diproses</p>
                                    <h4 class="mb-0">{{ $stats['proses'] }}</h4>
                                </div>
                                <div class="text-center">
                                    <p class="text-muted fw-medium mb-1">Selesai</p>
                                    <h4 class="mb-0">{{ $stats['selesai'] }}</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Consultation List -->
    <div class="row mt-4">
        <div class="col-12">
            <div class="card shadow rounded-4">
                <div class="card-header bg-primary text-white rounded-top-4">
                    <h5 class="fw-bold mb-0">Daftar Konsultasi</h5>
                </div>
                <div class="card-body">
                    <!-- <a href="{{ route('admin.consultations.create') }}" class="btn btn-primary mb-3">+ Buat Konsultasi</a> -->
                    <a href="{{ route('admin.dashboard') }}" class="btn btn-secondary mb-3">Kembali</a>
                    <style>
                        .table-custom-border,
                        .table-custom-border th,
                        .table-custom-border td {
                            border-width: 1px !important;
                            border-color: #888 !important; /* Warna border lebih gelap */
                        }
                        .card-custom-border {
                            border: 1px solid #888 !important; /* Border untuk card */
                        }
                    </style>
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover align-middle table-custom-border">
                            <thead class="table-primary text-center">
                                <tr>
                                    <th>No</th>
                                    <th>User</th>
                                    <th>Judul</th>
                                    <th>Kategori</th>
                                    <th>Prioritas</th>
                                    <th>Status</th>
                                    <th>Tanggal</th>
                                    <th>Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse($consultations as $consultation)
                                <tr>
                                    <td>{{ $loop->iteration }}</td>
                                    <td>
                                        <div>
                                            <h6 class="mb-0">{{ $consultation->user->name }}</h6>
                                            <small class="text-muted">{{ $consultation->user->email }}</small>
                                        </div>
                                    </td>
                                    <td>
                                        {{ Str::limit($consultation->title, 50) }}
                                    </td>
                                    <td>
                                        {{ $consultation->category->name }}
                                    </td>
                                    <td>
                                        @if($consultation->priority === 'high')
                                            <span style="display: inline-block; width: 15px; height: 15px; background-color: #dc3545; border-radius: 3px;"></span>
                                        @elseif($consultation->priority === 'medium')
                                            <span style="display: inline-block; width: 15px; height: 15px; background-color: #ffc107; border-radius: 3px;"></span>
                                        @else
                                            <span style="display: inline-block; width: 15px; height: 15px; background-color: #198754; border-radius: 3px;"></span>
                                        @endif
                                    </td>
                                    <td>
                                        @if($consultation->status === 'menunggu')
                                            <span style="display: inline-block; width: 15px; height: 15px; background-color: #dc3545; border-radius: 3px;"></span>
                                        @elseif($consultation->status === 'proses')
                                            <span style="display: inline-block; width: 15px; height: 15px; background-color: #ffc107; border-radius: 3px;"></span>
                                        @elseif($consultation->status === 'selesai')
                                            <span style="display: inline-block; width: 15px; height: 15px; background-color: #198754; border-radius: 3px;"></span>
                                        @endif
                                    </td>
                                    <td>{{ $consultation->created_at->format('d/m/Y H:i') }}</td>
                                    <td>
                                        <div class="d-flex gap-2">
                                            <a href="{{ route('admin.consultations.show', $consultation) }}" 
                                               class="btn btn-sm btn-info">
                                                <i class="fas fa-reply"></i> 
                                                @if($consultation->status === 'selesai')
                                                    Lihat
                                                @else
                                                    Beri Respon
                                                @endif
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                                @empty
                                <tr>
                                    <td colspan="8" class="text-center py-4">
                                        <div class="text-muted">
                                            <i class="fas fa-inbox fa-3x mb-3"></i>
                                            <p>Belum ada konsultasi</p>
                                        </div>
                                    </td>
                                </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>

                    @if($consultations->hasPages())
                    <div class="d-flex justify-content-center mt-4">
                        {{ $consultations->links() }}
                    </div>
                    @endif
                </div>
            </div>
        </div>
    </div>

    <!-- Information and Tips Section -->
    <div class="row mt-4">
        <div class="col-lg-6">
            <div class="card shadow rounded-4">
                <div class="card-header bg-primary text-white rounded-top-4">
                    <h5 class="fw-bold mb-0">Status Konsultasi</h5>
                </div>
                <div class="card-body">
                    <div class="d-flex align-items-center mb-2">
                        <span style="display: inline-block; width: 15px; height: 15px; background-color: #dc3545; border-radius: 3px; margin-right: 10px;"></span>
                        <span>Menunggu: Konsultan sedang memeriksa konsultasi Anda.</span>
                    </div>
                    <div class="d-flex align-items-center mb-2">
                        <span style="display: inline-block; width: 15px; height: 15px; background-color: #ffc107; border-radius: 3px; margin-right: 10px;"></span>
                        <span>Diproses: Konsultan sedang menyiapkan jawaban.</span>
                    </div>
                    <div class="d-flex align-items-center mb-2">
                        <span style="display: inline-block; width: 15px; height: 15px; background-color: #198754; border-radius: 3px; margin-right: 10px;"></span>
                        <span>Selesai: Konsultasi telah dijawab.</span>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-6">
            <div class="card shadow rounded-4">
                <div class="card-header bg-primary text-white rounded-top-4">
                    <h5 class="fw-bold mb-0">Prioritas Konsultasi</h5>
                </div>
                <div class="card-body">
                    <div class="d-flex align-items-center mb-2">
                        <span style="display: inline-block; width: 15px; height: 15px; background-color: #dc3545; border-radius: 3px; margin-right: 10px;"></span>
                        <span>Tinggi: Konsultasi mendesak.</span>
                    </div>
                    <div class="d-flex align-items-center mb-2">
                        <span style="display: inline-block; width: 15px; height: 15px; background-color: #ffc107; border-radius: 3px; margin-right: 10px;"></span>
                        <span>Sedang: Konsultasi rutin.</span>
                    </div>
                    <div class="d-flex align-items-center mb-2">
                        <span style="display: inline-block; width: 15px; height: 15px; background-color: #198754; border-radius: 3px; margin-right: 10px;"></span>
                        <span>Rendah: Konsultasi umum.</span>
                    </div>
                </div>
            </div>
        </div>
        
        
    </div>

</div>
@endsection