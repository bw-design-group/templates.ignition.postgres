-- liquibase formatted sql
-- changeset kgamble:init-ExampleTable
CREATE TABLE ignition.ExampleTable (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL
);
