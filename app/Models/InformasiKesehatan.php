<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\Traits\LogsActivity;
use Spatie\Activitylog\LogOptions;

/**
 * @property int $id
 * @property string $judul
 * @property string|null $deskripsi
 * @property string $link_sumber
 * @property string $tanggal_update
 * @property int $created_by
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @property-read \Illuminate\Database\Eloquent\Collection<int, \Spatie\Activitylog\Models\Activity> $activities
 * @property-read int|null $activities_count
 * @property-read \App\Models\User $creator
 * @method static \Illuminate\Database\Eloquent\Builder<static>|InformasiKesehatan newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|InformasiKesehatan newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|InformasiKesehatan query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|InformasiKesehatan whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|InformasiKesehatan whereCreatedBy($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|InformasiKesehatan whereDeskripsi($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|InformasiKesehatan whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|InformasiKesehatan whereJudul($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|InformasiKesehatan whereLinkSumber($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|InformasiKesehatan whereTanggalUpdate($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|InformasiKesehatan whereUpdatedAt($value)
 * @mixin \Eloquent
 */
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
