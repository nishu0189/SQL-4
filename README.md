# SQL-4

---------------------------------------------TABLE ORDERS ------------------------------------------------------------------------

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

---------------------------------------------TABLE RETURNS ------------------------------------------------------------------------
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

-------------------------------------------------------TABLE EMP ------------------------------------------------------------------------


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


---------------------------------------------------TABLE DEPT ------------------------------------------------------------------------

create table dept(dept_id int, dept_name varchar(30));
INSERT INTO dept (dept_id, dept_name) VALUES
(100, 'HR'),
(200, 'Finance'),
(300, 'IT'),
(500, 'Sales');

---------------------------------------------------TABLE HEAD ------------------------------------------------------------------------

create table Head(dept varchar(30) , man_Name varchar(30));  -- regional manager

Insert into Head(dept , man_Name)
values( 'IT', 'sam'),
('Finance', 'Nishu'),
('HR', 'Avi'),
('Sales', 'radha');
