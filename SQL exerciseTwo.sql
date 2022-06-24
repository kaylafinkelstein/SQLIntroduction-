/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
select p.Name as product, c.name as category
from products as P
inner join categories as c on c.categoryid = p.categoryid
where c.name = 'Computers';
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
select p.name, p.price, r.rating
from products as p
inner join reviews as r on r.productID = p.productID
where r.rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
select e.FirstName, e.LastName, sum(s.Quantity) as total 
from sales as s 
inner join employees as e on e.employeeid = s.employeeid
group by e.employeeID;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
select d.name as 'department name', c.name as 'category name' from departments as d 
inner join categories as c on c.departmentid = d.departmentid
where c.name = 'appliances' or c.name = 'games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 select p.name, sum(s.Quantity) as 'total sold', sum(s.Quantity * s.PricePerUnit) as 'total price'
 from products as p
 inner join sales as s on s.ProductID = p.ProductID
 where p.ProductID = 97;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
select p.Name, r.Reviewer, r.Rating, r.Comment 
from reviews as r
inner join products as p on r.ProductID = p.ProductID
where p.name  = 'Visio TV' and r.rating = 1;



-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
select e.FirstName, e.LastName, e.employeeID, p.Name, sum(s.Quantity) as 'TotalProductSold'
from sales as s 
inner join employees as e on e.EmployeeID = s.EmployeeID
inner join products as  p on p.ProductID = s.ProductID
group by e.EmployeeID, p.ProductID
order by TotalProductSold desc;
