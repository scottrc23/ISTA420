.echo on
.headers on

--Name:  Rhay Scott

--File:  TSQL-Programming EX02

--Date:  July 10, 2020


--1. List the company name, the contact name and the country of all customers in Poland.
select c.companyname, c.contactname, c.country from customers c where c.country like "%poland%";

--2. List the order Id, the order date, and the destination city of all orders shipped to Berlin.
 select o.orderid, o.orderdate, o.shipcity from orders o where o.shipcity like "%berlin%";
 
 --3. How many boxes of Filo Mix do we have in stock?
 select p.unitsinstock from products p where p.productname like "%Filo%";
 
 --4. List the telephone numbers of all of our shippers.
 select s.shipperid, s.phone from shippers s;
 
-- 5. Who is our oldest employee? Who is our youngest employee?
select e.firstname, e.lastname, e.birthdate from employees e order by e.birthdate asc limit 1;

select e.firstname, e.lastname, e.birthdate from employees e order by e.birthdate desc limit 1;

--6. List the suppliers where the owner of the supplier is also the sales contact.
select s.companyname, s.contactname, s.contacttitle from suppliers s where s.contacttitle like "%owner%";

--7. Mailing Labels
--From the Northwind database we used in class and SQLite, create mailing labels for customer represen-
--tatives. Each label should consist of six, and exactly six, lines. The mailing labels should be suitable
--for printing on sticky label paper, specifically Avery 8160 labels. The format should be as follows:

--TITLE FIRSTNAME LASTNAME
--COMPANYNAME
--STREET ADDRESS
--CITY STATE ZIP COUNTRY
--[blank line]
--[blank line]
select contacttitle || ' ' || contactname || '
   ...> ' || companyname || '
   ...> ' || address || '
   ...> ' || city || ' ' || region || ' ' || postalcode || ' ' || country || '
   ...> ' || '
   ...> ' from customers where contacttitle like 'Sales Representative' and country like 'USA';
   
   --8. Telephone Book
--From the Northwind database we used in class and SQLite, create a telephone book for customer repre-
--sentatives. Each line in the telehone book should consist of the representative last name, representative
--First name, company name, and telephone number. Each row should look like this.
--Lastname, Firstname Middlename [tab] Company name [tab] phone number

select substr(contactname, instr(contactname, ' ')+1) || ', ' || substr(contactname, 1, instr(contactname, ' ') -1) || '     ' || companyname || '     ' || phone from customers;

