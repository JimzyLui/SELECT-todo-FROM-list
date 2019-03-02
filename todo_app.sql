
DROP DATABASE IF EXISTS todo_app;
DROP USER IF EXISTS michael;
CREATE USER michael WITH PASSWORD stonebreaker;
CREATE DATABASE todo_app;
-- psql todo_app newuser;
\c todo_app;
CREATE TABLE IF NOT EXISTS tasks (
  id SERIAL,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  created_at timestamp NOT NULL DEFAULT now(),
  updated_at timestamp,
  completed boolean NOT NULL DEFAULT false,
  PRIMARY KEY(id)
);
ALTER TABLE tasks DROP COLUMN completed;
ALTER TABLE tasks ADD COLUMN completed_at timestamp DEFAULT NULL;
ALTER TABLE tasks ALTER COLUMN updated_at NOT NULL DEFAULT now();
Insert into tasks(title, description) VALUES('Study SQL', 'Complete this exercise');
Insert into tasks(title, description) VALUES('Study PostgreSQL', 'Read all the documentation');
SELECT title FROM tasks WHERE completed_at IS NULL;
UPDATE tasks SET completed_at = now() WHERE title = 'Study SQL';

SELECT title, description FROM tasks WHERE completed_at IS NULL;
SELECT * FROM tasks order by created_at DESC;


Insert into tasks(title, description) VALUES('mistake 1', 'a test entry');
Insert into tasks(title, description) VALUES('mistake 2', 'another test entry');
Insert into tasks(title, description) VALUES('third mistake', 'another test entry');
SELECT title, description FROM tasks WHERE title like '%mistake%';
DELETE FROM tasks where title like '%mistake%';
SELECT * FROM tasks ORDER BY title;






