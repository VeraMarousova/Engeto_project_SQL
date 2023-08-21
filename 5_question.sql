/*
 * Otázka č.5: Má výška HDP vliv na změny ve mzdách a cenách potravin? 
 * Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem?
*/

SELECT
	f.YEAR,
	round ((f.average_wages - f2.average_wages) / f2.average_wages * 100, 2) AS wages_growth,
	round((f.average_price - f2.average_price) / f2.average_price *100, 2) AS price_growth,
	round ((f.gdp  - f2.gdp) / f2.gdp * 100, 2) AS gdp_growth
FROM t_vera_marousova_project_sql_primary_final AS f
JOIN t_vera_marousova_project_sql_primary_final AS f2
	ON f.year = f2.year +1
GROUP BY f.YEAR
ORDER BY f.YEAR ASC;
