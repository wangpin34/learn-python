USE T20;

UPDATE `dp_app_image_icon_dimension` SET `max_size` = '512', `min_size` = '32' WHERE `app_icon_dimension_id` = 1 AND `icon_type` = 1;
UPDATE `dp_app_image_icon_dimension` SET `max_size` = '512' WHERE `app_icon_dimension_id` = 2 AND `icon_type` = 2;