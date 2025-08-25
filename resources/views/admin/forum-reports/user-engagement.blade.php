@extends('layouts.app')

@section('title', 'Laporan User Engagement - Forum')

@section('content')
<div class="container-fluid">
    <!-- Header -->
    <div class="row mb-4">
        <div class="col-12">
            <div class="d-flex justify-content-between align-items-center">
                <div>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{ route('admin.forum-reports.index') }}">Laporan Forum</a></li>
                            <li class="breadcrumb-item active">User Engagement</li>
                        </ol>
                    </nav>
                    <h2 class="fw-bold text-primary mb-1">👥 User Engagement</h2>
                    <p class="text-muted mb-0">Analisis tingkat partisipasi dan engagement user di forum</p>
                </div>
                <div class="d-flex gap-2">
                    <a href="{{ route('admin.forum-reports.index') }}" class="btn btn-outline-secondary">
                        <i class="bi bi-arrow-left"></i> Kembali
                    </a>
                    <a href="{{ route('admin.forum-reports.export', ['type' => 'user-engagement']) }}" class="btn btn-success">
                        <i class="bi bi-download"></i> Export CSV
                    </a>
                </div>
            </div>
        </div>
    </div>

    <!-- Engagement Summary -->
    <div class="row mb-4">
        <div class="col-xl-3 col-md-6 mb-3">
            <div class="card border-0 shadow-sm bg-success text-white">
                <div class="card-body text-center">
                    <i class="bi bi-award display-4 mb-2"></i>
                    <h4>{{ $users->where('engagement_level', 'Sangat Aktif')->count() }}</h4>
                    <p class="mb-0">Sangat Aktif</p>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-md-6 mb-3">
            <div class="card border-0 shadow-sm bg-primary text-white">
                <div class="card-body text-center">
                    <i class="bi bi-emoji-smile display-4 mb-2"></i>
                    <h4>{{ $users->where('engagement_level', 'Aktif')->count() }}</h4>
                    <p class="mb-0">Aktif</p>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-md-6 mb-3">
            <div class="card border-0 shadow-sm bg-warning text-white">
                <div class="card-body text-center">
                    <i class="bi bi-emoji-neutral display-4 mb-2"></i>
                    <h4>{{ $users->where('engagement_level', 'Cukup Aktif')->count() }}</h4>
                    <p class="mb-0">Cukup Aktif</p>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-md-6 mb-3">
            <div class="card border-0 shadow-sm bg-secondary text-white">
                <div class="card-body text-center">
                    <i class="bi bi-emoji-frown display-4 mb-2"></i>
                    <h4>{{ $users->where('engagement_level', 'Kurang Aktif')->count() }}</h4>
                    <p class="mb-0">Kurang Aktif</p>
                </div>
            </div>
        </div>
    </div>

    <!-- User Table -->
    <div class="card shadow-sm border-0">
        <div class="card-header bg-white border-bottom">
            <div class="row align-items-center">
                <div class="col">
                    <h5 class="card-title mb-0">
                        <i class="bi bi-people text-primary"></i> Daftar User & Engagement Score
                    </h5>
                </div>
                <div class="col-auto">
                    <small class="text-muted">
                        Menampilkan {{ $users->firstItem() ?? 0 }}-{{ $users->lastItem() ?? 0 }} dari {{ $users->total() }} user
                    </small>
                </div>
            </div>
        </div>
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover align-middle mb-0">
                    <thead class="table-light">
                        <tr>
                            <th class="border-0 ps-4">User</th>
                            <th class="border-0 text-center">Thread</th>
                            <th class="border-0 text-center">Post</th>
                            <th class="border-0 text-center">Total Aktivitas</th>
                            <th class="border-0 text-center">Bulan Ini</th>
                            <th class="border-0 text-center">Engagement Score</th>
                            <th class="border-0 text-center">Level</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse($users as $user)
                            <tr>
                                <td class="ps-4">
                                    <div class="d-flex align-items-center">
                                        <div class="bg-primary text-white rounded-circle d-flex align-items-center justify-content-center me-3" style="width: 40px; height: 40px;">
                                            {{ strtoupper(substr($user->name, 0, 1)) }}
                                        </div>
                                        <div>
                                            <h6 class="mb-1">{{ $user->name }}</h6>
                                            <small class="text-muted">{{ $user->email }}</small>
                                        </div>
                                    </div>
                                </td>
                                <td class="text-center">
                                    <span class="badge bg-primary fs-6">{{ $user->forum_threads_count }}</span>
                                </td>
                                <td class="text-center">
                                    <span class="badge bg-success fs-6">{{ $user->forum_posts_count }}</span>
                                </td>
                                <td class="text-center">
                                    <span class="badge bg-info fs-6">{{ $user->total_activity }}</span>
                                </td>
                                <td class="text-center">
                                    <span class="badge bg-warning fs-6">{{ $user->monthly_activity }}</span>
                                </td>
                                <td class="text-center">
                                    <div class="d-flex flex-column align-items-center">
                                        <span class="fw-bold fs-5 text-{{ $user->engagement_color }}">{{ $user->engagement_score }}</span>
                                        <div class="progress" style="width: 60px; height: 6px;">
                                            <div class="progress-bar bg-{{ $user->engagement_color }}" style="width: {{ $user->engagement_score }}%"></div>
                                        </div>
                                    </div>
                                </td>
                                <td class="text-center">
                                    <span class="badge bg-{{ $user->engagement_color }} fs-6">
                                        {{ $user->engagement_level }}
                                    </span>
                                </td>
                            </tr>
                        @empty
                            <tr>
                                <td colspan="7" class="text-center py-5">
                                    <div class="text-muted">
                                        <i class="bi bi-people" style="font-size: 3rem;"></i>
                                        <p class="mt-2">Belum ada data user yang aktif di forum</p>
                                    </div>
                                </td>
                            </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
        </div>
        
        @if($users->hasPages())
            <div class="card-footer bg-white border-top">
                <div class="d-flex justify-content-center">
                    {{ $users->links('pagination::bootstrap-5') }}
                </div>
            </div>
        @endif
    </div>

    <!-- Engagement Info -->
    <div class="row mt-4">
        <div class="col-12">
            <div class="card border-0 bg-light">
                <div class="card-body">
                    <h6 class="fw-bold mb-3">
                        <i class="bi bi-info-circle text-primary"></i> Cara Perhitungan Engagement Score
                    </h6>
                    <div class="row">
                        <div class="col-md-6">
                            <h6 class="text-muted">Formula:</h6>
                            <p class="mb-2"><code>Score = (Thread × 3) + (Post × 1) + (Aktivitas Bulan Ini × 2)</code></p>
                            
                            <h6 class="text-muted mt-3">Kategori Level:</h6>
                            <ul class="list-unstyled">
                                <li><span class="badge bg-success me-2">Sangat Aktif</span> Score ≥ 50</li>
                                <li><span class="badge bg-primary me-2">Aktif</span> Score 25-49</li>
                                <li><span class="badge bg-warning me-2">Cukup Aktif</span> Score 10-24</li>
                                <li><span class="badge bg-secondary me-2">Kurang Aktif</span> Score < 10</li>
                            </ul>
                        </div>
                        <div class="col-md-6">
                            <h6 class="text-muted">Penjelasan:</h6>
                            <ul class="small">
                                <li><strong>Thread:</strong> Mendapat bobot 3 karena membuat diskusi baru membutuhkan inisiatif lebih</li>
                                <li><strong>Post:</strong> Mendapat bobot 1 sebagai partisipasi dalam diskusi</li>
                                <li><strong>Aktivitas Bulan Ini:</strong> Mendapat bobot 2 untuk mengukur konsistensi engagement</li>
                                <li><strong>Total Score:</strong> Maksimal 100 untuk normalisasi</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<style>
.card {
    transition: transform 0.2s ease-in-out;
}

.progress {
    border-radius: 3px;
}

.table tbody tr:hover {
    background-color: rgba(0,123,255,0.05);
}

.badge.fs-6 {
    font-size: 0.875rem !important;
    padding: 0.375rem 0.75rem;
}

.progress-bar {
    transition: width 0.3s ease-in-out;
}
</style>
@endsection
