.echo on
.headers on


--Name:  Rhay Scott

--File:  lab02b

--Date:  July 9, 2020

--1. Who are our customers in North America?
sqlite> select customerid, companyname, country from customers where country in ('USA','Mexico','Canada');

--2. What orders were placed in April, 1998?
sqlite> select orderid, orderdate from orders where orderdate like "1998-04-%";

--3. What sauces do we sell?


--4. You sell some kind of dried fruit that I liked very much. What is its name?
select productid, productnam from products where productname like "%dried%";

--5. What employees ship products to Germany in December?


--6. We have an issue with product 19. I need to know the total amount and the net amount of all orders for product 19 where the customer took a discount.


--7. I need a list of employees by title, First name, and last name, with the employee's position under their names, and a line separating each employee.


--8. I need a list of our customers and the First name only of the customer representative.


--9. Give me a list of our customer contacts alphabetically by last name.


--10. I need a report telling me the most common pairing of customers and employees with the greatest order volume (by the number of orders placed). Exclude pairings with minimal orders.
select customerid, employeeid, count(orderid) as volume from orders group by customerid, employeeid having count (orderid) > 3;

--11. I need a report listing the highest average selling product by product id. The average is determined by the total sales of each product id divided by the quantity of the product sold. Include only the highest 20 products.
select productid, sum(unitprice * quantity) as total_price, sum(quantity) as total_quantity, (sum(unitprice * quantity) / sum(quantity)) as average from order_details goup by productid
