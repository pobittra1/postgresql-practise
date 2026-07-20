SELECT * FROM "user";

SELECT * FROM post;

-- retrive all posts title with their username
-- in user table don't have any post title and in post table don't have user name so we need to join it
SELECT title, username
FROM post
    INNER JOIN "user" on post.user_id = "user".id;
-- Another methods using name alias
SELECT title, username
FROM post AS p
    INNER JOIN "user" AS u on p.user_id = u.id;