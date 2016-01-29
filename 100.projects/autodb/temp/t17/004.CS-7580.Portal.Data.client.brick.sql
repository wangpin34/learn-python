USE t17;

# Dump of table jos_dp_configuration
# ------------------------------------------------------------
INSERT IGNORE INTO `jos_dp_configuration` (`config_key`, `config_value`, `config_comment`, `config_env_specific`) VALUES
('clam.av.active.dat', 'clam.av.dat.20120128.234944.tar.gz', 'clam av file' ,1),
('services.appsubmission.url', 'http://bm-a675002-1634534295.us-east-1.elb.amazonaws.com/appsubmission/2.0', '' ,1),
('scanner.client.brick.id', 'ec2-184-73-47-125.compute-1.amazonaws.com', 'the id of registered Clam Antivirus Scanning client brick' ,1),
('scanner.client.brick.key','O:37:"Palm_AppPipeline_Client_Brick_KeyInfo":2:{s:5:"keyId";s:1:"1";s:9:"publicKey";s:272:"-----BEGIN PUBLIC KEY-----MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCydTKCTEFzGr7kilpr9mEeXHRQdyudu+GeIPPojpY7nctRtRZTYQ9QP6FJH57AyHGyZppClcjXbzbKrxZFyf+WdchZjeRKygsFGdYG0D2VAGU3z4ta+HP6+o3jfZI02x1xxaqbs6hV4Fkob3NQKUlEuYj7Dk36ZNO5jUSzUGlzSQIDAQAB-----END PUBLIC KEY-----";}', 'the serialized key for the registered Clam Antivirus Scanning client brick' ,1);

