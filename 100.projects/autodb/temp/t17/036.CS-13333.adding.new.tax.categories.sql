use t17;

INSERT IGNORE INTO jos_dp_tax_categories (id, tax_category, commodity_code) VALUES
(11, "Training Services", "70.280"),
(12, "Data Services", "811120"),
(13, "Other Taxed Service", "03"),
(14, "Utility Apps", "4323.120");

UPDATE jos_dp_tax_categories SET tax_category = "Medical Apps" WHERE id = 3;
UPDATE jos_dp_tax_categories SET tax_category = "Enterprise Apps" WHERE id = 4;
UPDATE jos_dp_tax_categories SET tax_category = "Other Apps" WHERE id = 5;
UPDATE jos_dp_tax_categories SET tax_category = "Streaming Services" WHERE id = 6;
UPDATE jos_dp_tax_categories SET tax_category = "Software Training Services" WHERE id = 11;
