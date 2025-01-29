
--CLEANING- --NULL values--- FOR Item , Price_per_unit , Total_spent, Discount_ applied
---Replaced all NULL values with Zeros---

SELECT *
FROM dbo.retail_store_sales
WHERE Discount_Applied IS NOT NULL;


SELECT *
FROM dbo.retail_store_sales
WHERE Discount_Applied IS NULL;


UPDATE dbo.retail_store_sales
SET Discount_Applied = '0'
WHERE Discount_Applied IS NULL;


SELECT *
FROM dbo.retail_store_sales
WHERE Item IS NULL;


UPDATE  dbo.retail_store_sales
SET Item = 0
WHERE Item IS NULL;


UPDATE  dbo.retail_store_sales
SET Price_Per_Unit = 0
WHERE Price_Per_Unit  IS NULL;


UPDATE  dbo.retail_store_sales
SET Quantity = 0
WHERE Quantity IS NULL;


UPDATE  dbo.retail_store_sales
SET Total_Spent = 0
WHERE Total_Spent IS NULL;


SELECT DISTINCT category, Total_spent
FROM dbo.retail_store_sales;

SELECT *
FROM dbo.retail_store_sales;

 
 ----Selecting the  COUNT, MIN, MAX, AVG, AND SUM--- 

--Here im getting the total count of the sales
--The average price of the poducts bought
--The max spent 
--Also getting the highest and lowest total Quantity

SELECT COUNT (*)
FROM dbo.retail_store_sales AS total_count;


SELECT AVG(Price_Per_Unit)
FROM dbo.retail_store_sales AS avg_Price;


SELECT MAX(Total_Spent) AS max_spent
FROM dbo.retail_store_sales;


SELECT SUM(Quantity) AS total_quantity
FROM dbo.retail_store_sales;


SELECT MIN(Quantity) AS min_quantity
FROM dbo.retail_store_sales;


---SELECTING DISTINC VALUES---


SELECT APPROX_COUNT_DISTINCT(Item) AS total_items
FROM dbo.retail_store_sales;

 
SELECT DISTINCT(Category)
FROM dbo.retail_store_sales;


SELECT DISTINCT(Category)
FROM dbo.retail_store_sales;


SELECT DISTINCT *
FROM dbo.retail_store_sales;

----Filtering records using Where & Order & By---
 --IM filtering through the data looking for the total_spent using aggreget function to filter through it.--

SELECT *
FROM dbo.retail_store_sales
WHERE Total_Spent >= 50;


SELECT *
FROM dbo.retail_store_sales
WHERE Total_Spent < 25
ORDER BY Customer_Id;


SELECT Transaction_ID, Category, Customer_ID
FROM dbo.retail_store_sales
WHERE Total_Spent <= 300
ORDER BY Customer_ID;


SELECT *
FROM dbo.retail_store_sales
WHERE Category LIKE 'B%' 
ORDER BY Customer_ID;


SELECT * 
FROM dbo.retail_store_sales
WHERE Total_Spent BETWEEN 100 AND 200;

-- THIS IM USING THE GROUP BY & HAVING TO FILTER THE DATA---
--IM Selecting the total spent in each category by group by the category--


SELECT Category, COUNT(Total_Spent) AS Total_Spent
FROM dbo.retail_store_sales
GROUP BY Category
HAVING COUNT(Total_Spent)>= 0;


SELECT Category, AVG(Price_Per_Unit) AS avg_Price
FROM dbo.retail_store_sales
GROUP BY Category
HAVING AVG(Price_Per_Unit)> 0;

