.echo on
.headers on

--Name: Rhay C. Scott
--File: lab02a-scott.sql
--Date: July 8, 2020

--1 What are the regions?
sqlite> select * from region;

--2 What are the cities?
sqlite> select territoryid, territorydescription from territories;

--3 What are the cities in the Southern region?
sqlite> select * from territories where regionid = 4;

--4 How do you run this query with the fully qualifed column name?
sqlite> select territories.territoryid, territories.territorydescription, territories.regionid from territories where regionid = 4;

--5 How do you run this query with a table alias?
sqlite> select t.territoryid, t.territorydescription, t.regionid from territories t where regionid = 4;

--6 What is the contact name, telephone number, and city for each customer?
sqlite> select c.customerid, c.companyname, c.contactname, c.city, c.phone from customers c;

--7 What are the products currently out of stock?
sqlite> select p.productid, p.productname, p.unitsinstock from products p where p.unitsinstock = 0;

--8 What are the ten products currently in stock with the least amount on hand?
sqlite> select p.productid, p.productname, p.unitsinstock from products p order by p.unitsinstock limit 10;

--9 What are the five most expensive products in stock?
sqlite> select p.productid, p.productname, p.unitprice from products p order by p.unitprice desc limit 5;

--10 How many products does Northwind have? How many customers? How many suppliers?
sqlite> select count(distinct s.supplierid) as num_suppliers, count(distinct p.productid) as num_prods, count(distinct c.customerid) as u_cust from suppliers s, products p, customers c;