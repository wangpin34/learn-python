USE T20;

# 1. 
INSERT INTO dp_app_platform (`platform_name`, `platform_id`, `is_enabled`) 
VALUES
('SDN', 10, 1);

# 2.
INSERT INTO dp_app_platform_properties (`property_type`, `property_value`, `platform_id`, `is_enabled`)
VALUES 
('RunsOnPlatforms', '10', 10, 1);

# 3. 
INSERT IGNORE INTO dp_app_platform_properties (`property_type`, `property_value`, `platform_id`, `is_enabled`)
VALUES 
('FileExtension', 'zip', 10, 1);

# 4. Set up SDN platform properties
INSERT IGNORE INTO dp_app_platform_properties (`property_type`, `property_value`, `platform_id`, `is_enabled`)
VALUES
    ('VersionRequired','1',10,1),
    ('PaidCountry','23',10,1),
    ('FreeCountry','23',10,1),
    ('SupportedLanguage','0',10,1);

# 5. OS
INSERT IGNORE INTO jos_dp_common_os_version 
(id, version_major, version_minor, version_rev, os_name, isenabled, code_name, normalized_version_major, normalized_version_minor, normalized_version_fix, platform_id)
VALUES 
(10010100, 1001, 1, 0, 'HP VAN SDN Controller 1.0', 1, 'HP VAN SDN 1.0', 1001, 1, 0, 10),
(10020100, 1002, 1, 0, 'NEC PFC 1.0', 1, 'NEC PFC 1.0', 1002, 1, 0, 10),
(10030100, 1003, 1, 0, 'Open Daylight 1.0', 1, 'Open Daylight 1.0', 1003, 1, 0, 10);

# 6. Devices
INSERT IGNORE INTO jos_dp_device_model_family_group (`device_model_family_group_id`, `group_label`, `image_width`,
`image_height`) VALUES (10000,'SDN',320,480);

INSERT IGNORE INTO jos_dp_device_model_family_type (`device_model_family_type_id`, `type_label`)
VALUES (10000,'SDN');

INSERT IGNORE INTO jos_dp_device_model_family (device_model_family_id, ac_family_code, family_name, is_enabled,
os3_emulator_device_id, model_family_group_id, model_family_type_id, min_os_version_id, max_os_version_id,
release_date, platform_id) 
VALUES 
(10010, 10010, 'HP VAN SDN Controller', 1, 10000, 10000, 10000, 10010100, 10010100, '1970-01-01 00:00:01', 10),
(10020, 10020, 'NEC PFC', 1, 10000, 10000, 10000, 10020100, 10020100, '1970-01-01 00:00:01', 10),
(10030, 10030, 'Open Daylight', 1, 10000, 10000, 10000, 10030100, 10030100, '1970-01-01 00:00:01', 10);

INSERT IGNORE INTO dp_device_type_app_image_requirements(`device_family_type_id`, `image_dimension_id`, `is_enabled`)
   VALUES (10000,1,1);

# 7. Add job workflow define for SDN platform
INSERT IGNORE INTO dp_job_workflow (`workflow_id`, `workflow_name`, `workflow_description`) VALUES
(27, 'SDN App Submission','SDN App Submission');

INSERT IGNORE INTO `dp_job_workflow_job` (`workflow_id`, `queue_id`, `from_path`, `to_path`) VALUES
(27,        38,        '/nas-mnt/nethdd/Data/acpkg/Packages/unsigned',        '/var/tmp/trash'),
(27,        41,        '/nas-mnt/nethdd/Data/acpkg/Packages/unsigned',        ''),
(27,        45,        '/nas-mnt/nethdd/Data/acpkg/Packages/unsigned',        '');

INSERT IGNORE INTO dp_app_platform_submissiontype_workflow (`platform_id`, `submission_type`, `environment_id`, `workflow_id`, `queue_id`)
VALUES
    (10,'new','QA',27,45),
    (10,'update','QA',27,45),
    (10,'meta','QA',27,37),
    (10,'new','PROD',27,38),
    (10,'update','PROD',27,38),
    (10,'meta','PROD',27,38);

# 8 Openflows
CREATE TABLE IF NOT EXISTS jos_dp_openflow (
  openflow_id int(11) NOT NULL,
  openflow_version varchar(100) NOT NULL DEFAULT '',
  openflow_name varchar(256) NOT NULL DEFAULT '',
  openflow_spec_url varchar(1024) NOT NULL DEFAULT '',
  platform_id int(11) unsigned NOT NULL,
  release_date timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  is_enabled tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (openflow_id,platform_id),
  KEY FK_JOS_DP_OPENFLOW_DP_APP_PLATFORM (platform_id),
  CONSTRAINT FK_JOS_DP_OPENFLOW_DP_APP_PLATFORM FOREIGN KEY (platform_id) REFERENCES dp_app_platform (platform_id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains data for openflows';

INSERT IGNORE INTO jos_dp_openflow (`openflow_id`, `openflow_version`, `openflow_name`, `openflow_spec_url`, `platform_id`, `release_date`, `is_enabled`) VALUES
(1100, '1.0','OpenFlow 1.0', '', 10, '0000-00-00 00:00:00', '1'),
(1110, '1.1','OpenFlow 1.1', '', 10, '0000-00-00 00:00:00', '1'),
(1120, '1.2','OpenFlow 1.2', '', 10, '0000-00-00 00:00:00', '1'),
(1130, '1.3','OpenFlow 1.3', '', 10, '0000-00-00 00:00:00', '1'),
(1140, '1.4','OpenFlow 1.4', '', 10, '0000-00-00 00:00:00', '1');

# 9 App properties
CREATE TABLE IF NOT EXISTS jos_dp_app_properties_types (
  id int(11) unsigned NOT NULL AUTO_INCREMENT,
  property_key varchar(250) NOT NULL,
  property_key_desc varchar(4096) DEFAULT "",
  PRIMARY KEY (id),
  UNIQUE KEY UQ_JOS_DP_APP_PROPERTIES_TYPES (property_key)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='porperties type for app';

#
INSERT IGNORE INTO jos_dp_app_properties_types (`property_key`, `property_key_desc`) VALUES
('supportedOpenFlows', 'SDN Supported OpenFLows'),
('productSupportLink', 'SDN Product Support Web Link'),
('discussionForumLink', 'SDN Discussion Forum Web Link');

#
CREATE TABLE IF NOT EXISTS jos_dp_app_properties (
  application_version_id int(10) unsigned NOT NULL COMMENT 'Application version id',
  property_key varchar(250) NOT NULL,
  property_value varchar(4096) DEFAULT "",
  PRIMARY KEY (application_version_id, property_key),
  CONSTRAINT FK_JOS_DP_APP_PROPERTIES_JOS_DP_APPLICATIONVERSION FOREIGN KEY (application_version_id) REFERENCES jos_dp_applicationversion (id) ON UPDATE CASCADE,
  CONSTRAINT FK_JOS_DP_APP_PROPERTIES_JOS_DP_APP_PROPERTIES_TYPES FOREIGN KEY (property_key) REFERENCES jos_dp_app_properties_types (property_key) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains app properties';




