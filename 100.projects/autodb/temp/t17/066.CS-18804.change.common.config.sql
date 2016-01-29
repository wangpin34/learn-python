/*
this script is for portal db in cloud 2.0
*/

use t17;
select * from jos_dp_configuration where config_key="apps.public.assets.base.url";
update jos_dp_configuration set config_value = REPLACE(config_value,'palm.com','hpsvcs.com') where config_key="apps.public.assets.base.url";

