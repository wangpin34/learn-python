USE t17;

# CS-18625:add .tar.gz and .tgz file extension support to SDN platfrom
INSERT IGNORE INTO dp_app_platform_properties (`property_type`, `property_value`, `platform_id`, `is_enabled`)
VALUES 
('FileExtension', 'tar.gz', 10, 1),
('FileExtension', 'tgz', 10, 1);