USE T20;

 # CS-17734:Change "Supported OS Version" from "CloudOS 1.0" to "HP Helion"

UPDATE jos_dp_common_os_version
SET os_name = 'HP Helion',
    code_name = 'HP Helion'
WHERE id = 20010100