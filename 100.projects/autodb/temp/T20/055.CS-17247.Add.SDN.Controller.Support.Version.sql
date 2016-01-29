USE T20;

# CS-17247:Add Controller Version 2.2,so totally support: 2.2, 2.3, 2.4, 2.5 

INSERT IGNORE INTO jos_dp_common_os_version
(id, version_major, version_minor, version_rev, os_name, isenabled, code_name, normalized_version_major, normalized_version_minor, normalized_version_fix, platform_id) 
VALUES 
(10010220, 1001, 2, 2, 'HP VAN SDN Controller 2.2', 1, 'HP VAN SDN 2.2', 1001, 2, 2, 10);

UPDATE jos_dp_device_model_family SET `min_os_version_id` = 10010220, `max_os_version_id` = 10010250 WHERE `device_model_family_id` =10010;