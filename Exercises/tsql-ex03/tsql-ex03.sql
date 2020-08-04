.echo on

.header on

--Rhay Scott

--TSQL-EX03

--July 19, 2020

--1. Using SQLite and the Northwind database, create a line item report that contains a line for each
--product in the order with the following columns: the order id, the product id, the unit price, the
--quantity sold, the line item price, and the percent of that line item constitutes of the total amount of
--the order.

select o.orderid, od.productid, od.unitprice, od.quantity, (od.unitprice*od.quantity) as LineTotal, (od.unitprice * od.quantity) / (sum(od.unitprice * od.quantity) * 100) as PctOfTotalOrder from order_details od join orders o on od.orderid = o.orderid group by od.orderid order by od.orderid limit 25;

--2. I want to know the unique (distinct) cities, regions, and postal codes: (a) where we have both customers
--and employees, (b) where we have customers but no employees AND both customers ad employees,
--and (c) where we have employees but no customers AND both customers and employees. Write three
--queries, using inner and outer joins. Report the results of the queries. There is no need for any further
--reporting.

--(a) where we have both customers and --employees,

select distinct e.employeeid, e.firstname, e.lastname, c.customerid, c.city, c.region, c.postalcode from customers c join employees e on c.region like e.region order by e.employeeid;

--(b)where we have customers but no employees AND both customers and employees,

select distinct e.employeeid, e.firstname, e.lastname, c.customerid, c.city, c.region, c.postalcode from customers c left join employees e on c.region = e.region order by c.customerid;

--(c)where we have employees but no customers AND both customers and employees. 

select distinct e.employeeid, e.firstname, e.lastname, c.customerid, c.city, c.region, c.postalcode from employees e left join customers c on c.region = e.region order by e.employeeid;

