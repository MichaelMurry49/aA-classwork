PRAGMA foreign_keys = OFF;
DROP TABLE users;
DROP TABLE questions;
DROP TABLE question_follows;
DROP TABLE replies;
DROP TABLE question_likes;
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
  user_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
  user_id   INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  reply_body TEXT NOT NULL,
  parent_id INTEGER,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (parent_id) REFERENCES replies(id)
);

CREATE TABLE question_likes (
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
  users (fname, lname)
VALUES
  ('Joseph', 'Deng'),
  ('Darrick', 'Yong'),
  ('Vanessa', 'Chen'),
  ('Mike', 'Madsen');

INSERT INTO
  questions (title, body, user_id)
VALUES
  ('Is SQL fun?', 'Do you think SQL is fun?', (SELECT id FROM users WHERE fname = 'Joseph')),
  ('CSS', 'Can you write a website using CSS yet?', (SELECT id FROM users WHERE fname = 'Darrick')),
  ('Best Circle', 'Is my cirlce the best circle?', (SELECT id FROM users WHERE fname = 'Mike')),
  ('Is Ruby fun?', 'Do you think Ruby is fun?', (SELECT id FROM users WHERE fname = 'Joseph'));

INSERT INTO
  replies (question_id, user_id, reply_body, parent_id)
VALUES
(1, 1, 'No', NULL),
(1, 1, 'this is a child reply', 1),
(1, 2, 'another child reply', 1);

INSERT INTO
  question_follows(user_id, question_id)
VALUES
  (1, 1),
  (2, 1),
  (3, 1),
  (2, 2),
  (3, 2),
  (2, 4),
  (1, 4),
  (3, 4);
  