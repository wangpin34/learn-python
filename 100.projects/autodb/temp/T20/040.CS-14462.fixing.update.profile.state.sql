USE T20;

DELETE FROM `jos_dp_state` WHERE 
(state_name = 'New Brunswick' AND country_code = 'US') OR 
(state_name = 'Newfoundland' AND country_code = 'US') OR 
(state_name = 'Northern Mariana' AND country_code = 'US') OR 
(state_name = 'Northwest Territo' AND country_code = 'US') OR 
(state_name = 'Prince Edward Isl' AND country_code = 'US');
