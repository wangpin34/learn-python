USE T20;

# CS-15835:add .ova file extension support to SDN platfrom
INSERT IGNORE INTO dp_app_platform_properties (`property_type`, `property_value`, `platform_id`, `is_enabled`)
VALUES 
('FileExtension', 'ova', 10, 1);