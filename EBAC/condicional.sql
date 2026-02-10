USE EBAC;

SELECT p.id_funcionario, p.status_pedido, p.id_produto FROM Pedidos AS p 
WHERE p.id_funcionario=4 AND p.status_pedido="Pendente";


SELECT p.id_pedido, p.id_produto, p.status_pedido FROM Pedidos AS p 
WHERE p.status_pedido <> "Concluído";


SELECT p.id_produto, p.id_pedido FROM Pedidos AS p
WHERE (p.id_pedido IN(1, 3, 5, 7)) OR p.id_pedido=8;


SELECT c.id_cliente, c.nome, c.cpf, c.telefone FROM Clientes AS c
WHERE c.nome like"c%";

SELECT i.id_produto, i.ingredientes, i.fornecedor FROM info_produtos AS i
WHERE i.ingredientes like"%carne%" or i.ingredientes like"%frango%";


SELECT p.id_produto, p.nome, p.descricao, p.descricao, p.preco, i.ingredientes, i.fornecedor FROM Produtos AS p
LEFT JOIN info_produtos AS i ON p.id_produto = i.id_produto
WHERE p.preco BETWEEN 20 AND 30;


UPDATE Pedidos SET status_pedido=NULL WHERE id_pedido=6
LIMIT 1;


SELECT p.id_pedido, COALESCE(p.status_pedido, "Cancelado") FROM Pedidos AS p
WHERE p.status_pedido IS NULL;


SELECT p.id_pedido, IFNULL(p.status_pedido, "Cancelado") FROM Pedidos AS p
WHERE p.status_pedido IS NULL;


SELECT f.id_funcionario, f.nome, f.salario, IF(f.salario > 3000, "Acima da Média", "Abaixo da média") AS classificacao_salarial
FROM Funcionarios AS f;

SELECT f.id_funcionario, f.nome, f.salario,
CASE 
	WHEN f.salario > 3000 THEN "Acima da média"
	WHEN f.salario < 3000 THEN "Abaixo da média"
	ELSE "Na média"

END AS classificacao_salarial
FROM Funcionarios AS f;
		


