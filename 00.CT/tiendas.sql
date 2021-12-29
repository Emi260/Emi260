--liquibase formatted sql

--changeset copel:1
create table tiendas(
  id int primary key,
  name varchar(30),
  responsable varchar(30)
)
