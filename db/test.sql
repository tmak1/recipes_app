CREATE DATABASE testerDB;

CREATE TABLE tester (
    id SERIAL PRIMARY KEY,
    tod TEXT DEFAULT 'user',
    name VARCHAR(500),
    list TEXT[],
    created_at timestamptz DEFAULT now()
);

set timezone to 'Australia/Melbourne';

INSERT INTO tester (name, list) 
VALUES ('cakest', '{"salt:2 tablespoon", "sugar:5 tablespoon", "chilli:3 tablespoon"}');
INSERT INTO tester (name, list) 
VALUES ('pudding', '{"salt:21 tablespoon", "sugar:51 tablespoon", "chilli:10 tablespoon"}');
INSERT INTO tester (name, list) 
VALUES ('ravioli', '{"salt:1 tablespoon", "sugar:2 tablespoon", "chilli:1 tablespoon"}');



