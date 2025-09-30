create database college;
use college;

-- ===============================================================================================
-- 1.Create two related tables
-- ===============================================================================================

-- Departments Table
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50)
);

-- Insertion of rows in Department Table
INSERT INTO Departments (DeptID, DeptName) 
VALUES (1, 'Computer Science'),
(2, 'Information Technology'),
(3, 'Mechanical'),
(4, 'Electrical'),
(5, 'Civil');


-- Student Table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    Age INT,
    DeptID INT,
    Marks INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

-- Insertion of rown in Students Table
INSERT INTO Students (StudentID, StudentName, Age, DeptID, Marks) 
VALUES (101, 'Amit Sharma', 20, 1, 88),
(102, 'Priya Verma', 21, 2, 92),
(103, 'Rohit Singh', 22, 1, 75),
(104, 'Sneha Gupta', 19, 3, 85),
(105, 'Vikas Yadav', 20, 4, 60),
(106, 'Neha Mehta', 23, 2, 95),
(107, 'Arjun Patel', 21, 5, 55),
(108, 'Simran Kaur', 20, 1, 78),
(109, 'Rahul Nair', 22, 3, 82),
(110, 'Kriti Malhotra', 21, 4, 66),
(111, 'Mohit Chauhan', 20, 1, 91),
(112, 'Divya Rani', 23, 2, 87),
(113, 'Aditya Joshi', 21, 5, 72),
(114, 'Meera Das', 22, 3, 80),
(115, 'Sahil Khan', 20, 4, 68),
(116, 'Ananya Roy', 21, 1, 94),
(117, 'Deepak Kumar', 22, 2, 70),
(118, 'Pooja Sharma', 23, 5, 77),
(119, 'Karan Singh', 20, 3, 89),
(121, 'Shweta Pandey', 21, 1, 81);




-- ===============================================================================================
-- 2.Use INNER, LEFT, RIGHT, FULL JOIN
-- ===============================================================================================

-- INNER JOIN

select S.StudentID, S.StudentName, S.Age, S.Marks, D.DeptID, D.DeptName
from Students as S inner join Departments as D
ON S.DeptID = D.DeptID;

-- -----------------------------------------------------------------------------------------


-- RIGHT JOIN

select S.StudentName, S.Marks, D.DeptID, D.DeptName
from Students as S right join Departments as D
ON S.DeptID = D.DeptID;

-- -----------------------------------------------------------------------------------------

-- LEFT JOIN

select S.StudentID, S.StudentName, D.DeptName
from Students as S left join Departments as D
ON S.DeptID = D.DeptID;

-- -----------------------------------------------------------------------------------------

-- FULL OUTER JOIN (LEFT JOIN   UNION   RIGHT JOIN  in MySQL Workbench) 

select S.StudentID, S.StudentName, S.Age, S.Marks, D.DeptID, D.DeptName
from Students as S left join Departments as D
ON S.DeptID = D.DeptID

union

select S.StudentID, S.StudentName, S.Age, S.Marks, D.DeptID, D.DeptName
from Students as S right join Departments as D
ON S.DeptID = D.DeptID;

-- -----------------------------------------------------------------------------------------