--liquibase formatted sql

--changeset copel:1
create table tiendas(
  id int primary key,
  name varchar(30),
  responsable varchar(30)
)

--changeset copel:2
Alter table tiendas
Add date_add date,name varchar2(30);

--changeset copel:3
insert into tiendas (id, name, responsable, date) values('1', 'Tienda1', 'Responsable1', now);
