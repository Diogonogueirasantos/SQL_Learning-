USE SQL_Performance;


CREATE TABLE Funcionarios(
	id_funcionario int,
	nome varchar(255),
	email varchar(255),
	endereco text

)default charset="utf8";



LOAD DATA LOCAL INFILE '/home/dns/projects/SQL_Learning-/SQL_Performance/dados_ficticios.csv'
INTO TABLE Funcionarios
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROW LINES
(id_funcionario, nome, email, endereco);


SHOW WARNINGS;
