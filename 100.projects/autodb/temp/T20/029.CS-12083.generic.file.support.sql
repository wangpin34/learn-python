USE T20;
INSERT IGNORE INTO dp_app_platform (platform_id, platform_name, is_enabled)
VALUES
    (9,'Generic',1);
INSERT IGNORE INTO dp_app_platform_submissiontype_workflow (platform_id, submission_type, environment_id, workflow_id, queue_id)
VALUES
    (9,'new','QA',22,45),
    (9,'update','QA',22,45),
    (9,'meta','QA',22,37),
    (9,'new','PROD',22,38),
    (9,'update','PROD',22,38),
    (9,'meta','PROD',22,38);
DELETE FROM dp_app_platform_properties  
    WHERE property_type = 'FileExtension' 
        AND property_value = 'pdf'  AND platform_id = 2;
INSERT IGNORE INTO dp_app_platform_properties (property_type, property_value, platform_id, is_enabled)
VALUES
    ('FileExtension','pptx',9,1),
    ('FileExtension','pdf',9,1),
    ('FileExtension','mp4',9,1),
    ('VersionRequired','1',9,1),
    ('PaidCountry','23',9,1),
    ('FreeCountry','23',9,1),
    ('SupportedLanguage','0',9,1),
    ('RunsOnPlatforms','2',9,1),
    ('RunsOnPlatforms','6',9,1),
    ('RunsOnPlatforms','7',9,1);