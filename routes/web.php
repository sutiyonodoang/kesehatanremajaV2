<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\DashboardController as AdminDashboard;
use App\Http\Controllers\Admin\UserController as AdminUser;
use App\Http\Controllers\Admin\InformasiKesehatanController as AdminInformasiKesehatan;
use App\Http\Controllers\Admin\MateriController as AdminMateri;
use App\Http\Controllers\Admin\ZoomRoomController as AdminZoom;
use App\Http\Controllers\Admin\ProfileController as AdminProfile;
use App\Http\Controllers\Admin\ConsultationController as AdminConsultation;
use App\Http\Controllers\Admin\ConsultationCategoryController as AdminConsultationCategory;
use App\Http\Controllers\Admin\ActivityLogController as AdminActivityLog;

use App\Http\Controllers\User\DashboardController as UserDashboard;
use App\Http\Controllers\User\InformasiKesehatanController as UserInformasiKesehatan;
use App\Http\Controllers\User\MateriController as UserMateri;
use App\Http\Controllers\User\ZoomRoomController as UserZoom;
use App\Http\Controllers\User\ProfileController as UserProfile ;
use App\Http\Controllers\User\ConsultationController as UserConsultation;
use App\Http\Controllers\UserProgressController;

use App\Http\Controllers\Konsultan\DashboardController as KonsultanDashboard;
use App\Http\Controllers\Konsultan\ConsultationController as KonsultanConsultation;

use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Auth\RegisterController;
use App\Http\Controllers\KomentarController;
use App\Http\Controllers\LikeController;
use App\Http\Controllers\Auth\ForgotPasswordController;
use App\Http\Controllers\Auth\ResetPasswordController;

// Redirect halaman utama ke login
Route::get('/', function () {
    return view('welcome');
})->name('home');

//AUTH
Route::get('login', [LoginController::class, 'showLoginForm'])->name('login')->middleware('guest');
Route::post('login', [LoginController::class, 'login']);
Route::post('logout', [LoginController::class, 'logout'])->name('logout');
Route::get('register', [RegisterController::class, 'showRegistrationForm'])->name('register')->middleware('guest');
Route::post('register', [RegisterController::class, 'register']);

// Rute khusus untuk ADMIN
Route::middleware(['auth', 'roleadmin'])->prefix('admin')->name('admin.')->group(function () {
    Route::get('/dashboard', [AdminDashboard::class, 'index'])->name('dashboard');
    
    Route::get('materi/semua', [AdminMateri::class, 'showAll'])->name('materi.semua');
    
    Route::resource('users', AdminUser::class);
    Route::resource('informasi-kesehatan', AdminInformasiKesehatan::class);
    Route::resource('materi', AdminMateri::class); // Moved this line up
    Route::get('materi/{materi}/detail', [AdminMateri::class, 'showDetail'])->name('materi.detail');
    Route::resource('zoom-rooms', AdminZoom::class);
    Route::get('profile', [AdminProfile::class, 'index'])->name('profile');
    Route::get('profile/edit', [AdminProfile::class, 'edit'])->name('profile.edit');
    Route::post('profile/edit', [AdminProfile::class, 'update'])->name('profile.update');
    Route::post('komentar/{komentar}/balas', [KomentarController::class, 'balas'])->name('komentar.balas');
    Route::get('materi/{materi}/stream', [AdminMateri::class, 'streamFile'])->name('materi.stream');
    
    // Consultation routes
    Route::resource('consultations', AdminConsultation::class);
    Route::post('consultations/{consultation}/response', [AdminConsultation::class, 'storeResponse'])->name('consultations.response');
    Route::patch('consultations/{consultation}/finish', [AdminConsultation::class, 'finish'])->name('consultations.finish');
    Route::resource('consultation-categories', AdminConsultationCategory::class);
    Route::get('reports', [App\Http\Controllers\Admin\ReportController::class, 'index'])->name('reports.index');
    Route::get('activity-logs', [AdminActivityLog::class, 'index'])->name('activity-logs.index');
});

// Rute khusus untuk KONSULTAN
Route::middleware(['auth', \App\Http\Middleware\RoleKonsultan::class])->prefix('konsultan')->name('konsultan.')->group(function () {
    Route::get('/dashboard', [KonsultanDashboard::class, 'index'])->name('dashboard');
    
    // Consultation routes
    Route::resource('consultations', KonsultanConsultation::class);
    Route::post('consultations/{consultation}/response', [KonsultanConsultation::class, 'storeResponse'])->name('consultations.response');
    Route::patch('consultations/{consultation}/finish', [KonsultanConsultation::class, 'finish'])->name('consultations.finish');
});

// Rute khusus untuk USER
Route::middleware(['auth', 'roleuser'])->prefix('user')->name('user.')->group(function () {
    Route::get('/dashboard', [UserDashboard::class, 'index'])->name('dashboard');
    Route::resource('materi', UserMateri::class)->only(['index', 'show']);
    Route::get('materi/{materi}/stream', [UserMateri::class, 'streamFile'])->name('materi.stream');
    Route::resource('informasi-kesehatan', UserInformasiKesehatan::class)->only(['index', 'show']);
    Route::post('materi/{materi}/komentar', [KomentarController::class, 'store'])->name('materi.komentar.store');
    Route::post('materi/{materi}/like', [LikeController::class, 'toggle'])->name('materi.like.toggle');
    Route::get('materi/{materi}/download', [UserMateri::class, 'downloadFile'])->name('materi.download');
    Route::resource('zoom-rooms', UserZoom::class)->only(['index', 'show']);
    Route::get('zoom-rooms/{zoomRoom}/get-detail', [UserZoom::class, 'getDetail'])->name('zoom-rooms.get-detail');
    Route::get('profile', [UserProfile::class, 'index'])->name('profile');
    Route::get('profile/edit', [UserProfile::class, 'edit'])->name('profile.edit');
    Route::post('profile/edit', [UserProfile::class, 'update'])->name('profile.update');
    Route::post('track-progress', [UserProgressController::class, 'track'])->name('track-progress');
    
    // Consultation routes
    Route::resource('consultations', UserConsultation::class);
    Route::post('consultations/{consultation}/response', [UserConsultation::class, 'storeResponse'])->name('consultations.response');
});

// Otomatis redirect berdasarkan role setelah login
Route::get('/dashboard', function () {
    if (auth()->user()->role === 'admin') {
        return redirect()->route('admin.dashboard');
    } elseif (auth()->user()->role === 'konsultan') {
        return redirect()->route('konsultan.dashboard');
    } else {
        return redirect()->route('user.dashboard');
    }
})->middleware('auth')->name('dashboard');

// resset password
Route::get('forgot-password', [ForgotPasswordController::class, 'showLinkRequestForm'])
    ->middleware('guest')
    ->name('password.request');

Route::post('forgot-password', [ForgotPasswordController::class, 'sendResetLinkEmail'])
    ->middleware('guest')
    ->name('password.email');

Route::get('reset-password/{token}', [ResetPasswordController::class, 'showResetForm'])
    ->middleware('guest')
    ->name('password.reset');

// Submit password baru
Route::post('reset-password', [ResetPasswordController::class, 'reset'])
    ->middleware('guest')
    ->name('password.update');

// likes n komen