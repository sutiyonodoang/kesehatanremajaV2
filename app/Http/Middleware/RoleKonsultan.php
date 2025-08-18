<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;

class RoleKonsultan
{
    public function handle($request, Closure $next)
    {
        if (Auth::check() && Auth::user()->role === 'konsultan') {
            return $next($request);
        }

        abort(403, 'Unauthorized.');
    }
}