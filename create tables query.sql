CREATE DATABASE IF NOT EXISTS company_management;
USE company_management;
CREATE TABLE IF NOT EXISTS Departments (
    DeptID INT PRIMARY KEY AUTO_INCREMENT,
    DeptName VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS Employees (
    EmpID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Age INT,
    Gender ENUM('Male', 'Female', 'Other'),
    DepartmentID INT,
    HireDate DATE,
    Salary DECIMAL(10,2),
    CONSTRAINT fk_department FOREIGN KEY (DepartmentID) REFERENCES Departments(DeptID)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS Salaries (
    SalaryID INT PRIMARY KEY AUTO_INCREMENT,
    EmpID INT,
    Salary DECIMAL(10,2),
    EffectiveDate DATE,
    CONSTRAINT fk_salary_employee FOREIGN KEY (EmpID) REFERENCES Employees(EmpID)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS Projects (
    ProjectID INT PRIMARY KEY AUTO_INCREMENT,
    ProjectName VARCHAR(100) NOT NULL,
    DepartmentID INT,
    StartDate DATE,
    EndDate DATE,
    CONSTRAINT fk_project_department FOREIGN KEY (DepartmentID) REFERENCES Departments(DeptID)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS Tasks (
    TaskID INT PRIMARY KEY AUTO_INCREMENT,
    ProjectID INT,
    EmpID INT,
    TaskName VARCHAR(100),
    AssignedDate DATE,
    DueDate DATE,
    Status ENUM('Pending', 'In Progress', 'Completed'),
    CONSTRAINT fk_task_project FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID),
    CONSTRAINT fk_task_employee FOREIGN KEY (EmpID) REFERENCES Employees(EmpID)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS Attendance (
    AttendanceID INT PRIMARY KEY AUTO_INCREMENT,
    EmpID INT,
    Date DATE,
    Status ENUM('Present', 'Absent', 'Leave'),
    CONSTRAINT fk_attendance_employee FOREIGN KEY (EmpID) REFERENCES Employees(EmpID)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS Training (
    TrainingID INT PRIMARY KEY AUTO_INCREMENT,
    EmpID INT,
    TrainingName VARCHAR(100),
    StartDate DATE,
    EndDate DATE,
    CONSTRAINT fk_training_employee FOREIGN KEY (EmpID) REFERENCES Employees(EmpID)
) ENGINE=InnoDB;

