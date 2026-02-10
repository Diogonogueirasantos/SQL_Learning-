USE EBAC;

SELECT p.id_produto, p.nome, p.preco, p.descricao, p.categoria, COUNT(*) AS total_pedidos, i.ingredientes, i.fornecedor FROM Produtos AS p
LEFT JOIN info_produtos AS i ON p.id_produto = i.id_produto
ORDER BY p.preco asc
LIMIT 1; 
