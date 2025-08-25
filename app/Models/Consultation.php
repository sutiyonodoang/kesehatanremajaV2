<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Spatie\Activitylog\Traits\LogsActivity;
use Spatie\Activitylog\LogOptions;

/**
 * @property int $id
 * @property int $user_id
 * @property int $category_id
 * @property string $title
 * @property string $description
 * @property string $priority
 * @property string $status
 * @property \Illuminate\Support\Carbon|null $resolved_at
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @property-read \Illuminate\Database\Eloquent\Collection<int, \Spatie\Activitylog\Models\Activity> $activities
 * @property-read int|null $activities_count
 * @property-read \Illuminate\Database\Eloquent\Collection<int, \App\Models\ConsultationAttachment> $attachments
 * @property-read int|null $attachments_count
 * @property-read \App\Models\ConsultationCategory $category
 * @property-read \App\Models\ConsultationResponse|null $latestResponse
 * @property-read \Illuminate\Database\Eloquent\Collection<int, \App\Models\ConsultationResponse> $responses
 * @property-read int|null $responses_count
 * @property-read \App\Models\User $user
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Consultation menunggu()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Consultation newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Consultation newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Consultation proses()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Consultation query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Consultation selesai()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Consultation whereCategoryId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Consultation whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Consultation whereDescription($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Consultation whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Consultation wherePriority($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Consultation whereResolvedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Consultation whereStatus($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Consultation whereTitle($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Consultation whereUpdatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Consultation whereUserId($value)
 * @mixin \Eloquent
 */
class Consultation extends Model
{
    use LogsActivity;
    protected $fillable = [
        'user_id',
        'category_id',
        'title',
        'description',
        'priority',
        'status'
    ];

    protected $casts = [
        'resolved_at' => 'datetime'
    ];

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    public function category(): BelongsTo
    {
        return $this->belongsTo(ConsultationCategory::class, 'category_id');
    }

    public function responses(): HasMany
    {
        return $this->hasMany(ConsultationResponse::class);
    }

    public function attachments(): HasMany
    {
        return $this->hasMany(ConsultationAttachment::class);
    }

    public function latestResponse(): HasOne
    {
        return $this->hasOne(ConsultationResponse::class)->latest();
    }

    public function scopeMenunggu($query)
    {
        return $query->where('status', 'menunggu');
    }

    public function scopeProses($query)
    {
        return $query->where('status', 'proses');
    }

    public function scopeSelesai($query)
    {
        return $query->where('status', 'selesai');
    }

    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
            ->logFillable()
            ->logOnlyDirty()
            ->dontSubmitEmptyLogs();
    }
}
