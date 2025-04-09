INSERT INTO Departments (DeptName) VALUES
('HR'),
('Finance'),
('IT'),
('Sales'),
('Marketing');

INSERT INTO Employees (Name, Age, Gender, DepartmentID, HireDate, Salary) VALUES
('John Doe', 35, 'Male', 1, '2015-06-01', 75000.00),
('Jane Smith', 29, 'Female', 2, '2018-09-15', 85000.00),
('Robert Brown', 40, 'Male', 3, '2017-11-30', 95000.00),
('Emily Davis', 32, 'Female', 4, '2020-02-10', 60000.00),
('Michael Wilson', 25, 'Male', 5, '2021-08-05', 70000.00);

INSERT INTO Salaries (EmpID, Salary, EffectiveDate) VALUES
(1, 70000.00, '2020-01-01'),
(1, 75000.00, '2021-01-01'),
(2, 80000.00, '2016-01-01'),
(2, 85000.00, '2017-01-01'),
(3, 90000.00, '2018-01-01'),
(4, 65000.00, '2020-02-10'),
(5, 70000.00, '2021-08-05');

INSERT INTO Projects (ProjectName, DepartmentID, StartDate, EndDate) VALUES
('HR Automation', 1, '2020-01-01', '2021-01-01'),
('Finance Revamp', 2, '2019-06-15', '2020-12-31'),
('IT Infrastructure', 3, '2021-05-20', '2022-06-15'),
('Sales Strategy', 4, '2021-01-10', '2021-12-31'),
('Marketing Campaign', 5, '2022-03-01', '2023-03-01');

INSERT INTO Tasks (ProjectID, EmpID, TaskName, AssignedDate, DueDate, Status) VALUES
(1, 1, 'Onboard HR system', '2020-01-10', '2020-02-10', 'Completed'),
(2, 2, 'Budget Analysis', '2019-07-01', '2020-12-01', 'In Progress'),
(3, 3, 'Infrastructure Setup', '2021-06-01', '2022-06-01', 'Pending'),
(4, 4, 'Sales Report', '2021-01-20', '2021-02-20', 'Completed'),
(5, 5, 'Ad Campaign', '2022-03-05', '2022-06-05', 'In Progress');


INSERT INTO Attendance (EmpID, Date, Status) VALUES
(1, '2022-03-01', 'Present'),
(2, '2022-03-01', 'Absent'),
(3, '2022-03-01', 'Leave'),
(4, '2022-03-01', 'Present'),
(5, '2022-03-01', 'Present');

INSERT INTO Training (EmpID, TrainingName, StartDate, EndDate) VALUES
(1, 'Leadership Training', '2020-05-01', '2020-05-15'),
(2, 'Finance Management', '2019-09-10', '2019-09-25'),
(3, 'IT Security', '2021-06-01', '2021-06-15'),
(4, 'Sales Mastery', '2021-01-05', '2021-01-20'),
(5, 'Marketing Trends', '2022-03-05', '2022-03-15');




