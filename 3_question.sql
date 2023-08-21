/*
 * Otázka č. 3: Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?
 */

SELECT
	pg.code,
	pg.food_category, 
	round(avg(pg.price_growth),2) AS price_growth_2006_2018  
FROM (
SELECT
	f.code,
	f.food_category,
	f.YEAR,
	f2.YEAR + 1 AS year_prev,
	round((f.average_price - f2.average_price) / f2.average_price *100, 2) AS price_growth
FROM t_vera_marousova_project_sql_primary_final AS f
LEFT JOIN t_vera_marousova_project_sql_primary_final AS f2
	ON f.code = f2.code 
	AND f.YEAR = f2.YEAR + 1) AS pg
GROUP BY pg.code
ORDER BY price_growth_2006_2018;