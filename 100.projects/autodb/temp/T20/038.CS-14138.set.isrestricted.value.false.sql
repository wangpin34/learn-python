USE T20;

UPDATE `dp_app_platform_properties` SET `property_value`=false WHERE `property_type`="isRestricted" AND `platform_id`=9 AND `is_enabled`=1;