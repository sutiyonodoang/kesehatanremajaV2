@extends('layouts.app')
@section('title', 'Informasi Kesehatan')

@section('content')
<div class="card shadow rounded-4">
<div class="card-header bg-primary text-white fw-bold fs-5 rounded-top-4">
    Daftar Informasi Kesehatan</div>

    <div class="card-body">
    <a href="{{ route('admin.informasi-kesehatan.create') }}" class="btn btn-primary mb-3">+ Tambah Informasi</a>
    <a href="{{ route('admin.dashboard') }}" class="btn btn-secondary mb-3">Kembali</a>


@if(session('success'))
    <div class="alert alert-success">{{ session('success') }}</div>
@endif

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
        <table class="table table-bordered table-striped table-custom-border">
            <thead>
                <tr>
                    <th>Judul</th>
                    <th>Link</th>
                    <th>Aksi</th>
                </tr>
            </thead>
            <tbody>
                @forelse($infos as $info)
                    <tr>
                        <td>{{ $info->judul }}</td>
                        <td><a href="{{ $info->link_sumber }}" target="_blank">{{ $info->link_sumber }}</a></td>
                        <td>
                            <a href="{{ route('admin.informasi-kesehatan.edit', $info->id) }}" class="btn btn-sm btn-warning">Edit</a>
                            <form action="{{ route('admin.informasi-kesehatan.destroy', $info->id) }}" method="POST" class="d-inline" onsubmit="return confirm('Hapus data ini?')">
                                @csrf
                                @method('DELETE')
                                <button class="btn btn-sm btn-danger">Hapus</button>
                            </form>
                        </td>
                    </tr>
                @empty
                    <tr>
                        <td colspan="3" class="text-center py-4">
                            <div class="text-muted">
                                <i class="fas fa-info-circle fa-3x mb-3"></i>
                                <p>Belum ada informasi kesehatan.</p>
                            </div>
                        </td>
                    </tr>
                @endforelse
            </tbody>
        </table>
    </div>
</div>

@if($infos->hasPages())
<div class="d-flex justify-content-center mt-4">
    {{ $infos->links('pagination::bootstrap-5') }}
</div>
@endif

@endsection