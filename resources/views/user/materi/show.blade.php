@extends('layouts.app')
@section('title', $materi->judul)

@section('content')
<div class="mb-3">
    <a href="{{ route('user.materi.index') }}" class="btn btn-secondary">
        <i class="bi bi-arrow-left"></i> Kembali
    </a>
</div>

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
            <a href="{{ $materi->link }}" target="_blank" class="btn btn-info">Buka Link</a>
        @elseif($materi->jenis === 'video')
            <div class="row">
                <div class="col-md-9"> {{-- 70% width for video --}}
                    <video id="materiVideo" controls width="100%" src="{{ route('user.materi.stream', $materi) }}">
                        Browser Anda tidak mendukung video.
                    </video>
                    @if($isVideoWatched)
                        <span class="badge bg-success mt-2">Selesai Tonton</span>
                    @endif
                </div>
                <div class="col-md-3"> {{-- 30% width for comments/likes --}}
                    {{-- Like & Comment Buttons --}}
                    <div class="mt-3">
                        <form action="{{ route('user.materi.like.toggle', $materi) }}" method="POST" class="d-inline-block me-2">
                            @csrf
                            <button type="submit" class="btn btn-danger btn-sm">
                                ❤️ Suka ({{ $materi->likes_count }})
                            </button>
                        </form>
                        <button class="btn btn-outline-primary btn-sm" disabled>
                            💬 Komentar ({{ $materi->komentar_count ?? 0 }})
                        </button>
                    </div>

                    {{-- Komentar --}}
                    <div class="mt-4">
                        <h6>Komentar</h6>
                        <form method="POST" action="{{ route('user.materi.komentar.store', $materi) }}">
                            @csrf
                            <div class="mb-3">
                                <textarea name="isi_komentar" class="form-control" rows="3" placeholder="Tulis komentar Anda..." required></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary btn-sm">Kirim Komentar</button>
                        </form>

                        <hr>
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
                                @endif
                            </div>
                        @empty
                            <p class="text-muted">Belum ada komentar.</p>
                        @endforelse
                    </div>
                </div>
            </div>
        @elseif(in_array($materi->jenis, ['pdf', 'doc']))
            <div class="mb-3">
                <a href="{{ route('user.materi.download', $materi) }}" class="btn btn-success me-2">
                    📥 Unduh {{ strtoupper($materi->jenis) }} ({{ $materi->downloads_count ?? 0 }})
                </a>
                @if($isPdfDownloaded)
                    <span class="badge bg-success ms-2">Selesai Unduh</span>
                @endif
                <button type="button" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#pdfModal">
                    📖 Baca {{ strtoupper($materi->jenis) }}
                </button>
                @if($isPdfScrolled)
                    <span class="badge bg-success ms-2">Selesai Baca</span>
                @endif
            </div>

            {{-- Like & Comment Buttons --}}
            <div class="mt-3">
                <form action="{{ route('user.materi.like.toggle', $materi) }}" method="POST" class="d-inline-block me-2">
                    @csrf
                    <button type="submit" class="btn btn-danger btn-sm">
                        ❤️ Suka ({{ $materi->likes_count }})
                    </button>
                </form>
                <button class="btn btn-outline-primary btn-sm" disabled>
                    💬 Komentar ({{ $materi->komentar_count ?? 0 }})
                </button>
            </div>

            {{-- Komentar --}}
            <div class="mt-4">
                <h6>Komentar</h6>
                <form method="POST" action="{{ route('user.materi.komentar.store', $materi) }}">
                    @csrf
                    <div class="mb-3">
                        <textarea name="isi_komentar" class="form-control" rows="3" placeholder="Tulis komentar Anda..." required></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary btn-sm">Kirim Komentar</button>
                </form>

                <hr>
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
                        @endif
                    </div>
                @empty
                    <p class="text-muted">Belum ada komentar.</p>
                @endforelse
            </div>

        @endif {{-- Closing the main @if($materi->jenis === 'link') block --}}

    </div>
</div>

@if(in_array($materi->jenis, ['pdf', 'doc']))
<!-- PDF Modal -->
<div class="modal fade" id="pdfModal" tabindex="-1" aria-labelledby="pdfModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl modal-dialog-centered modal-fullscreen-sm-down"> {{-- Added modal-fullscreen-sm-down --}}
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="pdfModalLabel">{{ $materi->judul }}</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body"> {{-- Removed p-0 --}}
                <iframe id="pdfViewer" src="{{ route('user.materi.stream', $materi) }}" width="100%" height="600px" style="border: none;"></iframe>
            </div>
        </div>
    </div>
</div>
@endif

@endsection

@push('scripts')
<script>
    // Function to track progress (re-used from previous step)
    function trackProgress(contentType, contentId) {
        console.log('trackProgress called for:', contentType, contentId);
        fetch('{{ route('user.track-progress') }}', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-TOKEN': '{{ csrf_token() }}'
            },
            body: JSON.stringify({
                content_type: contentType,
                content_id: contentId
            })
        })
        .then(response => {
            console.log('trackProgress fetch response:', response);
            return response.json();
        })
        .then(data => {
            console.log('trackProgress success:', data.message);
        })
        .catch(error => {
            console.error('Error tracking progress:', error);
        });
    }

    document.addEventListener('DOMContentLoaded', function () {
        // Video Tracking (updated for direct embed)
        var videoPlayer = document.getElementById('materiVideo');
        if (videoPlayer) {
            var videoTracked = false; // Flag to track only once
            console.log('Video player found.');

            videoPlayer.addEventListener('timeupdate', function() {
                console.log('timeupdate event fired. CurrentTime:', videoPlayer.currentTime, 'Duration:', videoPlayer.duration);
                if (!videoTracked && videoPlayer.duration > 0 && videoPlayer.currentTime >= (videoPlayer.duration * 0.5)) {
                    console.log('50% threshold reached. Calling trackProgress for video.');
                    trackProgress('materi_video', {{ $materi->id }});
                    videoTracked = true;
                }
            });
        }

        // PDF Scroll Tracking
        var pdfModal = document.getElementById('pdfModal');
        if (pdfModal) {
            var pdfViewer = document.getElementById('pdfViewer');
            var pdfTracked = false; // Flag to track only once

            pdfModal.addEventListener('shown.bs.modal', function () {
                // Ensure iframe content is loaded before trying to access its document
                pdfViewer.onload = function() {
                    try {
                        var iframeDoc = pdfViewer.contentDocument || pdfViewer.contentWindow.document;
                        var scrollableElement = iframeDoc.documentElement; // Or iframeDoc.body if that's the scrollable one

                        scrollableElement.addEventListener('scroll', function() {
                            if (!pdfTracked) {
                                var scrollHeight = scrollableElement.scrollHeight;
                                var scrollTop = scrollableElement.scrollTop;
                                var clientHeight = scrollableElement.clientHeight;

                                // Calculate scroll percentage
                                var scrollPercentage = (scrollTop + clientHeight) / scrollHeight;

                                if (scrollPercentage >= 0.99) { // 99% to account for minor discrepancies
                                    trackProgress('materi_pdf_scroll', {{ $materi->id }});
                                    pdfTracked = true;
                                }
                            }
                        });
                    } catch (e) {
                        console.error('Could not access iframe content (possibly cross-origin or not loaded yet):', e);
                    }
                };
            });
        }
    });
</script>
@endpush
