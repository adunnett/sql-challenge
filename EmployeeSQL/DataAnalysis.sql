--DATA ANALYSIS
--1. Employee details: Employee Number, Last Name, First Name, Sex, Salary.
Select Employees.emp_no, Employees.last_name, Employees.first_name, Employees.sex, Salaries.salary
FROM Employees
INNER JOIN salaries ON
Employees.emp_no = Salaries.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.
Select first_name, last_name, hire_date
FROM Employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- 3. Dept Managers: dept_no, dept_name, emp_no, last name, first name.
Select Department_Manager.dept_no, Departments.dept_name, Department_Manager.emp_no, Employees.last_name, Employees.first_name
FROM Department_Manager
INNER JOIN Departments ON
Department_Manager.dept_no = Departments.dept_no
INNER JOIN Employees ON
Department_Manager.emp_no = Employees.emp_no;

--4. Dept employees: emp_no, last name, first name, and dept_name.
Select Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
FROM Employees
INNER JOIN Department_Employees ON
Employees.emp_no = Department_Employees.emp_no
Inner JOIN Departments ON
Departments.dept_no = Department_Employees.dept_no;

--5. first name, last name, and sex for employees w/first name "Hercules" and last names begin with "B."
Select first_name, last_name, sex
FROM Employees
WHERE first_name = 'Hercules'
AND last_name like 'B%';

--6. employees in the Sales department, incl their emp_no, last name, first name, and dept_name.
Select Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
FROM Employees
INNER JOIN Department_Employees ON
Employees.emp_no = Department_Employees.emp_no
Inner JOIN Departments ON
Departments.dept_no = Department_Employees.dept_no
WHERE Departments.dept_name LIKE 'Sales';

--7. employees in  Sales and Development departments, incl their emp_no, last name, first name, and dept_name
Select Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
FROM Employees
INNER JOIN Department_Employees ON
Employees.emp_no = Department_Employees.emp_no
Inner JOIN Departments ON
Departments.dept_no = Department_Employees.dept_no
WHERE Departments.dept_name LIKE 'Sales' OR Departments.dept_name LIKE 'Development';

--8. descending order, frequency count of employee last names
SELECT COUNT(emp_no), last_name FROM Employees
GROUP BY last_name
ORDER BY count DESC;