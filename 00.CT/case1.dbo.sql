--liquibase formatted sql

--changeset Emiliano:1
create table users(
  name varchar(30),
  keys  varchar(10)
)