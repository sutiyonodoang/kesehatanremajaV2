<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Forum;

class ForumSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $forums = [
            [
                'name' => 'Kesehatan Umum',
                'description' => 'Diskusi tentang kesehatan umum, tips hidup sehat, dan informasi kesehatan dasar',
                'slug' => 'kesehatan-umum',
                'sort_order' => 1
            ],
            [
                'name' => 'Konsultasi Kesehatan',
                'description' => 'Tempat bertanya dan berbagi pengalaman seputar masalah kesehatan',
                'slug' => 'konsultasi-kesehatan',
                'sort_order' => 2
            ],
            [
                'name' => 'Gaya Hidup Sehat',
                'description' => 'Diskusi tentang olahraga, nutrisi, dan pola hidup sehat',
                'slug' => 'gaya-hidup-sehat',
                'sort_order' => 3
            ],
            [
                'name' => 'Kesehatan Mental',
                'description' => 'Pembahasan seputar kesehatan mental, stress management, dan wellbeing',
                'slug' => 'kesehatan-mental',
                'sort_order' => 4
            ],
            [
                'name' => 'Diskusi Umum',
                'description' => 'Ruang diskusi bebas untuk topik-topik lain yang berkaitan dengan platform',
                'slug' => 'diskusi-umum',
                'sort_order' => 5
            ]
        ];

        foreach ($forums as $forum) {
            Forum::create($forum);
        }
    }
}
