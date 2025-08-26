@extends('layouts.app')

@section('title', 'Laporan Komprehensif - Progres, Konsultasi & Forum')

@section('content')
<div class="card shadow rounded-4">
    <div class="card-header bg-primary text-white fw-bold fs-5 rounded-top-4">
        Laporan Komprehensif - Progres Pengguna, Konsultasi & Forum Analytics
    </div>
    <div class="card-body">
        <a href="{{ route('admin.dashboard') }}" class="btn btn-secondary mb-3">Kembali ke Dashboard</a>

        <!-- Nav tabs -->
        <ul class="nav nav-tabs mt-4" id="myTab" role="tablist">
            <li class="nav-item" role="presentation">
                <button class="nav-link active" id="user-progress-tab" data-bs-toggle="tab" data-bs-target="#user-progress" type="button" role="tab" aria-controls="user-progress" aria-selected="true">Progres Pengguna</button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="consultation-stats-tab" data-bs-toggle="tab" data-bs-target="#consultation-stats" type="button" role="tab" aria-controls="consultation-stats" aria-selected="false">Statistik Konsultasi</button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="zoom-participation-tab" data-bs-toggle="tab" data-bs-target="#zoom-participation" type="button" role="tab" aria-controls="zoom-participation" aria-selected="false">Partisipasi Zoom</button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="comments-report-tab" data-bs-toggle="tab" data-bs-target="#comments-report" type="button" role="tab" aria-controls="comments-report" aria-selected="false">Komentar</button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="forum-analytics-tab" data-bs-toggle="tab" data-bs-target="#forum-analytics" type="button" role="tab" aria-controls="forum-analytics" aria-selected="false">Forum Analytics</button>
            </li>
        </ul>

        <!-- Tab Content -->
        <div class="tab-content" id="myTabContent">
            <!-- User Progress Tab Pane -->
            <div class="tab-pane fade show active" id="user-progress" role="tabpanel" aria-labelledby="user-progress-tab">
                <h5 class="mt-4 mb-3">Laporan Progres Pengguna</h5>
                <div class="row">
                    <div class="col-lg-3 d-flex align-items-stretch p-2">
                        <div class="card shadow h-100">
                            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary">Ringkasan Progres</h6>
                                <a href="#" role="button" id="refreshUserProgressButton" class="text-gray-400">
                                    <i class="fas fa-sync-alt fa-sm fa-fw"></i>
                                </a>
                            </div>
                            <div class="card-body d-flex flex-column">
                                <div class="chart-pie pt-4 my-auto">
                                    <canvas id="progressPieChart"></canvas>
                                </div>
                                <div class="mt-4 d-flex justify-content-between">
                                    <div class="text-center">
                                        <div class="text-success font-weight-bold" id="completedCount">0</div>
                                        <small class="text-muted">Selesai</small>
                                    </div>
                                    <div class="text-center">
                                        <div class="text-warning font-weight-bold" id="inProgressCount">0</div>
                                        <small class="text-muted">Belum Selesai</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8 p-2">
                        <div class="card shadow" id="detailChartCard" style="display: none;">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary" id="detailChartTitle"></h6>
                            </div>
                            <div class="card-body d-flex flex-column">
                                <div class="chart-bar my-auto">
                                    <canvas id="userDetailBarChart"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Consultation Stats Tab Pane -->
            <div class="tab-pane fade" id="consultation-stats" role="tabpanel" aria-labelledby="consultation-stats-tab">
                <h5 class="mt-4 mb-3">Laporan Statistik Konsultasi</h5>
                <div class="row">
                    <div class="col-lg-4 p-2">
                        <div class="card shadow h-100">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Pengguna yang Berkonsultasi</h6>
                            </div>
                            <div class="card-body d-flex flex-column">
                                <h4 class="small font-weight-bold">Pengguna Aktif Konsultasi <span class="float-right">{{ number_format($percentageUsersWithConsultations, 2) }}%</span></h4>
                                <div class="progress mb-4">
                                    <div class="progress-bar bg-info" role="progressbar" style="width: {{ $percentageUsersWithConsultations }}%" aria-valuenow="{{ $percentageUsersWithConsultations }}" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <div class="d-flex justify-content-between mt-auto">
                                    <span>Total Pengguna: <strong>{{ $totalUsers }}</strong></span>
                                    <span>Pengguna Berkonsultasi: <strong>{{ $usersWithConsultations }}</strong></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 p-2">
                        <div class="card shadow h-100">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Konsultasi Berdasarkan Status</h6>
                            </div>
                            <div class="card-body d-flex flex-column">
                                <div class="chart-pie pt-4 my-auto">
                                    <canvas id="consultationStatusPieChart"></canvas>
                                </div>
                                <div class="mt-4 text-center small" id="consultationStatusLegend">
                                    <!-- Legend will be generated by Chart.js -->
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 p-2">
                        <div class="card shadow h-100">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Tren Konsultasi (6 Bulan Terakhir)</h6>
                            </div>
                            <div class="card-body d-flex flex-column">
                                <div class="chart-area my-auto">
                                    <canvas id="consultationTrendLineChart"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 p-2">
                        <div class="card shadow h-100">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Konsultasi Berdasarkan Kategori Teratas</h6>
                            </div>
                            <div class="card-body d-flex flex-column">
                                <div class="chart-bar my-auto">
                                    <canvas id="consultationCategoryBarChart"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Zoom Participation Tab Pane -->
            <div class="tab-pane fade" id="zoom-participation" role="tabpanel" aria-labelledby="zoom-participation-tab">
                <h5 class="mt-4 mb-3">Laporan Partisipasi Zoom</h5>
                <div class="row">
                    <div class="col-lg-4 p-2">
                        <div class="card shadow h-100">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Total Ruangan Zoom</h6>
                            </div>
                            <div class="card-body d-flex align-items-center justify-content-center">
                                <h1 class="display-4 text-primary">{{ $totalZoomRooms }}</h1>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 p-2">
                        <div class="card shadow h-100">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Ruangan Zoom Mendatang</h6>
                            </div>
                            <div class="card-body d-flex align-items-center justify-content-center">
                                <h1 class="display-4 text-success">{{ $upcomingZoomRooms }}</h1>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 p-2">
                        <div class="card shadow h-100">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Ruangan Zoom Lalu</h6>
                            </div>
                            <div class="card-body d-flex align-items-center justify-content-center">
                                <h1 class="display-4 text-info">{{ $pastZoomRooms }}</h1>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 p-2">
                        <div class="card shadow h-100">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Pengguna Menyelesaikan Zoom</h6>
                            </div>
                            <div class="card-body d-flex align-items-center justify-content-center">
                                <h1 class="display-4 text-warning">{{ $usersCompletedZoom }}</h1>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 p-2">
                        <div class="card shadow h-100">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Total Penyelesaian Zoom</h6>
                            </div>
                            <div class="card-body d-flex align-items-center justify-content-center">
                                <h1 class="display-4 text-danger">{{ $totalZoomCompletions }}</h1>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Comments Report Tab Pane -->
            <div class="tab-pane fade" id="comments-report" role="tabpanel" aria-labelledby="comments-report-tab">
                <h5 class="mt-4 mb-3">Laporan Komentar</h5>
                <div class="row">
                    <div class="col-lg-4 col-md-6">
                        <div class="card shadow h-100"> <!-- Changed panel to card for consistency -->
                            <div class="card-header py-3"> <!-- Changed panel-heading to card-header -->
                                <h6 class="m-0 font-weight-bold text-primary">Total Komentar</h6> <!-- Changed to h6 for consistency -->
                            </div>
                            <div class="card-body d-flex align-items-center justify-content-center">
                                <h1 class="display-4 text-primary">{{ $totalComments }}</h1>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-6 p-2">
                        <div class="card shadow h-100"> <!-- Changed panel to card for consistency -->
                            <div class="card-header py-3"> <!-- Changed panel-heading to card-header -->
                                <h6 class="m-0 font-weight-bold text-primary">Komentar per Materi (Top 10)</h6> <!-- Changed to h6 for consistency -->
                            </div>
                            <!-- /.panel-heading -->
                            <div class="card-body"> <!-- Changed panel-body to card-body -->
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>No</th>
                                                <th>Materi</th>
                                                <th>Jumlah Komentar</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach($commentsPerMateri as $index => $data)
                                            <tr>
                                                <td>{{ $index + 1 }}</td>
                                                <td>{{ $data->materi->judul ?? 'Materi Tidak Ditemukan' }}</td>
                                                <td>{{ $data->total_comments }}</td>
                                            </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.table-responsive -->
                            </div>
                            <!-- /.panel-body -->
                        </div>
                        <!-- /.panel -->
                    </div>
                    <!-- /.col-lg-6 -->

                    <div class="col-lg-6 p-2" >
                        <div class="card shadow h-100"> <!-- Changed panel to card for consistency -->
                            <div class="card-header py-3"> <!-- Changed panel-heading to card-header -->
                                <h6 class="m-0 font-weight-bold text-primary">Komentar per Pengguna (Top 10)</h6> <!-- Changed to h6 for consistency -->
                            </div>
                            <!-- /.panel-heading -->
                            <div class="card-body"> <!-- Changed panel-body to card-body -->
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>No</th>
                                                <th>Pengguna</th>
                                                <th>Jumlah Komentar</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach($commentsPerUser as $index => $data)
                                            <tr>
                                                <td>{{ $index + 1 }}</td>
                                                <td>{{ $data->user->name ?? 'Pengguna Tidak Ditemukan' }}</td>
                                                <td>{{ $data->total_comments }}</td>
                                            </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.table-responsive -->
                            </div>
                            <!-- /.panel-body -->
                        </div>
                        <!-- /.panel -->
                    </div>
                    <!-- /.col-lg-6 -->
                </div>
                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-12 p-2">
                        <div class="card shadow h-100">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Semua Komentar</h6>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover" id="commentsTable">
                                        <thead>
                                            <tr>
                                                <th>No</th>
                                                <th>Pengguna</th>
                                                <th>Materi</th>
                                                <th>Komentar</th>
                                                <th>Tanggal</th>
                                            </tr>
                                        </thead>
                                        <tbody id="commentsTableBody">
                                            <!-- Comments will be loaded via JavaScript -->
                                        </tbody>
                                    </table>
                                </div>
                                <!-- Pagination Controls -->
                                <nav aria-label="Comments pagination">
                                    <ul class="pagination justify-content-center" id="commentsPagination">
                                        <!-- Pagination will be generated via JavaScript -->
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.row -->
            </div>

            <!-- Forum Analytics Tab Pane -->
            <div class="tab-pane fade" id="forum-analytics" role="tabpanel" aria-labelledby="forum-analytics-tab">
                <h5 class="mt-4 mb-3">Laporan Forum Analytics</h5>
                
                <!-- Overview Statistics -->
                <div class="row">
                    <div class="col-lg-3 col-md-6 p-2">
                        <div class="card shadow h-100">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Total Forum</h6>
                            </div>
                            <div class="card-body d-flex align-items-center justify-content-center">
                                <h1 class="display-4 text-primary">{{ $forumStats['totalForums'] }}</h1>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 p-2">
                        <div class="card shadow h-100">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Total Thread</h6>
                            </div>
                            <div class="card-body d-flex align-items-center justify-content-center">
                                <h1 class="display-4 text-success">{{ $forumStats['totalThreads'] }}</h1>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 p-2">
                        <div class="card shadow h-100">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Total Posts</h6>
                            </div>
                            <div class="card-body d-flex align-items-center justify-content-center">
                                <h1 class="display-4 text-info">{{ $forumStats['totalPosts'] }}</h1>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 p-2">
                        <div class="card shadow h-100">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Pengguna Aktif</h6>
                            </div>
                            <div class="card-body d-flex align-items-center justify-content-center">
                                <h1 class="display-4 text-warning">{{ $forumStats['totalActiveUsers'] }}</h1>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Charts Row -->
                <div class="row mt-4">
                    <div class="col-lg-6 p-2">
                        <div class="card shadow h-100">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Aktivitas Harian (30 Hari Terakhir)</h6>
                            </div>
                            <div class="card-body">
                                <div class="chart-area">
                                    <canvas id="forumDailyActivityChart"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 p-2">
                        <div class="card shadow h-100">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Distribusi Level Engagement</h6>
                            </div>
                            <div class="card-body">
                                <div class="chart-pie">
                                    <canvas id="forumEngagementChart"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Top Users and Popular Threads -->
                <div class="row mt-4">
                    <div class="col-lg-6 p-2">
                        <div class="card shadow h-100">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Pengguna Paling Aktif</h6>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>No</th>
                                                <th>Nama</th>
                                                <th>Threads</th>
                                                <th>Posts</th>
                                                <th>Skor</th>
                                                <th>Level</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach($forumStats['topUsers'] as $index => $user)
                                            <tr>
                                                <td>{{ $index + 1 }}</td>
                                                <td>{{ $user->name }}</td>
                                                <td>{{ $user->forum_threads_count }}</td>
                                                <td>{{ $user->forum_posts_count }}</td>
                                                <td>{{ $user->engagement_score }}</td>
                                                <td>
                                                    <span class="badge bg-{{ $user->engagement_color }} text-white">
                                                        {{ $user->engagement_level }}
                                                    </span>
                                                </td>
                                            </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 p-2">
                        <div class="card shadow h-100">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Thread Paling Populer</h6>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>No</th>
                                                <th>Judul Thread</th>
                                                <th>Forum</th>
                                                <th>Views</th>
                                                <th>Posts</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach($forumStats['popularThreads'] as $index => $thread)
                                            <tr>
                                                <td>{{ $index + 1 }}</td>
                                                <td>
                                                    {{ \Illuminate\Support\Str::limit($thread->title, 30) }}
                                                </td>
                                                <td>{{ $thread->forum->name }}</td>
                                                <td>{{ $thread->views_count }}</td>
                                                <td>{{ $thread->posts_count }}</td>
                                            </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Forum Activity by Category -->
                <div class="row mt-4">
                    <div class="col-lg-12 p-2">
                        <div class="card shadow">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Aktivitas Forum per Kategori</h6>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>No</th>
                                                <th>Nama Forum</th>
                                                <th>Deskripsi</th>
                                                <th>Total Threads</th>
                                                <th>Total Posts</th>
                                                <th>Aktivitas</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach($forumStats['forumActivity'] as $index => $forum)
                                            <tr>
                                                <td>{{ $index + 1 }}</td>
                                                <td>
                                                    {{ $forum->name }}
                                                </td>
                                                <td>{{ \Illuminate\Support\Str::limit($forum->description, 50) }}</td>
                                                <td>{{ $forum->threads_count }}</td>
                                                <td>{{ $forum->posts_count }}</td>
                                                <td>
                                                    @php
                                                        $activity = $forum->threads_count + $forum->posts_count;
                                                        if ($activity >= 50) {
                                                            $activityLevel = 'Sangat Aktif';
                                                            $activityColor = 'success';
                                                        } elseif ($activity >= 20) {
                                                            $activityLevel = 'Aktif';
                                                            $activityColor = 'primary';
                                                        } elseif ($activity >= 5) {
                                                            $activityLevel = 'Cukup Aktif';
                                                            $activityColor = 'warning';
                                                        } else {
                                                            $activityLevel = 'Kurang Aktif';
                                                            $activityColor = 'secondary';
                                                        }
                                                    @endphp
                                                    <span class="badge bg-{{ $activityColor }} text-white">
                                                        {{ $activityLevel }}
                                                    </span>
                                                </td>
                                            </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
@endsection

@push('scripts')
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>
document.addEventListener("DOMContentLoaded", function() {
    // Data from controller
    const pieChartData = @json($pieChartData);
    const barChartData = @json($barChartData);
    const consultationStatusLabels = @json($consultationStatusLabels);
    const consultationStatusCounts = @json($consultationStatusCounts);
    const consultationTrendLabels = @json($consultationTrendLabels);
    const consultationTrendCounts = @json($consultationTrendCounts);
    const consultationCategoryLabels = @json($consultationCategoryLabels);
    const consultationCategoryCounts = @json($consultationCategoryCounts);
    const totalUsers = @json($totalUsers);
    const usersWithConsultations = @json($usersWithConsultations);
    const percentageUsersWithConsultations = @json($percentageUsersWithConsultations);
    const forumStats = @json($forumStats);

    let userDetailBarChart = null; // a variable to hold the bar chart instance
    let currentStatusFilter = null; // To store the currently selected status (completed/in-progress)

    // --- PIE CHART (User Progress) ---
    const ctxPie = document.getElementById('progressPieChart').getContext('2d');
    const progressPieChart = new Chart(ctxPie, {
        type: 'pie',
        data: {
            labels: ['Selesai', 'Belum Selesai'],
            datasets: [{
                data: [pieChartData.completed, pieChartData.in_progress],
                backgroundColor: ['#1cc88a', '#f6c23e'],
                hoverBackgroundColor: ['#17a673', '#e5b343'],
                hoverBorderColor: "rgba(234, 236, 244, 1)",
            }],
        },
        options: {
            maintainAspectRatio: false,
            tooltips: {
                backgroundColor: "rgb(255,255,255)",
                bodyFontColor: "#858796",
                borderColor: '#dddfeb',
                borderWidth: 1,
                xPadding: 15,
                yPadding: 15,
                displayColors: false,
                caretPadding: 10,
            },
            legend: {
                display: false
            },
            cutoutPercentage: 80,
            onClick: (event, elements) => {
                if (elements.length > 0) {
                    const clickedIndex = elements[0].index;
                    const clickedLabel = progressPieChart.data.labels[clickedIndex];
                    currentStatusFilter = (clickedLabel === 'Selesai') ? 'completed' : 'in-progress';
                    
                    // Show filtered data when a pie slice is clicked
                    updateBarChart(currentStatusFilter);
                }
            },
            animation: {
                onComplete: function () {
                    const chart = this;
                    const ctx = chart.ctx;
                    
                    // Update count displays
                    document.getElementById('completedCount').textContent = pieChartData.completed;
                    document.getElementById('inProgressCount').textContent = pieChartData.in_progress;
                    
                    // Calculate total for percentage calculation
                    const total = pieChartData.completed + pieChartData.in_progress;
                    
                    chart.data.datasets.forEach(function (dataset, i) {
                        const meta = chart.getDatasetMeta(i);
                        meta.data.forEach(function (element, index) {
                            const value = dataset.data[index];
                            if (value > 0) {
                                // Calculate percentage
                                const percentage = total > 0 ? ((value / total) * 100).toFixed(1) + '%' : '0%';
                                
                                ctx.fillStyle = 'white';
                                ctx.font = 'bold 14px Arial';
                                ctx.textAlign = 'center';
                                ctx.textBaseline = 'middle';
                                
                                const position = element.tooltipPosition();
                                ctx.fillText(percentage, position.x, position.y);
                            }
                        });
                    });
                }
            }
        },
    });

    // --- BAR CHART (User Detail Progress) ---
    function updateBarChart(status) {
        const detailChartCard = document.getElementById('detailChartCard');
        const detailTitle = document.getElementById('detailChartTitle');

        let dataToFilter = barChartData; // Start with all original data

        if (status !== 'all_status') { // Apply status filter if not 'all_status'
            dataToFilter = barChartData.filter(user => user.status === status);
            detailTitle.innerText = `Detail Pengguna: ${status === 'completed' ? 'Selesai' : 'Belum Selesai'}`;
        } else {
            detailTitle.innerText = 'Detail Progres Semua Pengguna';
        }

        // Filter out users with 0% progress
        dataToFilter = dataToFilter.filter(user => user.progress > 0);

        // Sort data by progress in descending order (highest first)
        dataToFilter.sort((a, b) => b.progress - a.progress);

        // Function to convert name to sentence case
        function toSentenceCase(str) {
            return str.toLowerCase().split(' ').map(word => 
                word.charAt(0).toUpperCase() + word.slice(1)
            ).join(' ');
        }

        const labels = dataToFilter.map(user => toSentenceCase(user.name));
        const progressValues = dataToFilter.map(user => user.progress);

        detailChartCard.style.display = 'block';

        // Set dynamic height based on number of data points
        const chartContainer = document.getElementById('userDetailBarChart').parentElement;
        const minHeight = 400; // Minimum height
        const heightPerItem = 25; // Height per data item
        const dynamicHeight = Math.max(minHeight, dataToFilter.length * heightPerItem);
        chartContainer.style.height = dynamicHeight + 'px';

        const ctxBar = document.getElementById('userDetailBarChart').getContext('2d');

        if(userDetailBarChart) {
            userDetailBarChart.destroy(); // Destroy the old chart instance before creating a new one
        }

        // Create dynamic colors based on progress values
        const backgroundColors = progressValues.map(progress => {
            if (progress >= 100) {
                return '#1cc88a'; // Green for 100% or more
            } else if (status === 'completed') {
                return '#1cc88a'; // Green for completed status
            } else {
                return '#f6c23e'; // Yellow for in-progress
            }
        });

        const borderColors = progressValues.map(progress => {
            if (progress >= 100) {
                return '#17a673'; // Dark green border for 100% or more
            } else if (status === 'completed') {
                return '#17a673'; // Dark green border for completed status
            } else {
                return '#e5b343'; // Dark yellow border for in-progress
            }
        });

        userDetailBarChart = new Chart(ctxBar, {
            type: 'bar',
            data: {
                labels: labels,
                datasets: [{
                    label: 'Progres (%)',
                    data: progressValues,
                    backgroundColor: backgroundColors,
                    borderColor: borderColors,
                    borderWidth: 1
                }]
            },
            options: {
                indexAxis: 'y', // Ini yang membuat grafik menjadi horizontal
                maintainAspectRatio: false,
                responsive: true,
                scales: {
                    x: {
                        beginAtZero: true,
                        max: 100,
                        ticks: {
                            callback: function(value, index, values) {
                                return value + '%';
                            }
                        },
                        title: {
                            display: true,
                            text: 'Progres (%)'
                        }
                    },
                    y: {
                        ticks: {
                            maxRotation: 0,
                            minRotation: 0,
                            font: {
                                size: 12
                            }
                        },
                        title: {
                            display: true,
                            text: 'Nama Pengguna'
                        }
                    }
                },
                plugins: {
                    legend: { 
                        display: false 
                    },
                    tooltip: {
                        callbacks: {
                            label: function(context) {
                                return `Progres: ${context.parsed.x}%`;
                            }
                        }
                    }
                },
                tooltips: {
                    callbacks: {
                        label: function(tooltipItem, data) {
                            return `Progres: ${tooltipItem.raw}%`;
                        }
                    }
                }
            }
        });
    }

    // Function to reset the user detail chart to show all users
    function resetUserDetailChart() {
        currentStatusFilter = 'all_status'; // Set filter to show all statuses
        updateBarChart('all_status'); // Default to show all data
    }

    // Initial load: show all users by default
    resetUserDetailChart();

    // Event listener for refresh button
    document.getElementById('refreshUserProgressButton').addEventListener('click', function(e) {
        e.preventDefault();
        resetUserDetailChart();
    });

    // --- PIE CHART (Consultation Status) ---
    const ctxConsultationStatus = document.getElementById('consultationStatusPieChart').getContext('2d');
    const consultationStatusPieChart = new Chart(ctxConsultationStatus, {
        type: 'pie',
        data: {
            labels: consultationStatusLabels,
            datasets: [{
                data: consultationStatusCounts,
                backgroundColor: [
                    '#4e73df', // Primary Blue
                    '#1cc88a', // Success Green
                    '#36b9cc', // Info Cyan
                    '#f6c23e', // Warning Yellow
                    '#e74a3b', // Danger Red
                    '#858796'  // Secondary Gray
                ],
                hoverBackgroundColor: [
                    '#2e59d9',
                    '#17a673',
                    '#2c9faf',
                    '#e5b343',
                    '#be2617',
                    '#6d707f'
                ],
                hoverBorderColor: "rgba(234, 236, 244, 1)",
            }],
        },
        options: {
            maintainAspectRatio: false,
            tooltips: {
                backgroundColor: "rgb(255,255,255)",
                bodyFontColor: "#858796",
                borderColor: '#dddfeb',
                borderWidth: 1,
                xPadding: 15,
                yPadding: 15,
                displayColors: true,
                caretPadding: 10,
            },
            legend: {
                display: true,
                position: 'bottom',
                labels: {
                    fontColor: '#858796'
                }
            },
            cutoutPercentage: 0, // Make it a full pie chart
            animation: {
                onComplete: function () {
                    const chart = this;
                    const ctx = chart.ctx;
                    
                    chart.data.datasets.forEach(function (dataset, i) {
                        const meta = chart.getDatasetMeta(i);
                        meta.data.forEach(function (element, index) {
                            const value = dataset.data[index];
                            if (value > 0) {
                                ctx.fillStyle = 'white';
                                ctx.font = 'bold 14px Arial';
                                ctx.textAlign = 'center';
                                ctx.textBaseline = 'middle';
                                
                                const position = element.tooltipPosition();
                                ctx.fillText(value, position.x, position.y);
                            }
                        });
                    });
                }
            }
        },
    });

    // --- LINE CHART (Consultation Trend) ---
    const ctxConsultationTrend = document.getElementById('consultationTrendLineChart').getContext('2d');
    const consultationTrendLineChart = new Chart(ctxConsultationTrend, {
        type: 'line',
        data: {
            labels: consultationTrendLabels,
            datasets: [{
                label: "Jumlah Konsultasi",
                lineTension: 0.3,
                backgroundColor: "rgba(78, 115, 223, 0.05)",
                borderColor: "rgba(78, 115, 223, 1)",
                pointRadius: 3,
                pointBackgroundColor: "rgba(78, 115, 223, 1)",
                pointBorderColor: "rgba(78, 115, 223, 1)",
                pointHoverRadius: 3,
                pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
                pointHoverBorderColor: "rgba(78, 115, 223, 1)",
                pointHitRadius: 10,
                pointBorderWidth: 2,
                data: consultationTrendCounts,
            }],
        },
        options: {
            maintainAspectRatio: false,
            layout: {
                padding: {
                    left: 10,
                    right: 25,
                    top: 25,
                    bottom: 0
                }
            },
            scales: {
                xAxes: [{
                    time: {
                        unit: 'date'
                    },
                    gridLines: {
                        display: false,
                        drawBorder: false
                    },
                    ticks: {
                        maxTicksLimit: 7
                    }
                }],
                yAxes: [{
                    ticks: {
                        beginAtZero: true,
                        maxTicksLimit: 5,
                        padding: 10,
                        // Include a dollar sign in the ticks
                        callback: function(value, index, values) {
                            return value; // Just return the value for count
                        }
                    },
                    gridLines: {
                        color: "rgb(234, 236, 244)",
                        zeroLineColor: "rgb(234, 236, 244)",
                        drawBorder: false,
                        borderDash: [2],
                        zeroLineBorderDash: [2]
                    }
                }],
            },
            legend: {
                display: false
            },
            tooltips: {
                backgroundColor: "rgb(255,255,255)",
                bodyFontColor: "#858796",
                titleMarginBottom: 10,
                titleFontColor: '#6e707e',
                titleFontSize: 14,
                borderColor: '#dddfeb',
                borderWidth: 1,
                xPadding: 15,
                yPadding: 15,
                displayColors: false,
                intersect: false,
                mode: 'index',
                caretPadding: 10,
                callbacks: {
                    label: function(tooltipItem, chart) {
                        var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
                        return datasetLabel + ': ' + tooltipItem.yLabel;
                    }
                }
            }
        }
    });

    // --- HORIZONTAL BAR CHART (Consultation Categories) ---
    const ctxConsultationCategory = document.getElementById('consultationCategoryBarChart').getContext('2d');
    const consultationCategoryBarChart = new Chart(ctxConsultationCategory, {
        type: 'bar',
        data: {
            labels: consultationCategoryLabels,
            datasets: [{
                label: "Jumlah Konsultasi",
                data: consultationCategoryCounts,
                backgroundColor: '#36b9cc',
                borderColor: '#2c9faf',
                borderWidth: 1
            }]
        },
        options: {
            indexAxis: 'y', // Ini yang membuat grafik menjadi horizontal
            maintainAspectRatio: false,
            scales: {
                x: {
                    beginAtZero: true,
                    precision: 0 // Ensure whole numbers for counts
                },
                y: {
                    barPercentage: 0.8, // Adjust bar width
                    categoryPercentage: 0.8 // Adjust space between bars
                }
            },
            legend: { display: false },
            tooltips: {
                callbacks: {
                    label: function(tooltipItem, data) {
                        return `Jumlah: ${tooltipItem.raw}`;
                    }
                }
            }
        }
    });

    // --- COMMENTS PAGINATION ---
    const allComments = @json($recentComments); // Use existing comments data
    
    // Sort comments by created_at in descending order (newest first)
    allComments.sort((a, b) => new Date(b.created_at) - new Date(a.created_at));
    
    const commentsPerPage = 10;
    let currentCommentsPage = 1;

    function displayComments(page = 1) {
        const startIndex = (page - 1) * commentsPerPage;
        const endIndex = startIndex + commentsPerPage;
        const commentsToShow = allComments.slice(startIndex, endIndex);
        
        const tbody = document.getElementById('commentsTableBody');
        tbody.innerHTML = '';
        
        commentsToShow.forEach((comment, index) => {
            const row = `
                <tr>
                    <td>${startIndex + index + 1}</td>
                    <td>${comment.user ? comment.user.name : 'Pengguna Tidak Ditemukan'}</td>
                    <td>${comment.materi ? comment.materi.judul : 'Materi Tidak Ditemukan'}</td>
                    <td>${comment.isi_komentar}</td>
                    <td>${new Date(comment.created_at).toLocaleDateString('id-ID', {
                        day: '2-digit',
                        month: 'short', 
                        year: 'numeric',
                        hour: '2-digit',
                        minute: '2-digit'
                    })}</td>
                </tr>
            `;
            tbody.innerHTML += row;
        });
        
        generateCommentsPagination();
    }

    function generateCommentsPagination() {
        const totalPages = Math.ceil(allComments.length / commentsPerPage);
        const pagination = document.getElementById('commentsPagination');
        pagination.innerHTML = '';
        
        // Previous button
        const prevLi = document.createElement('li');
        prevLi.className = `page-item ${currentCommentsPage === 1 ? 'disabled' : ''}`;
        prevLi.innerHTML = `<a class="page-link" href="#" onclick="goToCommentsPage(${currentCommentsPage - 1})">Previous</a>`;
        pagination.appendChild(prevLi);
        
        // Page numbers
        for (let i = 1; i <= totalPages; i++) {
            const li = document.createElement('li');
            li.className = `page-item ${i === currentCommentsPage ? 'active' : ''}`;
            li.innerHTML = `<a class="page-link" href="#" onclick="goToCommentsPage(${i})">${i}</a>`;
            pagination.appendChild(li);
        }
        
        // Next button
        const nextLi = document.createElement('li');
        nextLi.className = `page-item ${currentCommentsPage === totalPages ? 'disabled' : ''}`;
        nextLi.innerHTML = `<a class="page-link" href="#" onclick="goToCommentsPage(${currentCommentsPage + 1})">Next</a>`;
        pagination.appendChild(nextLi);
    }

    function goToCommentsPage(page) {
        const totalPages = Math.ceil(allComments.length / commentsPerPage);
        if (page >= 1 && page <= totalPages) {
            currentCommentsPage = page;
            displayComments(page);
        }
    }

    // Initialize comments display
    displayComments(1);

    // --- FORUM ANALYTICS CHARTS ---
    
    // Forum Daily Activity Chart
    const ctxForumDaily = document.getElementById('forumDailyActivityChart').getContext('2d');
    const forumDailyLabels = forumStats.dailyActivity.map(item => item.date);
    const forumDailyThreads = forumStats.dailyActivity.map(item => item.threads);
    const forumDailyPosts = forumStats.dailyActivity.map(item => item.posts);
    
    const forumDailyActivityChart = new Chart(ctxForumDaily, {
        type: 'line',
        data: {
            labels: forumDailyLabels,
            datasets: [
                {
                    label: 'New Threads',
                    data: forumDailyThreads,
                    borderColor: 'rgba(78, 115, 223, 1)',
                    backgroundColor: 'rgba(78, 115, 223, 0.1)',
                    tension: 0.3
                },
                {
                    label: 'New Posts',
                    data: forumDailyPosts,
                    borderColor: 'rgba(28, 200, 138, 1)',
                    backgroundColor: 'rgba(28, 200, 138, 0.1)',
                    tension: 0.3
                }
            ]
        },
        options: {
            maintainAspectRatio: false,
            responsive: true,
            scales: {
                x: {
                    display: true,
                    title: {
                        display: true,
                        text: 'Tanggal'
                    }
                },
                y: {
                    display: true,
                    title: {
                        display: true,
                        text: 'Jumlah'
                    },
                    beginAtZero: true
                }
            },
            plugins: {
                legend: {
                    display: true,
                    position: 'top'
                }
            }
        }
    });
    
    // Forum Engagement Distribution Chart
    const ctxForumEngagement = document.getElementById('forumEngagementChart').getContext('2d');
    const engagementLabels = Object.keys(forumStats.engagementDistribution);
    const engagementCounts = Object.values(forumStats.engagementDistribution);
    
    const forumEngagementChart = new Chart(ctxForumEngagement, {
        type: 'doughnut',
        data: {
            labels: engagementLabels,
            datasets: [{
                data: engagementCounts,
                backgroundColor: [
                    '#1cc88a', // Sangat Aktif - Green
                    '#4e73df', // Aktif - Blue
                    '#f6c23e', // Cukup Aktif - Yellow
                    '#858796'  // Kurang Aktif - Gray
                ],
                hoverBackgroundColor: [
                    '#17a673',
                    '#2e59d9',
                    '#e5b343',
                    '#6d707f'
                ],
                hoverBorderColor: "rgba(234, 236, 244, 1)",
            }],
        },
        options: {
            maintainAspectRatio: false,
            tooltips: {
                backgroundColor: "rgb(255,255,255)",
                bodyFontColor: "#858796",
                borderColor: '#dddfeb',
                borderWidth: 1,
                xPadding: 15,
                yPadding: 15,
                displayColors: true,
                caretPadding: 10,
            },
            legend: {
                display: true,
                position: 'bottom',
                labels: {
                    fontColor: '#858796'
                }
            },
            cutoutPercentage: 50,
            animation: {
                onComplete: function () {
                    const chart = this;
                    const ctx = chart.ctx;
                    
                    chart.data.datasets.forEach(function (dataset, i) {
                        const meta = chart.getDatasetMeta(i);
                        meta.data.forEach(function (element, index) {
                            const value = dataset.data[index];
                            if (value > 0) {
                                ctx.fillStyle = 'white';
                                ctx.font = 'bold 12px Arial';
                                ctx.textAlign = 'center';
                                ctx.textBaseline = 'middle';
                                
                                const position = element.tooltipPosition();
                                ctx.fillText(value, position.x, position.y);
                            }
                        });
                    });
                }
            }
        },
    });

});
</script>
@endpush