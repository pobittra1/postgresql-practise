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

-- create borrows
CREATE TABLE borrowers (
    borrower_id SERIAL PRIMARY KEY,
    borrower_name VARCHAR(50),
    book_id INT REFERENCES books (book_id),
    borrow_date DATE
);
-- insert borrows
INSERT INTO
    borrowers (
        borrower_name,
        book_id,
        borrow_date
    )
VALUES ('Arif Hasan', 1, '2024-01-10'),
    ('Mita Roy', 2, '2024-02-15'),
    (
        'Tanvir Ahmed',
        1,
        '2024-03-01'
    ),
    (
        'Nusrat Jahan',
        3,
        '2024-03-10'
    ),
    ('Siam Ahmed', 4, '2024-04-05'),
    ('Arif Hasan', 2, '2024-05-01');

-- see books
SELECT * FROM books;
-- see borrows
SELECT * FROM borrowers;

-- Task 1.Show all books name + price
SELECT title AS "books", price FROM books;
-- Task 2.Find books where price > 40
SELECT * FROM books WHERE books.price > 40;
-- Task 3.Count total books
SELECT COUNT(*) AS "total_books" FROM books;
-- Task 4.Show all borrowers name
SELECT borrower_name AS borrowers_name FROM borrowers;

-- ------Medium Task----------
-- Task 5.Show borrower name with book title (JOIN)
SELECT borrower_name, books.title AS book_title
FROM borrowers
    INNER JOIN books ON borrowers.book_id = books.book_id;

-- Task 6. Find who borrowed "SQL Basics"
SELECT *
FROM borrowers
    INNER JOIN books ON borrowers.book_id = books.book_id
WHERE
    title = 'SQL Basics';