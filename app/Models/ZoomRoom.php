<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\Traits\LogsActivity;
use Spatie\Activitylog\LogOptions;

class ZoomRoom extends Model
{
    use HasFactory, LogsActivity;
    protected $fillable = [
        'judul',
        'deskripsi',
        'link_meeting',
        'jadwal',
        'created_by',
        'meeting_id',
        'passcode',
    ];
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
