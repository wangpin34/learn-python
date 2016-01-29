USE t17;

# Dump of table dp_enterprise_platforms - phoenix enterprise
# ------------------------------------------------------------
INSERT IGNORE INTO dp_enterprise_platforms (enterprise_id, platform_id)
VALUES
('6b823957-8d2c-11e2-b629-0800278eb971',2),
('6b823957-8d2c-11e2-b629-0800278eb971',6),
('6b823957-8d2c-11e2-b629-0800278eb971',7);

# Dump of table dp_enterprise_platforms - gf enterprise
# ------------------------------------------------------------
INSERT IGNORE INTO dp_enterprise_platforms (enterprise_id, platform_id)
VALUES
('efbfbdef-bfbd-78ef-bfbd-4e4211efbfbd',2),
('efbfbdef-bfbd-78ef-bfbd-4e4211efbfbd',6),
('efbfbdef-bfbd-78ef-bfbd-4e4211efbfbd',7);

# Dump of table dp_enterprise_platforms - PUBLIC
# ------------------------------------------------------------
INSERT IGNORE INTO dp_enterprise_platforms (enterprise_id, platform_id)
VALUES
('a041c256-c827-11e2-9d22-12313d2f3409',2),
('a041c256-c827-11e2-9d22-12313d2f3409',6),
('a041c256-c827-11e2-9d22-12313d2f3409',7);

# Dump of table dp_enterprise_platforms - ACME
# ------------------------------------------------------------
INSERT IGNORE INTO dp_enterprise_platforms (enterprise_id, platform_id)
VALUES
('29225db7-c821-11e2-9d22-12313d2f3409',2),
('29225db7-c821-11e2-9d22-12313d2f3409',6),
('29225db7-c821-11e2-9d22-12313d2f3409',7);

UPDATE `jos_dp_configuration` Set `config_value` = false where `config_key` = 'user.filtering.enabled';