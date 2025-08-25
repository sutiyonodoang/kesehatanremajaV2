@extends('layouts.app')

@section('title', 'Laporan Aktivitas Harian - Forum')

@section('content')
<div class="container-fluid">
    <!-- Header -->
    <div class="row mb-4">
        <div class="col-12">
            <div class="d-flex justify-content-between align-items-center">
                <div>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{ route('admin.forum-reports.index') }}">Laporan Forum</a></li>
                            <li class="breadcrumb-item active">Aktivitas Harian</li>
                        </ol>
                    </nav>
                    <h2 class="fw-bold text-primary mb-1">📈 Aktivitas Harian Forum</h2>
                    <p class="text-muted mb-0">Grafik trend aktivitas user di forum {{ $days }} hari terakhir</p>
                </div>
                <div class="d-flex gap-2">
                    <div class="dropdown">
                        <button class="btn btn-outline-primary dropdown-toggle" type="button" data-bs-toggle="dropdown">
                            <i class="bi bi-calendar"></i> {{ $days }} Hari
                        </button>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="{{ route('admin.forum-reports.daily-activity', ['days' => 7]) }}">7 Hari</a></li>
                            <li><a class="dropdown-item" href="{{ route('admin.forum-reports.daily-activity', ['days' => 14]) }}">14 Hari</a></li>
                            <li><a class="dropdown-item" href="{{ route('admin.forum-reports.daily-activity', ['days' => 30]) }}">30 Hari</a></li>
                            <li><a class="dropdown-item" href="{{ route('admin.forum-reports.daily-activity', ['days' => 60]) }}">60 Hari</a></li>
                            <li><a class="dropdown-item" href="{{ route('admin.forum-reports.daily-activity', ['days' => 90]) }}">90 Hari</a></li>
                        </ul>
                    </div>
                    <a href="{{ route('admin.forum-reports.index') }}" class="btn btn-outline-secondary">
                        <i class="bi bi-arrow-left"></i> Kembali
                    </a>
                </div>
            </div>
        </div>
    </div>

    <!-- Summary Cards -->
    <div class="row mb-4">
        @php
            $totalThreads = collect($data)->sum('threads');
            $totalPosts = collect($data)->sum('posts');
            $totalActivity = $totalThreads + $totalPosts;
            $avgDaily = $totalActivity / $days;
        @endphp
        
        <div class="col-xl-3 col-md-6 mb-3">
            <div class="card border-0 shadow-sm bg-primary text-white">
                <div class="card-body text-center">
                    <i class="bi bi-chat-left-text display-4 mb-2"></i>
                    <h4>{{ number_format($totalThreads) }}</h4>
                    <p class="mb-0">Total Thread Baru</p>
                </div>
            </div>
        </div>
        
        <div class="col-xl-3 col-md-6 mb-3">
            <div class="card border-0 shadow-sm bg-success text-white">
                <div class="card-body text-center">
                    <i class="bi bi-chat-dots display-4 mb-2"></i>
                    <h4>{{ number_format($totalPosts) }}</h4>
                    <p class="mb-0">Total Post Baru</p>
                </div>
            </div>
        </div>
        
        <div class="col-xl-3 col-md-6 mb-3">
            <div class="card border-0 shadow-sm bg-info text-white">
                <div class="card-body text-center">
                    <i class="bi bi-activity display-4 mb-2"></i>
                    <h4>{{ number_format($totalActivity) }}</h4>
                    <p class="mb-0">Total Aktivitas</p>
                </div>
            </div>
        </div>
        
        <div class="col-xl-3 col-md-6 mb-3">
            <div class="card border-0 shadow-sm bg-warning text-white">
                <div class="card-body text-center">
                    <i class="bi bi-graph-up display-4 mb-2"></i>
                    <h4>{{ number_format($avgDaily, 1) }}</h4>
                    <p class="mb-0">Rata-rata Harian</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Charts -->
    <div class="row">
        <!-- Line Chart -->
        <div class="col-xl-8 mb-4">
            <div class="card shadow-sm border-0">
                <div class="card-header bg-white border-bottom">
                    <h5 class="card-title mb-0">
                        <i class="bi bi-graph-up text-primary"></i> Trend Aktivitas
                    </h5>
                </div>
                <div class="card-body">
                    <canvas id="activityLineChart" height="100"></canvas>
                </div>
            </div>
        </div>

        <!-- Bar Chart -->
        <div class="col-xl-4 mb-4">
            <div class="card shadow-sm border-0">
                <div class="card-header bg-white border-bottom">
                    <h5 class="card-title mb-0">
                        <i class="bi bi-bar-chart text-success"></i> Perbandingan Thread vs Post
                    </h5>
                </div>
                <div class="card-body">
                    <canvas id="comparisonChart" height="150"></canvas>
                </div>
            </div>
        </div>
    </div>

    <!-- Detailed Table -->
    <div class="card shadow-sm border-0">
        <div class="card-header bg-white border-bottom">
            <h5 class="card-title mb-0">
                <i class="bi bi-table text-info"></i> Detail Aktivitas Harian
            </h5>
        </div>
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover align-middle mb-0">
                    <thead class="table-light">
                        <tr>
                            <th class="border-0 ps-4">Tanggal</th>
                            <th class="border-0 text-center">Thread Baru</th>
                            <th class="border-0 text-center">Post Baru</th>
                            <th class="border-0 text-center">Total Aktivitas</th>
                            <th class="border-0 text-center">Persentase</th>
                            <th class="border-0 pe-4">Trend</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach(array_reverse($data) as $index => $item)
                            @php
                                $percentage = $totalActivity > 0 ? ($item['total'] / $totalActivity) * 100 : 0;
                                $prevItem = isset($data[$index - 1]) ? $data[$index - 1] : null;
                                $trend = $prevItem ? ($item['total'] > $prevItem['total'] ? 'up' : ($item['total'] < $prevItem['total'] ? 'down' : 'same')) : 'same';
                            @endphp
                            <tr>
                                <td class="ps-4">
                                    <div>
                                        <strong>{{ \Carbon\Carbon::parse($item['date'])->format('d M Y') }}</strong>
                                        <small class="d-block text-muted">{{ \Carbon\Carbon::parse($item['date'])->format('l') }}</small>
                                    </div>
                                </td>
                                <td class="text-center">
                                    <span class="badge bg-primary fs-6">{{ $item['threads'] }}</span>
                                </td>
                                <td class="text-center">
                                    <span class="badge bg-success fs-6">{{ $item['posts'] }}</span>
                                </td>
                                <td class="text-center">
                                    <span class="badge bg-info fs-6">{{ $item['total'] }}</span>
                                </td>
                                <td class="text-center">
                                    <div class="d-flex flex-column align-items-center">
                                        <span class="small fw-bold">{{ number_format($percentage, 1) }}%</span>
                                        <div class="progress" style="width: 60px; height: 6px;">
                                            <div class="progress-bar bg-info" style="width: {{ $percentage }}%"></div>
                                        </div>
                                    </div>
                                </td>
                                <td class="pe-4">
                                    @if($trend == 'up')
                                        <span class="text-success">
                                            <i class="bi bi-arrow-up"></i> Naik
                                        </span>
                                    @elseif($trend == 'down')
                                        <span class="text-danger">
                                            <i class="bi bi-arrow-down"></i> Turun
                                        </span>
                                    @else
                                        <span class="text-muted">
                                            <i class="bi bi-dash"></i> Stabil
                                        </span>
                                    @endif
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<!-- Chart.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
// Data dari server
const activityData = @json($data);

// Line Chart - Trend Aktivitas
const lineCtx = document.getElementById('activityLineChart').getContext('2d');
const lineChart = new Chart(lineCtx, {
    type: 'line',
    data: {
        labels: activityData.map(item => {
            const date = new Date(item.date);
            return date.toLocaleDateString('id-ID', { month: 'short', day: 'numeric' });
        }),
        datasets: [
            {
                label: 'Thread Baru',
                data: activityData.map(item => item.threads),
                borderColor: 'rgb(54, 162, 235)',
                backgroundColor: 'rgba(54, 162, 235, 0.1)',
                tension: 0.4,
                fill: true
            },
            {
                label: 'Post Baru',
                data: activityData.map(item => item.posts),
                borderColor: 'rgb(75, 192, 192)',
                backgroundColor: 'rgba(75, 192, 192, 0.1)',
                tension: 0.4,
                fill: true
            },
            {
                label: 'Total Aktivitas',
                data: activityData.map(item => item.total),
                borderColor: 'rgb(255, 99, 132)',
                backgroundColor: 'rgba(255, 99, 132, 0.1)',
                tension: 0.4,
                borderWidth: 3
            }
        ]
    },
    options: {
        responsive: true,
        maintainAspectRatio: false,
        scales: {
            y: {
                beginAtZero: true,
                ticks: {
                    stepSize: 1
                }
            }
        },
        plugins: {
            legend: {
                position: 'top',
            }
        },
        interaction: {
            intersect: false,
            mode: 'index'
        }
    }
});

// Pie Chart - Perbandingan Thread vs Post
const pieCtx = document.getElementById('comparisonChart').getContext('2d');
const totalThreads = activityData.reduce((sum, item) => sum + item.threads, 0);
const totalPosts = activityData.reduce((sum, item) => sum + item.posts, 0);

const pieChart = new Chart(pieCtx, {
    type: 'doughnut',
    data: {
        labels: ['Thread', 'Post'],
        datasets: [{
            data: [totalThreads, totalPosts],
            backgroundColor: [
                'rgba(54, 162, 235, 0.8)',
                'rgba(75, 192, 192, 0.8)'
            ],
            borderColor: [
                'rgb(54, 162, 235)',
                'rgb(75, 192, 192)'
            ],
            borderWidth: 2
        }]
    },
    options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
            legend: {
                position: 'bottom',
            }
        }
    }
});
</script>

<style>
.card {
    transition: transform 0.2s ease-in-out;
}

.progress {
    border-radius: 3px;
}

.table tbody tr:hover {
    background-color: rgba(0,123,255,0.05);
}

.badge.fs-6 {
    font-size: 0.875rem !important;
    padding: 0.375rem 0.75rem;
}

#activityLineChart {
    height: 350px !important;
}

#comparisonChart {
    height: 250px !important;
}
</style>
@endsection
