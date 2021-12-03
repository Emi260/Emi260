--liquibase formatted sql

--changeset Emiliano:1
create table users(
  id int primary key,
  name varchar2(30),
  keys  varchar2(10)
)

--changeset Emiliano:2
Alter table users
Add (
date_add date,
name varchar2(30)
)

--changeset Emiliano:3
Alter table usuarios
Add 
(
date_update date
)