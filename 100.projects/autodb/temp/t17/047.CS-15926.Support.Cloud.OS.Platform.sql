USE t17;

# 1.
INSERT INTO dp_app_platform (`platform_name`, `platform_id`, `is_enabled`)
VALUES
('CloudOS', 11, 1);

# 2.
INSERT INTO dp_app_platform_properties (`property_type`, `property_value`, `platform_id`, `is_enabled`)
VALUES
('RunsOnPlatforms', '11', 11, 1);

# 3.
INSERT IGNORE INTO dp_app_platform_properties (`property_type`, `property_value`, `platform_id`, `is_enabled`)
VALUES
('FileExtension', 'csu', 11, 1),
('FileExtension', 'zip', 11, 1),
('FileExtension', 'gz', 11, 1),
('FileExtension', 'iso', 11, 1);

# 4. Set up platform properties
INSERT IGNORE INTO dp_app_platform_properties (`property_type`, `property_value`, `platform_id`, `is_enabled`)
VALUES
    ('VersionRequired','1',11,1),
    ('PaidCountry','23',11,1),
    ('FreeCountry','23',11,1),
    ('SupportedLanguage','0',11,1);

# 5. OS
INSERT IGNORE INTO jos_dp_common_os_version
(id, version_major, version_minor, version_rev, os_name, isenabled, code_name, normalized_version_major, normalized_version_minor, normalized_version_fix, platform_id)
VALUES
(20010100, 2001, 1, 0, 'Cloud OS 1.0', 1, 'Cloud OS 1.0', 2001, 1, 0, 11);

# 6. CloudOS Types
INSERT IGNORE INTO jos_dp_device_model_family_group (`device_model_family_group_id`, `group_label`, `image_width`,
`image_height`) VALUES (20000,'CloudOS',320,480);

INSERT IGNORE INTO jos_dp_device_model_family_type (`device_model_family_type_id`, `type_label`)
VALUES (20000,'CloudOS');

INSERT IGNORE INTO jos_dp_device_model_family (device_model_family_id, ac_family_code, family_name, is_enabled,
os3_emulator_device_id, model_family_group_id, model_family_type_id, min_os_version_id, max_os_version_id,
release_date, platform_id)
VALUES
(20010, 20010, 'Cloud OS Moonshot', 1, 20000, 20000, 20000, 20010100, 20010100, '1970-01-01 00:00:01', 11),
(20020, 20020, 'HP Helion OpenStack', 1, 20000, 20000, 20000, 20010100, 20010100, '1970-01-01 00:00:01', 11),
(20021, 20021, 'HP Helion OpenStack Community Edition', 1, 20000, 20000, 20000, 20010100, 20010100, '1970-01-01 00:00:01', 11);

INSERT IGNORE INTO dp_device_type_app_image_requirements(`device_family_type_id`, `image_dimension_id`, `is_enabled`)
   VALUES (20000,1,1);

# Add job workflow define
# Generic App
INSERT IGNORE INTO dp_job_workflow (`workflow_id`, `workflow_name`, `workflow_description`) VALUES
(21, 'Generic App Submission','Generic App Submission');

INSERT IGNORE INTO dp_job_workflow_job (`workflow_id`, `queue_id`, `from_path`, `to_path`) VALUES
(21,        38,        '/nas-mnt/nethdd/Data/acpkg/Packages/unsigned',        '/var/tmp/trash'),
(21,        41,        '/nas-mnt/nethdd/Data/acpkg/Packages/unsigned',        ''),
(21,        45,        '/nas-mnt/nethdd/Data/acpkg/Packages/unsigned',        '');

INSERT IGNORE INTO dp_app_platform_submissiontype_workflow (`platform_id`, `submission_type`, `environment_id`, `workflow_id`, `queue_id`)
VALUES
    (9,'new','QA',21,45),
    (9,'update','QA',21,45),
    (9,'meta','QA',21,37),
    (9,'new','PROD',21,38),
    (9,'update','PROD',21,38),
    (9,'meta','PROD',21,38);
#
# Cloud OS App
INSERT IGNORE INTO dp_job_workflow (`workflow_id`, `workflow_name`, `workflow_description`) VALUES
(28, 'CloudOS App Submission','CloudOS App Submission');

INSERT IGNORE INTO dp_job_workflow_job (`workflow_id`, `queue_id`, `from_path`, `to_path`) VALUES
(28,        38,        '/nas-mnt/nethdd/Data/acpkg/Packages/unsigned',        '/var/tmp/trash'),
(28,        41,        '/nas-mnt/nethdd/Data/acpkg/Packages/unsigned',        ''),
(28,        45,        '/nas-mnt/nethdd/Data/acpkg/Packages/unsigned',        '');

INSERT IGNORE INTO dp_app_platform_submissiontype_workflow (`platform_id`, `submission_type`, `environment_id`, `workflow_id`, `queue_id`)
VALUES
    (11,'new','QA',28,45),
    (11,'update','QA',28,45),
    (11,'meta','QA',28,37),
    (11,'new','PROD',28,38),
    (11,'update','PROD',28,38),
    (11,'meta','PROD',28,38);


