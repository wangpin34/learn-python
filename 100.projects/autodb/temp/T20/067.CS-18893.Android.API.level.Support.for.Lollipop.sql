USE T20;

# CS-18893:add support for Android SDK 5.0 - Lollipop

INSERT IGNORE INTO `dp_android_api_level` (`api_level`, `platform_version`, `version_code`, `min_os_version`, `max_os_version`, `target_os_version`) 
VALUES ('21', 'Android 5.0', 'LOLLIPOP', '960500', '960500', '960500');
