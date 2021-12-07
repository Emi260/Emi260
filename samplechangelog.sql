--liquibase formatted sql

--changeset poc:1
create table users(
  name varchar(30),
  keys  varchar(10)
)
;
-- rollback drop table users