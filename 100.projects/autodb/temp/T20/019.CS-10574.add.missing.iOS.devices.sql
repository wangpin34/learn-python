USE T20;

INSERT IGNORE INTO jos_dp_common_os_version (id, version_major, version_minor, version_rev, os_name, isenabled, code_name, normalized_version_major, normalized_version_minor, normalized_version_fix, platform_id)
VALUES
    (950700,95,7,0,'iOS 7.0',1,'',95,7,0,7),
    (950701,95,7,1,'iOS 7.0.1',1,'',95,7,1,7),
    (950702,95,7,2,'iOS 7.0.2',1,'',95,7,2,7);

INSERT IGNORE INTO jos_dp_device_model_family (device_model_family_id, ac_family_code, family_name, is_enabled, os3_emulator_device_id, model_family_group_id, model_family_type_id, min_os_version_id, max_os_version_id, release_date, platform_id)
VALUES
    (1415,1415,'iPhone 5C',1,1400,1400,1400,950700,950702,'0000-00-00 00:00:00',7),
    (1416,1416,'iPhone 5S',1,1400,1400,1400,950700,950702,'0000-00-00 00:00:00',7);

