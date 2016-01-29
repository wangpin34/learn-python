USE T20;

CALL sp_addColumn('jos_dp_applicationentry', 'enterpriseid', 'varchar( 55) NOT NULL AFTER `publicapplicationid`');
CALL sp_dropConstraint('jos_dp_applicationentry','UQ_JOS_DP_APPLICATIONENTRY_PUBLICAPPLICATIONID');