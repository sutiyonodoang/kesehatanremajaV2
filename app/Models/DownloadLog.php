<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Spatie\Activitylog\Traits\LogsActivity;
use Spatie\Activitylog\LogOptions;

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