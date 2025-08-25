<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Spatie\Activitylog\Traits\LogsActivity;
use Spatie\Activitylog\LogOptions;

/**
 * @property int $id
 * @property string $judul
 * @property string|null $slug
 * @property string $kategori
 * @property string|null $deskripsi
 * @property string|null $sumber Sumber materi
 * @property string $jenis pdf, doc, link, video
 * @property string|null $file_path
 * @property string|null $link
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @property string $status
 * @property-read \Illuminate\Database\Eloquent\Collection<int, \Spatie\Activitylog\Models\Activity> $activities
 * @property-read int|null $activities_count
 * @property-read \Illuminate\Database\Eloquent\Collection<int, \App\Models\DownloadLog> $downloads
 * @property-read int|null $downloads_count
 * @property-read \Illuminate\Database\Eloquent\Collection<int, \App\Models\Komentar> $komentar
 * @property-read int|null $komentar_count
 * @property-read \Illuminate\Database\Eloquent\Collection<int, \App\Models\Like> $likes
 * @property-read int|null $likes_count
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Materi newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Materi newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Materi query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Materi whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Materi whereDeskripsi($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Materi whereFilePath($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Materi whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Materi whereJenis($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Materi whereJudul($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Materi whereKategori($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Materi whereLink($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Materi whereSlug($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Materi whereStatus($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Materi whereSumber($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Materi whereUpdatedAt($value)
 * @mixin \Eloquent
 */
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
