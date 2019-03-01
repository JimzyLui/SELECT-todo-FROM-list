
DROP DATABASE IF EXISTS todo_app;
DROP USER IF EXISTS michael;
CREATE USER michael WITH PASSWORD stonebreaker;
CREATE DATABASE todo_app;
psql todo_app newuser;
\c todo_app;
CREATE TABLE IF NOT EXISTS tasks (
  id serial,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  created_at timestamp NOT NULL DEFAULT now(),
  updated_at timestamp,
  completed boolean NOT NULL DEFAULT false,
  PRIMARY KEY(id)
);
ALTER TABLE tasks 
DROP COLUMN completed;
ALTER TABLE tasks 
ADD COLUMN completed_at timestamp DEFAULT NULL;
ALTER TABLE tasks
ALTER COLUMN updated_at NOT NULL 





