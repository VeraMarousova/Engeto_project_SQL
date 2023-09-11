-- SECONDARY FINAL TABLE

CREATE OR REPLACE TABLE t_vera_marousova_project_sql_secondary_final AS (
	SELECT 
		e.country,
		e.YEAR, 	
		e.GDP,
		e.gini,
		e.population
	FROM countries c 
	LEFT JOIN economies e 
		ON e.country = c.country
	WHERE c.continent = 'Europe' AND YEAR >=2006 AND YEAR <=2018
);