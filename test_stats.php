<?php

/**
 * Test Script for Statistics API
 * File: test_stats.php
 * Purpose: Test the statistics API endpoints
 */

echo "<h1>Testing Statistics API</h1>";
echo "<style>body { font-family: Arial, sans-serif; margin: 20px; } .success { color: green; } .error { color: red; } pre { background: #f4f4f4; padding: 10px; border-radius: 5px; }</style>";

// Test the main statistics endpoint
echo "<h2>1. Testing get_statistics.php</h2>";
try {
    $statsUrl = 'http://localhost/pembelajaran/get_statistics.php';
    $context = stream_context_create([
        'http' => [
            'method' => 'GET',
            'header' => 'Accept: application/json'
        ]
    ]);

    $response = file_get_contents($statsUrl, false, $context);
    $data = json_decode($response, true);

    if ($data && $data['success']) {
        echo "<p class='success'>✅ get_statistics.php - SUCCESS</p>";
        echo "<h3>Raw Statistics:</h3>";
        echo "<pre>" . print_r($data['data'], true) . "</pre>";
        echo "<h3>Formatted Statistics:</h3>";
        echo "<pre>" . print_r($data['formatted'], true) . "</pre>";
    } else {
        echo "<p class='error'>❌ get_statistics.php - FAILED: " . ($data['error'] ?? 'Unknown error') . "</p>";
    }
} catch (Exception $e) {
    echo "<p class='error'>❌ get_statistics.php - ERROR: " . $e->getMessage() . "</p>";
}

// Test the update stats endpoint
echo "<h2>2. Testing update_stats.php</h2>";
try {
    $updateUrl = 'http://localhost/pembelajaran/update_stats.php';
    $context = stream_context_create([
        'http' => [
            'method' => 'GET',
            'header' => 'Accept: application/json'
        ]
    ]);

    $response = file_get_contents($updateUrl, false, $context);
    $data = json_decode($response, true);

    if ($data && $data['success']) {
        echo "<p class='success'>✅ update_stats.php - SUCCESS</p>";
        echo "<h3>Generated HTML:</h3>";
        echo "<pre>" . htmlspecialchars($data['stats_html']) . "</pre>";
        echo "<h3>Feature Stats:</h3>";
        echo "<pre>" . print_r($data['feature_stats'], true) . "</pre>";
    } else {
        echo "<p class='error'>❌ update_stats.php - FAILED: " . ($data['error'] ?? 'Unknown error') . "</p>";
    }
} catch (Exception $e) {
    echo "<p class='error'>❌ update_stats.php - ERROR: " . $e->getMessage() . "</p>";
}

echo "<h2>3. API Endpoints Summary</h2>";
echo "<ul>";
echo "<li><strong>get_statistics.php</strong> - Returns comprehensive JSON statistics for API consumption</li>";
echo "<li><strong>update_stats.php</strong> - Returns formatted HTML and statistics for direct integration</li>";
echo "<li><strong>assets/js/stats-updater.js</strong> - JavaScript for automatic real-time updates</li>";
echo "</ul>";

echo "<h2>4. Usage Examples</h2>";
echo "<h3>PHP Integration:</h3>";
echo "<pre>" . htmlspecialchars('
$url = "http://localhost/pembelajaran/update_stats.php";
$data = json_decode(file_get_contents($url), true);
if ($data["success"]) {
    echo $data["stats_html"];
}
') . "</pre>";

echo "<h3>JavaScript Integration:</h3>";
echo "<pre>" . htmlspecialchars('
<script src="assets/js/stats-updater.js"></script>
<script>
document.addEventListener("DOMContentLoaded", function() {
    const updater = new StatsUpdater();
    updater.init();
});
</script>
') . "</pre>";

echo "<h2>5. Manual Testing URLs</h2>";
echo "<ul>";
echo "<li><a href='http://localhost/pembelajaran/get_statistics.php' target='_blank'>View JSON Statistics</a></li>";
echo "<li><a href='http://localhost/pembelajaran/update_stats.php' target='_blank'>View Update Stats</a></li>";
echo "</ul>";

?>
