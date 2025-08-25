<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Spatie\Activitylog\Traits\LogsActivity;
use Spatie\Activitylog\LogOptions;

/**
 * @property int $id
 * @property int $consultation_id
 * @property int $user_id
 * @property bool $is_responder
 * @property string $response
 * @property bool $is_public
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @property-read \Illuminate\Database\Eloquent\Collection<int, \Spatie\Activitylog\Models\Activity> $activities
 * @property-read int|null $activities_count
 * @property-read \Illuminate\Database\Eloquent\Collection<int, \App\Models\ConsultationAttachment> $attachments
 * @property-read int|null $attachments_count
 * @property-read \App\Models\Consultation $consultation
 * @property-read \App\Models\User $user
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ConsultationResponse newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ConsultationResponse newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ConsultationResponse query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ConsultationResponse whereConsultationId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ConsultationResponse whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ConsultationResponse whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ConsultationResponse whereIsPublic($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ConsultationResponse whereIsResponder($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ConsultationResponse whereResponse($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ConsultationResponse whereUpdatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ConsultationResponse whereUserId($value)
 * @mixin \Eloquent
 */
class ConsultationResponse extends Model
{
    use LogsActivity;
    protected $fillable = [
        'consultation_id',
        'user_id',
        'is_responder',
        'response',
        'is_public'
    ];

    protected $casts = [
        'is_public' => 'boolean',
        'is_responder' => 'boolean',
    ];

    public function consultation(): BelongsTo
    {
        return $this->belongsTo(Consultation::class);
    }

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function attachments(): HasMany
    {
        return $this->hasMany(ConsultationAttachment::class, 'response_id');
    }

    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
            ->logFillable()
            ->logOnlyDirty()
            ->dontSubmitEmptyLogs();
    }
}