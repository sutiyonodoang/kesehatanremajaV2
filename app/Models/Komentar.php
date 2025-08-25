<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\Traits\LogsActivity;
use Spatie\Activitylog\LogOptions;

/**
 * @property int $id
 * @property int $materi_id
 * @property int $user_id
 * @property string $isi_komentar
 * @property string|null $balasan_admin
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @property-read \Illuminate\Database\Eloquent\Collection<int, \Spatie\Activitylog\Models\Activity> $activities
 * @property-read int|null $activities_count
 * @property-read \App\Models\Materi $materi
 * @property-read \App\Models\User $user
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Komentar newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Komentar newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Komentar query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Komentar whereBalasanAdmin($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Komentar whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Komentar whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Komentar whereIsiKomentar($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Komentar whereMateriId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Komentar whereUpdatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Komentar whereUserId($value)
 * @mixin \Eloquent
 */
class Komentar extends Model
{
    // 
    use HasFactory, LogsActivity;
    protected $fillable = [
        'materi_id',
        'user_id',
        'isi_komentar',
        'balasan_admin'
    ];
    public function materi()
    {
        return $this->belongsTo(Materi::class);
    }
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
            ->logFillable()
            ->logOnlyDirty()
            ->dontSubmitEmptyLogs();
    }
}
