use t17;

CALL sp_addColumn('jos_dp_applicationversion', 'mail_notify', 'tinyint(1) DEFAULT false AFTER target_os_version');
CALL sp_addColumn('jos_dp_applicationversion', 'mail_notify_addr', 'varchar(500) DEFAULT "" AFTER mail_notify');

