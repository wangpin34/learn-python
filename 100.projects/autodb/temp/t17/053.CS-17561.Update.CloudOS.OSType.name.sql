USE t17;

# CS-17561:"Cloud OS" in "Cloud OS Moonshot" option should be one word
UPDATE jos_dp_common_os_version SET `os_name` = 'CloudOS 1.0' , `code_name` = 'CloudOS 1.0' WHERE `id` = 20010100;
UPDATE jos_dp_device_model_family SET `family_name` = 'CloudOS Moonshot' WHERE `device_model_family_id` = 20010;