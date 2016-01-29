USE t17;

 # CS-17735:Change the CloudOS SPECIFIC OS Types


 # disable the name like 'Cloud OS for Moonshot' , because its name is not strict so we use id here 
UPDATE jos_dp_device_model_family
SET    is_enabled = 0
WHERE platform_id = 11
  AND device_model_family_id = 20010;

 # update the name from 'HP Helion OpenStack Community Edition' to 'HP Helion OpenStack Community'. To avoid
UPDATE jos_dp_device_model_family
SET family_name = 'HP Helion OpenStack Community'
WHERE platform_id = 11 
  AND device_model_family_id = 20021;

INSERT IGNORE INTO jos_dp_device_model_family (device_model_family_id, ac_family_code, family_name, is_enabled,
os3_emulator_device_id, model_family_group_id, model_family_type_id, min_os_version_id, max_os_version_id,
release_date, platform_id)
VALUES
(20022, 20022, 'HP Helion Development Platform',1,20000,20000,20000,20010100,20010100,'1970-01-01 00:00:01',11),
(20023, 20023, 'HP Helion Development Platform Community',1,20000,20000,20000,20010100,20010100,'1970-01-01 00:00:01',11);


