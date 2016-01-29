use T20;

#project PN-177 MP - Open Daylight Support. jira:CS-19910

#disable sdn controller version:Open Daylight 1.0
UPDATE jos_dp_common_os_version SET isenabled = 0 WHERE id = 10030100;

#add ODL controller version
INSERT IGNORE INTO  jos_dp_common_os_version
(id, version_major, version_minor, version_rev, os_name, isenabled, code_name, normalized_version_major, normalized_version_minor, normalized_version_fix, platform_id) 
VALUES
(10030201,1003,2,1,'ODL Controller Hydrogen',1,'ODL Controller Hydrogen',1003,2,1,10),
(10030202,1003,2,2,'ODL Controller Helium',1,'ODL Controller Helium',1003,2,2,10),
(10030203,1003,2,3,'ODL Controller Lithium',1,'ODL Controller Lithium',1003,2,3,10),
(10030204,1003,2,4,'ODL Controller Beryllium',1,'ODL Controller Beryllium',1003,2,4,10);

#enable openflow version 1.0,1.3,1.4
UPDATE jos_dp_openflow SET is_enabled = 1 WHERE openflow_id	IN (1100,1130,1140);

#add OpenFlow 1.5
INSERT IGNORE INTO jos_dp_openflow (openflow_id,openflow_version,openflow_name,openflow_spec_url,platform_id,release_date,is_enabled)
VALUES (1150,'1.5','OpenFlow 1.5','',10,'0000-00-00 00:00:00',1);


#update ODL device
UPDATE jos_dp_device_model_family 
SET is_enabled = 1,
	family_name = 'Open Daylight Controller',
	min_os_version_id = 10030201,
	max_os_version_id = 10030204
WHERE device_model_family_id = 10030;






