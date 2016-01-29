USE T20;

# CS-19985 Add versionname as version display name
ALTER TABLE  `jos_dp_applicationversion` ADD  `versionname` VARCHAR( 128 ) NOT NULL DEFAULT  '' AFTER  `VERSION`