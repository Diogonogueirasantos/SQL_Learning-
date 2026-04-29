USE SQL_Performance;

SELECT w.name AS waterfall_name, COUNT(*) AS 'Difficulty Equal = Easy' FROM waterfall AS w
WHERE w.id_waterfall IN (SELECT t.id_waterfall FROM tour AS t
                         WHERE t.difficulty = "Easy")
GROUP BY w.name;



/*
 Regra de uso do group by: todas as colunas que foram utilizadas devem estar no group by, caso contrário 
 o dbms retornará erro ou um resultado impreciso 
 */


-- Aprofundando mais o conceito do group by

SELECT 	w.name AS  waterfall_name, c.name AS state, t.tour_type FROM waterfall AS w
JOIN county AS c ON w.id_waterfall = c.id_waterfall
JOIN tour AS t ON w.id_waterfall = t.id_waterfall;
