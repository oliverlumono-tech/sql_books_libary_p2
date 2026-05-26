SELECT * FROM books;
SELECT * FROM branch;
SELECT * FROM employees;
SELECT * FROM issued_status;
SELECT * FROM return_status;
SELECT * FROM members;

--project task

--QN.1 Create a new book record --"978-1-60129-456-2", 'To kill a Mockingbird', 'Clasic', 6.00, 'yes', 'Harper lee', 'J.B. Lippincortt & Co')"
INSERT INTO books(isbn, book_title, category, rental_price, status, author, publisher )
VALUES
('978-1-60129-456-2', 'To kill a Mockingbird', 'Clasic', 6.00, 'yes', 'Harper lee', 'J.B. Lippincortt & Co');
SELECT * FROM books;

--QN.2 Update an existing member address?
UPDATE members 
SET member_address ='125 Main St'
WHERE member_id = 'C101';
SELECT * FROM members;

--QN.3 Delete a record from the issued Status Table 
--Objective:Delete the record with issued_id = 'IS121' from the issued_status table?
SELECT * FROM issued_status;

DELETE FROM issued_status
WHERE issued_id = 'IS121'

--QN.4 Retrieve All Books issued by a specifuc Employee 
--Objective:Select all books issued by the employee with emp_id = 'E101'
SELECT * FROM issued_status
WHERE issued_emp_id = 'E101';

--QN.5 List Members who have issued more than one book 
--Objective: Use group by to find members who have issued more than on book.
SELECT
	issued_emp_id
	--COUNT(issued_id) as total_book_issued
FROM issued_status
GROUP BY issued_emp_id
HAVING COUNT(issued_id) > 1;

--CTAS
--QN.6 Create summary Table:Used CTAS to generate new table based on quarry result- each book and total book_issued_cnt**

CREATE TABLE book_cnts
AS
SELECT 
	b.isbn,
	b.book_title,
	COUNT(ist.issued_id) as no_issed
FROM books as b
JOIN 
issued_status as ist
ON ist.issued_book_isbn = b.isbn
GROUP BY 1, 2;

SELECT * FROM book_cnts;

--QN.7.Retrivee All books in specific category:
SELECT * FROM books
WHERE category = 'Classic'

--QN.8: Find total rental income by category:
SELECT 
    b.category,
	SUM(b.rental_price),
	COUNT(*)
FROM books as b
JOIN 
issued_status as ist
ON ist.issued_book_isbn = b.isbn
GROUP BY 1;

--QN.9 List members who Registered in the last 180 Days;
SELECT * FROM members
WHERE 
INSERT INTO members (member_id, member_name, member_address, reg_date)
VALUES
('C118', 'sam', '145 Main St', '2024-06-01'),
('C119', 'oliver', '155 Main St', '2024-05-01');

--QN.10 List Employees with their branch managers name and their branch details;
SELECT 
	e1.*,
	b1.manager_id,
	e2.emp_name as manager
from employees as e1
JOIN
branch as b1
ON b1.branch_id = e1.branch_id
JOIN 
employees as e2
ON b1.manager_id = e2.emp_id

--QN.11 Create a table of books with rental price above a cersatin threshold 7US;
CREATE TABLE books_price_greater_than_seven
AS
SELECT * FROM books
WHERE rental_price > 7; -- Added semicolon here

SELECT * FROM books_price_greater_than_seven;

--QN.12 Retrieve the list of books not yet returned
SELECT * 
	DISTINCT ist.issued_book_name
FROM issued_status AS ist
LEFT JOIN return_status AS rs
ON ist.issued_id = rs.issued_id
WHERE rs.return_id IS NULL;

SELECT * 
FROM return_status;





 







