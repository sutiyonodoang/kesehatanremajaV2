@extends('layouts.app')

@section('title', 'Kelola Kategori Konsultasi')

@section('content')
<div class="container-fluid">
    

    <div class="row mt-4">
        <div class="col-12">
            <div class="card shadow rounded-4">
                <div class="card-header text-white fw-bold fs-5 rounded-top-4" style="background-color: #9370DB;">
                    Daftar Kategori
                </div>
                <div class="card-body">
                    <a href="{{ route('admin.consultation-categories.create') }}" class="btn btn-primary mb-3">+ Tambah Kategori</a>
                    <a href="{{ route('admin.dashboard') }}" class="btn btn-secondary mb-3">Kembali</a>
                    
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
                                    <th>Nama</th>
                                    <th>Deskripsi</th>
                                    <th>Jumlah Konsultasi</th>
                                    <th>Status</th>
                                    <th>Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse($categories as $category)
                                <tr>
                                    <td>
                                        {{ $category->name }}
                                    </td>
                                    <td>{{ $category->description ?? '-' }}</td>
                                    <td class="text-center">
                                        <span class="badge bg-info">{{ $category->consultations_count }}</span>
                                    </td>
                                    <td>
                                        @if($category->is_active)
                                            <span class="badge bg-success">Aktif</span>
                                        @else
                                            <span class="badge bg-secondary">Nonaktif</span>
                                        @endif
                                    </td>
                                    <td>
                                        <div class="d-flex gap-2">
                                            <a href="{{ route('admin.consultation-categories.show', $category) }}" 
                                               class="btn btn-sm btn-info">
                                                <i class="fas fa-eye"></i> Lihat
                                            </a>
                                            <a href="{{ route('admin.consultation-categories.edit', $category) }}" 
                                               class="btn btn-sm btn-warning">
                                                <i class="fas fa-edit"></i> Edit
                                            </a>
                                            <form action="{{ route('admin.consultation-categories.destroy', $category) }}" 
                                                  method="POST" class="d-inline">
                                                @csrf
                                                @method('DELETE')
                                                <button type="submit" class="btn btn-sm btn-danger" 
                                                        onclick="return confirm('Yakin ingin menghapus kategori ini?')">
                                                    <i class="fas fa-trash"></i> Hapus
                                                </button>
                                            </form>
                                        </div>
                                    </td>
                                </tr>
                                @empty
                                <tr>
                                    <td colspan="5" class="text-center py-4">
                                        <div class="text-muted">
                                            <i class="fas fa-tags fa-3x mb-3"></i>
                                            <p>Belum ada kategori</p>
                                        </div>
                                    </td>
                                </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>

                    @if($categories->hasPages())
                    <div class="d-flex justify-content-center mt-4">
                        {{ $categories->links() }}
                    </div>
                    @endif
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
