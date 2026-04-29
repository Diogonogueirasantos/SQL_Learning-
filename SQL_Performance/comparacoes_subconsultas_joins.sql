/*
 de acordo com a autora do livro "SQL Guia Prático: um guia para o uso de SQL", o uso de subconsultas
 no where ou até mesmo no From são aceitáveis em primeiro momento quando se pretende criar uma consulta funcional,
 porém, a mesma compara principalmente subconsultas no Where com junções (Join) e diz que consultas Join são mais rápidas quando comparadas
 com subconsultas Where, porém exige mais entendimento sobre o funcionamento do JOIN. Por fim em um primeiro momento o flow para a construção de uma consulta é funcional → eficiente. 
 */

USE SQL_Performance;

SELECT w.name as waterfall_name FROM waterfall AS w
WHERE w.id_waterfall IN (SELECT c.id_waterfall FROM county AS c
                         WHERE 	c.name = "Alger"); -- Quando utilizamos uma subconsulta, em um consulta a subconsulta sempre tera prioridade


-- A diferença no uso de JOIN realmente é significativa??

SELECT w.name as waterfall_name, w.river FROM waterfall AS w
JOIN county AS c ON w.id_waterfall = c.id_waterfall
WHERE c.name = "Alger";


--utilizando o with na primeira consulta

WITH AS c (SELECT * FROM county AS c)


SELECT w.name as waterfall_name FROM c JOIN waterfall AS w ON c.id_waterfall = w.id_waterfall
WHERE c.name = "Alger";
