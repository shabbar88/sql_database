/*
Problem Statement:
You have successfully cleared the 2nd semester. In your 3rd semester you will work with joins and update statement
Tasks to be done:

1.	Create an ‘Orders’ table which comprises of these columns – ‘order_id’, ‘order_date’, ‘amount’, ‘customer_id’

2.	Make an inner join on ‘Customer’ & ‘Order’ tables on the ‘customer_id’ column 

3.	Make left and right joins on ‘Customer’ & ‘Order’ tables on the ‘customer_id’ column

4.	Update the ‘Orders’ table, set the amount to be 100 where ‘customer_id’ is 3

*/
use MyBussiness;

create table Orders(order_id INT NOT NULL IDENTITY PRIMARY KEY,
order_date DATETIME NOT NULL,
amount FLOAT NOT NULL,
customer_id INT FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

INSERT INTO Orders
VALUES('2022-10-10 13:13:13',5000.00,1);
INSERT INTO Orders
VALUES('2022-09-10 15:13:13',7000.00,1),
('2022-09-10 15:13:13',7000.00,2),
('2022-05-10 18:13:13',17000.00,2),
('2022-06-10 15:13:13',6000.00,3),
('2022-01-10 17:13:13',17000.00,3),
('2022-02-10 19:13:13',9000.00,4),
('2022-04-10 15:13:13',9000.00,4),
('2022-09-10 13:13:13',17000.00,5),
('2022-04-10 12:13:13',17000.00,5);

SELECT * FROM Orders;
--below there is a inner join between customer and orders
SELECT * FROM customer;
SELECT * , Orders.order_date,Orders.amount FROM customer
inner join Orders ON customer.customer_id=Orders.order_id;
--below we are depicting left join

SELECT customer.customer_id,customer.first_name,customer.city,Orders.amount,Orders.order_date FROM customer 
LEFT JOIN Orders ON customer.customer_id=Orders.order_id

--below we are depicting right join
SELECT customer.customer_id,customer.first_name,customer.city,Orders.amount,Orders.order_date FROM customer 
RIGHT JOIN Orders ON customer.customer_id=Orders.order_id

--Update the ‘Orders’ table, set the amount to be 100 where ‘customer_id’ is 3
update Orders 
set amount=100 where customer_id=3

select * from Orders;






