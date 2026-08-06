USE hr;
 select *from`wa_fn-usec_-hr-employee-attrition`;
 create table hr like `wa_fn-usec_-hr-employee-attrition`;
 insert hr select* from`wa_fn-usec_-hr-employee-attrition`;
 select*from hr;
 
Alter table `wa_fn-usec_-hr-employee-attrition` 
rename column `ï»¿Age` TO Age;
select*from hr;


-- 1. Rank Employees Based on Monthly Income Within Each Department Using ROW_NUMBER()--

SELECT
    `Employee Number`,
    `Department`,
    `Monthly Income`,
    ROW_NUMBER() OVER (
        PARTITION BY `Department`
        ORDER BY `Monthly Income` DESC
    ) AS Row_Num
FROM hr;


-- 2. Rank Employees Based on Salary Within Each Department Using RANK()--

SELECT
`Employee Number`,
`Department`,
`Job Role`,
`Monthly Income`,
    RANK() OVER(
        PARTITION BY `Department`
        ORDER BY `Monthly Income` DESC
    ) AS Salary_Rank
FROM hr;


-- 3. Compare Employee Salary With Previous Employee Salary Using LAG()--

SELECT
    `Employee Number`,
    `Department`,
    `Monthly Income`,
    LAG(`Monthly Income`) OVER(
        PARTITION BY `Department`
        ORDER BY `Monthly Income`
    ) AS Previous_Employee_Salary
FROM hr;

-- 4. Rank Employees Based on Experience Within Each Department Using DENSE_RANK()--

SELECT
    `Employee Number`,
    `Department`,
    `Total working years`,
    DENSE_RANK() OVER(
        PARTITION BY `Department`
        ORDER BY `Total working years` DESC
    ) AS Experience_Rank
FROM hr;

-- 5. Calculate Total Number of Employees--

select count(*) as `Total employees` from hr;

-- 6. Calculate Number of Employees Who Left the Company--

select count(*) as `Employees left` from hr
where Attrition='yes';

-- 7. Calculate Number of Active Employees--

select count(*) as ` Active Employees` from hr
where Attrition='No';

-- 8. Calculate Overall Employee Attrition Rate--

SELECT
ROUND(
COUNT(CASE WHEN Attrition='Yes' THEN 1 END)*100.0/COUNT(*),2
) AS Attrition_Rate
FROM hr;

-- 9. Calculate Average Employee Age--

select `Employee Number`,avg(`ï»¿Age`) as `Average age`
from hr 
group by `Employee Number`;


-- 10. Calculate Average Employee Age--

SELECT
ROUND(AVG(ï»¿Age),2) AS Average_Age
FROM hr;
select avg(`ï»¿Age`) from hr;
 
 -- 11. Calculate Average Monthly Income of Employees--
 
 SELECT
ROUND(AVG(`Monthly Income`),2) AS Average_income
FROM hr;
   select avg(`Monthly income`) from hr;

-- 12. Analyze Employee Distribution Across Departments--

select `Department`,count(*) as `Employee Number` from hr 
group by `Department`;

-- 13. Identify Departments With Highest Employee Attrition--

SELECT
Department,
COUNT(*) AS Employees_Left
FROM hr
WHERE Attrition='Yes'
GROUP BY Department
ORDER BY Employees_Left DESC;

-- 14. Analyze Average Salary Across Departments--

select `Department`,avg(`Monthly income`)
from hr
group by `Department`;

-- 15. Analyze Employee Count Based on Job Role--

select `job role`,count(*) as `Total employees` from hr
group by `job role` ;

-- 16. Identify Job Roles With Highest Attrition--

select `job role`,COUNT(*) AS Employees_Left
FROM hr
WHERE Attrition='Yes'
GROUP BY `job role`
ORDER BY Employees_Left DESC;

-- 17. Analyze Employee Distribution by Gender--

select `Gender`,count(*)as `Total employees` from hr
group by `Gender`;

-- 18. Analyze Attrition Count by Gender--

select `Gender`,COUNT(*) AS `Attrition Count`
FROM hr
WHERE Attrition='Yes'
GROUP BY  `Gender`
ORDER BY `Attrition Count`  DESC;


-- 19. Analyze Employee Distribution by Age Group--

select `Age Group`,count(*)`Employee Number`
from hr
group by `Age Group`;

-- 20. Analyze Attrition Count by Age Group--

select `Age Group`,COUNT(*) AS `Attrition Count`
FROM hr
WHERE Attrition='Yes'
GROUP BY `Age Group`  
ORDER BY `Attrition Count`  DESC;

-- 21. Analyze Employee Distribution by Education Field--

select `Education field`,count(*) as `Total employees` 
from hr
group by `Education field`;
  
-- 22. Analyze Employee Distribution Based on Overtime Status--

select `over Time`,count(*) as `Number Of Employees`
from hr
group by `over Time`;

-- 23. Analyze Attrition Based on Overtime Status--

select `over Time`,COUNT(*) AS `Attrition Count`
FROM hr
WHERE Attrition='Yes'
GROUP BY  `over Time`  
ORDER BY `Attrition Count`  DESC;

-- 24. Analyze Average Working Years Across Departments--

 select `Department`,avg(`Total working years`) from hr
 group by `Department`;
 
 SELECT
`Department`,
ROUND(AVG(`Total working years` ),2) AS Avg_Years_At_Company
FROM hr
GROUP BY `Department`
ORDER BY Avg_Years_At_Company DESC;

 -- 25. Analyze Average Years With Current Manager Across Departments--

select `Department`,avg(`Years with current manager`) from hr
group by `Department`
order by`Department` desc;

-- 26. Analyze Average Income of Employees Based on Business Travel Category--

 SELECT `Business Travel`, AVG(`Monthly Income`)
FROM hr
WHERE `Business Travel` = 'Travel_Rarely'
GROUP BY `Business Travel`
HAVING AVG(`Monthly Income`) > 2000;