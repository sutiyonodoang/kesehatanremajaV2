@extends('layouts.app')

@section('title', 'Laporan Progres Pengguna & Konsultasi')

@section('content')
<div class="card shadow rounded-4">
    <div class="card-header bg-primary text-white fw-bold fs-5 rounded-top-4">
        Laporan Progres Pengguna & Konsultasi
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
                                <div class="mt-4 text-center small">
                                    <span class="mr-2">
                                        <i class="fas fa-circle text-success"></i> Selesai
                                    </span>
                                    <span class="mr-2">
                                        <i class="fas fa-circle text-warning"></i> Belum Selesai
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8 p-2">
                        <div class="card shadow" id="detailChartCard" style="display: none;">
                            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary" id="detailChartTitle"></h6>
                                <div class="dropdown no-arrow">
                                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <span id="selectedLimitLabel">10 Data Teratas</span> <i class="fas fa-caret-down"></i>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                                        <div class="dropdown-header">Tampilkan Data:</div>
                                        <a class="dropdown-item filter-limit" href="#" data-limit="10">10 Data Teratas</a>
                                        <a class="dropdown-item filter-limit" href="#" data-limit="20">20 Data Teratas</a>
                                        <a class="dropdown-item filter-limit" href="#" data-limit="all" data-status="all_status">Tanpa Filter</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item filter-limit" href="#" data-limit="all">Semua Data</a>
                                    </div>
                                </div>
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
                    
                    // Default to '10' data when a pie slice is clicked
                    updateBarChart(currentStatusFilter, '10');
                }
            }
        },
    });

    // --- BAR CHART (User Detail Progress) ---
    function updateBarChart(status, limit) {
        const selectedLimitLabel = document.getElementById('selectedLimitLabel');
        const detailChartCard = document.getElementById('detailChartCard');
        const detailTitle = document.getElementById('detailChartTitle');

        let dataToFilter = barChartData; // Start with all original data

        if (status !== 'all_status') { // Apply status filter if not 'all_status'
            dataToFilter = barChartData.filter(user => user.status === status);
            detailTitle.innerText = `Detail Pengguna: ${status === 'completed' ? 'Selesai' : 'Belum Selesai'}`;
        } else {
            detailTitle.innerText = 'Detail Progres Semua Pengguna';
        }

        // Apply limit
        if (limit !== 'all') {
            dataToFilter = dataToFilter.slice(0, parseInt(limit));
            selectedLimitLabel.innerText = `${limit} Data Teratas`;
        } else {
            selectedLimitLabel.innerText = 'Semua Data';
        }

        const labels = dataToFilter.map(user => user.name);
        const progressValues = dataToFilter.map(user => user.progress);

        detailChartCard.style.display = 'block';

        const ctxBar = document.getElementById('userDetailBarChart').getContext('2d');

        if(userDetailBarChart) {
            userDetailBarChart.destroy(); // Destroy the old chart instance before creating a new one
        }

        userDetailBarChart = new Chart(ctxBar, {
            type: 'bar',
            data: {
                labels: labels,
                datasets: [{
                    label: 'Progres (%)',
                    data: progressValues,
                    backgroundColor: status === 'completed' ? '#1cc88a' : '#f6c23e',
                    borderColor: status === 'completed' ? '#17a673' : '#e5b343',
                    borderWidth: 1
                }]
            },
            options: {
                indexAxis: 'y', // Ini yang membuat grafik menjadi horizontal
                maintainAspectRatio: false,
                scales: {
                    x: {
                        beginAtZero: true,
                        max: 100
                    },
                    y: {
                        // No specific settings needed for y-axis in horizontal bar chart
                    }
                },
                legend: { display: false },
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

    // Event listeners for limit buttons
    document.querySelectorAll('.filter-limit').forEach(button => {
        button.addEventListener('click', function(e) {
            e.preventDefault();
            const limit = this.dataset.limit;
            const statusFromButton = this.dataset.status; // Get status from button if available

            let statusToUse = currentStatusFilter; // Default to current filter
            if (statusFromButton) { // If button has a specific status (like 'all_status')
                statusToUse = statusFromButton;
                currentStatusFilter = statusFromButton; // Update current filter
            } else if (!currentStatusFilter) { // If no status selected yet, default to 'all_status'
                statusToUse = 'all_status';
            }
            
            updateBarChart(statusToUse, limit);
        });
    });

    // Function to reset the user detail chart to show all users
    function resetUserDetailChart() {
        currentStatusFilter = 'all_status'; // Set filter to show all statuses
        updateBarChart('all_status', '10'); // Default to 10 data teratas
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

    

});
</script>
@endpush