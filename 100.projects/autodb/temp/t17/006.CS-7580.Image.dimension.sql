USE t17;

INSERT IGNORE INTO dp_app_image_dimensions (dimension_id, width, height)
VALUES
    (2,480,320);

INSERT IGNORE INTO dp_device_type_app_image_requirements (device_family_type_id, image_dimension_id, is_enabled)
VALUES
    (1000,2,1),
    (1300,2,1),
    (1400,2,1);

INSERT IGNORE INTO dp_app_image_scaling (id, image_dimension_id, scale_image_dimension_id, scale_image_size, is_enabled)
VALUES
    (2,2,2,0,1);