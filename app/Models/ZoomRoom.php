<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\Traits\LogsActivity;
use Spatie\Activitylog\LogOptions;

/**
 * @property int $id
 * @property string $judul
 * @property string|null $deskripsi
 * @property string $link_meeting
 * @property string $jadwal
 * @property int $created_by
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @property string|null $meeting_id
 * @property string|null $passcode
 * @property-read \Illuminate\Database\Eloquent\Collection<int, \Spatie\Activitylog\Models\Activity> $activities
 * @property-read int|null $activities_count
 * @property-read \App\Models\User $creator
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ZoomRoom newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ZoomRoom newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ZoomRoom query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ZoomRoom whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ZoomRoom whereCreatedBy($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ZoomRoom whereDeskripsi($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ZoomRoom whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ZoomRoom whereJadwal($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ZoomRoom whereJudul($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ZoomRoom whereLinkMeeting($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ZoomRoom whereMeetingId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ZoomRoom wherePasscode($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ZoomRoom whereUpdatedAt($value)
 * @mixin \Eloquent
 */
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
