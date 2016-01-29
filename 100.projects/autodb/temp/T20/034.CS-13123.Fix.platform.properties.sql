USE T20;

DELETE FROM dp_app_platform_properties 
    WHERE property_type = "FileExtension" 
        AND property_value = 'csu' 
        AND platform_id = 2;

DELETE FROM dp_app_platform_properties  
    WHERE property_type = 'FileExtension' 
        AND platform_id = 9;

INSERT IGNORE INTO dp_app_platform_properties (property_type, property_value, platform_id, is_enabled)
    VALUES ("FileExtension", "cus", 2, 1);
INSERT IGNORE INTO dp_app_platform_properties (property_type, property_value, platform_id, is_enabled)
    VALUES ("FileExtension", "*", 9, 1);
