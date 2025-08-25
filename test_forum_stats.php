<?php

require_once 'bootstrap/app.php';

$app = \Illuminate\Foundation\Application::getInstance();

try {
    // Test database connection
    echo "Testing database connection...\n";
    
    // Test Forum model
    $forumCount = App\Models\Forum::count();
    echo "Forum count: " . $forumCount . "\n";
    
    // Test ForumThread model
    $threadCount = App\Models\ForumThread::count();
    echo "Thread count: " . $threadCount . "\n";
    
    // Test ForumPost model
    $postCount = App\Models\ForumPost::count();
    echo "Post count: " . $postCount . "\n";
    
    echo "All tests passed!\n";
    
} catch (Exception $e) {
    echo "Error: " . $e->getMessage() . "\n";
    echo "Trace: " . $e->getTraceAsString() . "\n";
}
