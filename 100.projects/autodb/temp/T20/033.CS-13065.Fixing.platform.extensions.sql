USE T20;
INSERT IGNORE INTO dp_app_platform_properties (property_type, property_value, platform_id, is_enabled)
    VALUES ("FileExtension", "msi", 2, 1),
        ("FileExtension", "exe", 2, 1),
        ("FileExtension", "apk", 6, 1),
        ("FileExtension", "ipa", 7, 1),
        ("FileExtension", "zip", 2, 1),
        ("FileExtension", "csu", 2, 1);
