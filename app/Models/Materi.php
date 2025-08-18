<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Spatie\Activitylog\Traits\LogsActivity;
use Spatie\Activitylog\LogOptions;

class Materi extends Model
{
    use HasFactory, LogsActivity;

    protected $fillable = [
        'judul',
        'slug',
        'kategori',
        'deskripsi',
        'sumber',
        'jenis',
        'file_path',
    ];

    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
            ->logFillable()
            ->logOnlyDirty()
            ->dontSubmitEmptyLogs();
    }

    protected static function boot()
    {
        parent::boot();

        static::saving(function ($materi) {
            $materi->slug = Str::slug($materi->judul);
        });
    }

    

    // Relasi ke komentar (dengan user)
    public function komentar()
    {
        return $this->hasMany(Komentar::class);
    }

    // Relasi ke like
    public function likes()
    {
        return $this->hasMany(Like::class);
    }

    /**
     * Get the download logs for the materi.
     */
    public function downloads(): HasMany
    {
        return $this->hasMany(DownloadLog::class);
    }
}
