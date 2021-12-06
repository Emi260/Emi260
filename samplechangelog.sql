--liquibase formatted sql

--changeset Emiliano:2
Alter table usuarios
Add 
(
date_update date
)