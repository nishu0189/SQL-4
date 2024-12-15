
--JOIN

create table orders(id int, 
name varchar(30),or_date date , sales int, region varchar(30) , category varchar(10), ship_date date, city varchar(10),ship_mode varchar(10));

 -- drop table orders 
 -- drop table  returns
   select * from   orders
 INSERT INTO orders (id, name, or_date, sales, region, category, ship_date, city ,ship_mode) VALUES
(1, 'Laptop1', '2019-10-01', 1500, 'North', 'A', '2019-10-05', 'Delhi','upi'),
(1, 'Laptop2', '2019-05-05', 8800, 'East', 'A', '2019-05-09', 'Mumbai','cash'),
(3, 'Tablet', '2019-11-10', 600, 'South', 'B', '2019-11-15', 'Pune','upi'),
(4, 'Headphones', '2024-03-12', 200, 'West', 'A', '2024-03-16', 'Mumbai','cash'),
(5, 'Smartwatch', '2020-10-15', 300, 'North', 'B', '2020-10-19', 'Delhi','cash'),
(6, 'Monitor', '2024-12-20', 1200, 'East', 'A', '2024-12-24', 'Mumbai','upi'),
(7, 'Keyboard', '2019-07-25', 100, 'South', 'B', '2019-07-30', 'Pune','cash'),
(8, 'Mouse', '2024-10-28', 50, 'West', 'C', '2024-11-02', 'Pune','card'),
(9, 'Printer', '2024-11-01', 700, 'North', 'B', '2024-11-06', 'Delhi','upi'),
(10, 'Router', '2024-02-05', 150, 'South', 'C', '2024-02-10', 'Pune','card'),
(20, 'charger', '2024-11-05', 1300, 'west', 'C', '2024-11-10', 'Pune','card'),
(25, 'cable', '2024-12-05', 100, 'South', 'B', '2024-12-10', 'Mumbai','upi'),
(30, 'cover', '2024-10-05', 150, 'North', 'C', '2024-10-10', 'Delhi','cash');

create table returns(id int, 
reason varchar(30),
or_date date);
 
  select * from   returns
INSERT INTO returns (id, reason, or_date) VALUES
(1, 'Defective', '2019-10-10'), 
(2, 'Wrong Item', '2019-05-15'), 
(3, 'Damaged', '2019-11-20'),  
(4, 'Customer Change', '2024-03-20'),
(5, 'Defective', '2020-10-25'), 
(6, 'Wrong Item', '2024-12-30'),
(7, 'Damaged', '2019-08-05'),  
(10, 'Wrong Item', '2024-02-15'), 
(15, 'Customer Change', '2024-11-15'), 
(16, 'Defective', '2024-11-05');

--BY DEFAULT JOIN consider as the INNER join
select o.*,r.id,  r.reason  
from orders o
join returns r on o.id = r.id;
---------SAME (OR)--------

--INNER JOIN and ALL col of Orders 
select o.*,r.id,  r.reason  
from orders o
inner join returns r on o.id = r.id;

--INNER JOIN and ONLY order id from orders table and reason from returns
select o.id , o.name, r.reason 
from orders o
inner join returns r on o.id = r.id;

--INNER and  GROUP BY
Select r.reason , sum(sales)  --if we have also sales col in RETURN table then we will use like sum(r.sales)
from orders o
inner join returns r on o.id = r.id
group by r.reason;

Select r.reason , sum(sales) --Ensures that all records from the right table are included,--even if there are no matching records in the left table.
from orders o
right join returns r on o.id = r.id
group by r.reason;

Select * from orders o    --will show null value if left table have not like aright table 
right join returns r on o.id = r.id;

--LEFT JOIN Ensures that all records from the left table are included,
--even if there are no matching records in the right table.

Select o.* , r.reason
from orders o 
left join returns r on  o.id = r.id;

--all the records which are not present in returns table
Select o.*, r.reason
from orders o  --1
left join returns r on o.id = r.id  --2
where r.id is null; --3

-------------------------------------JOINING OF 2 TABLE---------------------------------------------------------------
Create table emp(e_id int, name varchar(30), dept_id int, salary int,manager_id  int, age int);

--drop table emp
INSERT INTO emp (e_id, name, dept_id, salary, manager_id, age) VALUES
(1, 'John', 200, 50000, 102, 25),
(11, 'siya' ,200, 50000, 102, 20),
(1, 'John', 100, 75000, 101, 29),
(23, 'nima',500, 60000, 103, 30),
(2, 'Emma', 300, 60000, 103, 30),
(3, 'Mike', 400, 55000, 104, 35),
(4, 'Sara', 100, 75000, 101, 40),
(5, 'Tom', 200, 52000, 102, 28),
(6, 'Anna', 300, 61000, 103, 32),
(7, 'Jake', 400, 58000, 104, 45),
(8, 'Linda', 100, 68000, 101, 29),
(9, 'Chris', 200, 72000, 102, 34),
(10, 'Nina', 300, 57000, 103, 27);

create table dept(dept_id int, dept_name varchar(30));
INSERT INTO dept (dept_id, dept_name) VALUES
(100, 'HR'),
(200, 'Finance'),
(300, 'IT'),
(500, 'Sales');
--drop table dept
select * from emp;
select * from dept;

--------JOINS--------( CROSS JOIN)
select * from         --A CROSS JOIN produces the Cartesian product of two tables.
emp, dept             --Every row from the first table is combined with every row from the second table.        
order by emp.e_id;
----OR (also can write)-----------

Select * from emp
inner join  dept on 1=1  -- 1 is eqaul to 1 is always true so the same output as above ..their can be any thing 100=100 or 30=30 
order by emp.e_id;

select * from emp e
right join dept d on e.dept_id = d.dept_id;
--OR SAME THING
select * from dept d
left join emp e on e.dept_id = d.dept_id;

---- FULL OUTER JOIN ---all the common row + extra data on Left +  extra data on Right
select e.name, e.dept_id,  d.dept_id  --When you want all data, even if some rows don't match
from emp e
FULL OUTER JOIN  dept d  on e.dept_id = d.dept_id;

-------------------------------------JOINING OF 3 TABLE---------------------------------------------------------------

create table Head(dept varchar(30) , man_Name varchar(30));  -- regional manager

Insert into Head(dept , man_Name)
values( 'IT', 'sam'),
('Finance', 'Nishu'),
('HR', 'Avi'),
('Sales', 'radha');

--we can join the 3rd table with any table before that 3rd table 
Select e.dept_id ,d.dept_id, d.dept_name ,h.dept, h.man_Name
from emp e
inner join dept d on e.dept_id = d.dept_id
inner join Head h on h.dept = d.dept_name -- Head table can be join any table like dept or emp before 



 ----------------------------- QUESTIONS ----------------------------------------------------------

----- Q1- write a query to get region wise count of return orders

Select  o.region , r.id   --for more reference and understanding
From orders o 
inner join returns r on o.id = r.id;

Select o.region ,  count(*)  --OR count(r.id)
From orders o 
inner join returns r on o.id = r.id
Group by  o.region ;

----Q2- write a query to get category wise sales of orders that were not returned
Select o.region , o.id, o.sales , r.id  --for more reference and understanding
From orders o
Left join returns r on r.id = o.id

Select o.region , sum(sales) --5  --ans of 2nd question
From orders o  --1
Left join returns r on r.id = o.id --2
where r.id is NULL --3
Group by o. region;  --4

--Q3- write a query to print dep name and average salary of employees in that dep
Select d.dept_name, avg(e.salary)
From dept d
Left join emp e on e.dept_id = d.dept_id
Group by d.dept_name;

--Q4- write a query to print dep names where none of the emplyees have same salary.
Select d.dept_name  
From dept d 
Left join emp e on e.dept_id = d.dept_id
Group by d.dept_name
Having count(distinct e.salary) = count(*);

--Q5- write a query to print sub categories where we have all 3 kinds of returns (others, bad quality, wrong items)

Select o.category
From orders o
 Left join returns r on o.id = r.id
Where r.reason in ('Defective', 'Damaged','Wrong Item')
Group by o.category
Having count(distinct r.reason) = 3

select * from orders
select * from returns

-- Q6- write a query to find cities where not even a single order was returned
Select o.city   -- no city in table.. just query no real execution 
From order 
Left join returns r on o.id = r.id
Group by o.city
Having count(r.id) = 0;

--Q7- write a query to find top 3 subcategories by sales of returned orders in east region?

Select top 3 o.category 
From orders o
inner join returns r on o.id= r.id
Where o.region = 'east'
group by o.category 

-- Q8- write a query to print dep name for which there is no employee.
select * from emp 
select * from dept

select d.dept_name 
from dept d
left join emp e on d.dept_id = e.dept_id
where e.e_id is NULL


--Q9- write a query to print employees name for dep id is not avaiable in dept table
select e.name 
from emp e
left join dept d on e.dept_id = d.dept_id
where d.dept_id is Null;