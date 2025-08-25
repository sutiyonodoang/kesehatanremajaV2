<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\Traits\LogsActivity;
use Spatie\Activitylog\LogOptions;

/**
 * @property int $id
 * @property int $user_id
 * @property string $content_type
 * @property int $content_id
 * @property bool $is_completed
 * @property array<array-key, mixed>|null $progress_data
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @property-read \Illuminate\Database\Eloquent\Collection<int, \Spatie\Activitylog\Models\Activity> $activities
 * @property-read int|null $activities_count
 * @property-read \App\Models\User $user
 * @method static \Illuminate\Database\Eloquent\Builder<static>|UserProgress newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|UserProgress newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|UserProgress query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|UserProgress whereContentId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|UserProgress whereContentType($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|UserProgress whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|UserProgress whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|UserProgress whereIsCompleted($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|UserProgress whereProgressData($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|UserProgress whereUpdatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|UserProgress whereUserId($value)
 * @mixin \Eloquent
 */
class UserProgress extends Model
{
    use LogsActivity;
    protected $fillable = [
        'user_id',
        'content_type',
        'content_id',
        'is_completed',
        'progress_data',
    ];

    protected $casts = [
        'progress_data' => 'array',
        'is_completed' => 'boolean',
    ];

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
