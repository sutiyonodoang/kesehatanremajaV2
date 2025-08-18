<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('materis', function (Blueprint $table) {
            $table->id();
            $table->string('judul');
            $table->enum('kategori', ['pola_hidup_sehat', 'reproduksi', 'kesehatan_mental']);
            $table->text('deskripsi')->nullable();
            $table->string('jenis')->comment('pdf, doc, link, video');
            $table->string('file_path')->nullable(); // untuk path file upload
            $table->string('link')->nullable(); // jika jenis link
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('materis');
    }
};
