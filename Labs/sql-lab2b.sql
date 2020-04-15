.echo on
.headers on

-- Chance Gierman
-- Files: sql-lab2b.sql
-- Date: January 22, 2020

-- 1 Who are customers in north america? 
 select customerid, companyname, country from customers where country in("Canada", "USA", "Mexico");

-- 2 What orders were placed in April, 1998?
 select orderid, customerid, orderdate from orders where orderdate like "1998-04%";

-- 3 What sauces do we sell?
 select productname from products where productname like "%sauce%";
 
-- 4 You sell some kind of dried fruit that i liked very much. What is the name?
 select productname from products where productname like "%dried%";
 
-- 5 What employees ship products to Germany in December?
select orderid, employeeid, shippeddate, shipcountry from orders where shipcountry like "Germany" and shippeddate like "%-12-%";

-- 6 We have an issue with product 19. I need to know the total amount and the net amount of all orders for product 19 where the customer took a discount.
 select orderid, productid, unitprice * quantity as totalprice, discount * unitprice * quantity as amountofdiscount, (unitprice * quantity) - (discount * unitprice * quantity) as netprice from order_details where productid = 19 and discount > 0;
 
-- 7 I need a list of employees by title, first name, and last name, with the employee's position under their names, and a line separating each employee.
 select titleofcourtesy || " " || firstname || " " || lastname || "
   ...> " || title || "
   ...> " from employees;

-- 8 I need a list of our customers and the first name only of the customer representative.
 select companyname, substr(contactname, 1, instr(contactname, " ")) from customers;   

-- 9 Give me a list of our customer contaxts alphaetically by last name.
 select substr(contactname, instr(contactname, " ") + 1) || ", " || substr(contactname, 1, instr(contactname, " ")) from customers order by substr(contactname, instr(contactname, " ") + 1);
 
-- 10 I need a report telling me the most common paring of customers and employees with the greatest order volume (by the number of orders placed). Exclude pairings with minimal orders


-- 11 I need a report listing the highest average selling product by product id. The average is determined by the total sales of each product id divided by quanity of products sold. Included only the highest 20 products.
