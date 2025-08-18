<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Spatie\Activitylog\Models\Activity;

class LoginController extends Controller
{
    public function showLoginForm()
    {
        $number1 = rand(1, 9);
        $number2 = rand(1, 9);
        session(['captcha_question' => "$number1 + $number2 = ?", 'captcha_answer' => $number1 + $number2]);
        return view('auth.login');
    }

    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
            'captcha' => ['required', 'numeric', function ($attribute, $value, $fail) {
                if ($value != session('captcha_answer')) {
                    $fail('Jawaban captcha salah.');
                }
            }],
        ]);

        $credentials = $request->only('email', 'password');

        if (Auth::attempt($credentials)) {
            $user = Auth::user();
            activity()->performedOn($user)->log('User logged in');

            if ($user->role === 'admin') {
                activity()->performedOn($user)->log('User logged in');
                return redirect()->route('admin.dashboard');
            } elseif ($user->role === 'konsultan') {
                return redirect()->route('konsultan.dashboard');
            } elseif ($user->role === 'user') {
                return redirect()->route('user.dashboard');
            } else {
                Auth::logout();
                return redirect('login')->withErrors(['email' => 'Role tidak dikenali.']);
            }
        }

        return back()->withErrors([
            'email' => 'Email atau password salah.',
        ]);
    }
    public function logout(Request $request)
    {
        activity()->performedOn(Auth::user())->log('User logged out');
        Auth::logout();

        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return redirect('/');
    }
}
