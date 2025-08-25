@extends('layouts.app')

@section('title', 'Dashboard User')

@section('content')
<div class="row">
    <div class="col-12 mb-4">
        <div class="card shadow rounded-4 border-0">
            <div class="card-body bg-primary text-white rounded-top-4">
                <h4 class="fw-bold mb-0">Selamat Datang, {{ Auth::user()->name }}!</h4>
                <p class="mb-0">Bangun pemahaman kesehatan yang komprehensif melalui pembelajaran interaktif</p>
            </div>
        </div>
    </div>

    <div class="col-12 mb-4">
        <div class="card shadow rounded-4 border-0">
            <div class="card-body rounded-4" style="background-color: #b8d4e3; color: #2c3e50;">
                <h5 class="fw-bold mb-0">Progres Belajar Anda: {{ $overallProgress }}%</h5>
                <div class="progress mt-2" style="height: 25px;">
                    @if($overallProgress >= 80)
                        <div class="progress-bar bg-warning text-dark fw-bold" style="width: {{ $overallProgress }}%">
                            {{ $overallProgress }}%
                        </div>
                    @elseif($overallProgress >= 60)
                        <div class="progress-bar bg-success text-white fw-bold" style="width: {{ $overallProgress }}%">
                            {{ $overallProgress }}%
                        </div>
                    @elseif($overallProgress >= 40)
                        <div class="progress-bar bg-primary text-white fw-bold" style="width: {{ $overallProgress }}%">
                            {{ $overallProgress }}%
                        </div>
                    @else
                        <div class="progress-bar bg-secondary text-white fw-bold" style="width: {{ $overallProgress }}%">
                            {{ $overallProgress }}%
                        </div>
                    @endif
                </div>
                <p class="mb-0 mt-2">Terus tingkatkan pengetahuan Anda!</p>
            </div>
        </div>
    </div>

    <div class="col-md-3 mb-4">
        <div class="card text-white shadow rounded-4 border-0" style="background-color: #5bc0de;">
            <div class="card-body">
                <div class="text-center">
                <div class="feature-icon text-center fs-2">🔎</div>
                <h5 class="card-title fw-bold text-center">Informasi Kesehatan</h5>
                <a href="{{ route('user.informasi-kesehatan.index') }}" class="btn btn-light btn-sm">Lihat</a>
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
                <a href="{{ route('user.materi.index') }}" class="btn btn-light btn-sm">Lihat</a>
            </div>
        </div>
</div>
    </div>

    <div class="col-md-3 mb-4">
        <div class="card text-white shadow rounded-4 border-0" style="background-color: #f0ad4e;">
            <div class="card-body">
                <div class="feature-icon text-center fs-2">🎥</div>
                <h5 class="card-title fw-bold text-center">Zoom Meeting</h5>
                <div class="text-center">
                <a href="{{ route('user.zoom-rooms.index') }}" class="btn btn-light btn-sm ">Lihat</a>
            </div>
            </div>
        </div>
    </div>

    <div class="col-md-3 mb-4">
        <div class="card text-white shadow rounded-4 border-0" style="background-color: #6c757d;">
            <div class="card-body">
                <div class="text-center">
                <div class="feature-icon text-center fs-2">💬</div>
                <h5 class="card-title fw-bold text-center">Konsultasi</h5>
                <a href="{{ route('user.consultations.index') }}" class="btn btn-light btn-sm">Lihat</a>
            </div>
        </div>
    </div>
    </div>

    <div class="col-md-3 mb-4">
        <div class="card text-white shadow rounded-4 border-0" style="background-color: #17a2b8;">
            <div class="card-body">
                <div class="text-center">
                    <div class="feature-icon text-center fs-2">🗨️</div>
                    <h5 class="card-title fw-bold text-center">Forum Diskusi</h5>
                    <a href="{{ route('forum.index') }}" class="btn btn-light btn-sm">Diskusi</a>
                </div>
            </div>
        </div>
    </div>
    
@endsection
