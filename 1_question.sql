/*
 * Otázka č. 1: Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
 */

SELECT DISTINCT 
	f.YEAR,
	f2.YEAR + 1 AS year_prev,
	f.branch_name,
	round((f.branch_average_wages - f2.branch_average_wages) / f2.branch_average_wages * 100, 2) AS branch_wages_growth 
FROM t_vera_marousova_project_sql_primary_final AS f 
JOIN t_vera_marousova_project_sql_primary_final AS f2
	ON f.branch_name = f2.branch_name
	AND f.YEAR = f2.YEAR +1
WHERE f.YEAR >= 2006 AND f.YEAR <=2018
ORDER BY branch_wages_growth ASC;


SELECT
	branch_name,
	round(avg(branch_wages_growth),2) AS branch_wages_growth_2006_2018
FROM 
	(SELECT DISTINCT 
		f.YEAR,
		f2.YEAR + 1 AS year_prev,
		f.branch_name,
		round((f.branch_average_wages - f2.branch_average_wages) / f2.branch_average_wages * 100, 2) AS branch_wages_growth 
	FROM t_vera_marousova_project_sql_primary_final AS f 
	JOIN t_vera_marousova_project_sql_primary_final AS f2
		ON f.branch_name = f2.branch_name
		AND f.YEAR = f2.YEAR +1
	WHERE f.YEAR >= 2006 AND f.YEAR <=2018
	ORDER BY branch_wages_growth ASC) AS bwg
GROUP BY branch_name;