-- Library_Management_System
--Creating branch table 
DROP TABLE IF EXISTS branch;
CREATE TABLE branch(
branch_id VARCHAR(10) PRIMARY KEY,
manager_id VARCHAR(10),
branch_address VARCHAR(55),
contact_no VARCHAR(10)
);
--Creating the employees table 
DROP TABLE IF EXISTS employees;
CREATE TABLE employees(
emp_id VARCHAR(10) PRIMARY KEY,
emp_name VARCHAR(25),
position VARCHAR(15),
salary INT,
branch_id VARCHAR(25) --fk

);
--creating the books table 
DROP TABLE IF EXISTS books; 
CREATE TABLE books(
isbn VARCHAR(20) PRIMARY KEY,
book_title VARCHAR(75),
category VARCHAR(10),
rental_price FLOAT,
status VARCHAR(15) ,
author VARCHAR(35),
publisher VARCHAR(55)
);
--changer la longuere du texte dune colonne de VARCHAR (10) à VARCHAR(25)
ALTER TABLE books 
ALTER COLUMN category TYPE VARCHAR(25);

--creating the members table
DROP TABLE IF EXISTS members; 
CREATE TABLE members (
member_id VARCHAR(10) PRIMARY KEY,
member_name VARCHAR(25),
member_address VARCHAR(75),
reg_date DATE

);

--Creating the issued_status table
DROP TABLE IF EXISTS issued_status;
CREATE TABLE issued_status(
issued_id VARCHAR(10) PRIMARY KEY,
issued_member_id VARCHAR(10),  --fk
issued_book_name VARCHAR(175),
issued_date DATE,
issued_book_isbn VARCHAR(25),  --fk
issued_emp_id VARCHAR(10)  --fk
);
--creating the return_status_table
DROP TABLE IF EXISTS return_status;
CREATE TABLE return_status(
return_id VARCHAR(10) PRIMARY KEY,
issued_id VARCHAR(10),
return_book_name VARCHAR(75),
return_date DATE,
return_book_isbn VARCHAR(20)
);

--FOREIGN KEY 
ALTER TABLE issued_status -- we wanna add a foreign key in the table called issued_status
ADD CONSTRAINT fk_members -- this is just a name, we can give any name here
FOREIGN KEY (issued_member_id) -- the column we want it to be a FOREIGN KEY in the table 'issued_status'
REFERENCES members(member_id) -- le nom entre parenthèse c le nom de la colonne de cette table

--FOREIGN KEY 
ALTER TABLE issued_status -- we wanna add a foreign key in the table called issued_status
ADD CONSTRAINT fk_books -- this is just a name, we can give any name here
FOREIGN KEY (issued_book_isbn) -- the column we want it to be a FOREIGN KEY in the table 'issued_status'
REFERENCES books(isbn) -- le nom entre parenthèse c le nom de la colonne de cette table

--FOREIGN KEY 
ALTER TABLE issued_status -- we wanna add a foreign key in the table called issued_status
ADD CONSTRAINT fk_employees -- this is just a name, we can give any name here
FOREIGN KEY (issued_emp_id) -- the column we want it to be a FOREIGN KEY in the table 'issued_status'
REFERENCES employees(emp_id) -- le nom entre parenthèse c le nom de la colonne de cette table

--only once the book is issued somebody can return it !!!!!
--FOREIGN KEY 
ALTER TABLE employees-- we wanna add a foreign key in the table called issued_status
ADD CONSTRAINT fk_branch -- this is just a name, we can give any name here
FOREIGN KEY (branch_id) -- the column we want it to be a FOREIGN KEY in the table 'issued_status'
REFERENCES branch(branch_id) -- le nom entre parenthèse c le nom de la colonne de cette table

--FOREIGN KEY 
ALTER TABLE return_status-- we wanna add a foreign key in the table called issued_status
ADD CONSTRAINT fk_issued_status -- this is just a name, we can give any name here(the primary key is coming from the issued_status_table)
FOREIGN KEY (issued_id) -- the column we want it to be a FOREIGN KEY in the table 'issued_status'
REFERENCES issued_status(issued_id) -- le nom entre parenthèse c le nom de la colonne de cette table

/*
-- Project TASK


-- ### 2. CRUD Operations


-- Task 1. Create a New Book Record
-- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"

-- Task 2: Update an Existing Member's Address


-- Task 3: Delete a Record from the Issued Status Table
-- Objective: Delete the record with issued_id = 'IS104' from the issued_status table.

-- Task 4: Retrieve All Books Issued by a Specific Employee
-- Objective: Select all books issued by the employee with emp_id = 'E101'.


-- Task 5: List Members Who Have Issued More Than One Book
-- Objective: Use GROUP BY to find members who have issued more than one book.


-- ### 3. CTAS (Create Table As Select)

-- Task 6: Create Summary Tables**: Used CTAS to generate new tables based on query results - each book and total book_issued_cnt


-- ### 4. Data Analysis & Findings

-- Task 7. **Retrieve All Books in a Specific Category:


-- Task 8: Find Total Rental Income by Category:


-- Task 9. **List Members Who Registered in the Last 180 Days**:

-- Task 10: List Employees with Their Branch Manager's Name and their branch details**:


-- Task 11. Create a Table of Books with Rental Price Above a Certain Threshold

-- Task 12: Retrieve the List of Books Not Yet Returned

    
/*
### Advanced SQL Operations

Task 13: Identify Members with Overdue Books
Write a query to identify members who have overdue books (assume a 30-day return period). Display the member's name, book title, issue date, and days overdue.


Task 14: Update Book Status on Return
Write a query to update the status of books in the books table to "available" when they are returned (based on entries in the return_status table).



Task 15: Branch Performance Report
Create a query that generates a performance report for each branch, showing the number of books issued, the number of books returned, and the total revenue generated from book rentals.


Task 16: CTAS: Create a Table of Active Members
Use the CREATE TABLE AS (CTAS) statement to create a new table active_members containing members who have issued at least one book in the last 6 months.



Task 17: Find Employees with the Most Book Issues Processed
Write a query to find the top 3 employees who have processed the most book issues. Display the employee name, number of books processed, and their branch.


Task 18: Identify Members Issuing High-Risk Books
Write a query to identify members who have issued books more than twice with the status "damaged" in the books table. Display the member name, book title, and the number of times they've issued damaged books.    


Task 19: Stored Procedure
Objective: Create a stored procedure to manage the status of books in a library system.
    Description: Write a stored procedure that updates the status of a book based on its issuance or return. Specifically:
    If a book is issued, the status should change to 'no'.
    If a book is returned, the status should change to 'yes'.

Task 20: Create Table As Select (CTAS)
Objective: Create a CTAS (Create Table As Select) query to identify overdue books and calculate fines.

Description: Write a CTAS query to create a new table that lists each member and the books they have issued but not returned within 30 days. The table should include:
    The number of overdue books.
    The total fines, with each day's fine calculated at $0.50.
    The number of books issued by each member.
    The resulting table should show:
    Member ID
    Number of overdue books
    Total fines
*/
*/