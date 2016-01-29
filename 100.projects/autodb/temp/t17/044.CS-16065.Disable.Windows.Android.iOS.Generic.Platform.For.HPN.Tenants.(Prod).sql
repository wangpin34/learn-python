USE t17;

# Disable Windows,Android,iOS,Generic platform for hpn enterprise on prod. 
DELETE FROM dp_enterprise_platforms WHERE enterprise_id='3bd4a946-2244-11e3-9c3f-1cc1de6f6c7e' AND platform_id=2;
DELETE FROM dp_enterprise_platforms WHERE enterprise_id='3bd4a946-2244-11e3-9c3f-1cc1de6f6c7e' AND platform_id=6;
DELETE FROM dp_enterprise_platforms WHERE enterprise_id='3bd4a946-2244-11e3-9c3f-1cc1de6f6c7e' AND platform_id=7;
DELETE FROM dp_enterprise_platforms WHERE enterprise_id='3bd4a946-2244-11e3-9c3f-1cc1de6f6c7e' AND platform_id=9;