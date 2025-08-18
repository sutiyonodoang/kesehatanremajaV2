<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Spatie\Activitylog\Traits\LogsActivity;
use Spatie\Activitylog\LogOptions;

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
