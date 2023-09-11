/*
 * Otázka č. 4: Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?
 */	

SELECT DISTINCT 
	f.YEAR,
	round((avg(f.average_wages) - avg(f2.average_wages)) / avg(f2.average_wages) * 100,2) AS wages_growth,
	round((avg(f.average_price) - avg(f2.average_price)) / avg(f2.average_price) * 100,2) AS price_growth,
	(round((avg(f.average_price) - avg(f2.average_price)) / avg(f2.average_price) * 100,2)) - (round((avg(f.average_wages) - avg(f2.average_wages)) / avg(f2.average_wages) * 100,2)) AS diff
FROM t_vera_marousova_project_sql_primary_final AS f
JOIN t_vera_marousova_project_sql_primary_final AS f2
	ON f.YEAR = f2.YEAR + 1
GROUP BY f.YEAR 
ORDER BY f.YEAR ASC;