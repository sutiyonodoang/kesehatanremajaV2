@extends('layouts.app')

@section('title', 'Laporan Log Aktivitas Pengguna')

@section('content')
<style>
.properties-container {
    max-height: 100px; /* Atur tinggi maksimal awal */
    overflow: hidden;
    position: relative;
    cursor: pointer;
    transition: max-height 0.3s ease-in-out;
    border: 1px solid #eee;
    border-radius: 5px;
}

.properties-container.expanded {
    max-height: 500px; /* Atur tinggi maksimal saat di-hover atau di-klik */
    overflow-y: auto;
}

/* Gradien untuk menunjukkan ada konten tersembunyi */
.properties-container::after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    height: 30px;
    background: linear-gradient(to top, rgba(255, 255, 255, 1) 20%, rgba(255, 255, 255, 0));
    pointer-events: none; /* Agar tidak mengganggu klik */
    transition: opacity 0.3s ease-in-out;
}

.properties-container.expanded::after {
    opacity: 0;
}

.properties-pre {
    margin: 0;
    padding: 10px;
    background-color: #f8f9fa;
    white-space: pre-wrap;
    word-break: break-all;
}
</style>
<div class="card shadow rounded-4">
    <div class="card-header bg-primary text-white fw-bold fs-5 rounded-top-4">
        Laporan Log Aktivitas Pengguna
    </div>
    <div class="card-body">
        <a href="{{ route('admin.dashboard') }}" class="btn btn-secondary mb-3">Kembali ke Dashboard</a>

        <div class="table-responsive">
            <table class="table table-striped table-bordered table-hover align-middle table-custom-border">
                <thead class="table-primary text-center">
                    <tr>
                        <th>No</th>
                        <th>Log Name</th>
                        <th>Description</th>
                        <th>Subject</th>
                        <th>Causer</th>
                        <th>Properties</th>
                        <th>Timestamp</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($activityLogs as $log)
                        <tr>
                            <td class="text-center">{{ $loop->iteration + ($activityLogs->currentPage() - 1) * $activityLogs->perPage() }}</td>
                            <td>{{ $log->log_name }}</td>
                            <td>{{ $log->description }}</td>
                            <td>
                                @if($log->subject)
                                    {{ $log->subject->getTable() }} (ID: {{ $log->subject_id }})
                                @else
                                    N/A
                                @endif
                            </td>
                            <td>
                                @if($log->causer)
                                    {{ $log->causer->name }} (ID: {{ $log->causer_id }})
                                @else
                                    System
                                @endif
                            </td>
                            <td>
                                @if($log->properties->count())
                                    <div class="properties-container" title="Klik untuk toggle" onclick="this.classList.toggle('expanded')">
                                        <pre class="properties-pre">{{ json_encode($log->properties->toArray(), JSON_PRETTY_PRINT) }}</pre>
                                    </div>
                                @else
                                    N/A
                                @endif
                            </td>
                            <td class="text-center">{{ $log->created_at->format('d-m-Y H:i:s') }}</td>
                        </tr>
                    @empty
                        <tr>
                            <td colspan="7" class="text-center">Tidak ada log aktivitas ditemukan.</td>
                        </tr>
                    @endforelse
                </tbody>
            </table>
        </div>

        {{-- Pagination --}}
        @if($activityLogs->hasPages())
        <div class="d-flex justify-content-center mt-4">
            {{ $activityLogs->links('pagination::bootstrap-5') }}
        </div>
        @endif
    </div>
</div>
@endsection