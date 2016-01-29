create database if not exists T20; 
grant all on T20.* to T20@'%' identified by 'T20'; 
USE T20;

SET foreign_key_checks = 0;
# Dump of table audits
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS audits (
  id int(11) NOT NULL AUTO_INCREMENT,
  created timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  subject varchar(512) NOT NULL,
  details varchar(4096) NOT NULL,
  PRIMARY KEY (id),
  KEY created (created),
  KEY subject (subject(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='history service audit data';
# Dump of table dp_ac_app_mapping_production
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS dp_ac_app_mapping_production (
  ac_production_app_id int(11) unsigned NOT NULL AUTO_INCREMENT,
  dp_app_id int(11) unsigned NOT NULL,
  PRIMARY KEY (ac_production_app_id),
  UNIQUE KEY UQ_DP_AC_APP_MAPPING_PRODUCTION_DP_APP_ID (dp_app_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains dp-ac app id mappings in production environment';
# Dump of table dp_ac_app_mapping_review
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS dp_ac_app_mapping_review (
  ac_review_app_id int(11) unsigned NOT NULL AUTO_INCREMENT,
  dp_app_id int(11) unsigned NOT NULL,
  PRIMARY KEY (ac_review_app_id),
  UNIQUE KEY UQ_DP_AC_APP_MAPPING_REVIEW_DP_APP_ID (dp_app_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains dp-ac app id mappings in review environment';
# Dump of table dp_agreements
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS dp_agreements (
  id int(11) unsigned NOT NULL AUTO_INCREMENT,
  agreement text NOT NULL,
  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  last_modified_time timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  is_enabled int(1) unsigned NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='contains all the agreement used in dp';
# Dump of table dp_android_api_level
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS dp_android_api_level (
  api_level int(11) unsigned NOT NULL AUTO_INCREMENT,
  platform_version varchar(256) NOT NULL,
  version_code varchar(256) NOT NULL,
  min_os_version int(11) NOT NULL,
  max_os_version int(11) NOT NULL,
  target_os_version int(11) NOT NULL,
  PRIMARY KEY (api_level),
  KEY FK_DP_ANDROID_API_LEVEL_MIN_OS_VERSION (min_os_version),
  KEY FK_DP_ANDROID_API_LEVEL_MAX_OS_VERSION (max_os_version),
  KEY FK_DP_ANDROID_API_LEVEL_TARGET_OS_VERSION (target_os_version),
  CONSTRAINT FK_DP_ANDROID_API_LEVEL_TARGET_OS_VERSION FOREIGN KEY (target_os_version) REFERENCES jos_dp_common_os_version (id),
  CONSTRAINT FK_DP_ANDROID_API_LEVEL_MAX_OS_VERSION FOREIGN KEY (max_os_version) REFERENCES jos_dp_common_os_version (id),
  CONSTRAINT FK_DP_ANDROID_API_LEVEL_MIN_OS_VERSION FOREIGN KEY (min_os_version) REFERENCES jos_dp_common_os_version (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='contains all the android api level in dp';
# Dump of table dp_app_downloads
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS dp_app_downloads (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  developer_id int(11) unsigned NOT NULL,
  publicapplicationid varchar(128) NOT NULL,
  app_version_id int(11) unsigned NOT NULL,
  txn_date date NOT NULL,
  downloads int(11) unsigned NOT NULL,
  updates int(11) unsigned NOT NULL,
  deletions int(11) unsigned NOT NULL,
  active_users int(11) unsigned NOT NULL,
  region varchar(10) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY UQ_DP_APP_DOWNLOADS_PUBAPPID_VERSIONID_TXNDATE (publicapplicationid,app_version_id,txn_date),
  KEY FK_DP_APP_DOWNLOADS_JOS_DP_APPLICATIONVERSION (app_version_id),
  CONSTRAINT FK_DP_APP_DOWNLOADS_JOS_DP_APPLICATIONVERSION FOREIGN KEY (app_version_id) REFERENCES jos_dp_applicationversion (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='application download data.';
# Dump of table dp_app_image_dimensions
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS dp_app_image_dimensions (
  dimension_id int(11) unsigned NOT NULL AUTO_INCREMENT,
  width int(4) NOT NULL,
  height int(4) NOT NULL,
  PRIMARY KEY (dimension_id),
  UNIQUE KEY UQ_DP_IMAGE_DIMENSIONS (width,height)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='list of app screenshot dimensions allowed';
# Dump of table dp_app_image_scaling
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS dp_app_image_scaling (
  id int(11) unsigned NOT NULL AUTO_INCREMENT,
  image_dimension_id int(11) unsigned NOT NULL,
  scale_image_dimension_id int(11) unsigned NOT NULL,
  scale_image_size tinyint(1) NOT NULL DEFAULT '0',
  is_enabled tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (id),
  UNIQUE KEY UQ_DP_IMAGE_SCALING (scale_image_dimension_id,image_dimension_id),
  KEY FK_DP_APP_IMAGE_SCALING_IMAGE_DIMENSION_DP_APP_IMAGE_DIMENSIONS (image_dimension_id),
  CONSTRAINT FK_DP_APP_IMAGE_SCALING_IMAGE_DIMENSION_DP_APP_IMAGE_DIMENSIONS FOREIGN KEY (image_dimension_id) REFERENCES dp_app_image_dimensions (dimension_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_DP_APP_IMAGE_SCALING_SCALE_IMAGE_DIME_DP_APP_IMAGE_DIMESIONS FOREIGN KEY (scale_image_dimension_id) REFERENCES dp_app_image_dimensions (dimension_id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='list of resize dimensions for image sizes';
# Dump of table dp_app_platform
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS dp_app_platform (
  platform_id int(11) unsigned NOT NULL AUTO_INCREMENT,
  platform_name varchar(255) NOT NULL,
  is_enabled tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (platform_id),
  UNIQUE KEY UQ_DP_APP_PLATFORM (platform_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='list of target platforms';
# Dump of table dp_app_platform_properties
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS dp_app_platform_properties (
  property_type varchar(250) NOT NULL,
  property_value varchar(2048) NOT NULL,
  platform_id int(11) unsigned NOT NULL,
  is_enabled tinyint(1) NOT NULL DEFAULT '0',
  KEY FK_DP_APP_PLATFORM_PROPERTIES_DP_APP_PLATFORM (platform_id),
  CONSTRAINT FK_DP_APP_PLATFORM_PROPERTIES_DP_APP_PLATFORM FOREIGN KEY (platform_id) REFERENCES dp_app_platform (platform_id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='list of porperties for app platform';
# Dump of table dp_app_platform_submissiontype_workflow
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS dp_app_platform_submissiontype_workflow (
  id int(11) unsigned NOT NULL AUTO_INCREMENT,
  platform_id int(11) unsigned NOT NULL,
  submission_type varchar(50) NOT NULL,
  environment_id varchar(50) NOT NULL,
  workflow_id int(11) unsigned NOT NULL,
  queue_id int(11) unsigned NOT NULL,
  PRIMARY KEY (id),
  KEY FK_DP_APP_PLATFORM_SUBMISSIONTYPE_WORKFLOW_APP_PLATFORM (platform_id),
  KEY FK_DP_APP_PLATFORM_SUBMISSIONTYPE_WORKFLOW_JOB_WORKFLOW (workflow_id),
  KEY FK_DP_APP_PLATFORM_SUBMISSIONTYPE_WORKFLOW_JOB_QUEUE (queue_id),
  CONSTRAINT FK_DP_APP_PLATFORM_SUBMISSIONTYPE_WORKFLOW_JOB_QUEUE FOREIGN KEY (queue_id) REFERENCES dp_job_queue (queue_id),
  CONSTRAINT FK_DP_APP_PLATFORM_SUBMISSIONTYPE_WORKFLOW_APP_PLATFORM FOREIGN KEY (platform_id) REFERENCES dp_app_platform (platform_id),
  CONSTRAINT FK_DP_APP_PLATFORM_SUBMISSIONTYPE_WORKFLOW_JOB_WORKFLOW FOREIGN KEY (workflow_id) REFERENCES dp_job_workflow (workflow_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains the map of platform, submission type to workflow an';
# Dump of table dp_bulk_upload_session_apps
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS dp_bulk_upload_session_apps (
  app_ref_id int(11) NOT NULL AUTO_INCREMENT,
  session_id int(11) NOT NULL,
  app_data mediumtext NOT NULL,
  app_version_id int(11) NOT NULL DEFAULT '0',
  ac_publish_ticket int(11) NOT NULL DEFAULT '0',
  package_filename varchar(255) NOT NULL,
  status int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (app_ref_id),
  KEY FK_DP_BULK_UPLOAD_SESSION_APPS_DP_BULK_UPLOAD_SESSIONS (session_id),
  KEY FK_DP_BULK_UPLOAD_SESSION_APPS_DP_UPLOAD_SESSION_APP_STATUS (status),
  CONSTRAINT FK_DP_BULK_UPLOAD_SESSION_APPS_DP_UPLOAD_SESSION_APP_STATUS FOREIGN KEY (status) REFERENCES dp_upload_session_app_status (status_id) ON UPDATE CASCADE,
  CONSTRAINT FK_DP_BULK_UPLOAD_SESSION_APPS_DP_BULK_UPLOAD_SESSIONS FOREIGN KEY (session_id) REFERENCES dp_bulk_upload_sessions (session_id) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Storage for in-process bulk submission apps';
# Dump of table dp_bulk_upload_session_reports
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS dp_bulk_upload_session_reports (
  session_id int(11) NOT NULL,
  report longtext NOT NULL,
  PRIMARY KEY (session_id),
  CONSTRAINT FK_DP_BULK_UPLOAD_SESSION_REPORTS_DP_BULK_UPLOAD_SESSIONS FOREIGN KEY (session_id) REFERENCES dp_bulk_upload_sessions (session_id) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Bulk submission session verification reports';
# Dump of table dp_bulk_upload_session_status
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS dp_bulk_upload_session_status (
  status_id int(11) NOT NULL,
  label varchar(64) NOT NULL,
  PRIMARY KEY (status_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Bulk submission session status';
# Dump of table dp_bulk_upload_sessions
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS dp_bulk_upload_sessions (
  session_id int(11) NOT NULL AUTO_INCREMENT,
  developer_id int(11) NOT NULL,
  started timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  committed timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  status_id int(11) NOT NULL DEFAULT '0',
  review_apps text NOT NULL,
  num_submitted_apps int(11) NOT NULL,
  package_signature varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (session_id),
  KEY FK_DP_BULK_UPLOAD_SESSIONS_DP_BULK_UPLOAD_SESSION_STATUS (status_id),
  KEY FK_DP_BULK_UPLOAD_SESSIONS_JOS_USERS (developer_id),
  CONSTRAINT FK_DP_BULK_UPLOAD_SESSIONS_DP_BULK_UPLOAD_SESSION_STATUS FOREIGN KEY (status_id) REFERENCES dp_bulk_upload_session_status (status_id) ON UPDATE CASCADE,
  CONSTRAINT FK_DP_BULK_UPLOAD_SESSIONS_JOS_USERS FOREIGN KEY (developer_id) REFERENCES jos_users (id) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Storage for in-process bulk submissions';
# Dump of table dp_device_type_app_image_requirements
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS dp_device_type_app_image_requirements (
  device_family_type_id int(10) unsigned NOT NULL,
  image_dimension_id int(11) unsigned NOT NULL,
  is_enabled tinyint(1) NOT NULL DEFAULT '0',
  UNIQUE KEY UQ_DP_DEVICE_TYPE_APP_IMAGE_REQUIREMENTS (device_family_type_id,image_dimension_id),
  KEY FK_DP_DEVICE_TYPE_APP_IMAGE_REQUIREMENTS_DP_APP_IMAGE_DIMENSIONS (image_dimension_id),
  CONSTRAINT FK_DP_DEVICE_TYPE_APP_IMAGE_REQUIREMENTS_DP_APP_IMAGE_DIMENSIONS FOREIGN KEY (image_dimension_id) REFERENCES dp_app_image_dimensions (dimension_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_DP_DEVICE_TYPE_APP_IMAGE_REQ_JOS_DP_DEV_MODEL_FAMILY_TYPE FOREIGN KEY (device_family_type_id) REFERENCES jos_dp_device_model_family_type (device_model_family_type_id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='list of image for device types supported';
# Dump of table dp_enterprise_developers
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS dp_enterprise_developers (
  developer_id int(11) NOT NULL,
  enterprise_id int(11) NOT NULL,
  UNIQUE KEY UQ_DP_ENTERPRISE_DEVELOPERS (enterprise_id,developer_id),
  KEY DP_ENTERPRISE_DEVELOPERS_ENTERPRISE_ID_IDX (enterprise_id),
  KEY FK_DP_ENTERPRISE_DEVELOPERS_JOS_DP_USERS (developer_id),
  CONSTRAINT FK_DP_ENTERPRISE_DEVELOPERS_JOS_DP_USERS FOREIGN KEY (developer_id) REFERENCES jos_users (id) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise developer ID mapping';
# Dump of table dp_enterprise_platforms
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS dp_enterprise_platforms (
  enterprise_id int(11) NOT NULL,
  platform_id int(11) NOT NULL,
  UNIQUE KEY UQ_DP_ENTERPRISE_PLATFORMS (enterprise_id,platform_id),
  KEY DP_ENTERPRISE_PLATFORMS_ENTERPRISE_ID_IDX (enterprise_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise platform ID mapping';
# Dump of table dp_job_client
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS dp_job_client (
  client_id int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The id of the client',
  client_enabled tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Whether or not the client is allowed to receive work items',
  last_connect_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The last time that this client connected to the service',
  ip_address varchar(39) NOT NULL COMMENT 'The IP address of the client.  Set to 39 length for potential IPV6',
  private_key varchar(2048) NOT NULL COMMENT 'The private key created for the client',
  public_key varchar(2048) NOT NULL COMMENT 'The public key component of the private key',
  PRIMARY KEY (client_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
# Dump of table dp_job_queue
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS dp_job_queue (
  queue_id int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The synthetic id of this queue',
  queue_name varchar(200) NOT NULL COMMENT 'The name of the queue',
  processing_timeout smallint(5) unsigned NOT NULL DEFAULT '30' COMMENT 'The amount of time (seconds) max to process',
  queue_enabled tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Whether or not the queue can have messages pulled from it.',
  register_transfer_request tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Whether it needs to generate a transfer request.',
  from_path varchar(2048) NOT NULL DEFAULT '' COMMENT 'The default path to read files from for this task',
  to_path varchar(2048) NOT NULL DEFAULT '' COMMENT 'The default path to write files to for thsi task',
  PRIMARY KEY (queue_id),
  UNIQUE KEY UQ_DP_JOB_QUEUE_QUEUE_NAME (queue_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
# Dump of table dp_job_queue_message
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS dp_job_queue_message (
  message_id bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'A message id used to retrieve the message internally',
  queue_id int(10) unsigned NOT NULL COMMENT 'The id of the queue that this message belongs to',
  md5 char(32) NOT NULL COMMENT 'The md5 checksum of processing_data value',
  queued_timestamp timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp on which the record was enqueued',
  hold_until_timestamp timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'The timestamp at which the record can be processed.',
  processing_timestamp timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'The time at which processing began on an item',
  completion_timestamp timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'The time at which processing completed OR aborted',
  app_version_id int(10) unsigned NOT NULL,
  workflow_id int(10) unsigned NOT NULL COMMENT 'The workflow that this message belongs to',
  aborting_user_id int(10) DEFAULT NULL COMMENT 'The user id of the individual who aborted this task.',
  metadata text NOT NULL COMMENT 'The data given to the processor of this message at the start',
  result_code int(10) NOT NULL DEFAULT '0' COMMENT 'The numeric return code from the processing block',
  result_data text NOT NULL COMMENT 'The extra data returned from the processing block',
  owner varchar(512) NOT NULL DEFAULT '' COMMENT 'The identity of the entity processing this message',
  PRIMARY KEY (message_id),
  KEY message_queueid (queue_id),
  KEY FK_DP_JOB_QUEUE_MESSAGE_DP_JOB_WORKFLOW (workflow_id),
  KEY FK_DP_JOB_QUEUE_MESSAGE_JOS_USERS (aborting_user_id),
  KEY FK_DP_JOB_QUEUE_MESSAGE_JOS_DP_APPLICATION_VERSION (app_version_id),
  CONSTRAINT FK_DP_JOB_QUEUE_MESSAGE_DP_JOB_QUEUE FOREIGN KEY (queue_id) REFERENCES dp_job_queue (queue_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_DP_JOB_QUEUE_MESSAGE_DP_JOB_WORKFLOW FOREIGN KEY (workflow_id) REFERENCES dp_job_workflow (workflow_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_DP_JOB_QUEUE_MESSAGE_JOS_DP_APPLICATION_VERSION FOREIGN KEY (app_version_id) REFERENCES jos_dp_applicationversion (id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_DP_JOB_QUEUE_MESSAGE_JOS_USERS FOREIGN KEY (aborting_user_id) REFERENCES jos_users (id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
# Dump of table dp_job_transfer
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS dp_job_transfer (
  transfer_id bigint(20) unsigned NOT NULL COMMENT 'The id of the transfer - Also maps to the id of the message',
  transfer_created timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The datetime that the transfer was created',
  from_path varchar(2048) NOT NULL COMMENT 'The path that the file transfer will read from',
  from_start timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'The time the file transfer to the client started',
  from_end timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'The time the file transfer to the client was completed',
  from_size int(10) unsigned NOT NULL COMMENT 'The size of the file before transfer',
  from_md5 char(32) NOT NULL COMMENT 'This is the md5 of the file before transfer',
  to_path varchar(2048) NOT NULL COMMENT 'The path that the put request will go to',
  to_start timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'The time that the put request started',
  to_end timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'The time that the put request completed',
  to_size int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The size of the file when the transfer completed.',
  to_md5 char(32) NOT NULL DEFAULT '' COMMENT 'This is the md5 of the file after transfer',
  PRIMARY KEY (transfer_id),
  CONSTRAINT FK_DP_JOB_TRANSFER_DP_JOB_QUEUE_MESSAGE FOREIGN KEY (transfer_id) REFERENCES dp_job_queue_message (message_id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
# Dump of table dp_job_workflow
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS dp_job_workflow (
  workflow_id int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The id of the workflow',
  workflow_name varchar(255) NOT NULL COMMENT 'The name of the workflow',
  workflow_description varchar(2048) NOT NULL COMMENT 'A description of the purpose of the workflow',
  PRIMARY KEY (workflow_id),
  UNIQUE KEY UQ_DP_JOB_WORKFLOW_WORKFLOW_NAME (workflow_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
# Dump of table dp_job_workflow_job
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS dp_job_workflow_job (
  workflow_id int(10) unsigned NOT NULL COMMENT 'The id of the workflow that this job belongs to',
  queue_id int(10) unsigned NOT NULL COMMENT 'The id of the job',
  from_path varchar(2048) NOT NULL DEFAULT '' COMMENT 'The path to read files for this workflow from',
  to_path varchar(2048) NOT NULL DEFAULT '' COMMENT 'The path to write files for this workflow to',
  UNIQUE KEY UQ_DP_JOB_WORKFLOW_JOB_WF_ID_Q_ID (workflow_id,queue_id),
  KEY FK_DP_JOB_WORKFLOW_JOB_DP_JOB_QUEUE (queue_id),
  CONSTRAINT FK_DP_JOB_WORKFLOW_JOB_DP_JOB_QUEUE FOREIGN KEY (queue_id) REFERENCES dp_job_queue (queue_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_DP_JOB_WORKFLOW_JOB_DP_JOB_WORKFLOW FOREIGN KEY (workflow_id) REFERENCES dp_job_workflow (workflow_id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
# Dump of table dp_service_access_token
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS dp_service_access_token (
  access_token char(36) NOT NULL,
  service_id varchar(32) NOT NULL,
  developer_id int(11) NOT NULL,
  created timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  usage_counter int(11) NOT NULL DEFAULT '1',
  usage_expiration timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (access_token),
  KEY FK_DP_SERVICE_ACCESS_TOKEN_JOS_USERS (developer_id),
  KEY DP_SERVICE_ACCESS_TOKEN_USAGE_EXPIRATION (usage_expiration),
  CONSTRAINT FK_DP_SERVICE_ACCESS_TOKEN_JOS_USERS FOREIGN KEY (developer_id) REFERENCES jos_users (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='service access token tracking';
# Dump of table dp_upload_session_app_status
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS dp_upload_session_app_status (
  status_id int(11) NOT NULL,
  label varchar(64) DEFAULT NULL,
  PRIMARY KEY (status_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Submission session app status';
# Dump of table jos_dp_ac_message
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS jos_dp_ac_message (
  ac_message_id int(10) unsigned NOT NULL AUTO_INCREMENT,
  ac_message_timestamp timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  ac_message_environment int(11) NOT NULL,
  app_version_id int(10) unsigned DEFAULT NULL COMMENT 'Not all messages necessarily have an application version',
  ac_message_body longtext NOT NULL,
  message_type_id int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (ac_message_id),
  KEY FK_JOS_DP_AC_MESSAGE_JOS_DP_APP_TARGET (ac_message_environment),
  KEY FK_JOS_DP_AC_MESSAGE_JOS_DP_APPLICATION_VERSION (app_version_id),
  CONSTRAINT FK_JOS_DP_AC_MESSAGE_JOS_DP_APPLICATION_VERSION FOREIGN KEY (app_version_id) REFERENCES jos_dp_applicationversion (id) ON UPDATE CASCADE,
  CONSTRAINT FK_JOS_DP_AC_MESSAGE_JOS_DP_APP_TARGET FOREIGN KEY (ac_message_environment) REFERENCES jos_dp_app_target (app_target_id) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains messages that were sent to AC. (to be replicated)';
# Dump of table jos_dp_ac_message_sync_queue
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS jos_dp_ac_message_sync_queue (
  ac_sync_message_id int(10) unsigned NOT NULL AUTO_INCREMENT,
  ac_message_id int(10) unsigned NOT NULL,
  ac_replica_cs_id int(10) unsigned NOT NULL,
  creation_timestamp timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The date when the queue entry was created',
  ac_replication_timestamp timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'When the message was sent to the other environment',
  ac_replication_result varchar(200) DEFAULT NULL,
  message_batch_id int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (ac_sync_message_id),
  KEY JOS_DP_AC_MESSAGE_SYNC_QUEUE_REPL_TIMESTAMP_IDX (ac_replication_timestamp),
  KEY FK_JOS_DP_AC_MESSAGE_SYNC_QUEUE_JOS_DP_AC_MESSAGE (ac_message_id),
  KEY FK_JOS_DP_AC_MESSAGE_SYNC_QUEUE_JOS_DP_APP_TARGET_REPLICA_CS (ac_replica_cs_id),
  KEY FK_JOS_DP_MSG_SYNC_QUEUE_JOS_DP_MSG_SYNC_BATCH (message_batch_id),
  CONSTRAINT FK_JOS_DP_AC_MESSAGE_SYNC_QUEUE_JOS_DP_AC_MESSAGE FOREIGN KEY (ac_message_id) REFERENCES jos_dp_ac_message (ac_message_id) ON UPDATE CASCADE,
  CONSTRAINT FK_JOS_DP_AC_MESSAGE_SYNC_QUEUE_JOS_DP_APP_TARGET_REPLICA_CS FOREIGN KEY (ac_replica_cs_id) REFERENCES jos_dp_app_target_replica_cs (app_target_replica_id) ON UPDATE CASCADE,
  CONSTRAINT FK_JOS_DP_MSG_SYNC_QUEUE_JOS_DP_MSG_SYNC_BATCH FOREIGN KEY (message_batch_id) REFERENCES jos_dp_ac_message_sync_queue_batch (message_batch_id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Status for pending and completed replication operations';
# Dump of table jos_dp_ac_message_sync_queue_batch
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS jos_dp_ac_message_sync_queue_batch (
  message_batch_id int(10) unsigned NOT NULL AUTO_INCREMENT,
  message_batch_ts timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (message_batch_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Sequence generator for unique message batch id numbers';
# Dump of table jos_dp_ac_message_type
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS jos_dp_ac_message_type (
  message_type_id int(10) unsigned NOT NULL,
  message_type_desc varchar(50) NOT NULL,
  PRIMARY KEY (message_type_id),
  UNIQUE KEY UQ_JOS_DP_AC_MESSAGE_TYPE (message_type_desc)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='App catalog message types';
# Dump of table jos_dp_app_activity
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS jos_dp_app_activity (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  applicationid int(10) unsigned NOT NULL,
  time_of_data timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  total_downloads int(10) unsigned NOT NULL,
  last_hour_downloads int(10) unsigned NOT NULL,
  total_accounts int(10) unsigned NOT NULL,
  total_devices int(10) unsigned NOT NULL,
  average_rating float NOT NULL,
  total_comments int(10) unsigned NOT NULL,
  percent_of_total float NOT NULL,
  percent_of_total_last_hour float NOT NULL,
  total_onramp int(10) unsigned NOT NULL DEFAULT '0',
  last_hour_onramp int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (id),
  KEY JOS_DP_APP_ACTIVITY_APPID_TOD_IDX (applicationid,time_of_data),
  CONSTRAINT FK_JOS_DP_APP_ACTIVITY_JOS_DP_APPLICATIONENTRY FOREIGN KEY (applicationid) REFERENCES jos_dp_applicationentry (id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
# Dump of table jos_dp_app_device_models
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS jos_dp_app_device_models (
  application_version_id int(10) unsigned NOT NULL COMMENT 'Application version id',
  model_id int(11) NOT NULL COMMENT 'Model id',
  PRIMARY KEY (application_version_id,model_id),
  KEY FK_JOS_DP_APP_DEVICE_MODELS_JOS_DP_DEVICE_MODEL_FAMILY (model_id),
  CONSTRAINT FK_JOS_DP_APP_DEVICE_MODELS_JOS_DP_APPLICATIONVERSION FOREIGN KEY (application_version_id) REFERENCES jos_dp_applicationversion (id) ON UPDATE CASCADE,
  CONSTRAINT FK_JOS_DP_APP_DEVICE_MODELS_JOS_DP_DEVICE_MODEL_FAMILY FOREIGN KEY (model_id) REFERENCES jos_dp_device_model_family (device_model_family_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
# Dump of table jos_dp_app_device_models_emulation
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS jos_dp_app_device_models_emulation (
  application_version_id int(10) unsigned NOT NULL COMMENT 'Application version id',
  model_id int(11) NOT NULL COMMENT 'Model id',
  PRIMARY KEY (application_version_id,model_id),
  KEY FK_JOS_DP_APP_DEVICE_MODELS_EMUL_JOS_DP_DEVICE_MODELS_FAMILY (model_id),
  CONSTRAINT FK_JOS_DP_APP_DEVICE_MODELS_EMUL_JOS_DP_APPLICATIONVERSION FOREIGN KEY (application_version_id) REFERENCES jos_dp_applicationversion (id) ON UPDATE CASCADE,
  CONSTRAINT FK_JOS_DP_APP_DEVICE_MODELS_EMUL_JOS_DP_DEVICE_MODELS_FAMILY FOREIGN KEY (model_id) REFERENCES jos_dp_device_model_family (device_model_family_id) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='a list of models that an app can be emulated';
# Dump of table jos_dp_app_price_chart
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS jos_dp_app_price_chart (
  id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  date_effective timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  currency char(3) NOT NULL,
  scaling_factor decimal(20,8) unsigned NOT NULL,
  PRIMARY KEY (id),
  KEY FK_JOS_DP_APP_PRICE_CHART_JOS_DP_COMMON_CURRENCY (currency),
  CONSTRAINT FK_JOS_DP_APP_PRICE_CHART_JOS_DP_COMMON_CURRENCY FOREIGN KEY (currency) REFERENCES jos_dp_common_currency (currencycode) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
# Dump of table jos_dp_app_publish_log
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS jos_dp_app_publish_log (
  id int(11) NOT NULL AUTO_INCREMENT,
  application_version_id int(11) NOT NULL,
  app_publish_state_id int(11) NOT NULL DEFAULT '0',
  state_timestamp timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  app_target_id int(11) NOT NULL,
  reviewer_id int(11) DEFAULT '0',
  note mediumtext NOT NULL,
  PRIMARY KEY (id),
  KEY JOS_DP_APP_PUB_LOG_VERID_STATE_TARGET_IDX (application_version_id,app_target_id,app_publish_state_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
# Dump of table jos_dp_app_publish_state
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS jos_dp_app_publish_state (
  app_publish_state_id int(11) NOT NULL,
  app_publish_state_name varchar(20) NOT NULL,
  PRIMARY KEY (app_publish_state_id),
  UNIQUE KEY UQ_jos_dp_app_publish_state (app_publish_state_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
# Dump of table jos_dp_app_published_states
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS jos_dp_app_published_states (
  id int(11) NOT NULL AUTO_INCREMENT,
  application_version_id int(10) unsigned NOT NULL,
  app_target_id int(11) NOT NULL,
  app_publish_state_id int(11) NOT NULL,
  reviewer_user_id int(11) NOT NULL,
  modified_timestamp timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY UQ_JOS_DP_PUBLISHED_STATES (application_version_id,app_target_id),
  KEY FK_JOS_DP_APP_PUBLISHED_STATES_JOS_DP_APP_TARGET (app_target_id),
  KEY FK_JOS_DP_APP_PUBLISHED_STATES_JOS_DP_APP_PUBLISH_STATE (app_publish_state_id),
  CONSTRAINT FK_JOS_DP_APP_PUBLISHED_STATES_JOS_DP_APPLICATIONVERSION FOREIGN KEY (application_version_id) REFERENCES jos_dp_applicationversion (id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_JOS_DP_APP_PUBLISHED_STATES_JOS_DP_APP_PUBLISH_STATE FOREIGN KEY (app_publish_state_id) REFERENCES jos_dp_app_publish_state (app_publish_state_id) ON UPDATE CASCADE,
  CONSTRAINT FK_JOS_DP_APP_PUBLISHED_STATES_JOS_DP_APP_TARGET FOREIGN KEY (app_target_id) REFERENCES jos_dp_app_target (app_target_id) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
# Dump of table jos_dp_app_target
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS jos_dp_app_target (
  app_target_id int(11) NOT NULL,
  app_target_name varchar(255) NOT NULL,
  app_target_signing_queue_path varchar(255) NOT NULL,
  app_target_signed_path varchar(255) NOT NULL,
  app_target_temporary_path varchar(255) NOT NULL,
  app_target_signed_final_path varchar(255) DEFAULT '',
  PRIMARY KEY (app_target_id),
  UNIQUE KEY UQ_JOS_DP_APP_TARGET (app_target_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
# Dump of table jos_dp_app_target_cs
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS jos_dp_app_target_cs (
  app_target_id int(11) NOT NULL,
  cloud_system_name varchar(255) NOT NULL,
  app_catalog_publish_host_name varchar(255) NOT NULL,
  app_catalog_publish_url varchar(255) NOT NULL,
  app_catalog_publish_path varchar(255) NOT NULL,
  app_catalog_file_upload_user varchar(255) NOT NULL,
  app_catalog_file_upload_password varchar(255) NOT NULL,
  app_catalog_update_app_url varchar(255) NOT NULL DEFAULT '',
  app_catalog_update_app_status_url varchar(255) NOT NULL DEFAULT '',
  acs2_service_url varchar(128) NOT NULL DEFAULT '',
  acs2_app_detail_url varchar(255) NOT NULL DEFAULT '',
  cdn_env_path varchar(255) NOT NULL,
  cdn_host_name varchar(255) NOT NULL,
  cdn_user varchar(255) NOT NULL,
  cdn_password varchar(255) NOT NULL,
  PRIMARY KEY (app_target_id,cloud_system_name),
  CONSTRAINT FK_JOS_DP_APP_TARGET_CS_JOS_DP_APP_TARGET FOREIGN KEY (app_target_id) REFERENCES jos_dp_app_target (app_target_id) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
# Dump of table jos_dp_app_target_replica_cs
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS jos_dp_app_target_replica_cs (
  app_target_replica_id int(10) unsigned NOT NULL AUTO_INCREMENT,
  app_target_source_id int(11) NOT NULL COMMENT 'This is the environment being replicated',
  replica_enabled tinyint(1) DEFAULT '1' COMMENT 'Whether changes should be propagated to this replica',
  cloud_system_name varchar(255) NOT NULL,
  app_catalog_publish_host_name varchar(255) NOT NULL,
  app_catalog_publish_url varchar(255) NOT NULL,
  app_catalog_publish_path varchar(255) NOT NULL,
  app_catalog_file_upload_user varchar(255) NOT NULL,
  app_catalog_file_upload_password varchar(255) NOT NULL,
  app_catalog_update_app_url varchar(255) NOT NULL DEFAULT '',
  app_catalog_update_app_status_url varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (app_target_replica_id),
  KEY FK_JOS_DP_APP_TARGET_REPLICA_CS_JOS_DP_APP_TARGET (app_target_source_id),
  CONSTRAINT FK_JOS_DP_APP_TARGET_REPLICA_CS_JOS_DP_APP_TARGET FOREIGN KEY (app_target_source_id) REFERENCES jos_dp_app_target (app_target_id) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The environments to be replicated to.';
# Dump of table jos_dp_app_txn_bulk
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS jos_dp_app_txn_bulk (
  id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  txn_date date NOT NULL,
  developer_id int(11) NOT NULL,
  app_version_id int(11) unsigned NOT NULL,
  bill_to_country char(2) NOT NULL,
  tax_or_bill_to_state char(50) NOT NULL,
  total_downloads_in_region int(11) NOT NULL,
  gross_revenue decimal(20,6) NOT NULL,
  developer_revenue decimal(20,6) NOT NULL,
  sales_tax decimal(20,6) NOT NULL,
  pre_tax_sales_price decimal(20,6) NOT NULL,
  sales_currency char(3) NOT NULL DEFAULT 'USD',
  developer_revenue_currency char(3) NOT NULL DEFAULT 'USD',
  vat_tax decimal(20,6) NOT NULL DEFAULT '0.000000',
  payment_type char(4) NOT NULL DEFAULT 'CC',
  campaign_id int(11) NOT NULL DEFAULT '0',
  promo_category char(2) NOT NULL,
  purchase_type char(5) NOT NULL,
  app_item_id varchar(512) NOT NULL,
  PRIMARY KEY (id),
  KEY FK_JOS_DP_APP_TXN_BULK_JOS_USERS_ID (developer_id),
  KEY FK_JOS_DP_APP_ACTIVITY_JOS_DP_APPLICATIONVERSION (app_version_id),
  KEY FK_JOS_DP_APP_TXN_BULK_JOS_DP_PAYMENT_TYPES (payment_type),
  KEY IX_JOS_DP_APP_TXN_BULK_PURCHASE_TYPE (purchase_type),
  CONSTRAINT FK_JOS_DP_APP_ACTIVITY_JOS_DP_APPLICATIONVERSION FOREIGN KEY (app_version_id) REFERENCES jos_dp_applicationversion (id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_JOS_DP_APP_TXN_BULK_JOS_DP_PAYMENT_TYPES FOREIGN KEY (payment_type) REFERENCES jos_dp_payment_types (payment_type_code) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_JOS_DP_APP_TXN_BULK_JOS_USERS_ID FOREIGN KEY (developer_id) REFERENCES jos_users (id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
# Dump of table jos_dp_app_txn_exchange_rate
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS jos_dp_app_txn_exchange_rate (
  date_effective date NOT NULL,
  source_currency char(3) NOT NULL,
  target_currency char(3) NOT NULL,
  exchange_rate decimal(20,8) unsigned NOT NULL,
  PRIMARY KEY (date_effective,source_currency,target_currency)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
# Dump of table jos_dp_app_version_attributes
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS jos_dp_app_version_attributes (
  app_version_id int(10) unsigned NOT NULL,
  has_plugins tinyint(1) NOT NULL DEFAULT '0',
  contains_binary tinyint(1) NOT NULL DEFAULT '0',
  built_with_ares tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (app_version_id),
  CONSTRAINT FK_JOS_DP_APP_VERSION_ATTRIBUTES_JOS_DP_APPLICATIONVERSION FOREIGN KEY (app_version_id) REFERENCES jos_dp_applicationversion (id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains app attributes like plugins etc.';
# Dump of table jos_dp_appcategories
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS jos_dp_appcategories (
  applicationversionid int(10) unsigned NOT NULL,
  categoryid int(10) unsigned NOT NULL,
  PRIMARY KEY (applicationversionid,categoryid),
  KEY FK_JOS_DP_APPCATEGORIES_JOS_DP_CATEGORIES (categoryid),
  CONSTRAINT FK_JOS_DP_APPCATEGORIES_JOS_DP_APPLICATIONVERSION FOREIGN KEY (applicationversionid) REFERENCES jos_dp_applicationversion (id) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maintains sub categories that an application is tied to';
# Dump of table jos_dp_appcountry_info
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS jos_dp_appcountry_info (
  id int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Internally generally primary key',
  applicationversionid int(10) unsigned NOT NULL,
  countryid int(3) NOT NULL,
  price float NOT NULL DEFAULT '0' COMMENT 'Indicated price',
  pricecode char(1) NOT NULL DEFAULT 'O',
  currencycode char(3) NOT NULL,
  custsupportphonenum varchar(20) NOT NULL DEFAULT '' COMMENT 'customer support phone number',
  custsupportphoneext varchar(5) NOT NULL,
  custsupportemail varchar(256) NOT NULL DEFAULT '' COMMENT 'customer support email',
  homeurl varchar(2048) NOT NULL DEFAULT '' COMMENT 'url for the application',
  supportURL varchar(2048) NOT NULL DEFAULT '' COMMENT 'support URL for the app',
  marketingemail varchar(256) NOT NULL DEFAULT '',
  PRIMARY KEY (id),
  UNIQUE KEY UQ_JOS_DP_APPCOUNTRY_INFO_APPID_COUNTRY (applicationversionid,countryid),
  KEY FK_JOS_DP_APPCOUNTRY_INFO_JOS_DP_COMMON_COUNTRY (countryid),
  KEY FK_JOS_DP_APPCOUNTRY_INFO_JOS_DP_COMMON_CURRENCY (currencycode),
  KEY FK_JOS_DP_APPCOUNTRY_INFO_JOS_DP_PRICETYPES (pricecode),
  CONSTRAINT FK_JOS_DP_APPCOUNTRY_INFO_JOS_DP_APPLICATIONVERSION FOREIGN KEY (applicationversionid) REFERENCES jos_dp_applicationversion (id) ON UPDATE CASCADE,
  CONSTRAINT FK_JOS_DP_APPCOUNTRY_INFO_JOS_DP_COMMON_COUNTRY FOREIGN KEY (countryid) REFERENCES jos_dp_common_country (ID) ON UPDATE CASCADE,
  CONSTRAINT FK_JOS_DP_APPCOUNTRY_INFO_JOS_DP_COMMON_CURRENCY FOREIGN KEY (currencycode) REFERENCES jos_dp_common_currency (currencycode) ON UPDATE CASCADE,
  CONSTRAINT FK_JOS_DP_APPCOUNTRY_INFO_JOS_DP_PRICETYPES FOREIGN KEY (pricecode) REFERENCES jos_dp_pricetypes (pricecode) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maintains country specific information for applications';
# Dump of table jos_dp_applicationentry
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS jos_dp_applicationentry (
  id int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Internally generally primary key',
  publicapplicationid varchar(128) NOT NULL COMMENT 'generated by app signing process to uniquely specify an application',
  developerid int(11) NOT NULL COMMENT 'developerid - crowd sso id of the developer ',
  publish_target varchar(100) NOT NULL DEFAULT '',
  isnew tinyint(4) NOT NULL DEFAULT '1',
  num_paid_submissions_remaining int(11) NOT NULL DEFAULT '0',
  ispaid tinyint(1) NOT NULL DEFAULT '0',
  package_app_id varchar(512) NOT NULL DEFAULT '',
  is_bulk_upload tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (id),
  UNIQUE KEY UQ_JOS_DP_APPLICATIONENTRY_PUBLICAPPLICATIONID (publicapplicationid),
  KEY FK_JOS_DP_APPLICATIONENTRY_JOS_USERS (developerid),
  CONSTRAINT FK_JOS_DP_APPLICATIONENTRY_JOS_USERS FOREIGN KEY (developerid) REFERENCES jos_users (id) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maintains meta data about an application';
# Dump of table jos_dp_applicationversion
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS jos_dp_applicationversion (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  applicationid int(10) unsigned NOT NULL,
  VERSION varchar(100) NOT NULL DEFAULT '1.0' COMMENT 'version',
  applocation varchar(2048) NOT NULL DEFAULT '' COMMENT 'location of the application',
  created datetime NOT NULL COMMENT 'creation date',
  lastmodified datetime NOT NULL COMMENT 'last modified date',
  appsize int(10) unsigned NOT NULL COMMENT 'size in bytes',
  filename varchar(2048) NOT NULL COMMENT 'file name',
  ISENCRYPTED int(11) NOT NULL DEFAULT '0',
  CCATSNUMBER varchar(7) NOT NULL DEFAULT '0' COMMENT 'CCATS number for the application',
  COPYRIGHT varchar(2048) NOT NULL DEFAULT 'copyright',
  TAXCATEGORY int(11) NOT NULL DEFAULT '5',
  APPICONSMALL varchar(256) NOT NULL COMMENT 'small app icon',
  APPICONLARGE varchar(256) NOT NULL COMMENT 'Large app icon',
  OSVERSION int(11) NOT NULL DEFAULT '1' COMMENT 'minimum OS version supported',
  programtype char(1) NOT NULL DEFAULT 'D' COMMENT 'program type',
  disclosure varchar(1024) NOT NULL DEFAULT '' COMMENT 'Obsolete',
  islocationbased tinyint(1) NOT NULL DEFAULT '0',
  reviewernotes varchar(1024) NOT NULL DEFAULT '',
  testurl varchar(256) NOT NULL DEFAULT '' COMMENT 'Obsolete, replaced by licenseurl',
  companylogo varchar(255) NOT NULL DEFAULT '',
  iscomplete tinyint(4) NOT NULL DEFAULT '0',
  delete_request tinyint(1) NOT NULL DEFAULT '0',
  licenseurl varchar(256) NOT NULL DEFAULT '',
  version_normalized varchar(100) NOT NULL DEFAULT '',
  suspend_request tinyint(1) NOT NULL DEFAULT '0' COMMENT 'App requested for suspend',
  reject_request tinyint(1) NOT NULL DEFAULT '0' COMMENT 'App requested for reject',
  installedsize int(11) NOT NULL DEFAULT '0',
  distribution_type char(1) NOT NULL DEFAULT 'D',
  ipkscan_result smallint(6) NOT NULL DEFAULT '0',
  ipkscan_report varchar(255) NOT NULL DEFAULT 'NONE',
  app_env_type varchar(32) NOT NULL DEFAULT 'web',
  rss_opt_out int(1) NOT NULL DEFAULT '0',
  appiconxlarge varchar(256) NOT NULL DEFAULT '',
  security_reviewed int(1) NOT NULL DEFAULT '0',
  universal_search_enabled tinyint(1) NOT NULL DEFAULT '0',
  dock_mode_enabled tinyint(1) NOT NULL DEFAULT '0',
  plugin tinyint(1) NOT NULL DEFAULT '0',
  terms_accepted tinyint(1) NOT NULL DEFAULT '0',
  bulk_upload_session_id int(11) NOT NULL DEFAULT '0',
  privacy_policy varchar(256) NOT NULL DEFAULT '',
  max_os_version varchar(100) DEFAULT NULL,
  target_os_version varchar(100) DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY UQ_JOS_DP_APPLICATIONVERSION_APP_VER (applicationid,VERSION),
  KEY FK_JOS_DP_APPLICATIONVERSION_JOS_DP_COMMON_OS_VERSION (OSVERSION),
  KEY FK_JOS_DP_APPLICATIONVERSION_JOS_DP_TAX_CATEGORIES (TAXCATEGORY),
  KEY FK_JOS_DP_APPLICATIONVERSION_JOS_DP_PROGRAM_TYPES (programtype),
  KEY FK_JOS_DP_APPLICATIONVERSION_JOS_DP_DISTRIBUTION_TYPES (distribution_type),
  KEY JOS_DP_APPLICATIONVERSION_FILENAME_IDX (filename(255)),
  CONSTRAINT FK_JOS_DP_APPLICATIONVERSION_JOS_DP_APPLICATIONENTRY FOREIGN KEY (applicationid) REFERENCES jos_dp_applicationentry (id) ON UPDATE CASCADE,
  CONSTRAINT FK_JOS_DP_APPLICATIONVERSION_JOS_DP_COMMON_OS_VERSION FOREIGN KEY (OSVERSION) REFERENCES jos_dp_common_os_version (id) ON UPDATE CASCADE,
  CONSTRAINT FK_JOS_DP_APPLICATIONVERSION_JOS_DP_DISTRIBUTION_TYPES FOREIGN KEY (distribution_type) REFERENCES jos_dp_distribution_types (distribution_type_id) ON UPDATE CASCADE,
  CONSTRAINT FK_JOS_DP_APPLICATIONVERSION_JOS_DP_PROGRAM_TYPES FOREIGN KEY (programtype) REFERENCES jos_dp_program_types (id) ON UPDATE CASCADE,
  CONSTRAINT FK_JOS_DP_APPLICATIONVERSION_JOS_DP_TAX_CATEGORIES FOREIGN KEY (TAXCATEGORY) REFERENCES jos_dp_tax_categories (id) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maintains data about an application version';
# Dump of table jos_dp_appsupportedlanguages
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS jos_dp_appsupportedlanguages (
  id int(11) NOT NULL AUTO_INCREMENT,
  appcountryid int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'application country mapping id',
  languageid int(3) NOT NULL,
  is_active tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (id),
  KEY appcountryid (appcountryid,languageid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maintains the supported languages for applications';
# Dump of table jos_dp_apptag
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS jos_dp_apptag (
  applicationversionid int(10) unsigned NOT NULL,
  tagid int(10) unsigned NOT NULL,
  PRIMARY KEY (applicationversionid,tagid),
  KEY FK_JOS_DP_APPTAG_JOS_DP_TAG (tagid),
  CONSTRAINT FK_JOS_DP_APPTAG_JOS_DP_APPLICATIONVERSION FOREIGN KEY (applicationversionid) REFERENCES jos_dp_applicationversion (id) ON UPDATE CASCADE,
  CONSTRAINT FK_JOS_DP_APPTAG_JOS_DP_TAG FOREIGN KEY (tagid) REFERENCES jos_dp_tag (id) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maintains many to many relationship between tags and apps';
# Dump of table jos_dp_appversion_attribute
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS jos_dp_appversion_attribute (
  attribute_id int(10) unsigned NOT NULL AUTO_INCREMENT,
  app_version_id int(10) unsigned NOT NULL,
  attribute_type_code varchar(10) NOT NULL,
  PRIMARY KEY (attribute_id),
  KEY FK_JOS_DP_APPVERSION_ATTRIBUTE_JOS_DP_APPLICATIONVERSION (app_version_id),
  KEY FK_JOS_DP_APPVERSION_ATTRIBUTE_JOS_DP_APPVERSION_ATTRIBUTE_TYPE (attribute_type_code),
  CONSTRAINT FK_JOS_DP_APPVERSION_ATTRIBUTE_JOS_DP_APPLICATIONVERSION FOREIGN KEY (app_version_id) REFERENCES jos_dp_applicationversion (id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_JOS_DP_APPVERSION_ATTRIBUTE_JOS_DP_APPVERSION_ATTRIBUTE_TYPE FOREIGN KEY (attribute_type_code) REFERENCES jos_dp_appversion_attribute_type (attribute_type_code) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains appversion attributes and values';
# Dump of table jos_dp_appversion_attribute_type
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS jos_dp_appversion_attribute_type (
  attribute_type_code varchar(10) NOT NULL,
  attribute_type_description varchar(128) NOT NULL,
  PRIMARY KEY (attribute_type_code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains appversion attributes and descriptions';
# Dump of table jos_dp_appversion_metadata
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS jos_dp_appversion_metadata (
  applicationversionid int(10) unsigned NOT NULL,
  languageid int(3) NOT NULL,
  title varchar(2048) NOT NULL DEFAULT '' COMMENT 'Title',
  summary varchar(2048) NOT NULL COMMENT 'Application description',
  author varchar(256) NOT NULL DEFAULT '' COMMENT 'author',
  appimage1 varchar(256) NOT NULL DEFAULT '' COMMENT 'app image1',
  appimage2 varchar(256) NOT NULL DEFAULT '' COMMENT 'app image2',
  appimage3 varchar(256) NOT NULL DEFAULT '' COMMENT 'app image3',
  appimage4 varchar(256) NOT NULL,
  appimage5 varchar(256) NOT NULL,
  licenseurl varchar(256) NOT NULL DEFAULT '' COMMENT 'Obsolete',
  created timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  lastmodified timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARYCATEGORY int(10) unsigned NOT NULL DEFAULT '0',
  shortdescription varchar(1024) NOT NULL DEFAULT '',
  longdescription varchar(2048) NOT NULL DEFAULT '',
  youtube_url varchar(126) NOT NULL DEFAULT '',
  youtube_thumbnail varchar(126) NOT NULL DEFAULT '',
  version_note varchar(1024) NOT NULL DEFAULT '',
  PRIMARY KEY (applicationversionid,languageid),
  KEY FK_JOS_DP_APPVERSION_METADATA_JOS_DP_COMMON_LANGUAGE (languageid),
  CONSTRAINT FK_JOS_DP_APPVERSION_METADATA_JOS_DP_APPLICATIONVERSION FOREIGN KEY (applicationversionid) REFERENCES jos_dp_applicationversion (id) ON UPDATE CASCADE,
  CONSTRAINT FK_JOS_DP_APPVERSION_METADATA_JOS_DP_COMMON_LANGUAGE FOREIGN KEY (languageid) REFERENCES jos_dp_common_language (ID) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maintains meta data and localizable content about an applica';
# Dump of table jos_dp_appversion_metadata_image
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS jos_dp_appversion_metadata_image (
  applicationversion_image_id int(10) unsigned NOT NULL AUTO_INCREMENT,
  applicationversion_id int(10) unsigned NOT NULL,
  applicationversion_languageid int(3) NOT NULL,
  image_ordinal int(1) unsigned NOT NULL,
  image_filename varchar(128) NOT NULL,
  image_orientation char(1) NOT NULL,
  image_width int(2) unsigned NOT NULL,
  image_height int(2) unsigned NOT NULL,
  model_family_type_id int(10) unsigned NOT NULL,
  image_uri varchar(512) NOT NULL,
  image_size char(1) NOT NULL,
  image_isoriginal char(1) NOT NULL DEFAULT 'O',
  PRIMARY KEY (applicationversion_image_id),
  UNIQUE KEY UQ_JOS_DP_APPVER_META_IMAGE_AV_LI_OR_IW_IH (applicationversion_id,applicationversion_languageid,image_ordinal,image_width,image_height,model_family_type_id),
  KEY FK_JOS_DP_APPVERSION_METADATA_IMAGE_JOS_DP_COMMON_LANGUAGE (applicationversion_languageid),
  KEY FK_JOS_DP_APPVER_META_IMAGE_JOS_DP_DEV_MOD_FAM_TYPE (model_family_type_id),
  CONSTRAINT FK_JOS_DP_APPVERSION_METADATA_IMAGE_JOS_DP_APPLICATIONVERSION FOREIGN KEY (applicationversion_id) REFERENCES jos_dp_applicationversion (id),
  CONSTRAINT FK_JOS_DP_APPVERSION_METADATA_IMAGE_JOS_DP_COMMON_LANGUAGE FOREIGN KEY (applicationversion_languageid) REFERENCES jos_dp_common_language (ID),
  CONSTRAINT FK_JOS_DP_APPVER_META_IMAGE_JOS_DP_DEV_MOD_FAM_TYPE FOREIGN KEY (model_family_type_id) REFERENCES jos_dp_device_model_family_type (device_model_family_type_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains images info for app versions';
# Dump of table jos_dp_appversion_user_groups
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS jos_dp_appversion_user_groups (
  application_version_id int(10) NOT NULL,
  user_group_id int(10) NOT NULL,
  UNIQUE KEY UQ_DP_APPVERSION_USER_GROUP (application_version_id,user_group_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Application Version Enterprise user group mapping';
# Dump of table jos_dp_categories
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS jos_dp_categories (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  name varchar(256) COLLATE utf8_bin NOT NULL COMMENT 'tag name',
  languageid int(11) NOT NULL,
  creator varchar(1024) COLLATE utf8_bin NOT NULL DEFAULT 'Admin' COMMENT 'user or developer display name',
  created timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'creation date',
  isenabled tinyint(1) NOT NULL DEFAULT '1',
  parentid int(11) NOT NULL DEFAULT '0',
  enterpriseid char(36) COLLATE utf8_bin NOT NULL DEFAULT '1' COMMENT 'enterprise owner',
  PRIMARY KEY (id),
  KEY FK_JOS_DP_CATEGORIES_JOS_DP_COMMON_LANGUAGE (languageid),
  CONSTRAINT FK_JOS_DP_CATEGORIES_JOS_DP_COMMON_LANGUAGE FOREIGN KEY (languageid) REFERENCES jos_dp_common_language (ID) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='palm defined application categories';
# Dump of table jos_dp_common_country
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS jos_dp_common_country (
  ID int(3) NOT NULL,
  CODE varchar(2) DEFAULT NULL,
  NAME varchar(100) NOT NULL,
  USE_FOR_PURCHASE int(11) NOT NULL DEFAULT '0',
  currencycode char(3) NOT NULL,
  check_vat smallint(6) NOT NULL DEFAULT '0',
  code_vat varchar(2) NOT NULL DEFAULT '',
  commerce_supported tinyint(1) NOT NULL DEFAULT '0',
  vat_percentage int(11) NOT NULL DEFAULT '0',
  dav_check_state tinyint(1) NOT NULL DEFAULT '0',
  dav_check_postalcode tinyint(1) NOT NULL DEFAULT '0',
  banned_country tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (ID),
  UNIQUE KEY UK_JOS_DP_COMMON_COUNTRYCODE (CODE),
  KEY FK_JOS_DP_COMMON_COUNTRY_JOS_DP_COMMON_CURRENCY (currencycode),
  CONSTRAINT FK_JOS_DP_COMMON_COUNTRY_JOS_DP_COMMON_CURRENCY FOREIGN KEY (currencycode) REFERENCES jos_dp_common_currency (currencycode) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
# Dump of table jos_dp_common_currency
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS jos_dp_common_currency (
  currencycode char(3) NOT NULL,
  currencyname varchar(100) NOT NULL,
  currencynumericcode int(11) NOT NULL,
  useforcommerce int(11) NOT NULL DEFAULT '1',
  min_for_currency decimal(20,8) NOT NULL DEFAULT '0.00000000',
  max_for_currency decimal(20,8) NOT NULL DEFAULT '0.00000000',
  min_item_price decimal(20,8) NOT NULL DEFAULT '0.00000000',
  max_item_price decimal(20,8) NOT NULL DEFAULT '0.00000000',
  PRIMARY KEY (currencycode),
  UNIQUE KEY UQ_JOS_DP_COMMON_CURRENCY_CURRENCYNAME (currencyname)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Based on ISO-4217';
# Dump of table jos_dp_common_language
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS jos_dp_common_language (
  ID int(3) NOT NULL,
  CODE varchar(2) DEFAULT NULL,
  NAME varchar(50) NOT NULL,
  DESCRIPTION varchar(100) DEFAULT NULL,
  PRIMARY KEY (ID),
  UNIQUE KEY UK_JOS_DP_COMMON_LANGUAGE_NAME (NAME),
  UNIQUE KEY UK_JOS_DP_COMMON_LANGUAGE_CODE (CODE)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
# Dump of table jos_dp_common_locale
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS jos_dp_common_locale (
  ID int(4) NOT NULL,
  LANGUAGEID int(3) NOT NULL,
  COUNTRYID int(3) NOT NULL,
  DESCRIPTION varchar(6) DEFAULT NULL,
  ACTIVE int(11) NOT NULL DEFAULT '0',
  TRANSLATION varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (ID),
  UNIQUE KEY UK_JOS_DP_COMMON_LANGCTRYID (LANGUAGEID,COUNTRYID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
# Dump of table jos_dp_common_os_version
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS jos_dp_common_os_version (
  id int(11) NOT NULL,
  version_major int(11) unsigned NOT NULL,
  version_minor int(11) unsigned NOT NULL,
  version_rev int(11) unsigned NOT NULL,
  os_name varchar(128) NOT NULL,
  isenabled tinyint(4) NOT NULL DEFAULT '1',
  code_name varchar(60) NOT NULL DEFAULT '',
  normalized_version_major int(10) unsigned NOT NULL,
  normalized_version_minor int(10) unsigned NOT NULL,
  normalized_version_fix int(10) unsigned NOT NULL,
  platform_id int(11) unsigned NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY UQ_JOS_DP_COMMON_OS_VERSION (version_major,version_minor,version_rev),
  KEY FK_JOS_DP_COMMON_OS_VERSION_DP_APP_PLATFORM (platform_id),
  CONSTRAINT FK_JOS_DP_COMMON_OS_VERSION_DP_APP_PLATFORM FOREIGN KEY (platform_id) REFERENCES dp_app_platform (platform_id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Based on ISO-4217';
# Dump of table jos_dp_configuration
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS jos_dp_configuration (
  config_key varchar(255) NOT NULL,
  config_value varchar(2048) NOT NULL,
  config_comment varchar(2048) NOT NULL,
  config_env_specific int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (config_key)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
# Dump of table jos_dp_country
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS jos_dp_country (
  country_code char(2) NOT NULL,
  country_name varchar(255) NOT NULL,
  banned_country tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (country_code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
# Dump of table jos_dp_country_languages
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS jos_dp_country_languages (
  countryid int(3) NOT NULL,
  languageid int(3) NOT NULL,
  isdefault tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (countryid,languageid),
  KEY FK_JOS_DP_COUNTRY_LANGUAGES_JOS_DP_COMMON_LANGUAGE (languageid),
  CONSTRAINT FK_JOS_DP_COUNTRY_LANGUAGES_JOS_DP_COMMON_COUNTRY FOREIGN KEY (countryid) REFERENCES jos_dp_common_country (ID) ON UPDATE CASCADE,
  CONSTRAINT FK_JOS_DP_COUNTRY_LANGUAGES_JOS_DP_COMMON_LANGUAGE FOREIGN KEY (languageid) REFERENCES jos_dp_common_language (ID) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maintains the supported languages for different countries';
# Dump of table jos_dp_country_price_tier
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS jos_dp_country_price_tier (
  pricetierid int(11) NOT NULL,
  countryid int(11) NOT NULL,
  price float NOT NULL,
  iseditable tinyint(1) NOT NULL DEFAULT '1',
  isenabled tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (countryid,pricetierid),
  KEY FK_JOS_DP_COUNTRY_PRICE_TIER_JOS_DP_PRICE_TIER (pricetierid),
  CONSTRAINT FK_JOS_DP_COUNTRY_PRICE_TIER_JOS_DP_COMMON_COUNTRY FOREIGN KEY (countryid) REFERENCES jos_dp_common_country (ID) ON UPDATE CASCADE,
  CONSTRAINT FK_JOS_DP_COUNTRY_PRICE_TIER_JOS_DP_PRICE_TIER FOREIGN KEY (pricetierid) REFERENCES jos_dp_price_tier (pricetierid) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maintains the price tiers for various countries';
# Dump of table jos_dp_currencycode
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS jos_dp_currencycode (
  CURRENCYCODE varchar(3) NOT NULL,
  CURRENCYNAME varchar(100) NOT NULL,
  CURRENCYNUMERICCODE int(11) NOT NULL,
  USEFORCOMMERCE int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (CURRENCYCODE)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Based on ISO-4217';
# Dump of table jos_dp_device_model_family
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS jos_dp_device_model_family (
  device_model_family_id int(11) NOT NULL AUTO_INCREMENT,
  ac_family_code int(10) NOT NULL DEFAULT '0',
  family_name varchar(100) NOT NULL DEFAULT '',
  is_enabled tinyint(1) NOT NULL DEFAULT '0',
  os3_emulator_device_id int(11) NOT NULL DEFAULT '0',
  model_family_group_id int(10) unsigned NOT NULL,
  model_family_type_id int(10) unsigned NOT NULL,
  min_os_version_id int(11) NOT NULL,
  max_os_version_id int(11) NOT NULL,
  release_date timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  platform_id int(11) unsigned NOT NULL,
  PRIMARY KEY (device_model_family_id),
  KEY FK_JOS_DP_DEVICE_MODEL_FAMILY_JOS_DP_DEVICE_MODEL_FAMILY_TYPE (model_family_type_id),
  KEY FK_JOS_DP_DEVICE_MODEL_FAMILY_JOS_DP_DEVICE_MODEL_FAMILY_GROUP (model_family_group_id),
  KEY FK_JOS_DP_DEVICE_MODEL_FAMILY_MIN_OS_JOS_DP_COMMON_OS_VERSION (min_os_version_id),
  KEY FK_JOS_DP_DEVICE_MODEL_FAMILY_MAX_OS_JOS_DP_COMMON_OS_VERSION (max_os_version_id),
  KEY FK_JOS_DP_DEVICE_MODEL_FAMILY_DP_APP_PLATFORM (platform_id),
  CONSTRAINT FK_JOS_DP_DEVICE_MODEL_FAMILY_DP_APP_PLATFORM FOREIGN KEY (platform_id) REFERENCES dp_app_platform (platform_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_JOS_DP_DEVICE_MODEL_FAMILY_JOS_DP_DEVICE_MODEL_FAMILY_GROUP FOREIGN KEY (model_family_group_id) REFERENCES jos_dp_device_model_family_group (device_model_family_group_id),
  CONSTRAINT FK_JOS_DP_DEVICE_MODEL_FAMILY_JOS_DP_DEVICE_MODEL_FAMILY_TYPE FOREIGN KEY (model_family_type_id) REFERENCES jos_dp_device_model_family_type (device_model_family_type_id),
  CONSTRAINT FK_JOS_DP_DEVICE_MODEL_FAMILY_MAX_OS_JOS_DP_COMMON_OS_VERSION FOREIGN KEY (max_os_version_id) REFERENCES jos_dp_common_os_version (id),
  CONSTRAINT FK_JOS_DP_DEVICE_MODEL_FAMILY_MIN_OS_JOS_DP_COMMON_OS_VERSION FOREIGN KEY (min_os_version_id) REFERENCES jos_dp_common_os_version (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains model family data for devices';
# Dump of table jos_dp_device_model_family_group
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS jos_dp_device_model_family_group (
  device_model_family_group_id int(10) unsigned NOT NULL AUTO_INCREMENT,
  group_label varchar(32) NOT NULL DEFAULT '0',
  image_width int(2) unsigned NOT NULL,
  image_height int(2) unsigned NOT NULL,
  PRIMARY KEY (device_model_family_group_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains model family groups for devices';
# Dump of table jos_dp_device_model_family_type
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS jos_dp_device_model_family_type (
  device_model_family_type_id int(10) unsigned NOT NULL AUTO_INCREMENT,
  type_label varchar(32) NOT NULL DEFAULT '0',
  PRIMARY KEY (device_model_family_type_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains model family types for devices';
# Dump of table jos_dp_device_models
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS jos_dp_device_models (
  model_id int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique ID for model',
  model_name varchar(50) NOT NULL COMMENT 'Model name',
  PRIMARY KEY (model_id),
  UNIQUE KEY UQ_JOS_DP_DEVICE_MODELS_MODEL_NAME (model_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
# Dump of table jos_dp_distribution_types
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS jos_dp_distribution_types (
  distribution_type_id char(1) NOT NULL COMMENT 'Unique ID for distribution type',
  distribution_type_name varchar(50) NOT NULL COMMENT 'Distribution Type',
  PRIMARY KEY (distribution_type_id),
  UNIQUE KEY UQ_JOS_DP_DISTRIBUTION_TYPES (distribution_type_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
# Dump of table jos_dp_featured_apps
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS jos_dp_featured_apps (
  country_code char(2) NOT NULL,
  language_code char(2) NOT NULL,
  created timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  creator varchar(64) NOT NULL DEFAULT 'no one',
  list_data blob NOT NULL,
  PRIMARY KEY (country_code,language_code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Storage for published featured app lists';
# Dump of table jos_dp_payment_types
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS jos_dp_payment_types (
  payment_type_code char(4) NOT NULL,
  payment_type_description varchar(128) NOT NULL,
  PRIMARY KEY (payment_type_code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains payment types like credit card, operator billing';
# Dump of table jos_dp_price_tier
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS jos_dp_price_tier (
  pricetierid int(11) NOT NULL AUTO_INCREMENT,
  pricetier varchar(100) NOT NULL COMMENT 'Description of price code',
  PRIMARY KEY (pricetierid),
  UNIQUE KEY UQ_JOS_DP_PRICE_TIER (pricetier)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maintains the supported price tiers';
# Dump of table jos_dp_pricetypes
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS jos_dp_pricetypes (
  pricecode char(1) NOT NULL COMMENT 'Price type codes - eg. O - one time, M - monthly, S - Subscription',
  pricetype varchar(100) NOT NULL COMMENT 'Description of price code',
  isenabled tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Is Enabled',
  PRIMARY KEY (pricecode),
  UNIQUE KEY UQ_JOS_DP_PRICETYPES (pricetype)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maintains the supported price types - eg. One Time,Monthly e';
# Dump of table jos_dp_program_types
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS jos_dp_program_types (
  id char(1) NOT NULL DEFAULT 'D',
  program_type varchar(60) NOT NULL COMMENT 'program type',
  PRIMARY KEY (id),
  UNIQUE KEY UQ_JOS_DP_PROGRAM_TYPES (program_type)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maintains program type that an application is chosen for';
# Dump of table jos_dp_state
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS jos_dp_state (
  state_code varchar(3) NOT NULL DEFAULT '',
  country_code char(2) NOT NULL,
  state_name varchar(255) NOT NULL,
  PRIMARY KEY (country_code,state_code),
  KEY FK_JOS_DP_STATE_JOS_DP_COUNTRY (country_code),
  CONSTRAINT FK_JOS_DP_STATE_JOS_DP_COUNTRY FOREIGN KEY (country_code) REFERENCES jos_dp_country (country_code) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
# Dump of table jos_dp_tag
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS jos_dp_tag (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  name varchar(1024) NOT NULL COMMENT 'tag name',
  languageid int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='tag';
# Dump of table jos_dp_tax_categories
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS jos_dp_tax_categories (
  id int(11) NOT NULL AUTO_INCREMENT,
  tax_category varchar(128) NOT NULL,
  commodity_code varchar(126) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (id),
  UNIQUE KEY UQ_JOS_DP_TAX_CATEGORIES (tax_category)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
# Dump of table jos_dp_transaction_mapper
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS jos_dp_transaction_mapper (
  id int(11) NOT NULL AUTO_INCREMENT,
  users_id int(11) NOT NULL,
  transaction_type_id int(11) NOT NULL,
  transaction_id varchar(30) NOT NULL,
  paypal_invoice_id varchar(30) DEFAULT '',
  transaction_manage_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  transaction_amount decimal(12,4) NOT NULL DEFAULT '0.0000',
  transaction_currency varchar(3) NOT NULL DEFAULT 'USD',
  vat_amount decimal(20,8) NOT NULL DEFAULT '0.00000000',
  vat_currency char(3) NOT NULL DEFAULT 'USD',
  vat_rate decimal(20,8) NOT NULL DEFAULT '0.00000000',
  vat_country char(2) NOT NULL DEFAULT 'US',
  invoicing_vendor_id int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (id),
  KEY FK_JOS_DP_TRANSACTION_MAPPER_JOS_DP_TRANSACTION_TYPE (transaction_type_id),
  KEY FK_JOS_DP_TRANSACTION_MAPPER_JOS_DP_CURRENCYCODE (transaction_currency),
  KEY FK_JOS_DP_TXN_MAPPER_JOS_DP_VENDOR (invoicing_vendor_id),
  CONSTRAINT FK_JOS_DP_TRANSACTION_MAPPER_JOS_DP_CURRENCYCODE FOREIGN KEY (transaction_currency) REFERENCES jos_dp_currencycode (CURRENCYCODE) ON UPDATE CASCADE,
  CONSTRAINT FK_JOS_DP_TRANSACTION_MAPPER_JOS_DP_TRANSACTION_TYPE FOREIGN KEY (transaction_type_id) REFERENCES jos_dp_transaction_type (id) ON UPDATE CASCADE,
  CONSTRAINT FK_JOS_DP_TXN_MAPPER_JOS_DP_VENDOR FOREIGN KEY (invoicing_vendor_id) REFERENCES jos_dp_vendor (vendor_id) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
# Dump of table jos_dp_transaction_type
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS jos_dp_transaction_type (
  id int(11) NOT NULL,
  transaction_type varchar(100) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
# Dump of table jos_dp_vendor
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS jos_dp_vendor (
  vendor_id int(10) unsigned NOT NULL COMMENT 'ID of the vendor',
  palm_it_vendor_id int(1) NOT NULL COMMENT 'The ID of the vendor in Palm''s IT systems',
  vendor_code varchar(100) NOT NULL COMMENT 'The vendor code assigned to this vendor',
  vendor_name varchar(2048) NOT NULL COMMENT 'The name of the entity',
  PRIMARY KEY (vendor_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains list of all billing entities that we interact with.';
# Dump of table jos_users
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS jos_users (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(255) NOT NULL DEFAULT '',
  username varchar(150) NOT NULL DEFAULT '',
  email varchar(100) NOT NULL DEFAULT '',
  password varchar(100) NOT NULL DEFAULT '',
  registerDate timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  KEY idx_name (name),
  KEY username (username),
  KEY email (email)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
# Dump of table pds_internalapp_entitlements
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS pds_internalapp_entitlements (
  entitlement_id int(10) unsigned NOT NULL AUTO_INCREMENT,
  pds_user_id int(10) unsigned NOT NULL,
  country_code char(2) NOT NULL,
  entitlement varchar(30) NOT NULL,
  PRIMARY KEY (entitlement_id),
  UNIQUE KEY UQ_PDS_INTERNALAPP_ENTITLEMENTS_USER_ID_COUNT_CODE_ENTITLE (pds_user_id,country_code,entitlement),
  CONSTRAINT FK_PDS_INTERNALAPP_ENTITLEMENTS_PDS_USER FOREIGN KEY (pds_user_id) REFERENCES pds_user (pds_user_id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains entitlements for internal applications';
# Dump of table pds_role
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS pds_role (
  pds_role_id int(10) unsigned NOT NULL AUTO_INCREMENT,
  pds_role_key varchar(80) NOT NULL,
  pds_role_name varchar(120) NOT NULL,
  PRIMARY KEY (pds_role_id),
  UNIQUE KEY PDS_ROLE_ROLE_KEY_UNIQUE (pds_role_key)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Available roles for PDS users';
# Dump of table pds_session
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS pds_session (
  id char(32) NOT NULL DEFAULT '',
  modified int(11) NOT NULL,
  lifetime int(11) NOT NULL,
  data text NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The sessions for the PDS tool';
# Dump of table pds_user
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS pds_user (
  pds_user_id int(10) unsigned NOT NULL AUTO_INCREMENT,
  pds_user_name varchar(80) NOT NULL COMMENT 'This is the Directory id of an entity',
  password_hash varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (pds_user_id),
  UNIQUE KEY PDS_USER_USER_NAME_UNIQUE (pds_user_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Users of the PDS admin tool';
# Dump of table pds_user_role
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS pds_user_role (
  pds_user_id int(10) unsigned NOT NULL,
  pds_role_id int(10) unsigned NOT NULL,
  PRIMARY KEY (pds_user_id,pds_role_id),
  KEY FK_PDS_USER_ROLE_PDS_ROLE (pds_role_id),
  CONSTRAINT FK_PDS_USER_ROLE_PDS_ROLE FOREIGN KEY (pds_role_id) REFERENCES pds_role (pds_role_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_PDS_USER_ROLE_PDS_USER FOREIGN KEY (pds_user_id) REFERENCES pds_user (pds_user_id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The currently assigned roles to PDS Users';
# Dump of table pds_wf_instance
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS pds_wf_instance (
  flow_id int(10) unsigned NOT NULL AUTO_INCREMENT,
  flow_type_id int(10) unsigned NOT NULL,
  creation_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  start_date timestamp NOT NULL DEFAULT '1971-01-01 00:00:01',
  end_date timestamp NOT NULL DEFAULT '1971-01-01 00:00:01',
  is_complete tinyint(1) NOT NULL DEFAULT '0',
  flow_status_id int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (flow_id),
  KEY FK_PDS_WF_INSTANCE_PDS_WF_TYPE (flow_type_id),
  KEY FK_PDS_WF_INSTANCE_PDS_WF_INSTANCE_STATUS (flow_status_id),
  CONSTRAINT FK_PDS_WF_INSTANCE_PDS_WF_INSTANCE_STATUS FOREIGN KEY (flow_status_id) REFERENCES pds_wf_instance_status (wf_instance_status_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_PDS_WF_INSTANCE_PDS_WF_TYPE FOREIGN KEY (flow_type_id) REFERENCES pds_wf_type (type_id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains all Instance of Workflows';
# Dump of table pds_wf_instance_metadata
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS pds_wf_instance_metadata (
  metadata_id int(10) unsigned NOT NULL AUTO_INCREMENT,
  flow_id int(10) unsigned NOT NULL,
  name varchar(64) NOT NULL,
  value varchar(256) NOT NULL,
  PRIMARY KEY (metadata_id),
  UNIQUE KEY UQ_PDS_WF_INSTANCE_METADATA_FLOW_ID_NAME (flow_id,name),
  CONSTRAINT FK_PDS_WF_INSTANCE_METADATA_PDS_WF_INSTANCE FOREIGN KEY (flow_id) REFERENCES pds_wf_instance (flow_id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains Metadata specific to a wf instance';
# Dump of table pds_wf_instance_status
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS pds_wf_instance_status (
  wf_instance_status_id int(10) unsigned NOT NULL AUTO_INCREMENT,
  status varchar(32) NOT NULL,
  PRIMARY KEY (wf_instance_status_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Definition of the Types Status of Workflows';
# Dump of table pds_wf_instance_step
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS pds_wf_instance_step (
  step_id int(10) unsigned NOT NULL AUTO_INCREMENT,
  flow_id int(10) unsigned NOT NULL,
  step_name_id int(10) unsigned NOT NULL,
  creation_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  last_modified timestamp NOT NULL DEFAULT '1971-01-01 00:00:01',
  end_date timestamp NOT NULL DEFAULT '1971-01-01 00:00:01',
  is_complete tinyint(1) NOT NULL DEFAULT '0',
  step int(11) NOT NULL DEFAULT '1',
  step_status_id int(10) unsigned NOT NULL,
  PRIMARY KEY (step_id),
  KEY FK_PDS_WF_INSTANCE_STEP_PDS_WF_INSTANCE (flow_id),
  KEY FK_PDS_WF_INSTANCE_STEP_PDS_WF_INSTANCE_STEP_STATUS (step_status_id),
  KEY FK_PDS_WF_INSTANCE_STEP_PDS_WF_STEP_NAME (step_name_id),
  CONSTRAINT FK_PDS_WF_INSTANCE_STEP_PDS_WF_INSTANCE FOREIGN KEY (flow_id) REFERENCES pds_wf_instance (flow_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_PDS_WF_INSTANCE_STEP_PDS_WF_INSTANCE_STEP_STATUS FOREIGN KEY (step_status_id) REFERENCES pds_wf_instance_step_status (step_status_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_PDS_WF_INSTANCE_STEP_PDS_WF_STEP_NAME FOREIGN KEY (step_name_id) REFERENCES pds_wf_step_name (step_name_id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains all Steps for a Workflows';
# Dump of table pds_wf_instance_step_status
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS pds_wf_instance_step_status (
  step_status_id int(10) unsigned NOT NULL AUTO_INCREMENT,
  status varchar(32) NOT NULL,
  PRIMARY KEY (step_status_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Definition of the Types Status of Steps';
# Dump of table pds_wf_step_name
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS pds_wf_step_name (
  step_name_id int(10) unsigned NOT NULL AUTO_INCREMENT,
  step_name varchar(32) NOT NULL,
  PRIMARY KEY (step_name_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Definition of the Steps for Workflows';
# Dump of table pds_wf_type
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS pds_wf_type (
  type_id int(10) unsigned NOT NULL AUTO_INCREMENT,
  flow_type varchar(32) NOT NULL,
  PRIMARY KEY (type_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Definition of the Types of Workflows';

# Dump of table dp_webos_app_dependency
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dp_webos_app_dependency` (
  `webos_app_dependency_id` int(11) NOT NULL AUTO_INCREMENT,
  `webos_app_dependency_type_id` char(3) NOT NULL,
  `webos_app_dependency_data` varchar(256) NOT NULL,
  PRIMARY KEY (`webos_app_dependency_id`),
  UNIQUE KEY `webos_app_dependency_type_id` (`webos_app_dependency_type_id`,`webos_app_dependency_data`)
) ENGINE=MyISAM AUTO_INCREMENT=193 DEFAULT CHARSET=utf8;

# Dump of table dp_webos_app_dependency_osversion
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dp_webos_app_dependency_osversion` (
  `webos_app_dependency_osversion_id` int(11) NOT NULL AUTO_INCREMENT,
  `webos_app_dependency_id` int(11) NOT NULL,
  `webos_app_dependency_min_osversion` int(11) NOT NULL DEFAULT '1',
  `webos_app_dependency_max_osversion` int(11) NOT NULL DEFAULT '999999',
  PRIMARY KEY (`webos_app_dependency_osversion_id`),
  KEY `webos_app_dependency_id` (`webos_app_dependency_id`),
  KEY `webos_app_dependency_min_osversion` (`webos_app_dependency_min_osversion`),
  KEY `webos_app_dependency_max_osversion` (`webos_app_dependency_max_osversion`)
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8;

# Dump of table dp_webos_app_dependency_type
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dp_webos_app_dependency_type` (
  `webos_app_dependency_type_id` char(3) NOT NULL,
  `webos_app_dependency_type_name` varchar(64) NOT NULL,
  PRIMARY KEY (`webos_app_dependency_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Dump of table jos_dp_carriers
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `jos_dp_carriers` (
  `carrier_id` int(3) unsigned NOT NULL COMMENT 'Unique ID for carrier',
  `carrier_name` varchar(30) NOT NULL COMMENT 'Carrier name',
  `enabled` int(1) NOT NULL DEFAULT '1',
  `code` varchar(5) NOT NULL,
  `inuse` int(11) NOT NULL DEFAULT '0',
  `portal_inuse` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`carrier_id`),
  UNIQUE KEY `UQ_JOS_DP_CARRIERS` (`carrier_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Dump of table  jos_dp_sms_api_clients
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `jos_dp_sms_api_clients` (
  `id` int(3) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Unique ID for api client',
  `client_active` int(1) NOT NULL COMMENT '1 = active, 0 = inactive (voluntary), -1 = suspended/revoked',
  `client_auth_code` varchar(64) NOT NULL COMMENT 'private md5 hash code identifying an api client',
  `client_company` varchar(64) NOT NULL COMMENT 'name of client company',
  `client_contact` varchar(64) NOT NULL COMMENT 'primary contact',
  `client_email` varchar(64) NOT NULL COMMENT 'primary contact email',
  `issue_date` varchar(12) NOT NULL COMMENT 'date key was issued',
  `note` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

# Dump of table jos_dp_sms_country_info
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `jos_dp_sms_country_info` (
  `id` int(3) unsigned NOT NULL COMMENT 'Unique ID for sms+country',
  `country_code` varchar(2) NOT NULL COMMENT 'Country Code',
  `enabled` int(1) NOT NULL,
  `calling_code` int(4) NOT NULL,
  `carrier_code_id` int(3) NOT NULL,
  UNIQUE KEY `JOS_DP_SMS_COUNTRY_INFO_COUNTRY_CODE` (`country_code`),
  CONSTRAINT `FK_JOS_DP_SMS_COUNTRY_INFO_JOS_DP_COUNTRY` FOREIGN KEY (`country_code`) REFERENCES `jos_dp_country` (`country_code`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Dump of table jos_dp_sms_carrier_codes
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `jos_dp_sms_carrier_codes` (
  `id` int(3) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Unique ID for carrier code',
  `carrier_code` varchar(32) NOT NULL COMMENT 'Short/Long code for carrier identifcation',
  `note` varchar(128) NOT NULL COMMENT 'Detail about country/carrier for short/long code',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

# Dump of table jos_dp_paypal_country_config
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `jos_dp_paypal_country_config` (
  `countrycode` char(2) NOT NULL DEFAULT '' COMMENT 'primary key',
  `appSubmissionFee` decimal(20,8) NOT NULL DEFAULT '0.00000000',
  `developerRegFee` decimal(20,8) NOT NULL DEFAULT '0.00000000',
  `opensourceRegFee` decimal(20,8) NOT NULL DEFAULT '0.00000000',
  `updateFee` decimal(20,8) NOT NULL DEFAULT '0.00000000',
  `currencyCode` char(3) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `palm_entity_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`countrycode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maintains country specific config information for paypal';


CREATE TABLE IF NOT EXISTS `dp_app_image_aspect_ratio` (
  `aspect_ratio_id` int(11) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `width` int(4) NOT NULL,
  `height` int(4) NOT NULL
) COMMENT='add fixed aspect ratio iamge support';

CREATE TABLE IF NOT EXISTS `dp_app_image_icon_dimension` (
  `app_icon_dimension_id` int(11) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `icon_type` tinyint(2) NOT NULL,
  `max_size` int(4) NOT NULL,
  `min_size` int(4) NOT NULL
) COMMENT='add dimension sets for icons';

CREATE TABLE IF NOT EXISTS `dp_app_image_screenshot_dimension` (
  `app_screenshot_dimension_id` int(11) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `max_size` int(4) NOT NULL,
  `min_size` int(4) NOT NULL
) COMMENT='add dimension sets for screenshots';

CREATE TABLE IF NOT EXISTS `jos_dp_device_type_icon_requirements` (
  `device_model_family_type_id` int(10) unsigned NOT NULL,
  `app_icon_dimension_id` int(11) unsigned NOT NULL,
  `aspect_ratio_id` int(11) unsigned NOT NULL,
  `is_enabled` tinyint(1) NOT NULL,
  FOREIGN KEY (`device_model_family_type_id`) REFERENCES `jos_dp_device_model_family_type` (`device_model_family_type_id`),
  FOREIGN KEY (`app_icon_dimension_id`) REFERENCES `dp_app_image_icon_dimension` (`app_icon_dimension_id`),
  FOREIGN KEY (`aspect_ratio_id`) REFERENCES `dp_app_image_aspect_ratio` (`aspect_ratio_id`)
) COMMENT='';

CREATE TABLE IF NOT EXISTS `jos_dp_device_type_screenshot_requirements` (
  `device_model_family_type_id` int(10) unsigned NOT NULL,
  `app_screenshot_dimension_id` int(11) unsigned NOT NULL,
  `aspect_ratio_id` int(11) unsigned NOT NULL,
  `is_enabled` tinyint(1) NOT NULL,
  FOREIGN KEY (`device_model_family_type_id`) REFERENCES `jos_dp_device_model_family_type` (`device_model_family_type_id`),
  FOREIGN KEY (`app_screenshot_dimension_id`) REFERENCES `dp_app_image_screenshot_dimension` (`app_screenshot_dimension_id`),
  FOREIGN KEY (`aspect_ratio_id`) REFERENCES `dp_app_image_aspect_ratio` (`aspect_ratio_id`)
) COMMENT='';

CREATE TABLE IF NOT EXISTS `dp_appversion_os_versions` (
  `app_version_id` int(10) unsigned NOT NULL,
  `os_version_id` int(11) NOT NULL,
  KEY `FK_DP_APPVERSION_OS_VERSIONS_JOS_DP_APPLICATIONVERSION` (`app_version_id`),
  KEY `FK_DP_APPVERSION_OS_VERSIONS_JOS_DP_COMMON_OS_VERSION` (`os_version_id`),
  CONSTRAINT `FK_DP_APPVERSION_OS_VERSIONS_JOS_DP_APPLICATIONVERSION` FOREIGN KEY (`app_version_id`) REFERENCES `jos_dp_applicationversion` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_DP_APPVERSION_OS_VERSIONS_JOS_DP_COMMON_OS_VERSION` FOREIGN KEY (`os_version_id`) REFERENCES `jos_dp_common_os_version` (`id`) ON UPDATE CASCADE
) COMMENT='';

SET foreign_key_checks = 1;
