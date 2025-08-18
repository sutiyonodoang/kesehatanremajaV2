<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('consultation_responses', function (Blueprint $table) {
            if (DB::getDriverName() !== 'sqlite') {
                $table->dropForeign(['admin_id']);
            }
            $table->renameColumn('admin_id', 'user_id');
            $table->boolean('is_responder')->default(false)->after('user_id');
            $table->dropColumn('internal_notes');
        });

        Schema::table('consultation_responses', function (Blueprint $table) {
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('consultation_responses', function (Blueprint $table) {
            if (DB::getDriverName() !== 'sqlite') {
                $table->dropForeign(['user_id']);
            }
        });
        
        Schema::table('consultation_responses', function (Blueprint $table) {
            $table->renameColumn('user_id', 'admin_id');
            $table->dropColumn('is_responder');
            $table->text('internal_notes')->nullable();
        });

        Schema::table('consultation_responses', function (Blueprint $table) {
            $table->foreign('admin_id')->references('id')->on('users')->onDelete('cascade');
        });
    }
};
