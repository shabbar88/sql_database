/*
Module2 Assignment
Problem Statement:
You have successfully cleared the first semester. In your second semester you will learn how to create tables, work with where clause and basic operators
Tasks to be done:

1.	Create a customer table which comprises of these columns – ‘customer_id’, ‘first_name’, ‘last_name’, ‘email’, ‘address’, ‘city’,’state’,’zip’

2.	Insert 5 new records into the table

3.	Select only the ‘first_name’ & ‘last_name’ columns from the customer table

4.	Select those records where ‘first_name’ starts with “G” and city is ‘San Jose’

*/
create database MyBussiness;
use MyBussiness;
create table customer(customer_id INT NOT NULL IDENTITY PRIMARY KEY,
first_name VARCHAR(255) NOT NULL,
last_name VARCHAR(255) NOT NULL,
email VARCHAR(50) NOT NULL,
[address] VARCHAR(255) NOT NULL,
city VARCHAR(50) NOT NULL,
[state] VARCHAR(50) NOT NULL,
zip INT NOT NULL);

INSERT INTO customer
VALUES('Ram','Kumar','ram@gmail.com','6b/48,mukundapur','kolkata','west bengal',700099),
('Ramu','Kumar','ramu@gmail.com','mehndi hasan chowk,muzaffarpur','muzaffarpur','bihar',870044),
('Ramesh','Kumar','ramesh@gmail.com','6b/48,mukundapur','kolkata','west bengal',700099),
('Gaurav','Kumar','gaurav@gmail.com','6b/48,mukundapur','san jose','san fransisco',800055),
('Gauri','Kumari','gauri@gmail.com','6b/48,mukundapur','san jose','san fransisco',800055);

select * from customer;
select first_name, last_name from customer;
select * from customer
where first_name like 'G%' and city='San Jose'


create table Orders(order_id INT NOT NULL IDENTITY PRIMARY KEY,
order_date DATETIME NOT NULL,
amount FLOAT NOT NULL,
customer_id INT FOREIGN KEY (customer_id) REFERENCES customer(id)

);
