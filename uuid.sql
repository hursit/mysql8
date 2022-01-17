#1 drop table
DROP TABLE IF EXISTS `users`

#2 create table
CREATE TABLE `users` (
   uid BINARY(16) not null default (UUID_TO_BIN(UUID())) primary key ,
   username varchar(255) default null,
   email varchar(255)
);

#3 insert datas
insert into users(username, email) values("adem", "adem.aydin@enuygun.com");
insert into users(username, email) values("erkan", "erkan.ozsoy@enuygun.com");
insert into users(username, email) values("furkan", "furkan.aydin@enuygun.com");

#4 select datas
select bin_to_uuid(uid), uid, username from users
