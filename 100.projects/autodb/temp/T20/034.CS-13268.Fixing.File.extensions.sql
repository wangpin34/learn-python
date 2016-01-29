USE T20;
DELETE FROM dp_app_platform_properties 
        WHERE property_type = "FileExtension" AND
            property_value = "zip" AND
            platform_id = 2 AND 
            is_enabled = 1;

UPDATE jos_dp_applicationversion SET app_env_type = "ANY" WHERE filename LIKE "%.zip";
UPDATE jos_dp_applicationentry SET platformid = 9 WHERE id IN (
        SELECT applicationid FROM jos_dp_applicationversion WHERE filename LIKE "%.zip");

DELETE FROM dp_app_platform_properties 
        WHERE property_type = "FileExtension" AND
            property_value = "csu" AND
            platform_id = 2 AND 
            is_enabled = 1;

UPDATE jos_dp_applicationversion SET app_env_type = "ANY" WHERE filename LIKE "%.csu";
UPDATE jos_dp_applicationentry SET platformid = 9 WHERE id IN (
        SELECT applicationid FROM jos_dp_applicationversion WHERE filename LIKE "%.csu");

DELETE FROM dp_app_platform_properties 
        WHERE property_type = "RunsOnPlatforms" AND
            property_value = "9" AND
            platform_id = 9 AND 
            is_enabled = 1;