-- Sample of SQL commands
select id,name,surname from author order by created_timestamp desc limit 5;
update author set name='Franklin' where id=861;
delete from author where id='57';
