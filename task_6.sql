create database CompanyDB;
use CompanyDB;


-- Cration of Departments
CREATE TABLE Departments (
	DeptID INT PRIMARY KEY,
    DeptName VARCHAR(255)
);

-- Insertion of rows in Department Table
INSERT INTO Departments(DeptID, DeptName)
values
	(1, 'Sales'),
	(2, 'Marketing'),
	(3, 'IT');

-- Creation Employees Table
create table Employees (
	Emp_ID INT PRIMARY KEY,
    Name VARCHAR(255),
    DeptID INT,
    Salary DECIMAL(10, 2),
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);


-- Insertion of rows in Employees Table
insert into Employees (Emp_ID, Name, DeptID, Salary)
values
	(1, 'John Smith', 1, 50000.00),
	(2, 'Jane Doe', 2, 60000.00),
	(3, 'Bob Johnson', 1, 55000.00),
	(4, 'Alice Brown', 3, 70000.00),
	(5, 'Mike Davis', 2, 65000.00);
    


-- =========================================================================================
-- 1.Use scalar and correlated subqueries
-- =========================================================================================

-- Scalar subqueries
select * from Employees
where Salary > (
	select avg(salary)
    from Employees
);

-- --------------------------------------------------------------------


-- Correlated subqueries
select Name, salary from Employees
where Salary > (
	select avg(salary)
    from Employees
    where Name = Employees.Name
);



-- =========================================================================================
--  2.Use subqueries inside IN, EXISTS, =
-- =========================================================================================

-- Use of 'IN'
select * from Employees 
where DeptID in (1, 2);


-- Use of 'Exists'
select * from Employees e
where exists(
	select 1
    from Departments d
    where d.DeptID = e.DeptID
);


-- Use of '='
select * from Employees 
where Salary = (
	select max(salary)
    from Employees
);