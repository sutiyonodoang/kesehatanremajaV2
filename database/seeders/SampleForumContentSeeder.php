<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\User;
use App\Models\Forum;
use App\Models\ForumThread;
use App\Models\ForumPost;

class SampleForumContentSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Ambil atau buat user untuk contoh
        $user1 = User::first();
        if (!$user1) {
            $user1 = User::create([
                'name' => 'Admin Forum',
                'email' => 'admin@example.com',
                'password' => bcrypt('password'),
                'role' => 'admin'
            ]);
        }

        // Ambil forum yang sudah ada
        $forumKesehatan = Forum::where('slug', 'kesehatan-umum')->first();
        $forumKonsultasi = Forum::where('slug', 'konsultasi-kesehatan')->first();
        $forumGayaHidup = Forum::where('slug', 'gaya-hidup-sehat')->first();

        if ($forumKesehatan) {
            // Thread 1
            $thread1 = ForumThread::create([
                'forum_id' => $forumKesehatan->id,
                'user_id' => $user1->id,
                'title' => 'Tips Menjaga Kesehatan di Musim Hujan',
                'content' => 'Musim hujan sudah tiba. Apa saja tips yang bisa kita lakukan untuk menjaga kesehatan selama musim ini? Yuk sharing pengalaman dan tips kalian!',
                'last_activity' => now()
            ]);

            ForumPost::create([
                'thread_id' => $thread1->id,
                'user_id' => $user1->id,
                'content' => 'Saya biasanya selalu membawa payung dan minum air hangat lebih sering. Juga pastikan pakaian tidak basah kena hujan.'
            ]);

            // Thread 2
            $thread2 = ForumThread::create([
                'forum_id' => $forumKesehatan->id,
                'user_id' => $user1->id,
                'title' => 'Pentingnya Vitamin D untuk Tubuh',
                'content' => 'Vitamin D sangat penting untuk kesehatan tulang dan sistem imun. Bagaimana cara mendapatkan vitamin D yang cukup?',
                'last_activity' => now()->subHours(2)
            ]);
        }

        if ($forumKonsultasi) {
            // Thread konsultasi
            $thread3 = ForumThread::create([
                'forum_id' => $forumKonsultasi->id,
                'user_id' => $user1->id,
                'title' => 'Apakah Normal Merasa Lelah Setelah Makan?',
                'content' => 'Halo teman-teman, saya sering merasa lelah dan mengantuk setelah makan, terutama siang hari. Apakah ini normal? Ada yang punya pengalaman serupa?',
                'last_activity' => now()->subHours(1)
            ]);

            ForumPost::create([
                'thread_id' => $thread3->id,
                'user_id' => $user1->id,
                'content' => 'Itu normal kok, biasa disebut food coma. Tapi kalau terlalu sering, mungkin perlu cek pola makan dan porsinya.'
            ]);
        }

        if ($forumGayaHidup) {
            // Thread gaya hidup
            $thread4 = ForumThread::create([
                'forum_id' => $forumGayaHidup->id,
                'user_id' => $user1->id,
                'title' => 'Olahraga Ringan untuk Pemula',
                'content' => 'Buat yang baru mau mulai olahraga, apa saja jenis olahraga ringan yang cocok untuk pemula? Share pengalaman kalian ya!',
                'last_activity' => now()->subHours(3),
                'is_pinned' => true
            ]);
        }
    }
}
