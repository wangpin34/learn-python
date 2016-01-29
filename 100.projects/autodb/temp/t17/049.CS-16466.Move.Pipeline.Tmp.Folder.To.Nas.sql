USE t17;

# move tmp folder to nas
UPDATE dp_job_workflow_job SET to_path = '/nas-mnt/tmp/trash' WHERE to_path = '/var/tmp/trash';

# update the rsync timeout more longer from 1200 to 20000
UPDATE jos_dp_configuration SET config_value = '20000' WHERE config_key = 'system.akamai.rsync.timeout';
