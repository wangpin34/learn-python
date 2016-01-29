USE T20;

# CS-20741: Update legacy item version name as VERSION

UPDATE `jos_dp_applicationversion` SET `versionname`=`VERSION` WHERE (`versionname` IS NULL OR `versionname`='');