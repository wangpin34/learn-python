USE T20;

INSERT IGNORE INTO jos_dp_common_os_version (id, version_major, version_minor, version_rev, os_name, isenabled, code_name, normalized_version_major, normalized_version_minor, normalized_version_fix, platform_id)
VALUES
    (950703,95,7,3,'iOS 7.0.3',1,'',95,7,3,7),
    (950704,95,7,4,'iOS 7.0.4',1,'',95,7,4,7),
    (950705,95,7,5,'iOS 7.0.5',1,'',95,7,5,7);

INSERT IGNORE INTO jos_dp_device_model_family (device_model_family_id, ac_family_code, family_name, is_enabled, os3_emulator_device_id, model_family_group_id, model_family_type_id, min_os_version_id, max_os_version_id, release_date, platform_id)
VALUES
    (1417,1417,'iPhone 5C(GSM)',1,1400,1400,1400,950700,950705,'0000-00-00 00:00:00',7),
    (1418,1418,'iPhone 5C(Global)',1,1400,1400,1400,950700,950705,'0000-00-00 00:00:00',7),
    (1419,1419,'iPhone 5S(GSM)',1,1400,1400,1400,950700,950705,'0000-00-00 00:00:00',7),
    (1420,1420,'iPhone 5S(Global)',1,1400,1400,1400,950700,950705,'0000-00-00 00:00:00',7);