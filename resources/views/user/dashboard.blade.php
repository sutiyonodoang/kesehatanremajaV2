@extends('layouts.app')

@section('title', 'Dashboard')

@section('content')
<div class="container-fluid">
    <!-- Welcome Section -->
    <div class="row mb-4">
        <div class="col-12">
            <div class="card shadow rounded-4 border-0">
                <div class="card-body bg-primary text-white rounded-4">
                    <h4 class="fw-bold mb-0">Selamat Datang, {{ Auth::user()->name }}!</h4>
                    <p class="mb-0">Bangun pemahaman kesehatan yang komprehensif melalui pembelajaran interaktif</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Tab Navigation -->
    <div class="row mb-4">
        <div class="col-12">
            <div class="card shadow">
                <div class="card-header">
                    <ul class="nav nav-tabs card-header-tabs" id="dashboardTabs" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active" id="quick-actions-tab" data-bs-toggle="tab" data-bs-target="#quick-actions" type="button" role="tab" aria-controls="quick-actions" aria-selected="true">
                                <i class="fas fa-bolt me-2"></i>Quick Actions
                            </button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="progress-tab" data-bs-toggle="tab" data-bs-target="#progress" type="button" role="tab" aria-controls="progress" aria-selected="false">
                                <i class="fas fa-chart-line me-2"></i>Progress Belajar
                            </button>
                        </li>
                    </ul>
                </div>
                <div class="card-body">
                    <div class="tab-content" id="dashboardTabsContent">
                        <!-- Quick Actions Tab -->
                        <div class="tab-pane fade show active" id="quick-actions" role="tabpanel" aria-labelledby="quick-actions-tab">
                            <div class="row">
                                <div class="col-md-4 mb-4">
                                    <div class="card text-white shadow rounded-4 border-0 h-100" style="background-color: #5bc0de;">
                                        <div class="card-body d-flex flex-column justify-content-center">
                                            <div class="text-center">
                                                <div class="feature-icon text-center fs-2 mb-3">🔎</div>
                                                <h5 class="card-title fw-bold text-center mb-3">Informasi Kesehatan</h5>
                                                <a href="{{ route('user.informasi-kesehatan.index') }}" class="btn btn-light btn-sm">Lihat</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-4 mb-4">
                                    <div class="card text-white shadow rounded-4 border-0 h-100" style="background-color: #5cb85c;">
                                        <div class="card-body d-flex flex-column justify-content-center">
                                            <div class="text-center">
                                                <div class="feature-icon text-center fs-2 mb-3">📚</div>
                                                <h5 class="card-title fw-bold text-center mb-3">Materi Edukasi</h5>
                                                <a href="{{ route('user.materi.index') }}" class="btn btn-light btn-sm">Lihat</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-4 mb-4">
                                    <div class="card text-white shadow rounded-4 border-0 h-100" style="background-color: #f0ad4e;">
                                        <div class="card-body d-flex flex-column justify-content-center">
                                            <div class="text-center">
                                                <div class="feature-icon text-center fs-2 mb-3">🎥</div>
                                                <h5 class="card-title fw-bold text-center mb-3">Zoom Meeting</h5>
                                                <a href="{{ route('user.zoom-rooms.index') }}" class="btn btn-light btn-sm">Lihat</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Additional Quick Actions -->
                            <div class="row mt-4">
                                <div class="col-md-6 mb-4">
                                    <div class="card text-white shadow rounded-4 border-0 h-100" style="background-color: #6c757d;">
                                        <div class="card-body d-flex flex-column justify-content-center">
                                            <div class="text-center">
                                                <div class="feature-icon text-center fs-2 mb-3"><i class="bi bi-chat-dots-fill"></i></div>
                                                <h5 class="card-title fw-bold text-center mb-3">Forum Diskusi</h5>
                                                <a href="{{ route('forum.index') }}" class="btn btn-light btn-sm">Diskusi</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6 mb-4">
                                    <div class="card text-white shadow rounded-4 border-0 h-100" style="background-color: #17a2b8;">
                                        <div class="card-body d-flex flex-column justify-content-center">
                                            <div class="text-center">
                                                <div class="feature-icon text-center fs-2 mb-3"><i class="bi bi-person-fill"></i></div>
                                                <h5 class="card-title fw-bold text-center mb-3">Konsultasi</h5>
                                                <a href="{{ route('user.consultations.index') }}" class="btn btn-light btn-sm">Lihat</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Progress Tab -->
                        <div class="tab-pane fade" id="progress" role="tabpanel" aria-labelledby="progress-tab">
                            <div class="row">
                                <!-- Progress Belajar Anda (30%) -->
                                <div class="col-lg-4 col-md-12 mb-4">
                                    <div class="card shadow h-100">
                                        <div class="card-header py-3">
                                            <h6 class="m-0 font-weight-bold text-primary">
                                                <i class="fas fa-chart-line"></i> Progress Belajar Anda
                                            </h6>
                                        </div>
                                        <div class="card-body">
                                            <div class="text-center mb-4">
                                                <div class="progress-circle" data-percentage="{{ $progressPercentage }}">
                                                    <h1 class="progress-value">{{ $progressPercentage }}%</h1>
                                                </div>
                                                <h3 class="mt-3 fw-bold text-primary text-uppercase" style="text-shadow: 2px 2px 4px rgba(0,123,255,0.3); letter-spacing: 1px;">Total Progress</h3>
                                            </div>
                                            <div>
                                                <hr>
                                            </div>

                                            <div class="progress-details">
                                                <div class="d-flex justify-content-between mb-2">
                                                    <span>Materi Pembelajaran</span>
                                                    <span>{{ $completedMateri }}/{{ $totalMateri }}</span>
                                                </div>
                                                <div class="progress mb-3">
                                                    <div class="progress-bar bg-primary" role="progressbar"
                                                         style="width: {{ $totalMateri > 0 ? ($completedMateri / $totalMateri) * 100 : 0 }}%"></div>
                                                </div>

                                                <div class="d-flex justify-content-between mb-2">
                                                    <span>Informasi Kesehatan</span>
                                                    <span>{{ $completedInformasi }}/{{ $totalInformasi }}</span>
                                                </div>
                                                <div class="progress mb-3">
                                                    <div class="progress-bar bg-success" role="progressbar"
                                                         style="width: {{ $totalInformasi > 0 ? ($completedInformasi / $totalInformasi) * 100 : 0 }}%"></div>
                                                </div>

                                                <div class="d-flex justify-content-between mb-2">
                                                    <span>Zoom Meeting</span>
                                                    <span>{{ $completedZoom }}/{{ $totalZoom }}</span>
                                                </div>
                                                <div class="progress mb-3">
                                                    <div class="progress-bar bg-warning" role="progressbar"
                                                         style="width: {{ $totalZoom > 0 ? ($completedZoom / $totalZoom) * 100 : 0 }}%"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Grafik Bar Progress per Kategori (70%) -->
                                <div class="col-lg-8 col-md-12 mb-4">
                                    <div class="card shadow h-100">
                                        <div class="card-header py-3">
                                            <h6 class="m-0 font-weight-bold text-success">
                                                <i class="fas fa-chart-bar"></i> Progress Penyelesaian per Kategori
                                            </h6>
                                        </div>
                                        <div class="card-body">
                                            <div class="chart-container" style="height: 400px;">
                                                <canvas id="categoryProgressChart"></canvas>
                                            </div>

                                            <!-- Legend -->
                                            <div class="row mt-4" id="categoryLegend">
                                                @foreach($categoryProgress as $category)
                                                <div class="col-md-6 col-lg-4 mb-3">
                                                    <div class="d-flex align-items-center">
                                                        <div class="legend-color me-2"
                                                             style="width: 16px; height: 16px; background-color: {{ $category['color'] }}; border-radius: 3px;"></div>
                                                        <div class="flex-grow-1">
                                                            <small class="text-muted d-block">{{ $category['name'] }}</small>
                                                            <small class="fw-bold">{{ $category['completed'] }}/{{ $category['total'] }} ({{ $category['percentage'] }}%)</small>
                                                        </div>
                                                    </div>
                                                </div>
                                                @endforeach
                                            </div>
                                        </div>
                                    </div>
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

@push('styles')
<style>
.progress-circle {
    position: relative;
    width: 200px;
    height: 200px;
    margin: 0 auto 20px;
    border-radius: 50%;
    background: conic-gradient(#007bff 0% {{ $progressPercentage }}%, #e9ecef {{ $progressPercentage }}% 100%);
    box-shadow: 0 8px 25px rgba(0, 123, 255, 0.3);
    border: 4px solid #ffffff;
    transition: all 0.3s ease;
}

.progress-circle:hover {
    transform: scale(1.05);
    box-shadow: 0 12px 35px rgba(0, 123, 255, 0.4);
}

.progress-circle::before {
    content: '';
    position: absolute;
    top: 15px;
    left: 15px;
    right: 15px;
    bottom: 15px;
    border-radius: 50%;
    background: linear-gradient(135deg, #ffffff 0%, #f8f9fa 100%);
    border: 3px solid #e9ecef;
}

.progress-text {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    font-size: 48px;
    font-weight: 900;
    color: #007bff;
    text-shadow: 2px 2px 4px rgba(0, 123, 255, 0.3);
    z-index: 10;
}

.progress-details {
    margin-top: 20px;
}

.legend-color {
    flex-shrink: 0;
}

/* Tab Styles */
.nav-tabs .nav-link {
    border: none;
    border-bottom: 2px solid transparent;
    color: #6c757d;
    font-weight: 500;
    padding: 12px 24px;
    transition: all 0.3s ease;
}

.nav-tabs .nav-link:hover {
    border-color: #dee2e6;
    color: #495057;
}

.nav-tabs .nav-link.active {
    border-bottom: 2px solid #007bff;
    color: #007bff;
    background-color: transparent;
}

.nav-tabs .nav-link.active i {
    color: #007bff;
}

.tab-content {
    padding: 20px 0;
}

/* Card hover effects */
.card {
    transition: transform 0.2s ease, box-shadow 0.2s ease;
}

.card:hover {
    transform: translateY(-2px);
    box-shadow: 0 4px 15px rgba(0,0,0,0.1) !important;
}

/* Feature icon animation */
.feature-icon {
    transition: transform 0.3s ease;
}

.card:hover .feature-icon {
    transform: scale(1.1);
}

/* Responsive adjustments */
@media (max-width: 768px) {
    .nav-tabs .nav-link {
        padding: 8px 16px;
        font-size: 14px;
    }

    .progress-circle {
        width: 150px;
        height: 150px;
    }

    .progress-text {
        font-size: 32px;
    }
}
</style>
@endpush

@push('scripts')
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
document.addEventListener('DOMContentLoaded', function() {
    // Initialize Bootstrap tabs
    var triggerTabList = [].slice.call(document.querySelectorAll('#dashboardTabs button'))
    triggerTabList.forEach(function (triggerEl) {
        var tabTrigger = new bootstrap.Tab(triggerEl)

        triggerEl.addEventListener('click', function (event) {
            event.preventDefault()
            tabTrigger.show()
        })
    })

    // Initialize Chart.js only when Progress tab is shown
    var progressTab = document.getElementById('progress-tab');
    var chartInitialized = false;

    function initializeChart() {
        if (chartInitialized) return;

        const categoryData = @json($categoryProgress);

        // Chart.js configuration
        const ctx = document.getElementById('categoryProgressChart').getContext('2d');
        new Chart(ctx, {
            type: 'bar',
            data: {
                labels: categoryData.map(cat => cat.name),
                datasets: [{
                    label: 'Persentase Penyelesaian (%)',
                    data: categoryData.map(cat => cat.percentage),
                    backgroundColor: categoryData.map(cat => cat.color),
                    borderColor: categoryData.map(cat => cat.color),
                    borderWidth: 1,
                    borderRadius: 4,
                    borderSkipped: false,
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        display: false
                    },
                    tooltip: {
                        callbacks: {
                            label: function(context) {
                                const category = categoryData[context.dataIndex];
                                return [
                                    `Penyelesaian: ${category.completed}/${category.total}`,
                                    `Persentase: ${category.percentage}%`
                                ];
                            }
                        }
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true,
                        max: 100,
                        title: {
                            display: true,
                            text: 'Persentase (%)'
                        },
                        ticks: {
                            callback: function(value) {
                                return value + '%';
                            }
                        }
                    },
                    x: {
                        title: {
                            display: true,
                            text: 'Kategori'
                        },
                        ticks: {
                            maxRotation: 45,
                            minRotation: 45
                        }
                    }
                }
            }
        });

        chartInitialized = true;
    }

    // Initialize chart when progress tab is shown
    progressTab.addEventListener('shown.bs.tab', function (event) {
        setTimeout(initializeChart, 100); // Small delay to ensure tab content is visible
    });

    // If progress tab is active on page load, initialize chart immediately
    if (document.querySelector('#progress-tab').classList.contains('active')) {
        setTimeout(initializeChart, 100);
    }
});
</script>
@endpush
