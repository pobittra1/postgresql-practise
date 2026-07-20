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

-- Deletion integrity------------

-- can't delete cause get error for fkey deletion default integrity
DELETE FROM "user" WHERE id = 10;

/*
-- ---------------From gpt for note------------------------
-- ===== FK DELETE BEHAVIOR (ALL 4 WITH CREATE) =====

-- ==============================
-- 1. ON DELETE RESTRICT (default)
-- ==============================
-- Cannot delete parent if child exists

CREATE TABLE "user" (
id SERIAL PRIMARY KEY,
username TEXT
);

CREATE TABLE post_restrict (
id SERIAL PRIMARY KEY,
title TEXT,
user_id INTEGER REFERENCES "user"(id) ON DELETE RESTRICT
);

-- Example:
-- DELETE FROM "user" WHERE id = 1;
-- ❌ ERROR if any row in post_restrict has user_id = 1

-- ==============================
-- 2. ON DELETE CASCADE
-- ==============================
-- Delete parent → child rows auto deleted

CREATE TABLE post_cascade (
id SERIAL PRIMARY KEY,
title TEXT,
user_id INTEGER REFERENCES "user"(id) ON DELETE CASCADE
);

-- Example:
-- DELETE FROM "user" WHERE id = 2;
-- → all related rows in post_cascade also deleted

-- ==============================
-- 3. ON DELETE SET NULL
-- ==============================
-- Delete parent → child foreign key becomes NULL

CREATE TABLE post_null (
id SERIAL PRIMARY KEY,
title TEXT,
user_id INTEGER REFERENCES "user"(id) ON DELETE SET NULL
);

-- ⚠️ column must allow NULL

-- Example:
-- DELETE FROM "user" WHERE id = 3;
-- → post_null.user_id = NULL

-- ==============================
-- 4. ON DELETE SET DEFAULT
-- ==============================
-- Delete parent → child foreign key becomes default value

CREATE TABLE post_default (
id SERIAL PRIMARY KEY,
title TEXT,
user_id INTEGER DEFAULT 0
REFERENCES "user"(id) ON DELETE SET DEFAULT
);

-- ⚠️ default value must exist in parent table

-- setup default user
INSERT INTO "user"(id, username) VALUES (0, 'default_user');

-- Example:
-- DELETE FROM "user" WHERE id = 4;
-- → post_default.user_id = 0

-- ===== SUMMARY =====
-- RESTRICT     → block delete
-- CASCADE      → delete child rows
-- SET NULL     → set NULL
-- SET DEFAULT  → set default value

-- ===== END =====
*/