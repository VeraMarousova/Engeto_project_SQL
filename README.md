SQL Projekt

Cíl

Cílem projektu je zjistit dostupnost základních potravin široké veřejnosti v České republice, a to prostřednictvím porovnání cen potravin, mezd a HDP mezi roky 2006 – 2018, pro které máme k dispozici vstupní data. Vstupní data jsou čerpána z tabulek czechia_payroll, czechia_payroll_industry_branch, czechia_price, czechia_price_category, economies a countries.

Výzkumné otázky

Z výše uvedených vstupních dat je vytvořena primární tabulka s názvem t_Vera_Marousova_project_SQL_primary_final, ze které je možné získat prostřednictvím SQL dotazů datový podklad k zodpovězení níže uvedených otázek.
Pro dodatečná data o dalších evropských státech je vytvořena sekundární tabulka s názvem t_Vera_Marousova_project_SQL_secondary_final, která obsahuje HDP, GINI koeficient a populaci pro jednotlivé evropské státy ve stejném období, jako primární přehled pro Českou republiku.
1.	Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
2.	Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
3.	Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?
4.	Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?
5.	Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem?
