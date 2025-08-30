/**
 * Dynamic Statistics Updater for Documentation
 * File: assets/js/stats-updater.js
 * Purpose: Automatically updates documentation statistics with real-time data
 */

class StatsUpdater {
    constructor() {
        this.statsEndpoint = '/update_stats.php';
        this.updateInterval = 300000; // Update every 5 minutes (300,000 ms)
        this.retryAttempts = 3;
        this.retryDelay = 5000; // 5 seconds
    }

    /**
     * Initialize the stats updater
     */
    init() {
        console.log('Initializing Stats Updater...');
        this.updateStats();
        this.startAutoUpdate();
    }

    /**
     * Update statistics from server
     */
    async updateStats() {
        try {
            const response = await fetch(this.statsEndpoint, {
                method: 'GET',
                headers: {
                    'Accept': 'application/json',
                    'Cache-Control': 'no-cache'
                }
            });

            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }

            const data = await response.json();

            if (data.success) {
                this.updateStatsDisplay(data);
                console.log('Statistics updated successfully:', data.raw_data);
            } else {
                throw new Error(data.error || 'Unknown error occurred');
            }

        } catch (error) {
            console.error('Failed to update statistics:', error);
            this.handleUpdateError(error);
        }
    }

    /**
     * Update the statistics display in the DOM
     */
    updateStatsDisplay(data) {
        // Update main statistics
        const statsContainer = document.querySelector('.row.text-center');
        if (statsContainer && data.stats_html) {
            statsContainer.innerHTML = data.stats_html;
        }

        // Update feature-specific statistics if they exist
        if (data.feature_stats) {
            this.updateFeatureStats(data.feature_stats);
        }

        // Update last updated timestamp
        this.updateLastUpdated(data.last_updated);
    }

    /**
     * Update feature-specific statistics
     */
    updateFeatureStats(featureStats) {
        // Update forum threads count
        const forumElement = document.querySelector('[data-stat="forum_threads"]');
        if (forumElement && featureStats.forum_threads) {
            forumElement.textContent = featureStats.forum_threads;
        }

        // Update consultations count
        const consultationElement = document.querySelector('[data-stat="consultations"]');
        if (consultationElement && featureStats.consultations) {
            consultationElement.textContent = featureStats.consultations;
        }

        // Update zoom rooms count
        const zoomElement = document.querySelector('[data-stat="zoom_rooms"]');
        if (zoomElement && featureStats.zoom_rooms) {
            zoomElement.textContent = featureStats.zoom_rooms;
        }

        // Update health info count
        const healthElement = document.querySelector('[data-stat="health_info"]');
        if (healthElement && featureStats.health_info) {
            healthElement.textContent = featureStats.health_info;
        }
    }

    /**
     * Update last updated timestamp
     */
    updateLastUpdated(timestamp) {
        const lastUpdatedElement = document.querySelector('.last-updated');
        if (lastUpdatedElement) {
            const date = new Date(timestamp);
            const formattedDate = date.toLocaleString('id-ID', {
                year: 'numeric',
                month: 'long',
                day: 'numeric',
                hour: '2-digit',
                minute: '2-digit'
            });
            lastUpdatedElement.textContent = `Terakhir diperbarui: ${formattedDate}`;
        }
    }

    /**
     * Start automatic updates
     */
    startAutoUpdate() {
        setInterval(() => {
            this.updateStats();
        }, this.updateInterval);
    }

    /**
     * Handle update errors with retry logic
     */
    async handleUpdateError(error, attempt = 1) {
        if (attempt <= this.retryAttempts) {
            console.log(`Retrying statistics update (attempt ${attempt}/${this.retryAttempts})...`);
            setTimeout(() => {
                this.updateStats();
            }, this.retryDelay);
        } else {
            console.error('Max retry attempts reached. Statistics update failed.');
            this.showOfflineMessage();
        }
    }

    /**
     * Show offline/cache message when updates fail
     */
    showOfflineMessage() {
        const lastUpdatedElement = document.querySelector('.last-updated');
        if (lastUpdatedElement) {
            lastUpdatedElement.innerHTML = '<span class="text-warning">⚠️ Data offline - menampilkan cache</span>';
        }
    }

    /**
     * Force manual update
     */
    forceUpdate() {
        console.log('Forcing manual statistics update...');
        this.updateStats();
    }
}

// Initialize when DOM is loaded
document.addEventListener('DOMContentLoaded', function() {
    const statsUpdater = new StatsUpdater();
    statsUpdater.init();

    // Add manual update button functionality if exists
    const updateButton = document.querySelector('.update-stats-btn');
    if (updateButton) {
        updateButton.addEventListener('click', function() {
            statsUpdater.forceUpdate();
        });
    }
});

// Export for global access
window.StatsUpdater = StatsUpdater;
