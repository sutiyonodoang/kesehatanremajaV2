@extends('layouts.app')
@section('title', 'Zoom Meeting')

@section('content')
<div class="mb-3">
    <a href="{{ route('user.dashboard') }}" class="btn btn-secondary">
        <i class="bi bi-arrow-left"></i> Kembali
    </a>
</div>

<div class="card shadow rounded-4">
    <div class="card-header bg-primary text-white fw-bold fs-5 rounded-top-4">
        Jadwal Zoom Meeting
    </div>
    <div class="card-body">
        @if($zoomRooms->isEmpty())
            <p class="text-muted">Belum ada jadwal Zoom yang tersedia.</p>
        @else
            <div class="row g-2">
                @foreach($zoomRooms as $room)
                    @php
                        $completed = in_array($room->id, $completedZoomRoomIds);
                        $viewed = in_array($room->id, $viewedZoomRoomIds);
                    @endphp
                    <div class="col-12 col-md-6">
                        <div class="border border-dark border-2 rounded shadow-sm bg-light p-3" data-room-id="{{ $room->id }}">
                            <h5 class="fw-bold text-primary mb-2">
                                {{ $room->judul }}
                                @if($completed)
                                    <span class="badge bg-success ms-2 status-badge">Selesai</span>
                                @endif
                            </h5>
                            <p class="mb-2"><strong>Jadwal:</strong> {{ \Carbon\Carbon::parse($room->jadwal)->format('d M Y - H:i') }}</p>
                            <div class="d-flex gap-2 flex-wrap">
                                <button
                                    type="button"
                                    class="btn btn-sm btn-info view-detail-btn"
                                    data-id="{{ $room->id }}"
                                    data-bs-toggle="modal"
                                    data-bs-target="#zoomDetailModal">
                                    Lihat Detail
                                </button>
                                <button
                                    type="button"
                                    class="btn btn-sm btn-success attended-btn"
                                    data-id="{{ $room->id }}"
                                    @if(!$viewed || $completed) disabled @endif>
                                    Saya sudah mengikuti Zoom
                                </button>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>

            {{-- Pagination --}}
            <div class="d-flex justify-content-center mt-4">
                {{ $zoomRooms->links('pagination::bootstrap-5') }}
            </div>
        @endif
    </div>
</div>

<!-- Zoom Detail Modal -->
<div class="modal fade" id="zoomDetailModal" tabindex="-1" aria-labelledby="zoomDetailModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="zoomDetailModalLabel">Detail Zoom Meeting</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body" id="zoomDetailContent">
                <div class="text-center">
                    <div class="spinner-border text-primary" role="status">
                        <span class="visually-hidden">Loading...</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

@push('scripts')
<script>
// Return a Promise so callers can await UI updates
if (typeof trackProgress === 'undefined') {
    function trackProgress(contentType, contentId) {
        return fetch('{{ route('user.track-progress') }}', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-TOKEN': '{{ csrf_token() }}'
            },
            body: JSON.stringify({ content_type: contentType, content_id: contentId })
        }).then(response => {
            if (!response.ok) {
                return response.json().then(errorData => {
                    throw new Error(errorData.message || 'Server error');
                });
            }
            return response.json();
        });
    }
}

function enableAttendedButton(roomId) {
    const btn = document.querySelector(`.attended-btn[data-id="${roomId}"]`);
    if (btn) btn.disabled = false;
}

function disableAttendedButton(roomId) {
    const btn = document.querySelector(`.attended-btn[data-id="${roomId}"]`);
    if (btn) btn.disabled = true;
}

function markAsCompleted(roomId) {
    const container = document.querySelector(`[data-room-id="${roomId}"]`);
    if (!container) return;
    // Add badge if not exists
    const header = container.querySelector('h5');
    if (header && !header.querySelector('.status-badge')) {
        const span = document.createElement('span');
        span.className = 'badge bg-success ms-2 status-badge';
        span.textContent = 'Selesai';
        header.appendChild(span);
    }
}

function loadZoomDetail(roomId) {
    const content = document.getElementById('zoomDetailContent');
    if (!content) return;
    content.innerHTML = `
        <div class="text-center">
            <div class="spinner-border text-primary" role="status">
                <span class="visually-hidden">Loading...</span>
            </div>
        </div>
    `;

    fetch(`/user/zoom-rooms/${roomId}/get-detail`)
        .then(response => {
            if (!response.ok) throw new Error('Gagal memuat detail');
            return response.text();
        })
        .then(html => {
            content.innerHTML = html;
        })
        .catch(() => {
            content.innerHTML = '<div class="alert alert-danger">Gagal memuat detail zoom meeting.</div>';
        });
}

document.addEventListener('DOMContentLoaded', function () {
    // Modal: when showing, mark viewed and enable attended button, then load content
    const zoomDetailModal = document.getElementById('zoomDetailModal');
    if (zoomDetailModal) {
        zoomDetailModal.addEventListener('show.bs.modal', function (event) {
            const triggerBtn = event.relatedTarget;
            if (!triggerBtn) return;
            const roomId = triggerBtn.getAttribute('data-id');

            // Check if this room is already completed
            const container = document.querySelector(`[data-room-id="${roomId}"]`);
            const isCompleted = container && container.querySelector('.status-badge');
            
            // Only enable attended button if not completed
            if (!isCompleted) {
                enableAttendedButton(roomId);
            }

            // Track that detail has been viewed (idempotent on server)
            trackProgress('zoom_detail_viewed', parseInt(roomId)).catch(() => {});

            // Load detail into modal
            loadZoomDetail(roomId);
        });

        zoomDetailModal.addEventListener('hidden.bs.modal', function () {
            const content = document.getElementById('zoomDetailContent');
            if (content) {
                content.innerHTML = `
                    <div class="text-center">
                        <div class="spinner-border text-primary" role="status">
                            <span class="visually-hidden">Loading...</span>
                        </div>
                    </div>
                `;
            }
        });
    }

    // Handle attended button click once
    document.querySelectorAll('.attended-btn').forEach(function (btn) {
        btn.addEventListener('click', function () {
            const roomId = parseInt(btn.getAttribute('data-id'));
            // Prevent double submissions
            if (btn.disabled) return;
            btn.disabled = true;

            // Mark completion server-side using content_type that drives the badge logic
            trackProgress('zoom_room', roomId)
                .then(() => {
                    markAsCompleted(roomId);
                    disableAttendedButton(roomId); // Keep disabled permanently after completion
                })
                .catch(() => {
                    // Re-enable if failed so user can retry
                    btn.disabled = false;
                });
        }, { once: false });
    });
});
</script>
@endpush

@endsection