@extends('layouts.app')

@section('title', 'Dashboard Admin')

@section('content')
<div class="row">
    <div class="col-12 mb-4">
        <div class="card shadow rounded-4 border-0">
            <div class="card-body bg-primary text-white rounded-top-4">
                <h4 class="fw-bold mb-0">Selamat Datang, {{ Auth::user()->name }}!</h4>
                <p class="mb-0">Kelola Informasi Kesehatan, Materi Kesehatan, sesi Zoom, Konsultasi dan Pengguna dengan mudah.</p>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-3 mb-4">
        <div class="card text-white shadow rounded-4 border-0" style="background-color: #5bc0de;">
            <div class="card-body">
                <div class="text-center">
                    <div class="feature-icon text-center fs-2">🔎</div>
                    <h5 class="card-title fw-bold text-center">Informasi Kesehatan</h5>
                    <a href="{{ route('admin.informasi-kesehatan.index') }}" class="btn btn-light btn-sm">Kelola</a>
                </div>
            </div>
        </div>
    </div>

    <div class="col-md-3 mb-4">
        <div class="card text-white shadow rounded-4 border-0" style="background-color: #5cb85c;">
            <div class="card-body">
                <div class="text-center">
                    <div class="feature-icon text-center fs-2">📚</div>
                    <h5 class="card-title fw-bold text-center">Materi Edukasi</h5>
                    <a href="{{ route('admin.materi.index') }}" class="btn btn-light btn-sm">Kelola</a>
                </div>
            </div>
        </div>
    </div>

    <div class="col-md-3 mb-4">
        <div class="card text-white shadow rounded-4 border-0" style="background-color: #f0ad4e;">
            <div class="card-body">
                <div class="text-center">
                    <div class="feature-icon text-center fs-2">🎥</div>
                    <h5 class="card-title fw-bold text-center">Zoom Meeting</h5>
                    <a href="{{ route('admin.zoom-rooms.index') }}" class="btn btn-light btn-sm">Kelola</a>
                </div>
            </div>
        </div>
    </div>

    <div class="col-md-3 mb-4">
        <div class="card text-white shadow rounded-4 border-0" style="background-color: #d9534f;">
            <div class="card-body">
                <div class="text-center">
                    <div class="feature-icon text-center fs-2">🛈</div>
                    <h5 class="card-title fw-bold text-center">Manajemen Pengguna</h5>
                    <a href="{{ route('admin.users.index') }}" class="btn btn-light btn-sm">Kelola</a>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-3 mb-4">
        <div class="card text-white shadow rounded-4 border-0" style="background-color: #6A0DAD;">
            <div class="card-body">
                <div class="text-center">
                    <div class="feature-icon text-center fs-2">💬</div>
                    <h5 class="card-title fw-bold text-center">
                        Konsultasi
                        @if($unfinishedConsultationsCount > 0)
                            <span class="badge bg-danger rounded-pill ms-2">{{ $unfinishedConsultationsCount }}</span>
                        @endif
                    </h5>
                    <a href="{{ route('admin.consultations.index') }}" class="btn btn-light btn-sm">Kelola</a>
                </div>
            </div>
        </div>
    </div>

    <!-- <div class="col-md-3 mb-4">
        <div class="card text-white shadow rounded-4 border-0" style="background-color: #4682B4;">
            <div class="card-body">
                <div class="text-center">
                    <div class="feature-icon text-center fs-2">📊</div>
                    <h5 class="card-title fw-bold text-center">Laporan Komprehensif</h5>
                    <a href="{{ route('admin.reports.index') }}" class="btn btn-light btn-sm">Lihat</a>
                </div>
            </div>
        </div>
    </div> -->

    <div class="col-md-3 mb-4">
        <div class="card text-white shadow rounded-4 border-0" style="background-color: #17a2b8;">
            <div class="card-body">
                <div class="text-center">
                    <div class="feature-icon text-center fs-2">🗨️</div>
                    <h5 class="card-title fw-bold text-center">Forum Diskusi</h5>
                    <a href="{{ route('forum.index') }}" class="btn btn-light btn-sm">Kelola</a>
                </div>
            </div>
        </div>
    </div>

    <div class="col-md-3 mb-4">
        <div class="card text-white shadow rounded-4 border-0" style="background-color: #153147ff;">
            <div class="card-body">
                <div class="text-center">
                    <div class="feature-icon text-center fs-2">📈</div>
                    <h5 class="card-title fw-bold text-center">Laporan Komprehensif</h5>
                    <a href="{{ route('admin.reports.index') }}" class="btn btn-light btn-sm">Lihat</a>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection