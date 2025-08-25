<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;

/**
 * Class ForumThread
 *
 * @property int $id
 * @property int $forum_id
 * @property int $user_id
 * @property string $title
 * @property string $content
 * @property bool $is_pinned
 * @property bool $is_locked
 * @property int $views_count
 * @property \Carbon\Carbon $last_activity
 * @property \Carbon\Carbon $created_at
 * @property \Carbon\Carbon $updated_at
 * @property-read \App\Models\Forum $forum
 * @property-read \App\Models\User $user
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\Models\ForumPost[] $posts
 * @property-read \App\Models\ForumPost $latestPost
 * @property-read int $posts_count
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ForumThread newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ForumThread newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ForumThread query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ForumThread whereContent($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ForumThread whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ForumThread whereForumId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ForumThread whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ForumThread whereIsLocked($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ForumThread whereIsPinned($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ForumThread whereLastActivity($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ForumThread whereTitle($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ForumThread whereUpdatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ForumThread whereUserId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ForumThread whereViewsCount($value)
 * @mixin \Eloquent
 */
class ForumThread extends Model
{
    protected $fillable = [
        'forum_id',
        'user_id',
        'title',
        'content',
        'is_pinned',
        'is_locked',
        'views_count',
        'last_activity'
    ];

    protected $casts = [
        'is_pinned' => 'boolean',
        'is_locked' => 'boolean',
        'last_activity' => 'datetime'
    ];

    public function forum(): BelongsTo
    {
        return $this->belongsTo(Forum::class);
    }

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    public function posts(): HasMany
    {
        return $this->hasMany(ForumPost::class, 'thread_id');
    }

    public function latestPost(): HasOne
    {
        return $this->hasOne(ForumPost::class, 'thread_id')->latest();
    }

    public function incrementViews()
    {
        $this->increment('views_count');
    }
}
