USE T20;
CALL sp_addColumn('jos_dp_applicationentry', 'enterpriseId', 'varchar(55) NOT NULL AFTER packageId');
CALL sp_addColumn('jos_dp_applicationentry', 'platformId', 'int(11) NOT NULL AFTER enterpriseId');
UPDATE jos_dp_applicationentry SET enterpriseId = (
    SELECT dp_enterprise_developers.enterprise_id FROM dp_enterprise_developers
            WHERE jos_dp_applicationentry.developerid = dp_enterprise_developers.developer_id);
UPDATE jos_dp_applicationentry ae SET platformId = (
    SELECT ap.platform_id FROM dp_app_platform ap, jos_dp_applicationversion av
            WHERE av.applicationid = ae.id 
                AND ap.platform_name = av.app_env_type LIMIT 1);

UPDATE jos_dp_applicationentry SET platformId = 7 WHERE id in (
    SELECT applicationid FROM jos_dp_applicationversion av
            WHERE av.applocation LIKE "https://itunes.apple.com%");

UPDATE jos_dp_applicationentry SET platformId = 6 WHERE id in (
    SELECT applicationid FROM jos_dp_applicationversion av
            WHERE av.applocation LIKE "https://play.google.com%");