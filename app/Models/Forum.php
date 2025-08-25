<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

/**
 * Class Forum
 *
 * @property int $id
 * @property string $name
 * @property string $description
 * @property string $slug
 * @property bool $is_active
 * @property int $sort_order
 * @property \Carbon\Carbon $created_at
 * @property \Carbon\Carbon $updated_at
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\Models\ForumThread[] $threads
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\Models\ForumThread[] $latestThreads
 * @property-read int $threads_count
 * @property-read int|null $latest_threads_count
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Forum newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Forum newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Forum query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Forum whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Forum whereDescription($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Forum whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Forum whereIsActive($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Forum whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Forum whereSlug($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Forum whereSortOrder($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Forum whereUpdatedAt($value)
 * @mixin \Eloquent
 */
class Forum extends Model
{
    protected $fillable = [
        'name',
        'description',
        'slug',
        'is_active',
        'sort_order'
    ];

    protected $casts = [
        'is_active' => 'boolean'
    ];

    public function threads(): HasMany
    {
        return $this->hasMany(ForumThread::class);
    }

    public function latestThreads(): HasMany
    {
        return $this->threads()->latest('last_activity');
    }
}
