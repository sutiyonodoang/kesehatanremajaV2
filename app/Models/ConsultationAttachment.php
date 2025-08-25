<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Spatie\Activitylog\Traits\LogsActivity;
use Spatie\Activitylog\LogOptions;

/**
 * @property int $id
 * @property int|null $consultation_id
 * @property int|null $response_id
 * @property string $file_name
 * @property string $file_path
 * @property string $file_type
 * @property int $file_size
 * @property string $original_name
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @property-read \Illuminate\Database\Eloquent\Collection<int, \Spatie\Activitylog\Models\Activity> $activities
 * @property-read int|null $activities_count
 * @property-read \App\Models\Consultation|null $consultation
 * @property-read mixed $file_size_formatted
 * @property-read mixed $file_url
 * @property-read \App\Models\ConsultationResponse|null $response
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ConsultationAttachment newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ConsultationAttachment newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ConsultationAttachment query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ConsultationAttachment whereConsultationId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ConsultationAttachment whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ConsultationAttachment whereFileName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ConsultationAttachment whereFilePath($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ConsultationAttachment whereFileSize($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ConsultationAttachment whereFileType($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ConsultationAttachment whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ConsultationAttachment whereOriginalName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ConsultationAttachment whereResponseId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ConsultationAttachment whereUpdatedAt($value)
 * @mixin \Eloquent
 */
class ConsultationAttachment extends Model
{
    use LogsActivity;
    protected $fillable = [
        'consultation_id',
        'response_id',
        'file_name',
        'file_path',
        'file_type',
        'file_size',
        'original_name'
    ];

    public function consultation(): BelongsTo
    {
        return $this->belongsTo(Consultation::class);
    }

    public function response(): BelongsTo
    {
        return $this->belongsTo(ConsultationResponse::class, 'response_id');
    }

    public function getFileUrlAttribute()
    {
        return asset('storage/' . $this->file_path);
    }

    public function getFileSizeFormattedAttribute()
    {
        $bytes = $this->file_size;
        $units = ['B', 'KB', 'MB', 'GB'];
        
        for ($i = 0; $bytes > 1024 && $i < count($units) - 1; $i++) {
            $bytes /= 1024;
        }
        
        return round($bytes, 2) . ' ' . $units[$i];
    }

    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
            ->logFillable()
            ->logOnlyDirty()
            ->dontSubmitEmptyLogs();
    }
}
