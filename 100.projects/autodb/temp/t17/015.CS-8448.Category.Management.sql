USE t17;
ALTER TABLE jos_dp_categories MODIFY COLUMN enterpriseid  varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL;
ALTER IGNORE TABLE jos_dp_categories ADD COLUMN description varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL;
ALTER IGNORE TABLE jos_dp_categories ADD COLUMN icon_url varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL;
ALTER IGNORE TABLE jos_dp_categories ADD COLUMN search_doc_id varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL;
