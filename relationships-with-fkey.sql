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