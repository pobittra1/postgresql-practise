-- Active: 1784391000223@@localhost@5432@postgres
SELECT * FROM "user";

SELECT * FROM post;

-- retrive all posts title with their username
-- INNER JOIN
-- in user table don't have any post title and in post table don't have user name so we need to join it
SELECT title, username
FROM post
    INNER JOIN "user" on post.user_id = "user".id;
-- Another methods using name alias
SELECT title, username
FROM post AS p
    INNER JOIN "user" AS u on p.user_id = u.id;

-- INSERT NULL value for post.user_id of post table
-- at first drop the not null constraint then insert null value.
ALTER TABLE post ALTER COLUMN user_id DROP NOT NULL;

INSERT INTO
    post (id, title, user_id)
VALUES (
        21,
        'this is the test post',
        NULL
    );

-- LEFT OUTER JOIN
SELECT title, username
FROM post AS p
    LEFT OUTER JOIN "user" AS u on p.user_id = u.id;
-- RIGHT OUTER JOIN
SELECT title, username
FROM post AS p
    RIGHT OUTER JOIN "user" AS u on p.user_id = u.id;

-- FULL OUTER JOIN
SELECT title, username
FROM post AS p
    FULL OUTER JOIN "user" AS u on p.user_id = u.id;

/*
-- ---------------From gpt for note----------------------------
-- SQL JOIN NOTES (PostgreSQL)
-- File: joins.sql

-- JOIN = combine data from multiple tables based on related column

---

## -- 1. INNER JOIN

-- Returns only matching rows from both tables

SELECT users.id, users.name, posts.title
FROM users
INNER JOIN posts ON users.id = posts.user_id;

-- Result:
-- Only users who have posts
-- Users without posts are excluded

---

## -- 2. LEFT JOIN (LEFT OUTER JOIN)

-- Returns all rows from left table + matched rows from right table

SELECT users.name, posts.title
FROM users
LEFT JOIN posts ON users.id = posts.user_id;

-- Result:
-- All users will appear
-- If post exists → title shown
-- If no post → NULL

---

## -- 3. RIGHT JOIN (RIGHT OUTER JOIN)

-- Returns all rows from right table + matched rows from left table

SELECT users.name, posts.title
FROM users
RIGHT JOIN posts ON users.id = posts.user_id;

-- Result:
-- All posts will appear
-- If user exists → name shown
-- If no user → NULL

---

## -- 4. FULL JOIN (FULL OUTER JOIN)

-- Returns all rows from both tables (matched + unmatched)

SELECT users.name, posts.title
FROM users
FULL JOIN posts ON users.id = posts.user_id;

-- Result:
-- All users and all posts
-- Matched rows are combined
-- Unmatched rows show NULL

---

## -- QUICK SUMMARY

-- INNER JOIN  → only matched rows
-- LEFT JOIN   → all left + matched right
-- RIGHT JOIN  → all right + matched left
-- FULL JOIN   → all rows from both tables

---

## -- RELATION EXAMPLE

-- users (id, name)
-- posts (id, title, user_id)
-- user_id is a foreign key
---------------------------
*/