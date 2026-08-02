USE hr;
 select *from`wa_fn-usec_-hr-employee-attrition`;
 create table hr like `wa_fn-usec_-hr-employee-attrition`;
 insert hr select* from`wa_fn-usec_-hr-employee-attrition`;
 select*from hr;
 
Alter table `wa_fn-usec_-hr-employee-attrition` 
rename column `ï»¿Age` TO Age;
select*from hr;

SELECT
    `Employee Number`,
    `Department`,
    `Monthly Income`,
    ROW_NUMBER() OVER (
        PARTITION BY `Department`
        ORDER BY `Monthly Income` DESC
    ) AS Row_Num
FROM hr;




select count(*) as `Total employees` from hr;

select count(*) as `Employees left` from hr
where Attrition='yes';

select count(*) as ` Active Employees` from hr
where Attrition='No';

SELECT
ROUND(
COUNT(CASE WHEN Attrition='Yes' THEN 1 END)*100.0/COUNT(*),2
) AS Attrition_Rate
FROM hr;


select `Employee Number`,avg(`ï»¿Age`) as `Average age`
from hr 
group by `Employee Number`;

SELECT
ROUND(AVG(ï»¿Age),2) AS Average_Age
FROM hr;
select avg(`ï»¿Age`) from hr;
 
 SELECT
ROUND(AVG(`Monthly Income`),2) AS Average_income
FROM hr;

select avg(`Monthly income`) from hr;

select `Department`,count(*) as `Employee Number` from hr 
group by `Department`;

SELECT
Department,
COUNT(*) AS Employees_Left
FROM hr
WHERE Attrition='Yes'
GROUP BY Department
ORDER BY Employees_Left DESC;

select `Department`,avg(`Monthly income`)
from hr
group by `Department`;

select `job role`,count(*) as `Total employees` from hr
group by `job role` ;

select `job role`,COUNT(*) AS Employees_Left
FROM hr
WHERE Attrition='Yes'
GROUP BY `job role`
ORDER BY Employees_Left DESC;


select `Gender`,count(*)as `Total employees` from hr
group by `Gender`;


select `Gender`,COUNT(*) AS `Attrition Count`
FROM hr
WHERE Attrition='Yes'
GROUP BY  `Gender`
ORDER BY `Attrition Count`  DESC;

select `Age Group`,count(*)`Employee Number`
from hr
group by `Age Group`;

select `Age Group`,COUNT(*) AS `Attrition Count`
FROM hr
WHERE Attrition='Yes'
GROUP BY `Age Group`  
ORDER BY `Attrition Count`  DESC;

select `Education field`,count(*) as `Total employees` 
from hr
group by `Education field`;
 
select*from hr;

select `over Time`,count(*) as `Number Of Employees`
from hr
group by `over Time`;

select `over Time`,COUNT(*) AS `Attrition Count`
FROM hr
WHERE Attrition='Yes'
GROUP BY  `over Time`  
ORDER BY `Attrition Count`  DESC;

 select `Department`,avg(`Total working years`) from hr
 group by `Department`;
 
 SELECT
`Department`,
ROUND(AVG(`Total working years` ),2) AS Avg_Years_At_Company
FROM hr
GROUP BY `Department`
ORDER BY Avg_Years_At_Company DESC;

select `Department`,avg(`Years with current manager`) from hr
group by `Department`
order by`Department` desc;

 SELECT `Business Travel`, AVG(`Monthly Income`)
FROM hr
WHERE `Business Travel` = 'Travel_Rarely'
GROUP BY `Business Travel`
HAVING AVG(`Monthly Income`) > 2000;