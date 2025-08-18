@extends('layouts.app')
@section('title', 'Materi Edukasi')

@section('content')
<div class="card shadow rounded-4">
    <div class="card-header bg-primary text-white fw-bold fs-5 rounded-top-4">
        Materi Edukasi
    </div>
    <div class="card-body">
        <a href="{{ route('admin.materi.create') }}" class="btn btn-primary mb-3">+ Tambah Materi</a>
        <a href="{{ route('admin.dashboard') }}" class="btn btn-secondary mb-3">Kembali</a>

        <div class="card card-custom-border mb-4">
            <div class="card-body">
                <form action="{{ route('admin.materi.index') }}" method="GET">
                    <div class="row g-3 align-items-end">
                        <div class="col-md-4">
                            <label for="filter_kategori" class="form-label">Filter Kategori:</label>
                            <select name="kategori" id="filter_kategori" class="form-select">
                                <option value="">Semua Kategori</option>
                                <option value="pola_hidup_sehat" {{ request('kategori') == 'pola_hidup_sehat' ? 'selected' : '' }}>Pola Hidup Sehat</option>
                                <option value="reproduksi" {{ request('kategori') == 'reproduksi' ? 'selected' : '' }}>Reproduksi</option>
                                <option value="kesehatan_mental" {{ request('kategori') == 'kesehatan_mental' ? 'selected' : '' }}>Kesehatan Mental</option>
                                <option value="gizi" {{ request('kategori') == 'gizi' ? 'selected' : '' }}>Gizi</option>
                                <option value="narkoba" {{ request('kategori') == 'narkoba' ? 'selected' : '' }}>Narkoba</option>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <label for="filter_created_date" class="form-label">Filter Tanggal Dibuat:</label>
                            <input type="date" name="created_date" id="filter_created_date" class="form-control" value="{{ request('created_date') }}">
                        </div>
                        <div class="col-md-4">
                            <button type="submit" class="btn btn-primary">Terapkan Filter</button>
                            <a href="{{ route('admin.materi.index') }}" class="btn btn-secondary">Reset Filter</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        @if($materis->isEmpty())
            <div class="alert alert-info">
                Belum ada materi yang tersedia dalam kategori ini.
            </div>
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
            <table class="table table-striped table-bordered table-hover align-middle table-custom-border">
                    <thead class="table-primary text-center">
                        <tr>
                            <th scope="col">Judul</th>
                            <th scope="col">Deskripsi</th>
                            <th scope="col">Tipe</th>
                            <th scope="col">Kategori
                                <a href="{{ route('admin.materi.index', array_merge(request()->query(), ['sort_by' => 'kategori', 'sort_order' => request('sort_by') == 'kategori' && request('sort_order') == 'asc' ? 'desc' : 'asc'])) }}" class="text-decoration-none text-dark">
                                    @if(request('sort_by') == 'kategori')
                                        @if(request('sort_order') == 'asc')
                                            ▲
                                        @else
                                            ▼
                                        @endif
                                    @else
                                        △
                                    @endif
                                </a>
                            </th>
                            <th scope="col">Sumber</th>
                            <th scope="col">Create Date
                                <a href="{{ route('admin.materi.index', array_merge(request()->query(), ['sort_by' => 'created_at', 'sort_order' => request('sort_by') == 'created_at' && request('sort_order') == 'asc' ? 'desc' : 'asc'])) }}" class="text-decoration-none text-dark">
                                    @if(request('sort_by') == 'created_at')
                                        @if(request('sort_order') == 'asc')
                                            ▲
                                        @else
                                            ▼
                                        @endif
                                    @else
                                        △
                                    @endif
                                </a>
                            </th>
                            <th scope="col" style="width: 25%;">Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($materis as $materi)
                            <tr>
                                <td>{{ $materi->judul }}</td>
                                <td>{{ Str::limit($materi->deskripsi, 100) }}</td>
                                <td class="text-center">{{ strtoupper($materi->jenis) }}</td>
                                <td>{{ ucfirst(str_replace('_', ' ', $materi->kategori)) }}</td>
                                <td>{{ $materi->sumber }}</td>
                                <td>{{ $materi->created_at->format('d M Y H:i:s') }}</td>
                                <td class="text-center">
                                    <a href="{{ route('admin.materi.edit', $materi->id) }}" class="btn btn-warning btn-sm mb-1">
                                        <i class="bi bi-pencil"></i> Edit
                                    </a>
                                    <form action="{{ route('admin.materi.destroy', $materi->id) }}" method="POST" class="d-inline">
                                        @csrf
                                        @method('DELETE')
                                        <button type="submit" class="btn btn-danger btn-sm mb-1" onclick="return confirm('Apakah Anda yakin ingin menghapus materi ini?')">
                                            <i class="bi bi-trash"></i> Delete
                                        </button>
                                    </form>
                                    <a href="{{ route('admin.materi.show', $materi->id) }}" class="btn btn-info btn-sm mb-1">
                                        <i class="bi bi-eye"></i> Lihat Detail
                                    </a>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
    </div>
</div>

@if($materis->hasPages())
<div class="d-flex justify-content-center mt-4">
    {{ $materis->links('pagination::bootstrap-5') }}
</div>
@endif

        @endif
        </div>
</div>
<!-- Detail Materi Modal -->
<div class="modal fade" id="detailMateriModal" tabindex="-1" aria-labelledby="detailMateriModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="detailMateriModalLabel">Detail Materi</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body" id="detailMateriContent">
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
        var detailMateriModal = document.getElementById('detailMateriModal');
        detailMateriModal.addEventListener('show.bs.modal', function (event) {
            var button = event.relatedTarget; // Button that triggered the modal
            var materiId = button.getAttribute('data-materi-id'); // Extract info from data-materi-id attribute

            var modalBody = detailMateriModal.querySelector('#detailMateriContent');
            modalBody.innerHTML = `
                <div class="d-flex justify-content-center">
                    <div class="spinner-border text-primary" role="status">
                        <span class="visually-hidden">Loading...</span>
                    </div>
                </div>
            `; // Show spinner while loading

            // Fetch the content
            fetch(`/admin/materi/${materiId}/detail`)
                .then(response => response.text())
                .then(html => {
                    modalBody.innerHTML = html;
                })
                .catch(error => {
                    console.error('Error loading materi detail:', error);
                    modalBody.innerHTML = '<div class="alert alert-danger">Gagal memuat detail materi.</div>';
                });
        });

        // Reset video/audio when modal is closed
        detailMateriModal.addEventListener('hidden.bs.modal', function () {
            var videoPlayer = detailMateriModal.querySelector('#materiVideo');
            if (videoPlayer) {
                videoPlayer.pause();
            }
            var pdfViewer = detailMateriModal.querySelector('iframe');
            if (pdfViewer) {
                pdfViewer.src = ''; // Clear iframe content
            }
        });
    });
</script>
@endpush
