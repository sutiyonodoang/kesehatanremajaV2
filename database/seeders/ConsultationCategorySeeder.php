<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\ConsultationCategory;

class ConsultationCategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $categories = [
            [
                'name' => 'pola_hidup_sehat',
                'description' => 'Konsultasi seputar gaya hidup sehat, olahraga, dan kebugaran.',
                'color' => '#28a745', // Green
                'is_active' => true,
            ],
            [
                'name' => 'reproduksi',
                'description' => 'Konsultasi seputar kesehatan reproduksi pria dan wanita.',
                'color' => '#e83e8c', // Pink
                'is_active' => true,
            ],
            [
                'name' => 'kesehatan_mental',
                'description' => 'Konsultasi seputar kesehatan mental, stres, dan psikologi.',
                'color' => '#6f42c1', // Purple
                'is_active' => true,
            ],
            [
                'name' => 'gizi',
                'description' => 'Konsultasi seputar nutrisi, diet, dan pola makan seimbang.',
                'color' => '#ffc107', // Yellow/Orange
                'is_active' => true,
            ],
            [
                'name' => 'narkoba',
                'description' => 'Konsultasi seputar bahaya narkoba dan penanganannya.',
                'color' => '#dc3545', // Red
                'is_active' => true,
            ],
        ];

        foreach ($categories as $category) {
            ConsultationCategory::create($category);
        }
    }
}
