USE t17;
DROP PROCEDURE IF EXISTS sp_addColumn;
DELIMITER $$
CREATE PROCEDURE sp_addColumn(i_tableName varchar(64),
                                       i_colName varchar(64),
                                       i_colDef varchar(512)
                                       /*
                                       i_colType varchar(50),
                                       i_colLength int,
                                       i_colScale int,
                                       i_colDefault varchar(255)
                                       */ 
                                       )
addCol: begin
    declare colFound int;
    DECLARE scriptMessage varchar(256);
    DECLARE colName varchar(64);
    set colName = i_colName;
    select count(1) into colFound
        from information_schema.COLUMNS
        where table_schema = 't17' and lower(table_name) = lower(i_tableName) and COLUMN_NAME = colName;
    
    if colFound > 0 then
        set scriptMessage = concat('Column \'', i_tableName, '.', colName, '\' already exists, column not added');
        select scriptMessage as 'Add Column Message';        
        leave addCol;
    end if;
    set @sql_text =concat('alter table ', i_tableName,' add column ', colName, ' ', i_colDef);
    prepare stmt from @sql_text;
    EXECUTE stmt;
    deallocate prepare stmt;
    set scriptMessage = concat('Column \'', i_tableName, '.', colName, '\' successfully added');
    select scriptMessage as 'Add Column Message';        
    set @sql_text = '';
    
end;
$$
DELIMITER ;
DROP PROCEDURE IF EXISTS sp_addConstraint;
DELIMITER $$
CREATE PROCEDURE sp_addConstraint(i_tableName varchar(64),
                                                     i_consName varchar(64),
                                                     i_consDef varchar(512),
                                                     i_redefine bool
                                                     )
addCons: begin
    declare consFound int;
    DECLARE scriptMessage varchar(256);
    declare consName varchar(64);
    declare consType varchar(64);
    declare errorCode int default 0;
    set consName = upper(i_consName);
    select count(1) into consFound
        from information_schema.TABLE_CONSTRAINTS
        where constraint_schema = 't17' and constraint_schema = table_schema and
              lower(table_name) = lower(i_tableName) and upper(CONSTRAINT_NAME) = consName;
    if consFound > 0 then
        if i_redefine = 1 then
            call sp_dropConstraint(i_tableName, i_consName);
        else
            set scriptMessage = concat('Constraint \'', i_tableName, '.', consName, '\' already exists, constraint not added');
            select scriptMessage as 'Add Constraint Message';        
            leave addCons;
        end if;
    end if;
    set @sql_text =concat('alter table ', i_tableName,' add constraint ', consName, ' ', i_consDef);
    prepare stmt from @sql_text;
        begin
            declare continue handler for sqlexception, sqlwarning, not found set errorCode = 1; 
            EXECUTE stmt;
        end;
    deallocate prepare stmt;
    if errorCode = 0 then
        set scriptMessage = concat('(+) Constraint \'', i_tableName, '.', consName, '\' successfully added');
    else
        set scriptMessage = concat('(-) Constraint \'', i_tableName, '.', consName, '\' not added');
    end if;
    select scriptMessage as 'Add Constraint Message';        
    
end;
$$
DELIMITER ;
DROP PROCEDURE IF EXISTS sp_dropColumn;
DELIMITER $$
CREATE PROCEDURE sp_dropColumn(i_tableName varchar(64), i_colName varchar(64))
dropCol: begin
    /*
        20080326GN
        ToDo - add handling for dependent objects
    */
    declare colFound int;
    DECLARE scriptMessage varchar(256);
    DECLARE colName varchar(64);
    set colName = upper(i_colName);
    select count(1) into colFound
        from information_schema.COLUMNS
        where table_schema = 't17' and lower(table_name) = lower(i_tableName) and upper(COLUMN_NAME) = colName;
    
    if colFound = 0 then
        set scriptMessage = concat('Cannot drop column \'', i_tableName, '.', colName, '\' - column does not exist');
        select scriptMessage as 'Drop Column Message';        
        leave dropCol;
    end if;
    set @sql_text =concat('alter table ', i_tableName,' drop column ', colName);
    prepare stmt from @sql_text;
    EXECUTE stmt;
    deallocate prepare stmt;
    set scriptMessage = concat('Column \'', i_tableName, '.', colName, '\' successfully dropped');
    select scriptMessage as 'Drop Column Message';        
    set @sql_text = '';
    
end;
$$
DELIMITER ;
DROP PROCEDURE IF EXISTS sp_dropConstraint;
DELIMITER $$
CREATE PROCEDURE sp_dropConstraint(i_tableName varchar(64), i_consName varchar(64))
addCons: begin
    declare consFound int;
    DECLARE scriptMessage varchar(256);
    declare consName varchar(64);
    declare consType varchar(64);
    declare errorCode int default 0;
    
    set consName = upper(i_consName);
    select count(1) into consFound
        from information_schema.TABLE_CONSTRAINTS
        where constraint_schema = 't17' and constraint_schema = table_schema and
              lower(table_name) = lower(i_tableName) and upper(CONSTRAINT_NAME) = consName;
    
    if consFound > 0 then
        /* get type of constraint */
        select lower(CONSTRAINT_TYPE) into consType
            from information_schema.TABLE_CONSTRAINTS
                where constraint_schema = 't17' and constraint_schema = table_schema and
                      lower(table_name) = lower(i_tableName) and upper(CONSTRAINT_NAME) = consName;
        /* build drop stmt based on constraint type */
        if lower(consType) = 'unique' then
            set @sql_text =concat('alter table ', i_tableName,' drop key ', consName);
        end if;
        if lower(consType) = 'foreign key' then
            set @sql_text =concat('alter table ', i_tableName,' drop foreign key ', consName);
        end if;
        /*
        select @sql_text;
        */
        prepare stmt from @sql_text;
        begin
            declare continue handler for sqlexception, sqlwarning, not found set errorCode = 1; 
            EXECUTE stmt;
        end;
        deallocate prepare stmt;
        if errorCode = 1 then
            set scriptMessage = concat('(-) ',consType, ' constraint \'', i_tableName, '.', consName, '\' not dropped (1)');
        else
            set scriptMessage = concat('(+) ',consType, ' constraint \'', i_tableName, '.', consName, '\' dropped (1)');
        end if;
        set errorCode = 0;
        select scriptMessage as 'Drop Constraint Message';        
        /* drop the index associated with the key */
        if lower(consType) = 'foreign key' then
            call sp_dropIndex(i_tableName, i_consName);
        end if;
    else
        set scriptMessage = concat('Constraint \'', i_tableName, '.', consName, '\' not found');
        select scriptMessage as 'Drop Constraint Message';        
    end if;
    set @sql_text = '';
end;
$$
DELIMITER ;
CALL sp_addColumn('jos_dp_applicationentry', 'account_id', 'varchar(128) NOT NULL default \'\'');