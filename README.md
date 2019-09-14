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

## PSQL Commands

### Getting psql help
You access psql command line with ```psql``` or ```psql -U <username>```.

Then you can get help with the command ```help```

### psql commands cheet sheet !
Postgres psql commands.


```\!``` - clear screen

```\d <TABLE_NAME>``` - Describe table
