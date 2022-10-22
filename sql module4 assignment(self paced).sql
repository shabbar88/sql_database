/*
1.	Use the inbuilt functions and find the minimum, maximum and average amount from the orders table

2.	Create a user-defined function, which will multiply the given number with 10

3.	Use the case statement to check if 100 is less than 200, greater than 200 or equal to 2oo and print the corresponding value

*/
use MyBussiness;
select min(Orders.amount) as MINIMUM_AMOUNT from Orders;

--Create a user-defined function, which will multiply the given number with 10
create function multiplier_byten(@num1 INT)
RETURNS INT
AS
 BEGIN
   RETURN(
      @num1 * 10
   )
 END;

SELECT dbo.multiplier_byten(50);

/*
3.	Use the case statement to check if 100 is less than 200, greater than 200 or equal to 2oo and print the corresponding value
*/
SELECT
CASE
WHEN 100<200 then '100 is less than 200'
WHEN 100>200 then '100 is  greater than 200'
ELSE '100 is equal to 200'
END;

