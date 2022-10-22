/*

1.	Create a view named ‘customer_san_jose’ which comprises of only those customers who are from san jose
2.	Inside a transaction, update the first name of the customer to Francis, where the last name is Jordan
a.	Rollback the transaction
b.	Set the first name of customer to Alex, where the last name is Jordan
3.	Inside a try catch block, divide 100 with 0, print the default error message

*/
use MyBussiness;


create VIEW  customer_san_jose
as select * from customer
WHERE city='san jose';
select * from customer_san_jose;

/*
	Inside a transaction, update the first name of the customer to Francis, where the last name is Jordan
a.	Rollback the transaction
*/
use MyBussiness;
begin transaction
update customer 
set first_name='Francis' where last_name='Jordan';
rollback transaction

begin transaction
update customer 
set first_name='Alex' where last_name='Jordan'
commit transaction


/*
3.	Inside a try catch block, divide 100 with 0, print the default error message
*/
begin try
  begin transaction 
  DECLARE @num INT

  SET @num=100/0
end try
begin catch
    print('divide by zero error')
end catch


BEGIN TRY
-- Generate a divide-by-zero error  
  SELECT
    1 / 0 AS Error;
END TRY
BEGIN CATCH
  SELECT
 
    ERROR_MESSAGE() AS ErrorMessage;
END CATCH;
GO









    
	
    



