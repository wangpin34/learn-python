USE t17;

# CS-21247: Change platform and device family name from Cloud OS to HP Helion

UPDATE  `dp_app_platform` SET  `platform_name` =  'HP Helion' WHERE `platform_id` =11;


UPDATE  `jos_dp_device_model_family_group` SET  `group_label` =  'HP Helion' WHERE  `device_model_family_group_id` =20000;

