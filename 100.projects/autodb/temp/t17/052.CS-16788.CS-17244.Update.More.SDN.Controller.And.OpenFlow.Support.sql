USE t17;

# Update to support:
# CS-16788:Controller Versions 2.3, 2.4, 2.5 
# CS-17244:OpenFlow versions 1.0.1 and 1.3.1

INSERT IGNORE INTO jos_dp_openflow (`openflow_id`, `openflow_version`, `openflow_name`, `openflow_spec_url`, `platform_id`, `release_date`, `is_enabled`)
VALUES 
(1101, '1.0.1', 'OpenFlow 1.0.1', '', 10, '0000-00-00 00:00:00', '1'), 
(1131, '1.3.1', 'OpenFlow 1.3.1', '', 10, '0000-00-00 00:00:00', '1');

UPDATE jos_dp_openflow SET `is_enabled` = 0 WHERE  `openflow_id` =1100 AND `platform_id` =10;
UPDATE jos_dp_openflow SET `is_enabled` = 0 WHERE  `openflow_id` =1110 AND `platform_id` =10;
UPDATE jos_dp_openflow SET `is_enabled` = 0 WHERE  `openflow_id` =1120 AND `platform_id` =10;
UPDATE jos_dp_openflow SET `is_enabled` = 0 WHERE  `openflow_id` =1130 AND `platform_id` =10;
UPDATE jos_dp_openflow SET `is_enabled` = 0 WHERE  `openflow_id` =1140 AND `platform_id` =10;

INSERT IGNORE INTO jos_dp_common_os_version
(id, version_major, version_minor, version_rev, os_name, isenabled, code_name, normalized_version_major, normalized_version_minor, normalized_version_fix, platform_id) 
VALUES 
(10010230, 1001, 2, 3, 'HP VAN SDN Controller 2.3', 1, 'HP VAN SDN 2.3', 1001, 2, 3, 10),
(10010240, 1001, 2, 4, 'HP VAN SDN Controller 2.4', 1, 'HP VAN SDN 2.4', 1001, 2, 4, 10),
(10010250, 1001, 2, 5, 'HP VAN SDN Controller 2.5', 1, 'HP VAN SDN 2.5', 1001, 2, 5, 10);

UPDATE jos_dp_common_os_version SET `isenabled` = 0 WHERE `id` = 10010100;

UPDATE jos_dp_device_model_family SET `min_os_version_id` = 10010230, `max_os_version_id` = 10010250 WHERE `device_model_family_id` =10010;