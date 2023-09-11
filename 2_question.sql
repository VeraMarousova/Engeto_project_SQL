/*
 * Otázka č. 2: Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
 */

SELECT DISTINCT 
	f.YEAR, 
	f.code,
	f.food_category,
	f.average_price,
	f.average_wages,
	round((f.average_wages /f.average_price),0) AS amount_of_food
FROM t_vera_marousova_project_sql_primary_final AS f
WHERE f.code IN ('111301', '114201') AND 
	f.YEAR IN (2006, 2018)
ORDER BY f.YEAR;