USE t17;

# CS-19611: Disable group action for HPA Mini Apps

# HPIT on SBDEV
INSERT IGNORE INTO `dp_enterprise_properties` (`enterprise_id`, `property_type`, `property_value`) VALUES 
('432a22e3-769f-11e4-8ae6-d89d672a6d61', 'enableGroupAction', 0);

# HPIT on CQ
INSERT IGNORE INTO `dp_enterprise_properties` (`enterprise_id`, `property_type`, `property_value`) VALUES 
('eada88f8-7c47-11e4-bfb0-1cc1de0698fa', 'enableGroupAction', 0);