-- CREATE TABLESPACE fastspace OWNER postgres LOCATION 'C:/Users/tamerlan_zhabassov/Documents/postgres';

SELECT 'tablespace total, MB' as size_name, CAST(pg_tablespace_size('pg_default')/1024/1024 as int) as size, 0 as relative_size
UNION
SELECT  'tablespace available, MB' as size_name, CAST(pg_tablespace_size('pg_default')/1024/1024-pg_database_size ('nhl')/1024/1024 as int) as size, 0 as relative_size
UNION
SELECT  'used, %' as size_name, null as size, (((pg_database_size ('nhl')*100)/pg_tablespace_size('pg_default'))) as relative_size;


