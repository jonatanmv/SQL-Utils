# SQL Utils
Summary of commands for working with SQL statements.

## SQL Commands
SQL commands for querys. Reference: https://www.w3schools.com/sql/

### Lets SELECT !
Some samples when you need to list objects from database:

```sql
select id,name,surname from author order by created_timestamp desc limit 5;
```

### Lets UPDATE !

```sql
update author set name='Franklin' where id=861;
```

### Lets DELETE !

```sql
delete from author where id='57';
```
### Lets ALTER TABLE !
- Editing table structure
```sql
ALTER TABLE table_name ADD COLUMN field BOOLEAN DEFAULT true
ALTER TABLE table_name ALTER COLUMN field DROP NOT NULL
ALTER TABLE table_name ALTER COLUMN field SET NOT NULL
ALTER TABLE table_name ALTER COLUMN field TYPE smallint
ALTER TABLE table_name ALTER COLUMN field DROP default
ALTER TABLE table_name ALTER COLUMN field SET DEFAULT 10
ALTER TABLE table_name DROP COLUMN field
ALTER TABLE table_name RENAME COLUMN old_name TO new_name
ALTER TABLE table_name DROP CONSTRAINT constraint_name
```

- Working with Foreign keys
```sql
ALTER TABLE table_name DROP CONSTRAINT nombre_foreign_key_fkey
ALTER TABLE table_name ADD FOREIGN KEY(field) REFERENCES table_name_2(field)
```

### Lets Copy a Table !
With data:
```sql
CREATE TABLE new_table AS
TABLE existing_table;
```
With no data:
```sql
CREATE TABLE new_table
AS TABLE existing_table WITH NO DATA;
```
With some of the data:
```sql
CREATE TABLE new_table AS 
SELECT * FROM existing_table WHERE condition;
```

## PSQL Commands

### Databases size on disk
Easy ! just do this:

```console
select datname AS db_name,
       pg_size_pretty(pg_database_size(datname)) as db_size
from pg_database 
order by pg_database_size(datname) desc;
```
### Tables disk usage
```console
SELECT 
       relname AS "table_name", 
       pg_size_pretty(pg_table_size(C.oid)) AS "table_size" 
FROM 
       pg_class C 
LEFT JOIN pg_namespace N ON (N.oid = C.relnamespace) 
WHERE nspname NOT IN ('pg_catalog', 'information_schema') AND nspname !~ '^pg_toast' AND relkind IN ('r') 
ORDER BY pg_table_size(C.oid) 
DESC LIMIT 1;
```

### Death rows
```console
select relname, n_dead_tup from pg_stat_user_tables;
```

### Last Vacuum
```console
SELECT relname, last_vacuum, last_autovacuum FROM pg_stat_user_tables;
```

### Getting psql help
You access psql command line with ```psql``` or ```psql -U <username>```.

Then you can get help with the command ```help```

### psql commands cheet sheet !
Postgres psql commands.

```\!``` - clear screen

```\d <TABLE_NAME>``` - Describe table

```\dt``` - Show tables 

```\list``` - List databases

### Backing up database

Sample command: ```console >pg_dump -U db_username -W -F t database_name > c:\backup_file.tar ```

Other sample:

```console
timestamp=$(date +%Y%m%d)
pg_dump -U $dbuser $dbname -W -F p -f ${timestamp}_${dbname}.sql
```

Lets understand the options:

- -U db_username: (--username) User to connect to PostgreSQL database server.
- -W:  forces pg_dump to prompt for the password before connecting to server. 
- --format : Specifies the output file format that can be one of the following:
  - --format=c: custom-format archive file format
  - --format=d: directory-format archive
  - --format=t:tar
  - --format=p: plain text SQL script file).
- -f: (--file) The file where to save the backup

### Restoring database
Restore database from plaintext file...

```psql -U db_name < backup.sql``` 
