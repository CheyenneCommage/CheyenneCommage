--Use Case: Employee Retention and Performance Analysis
-- in a Multinational Corporation-- 



SELECT * 
FROM dbo.Employee;


--List all unique education levels among employees--

SELECT DISTINCT Education
FROM dbo.Employee;


--Count the number of employees who joined in each year--

SELECT JoiningYear, COUNT(*) AS employee_count
FROM dbo.Employee
GROUP BY JoiningYear;


--Find the average of employees by payment Tier--


SELECT PaymentTier, AVG(Age) AS avg_age
FROM dbo.Employee
GROUP BY PaymentTier;


--Identify emplyees who left the company and their average experince.--

SELECT AVG(ExperienceInCurrentDomain) AS avg_experence
FROM dbo.Employee
Where LeaveOrNot = 'Yes';


--Find the city with highest number of employees--


SELECT TOP 1 City, COUNT(*) AS employee_count
FROM dbo.Employee
GROUP BY City;


--Determine the age and experience of employees across payment tiers.--


SELECT PaymentTier, Age, ExperienceInCurrentDomain
FROM dbo.Employee
ORDER BY PaymentTier;


--
