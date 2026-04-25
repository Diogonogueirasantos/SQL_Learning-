USE SQL_Performance;

EXPLAIN

SELECT w.name as waterfall_name, c.region FROM (SELECT * FROM county WHERE region="Central UP")
AS c JOIN waterfall AS w ON w.id_waterfall = c.id_waterfall;


-- o mesmo pode ser feito através de CTE's
EXPLAIN

WITH c AS (SELECT * FROM county WHERE region="Central UP")


SELECT w.name as waterfall_name, c.region FROM c 
JOIN waterfall AS w ON w.id_waterfall = c.id_waterfall;


-- Aparetemente ambas as consultas possuem a mesma eficiência
