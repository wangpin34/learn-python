USE T20;

# Update the cdn to be dev since dev bucket is used
# ------------------------------------------------------------
UPDATE `jos_dp_configuration` Set `config_value` = "http://cdn.downloads.dev.palm.com/public" where `config_key` = 'apps.public.assets.base.url';
