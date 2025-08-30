<?php

require 'vendor/autoload.php';
$app = require_once 'bootstrap/app.php';
$app->make(Illuminate\Contracts\Console\Kernel::class)->bootstrap();

// Cek materi ID 15 setelah update
$materi = App\Models\Materi::find(15);
if ($materi) {
    echo "Materi ID: " . $materi->id . "\n";
    echo "Title: " . $materi->judul . "\n";
    echo "File Path: " . $materi->file_path . "\n";
    echo "File exists: " . (file_exists(storage_path('app/public/' . $materi->file_path)) ? 'Yes' : 'No') . "\n";
    echo "Full file path: " . storage_path('app/public/' . $materi->file_path) . "\n";
} else {
    echo "Materi ID 15 not found\n";
}
