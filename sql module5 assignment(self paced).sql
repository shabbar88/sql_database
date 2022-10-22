/*
1.	Arrange the ‘Orders’ dataset in decreasing order of amount
2.	Create a table with name ‘Employee_details1’ and comprising of these columns – ‘Emp_id’, ‘Emp_name’, ‘Emp_salary’. Create another table with name ‘Employee_details2’, which comprises of same columns as first table.
3.	Apply the union operator on these two tables
4.	Apply the intersect operator on these two tables
5.	Apply the except operator on these two tables

*/
use MyBussiness;
select * from Orders 
order by amount DESC;

CREATE TABLE Employee_details1(Emp_id INT NOT NULL IDENTITY PRIMARY KEY,
Emp_name VARCHAR(255) NOT NULL,
Emp_salary FLOAT NOT NULL);

INSERT INTO Employee_details1
VALUES('suresh',4000.89),('mahesh',78000.76),('imran',76000.98),('kamran',76999.9);

CREATE TABLE Employee_details2(Emp_id INT NOT NULL IDENTITY PRIMARY KEY,
Emp_name VARCHAR(255) NOT NULL,
Emp_salary FLOAT NOT NULL);

INSERT INTO Employee_details2
VALUES('geeta',14000.89),('maheshwari',278000.76),('imzaad',376000.98),('kailash',176999.9);



select * from Employee_details1;
select * from Employee_details2;

select Employee_details1.Emp_name,Employee_details1.Emp_salary from Employee_details1 UNION 
SELECT Employee_details2.Emp_name,Employee_details2.Emp_salary from Employee_details2;

INSERT INTO Employee_details1
VALUES('sourav',4000.89),('maroof',78000.76),('inzi',76000.98);

INSERT INTO Employee_details2
VALUES('sourav',4000.89),('maroof',78000.76),('inzi',76000.98);

select Employee_details1.Emp_name,Employee_details1.Emp_salary from Employee_details1 intersect
SELECT Employee_details2.Emp_name,Employee_details2.Emp_salary from Employee_details2;



INSERT INTO Employee_details1
VALUES('rinku',4000.89),('mani',178000.76),('insha',176000.98);



select * from Employee_details1;
select * from Employee_details2;
select Employee_details1.Emp_name,Employee_details1.Emp_salary from Employee_details1 except
SELECT Employee_details2.Emp_name,Employee_details2.Emp_salary from Employee_details2;












