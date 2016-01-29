USE T20;

CREATE TABLE `dp_recurring_ref` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `property_name` varchar(255) DEFAULT NULL,
  `comments` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index2` (`property_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='purchase option properties values table';

INSERT INTO `dp_recurring_ref` (`property_name`) 
	VALUES ('enabled'),
			('type'),
			('SKU'),
			('price'),
			('priceIncludesVAT'),
			('isPerishable'),
			('vendorId'),
			('commodityCode'),
			('country_id'),
			('country_name'),
			('country_currency'),
			('recurringTemplateId'),
			('recurringDetail_recurring'),
			('recurringDetail_recurringUnit'),
			('recurringDetail_duration'),
			('recurringDetail_durationUnit'),
			('recurringDetail_gracePeriod'),
			('recurringDetail_gracePeriodUnit'),
			('description');

CREATE TABLE `dp_recurring_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `appcountry_info_id` int(10) unsigned DEFAULT NULL,
  `property_name` varchar(255) DEFAULT NULL,
  `property_value` varchar(255) DEFAULT NULL,
  `SKU` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `appcountry_info_id` (`appcountry_info_id`),
  KEY `property_name` (`property_name`),
  CONSTRAINT `dp_recurring_details_ibfk_1` FOREIGN KEY (`appcountry_info_id`) REFERENCES `jos_dp_appcountry_info` (`id`),
  CONSTRAINT `dp_recurring_details_ibfk_2` FOREIGN KEY (`property_name`) REFERENCES `dp_recurring_ref` (`property_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='purchase option propertie lookup table';