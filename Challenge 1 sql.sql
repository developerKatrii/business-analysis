SELECT Name, Salary, 
    CASE 
        WHEN Salary < 50000 THEN 'Low'
        WHEN Salary BETWEEN 50000 AND 100000 THEN 'Medium'
        ELSE 'High'
    END AS SalaryRange
FROM Employees;

-- Count how many employees are in each department.
select departmentID, count(*) as Total_count
from employees
group by departmentID;
-- if you need to include dept also

select d.DeptID, d.DeptName , count(*) as total_count FROM 
Employees e JOIN Departments d ON
d.DeptID=e.departmentID
group by d.DeptID;

-- •	Find the average salary for each department.
SELECT d.DeptID,d.DeptName, avg(e.salary) as Average_Salary
FROM Employees e JOIN Departments d ON
d.DeptID=e.DepartmentID
group by d.DeptID;

-- •	Get the highest and lowest salaries among all employees.

SELECT min(salary) AS lowest_salary, max(salary) AS highest_salary
FROM Employees;

-- If u need the names of employees with least and highest salary
-- Here we use RANK() OVER instead of ROW_NUMBER() function.
-- Why is RANK() Used Instead of ROW_NUMBER()?
-- RANK()	Gives the same rank to employees with identical salaries (e.g., multiple employees having the lowest salary).
-- ROW_NUMBER()	Assigns a unique rank to each employee, even if they have the same salary.

WITH SalaryRank AS (
    SELECT Name, Salary, 
           RANK() OVER (ORDER BY Salary ASC) AS MinRank,
           RANK() OVER (ORDER BY Salary DESC) AS MaxRank
    FROM Employees
)
SELECT Name, Salary 
FROM SalaryRank
WHERE MinRank = 1 OR MaxRank = 1;

-- •	Retrieve a list of employees with their department names.

SELECT  d.DeptID,e.Name
FROM Employees e JOIN Departments d
ON e.departmentID=d.DeptID;


-- •	Find employees who have been assigned to a project, using INNER JOIN.
Select e.departmentID,e.Name, p.ProjectName
FROM Employees e JOIN Projects p
ON e.departmentID=p.DepartmentID;

-- •	Get all employees and their departments, including employees 
-- who haven’t been assigned to any department (Use LEFT JOIN).

-- LEFT join means gets all datas from left table although it doesnt have any value in the other dept table  in addition to desired columns too
-- If we had used INNER JOIN, employees without departments would have been excluded from the result.
INSERT INTO Employees (EmpID, Name, DepartmentID) VALUES (6, 'David Miller', NULL);

SELECT e.EmpID,e.Name,d.DeptID
FROM Employees e LEFT JOIN Departments d
ON e.departmentID=d.DeptID
WHERE d.DeptID is NULL;

SELECT e.EmpID,e.Name,d.DeptID
FROM Employees e RIGHT JOIN Departments d
ON e.departmentID=d.DeptID;

-- List employees who haven’t been assigned to any task (Use LEFT JOIN with Tasks table).
SELECT e.EmpID,e.Name,t.TaskName
FROM Employees e LEFT JOIN Tasks t
ON e.EmpID=t.EmpID
WHERE t.TaskName is NULL;

-- Find employees who have a higher salary than the average salary of all employees.
SELECT Name,Salary from Employees
WHERE salary>(SELECT avg(salary) FROM Employees);

-- Retrieve the names of employees who have not attended any training programs

SELECT e.Name
FROM Employees e LEFT JOIN training tr
ON e.EmpID=tr.EmpID
WHERE tr.TrainingName is NULL;

-- Using subquery concept
-- Here SELECT 1 is used instead of SELECT * 
-- ✅ Performance Optimization:

-- The database only checks for the existence of a row, so we don’t need to retrieve all columns (*).
-- SELECT 1 is faster because it’s a constant value and doesn’t load unnecessary data.
-- ✅ Readability & Convention:

-- SELECT 1 clearly shows that we are only checking for existence, not retrieving actual data.
-- This is a best practice in SQL query writing.


SELECT Name 
FROM Employees e
WHERE NOT EXISTS (
    SELECT 1 FROM Training tr WHERE tr.EmpID = e.EmpID
);


-- Get the employee who has the maximum salary in each department.
SELECT Name,DepartmentID,Salary FROM Employees WHERE (Name,DepartmentID, Salary) IN 
(SELECT Name, DepartmentID ,MAX(Salary) FROM Employees
GROUP BY DepartmentID );

-- . Set Operations: UNION, INTERSECT, and EXCEPT
--  •	List all employees and project names from the Employees and Projects tables.

SELECT 
    Name AS Employees, NULL AS ProjectName
FROM
    Employees 
UNION SELECT 
    NULL AS Employee, ProjectName
FROM
    Projects;

-- Get a list of employees who are either assigned to a task or a training program (Using UNION)
SELECT e.Name
FROM Employees e
JOIN Tasks t ON e.EmpID = t.EmpID
UNION
SELECT e.Name
FROM Employees e
JOIN Training tr ON e.EmpID = tr.EmpID;

-- Find employees who have been assigned to a task but not to a project (Use EXCEPT).
SELECT e.Name
FROM Employees e
JOIN Tasks t ON e.EmpID = t.EmpID
LEFT JOIN Projects p ON e.EmpID = p.EmpID
WHERE p.EmpID IS NULL;






