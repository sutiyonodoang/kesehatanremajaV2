@extends('layouts.app')
@section('title', 'Informasi Kesehatan User')

@section('content')
<div class="mb-3">
    <a href="{{ route('user.dashboard') }}" class="btn btn-secondary">
        <i class="bi bi-arrow-left"></i> Kembali
    </a>
</div>

<div class="card shadow rounded-4">
    <div class="card-header bg-primary text-white fw-bold fs-5 rounded-top-4">
        Informasi Kesehatan
    </div>
    <div class="card-body">
        @if($infos->isEmpty())
            <p class="text-muted">Belum ada informasi ditambahkan.</p>
        @else
            <div class="row g-2">
                @foreach($infos as $info)
                    <div class="col-12 col-md-6">
                        <div class="border border-dark rounded shadow-sm bg-light p-3">
                            <h5 class="fw-bold text-primary mb-2">{{ $info->judul }}
                                @if(in_array($info->id, $completedInfoIds))
                                    <span class="badge bg-success ms-2">Selesai</span>
                                @endif
                            </h5>
                            <p class="mb-2">{{ $info->deskripsi }}</p>
                            <p class="mb-2"><strong>Tanggal Update:</strong> {{ \Carbon\Carbon::parse($info->tanggal_update)->format('d-m-Y') }}</p>
                            <p class="mb-0"><strong>Link:</strong> <a href="{{ $info->link_sumber }}" target="_blank" onclick="trackProgress('informasi_kesehatan', {{ $info->id }})">{{ $info->link_sumber }}</a></p>
                        </div>
                    </div>
                @endforeach
            </div>
        @endif

        @if($infos->hasPages())
        <div class="d-flex justify-content-center mt-4">
            {{ $infos->links('pagination::bootstrap-5') }}
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