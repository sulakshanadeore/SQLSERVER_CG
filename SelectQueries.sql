use northwind
go

select * from  sys.tables

--select statement with all 5 clauses
/*select  col/cols from tablename
where
having
GROUP by
order by*/


select * from Customers

--single column, all rows
select CompanyName from Customers

select CompanyName,CustomerID from Customers

select CompanyName,ContactName,country from Customers

--find the customers who are from the Germany
select CompanyName,ContactName,country from Customers
where Country like 'Germany'

select CompanyName,ContactName,country from Customers
where Country = 'Mexico'

select CompanyName,ContactName,country from Customers
where Country like 'Mexico'



---fetch the customer from Mexico and Germany
select * from  Customers
where country ='Mexico' or country='Germany'

select * from  Customers
where country in ('Mexico','Germany')

---fetch all customers except Mexico and Germany
select * from  Customers
where country not in ('Mexico','Germany')


---fetch the customer from Mexico and Germany and having job as Sales Representative
select * from  Customers
where (country ='Mexico' or country='Germany') and ContactTitle='Sales Representative'

--like=string,= for numbers,in or , and for both conditions true

select * from Products
where UnitPrice=18


select * from Products
where UnitPrice>=18
order by UnitPrice

--no output becoz unitprice doesnot contain 18 and 40 in a a single cell
select ProductName,UnitPrice from Products
where UnitPrice=18 and UnitPrice=40
order by UnitPrice

--proudcts whose price is 18 or 40
select productname,unitprice from Products
where UnitPrice=18 or UnitPrice=40
order by UnitPrice

---between is inclusive operator(for ranges use between)
select ProductName,UnitPrice from Products
where UnitPrice between 18 and 40
order by UnitPrice

---not between fetches data except the specified range
select ProductName,UnitPrice from Products
where UnitPrice not between 18 and 40
order by UnitPrice

----between operator can be used with dates
select * from [Order Details]
--date is treated as a string-- so use like
select * from Orders
where OrderDate like '1996-07-04'

select OrderDate from orders
where datepart(yyyy,OrderDate) like '1996'

---list all orders except year 1996
select OrderDate from orders
where datepart(yyyy,OrderDate) not like '1996'



select OrderDate from orders
where datepart(MM,OrderDate) like '01' or datepart(yyyy,OrderDate) like '1997'

select OrderDate from orders
where datepart(yyyy,OrderDate) like '1997'

select * from orders
where orderdate=DATEFROMPARTS(1997,01,15)

select * from orders
where OrderDate between '1996-01-01' and '1997-12-31'
order by OrderDate

select * from orders
where CustomerID between 'AROUT' and 'ERNSH'
order by CustomerID desc


select unitprice from products
order by UnitPrice

select min(unitprice) from Products
select max(unitprice) from Products
select avg(unitprice) from Products
select sum(unitprice) from Products
select count(unitprice) from Products

select * from Products
select count(unitsonorder) from products
select count(*) from products

select count(*) from Customers

---count will always count only not null row values
----how many customers have a region
select count(region) from Customers

--how many customers donot have a region
select 91-31

--number of customers who donot have region
select  (count(*) - count(region)) from customers 
        --totalrows- available rows

select * from Customers
---group by works with aggregate funtions(min,max,sum,count,avg)
---group the data of identical values
---group the country data and count the customers in  that country
Germany----30
Mexico--20
Switzwerland -10

select country,count(country) from customers
group by country


select * from Products

--count the products in each category
select categoryid,count(productid) from products
group by CategoryID

--count the products supplied by each supplier
supplierid count(productSid)
    1				2
	2			10
	3			13
select SupplierID,count(productid) from Products
group by SupplierID




---count the products by unit price
unitprice  count(productid)
18          10
19          1

select unitprice,count(productid) from Products
group by UnitPrice

select * from Employees

---group the employees by thier city

select city,count(EmployeeID) as employeeCount from Employees
group by city

select city,region,count(employeeid) as employeecount from Employees
group by city,region


select * from [Order Details]

select orderId, ProductId, UnitPrice, Quantity,discount, UnitPrice * Quantity as ValueBeforeDiscount, 
(Quantity * UnitPrice) - ((Quantity*UnitPrice) * Discount)/100 afterdiscount from [Order Details]
 

 select orderId, ProductId,  UnitPrice * Quantity as ValueBeforeDiscount, 
sum((Quantity * UnitPrice) - ((Quantity*UnitPrice) * Discount)/100) as  afterdiscount from [Order Details]
group by orderId, ProductId,  UnitPrice * Quantity


 select orderId, ProductId, 
sum((Quantity * UnitPrice) - ((Quantity*UnitPrice) * Discount)/100) as  afterdiscount from [Order Details]
group by orderId, ProductId


select orderId, sum(UnitPrice * Quantity) as ValueBeforeDiscount,
sum((Quantity * UnitPrice) - ((Quantity*UnitPrice) * Discount)/100) as  afterdiscount from [Order Details]
group by orderId
order by  ValueBeforeDiscount

---if group by is used then only use having, having means filtering the grouped data

---filter the data on valuebeforediscount, ie display only the order whose valuebeforediscount=>100
select orderId, sum(UnitPrice * Quantity) as ValueBeforeDiscount,
sum((Quantity * UnitPrice) - ((Quantity*UnitPrice) * Discount)/100) as  afterdiscount from [Order Details]
group by orderId
having  sum(UnitPrice * Quantity) between 100 and 150
order by  ValueBeforeDiscount




----if u used group by then only use having






 
































