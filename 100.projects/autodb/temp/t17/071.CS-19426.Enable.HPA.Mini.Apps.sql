USE t17;

# CS-19426: Enable submission of HPA Mini Apps

# Enable Mini Apps platform
UPDATE `dp_app_platform` set `is_enabled`=1 where `platform_id`=8;

# Bind Mini Apps platform to hpit tenant on CQ
INSERT IGNORE INTO `dp_enterprise_platforms` (`enterprise_id`, `platform_id`) VALUES 
('eada88f8-7c47-11e4-bfb0-1cc1de0698fa', '8');

# Enable Mini Apps platform properties
INSERT IGNORE INTO `dp_app_platform_properties` (`property_type`,`property_value`,`platform_id`, `is_enabled`) VALUES
('VersionRequired', 0, 8, 1), 
('PaidCountry', 23, 8, 1), 
('FreeCountry', 23, 8, 1),
('FileExtension', 'mna', 8, 1),
('SupportedLanguage', 0, 8, 1),
('RunsOnPlatforms', 6, 8, 1),
('RunsOnPlatforms', 7, 8, 1);

# Add pipeline workflow for Mini Apps
INSERT IGNORE INTO `dp_job_workflow` (`workflow_id`, `workflow_name`, `workflow_description`) VALUES 
('25', 'MINI App Submission', 'MINI App Submission');

# Define pipeline queue for Mini Apps
INSERT INTO `dp_job_workflow_job` (`workflow_id`, `queue_id`, `from_path`, `to_path`) VALUES 
('25', '38', '/nas-mnt/nethdd/Data/acpkg/Packages/unsigned', '/var/tmp/trash'), 
('25', '41', '/nas-mnt/nethdd/Data/acpkg/Packages/unsigned', ''), 
('25', '45', '/nas-mnt/nethdd/Data/acpkg/Packages/unsigned', '');