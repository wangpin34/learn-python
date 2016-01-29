USE T20;

#CS-18065:SDN App meta data support
INSERT IGNORE INTO `jos_dp_app_properties_types` (`id`, `property_key`, `property_key_desc`) 
VALUES
(NULL, 'applicationWebPage', 'SDN Application Web Page'),  
(NULL, 'solutionBrief', 'SDN Solution Brief'), 
(NULL, 'releaseNotes', 'SDN Release Notes'),
(NULL, 'documentation', 'SDN Documentation'),
(NULL, 'customUrls0', 'customUrls0'), 
(NULL, 'customUrls1', 'customUrls1'), 
(NULL, 'customUrls2', 'customUrls2'), 
(NULL, 'customUrls3', 'customUrls3'), 
(NULL, 'customUrls4', 'customUrls4');
