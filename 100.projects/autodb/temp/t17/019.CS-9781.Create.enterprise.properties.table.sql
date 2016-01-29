USE t17;

CREATE TABLE IF NOT EXISTS `dp_enterprise_properties` (
  `enterprise_id` varchar(255) NOT NULL,
  `property_type` varchar(255) NOT NULL,
  `property_value` varchar(255) NOT NULL,
  KEY `ENTERPRISE_PROPERTIES_ENTERPRISE_ID_IDX` (`enterprise_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Enterprise properties';