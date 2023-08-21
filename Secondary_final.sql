-- SECONDARY FINAL TABLE

CREATE OR REPLACE TABLE t_Vera_Marousova_project_SQL_secondary_final AS 
(WITH europe_continent AS 
(SELECT 
	country,
	continent 
FROM countries c 
WHERE continent = 'Europe')
SELECT 
	e.country,
	e.YEAR, 	
	e.GDP,
	e.gini,
	e.population 
FROM europe_continent
LEFT JOIN economies e 
	ON e.country = europe_continent.country
WHERE YEAR >=2006 AND YEAR <=2018);




