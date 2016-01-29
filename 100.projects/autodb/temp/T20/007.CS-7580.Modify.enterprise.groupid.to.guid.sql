USE T20;

ALTER TABLE `jos_dp_appversion_user_groups`
MODIFY COLUMN `user_group_id`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL AFTER `application_version_id`;

ALTER TABLE `dp_enterprise_developers`
MODIFY COLUMN `enterprise_id`  varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL AFTER `developer_id`;

ALTER TABLE `dp_enterprise_platforms`
MODIFY COLUMN `enterprise_id`  varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL FIRST ;



