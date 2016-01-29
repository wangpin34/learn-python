USE T20;

# CS-20511: Enable HPA for support mini App platform on PROD

# Bind Mini Apps platform to HPITDEV tenant
INSERT IGNORE INTO `dp_enterprise_platforms` (`enterprise_id`, `platform_id`) VALUES 
('19825159-a2a2-11e4-b621-1cc1de6f6c7e', '8');

# Disable group actions for HPITDEV on Prod
INSERT IGNORE INTO `dp_enterprise_properties` (`enterprise_id`, `property_type`, `property_value`) VALUES 
('19825159-a2a2-11e4-b621-1cc1de6f6c7e', 'enableGroupAction', 0);

# Bind Mini Apps platform to HPITSTAGING tenant
INSERT IGNORE INTO `dp_enterprise_platforms` (`enterprise_id`, `platform_id`) VALUES 
('c37a7bb4-a60c-11e4-b4b3-1cc1de6f6c7e', '8');

# Disable group actions for HPITSTAGING on Prod
INSERT IGNORE INTO `dp_enterprise_properties` (`enterprise_id`, `property_type`, `property_value`) VALUES 
('c37a7bb4-a60c-11e4-b4b3-1cc1de6f6c7e', 'enableGroupAction', 0);

# Bind Mini Apps platform to Hpa tenant
INSERT IGNORE INTO `dp_enterprise_platforms` (`enterprise_id`, `platform_id`) VALUES 
('3fc937f9-a129-11e4-abb8-d8d385e16fb6', '8');

# Disable group actions for Hpa on Prod
INSERT IGNORE INTO `dp_enterprise_properties` (`enterprise_id`, `property_type`, `property_value`) VALUES 
('3fc937f9-a129-11e4-abb8-d8d385e16fb6', 'enableGroupAction', 0);