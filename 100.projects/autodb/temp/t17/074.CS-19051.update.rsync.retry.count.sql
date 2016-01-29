USE t17;

#CS-19051.update.rsync.retry.count.sql

#update system.akamai.rsync.retries from 7 to 3
UPDATE jos_dp_configuration SET config_value = '3' WHERE config_key = 'system.akamai.rsync.retries';