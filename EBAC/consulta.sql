USE EBAC;

SELECT p.id_produto, p.nome, p.descricao, p.preco, p.categoria, COALESCE((SELECT nome WHERE preco <=30 AND categoria="Prato Principal"), "Não encontrado") AS produto_chefe, 
i.id_info, i.ingredientes, i.fornecedor 
FROM Produtos AS p
LEFT JOIN info_produtos AS i ON p.id_produto = i.id_produto
WHERE p.preco < 30
ORDER BY p.id_produto;


SELECT f.id_funcionario, f.nome, f.telefone, f.data_nascimento FROM Funcionarios AS f
WHERE YEAR(f.data_nascimento) < 1985;

SELECT p.id_produto, i.ingredientes FROM Produtos AS p
JOIN info_produtos AS i ON p.id_produto = i.id_produto
WHERE i.ingredientes like "Carne%";


SELECT p.id_produto, p.nome, p.categoria FROM Produtos AS p
ORDER BY p.nome, p.categoria ASC;

SELECT p.nome, p.categoria, p.preco as maior_preco FROM Produtos AS p
where p.preco >= 36
ORDER BY p.preco ASC
LIMIT 5;

SELECT p.id_produto, p.nome, p.preco, p.categoria FROM Produtos AS p
WHERE p.categoria="Prato Principal"
ORDER BY p.preco ASC
LIMIT 2
OFFSET 5;

CREATE TABLE backup_pedidos SELECT * FROM Pedidos;

# ou podemos fazer da seguinte forma

TRUNCATE backup_pedidos;

INSERT INTO backup_pedidos SELECT * FROM Pedidos;


