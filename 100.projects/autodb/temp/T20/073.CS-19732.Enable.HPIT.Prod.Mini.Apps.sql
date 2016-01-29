USE T20;
# CS-19732 [PROD][MP3][HPA]: Enable "Mini App" Support for the HPA Enterprise
# Bind Mini Apps platform to hpit tenant on Prod
INSERT IGNORE INTO `dp_enterprise_platforms` (`enterprise_id`, `platform_id`) VALUES 
('88fc7b87-85aa-11e4-82d0-d8d385e16fb6', '8');