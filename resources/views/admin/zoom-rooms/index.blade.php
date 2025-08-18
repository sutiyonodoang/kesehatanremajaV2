@extends('layouts.app')

@section('title', 'Daftar Zoom Meeting')

@section('content')
<div class="card shadow rounded-4">
    <div class="card-header bg-primary text-white fw-bold fs-5 rounded-top-4">
        Daftar Zoom Meeting
    </div>
    <div class="card-body">
        <a href="{{ route('admin.zoom-rooms.create') }}" class="btn btn-primary mb-3">+ Buat Zoom Meeting</a>
        <a href="{{ route('admin.dashboard') }}" class="btn btn-secondary mb-3">Kembali</a>



        @if(session('success'))
            <div class="alert alert-success">{{ session('success') }}</div>
        @endif

        @if($zoomRooms->isEmpty())
            <p class="text-muted">Belum ada Zoom meeting dibuat.</p>
        @else
            <div class="card card-custom-border">
    <div class="card-body">
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
            <table class="table table-bordered table-striped align-middle table-custom-border">
                    <thead class="table-primary text-center">
                        <tr>
                            <th>No</th>
                            <th>Judul</th>
                            <th>Deskripsi</th>
                            <th>Link</th>
                            <th>Jadwal</th>
                            <th>Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($zoomRooms as $zoom)
                        <tr>
                            <td class="text-center">{{ $loop->iteration }}</td>
                            <td>{{ $zoom->judul }}</td>
                            <td>{{ $zoom->deskripsi ?? '-' }}</td>
                            <td class="text-center">
                                <a href="{{ $zoom->link_meeting }}" target="_blank" class="btn btn-sm btn-info">Join</a>
                            </td>
                            <td class="text-center">{{ \Carbon\Carbon::parse($zoom->jadwal)->format('d-m-Y H:i') }}</td>
                            <td class="text-center">
                                <button type="button" class="btn btn-sm btn-info mb-1" data-bs-toggle="modal" data-bs-target="#detailZoomModal" data-zoom-id="{{ $zoom->id }}">
                                    Lihat Detail
                                </button>
                                <form action="{{ route('admin.zoom-rooms.destroy', $zoom->id) }}" method="POST" onsubmit="return confirm('Yakin ingin menghapus meeting ini?')" class="d-inline">
                                    @csrf
                                    @method('DELETE')
                                    <button class="btn btn-sm btn-danger">Hapus</button>
                                </form>
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
    </div>
</div>

            <div class="d-flex justify-content-center mt-3">
                {{ $zoomRooms->links('pagination::bootstrap-5') }}
            </div>
        @endif
    </div>
</div>
<!-- Detail Zoom Modal -->
<div class="modal fade" id="detailZoomModal" tabindex="-1" aria-labelledby="detailZoomModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="detailZoomModalLabel">Detail Zoom Meeting</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body" id="detailZoomContent">
                <!-- Content will be loaded here -->
                <div class="d-flex justify-content-center">
                    <div class="spinner-border text-primary" role="status">
                        <span class="visually-hidden">Loading...</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

@endsection

@push('scripts')
<script>
    document.addEventListener('DOMContentLoaded', function () {
        var detailZoomModal = document.getElementById('detailZoomModal');
        detailZoomModal.addEventListener('show.bs.modal', function (event) {
            var button = event.relatedTarget; // Button that triggered the modal
            var zoomId = button.getAttribute('data-zoom-id'); // Extract info from data-zoom-id attribute

            var modalBody = detailZoomModal.querySelector('#detailZoomContent');
            modalBody.innerHTML = `
                <div class="d-flex justify-content-center">
                    <div class="spinner-border text-primary" role="status">
                        <span class="visually-hidden">Loading...</span>
                    </div>
                </div>
            `; // Show spinner while loading

            // Fetch the content
            fetch(`/admin/zoom-rooms/${zoomId}`) // This will hit the show method
                .then(response => response.text())
                .then(html => {
                    modalBody.innerHTML = html;
                })
                .catch(error => {
                    console.error('Error loading zoom detail:', error);
                    modalBody.innerHTML = '<div class="alert alert-danger">Gagal memuat detail Zoom.</div>';
                });
        });
    });
</script>
@endpush