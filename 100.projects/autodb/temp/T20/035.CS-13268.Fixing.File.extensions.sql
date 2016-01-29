USE T20;

DELETE FROM dp_app_platform_properties 
    WHERE property_type = "FileExtension";

INSERT IGNORE INTO dp_app_platform_properties (property_type, property_value, platform_id, is_enabled)
    VALUES ("FileExtension", "msi", 2, 1),
        ("FileExtension", "exe", 2, 1),
        ("FileExtension", "apk", 6, 1),
        ("FileExtension", "ipa", 7, 1),
        ("FileExtension", "*", 9, 1);
