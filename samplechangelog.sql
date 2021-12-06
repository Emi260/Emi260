--liquibase formatted sql

--changeset script:3
create table users(
  name varchar(30),
  keys  varchar(10)
)
;
-- rollback drop table users