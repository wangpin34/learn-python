USE t17;

# CS-20520: Add new supportedOSVersions and supportedDevices for Helion

INSERT IGNORE INTO `jos_dp_common_os_version` (`id`, `version_major`, `version_minor`, `version_rev`, `os_name`, `isenabled`, `code_name`, `normalized_version_major`, `normalized_version_minor`, `normalized_version_fix`, `platform_id`) 
VALUES ('20010101', '2001', '1', '1', 'HP CloudSystem 8.5', '1', 'HP CloudSystem 8.5', '2001', '1', '1', '11');

INSERT IGNORE INTO `jos_dp_device_model_family` (`device_model_family_id`, `ac_family_code`, `family_name`, `is_enabled`, `os3_emulator_device_id`, `model_family_group_id`, `model_family_type_id`, `min_os_version_id`, `max_os_version_id`, `release_date`, `platform_id`) 
VALUES ('20024', '20024', 'HP CloudSystem', '1', '20000', '20000', '20000', '20010101', '20010101', '1970-01-01 00:00:00', '11');
