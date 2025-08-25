<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

/**
 * Class ForumPost
 *
 * @property int $id
 * @property int $thread_id
 * @property int $user_id
 * @property string $content
 * @property bool $is_approved
 * @property \Carbon\Carbon $created_at
 * @property \Carbon\Carbon $updated_at
 * @property-read \App\Models\ForumThread $thread
 * @property-read \App\Models\User $user
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ForumPost newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ForumPost newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ForumPost query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ForumPost whereContent($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ForumPost whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ForumPost whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ForumPost whereIsApproved($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ForumPost whereThreadId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ForumPost whereUpdatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ForumPost whereUserId($value)
 * @mixin \Eloquent
 */
class ForumPost extends Model
{
    protected $fillable = [
        'thread_id',
        'user_id',
        'content',
        'is_approved'
    ];

    protected $casts = [
        'is_approved' => 'boolean'
    ];

    public function thread(): BelongsTo
    {
        return $this->belongsTo(ForumThread::class, 'thread_id');
    }

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }
}
