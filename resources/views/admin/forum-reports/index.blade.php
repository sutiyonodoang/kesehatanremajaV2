@extends('layouts.app')

@section('title', 'Laporan Forum - Dashboard')

@section('content')
<div class="container-fluid">
    <!-- Header -->
    <div class="row mb-4">
        <div class="col-12">
            <div class="d-flex justify-content-between align-items-center">
                <div>
                    <h2 class="fw-bold text-primary mb-1">📊 Laporan Forum</h2>
                    <p class="text-muted mb-0">Dashboard analisis dan statistik forum diskusi</p>
                </div>
                <div class="d-flex gap-2">
                    <a href="{{ route('admin.forum-reports.user-engagement') }}" class="btn btn-outline-primary">
                        <i class="bi bi-people"></i> User Engagement
                    </a>
                    <a href="{{ route('admin.forum-reports.daily-activity') }}" class="btn btn-outline-success">
                        <i class="bi bi-graph-up"></i> Aktivitas Harian
                    </a>
                    <a href="{{ route('admin.forum-reports.popular-content') }}" class="btn btn-outline-warning">
                        <i class="bi bi-star"></i> Konten Popular
                    </a>
                    <div class="dropdown">
                        <button class="btn btn-primary dropdown-toggle" type="button" data-bs-toggle="dropdown">
                            <i class="bi bi-download"></i> Export
                        </button>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="{{ route('admin.forum-reports.export', ['type' => 'overview']) }}">Overview CSV</a></li>
                            <li><a class="dropdown-item" href="{{ route('admin.forum-reports.export', ['type' => 'user-engagement']) }}">User Engagement CSV</a></li>
                            <li><a class="dropdown-item" href="{{ route('admin.forum-reports.export', ['type' => 'popular-content']) }}">Popular Content CSV</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Stats Cards -->
    <div class="row mb-4">
        <div class="col-xl-3 col-md-6 mb-3">
            <div class="card border-0 shadow-sm bg-gradient bg-primary text-white">
                <div class="card-body">
                    <div class="d-flex align-items-center">
                        <div class="me-3">
                            <i class="bi bi-folder2-open display-6"></i>
                        </div>
                        <div>
                            <h5 class="card-title mb-1">{{ number_format($totalForums) }}</h5>
                            <p class="card-text mb-0 opacity-75">Total Forum</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="col-xl-3 col-md-6 mb-3">
            <div class="card border-0 shadow-sm bg-gradient bg-success text-white">
                <div class="card-body">
                    <div class="d-flex align-items-center">
                        <div class="me-3">
                            <i class="bi bi-chat-left-text display-6"></i>
                        </div>
                        <div>
                            <h5 class="card-title mb-1">{{ number_format($totalThreads) }}</h5>
                            <p class="card-text mb-0 opacity-75">Total Thread</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="col-xl-3 col-md-6 mb-3">
            <div class="card border-0 shadow-sm bg-gradient bg-info text-white">
                <div class="card-body">
                    <div class="d-flex align-items-center">
                        <div class="me-3">
                            <i class="bi bi-chat-dots display-6"></i>
                        </div>
                        <div>
                            <h5 class="card-title mb-1">{{ number_format($totalPosts) }}</h5>
                            <p class="card-text mb-0 opacity-75">Total Post</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="col-xl-3 col-md-6 mb-3">
            <div class="card border-0 shadow-sm bg-gradient bg-warning text-white">
                <div class="card-body">
                    <div class="d-flex align-items-center">
                        <div class="me-3">
                            <i class="bi bi-people display-6"></i>
                        </div>
                        <div>
                            <h5 class="card-title mb-1">{{ number_format($totalUsers) }}</h5>
                            <p class="card-text mb-0 opacity-75">User Aktif</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <!-- Aktivitas 30 Hari -->
        <div class="col-xl-8 mb-4">
            <div class="card shadow-sm border-0">
                <div class="card-header bg-white border-bottom">
                    <h5 class="card-title mb-0">
                        <i class="bi bi-graph-up text-primary"></i> Aktivitas 30 Hari Terakhir
                    </h5>
                </div>
                <div class="card-body">
                    <canvas id="activityChart" height="100"></canvas>
                </div>
            </div>
        </div>

        <!-- User Paling Aktif -->
        <div class="col-xl-4 mb-4">
            <div class="card shadow-sm border-0">
                <div class="card-header bg-white border-bottom">
                    <h5 class="card-title mb-0">
                        <i class="bi bi-trophy text-warning"></i> User Paling Aktif
                    </h5>
                </div>
                <div class="card-body p-0">
                    @forelse($topUsers->take(5) as $index => $user)
                        <div class="d-flex align-items-center p-3 {{ !$loop->last ? 'border-bottom' : '' }}">
                            <div class="me-3">
                                @if($index == 0)
                                    <span class="badge bg-warning rounded-circle" style="width: 30px; height: 30px; display: flex; align-items: center; justify-content: center;">
                                        <i class="bi bi-trophy"></i>
                                    </span>
                                @elseif($index == 1)
                                    <span class="badge bg-secondary rounded-circle" style="width: 30px; height: 30px; display: flex; align-items: center; justify-content: center;">
                                        2
                                    </span>
                                @elseif($index == 2)
                                    <span class="badge bg-dark rounded-circle" style="width: 30px; height: 30px; display: flex; align-items: center; justify-content: center;">
                                        3
                                    </span>
                                @else
                                    <span class="badge bg-light text-dark rounded-circle" style="width: 30px; height: 30px; display: flex; align-items: center; justify-content: center;">
                                        {{ $index + 1 }}
                                    </span>
                                @endif
                            </div>
                            <div class="flex-grow-1">
                                <h6 class="mb-1">{{ $user->name }}</h6>
                                <small class="text-muted">
                                    {{ $user->forum_threads_count }} thread • {{ $user->forum_posts_count }} post
                                </small>
                            </div>
                            <div class="text-end">
                                <span class="badge bg-primary">{{ $user->total_activity }}</span>
                            </div>
                        </div>
                    @empty
                        <div class="text-center py-4">
                            <i class="bi bi-people text-muted" style="font-size: 3rem;"></i>
                            <p class="text-muted mt-2">Belum ada aktivitas user</p>
                        </div>
                    @endforelse
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <!-- Thread Paling Populer -->
        <div class="col-xl-6 mb-4">
            <div class="card shadow-sm border-0">
                <div class="card-header bg-white border-bottom">
                    <h5 class="card-title mb-0">
                        <i class="bi bi-eye text-success"></i> Thread Paling Populer
                    </h5>
                </div>
                <div class="card-body p-0">
                    @forelse($popularThreads->take(5) as $thread)
                        <div class="d-flex align-items-start p-3 {{ !$loop->last ? 'border-bottom' : '' }}">
                            <div class="me-3">
                                <span class="badge bg-{{ $thread->forum->id % 4 == 0 ? 'primary' : ($thread->forum->id % 3 == 0 ? 'success' : ($thread->forum->id % 2 == 0 ? 'warning' : 'info')) }}">
                                    {{ $thread->forum->name }}
                                </span>
                            </div>
                            <div class="flex-grow-1">
                                <h6 class="mb-1">
                                    <a href="{{ route('forum.threads.show', [$thread->forum, $thread]) }}" class="text-decoration-none">
                                        {{ Str::limit($thread->title, 50) }}
                                    </a>
                                </h6>
                                <small class="text-muted">
                                    <i class="bi bi-person"></i> {{ $thread->user->name }} • 
                                    <i class="bi bi-eye"></i> {{ number_format($thread->views_count) }} views • 
                                    <i class="bi bi-chat"></i> {{ $thread->posts_count }} replies
                                </small>
                            </div>
                        </div>
                    @empty
                        <div class="text-center py-4">
                            <i class="bi bi-chat-left-text text-muted" style="font-size: 3rem;"></i>
                            <p class="text-muted mt-2">Belum ada thread</p>
                        </div>
                    @endforelse
                </div>
            </div>
        </div>

        <!-- Forum Paling Aktif -->
        <div class="col-xl-6 mb-4">
            <div class="card shadow-sm border-0">
                <div class="card-header bg-white border-bottom">
                    <h5 class="card-title mb-0">
                        <i class="bi bi-fire text-danger"></i> Forum Paling Aktif
                    </h5>
                </div>
                <div class="card-body p-0">
                    @forelse($activeForums as $forum)
                        <div class="d-flex align-items-center p-3 {{ !$loop->last ? 'border-bottom' : '' }}">
                            <div class="me-3">
                                <div class="bg-primary text-white rounded-circle d-flex align-items-center justify-content-center" style="width: 40px; height: 40px;">
                                    <i class="bi bi-folder"></i>
                                </div>
                            </div>
                            <div class="flex-grow-1">
                                <h6 class="mb-1">{{ $forum->name }}</h6>
                                <small class="text-muted">{{ Str::limit($forum->description, 50) }}</small>
                            </div>
                            <div class="text-end">
                                <div class="d-flex flex-column">
                                    <span class="badge bg-primary mb-1">{{ $forum->threads_count }} threads</span>
                                    <span class="badge bg-success">{{ $forum->total_posts }} posts</span>
                                </div>
                            </div>
                        </div>
                    @empty
                        <div class="text-center py-4">
                            <i class="bi bi-folder text-muted" style="font-size: 3rem;"></i>
                            <p class="text-muted mt-2">Belum ada forum</p>
                        </div>
                    @endforelse
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Chart.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
// Activity Chart
const ctx = document.getElementById('activityChart').getContext('2d');
const activityData = @json($dailyActivity);

const chart = new Chart(ctx, {
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
                tension: 0.4
            },
            {
                label: 'Post Baru',
                data: activityData.map(item => item.posts),
                borderColor: 'rgb(75, 192, 192)',
                backgroundColor: 'rgba(75, 192, 192, 0.1)',
                tension: 0.4
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
            },
            title: {
                display: false
            }
        }
    }
});
</script>

<style>
.bg-gradient {
    background: linear-gradient(45deg, var(--bs-primary), var(--bs-primary-rgb)) !important;
}

.bg-gradient.bg-success {
    background: linear-gradient(45deg, var(--bs-success), #20c997) !important;
}

.bg-gradient.bg-info {
    background: linear-gradient(45deg, var(--bs-info), #17a2b8) !important;
}

.bg-gradient.bg-warning {
    background: linear-gradient(45deg, var(--bs-warning), #fd7e14) !important;
}

.card {
    transition: transform 0.2s ease-in-out;
}

.card:hover {
    transform: translateY(-2px);
}

#activityChart {
    height: 300px !important;
}
</style>
@endsection
