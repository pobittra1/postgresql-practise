-- Active: 1784391000223@@localhost@5432@tayu
-- select everything from peson2 table;
select * from person2;

alter table person2
ADD COLUMN email VARCHAR(50) DEFAULT 'default@gmail.com' NOT NULL;

INSERT INTO person2 VALUES ( 7, 'ritam', 33, 'ritam@gmail.com' );

alter table person2 drop COLUMN email;