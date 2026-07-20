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