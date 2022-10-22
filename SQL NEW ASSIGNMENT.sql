create database Unprecedented;
use Unprecedented;
create table Employee(Employee_id INT NOT NULL IDENTITY PRIMARY KEY,
First_name VARCHAR(50) NOT NULL,
Last_name VARCHAR(50) NOT NULL,
Salary INT NOT NULL,
Joining_date DATETIME NOT NULL,
Department VARCHAR(50) NOT NULL);
INSERT INTO Employee 
VALUES('Anika','Arora',100000,'2020-02-14 9:00:00','HR'),
('veena','Verma',80000,'2011-06-15 9:00:00','Admin'),
('Vishal','Singhal',300000,'2020-02-16 9:00:00','HR'),
('Sushant','Singh',500000,'2020-02-17 9:00:00','Admin'),
('Bhupal','Bhati',500000,'2011-06-18 9:00:00','Admin'),
('Dheeraj','Diwan',200000,'2011-06-19 9:00:00','Account'),
('Kiran','Kumar',7500,'2020-01-14 9:00:00','Account'),
('Chandrika','Chauhan',9000,'2011-04-15 9:00:00','Admin');


CREATE TABLE [Employee Bonus](
Bonus_id INT NOT NULL IDENTITY PRIMARY KEY,
Employee_ref_id INT FOREIGN KEY REFERENCES Employee(Employee_id) not null,
Bonus_Amount INT NOT NULL,
Bonus_Date DATETIME NOT NULL
);
INSERT INTO [Employee Bonus]
VALUES(1,5000,'2020-02-16 0:00:00'),
(2,3000,'2011-06-16 0:00:00'),
(3,4000,'2020-02-16 0:00:00'),
(1,4500,'2020-02-16 0:00:00'),
(2,3500,'2011-06-16 0:00:00');




CREATE TABLE [Employee Title](
tile_id INT NOT NULL IDENTITY PRIMARY KEY,
Employee_ref_id INT FOREIGN KEY REFERENCES Employee(Employee_id),
Employee_title VARCHAR(50),
Affective_date DATETIME
);
INSERT INTO [Employee Title] 
VALUES(1,'Manager','2016-02-20 0:00:00'),
(2,'Executive','2016-06-11 0:00:00'),
(8,'Executive','2016-06-11 0:00:00'),
(5,'Manager','2016-06-11 0:00:00'),
(4,'Asst Manager','2016-06-11 0:00:00'),
(7,'Executive','2016-06-11 0:00:00'),
(6,'Lead','2016-06-11 0:00:00'),
(3,'Lead','2016-06-11 0:00:00');

select * from Employee;
select * from [Employee Bonus];
select * from [Employee Title];

/*
Tasks To Be Performed:
1 Display the “FIRST_NAME” from Employee table using the alias name 
as Employee_name.
2 Display “LAST_NAME” from Employee table in upper case.
3 Display unique values of DEPARTMENT from EMPLOYEE table.
4 Display the first three characters of LAST_NAME from EMPLOYEE table.
5 Display the unique values of DEPARTMENT from EMPLOYEE table and 
prints its length.
6 Display the FIRST_NAME and LAST_NAME from EMPLOYEE table into a 
single column AS FULL_NAME. 
 a space char should separate them.
7 DISPLAY all EMPLOYEE details from the employee table 
order by FIRST_NAME Ascending.
8. Display all EMPLOYEE details order by FIRST_NAME Ascending and 
DEPARTMENT Descending.
9 Display details for EMPLOYEE with the first name as “VEENA” and 
“KARAN” from EMPLOYEE table.
10 Display details of EMPLOYEE with DEPARTMENT name as “Admin”.
11 DISPLAY details of the EMPLOYEES whose FIRST_NAME contains ‘V’.
12 DISPLAY details of the EMPLOYEES whose SALARY lies between 
100000 and 500000.
13 Display details of the employees who have joined in Feb-2020.
14 Display employee names with salaries >= 50000 and <= 100000.
16 DISPLAY details of the EMPLOYEES who are also Managers.
17 DISPLAY duplicate records having matching data in some fields of a 
table.
18 Display only odd rows from a table.
19 Clone a new table from EMPLOYEE table.
20 DISPLAY the TOP 2 highest salary from a table.
21. DISPLAY the list of employees with the same salary.
22 Display the second highest salary from a table.
23 Display the first 50% records from a table.
24. Display the departments that have less than 4 people in it.
25. Display all departments along with the number of people in there.
26 Display the name of employees having the highest salary in each 
department.
27 Display the names of employees who earn the highest salary.
28 Diplay the average salaries for each department
29 display the name of the employee who has got maximum bonus
30 Display the first name and title of all the employees

*/
--1 Display the “FIRST_NAME” from Employee table using the alias name 
--as Employee_name.
USE Unprecedented;
SELECT First_name as Employee_name FROM Employee ;

--2 Display “LAST_NAME” from Employee table in upper case.
select upper(Last_name)as Last_Name from Employee

--3 Display unique values of DEPARTMENT from EMPLOYEE table.
select distinct Department from Employee;

--4 Display the first three characters of LAST_NAME from EMPLOYEE table.
select SUBSTRING(Last_name,1,3)as first3inlast from Employee; 

--5 Display the unique values of DEPARTMENT from EMPLOYEE table and 
--prints its length.
select distinct Department,len(Department)as Dep_length from Employee;

--6 Display the FIRST_NAME and LAST_NAME from EMPLOYEE table into a 
--single column AS FULL_NAME. 
select concat(First_name,' ',Last_name)as FULL_NAME FROM Employee;

--7 DISPLAY all EMPLOYEE details from the employee table 
--order by FIRST_NAME Ascending.
select * from Employee 
ORDER BY First_name ASC;

--8. Display all EMPLOYEE details order by FIRST_NAME Ascending and 
--DEPARTMENT Descending.
SELECT * FROM Employee 
order by First_name ASC,Department DESC;

--9 Display details for EMPLOYEE with the first name as “VEENA” and 
--“KARAN” from EMPLOYEE table.
SELECT* FROM Employee 
where First_name='veena' or First_name='karan';

--10 Display details of EMPLOYEE with DEPARTMENT name as “Admin”.
select * from Employee 
where Department='Admin';

--11 DISPLAY details of the EMPLOYEES whose FIRST_NAME contains ‘V’.
select * from Employee 
where First_name like '%V%';

--12 DISPLAY details of the EMPLOYEES whose SALARY lies between 
--100000 and 500000.

SELECT * FROM Employee 
WHERE Salary BETWEEN 100000 AND 500000;

--13 Display details of the employees who have joined in Feb-2020.
SELECT * FROM Employee 
where Joining_date BETWEEN '2020-02-01' AND '2020-02-28';

--14 Display employee names with salaries >= 50000 and <= 100000.
SELECT * FROM Employee 
WHERE Salary>=50000 AND Salary<=100000;


--16 DISPLAY details of the EMPLOYEES who are also Managers.
SELECT * FROM [Employee Title] 
left JOIN Employee ON [Employee Title].Employee_ref_id=Employee.Employee_id
where Employee_title like'%Manager'

--17 DISPLAY duplicate records having matching data in some fields of a 
--table.
INSERT INTO Employee 
VALUES('Anika','Arora',100000,'2020-02-14 9:00:00','HR'),
('veena','Verma',80000,'2011-06-15 9:00:00','Admin');

SELECT First_name,Last_name,Salary,Joining_date,Department,  COUNT(*) AS Duplicate
FROM Employee Title
GROUP BY First_name,Last_name,Salary,Joining_date,Department
HAVING COUNT(*) > 1


USE Unprecedented;


--18 Display only odd rows from a table.
select * from Employee where Employee_id%2=1;

	--19 Clone a new table from EMPLOYEE table.
create table EmployeeClone(Employee_id INT NOT NULL IDENTITY PRIMARY KEY,
First_name VARCHAR(50) NOT NULL,
Last_name VARCHAR(50) NOT NULL,
Salary INT NOT NULL,
Joining_date DATETIME NOT NULL,
Department VARCHAR(50) NOT NULL);
SET IDENTITY_INSERT EmployeeClone ON
GO

INSERT INTO EmployeeClone(Employee_id,First_name,Last_name,Salary,Joining_date,Department)
select Employee_id,First_name,Last_name,Salary,Joining_date,Department from Employee;
select * from EmployeeClone;
select * from Employee;

SET IDENTITY_INSERT EmployeeClone ON
GO

--20 DISPLAY the TOP 2 highest salary from a table.select top 3  concat(First_name,' ',Last_name)as Full_Name,Salary from Employee 
order by Salary DESC;

--*21. DISPLAY the list of employees with the same salary.
SELECT *
FROM Employee
WHERE salary IN
    (SELECT salary
     FROM Employee e
     WHERE Employee.Employee_id <> e.Employee_id);


--22 Display the second highest salary from a table.

SELECT TOP 1 Salary  
FROM (  
      SELECT DISTINCT TOP 2 Salary  
      FROM Employee  
      ORDER BY Salary DESC  
      ) RESULT  
ORDER BY SALARY 


--23 Display the first 50% records from a table.select top 50 percent * from Employee;--24. Display the departments that have less than 4 people in it.
--this has to be done
select Department, count(*) as NumberOfPerson from Employee 
GROUP BY Department 
order by count(*)

--25. Display all departments along with the number of people in therselect Department, count(*) as NumberOfPerson from Employee 
GROUP BY Department 
order by count(*)--26 Display the name of employees having the highest salary in each 
--department.--this has to be doneUSE Unprecedented;select   Department,  MAX(Salary) as MAX_SALARY  From Employee GROUP BY Departmentorder by MAX(Salary);--27 Display the names of employees who earn the highest salary.select distinct top 1 * from Employee order by Salary DESC--28 Diplay the average salaries for each departmentselect Department, avg(salary)  as AVG_SALARY  FROM Employeegroup by Departmentorder by avg(salary) DESC;--29 display the name of the employee who has got maximum bonusSELECT TOP 1 Employee.First_name,MAX([Employee Bonus].Bonus_Amount) AS maximum_bonus FROM Employee join [Employee Bonus] on Employee.Employee_id=[Employee Bonus].Employee_ref_idgroup by First_name;--30 Display the first name and title of all the employeesSELECT Employee.First_name,[Employee Title].Employee_title from Employee JOIN [Employee Title] ON Employee.Employee_id=[Employee Title].Employee_ref_id; 









      


































