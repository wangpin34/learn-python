use T20;

INSERT IGNORE INTO jos_dp_common_os_version (id, version_major, version_minor, version_rev, os_name, isenabled, code_name, normalized_version_major, normalized_version_minor, normalized_version_fix, platform_id)
VALUES
     (960421,96,4,21,'Android 4.2.1',1,'JELLY_BEAN_MR1',96,4,21,6),
    (960422,96,4,22,'Android 4.2.2',1,'JELLY_BEAN_MR1',96,4,22,6),   
    (960430,96,4,30,'Android 4.3',1,'JELLY_BEAN_MR2',96,4,30,6),
    (960431,96,4,31,'Android 4.3.1',1,'JELLY_BEAN_MR2',96,4,31,6),   
    (960440,96,4,40,'Android 4.4',1,'KITKAT',96,4,40,6),
    (960441,96,4,41,'Android 4.4.1',1,'KITKAT',96,4,41,6),
    (960440,96,4,42,'Android 4.4.2',1,'KITKAT',96,4,42,6);
    
INSERT IGNORE INTO dp_android_api_level (api_level, platform_version, version_code,
               min_os_version, max_os_version, target_os_version)
VALUES
    (18,'Android 4.3','JELLY_BEAN_MR2',960430,960430,960430),
    (19,'Android 4.4','KITKAT',960440,960440,960440);
 
UPDATE dp_android_api_level  set max_os_version=960422, target_os_version=960422 where  api_level=17;