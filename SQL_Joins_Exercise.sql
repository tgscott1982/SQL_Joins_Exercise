/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 SELECT products.Name, categories.Name FROM products INNER JOIN categories
 ON products.CategoryID = categories.CategoryID WHERE categories.Name = "Computers";
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 SELECT products.Name, products.Price, reviews.Rating FROM products INNER JOIN reviews ON
 products.ProductID = reviews.ProductID WHERE Rating = 5;
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT e.FirstName FName, e.LastName LName, sum(s.Quantity) QtySold FROM employees e
INNER JOIN sales s ON e.EmployeeID = s.EmployeeID GROUP BY e.EmployeeID
ORDER BY sum(s.Quantity) DESC LIMIT 5; -- just trying out aliases to see if I have it figured out
/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT d.Name DeptName, c.Name CatName FROM categories c INNER JOIN departments d ON d.DepartmentID = c.DepartmentID
WHERE c.Name = "Appliances" OR c.Name = "Games";
/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT p.Name ProdName, sum(s.quantity) QtySold, (s.PricePerUnit*sum(s.Quantity)) TtlPriceSold FROM products p INNER JOIN sales s 
ON p.ProductID = s.ProductID WHERE p.Name LIKE "Eagles%";
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT p.Name ProdName, r.Reviewer Reviewer, r.Rating Rating, r.Comment Comment FROM products p INNER JOIN reviews r
ON p.ProductID = r.ProductID WHERE p.Name = "Visio TV" AND r.Rating = 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
SELECT e.employeeID EID, e.FirstName FN, e.LastName LN, p.Name Product, s.Quantity Qty, (s.PricePerUnit*s.Quantity) TtlSale FROM employees e INNER JOIN 
sales s ON e.EmployeeID = s.EmployeeID INNER JOIN products p ON p.ProductID = s.ProductID ORDER BY FN ASC, Qty DESC;
-- added total price of each product sold, logic that if it's sales report, possibly being used for review
-- 10 sales of cheap items is less impressive than 2 cheap and 8 expensive. I also ordered them by first name, then by
-- quantity sold. If going through a review, you may or may not be looking at an alphabetical list, this would make it.
-- grouping them any other way seems to only list most expensive items sold per employee versus all products sold per employee
-- easier to get started