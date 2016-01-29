USE T20;

# CS-19560: Update iOS support devices to only : 'iPhone', 'iPad' and 'iOS Universal'.

# Update the family name to 'iOS Universal'
UPDATE jos_dp_device_model_family_group SET group_label = "iOS Universal" WHERE device_model_family_group_id= 1404;
UPDATE jos_dp_device_model_family SET family_name = "iOS Universal" WHERE device_model_family_id= 1432;