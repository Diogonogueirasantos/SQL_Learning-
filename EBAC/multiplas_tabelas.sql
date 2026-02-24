USE EBAC;

SELECT p.id_produto, p.nome AS produto, p.descricao, i.ingredientes FROM Produtos AS p 
INNER JOIN info_produtos AS i ON p.id_produto = i.id_produto;

SELECT c.nome, c.email, pe.id_pedido, COUNT(pe.quantidade) AS  pedidos_feitos, CONCAT(DAY(pe.data_pedido), "/", MONTH(pe.data_pedido)) AS data FROM Clientes AS c
LEFT JOIN Pedidos AS pe ON c.id_cliente = pe.id_cliente
GROUP BY c.nome, c.email
HAVING pedidos_feitos >= 3
ORDER BY pedidos_feitos DESC;


SELECT c.nome AS cliente, c.email, f.nome AS atendente, p.nome AS produto, p.preco, 
pe.id_pedido, pe.quantidade, pe.data_pedido FROM Pedidos AS pe
LEFT JOIN Clientes AS c ON  pe.id_cliente = c.id_cliente
LEFT JOIN Funcionarios AS f ON pe.id_funcionario = f.id_funcionario
LEFT JOIN Produtos AS p ON pe.id_produto = p.id_produto
GROUP BY cliente
ORDER BY pe.quantidade ASC;


SELECT c.nome AS cliente, pe.status_pedido FROM Clientes AS c 
JOIN Pedidos AS pe ON c.id_cliente = pe.id_cliente
WHERE pe.status_pedido = 'Pendente'
ORDER BY pe.status_pedido DESC;


SELECT c.nome AS cliente FROM Clientes AS c 
WHERE c.id_cliente IN (SELECT pe.id_cliente FROM Pedidos AS pe
                       WHERE pe.id_pedido IS NULL);

/*
 como o id_pedido é uma chave primária então não é possível ter um id nulo porém acredito que a consulta acima não resolva 
 essa questão, logo usaremos o LEFT JOIN
 */

SELECT c.nome AS cliente, pe.id_pedido, pe.status_pedido FROM Pedidos AS pe 
LEFT JOIN Clientes AS c ON pe.id_cliente = c.id_cliente;

-- Nenhum cliente sem pedidos encontrados (Parece que alguém realmente se importou com a modelagem dos dados)

SELECT c.nome AS cliente, COUNT(pe.quantidade) total_pedidos FROM Clientes AS c
JOIN Pedidos AS pe ON c.id_cliente = pe.id_cliente
GROUP BY cliente 
ORDER BY total_pedidos DESC;


SELECT c.nome AS cliente, p.nome AS produto,pe.id_pedido, (pe.quantidade * p.preco) AS total_gasto FROM Pedidos AS pe
INNER JOIN Clientes AS c ON pe.id_cliente = c.id_cliente
INNER JOIN Produtos AS p ON pe.id_produto = p.id_produto
GROUP BY  cliente;
