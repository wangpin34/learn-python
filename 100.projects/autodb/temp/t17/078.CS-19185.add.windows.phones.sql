# The end of CS-19185 specifies that windows app are supported on Windows PC, not on Windows phone
# so this feature is now disabled. This feature was never enabled on prod

USE t17;

# added in disabled state
INSERT ignore INTO dp_app_platform ( platform_name , platform_id , is_enabled ) 
VALUES ('WindowsPhone', 12, 0);

INSERT IGNORE INTO jos_dp_device_model_family_type (device_model_family_type_id, type_label)
VALUES (1500,'WindowsPhone');

# Devices
INSERT IGNORE INTO jos_dp_device_model_family_group ( device_model_family_group_id, group_label, image_width,
 image_height ) VALUES (1500,'WindowsPhone',320,480);

# OS versions Windows 7 7.5 7.8 8 8.1
INSERT IGNORE INTO jos_dp_common_os_version 
(id    , version_major, version_minor, version_rev  , os_name           , isenabled, normalized_version_major, normalized_version_minor, normalized_version_fix , platform_id)
VALUES 
(970700, 97           ,      7       ,             0,      'Windows 7'  ,  1       ,           97            ,                        7,                       0,          12),
(970705, 97           ,      7       ,             5,      'Windows 7.5',  1       ,           97            ,                        7,                       5,          12),
(970708, 97           ,      7       ,             8,      'Windows 7.8',  1       ,           97            ,                        7,                       8,          12),
(970800, 97           ,      8       ,             0,      'Windows 8'  ,  1       ,           97            ,                        8,                       0,          12),
(970801, 97           ,      8       ,             1,      'Windows 8.1',  1       ,           97            ,                        8,                       1,          12);

INSERT IGNORE INTO jos_dp_device_model_family
(device_model_family_id, ac_family_code , family_name , is_enabled , os3_emulator_device_id , model_family_group_id , model_family_type_id , min_os_version_id , max_os_version_id , platform_id)
VALUES
(1500                  , 1500           , 'Small'     , 1          , 1500                   , 1500                  , 1500                 , 970700            , 970800            , 12), 
(1501                  , 1500           , 'Normal'    , 1          , 1500                   , 1500                  , 1500                 , 970700            , 970800            , 12), 
(1502                  , 1500           , 'Large'     , 1          , 1500                   , 1500                  , 1500                 , 970700            , 970800            , 12), 
(1503                  , 1500           , 'XLarge'    , 1          , 1500                   , 1500                  , 1500                 , 970700            , 970800            , 12);

INSERT IGNORE INTO dp_device_type_app_image_requirements( device_family_type_id , image_dimension_id , is_enabled )
   VALUES (1500, 1, 1);

# Enable something
INSERT IGNORE INTO  dp_app_platform_properties 
( property_type       , property_value , platform_id , is_enabled ) VALUES
('RunsOnPlatforms'    , 12             , 12          , 1);


