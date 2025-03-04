
SELECT *
FROM dbo.Sleep_health_and_lifestyle_dataset;


--What is the average sleep duration across all individuals--


SELECT AVG(Sleep_Duration) AS avg_sleep_duration
FROM dbo.Sleep_health_and_lifestyle_dataset;


--How many individuals are there in each BMI category--


SELECT BMI_Category, COUNT(*) AS bmi_count
FROM dbo.Sleep_health_and_lifestyle_dataset
GROUP BY BMI_Category;


--What is the Average heart rate for each gender--


SELECT Gender, AVG(Heart_Rate) AS avg_heart_rate
FROM dbo.Sleep_health_and_lifestyle_dataset
GROUP BY Gender;


--What is the Maximum Stress levels reported--


SELECT MAX(Stress_Level) AS max_stress
FROM dbo.Sleep_health_and_lifestyle_dataset;


--What percentage of individuals report sleep disorders--


SELECT 
    (COUNT( CASE
 WHEN Sleep_Disorder = 'YES' THEN 1 END) * 100.0 / COUNT(*)) AS percentage_with_sleep_disorder
FROM dbo.Sleep_health_and_lifestyle_dataset;


--List the average sleep quality for each age group--


SELECT
    CASE 
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        ELSE '46 and above'
    END AS age_group
    AVG(Quality_of_Sleep) AS average_sleep_quality
FROM dbo.Sleep_health_and_lifestyle_dataset
GROUP BY age_group
ORDER BY age_group;



--Which occupation has the highest average stress level--


SELECT Occupation, AVG(Stress_Level) AS avg_stress
FROM dbo.Sleep_health_and_lifestyle_dataset
GROUP BY Occupation 
ORDER BY avg_stress DESC;


--How does the Sleep quality vary by physical activity level--


SELECT Physical_Activity_Level, AVG(Quality_of_Sleep) AS avg_sleep_levels
FROM dbo.Sleep_health_and_lifestyle_dataset
GROUP BY Physical_Activity_Level
ORDER BY avg_sleep_levels ASC


--What is the average daily step count for individuals with sleep disorders--


SELECT Sleep_Disorder, AVG(Daily_Steps) AS avg_steps
FROM dbo.Sleep_health_and_lifestyle_dataset
GROUP BY Sleep_Disorder
ORDER BY avg_steps


--Find Individuals wiht sleep duration below the average and their coresponding stress levels--


WITH average_sleep_quality AS(
    SELECT AVG(Sleep_Duration) AS avg_sleep_duration
    FROM dbo.Sleep_health_and_lifestyle_dataset
)
SELECT Person_ID, Sleep_Duration, Stress_Level
FROM dbo.Sleep_health_and_lifestyle_dataset
WHERE Sleep_Duration < (SELECT avg_sleep_duration FROM average_sleep_quality);


--Find the top 5 indivduals in terms of daily steps who also have poor sleep quality--


SELECT Person_ID, Daily_Steps, Quality_of_Sleep
FROM dbo.Sleep_health_and_lifestyle_dataset
WHERE  Quality_of_Sleep < 4.5
ORDER BY Daily_Steps DESC;


--Calculate the average heart rate based on different stress levels--


WITH Heart_Rate AS (
    SELECT Stress_Level, 
    AVG(Heart_Rate) AS avg_heart_rate
    FROM dbo.Sleep_health_and_lifestyle_dataset
    GROUP BY Stress_Level
)
SELECT Stress_Level, Heart_Rate
FROM dbo.Sleep_health_and_lifestyle_dataset
ORDER BY Stress_Level;


--What is the distrubution of sleep quility ratings among differnt age groups--


SELECT Stress_Level, Quality_of_Sleep, COUNT(Person_ID) AS num_of_people
FROM dbo.Sleep_health_and_lifestyle_dataset
WHERE Stress_Level > 4.5
    AND Quality_of_Sleep < 4.5
GROUP BY Stress_Level, Quality_of_Sleep;















