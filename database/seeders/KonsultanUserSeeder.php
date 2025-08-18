<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class KonsultanUserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Create default konsultan user
        User::create([
            'name' => 'Dr. Sarah Konsultan',
            'email' => 'konsultan@example.com',
            'password' => Hash::make('password'),
            'role' => 'konsultan',
            'email_verified_at' => now(),
        ]);

        // Create additional konsultan users
        User::create([
            'name' => 'Dr. Ahmad Spesialis',
            'email' => 'ahmad.konsultan@example.com',
            'password' => Hash::make('password'),
            'role' => 'konsultan',
            'email_verified_at' => now(),
        ]);

        User::create([
            'name' => 'Dr. Maria Gizi',
            'email' => 'maria.konsultan@example.com',
            'password' => Hash::make('password'),
            'role' => 'konsultan',
            'email_verified_at' => now(),
        ]);

        $this->command->info('Konsultan users created successfully!');
        $this->command->info('Default login: konsultan@example.com / password');
    }
}
