--liquibase formatted sql

--changeset script:2
create table users(
  name varchar(30),
  keys  varchar(10)
)
;