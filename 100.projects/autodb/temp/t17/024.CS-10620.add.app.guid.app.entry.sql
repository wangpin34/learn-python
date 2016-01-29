USE t17;

CALL sp_addColumn('jos_dp_applicationentry', 'packageId', 'varchar(55) NOT NULL AFTER `publicapplicationid`');
CALL sp_addConstraint('jos_dp_applicationentry', 'UNIQUE UQ_JOS_DP_APPLICATIONENTRY_PUBLICAPPLICATIONID', '(publicapplicationid)', 1);
CALL sp_dropColumn('jos_dp_applicationentry','enterpriseid');
UPDATE jos_dp_applicationentry ae SET ae.packageId=ae.publicapplicationid WHERE ae.packageId="";
