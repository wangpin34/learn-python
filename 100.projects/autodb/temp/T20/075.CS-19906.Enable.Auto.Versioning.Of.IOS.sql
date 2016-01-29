USE T20;

# CS-19906: submission of an IOS package should get version number from plist instead of manual input

UPDATE  `dp_app_platform_properties` SET  `property_value` =  '0' WHERE `property_type` =  'VersionRequired' AND `platform_id` = 7;