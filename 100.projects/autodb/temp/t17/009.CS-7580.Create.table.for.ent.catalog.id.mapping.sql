USE t17;

# Dump of table dp_enterprise_developers
# ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS dp_enterprise_catalog (
  catalog_id varchar(255) NOT NULL,
  enterprise_id varchar(255) NOT NULL,
  UNIQUE KEY UQ_ENTERPRISE_CALATOGID (enterprise_id,catalog_id),
  KEY ENTERPRISE_CATALOG_ENTERPRISE_ID_IDX (enterprise_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise Catalog ID mapping';


# GF
INSERT IGNORE INTO dp_enterprise_catalog (enterprise_id, catalog_id) VALUES ('efbfbdef-bfbd-78ef-bfbd-4e4211efbfbd','');
# phoenix
INSERT IGNORE INTO dp_enterprise_catalog (enterprise_id, catalog_id) VALUES ('6b823957-8d2c-11e2-b629-0800278eb971','b8c0730312364cd19b75ed6b062e5ed3');
# acme
INSERT IGNORE INTO dp_enterprise_catalog (enterprise_id, catalog_id) VALUES ('29225db7-c821-11e2-9d22-12313d2f3409','b0b9fe7e6c874b1b9b857564ff661f4e');
# public
INSERT IGNORE INTO dp_enterprise_catalog (enterprise_id, catalog_id) VALUES ('a041c256-c827-11e2-9d22-12313d2f3409','');