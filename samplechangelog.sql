--liquibase formatted sql

--changeset Emiliano:2
Alter table users
Add date_add date, name varchar(30)