USE EBAC;

SELECT DISTINCT nome_produto, categoria, preco, RANK() OVER (PARTITION BY categoria ORDER BY preco DESC) AS mais_vendidos
FROM produto_informatica;


SELECT DISTINCT nome_produto, categoria, preco, DENSE_RANK() OVER (PARTITION BY categoria ORDER BY preco DESC) AS mais_vendidos
FROM produto_informatica;

SELECT DISTINCT nome_produto, categoria, preco, ROW_NUMBER() OVER (PARTITION BY categoria ORDER BY preco DESC) AS mais_vendidos
FROM produto_informatica;

SELECT DISTINCT nome_produto, preco, categoria, COUNT(*) AS vendas_totais
FROM produto_informatica
GROUP BY categoria;

SELECT DISTINCT nome_produto, preco, ROUND(AVG(preco), 2) AS preco_medio, categoria, COUNT(*) AS vendas_totais
FROM produto_informatica
GROUP BY categoria
ORDER BY preco DESC
LIMIT 5;



