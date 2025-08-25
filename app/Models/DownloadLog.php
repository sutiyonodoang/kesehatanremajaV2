<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Spatie\Activitylog\Traits\LogsActivity;
use Spatie\Activitylog\LogOptions;

/**
 * @property int $id
 * @property int $user_id
 * @property int $materi_id
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @property-read \Illuminate\Database\Eloquent\Collection<int, \Spatie\Activitylog\Models\Activity> $activities
 * @property-read int|null $activities_count
 * @property-read \App\Models\Materi $materi
 * @property-read \App\Models\User $user
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DownloadLog newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DownloadLog newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DownloadLog query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DownloadLog whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DownloadLog whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DownloadLog whereMateriId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DownloadLog whereUpdatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DownloadLog whereUserId($value)
 * @mixin \Eloquent
 */
class DownloadLog extends Model
{
    use LogsActivity;
    protected $fillable = [
        'user_id',
        'materi_id',
    ];

    /**
     * Get the user that owns the download log.
     */
    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    /**
     * Get the materi that was downloaded.
     */
    public function materi(): BelongsTo
    {
        return $this->belongsTo(Materi::class);
    }

    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
            ->logFillable()
            ->logOnlyDirty()
            ->dontSubmitEmptyLogs();
    }
}