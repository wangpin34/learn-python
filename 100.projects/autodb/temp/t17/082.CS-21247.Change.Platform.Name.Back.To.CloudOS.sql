USE t17;

# CS-21247: Change platform name back to CloudOS since GCC depends on it

UPDATE  `dp_app_platform` SET  `platform_name` =  'CloudOS' WHERE `platform_id` =11;


