-- creata table for post users

-- create user table for post using id and username
CREATE TABLE "user" (
    id SERIAL PRIMARY KEY,
    username VARCHAR(25) NOT NULL
);

-- create post table and set user id as foreign key
CREATE TABLE post (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    user_id INTEGER REFERENCES "user" (id)
);

-- Insert users
INSERT INTO
    "user" (username)
VALUES ('john_doe'),
    ('emma_wilson'),
    ('liam_smith'),
    ('olivia_brown'),
    ('noah_johnson'),
    ('ava_davis'),
    ('william_miller'),
    ('sophia_moore'),
    ('james_taylor'),
    ('isabella_anderson');
-- Insert posts (random + repeated user_id)
INSERT INTO
    post (title, user_id)
VALUES ('Intro to SQL', 5),
    ('Mastering PostgreSQL', 2),
    ('React Basics Guide', 5), -- repeat
    ('Node.js Backend Setup', 1),
    (
        'Database Optimization Tips',
        10
    ),
    (
        'JavaScript Best Practices',
        3
    ),
    ('Working with REST APIs', 2), -- repeat
    (
        'Frontend Development Path',
        4
    ),
    ('Clean Code Principles', 9),
    (
        'Fullstack Development Guide',
        6
    );

SELECT * FROM "user";

SELECT * FROM post;

-- when try to set in post fkey to NULL it works
INSERT INTO post (title, user_id) VALUES ('null test purpose', NULL);
-- so set NOT NULL, at first remove the null row then set
DELETE FROM post
WHERE
    id = (
        SELECT id
        FROM post
        ORDER BY id DESC
        LIMIT 1
    );

ALTER TABLE post ALTER COLUMN user_id SET NOT NULL;
/*
-- ------------------------------from gpt for note------------------------
-- ===== FOREIGN KEY INTEGRITY =====

-- 1. Referential Integrity
-- Child table (post.user_id) must match parent table ("user".id)
-- Cannot insert invalid foreign key

-- ❌ ERROR
INSERT INTO post (title, user_id) VALUES ('Test Post', 999);

-- 2. Prevent Orphan Records
-- Cannot delete parent row if child rows exist (default behavior)

-- ❌ ERROR if posts exist with user_id = 1
DELETE FROM "user" WHERE id = 1;

-- 3. ON DELETE CASCADE
-- When parent is deleted, related child rows are also deleted automatically

-- Example:
-- delete user → all related posts also deleted

-- 4. ON DELETE SET NULL
-- When parent is deleted, foreign key in child becomes NULL

-- Example:
-- delete user → post.user_id becomes NULL

-- 5. ON UPDATE CASCADE
-- If parent primary key changes, child foreign keys update automatically

-- ===== SUMMARY =====
-- ✔ Blocks invalid references
-- ✔ Maintains data consistency
-- ✔ Keeps relationships valid
-- ✔ Prevents orphan records

-- ===== END =====
*/