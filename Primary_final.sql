-- PRIMARY FINAL TABLE

CREATE OR REPLACE TABLE t_Vera_Marousova_project_SQL_primary_final AS
SELECT
	pay.payroll_year AS YEAR,
	pay.average_wages,
	pay.branch_name,
	pay.branch_average_wages,
	p.food_category,
	p.code,
	p.average_price,
	p.region_code,
	gdp.gdp
FROM t_Vera_Marousova_project_SQL_payroll AS pay
LEFT JOIN t_vera_marousova_project_sql_price AS p
	ON pay.payroll_year = p.YEAR
LEFT JOIN t_Vera_Marousova_project__SQL_CZ_GDP AS gdp
	ON pay.payroll_year =gdp.YEAR;


-- PAYROLL TABLE

CREATE OR REPLACE TABLE t_Vera_Marousova_project_SQL_Payroll AS
SELECT
	cpay.payroll_year,
	cpay.average_wages,
	cpay2.branch_name,
	cpay2.branch_average_wages
FROM 
(SELECT
	cpay.payroll_year, 
	round(avg(cpay.value),2) AS average_wages
FROM czechia_payroll cpay 
WHERE cpay.value_type_code = 5958
	AND cpay.payroll_year >= 2006 AND cpay.payroll_year <=2018
GROUP BY cpay.payroll_year) cpay
LEFT JOIN 
(SELECT
	cpay.payroll_year,
	cpib.name AS branch_name,
	round(avg(cpay.value),2) AS branch_average_wages
FROM czechia_payroll cpay
LEFT JOIN czechia_payroll_industry_branch cpib 
	ON cpay.industry_branch_code = cpib.code 
WHERE cpay.value_type_code = 5958
	AND cpay.industry_branch_code IS NOT NULL
	AND cpay.payroll_year >= 2006 AND cpay.payroll_year <=2018
GROUP BY cpay.payroll_year, cpib.name) cpay2
	ON cpay.payroll_year = cpay2.payroll_year;


-- PRICE TABLE

CREATE OR REPLACE TABLE t_Vera_Marousova_project_SQL_Price AS
(SELECT
    cpc.name AS food_category,
    cpc.code,
    date_format(cp.date_from, '%Y') AS YEAR,
    round(avg (cp.value),2) AS average_price,
    cp.region_code
FROM czechia_price AS cp
LEFT JOIN czechia_price_category cpc
	ON cp.category_code = cpc.code
GROUP BY food_category, YEAR 
ORDER BY food_category);


-- GDP TABLE
	
CREATE OR REPLACE TABLE t_Vera_Marousova_project__SQL_CZ_GDP AS 
SELECT 
	e.gdp,
	e.YEAR
FROM economies e 
WHERE country = 'Czech Republic';
	
