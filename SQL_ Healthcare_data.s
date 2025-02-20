

SELECT * 
FROM dbo.healthcare_dataset;

--Update the table to only show 2 decimals place.--

UPDATE dbo.healthcare_dataset
SET Billing_Amount = ROUND(Billing_Amount, 2);

--List all patients names and ages--

SELECT Name, Age
FROM dbo.healthcare_dataset;

--Count Total Number of Patients--

SELECT COUNT(*) AS total_num_patients
FROM dbo.healthcare_dataset;

--Retrieve the names of patients who have Diabetes--

SELECT Name
FROM dbo.healthcare_dataset
WHERE Medical_Condition = 'diabetes';


--Find the average billing amount for all patients--


SELECT AVG(Billing_Amount) AS avg_billing
FROM dbo.healthcare_dataset;


--Get Distinct blood types present in patients--

SELECT DISTINCT Blood_type
FROM dbo.healthcare_dataset;


--Count the number of patients ademitted to each hospital

SELECT Hospital, COUNT(*) AS patient_count
FROM dbo.healthcare_dataset
GROUP BY Hospital;


--What are the names and age of patients who were admitted after 2022-01-01--


SELECT Name, Age
FROM dbo.healthcare_dataset
WHERE Date_of_Admission > '2022-01-01';


--Find the total billing amount for each insuarnce provider--


SELECT Insurance_provider, SUM(Billing_Amount) AS total_billing
FROM dbo.healthcare_dataset
GROUP BY Insurance_Provider;


--List all the patients who were discharged and their corresponding discharged dates--


SELECT Name, Discharge_Date
FROM dbo.healthcare_dataset
WHERE Discharge_Date IS NOT NULL

--Determine the percentage of male and female patients--


SELECT Gender
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM dbo.healthcare_dataset) AS PERCENTAGE
  From dbo.healthcare_dataset
GROUP BY Gender

--Find the average age of patients by the medical condition--


SELECT Medical_Condition, AVG(Age) AS avg_age
FROM dbo.healthcare_dataset
GROUP BY Medical_Condition;


--List Doctors who have treated the highest number of patients--


SELECT TOP 10 Doctor, COUNT(*) AS patient_count
FROM dbo.healthcare_dataset
GROUP BY Doctor
ORDER BY patient_count DESC;


--Identify patients who have been admitted more than once--

SELECT Name, COUNT (*) AS admission_count
FROM dbo.healthcare_dataset
GROUP BY Name
HAVING COUNT(*) > 1;

--Retrieve the total billing amount and average length of stay for each room number--

SELECT Room_Number,     
    SUM(Billing_Amount) AS Total_Billing,
    AVG(DATEDIFF(day,
Date_of_Admission, Discharge_Date)) AS average_legnth_stay
FROM dbo.healthcare_dataset
GROUP BY Room_Number;


--Find the most common medical conditions among patients with blood type o+--


SELECT Medical_Condition, COUNT (*) AS condition_count
FROM dbo.healthcare_dataset
WHERE Blood_Type = 'O+'
GROUP BY Medical_Condition
ORDER BY condition_count DESC;

--Show the average billing amoutn by admission type and medical condition--


SELECT Admission_Type, Medical_Condition, AVG(Billing_Amount) AS avg_billing
FROM dbo.healthcare_dataset
GROUP BY Admission_Type, Medical_Condition
ORDER BY Admission_Type, Medical_Condition;

--Identify any correlations between age, medical conditions, and averge billing amounts--

SELECT Medical_Condition, AVG(Age) AS avg_age, AVG(Billing_Amount) AS avg_billing
FROM dbo.healthcare_dataset
GROUP BY Medical_Condition
ORDER BY avg_billing DESC














