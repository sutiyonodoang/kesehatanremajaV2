@extends('layouts.app')
@section('title', $materi->judul)

@section('content')
<div class="card shadow rounded-4">
    <div class="card-header bg-primary text-white fw-bold fs-5 rounded-top-4">
        {{ $materi->judul }}
    </div>
    <div class="card-body">

        <p><strong>Kategori:</strong> {{ ucfirst(str_replace('_', ' ', $materi->kategori)) }}</p>
        <p><strong>Tipe:</strong> {{ strtoupper($materi->jenis) }}</p>
        <p>{{ $materi->deskripsi }}</p>

        {{-- Media --}}
        @if($materi->jenis === 'link')
            <a href="{{ $materi->link }}" target="_blank" class="btn btn-outline-info">Buka Link</a>
        @elseif($materi->jenis === 'video')
            <!-- Button to trigger modal -->
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#videoModal">
                🎥 Tonton Video
            </button>
        @elseif(in_array($materi->jenis, ['pdf', 'doc']))
            <a href="{{ asset('storage/' . $materi->file_path) }}" class="btn btn-success me-2" target="_blank">
                📥 Unduh {{ strtoupper($materi->jenis) }}
            </a>
            <button type="button" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#pdfModal">
                📖 Baca Materi
            </button>
        @endif

        {{-- Like & Comment Buttons --}}
        <div class="mt-3">
            <button class="btn btn-danger btn-sm" disabled>
                ❤️ Suka ({{ $materi->likes_count }})
            </button>
            <button class="btn btn-outline-primary btn-sm" disabled>
                💬 Komentar ({{ $materi->komentar_count ?? 0 }})
            </button>
        </div>

        {{-- Komentar --}}
        <div class="mt-4">
            <h6>Komentar</h6>
            @forelse($materi->komentar as $komen)
                <div class="mb-2">
                    <strong>{{ $komen->user->name }}</strong>
                    <small class="text-muted">{{ $komen->created_at->diffForHumans() }}</small>
                    <p>{{ $komen->isi_komentar }}</p>

                    {{-- Tampilkan balasan admin jika ada --}}
                    @if($komen->balasan_admin)
                        <div class="mt-2 ms-3 ps-3 border-start border-3 border-primary bg-light p-2 rounded">
                            <strong class="text-primary">Admin</strong>
                            <p class="mb-0">{{ $komen->balasan_admin }}</p>
                        </div>
                    @else
                        {{-- Form balasan admin --}}
                        <form method="POST" action="{{ route('admin.komentar.balas', $komen) }}" class="mt-2 ms-3 ps-3">
                            @csrf
                            <div class="mb-3">
                                <textarea name="balasan_admin" class="form-control" rows="2" placeholder="Tulis balasan Anda..." required></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary btn-sm">Balas</button>
                        </form>
                    @endif
                </div>
            @empty
                <p class="text-muted">Belum ada komentar.</p>
            @endforelse
        </div>

        <a href="{{ route('admin.materi.index') }}" class="btn btn-secondary mt-4">Kembali</a>
    </div>
</div>

@if($materi->jenis === 'video')
<!-- Video Modal -->
<div class="modal fade" id="videoModal" tabindex="-1" aria-labelledby="videoModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="videoModalLabel">{{ $materi->judul }}</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body p-0">
                <video id="materiVideo" controls width="100%" src="{{ route('admin.materi.stream', $materi) }}">
                    Browser Anda tidak mendukung video.
                </video>
            </div>
        </div>
    </div>
</div>
@endif

@if(in_array($materi->jenis, ['pdf', 'doc']))
<!-- PDF Modal -->
<div class="modal fade" id="pdfModal" tabindex="-1" aria-labelledby="pdfModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="pdfModalLabel">{{ $materi->judul }}</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body p-0">
                <iframe src="{{ route('admin.materi.stream', $materi) }}" width="100%" height="600px" style="border: none;"></iframe>
            </div>
        </div>
    </div>
</div>
@endif

@endsection

@push('scripts')
<script>
    document.addEventListener('DOMContentLoaded', function () {
        var videoModal = document.getElementById('videoModal');
        if (videoModal) {
            var videoPlayer = document.getElementById('materiVideo');
            videoModal.addEventListener('hidden.bs.modal', function () {
                videoPlayer.pause();
            });
        }
    });
</script>
@endpush