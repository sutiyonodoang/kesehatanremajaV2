<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Spatie\Activitylog\Traits\LogsActivity;
use Spatie\Activitylog\LogOptions;

/**
 * @property int $id
 * @property string $name
 * @property string|null $description
 * @property string $color
 * @property bool $is_active
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @property-read \Illuminate\Database\Eloquent\Collection<int, \Spatie\Activitylog\Models\Activity> $activities
 * @property-read int|null $activities_count
 * @property-read \Illuminate\Database\Eloquent\Collection<int, \App\Models\Consultation> $consultations
 * @property-read int|null $consultations_count
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ConsultationCategory newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ConsultationCategory newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ConsultationCategory query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ConsultationCategory whereColor($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ConsultationCategory whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ConsultationCategory whereDescription($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ConsultationCategory whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ConsultationCategory whereIsActive($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ConsultationCategory whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ConsultationCategory whereUpdatedAt($value)
 * @mixin \Eloquent
 */
class ConsultationCategory extends Model
{
    use LogsActivity;
    protected $fillable = [
        'name',
        'description',
        'color',
        'is_active'
    ];

    protected $casts = [
        'is_active' => 'boolean'
    ];

    public function consultations(): HasMany
    {
        return $this->hasMany(Consultation::class, 'category_id');
    }

    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
            ->logFillable()
            ->logOnlyDirty()
            ->dontSubmitEmptyLogs();
    }
}
