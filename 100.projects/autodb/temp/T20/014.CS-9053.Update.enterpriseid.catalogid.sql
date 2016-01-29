USE T20;

# phoenix
DELETE FROM dp_enterprise_catalog where enterprise_id = '6b823957-8d2c-11e2-b629-0800278eb971';
# phoenix
INSERT IGNORE INTO dp_enterprise_catalog (enterprise_id, catalog_id) VALUES ('6b823957-8d2c-11e2-b629-0800278eb971','7d047abcc052475db3a8e4368b104d10');
