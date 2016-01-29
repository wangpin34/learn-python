USE T20;

#070.CS-18836.update.rsync.retry.count.sql

#update system.akamai.rsync.retries from 3 to 7
UPDATE jos_dp_configuration SET config_value = '7' WHERE config_key = 'system.akamai.rsync.retries';