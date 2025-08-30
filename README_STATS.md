# Real-time Statistics System for Health Education Platform

## 📊 Overview
This system provides real-time database statistics for the health education platform documentation. It automatically updates statistics without manual intervention.

## 📁 Files Created

### 1. `get_statistics.php`
**Purpose:** Comprehensive API endpoint for retrieving all platform statistics
**Location:** Root directory
**Output:** JSON format with detailed statistics

**Features:**
- ✅ Total users by role (admin, user, consultant)
- ✅ Content statistics (materi, informasi kesehatan, zoom rooms)
- ✅ Forum activity (threads, posts, active users)
- ✅ Consultation statistics
- ✅ User engagement metrics (progress, downloads, comments, likes)
- ✅ Formatted display values for documentation

### 2. `update_stats.php`
**Purpose:** Generates formatted HTML for direct integration
**Location:** Root directory
**Output:** JSON with pre-formatted HTML and statistics

**Features:**
- ✅ Ready-to-use HTML for statistics display
- ✅ Feature-specific statistics
- ✅ Raw data for custom formatting
- ✅ Automatic timestamp

### 3. `public/assets/js/stats-updater.js`
**Purpose:** JavaScript for automatic real-time updates
**Location:** Public assets directory
**Features:**
- ✅ Automatic updates every 5 minutes
- ✅ Manual update capability
- ✅ Error handling with retry logic
- ✅ Offline/cache mode support

### 4. `test_stats.php`
**Purpose:** Testing and validation script
**Location:** Root directory
**Features:**
- ✅ Tests both API endpoints
- ✅ Displays formatted results
- ✅ Usage examples
- ✅ Manual testing links

## 🚀 Usage

### Method 1: Direct PHP Integration
```php
<?php
$url = "http://localhost/pembelajaran/update_stats.php";
$data = json_decode(file_get_contents($url), true);
if ($data["success"]) {
    echo $data["stats_html"];
}
?>
```

### Method 2: JavaScript Auto-Update
```html
<!-- Include the JavaScript file -->
<script src="assets/js/stats-updater.js"></script>

<!-- Initialize in your HTML -->
<script>
document.addEventListener("DOMContentLoaded", function() {
    const updater = new StatsUpdater();
    updater.init();
});
</script>
```

### Method 3: Manual Update Button
```html
<button class="update-stats-btn btn btn-primary">Update Statistics</button>
```

## 📈 Current Statistics (Sample Output)

```json
{
  "success": true,
  "data": {
    "total_users": 77,
    "active_users": 74,
    "materi_count": 10,
    "total_content": 13,
    "forum_threads": 1,
    "consultations_count": 8
  },
  "formatted": {
    "konten_edukasi": "13+",
    "pengguna_aktif": "74+",
    "materi_interaktif": "10+"
  }
}
```

## 🔧 Configuration

### Update Frequency
- **Default:** Every 5 minutes (300,000ms)
- **Location:** `stats-updater.js` line 10
- **Change:** Modify `this.updateInterval` value

### Retry Settings
- **Max Attempts:** 3 retries
- **Retry Delay:** 5 seconds
- **Location:** `stats-updater.js` lines 11-12

## 🧪 Testing

### Command Line Testing
```bash
# Test comprehensive API
php get_statistics.php

# Test HTML generation
php update_stats.php

# Run test suite
php test_stats.php
```

### Web Browser Testing
1. Start your web server (XAMPP/Apache)
2. Visit: `http://localhost/pembelajaran/test_stats.php`
3. Check API endpoints directly:
   - `http://localhost/pembelajaran/get_statistics.php`
   - `http://localhost/pembelajaran/update_stats.php`

## 📊 Statistics Included

### User Statistics
- Total users
- Active users (role: user)
- Admin users
- Consultant users

### Content Statistics
- Educational materials (Materi)
- Health information (Informasi Kesehatan)
- Zoom rooms
- Total content (combined)

### Engagement Statistics
- Forum threads
- Forum posts
- Active forum users
- Consultations
- Consultation responses
- User progress records
- Download logs
- Comments
- Likes

## 🔒 Security Notes

- ✅ CORS headers included for cross-origin requests
- ✅ JSON output with proper content-type headers
- ✅ Error handling with safe error messages
- ✅ No sensitive data exposed in API responses

## 🎯 Integration Examples

### Update Documentation Statistics
```php
// Include in your documentation page
<?php
$stats = json_decode(file_get_contents('update_stats.php'), true);
if ($stats['success']) {
    echo $stats['stats_html'];
}
?>
```

### Add Last Updated Timestamp
```html
<div class="last-updated text-muted mt-3">
    <!-- Will be updated by JavaScript -->
</div>
```

## 📝 Notes

- Statistics are updated in real-time from the database
- All numbers include the "+" suffix for display
- Timestamps are in Indonesian format
- System handles database connection errors gracefully
- JavaScript updater works offline with cached data

## 🆘 Troubleshooting

### Common Issues:
1. **"Failed to open stream"** - Check file paths and permissions
2. **"No connection could be made"** - Start web server first
3. **Empty responses** - Check database connection and model paths

### Debug Mode:
Add `?debug=1` to API URLs for detailed error information.

---

**Created:** August 30, 2025
**Last Updated:** Real-time via API
**Platform:** Laravel 10.x + PHP 8.1+
