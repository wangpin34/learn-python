USE T20;

# CS-19560: Update iOS support devices to only : 'iPhone', 'iPad' and 'Universal'.

# Disable the existing device model families: iPhone4, iPad2 etc. totally 25 now.
UPDATE jos_dp_device_model_family SET is_enabled = "0" WHERE platform_id= 7;

# Insert device model family group
INSERT IGNORE INTO jos_dp_device_model_family_group (device_model_family_group_id, group_label, image_width, image_height)
VALUES
    (1404,'Universal',320,480);
    
# Insert device model family
INSERT IGNORE INTO jos_dp_device_model_family (device_model_family_id, ac_family_code, family_name, is_enabled, os3_emulator_device_id, model_family_group_id, model_family_type_id, min_os_version_id, max_os_version_id, release_date, platform_id)
VALUES
    (1430,1430,'iPhone',1,1400,1400,1400,950400,950820,'0000-00-00 00:00:00',7),
    (1431,1431,'iPad',1,1400,1401,1400,950400,950820,'0000-00-00 00:00:00',7),
    (1432,1432,'Universal',1,1400,1404,1400,950400,950820,'0000-00-00 00:00:00',7);
    

