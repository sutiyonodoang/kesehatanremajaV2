@extends('layouts.app')
@section('title', 'Materi Edukasi')

@section('content')
<div class="mb-3">
    <a href="{{ route('user.dashboard') }}" class="btn btn-secondary">
        <i class="bi bi-arrow-left"></i> Kembali
    </a>
</div>

<div class="card shadow rounded-4">
    <div class="card-header bg-primary text-white rounded-top-4">
        <h5 class="fw-bold mb-0">Materi Edukasi</h5>
    </div>
    <div class="card-body">
        <ul class="nav nav-tabs mb-3">
            <li class="nav-item">
                <a class="nav-link {{ request('kategori') == '' ? 'active' : '' }}" href="{{ route('user.materi.index') }}">Semua</a>
            </li>
            <li class="nav-item">
                <a class="nav-link {{ request('kategori') == 'pola_hidup_sehat' ? 'active' : '' }}" href="{{ route('user.materi.index', ['kategori' => 'pola_hidup_sehat']) }}">Pola Hidup Sehat</a>
            </li>
            <li class="nav-item">
                <a class="nav-link {{ request('kategori') == 'reproduksi' ? 'active' : '' }}" href="{{ route('user.materi.index', ['kategori' => 'reproduksi']) }}">Reproduksi</a>
            </li>
            <li class="nav-item">
                <a class="nav-link {{ request('kategori') == 'kesehatan_mental' ? 'active' : '' }}" href="{{ route('user.materi.index', ['kategori' => 'kesehatan_mental']) }}">Kesehatan Mental</a>
            </li>
            <li class="nav-item">
                <a class="nav-link {{ request('kategori') == 'gizi' ? 'active' : '' }}" href="{{ route('user.materi.index', ['kategori' => 'gizi']) }}">Gizi</a>
            </li>
            <li class="nav-item">
                <a class="nav-link {{ request('kategori') == 'narkoba' ? 'active' : '' }}" href="{{ route('user.materi.index', ['kategori' => 'narkoba']) }}">Narkoba</a>
            </li>
        </ul>

        @if($materis->isEmpty())
            <div class="alert alert-info">
                Belum ada materi yang tersedia dalam kategori ini.
            </div>
        @else
            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover align-middle">
                    <thead class="table-light text-center">
                        <tr>
                            <th scope="col">Judul <i class="bi bi-check-circle-fill text-success" title="Selesai"></i></th>
                            <th scope="col">Deskripsi</th>
                            <th scope="col">Tipe</th>
                            
                            <th scope="col">Tanggal Dibuat</th>
                            <th scope="col" style="width: 25%;">Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($materis as $materi)
                            <tr>
                                <td>
                                    {{ $materi->judul }}
                                    @if(in_array($materi->id, $completedMateriIds))
                                        <span class="badge bg-success ms-2">Selesai</span>
                                    @endif
                                </td>
                                <td>{{ Str::limit($materi->deskripsi, 100) }}</td>
                                <td class="text-center">{{ strtoupper($materi->jenis) }}</td>
                                
                                <td>{{ $materi->created_at->format('d M Y') }}</td>
                                <td class="text-center">
                                    <a href="{{ route('user.materi.show', $materi->id) }}" class="btn btn-info btn-sm mb-1">
                                        <i class="bi bi-eye"></i> Lihat Detail
                                    </a>
                                    <form action="{{ route('user.materi.like.toggle', $materi->id) }}" method="POST" class="d-inline">
                                        @csrf
                                        <button type="submit" class="btn btn-secondary btn-sm mb-1">
                                            ❤️ {{ $materi->likes_count ?? 0 }}
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        @endif

        @if($materis->hasPages())
        <div class="d-flex justify-content-center mt-4">
            {{ $materis->links('pagination::bootstrap-5') }}
        </div>
        @endif
    </div>
</div>
@endsection

@push('scripts')
<script>
function trackProgress(contentType, contentId) {
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
    .then(response => response.json())
    .then(data => {
        console.log(data.message);
    })
    .catch(error => {
        console.error('Error tracking progress:', error);
    });
}
</script>
@endpush
