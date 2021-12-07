--liquibase formatted sql

--changeset poc:3
Alter table usuarios
Add date_update date
