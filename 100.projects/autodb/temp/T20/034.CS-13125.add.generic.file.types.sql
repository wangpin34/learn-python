use T20;
DELETE FROM dp_app_platform_properties  
    WHERE property_type = 'FileExtension' 
        AND platform_id = 9;
INSERT IGNORE INTO dp_app_platform_properties (property_type, property_value, platform_id, is_enabled)
VALUES
    ('FileExtension','pptx',9,1),
    ('FileExtension','pdf',9,1),
    ('FileExtension','mp4',9,1);
