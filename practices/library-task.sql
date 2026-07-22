-- Active: 1784391000223@@localhost@5432@library
-- create books table
CREATE TABLE books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(50),
    price NUMERIC(6, 2)
);
-- insert books data
INSERT INTO
    books (title, author, price)
VALUES (
        'SQL Basics',
        'John Smith',
        30.00
    ),
    (
        'Advanced PostgreSQL',
        'Alice Johnson',
        55.00
    ),
    (
        'Learn Python',
        'Rahim Uddin',
        40.00
    ),
    (
        'Data Structures',
        'David Lee',
        60.00
    ),
    (
        'Web Development',
        'Sara Khan',
        45.00
    );