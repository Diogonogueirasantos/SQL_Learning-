USE EBAC;

CREATE VIEW clientes_potenciais AS
SELECT c.nome, c.email, pe.id_pedido, COUNT(pe.quantidade) AS  pedidos_feitos, CONCAT(DAY(pe.data_pedido), "/", MONTH(pe.data_pedido)) AS data FROM Clientes AS c
LEFT JOIN Pedidos AS pe ON c.id_cliente = pe.id_cliente
GROUP BY c.nome, c.email
HAVING pedidos_feitos >= 3
ORDER BY pedidos_feitos DESC;

CREATE OR REPLACE VIEW clientes_potenciais AS
SELECT c.nome, c.email, pe.id_pedido, COUNT(pe.quantidade) AS pedidos_feitos FROM Clientes AS c
LEFT JOIN Pedidos AS pe ON c.id_cliente = pe.id_cliente
GROUP BY c.nome, c.email
HAVING pedidos_feitos >= 3
ORDER BY pedidos_feitos DESC;


-- Ao mostrar uma viewer é possível ver uma descrição detalhada da tabela criada - o mesmo não ocorre com tabelas normais 


SHOW CREATE VIEW clientes_potenciais;

-- ao utilizar o comando abaixo a descrição retornada é algo semelhante a consulta acima, porém o retorno dos dados é confuso
SHOW CREATE TABLE Clientes;


-- também é possível utilizar join's em viewers porém se torna necessário o uso do campo de id's nas viewers


