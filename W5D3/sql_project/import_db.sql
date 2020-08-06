DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

PRAGMA foreign_keys = ON;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    users_id INTEGER NOT NULL,

    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE question_follows ( 
    users_id INTEGER NOT NULL,
    questions_id INTEGER NOT NULL,
    
    FOREIGN KEY (users_id) REFERENCES users(id),
    FOREIGN KEY (questions_id) REFERENCES questions(id)
);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    body TEXT NOT NULL,
    parent_id INTEGER,
    users_id INTEGER NOT NULL,
    questions_id INTEGER NOT NULL,
    
    FOREIGN KEY (parent_id) REFERENCES replies(id),
    FOREIGN KEY (users_id) REFERENCES users(id),
    FOREIGN KEY (questions_id) REFERENCES questions(id)
);

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    users_id INTEGER NOT NULL,
    questions_id INTEGER NOT NULL,

    FOREIGN KEY (users_id) REFERENCES users(id),
    FOREIGN KEY (questions_id) REFERENCES questions(id)
);

INSERT INTO
    users(fname, lname)
VALUES
    ('Nick', 'Spacebar'),
    ('Jupiter', 'Europa');

INSERT INTO
    questions(title, body, users_id)
VALUES
    ('Uranus?', 'How long has uranus been exposed to sunlight?', 1);

INSERT INTO
    replies(body, parent_id, users_id, questions_id)
VALUES
    ('Way to long!', NULL, 2, 1);
    -- (SELECT
    --     parent_id
    -- FROM
    --     replies),
    -- (SELECT
    --     users_id
    -- FROM
    --     users
    -- WHERE
    --     id = 'Nick'),
    -- (SELECT
    --     questions_id
    -- FROM
    --     questions)
    -- );