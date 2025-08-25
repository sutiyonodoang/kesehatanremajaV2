<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>@yield('title') - Platform Edukasi Kesehatan</title>
    <link rel="icon" href="{{ asset('favicon.ico') }}?v=2" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to bottom, #3db2ff, #007bff);
            min-height: 100vh;
        }
    </style>
    <!-- Google tag (gtag.js) -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-M3LZWM1KC1"></script>
    <script>
      window.dataLayer = window.dataLayer || [];
      function gtag(){dataLayer.push(arguments);}
      gtag('js', new Date());

      gtag('config', 'G-M3LZWM1KC1');
    </script>

    <!-- Scripts -->
    @vite(['resources/sass/app.scss', 'resources/js/app.js'])
</head>
<body>
    {{-- Navbar --}}
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow-sm mb-4">
    <div class="container">
        {{-- Brand: Logo +  --}}
        <a class="navbar-brand text-white fw-bold fs-3 d-flex align-items-center" href="{{ route('dashboard') }}">
            <img src="{{ asset('assets/img/edu1.png') }}" alt="Logo EduKes" style="height: 53px; width: auto; margin-right: 10px;">
            SmartHealth
        </a>

        {{-- Navigation Menu --}}
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        
        <div class="collapse navbar-collapse" id="navbarNav">
            @auth
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link {{ request()->routeIs('dashboard') ? 'active' : '' }}" href="{{ route('dashboard') }}">
                            <i class="bi bi-house"></i> Dashboard
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link {{ request()->routeIs('forum.*') ? 'active' : '' }}" href="{{ route('forum.index') }}">
                            <i class="bi bi-chat-dots"></i> Forum Diskusi
                        </a>
                    </li>
                </ul>
            @endauth

            {{-- Profil & Logout --}}
            @auth
                @php
                    $role = Auth::user()->role;
                    $profileRoute = $role === 'admin' 
                        ? route('admin.profile.edit')
                        : route('user.profile.edit');
                @endphp

                <div class="d-flex align-items-center gap-2">
                    <a href="{{ $profileRoute }}" class="btn btn-outline-light btn-sm">
                        <i class="bi bi-person"></i> Profil
                    </a>

                    <form method="POST" action="{{ route('logout') }}">
                        @csrf
                        <button type="submit" class="btn btn-outline-danger btn-sm">
                            <i class="bi bi-box-arrow-right"></i> Logout
                        </button>
                    </form>
                </div>
            @endauth
        </div>
    </div>
    </nav>    {{-- Main Content --}}
    <div class="container pb-5">
        @yield('content')
    </div>

    {{-- Bootstrap JS --}}
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    @stack('scripts')
</body>
</html>
