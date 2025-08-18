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
        Schema::table('materis', function (Blueprint $table) {
            $table->enum('kategori', ['pola_hidup_sehat', 'reproduksi', 'kesehatan_mental', 'gizi', 'narkoba'])->change();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('materis', function (Blueprint $table) {
            $table->enum('kategori', ['pola_hidup_sehat', 'reproduksi', 'kesehatan_mental'])->change();
        });
    }
};
