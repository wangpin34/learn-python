USE t17;
#Cloud2.0 reporting service need to load data from below three tables according to the timestamp
#Add timestamp column for record created and last modified time

ALTER TABLE dp_recurring_details ADD created_time TIMESTAMP DEFAULT '2011-11-11 11:11:11' COMMENT 'created time';
ALTER TABLE dp_recurring_details ADD lastmodified_time TIMESTAMP  DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'lastmodified time';

ALTER TABLE jos_dp_appcountry_info ADD created_time TIMESTAMP  DEFAULT '2011-11-11 11:11:11'  COMMENT 'created time';
ALTER TABLE jos_dp_appcountry_info ADD lastmodified_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP  COMMENT 'lastmodified time';

ALTER TABLE jos_dp_applicationentry ADD created_time TIMESTAMP  DEFAULT '2011-11-11 11:11:11'  COMMENT 'created time';
ALTER TABLE jos_dp_applicationentry ADD lastmodified_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP  COMMENT 'lastmodified time';

#Update the lastmodified_time to current time, because by detault the value is : 0000-00-00 00:00:00. 
#And it will lead to error in java - Reporting data loader service.

UPDATE dp_recurring_details SET lastmodified_time = now() WHERE lastmodified_time = '0000-00-00 00:00:00';
UPDATE jos_dp_appcountry_info SET lastmodified_time = now() WHERE lastmodified_time = '0000-00-00 00:00:00';
UPDATE jos_dp_applicationentry SET lastmodified_time = now() WHERE lastmodified_time = '0000-00-00 00:00:00';

