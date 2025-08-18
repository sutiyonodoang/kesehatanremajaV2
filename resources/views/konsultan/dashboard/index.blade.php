@extends('layouts.app')

@section('title', 'Dashboard Konsultan')

@section('content')
<div class="row">
    <div class="col-12 mb-4">
        <div class="card shadow rounded-4 border-0">
            <div class="card-body bg-primary text-white rounded-top-4">
                <h4 class="fw-bold mb-0">Selamat Datang, {{ Auth::user()->name }}!</h4>
                <p class="mb-0">Anda adalah konsultan kesehatan yang bertugas menjawab pertanyaan dan konsultasi user.</p>
            </div>
        </div>
    </div>

    <!-- Statistics Cards -->
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card text-white bg-warning shadow rounded-4 border-0">
            <div class="card-body">
                <div class="text-center">
                    <div class="feature-icon text-center fs-2">⏳</div>
                    <h5 class="card-title fw-bold text-center">Menunggu</h5>
                    <div class="display-6 fw-bold">{{ $stats['total_pending'] }}</div>
                </div>
            </div>
        </div>
    </div>

    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card text-white bg-info shadow rounded-4 border-0">
            <div class="card-body">
                <div class="text-center">
                    <div class="feature-icon text-center fs-2">🔄</div>
                    <h5 class="card-title fw-bold text-center">Sedang Diproses</h5>
                    <div class="display-6 fw-bold">{{ $stats['total_in_progress'] }}</div>
                </div>
            </div>
        </div>
    </div>

    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card text-white bg-success shadow rounded-4 border-0">
            <div class="card-body">
                <div class="text-center">
                    <div class="feature-icon text-center fs-2">📝</div>
                    <h5 class="card-title fw-bold text-center">Respon Hari Ini</h5>
                    <div class="display-6 fw-bold">{{ $stats['my_responses_today'] }}</div>
                </div>
            </div>
        </div>
    </div>

    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card text-white bg-primary shadow rounded-4 border-0">
            <div class="card-body">
                <div class="text-center">
                    <div class="feature-icon text-center fs-2">💬</div>
                    <h5 class="card-title fw-bold text-center">Total Respon</h5>
                    <div class="display-6 fw-bold">{{ $stats['my_total_responses'] }}</div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <!-- Recent Consultations -->
    <div class="col-lg-8 mb-4">
        <div class="card shadow rounded-4 border-0">
            <div class="card-body">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h5 class="card-title mb-0">Konsultasi Terbaru</h5>
                    <a href="{{ route('konsultan.consultations.index') }}" class="btn btn-primary btn-sm">
                        Lihat Semua
                    </a>
                </div>
                
                @if($recent_consultations->count() > 0)
                <div class="table-responsive">
                    <table class="table table-sm">
                        <thead>
                            <tr>
                                <th>User</th>
                                <th>Judul</th>
                                <th>Kategori</th>
                                <th>Prioritas</th>
                                <th>Status</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($recent_consultations as $consultation)
                            <tr>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <div class="avatar-sm rounded-circle bg-primary me-2">
                                            <span class="avatar-title text-white">
                                                {{ substr($consultation->user->name, 0, 1) }}
                                            </span>
                                        </div>
                                        <div>
                                            <h6 class="mb-0">{{ $consultation->user->name }}</h6>
                                            <small class="text-muted">{{ $consultation->created_at->format('d/m/Y H:i') }}</small>
                                        </div>
                                    </div>
                                </td>
                                <td>{{ Str::limit($consultation->title, 30) }}</td>
                                <td>
                                    <span class="badge" style="background-color: {{ $consultation->category->color }}; color: white;">
                                        {{ $consultation->category->name }}
                                    </span>
                                </td>
                                <td>
                                    @if($consultation->priority === 'high')
                                        <span class="badge bg-danger">Tinggi</span>
                                    @elseif($consultation->priority === 'medium')
                                        <span class="badge bg-warning">Sedang</span>
                                    @else
                                        <span class="badge bg-success">Rendah</span>
                                    @endif
                                </td>
                                <td>
                                    @if($consultation->status === 'pending')
                                        <span class="badge bg-warning">Menunggu</span>
                                    @else
                                        <span class="badge bg-info">Diproses</span>
                                    @endif
                                </td>
                                <td>
                                    <a href="{{ route('konsultan.consultations.show', $consultation) }}" 
                                       class="btn btn-sm btn-outline-primary">
                                        <i class="fas fa-eye"></i> Lihat
                                    </a>
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
                @else
                <p class="text-muted text-center py-3">Belum ada konsultasi yang perlu direspon</p>
                @endif
            </div>
        </div>
    </div>

    <!-- My Recent Responses -->
    <div class="col-lg-4 mb-4">
        <div class="card shadow rounded-4 border-0">
            <div class="card-body">
                <h5 class="card-title mb-3">Respon Terbaru Saya</h5>
                
                @if($my_recent_responses->count() > 0)
                <div class="list-group list-group-flush">
                    @foreach($my_recent_responses as $response)
                    <div class="list-group-item border-0 px-0">
                        <div class="d-flex justify-content-between align-items-start">
                            <div class="flex-grow-1">
                                <h6 class="mb-1">{{ Str::limit($response->consultation->title, 40) }}</h6>
                                <small class="text-muted">{{ $response->created_at->format('d/m/Y H:i') }}</small>
                            </div>
                            <a href="{{ route('konsultan.consultations.show', $response->consultation) }}" 
                               class="btn btn-sm btn-outline-primary">
                                <i class="fas fa-eye"></i>
                            </a>
                        </div>
                    </div>
                    @endforeach
                </div>
                @else
                <p class="text-muted text-center py-3">Belum ada respon yang diberikan</p>
                @endif
            </div>
        </div>
    </div>
</div>
@endsection
