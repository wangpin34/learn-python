USE t17;

UPDATE dp_app_platform SET platform_name = "ANY" WHERE platform_id = 9;

UPDATE jos_dp_applicationversion SET app_env_type = "ANY" WHERE app_env_type = "Generic";

INSERT INTO dp_app_platform_properties (property_type, property_value, platform_id, is_enabled)
    VALUES ('RunsOnPlatforms', '9', 9, 1);

DELETE FROM dp_app_platform_properties WHERE property_type = "FileExtension";

INSERT IGNORE INTO dp_app_platform_properties (property_type, property_value, platform_id, is_enabled)
    VALUES ('FileExtension', '*', 9, 1);

INSERT IGNORE INTO jos_dp_common_os_version (id, version_major, version_minor, version_rev, os_name,
isenabled, code_name, normalized_version_major, normalized_version_minor, normalized_version_fix, platform_id)
VALUES (-1, 0, 0, 0, 'ANY', 1, 'ANY', 0, 0, 0, 9);

INSERT IGNORE INTO jos_dp_device_model_family_group (device_model_family_group_id, group_label, image_width,
image_height) VALUES (1,'ANY',320,480);

INSERT IGNORE INTO jos_dp_device_model_family_type (device_model_family_type_id, type_label)
VALUES (1,'ANY');

INSERT IGNORE INTO jos_dp_device_model_family (device_model_family_id, ac_family_code, family_name, is_enabled,
os3_emulator_device_id, model_family_group_id, model_family_type_id, min_os_version_id, max_os_version_id,
release_date, platform_id) VALUES (-1, -1, 'ANY', 1, -1, 1, 1, -1, -1, '1970-01-01 00:00:01', 9);

INSERT IGNORE INTO dp_device_type_app_image_requirements(device_family_type_id, image_dimension_id, is_enabled)
   VALUES (1,1,1);

CREATE TABLE IF NOT EXISTS dp_app_version_platforms (
app_version_id int(10) unsigned NOT NULL,
platform_id int(11) unsigned NOT NULL,
KEY FK_DP_APP_VERSION_PLATFORMS_JOS_DP_APPLICATIONVERSION (app_version_id),
KEY FK_DP_APP_VERSION_PLATFORMS_DP_APP_PLATFORM (platform_id),
CONSTRAINT FK_DP_APP_VERSION_PLATFORMS_JOS_DP_APPLICATIONVERSION FOREIGN KEY (app_version_id)
    REFERENCES jos_dp_applicationversion (id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT FK_DP_APP_VERSION_PLATFORMS_DP_APP_PLATFORM FOREIGN KEY (platform_id)
    REFERENCES dp_app_platform (platform_id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='list of properties for app platform';

INSERT IGNORE INTO dp_app_version_platforms (app_version_id, platform_id) SELECT av.id, ae.platformid
    FROM jos_dp_applicationversion av, jos_dp_applicationentry ae WHERE ae.id = av.applicationid AND ae.platformid != 9;

INSERT IGNORE INTO dp_app_version_platforms (app_version_id, platform_id) SELECT av.id, 2
    FROM jos_dp_applicationversion av, jos_dp_applicationentry ae WHERE ae.id = av.applicationid AND ae.platformid = 9;

INSERT IGNORE INTO dp_app_version_platforms (app_version_id, platform_id) SELECT av.id, 6
    FROM jos_dp_applicationversion av, jos_dp_applicationentry ae WHERE ae.id = av.applicationid AND ae.platformid = 9;

INSERT IGNORE INTO dp_app_version_platforms (app_version_id, platform_id) SELECT av.id, 7
    FROM jos_dp_applicationversion av, jos_dp_applicationentry ae WHERE ae.id = av.applicationid AND ae.platformid = 9;