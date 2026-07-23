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
SELECT title AS "books", price AS book_price FROM books;
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

-- Task 7.Count how many times each book borrowed
SELECT
    books.title AS buying_books,
    COUNT(*) AS buying_book_number
FROM borrowers
    INNER JOIN books ON borrowers.book_id = books.book_id
GROUP BY
    books.title;

-- Task 8.Find most expensive book
SELECT b.title AS most_expensive_book
FROM books AS b
ORDER BY b.price DESC
LIMIT 1;

-- ------Hard task----------------
-- Task 9.Show each borrower with total books borrowed
SELECT b.borrower_name, COUNT(b.book_id) AS borrowed_books
FROM borrowers AS b
GROUP BY
    b.borrower_name;

-- Task 10.Find book which borrowed most times
SELECT title AS most_buying_book
FROM books
WHERE
    books.book_id = (
        SELECT book_id
        FROM borrowers b
        GROUP BY
            b.book_id
        ORDER BY count(*) DESC
        LIMIT 1
    );

-- alternative way-- if 2 book have same time borrowed so 2 is selected
SELECT title
FROM books
WHERE
    book_id IN (
        SELECT book_id
        FROM borrowers
        GROUP BY
            book_id
        HAVING
            COUNT(*) = (
                SELECT MAX(cnt)
                FROM (
                        SELECT COUNT(*) AS cnt
                        FROM borrowers
                        GROUP BY
                            book_id
                    ) t
            )
    );

-- Task 11. Find borrowers who borrowed more than 1 book
SELECT borrower_name
FROM borrowers
GROUP BY
    borrower_name
HAVING
    COUNT(*) > 1;

-- Task 12. Show books never borrowed
SELECT books.title
FROM books
    LEFT JOIN borrowers ON books.book_id = borrowers.book_id
WHERE
    borrowers.book_id IS NULL;

-- If borrowers.book_id is null so it don't bought.
SELECT books.title, borrowers.book_id
FROM books
    LEFT JOIN borrowers ON books.book_id = borrowers.book_id;

-- SQL EXUCUTION ORDER
-- FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY