USE t17;

# CS-18893:add JRE1.7+ path to configuration

INSERT IGNORE INTO `jos_dp_configuration` (`config_key`, `config_value`, `config_comment`, `config_env_specific`) 
VALUES ('system.java7.path', '/usr/java/jre7/bin/java', 'Java path of JRE7', '0');
