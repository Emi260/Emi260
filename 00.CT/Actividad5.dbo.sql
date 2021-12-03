-- liquibase formatted sql

-- changeset bob:4
CREATE TABLE happyNewTable (

id int IDENTITY PRIMARY KEY,

firstname VARCHAR(255),

lastname VARCHAR(255)

);