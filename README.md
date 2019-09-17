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
ALTER TABLE table_name RENAME COLUMN nombre_actual TO nombre_nuevo
```

- Working with Foreign keys
```sql
ALTER TABLE table_name DROP CONSTRAINT nombre_foreign_key_fkey
ALTER TABLE table_name ADD FOREIGN KEY(field) REFERENCES table_name_2(field)
```

## PSQL Commands

### Getting psql help
You access psql command line with ```psql``` or ```psql -U <username>```.

Then you can get help with the command ```help```

### psql commands cheet sheet !
Postgres psql commands.

```\!``` - clear screen

```\d <TABLE_NAME>``` - Describe table

```\dt``` - Show tables 

### Backing up database

Sample command: ```console >pg_dump -U db_username -W -F t database_name > c:\backup_file.tar ```

Other sample:

```console
timestamp=$(date +%Y%m%d)
pg_dump -U $dbuser $dbname -W -F p -f ${timestamp}_${dbname}.sql
```

Lets understand the options:

- -U db_username: User to connect to PostgreSQL database server.
- -W:  forces pg_dump to prompt for the password before connecting to server. 
- -F : Specifies the output file format that can be one of the following:
  - c: custom-format archive file format
  - d: directory-format archive
  - t:tar
  - p: plain text SQL script file).

### Restoring database
Restore database from plaintext file...

```psql -U db_name < backup.sql``` 
