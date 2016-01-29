USE t17;
# CS-20118: Add the catalog id for 'hp' tenant
# hp
DELETE FROM dp_enterprise_catalog where enterprise_id = '41e585b7-dd4c-11e2-a3c8-e4115b4c35df';
# hp
INSERT IGNORE INTO dp_enterprise_catalog (enterprise_id, catalog_id) VALUES ('41e585b7-dd4c-11e2-a3c8-e4115b4c35df','41e585b7-dd4c-11e2-a3c8-e4115b4c35df');
