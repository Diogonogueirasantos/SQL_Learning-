CREATE DATABASE EBAC;

USE EBAC;

CREATE TABLE cliente_informatica(
	ID_Cliente INT NOT NULL AUTO_INCREMENT,
	Nome varchar(255),
	Email varchar(255),
	Cidade varchar(300),
	PRIMARY KEY(ID_Cliente)

)DEFAULT CHARSET="UTF8";


CREATE TABLE produto_informatica(
	ID_Produto INT NOT NULL AUTO_INCREMENT,
	nome_produto VARCHAR(255),
	categoria ENUM("Acessórios", "Componentes", "Armazenamento", "Teclados", "Notebooks", "Redes", "Monitores", "Mouses"),
	preco INT,
	PRIMARY KEY(id_produto)
)DEFAULT CHARSET="UTF8";


CREATE TABLE pedido_informatica(
	ID_Pedido INT NOT NULL AUTO_INCREMENT,
	ID_Cliente INT,
	ID_Produto INT,
	Quantidade FLOAT,
	Data DATE,
	PRIMARY KEY(ID_Pedido)
)DEFAULT CHARSET="UTF8";


LOAD DATA LOCAL INFILE "/home/dns/github_projects/SQL_Learning-/EBAC/cliente_informatica.csv"
INTO TABLE cliente_informatica
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES 
(ID_Cliente, Nome, Email, Cidade);

LOAD DATA LOCAL INFILE "/home/dns/github_projects/SQL_Learning-/EBAC/produto_informatica.csv"
INTO TABLE produto_informatica
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id_produto, nome_produto, categoria, preco);

LOAD DATA LOCAL INFILE "/home/dns/github_projects/SQL_Learning-/EBAC/pedido_informatica.csv"
INTO TABLE pedido_informatica
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ID_Pedido, ID_Cliente, ID_Produto, Quantidade, Data);



ALTER TABLE pedido_informatica ADD FOREIGN KEY(ID_Cliente) REFERENCES cliente_informatica(ID_Cliente);

ALTER TABLE pedido_informatica ADD FOREIGN KEY(ID_Produto) REFERENCES produto_informatica(ID_Produto);
