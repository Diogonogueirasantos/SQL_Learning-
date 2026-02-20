USE EBAC;

SELECT COUNT(*) AS pedidos_totais
FROM Pedidos;

SELECT c.nome, COUNT(p.id_pedido) AS pedidos_totais
FROM Pedidos AS p
JOIN Clientes AS c ON p.id_cliente = c.id_cliente
GROUP BY c.id_cliente, c.nome
ORDER BY pedidos_totais;

SELECT ROUND(AVG(preco), 2) AS preco_medio FROM Produtos;

SELECT ROUND(AVG(p.preco), 2) AS preco_medio, MIN(p.preco) AS menor_preco, MAX(p.preco) AS maior_preco FROM Produtos AS p;

SELECT p.nome, p.preco FROM Produtos AS p
GROUP BY p.nome
ORDER BY p.preco DESC
LIMIT 5;

SELECT p.nome, p.preco, ROUND(AVG(p.preco), 2) AS preco_medio, p.categoria FROM Produtos AS p
GROUP BY p.categoria
ORDER BY p.preco DESC
LIMIT 5;

SELECT p.nome, pe.quantidade, i.ingredientes, i.fornecedor FROM Produtos AS p
JOIN info_produtos AS i ON p.id_produto = i.id_produto
JOIN Pedidos AS pe ON i.id_produto = pe.id_produto;

SELECT i.fornecedor, COUNT(i.fornecedor) AS dependencia_materia, p.nome, pe.quantidade FROM info_produtos AS i
JOIN Produtos AS p ON i.id_produto = p.id_produto
JOIN Pedidos AS pe ON i.id_produto = pe.id_produto
GROUP BY i.fornecedor
HAVING dependencia_materia > 1;


SELECT c.nome, pe.quantidade, p.nome FROM Clientes AS c
JOIN Pedidos AS pe ON c.id_cliente = pe.id_cliente
JOIN Produtos AS p ON pe.id_produto = p.id_produto
GROUP BY c.nome 
HAVING pe.quantidade = 1;
