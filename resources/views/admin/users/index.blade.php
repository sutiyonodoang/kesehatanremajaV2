@extends('layouts.app')
@section('title', 'Manajemen Pengguna')

@section('content')
<div class="container-fluid">
    <div class="row mb-4">
        <div class="col-12">
            <a href="{{ route('admin.dashboard') }}" class="btn btn-secondary">
                <i class="fas fa-arrow-left"></i> Kembali
            </a>
        </div>
    </div>

    <div class="card shadow rounded-4">
        <div class="card-header bg-primary text-white fw-bold fs-5 rounded-top-4">
            Manajemen Pengguna
        </div>
        <div class="card-body">
            <a href="{{ route('admin.users.create') }}" class="btn btn-primary mb-3">+ Tambah User</a>

            @if(session('success'))
                <div class="alert alert-success">
                    {{ session('success') }}
                </div>
            @endif

            <div class="card card-custom-border mb-4">
                <div class="card-body">
                    <form action="{{ route('admin.users.index') }}" method="GET">
                        <div class="row g-3 align-items-end">
                            <div class="col-md-4">
                                <label for="search" class="form-label">Cari:</label>
                                <input type="text" name="search" id="search" class="form-control" placeholder="Nama atau Email" value="{{ request('search') }}">
                            </div>
                            <div class="col-md-4">
                                <label for="role" class="form-label">Filter Role:</label>
                                <select name="role" id="role" class="form-select">
                                    <option value="">Semua Role</option>
                                    <option value="admin" {{ request('role') == 'admin' ? 'selected' : '' }}>Admin</option>
                                    <option value="konsultan" {{ request('role') == 'konsultan' ? 'selected' : '' }}>Konsultan</option>
                                    <option value="user" {{ request('role') == 'user' ? 'selected' : '' }}>User</option>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <button type="submit" class="btn btn-primary">Terapkan Filter</button>
                                <a href="{{ route('admin.users.index') }}" class="btn btn-secondary">Reset Filter</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            @if($users->isEmpty())
                <div class="text-center py-4">
                    <div class="text-muted">
                        <i class="fas fa-users fa-3x mb-3"></i>
                        <p>Belum ada pengguna terdaftar</p>
                    </div>
                </div>
            @else
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
                                <th>No</th>
                                <th>Nama
                                    <a href="{{ route('admin.users.index', array_merge(request()->query(), ['sort_by' => 'name', 'sort_order' => request('sort_by') == 'name' && request('sort_order') == 'asc' ? 'desc' : 'asc'])) }}" class="text-decoration-none text-dark">
                                        @if(request('sort_by') == 'name')
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
                                <th>Email
                                    <a href="{{ route('admin.users.index', array_merge(request()->query(), ['sort_by' => 'email', 'sort_order' => request('sort_by') == 'email' && request('sort_order') == 'asc' ? 'desc' : 'asc'])) }}" class="text-decoration-none text-dark">
                                        @if(request('sort_by') == 'email')
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
                                <th>Role
                                    <a href="{{ route('admin.users.index', array_merge(request()->query(), ['sort_by' => 'role', 'sort_order' => request('sort_by') == 'role' && request('sort_order') == 'asc' ? 'desc' : 'asc'])) }}" class="text-decoration-none text-dark">
                                        @if(request('sort_by') == 'role')
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
                                <th>Tanggal Daftar
                                    <a href="{{ route('admin.users.index', array_merge(request()->query(), ['sort_by' => 'created_at', 'sort_order' => request('sort_by') == 'created_at' && request('sort_order') == 'asc' ? 'desc' : 'asc'])) }}" class="text-decoration-none text-dark">
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
                                <th>Aksi</th>
                            </tr>
                        </thead>
                                <tbody>
                                    @foreach($users as $user)
                                        <tr>
                                            <td class="text-center">{{ $loop->iteration + ($users->currentPage() - 1) * $users->perPage() }}</td>
                                            <td>{{ $user->name }}</td>
                                            <td>{{ $user->email }}</td>
                                            <td class="text-center">
                                                @if($user->role === 'admin')
                                                    <span class="badge bg-danger">Admin</span>
                                                @elseif($user->role === 'konsultan')
                                                    <span class="badge bg-success">Konsultan</span>
                                                @else
                                                    <span class="badge bg-primary">User</span>
                                                @endif
                                            </td>
                                            <td class="text-center">{{ $user->created_at->format('d-m-Y H:i:s') }}</td>
                                            <td class="text-center">
                                                <div class="d-flex gap-2 justify-content-center">
                                                    <a href="{{ route('admin.users.edit', $user->id) }}" 
                                                       class="btn btn-sm btn-warning">
                                                        <i class="fas fa-edit"></i> Edit
                                                    </a>
                                                    <form action="{{ route('admin.users.destroy', $user->id) }}" 
                                                          method="POST" class="d-inline" 
                                                          onsubmit="return confirm('Yakin ingin menghapus pengguna ini?')">
                                                        @csrf
                                                        @method('DELETE')
                                                        <button class="btn btn-sm btn-danger">
                                                            <i class="fas fa-trash"></i> Hapus
                                                        </button>
                                                    </form>
                                                </div>
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>

                        {{-- Pagination --}}
                        @if($users->hasPages())
                        <div class="d-flex justify-content-center mt-4">
                            {{ $users->links('pagination::bootstrap-5') }}
                        </div>
                        @endif
                    @endif
                </div>
            </div>
        </div>
    </div>
</div>
@endsection