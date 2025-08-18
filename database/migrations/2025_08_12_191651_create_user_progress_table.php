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
        Schema::create('user_progress', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained()->onDelete('cascade');
            $table->string('content_type'); // 'informasi_kesehatan', 'materi_pdf', 'materi_video', 'zoom_room'
            $table->unsignedBigInteger('content_id'); // ID of the specific content item
            $table->boolean('is_completed')->default(false);
            $table->json('progress_data')->nullable(); // For future use, e.g., video percentage, scroll status
            $table->timestamps();

            $table->unique(['user_id', 'content_type', 'content_id']); // Ensure unique progress per user per content
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('user_progress');
    }
};
