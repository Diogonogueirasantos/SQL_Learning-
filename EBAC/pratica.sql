USE EBAC;

CREATE TABLE Funcionarios(
	id_funcionario int not null auto_increment,
	nome varchar(255),
	cpf varchar(20),
	data_nascimento date,
	endereco varchar(255),
	telefone varchar(255),
	email varchar(100),
	cargo varchar(100),
	salario float(10, 2),
	data_admissao date,
	primary key(id_funcionario),
	unique(email)
)default charset="utf8";



CREATE TABLE Clientes(
	id_cliente int not null auto_increment,
	nome varchar(255),
	cpf varchar(14),
	data_nascimento date,
	endereco varchar(255),
	telefone varchar(15),
	email varchar(100),
	data_cadastro datetime,
	primary key(id_cliente),
	unique(email)	
)default charset="utf8";

CREATE TABLE Produtos(
	id_produto int not null auto_increment,
	nome varchar(255),
	descricao text, 
	preco float(10, 2),
	categoria enum("bebida", "entrada", "prato_principal", "sobremesa"),
	primary key(id_produto)
)default charset="utf8";


CREATE TABLE Pedidos(
	id_pedido int not null auto_increment,
	id_cliente int, 
	id_funcionario int,
	id_produto int,
	quantidade int,
	preco float(10, 2),
	data_pedido datetime,
	status_pedido enum("pendente", "concluído", "cancelado"),
	primary key(id_pedido),
	foreign key(id_cliente) references Clientes(id_cliente),
	foreign key(id_funcionario) references Funcionarios(id_funcionario),
	foreign key(id_produto) references Produtos(id_produto)
)default charset="utf8";


CREATE TABLE info_produtos(
	id_info int not null auto_increment,
	id_produto int,
	ingredientes text,
	fornecedor varchar(255),
	primary key(id_info),
	foreign key(id_produto) references Produtos(id_produto)
)default charset="utf8";
