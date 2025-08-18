<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\Traits\LogsActivity;
use Spatie\Activitylog\LogOptions;

class InformasiKesehatan extends Model
{
    //
    use HasFactory, LogsActivity;
    protected $table = 'informasi_kesehatan';

    // Field yang bisa diisi
    protected $fillable = [
        'judul',
        'deskripsi',
        'link_sumber',
        'tanggal_update',
        'created_by',
    ];

    // Konversi tanggal otomatis ke objek Carbon
    protected $dates = [
        'tanggal_update',
        'created_at',
        'updated_at',
    ];

    // Relasi ke user (admin yang membuat)
    public function creator()
    {
        return $this->belongsTo(User::class, 'created_by');
    }

    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
            ->logFillable()
            ->logOnlyDirty()
            ->dontSubmitEmptyLogs();
    }
}
