USE EBAC;

/*
 Existem duas maneiras de copiar dados de uma tabelas para uma nova tabela estas são:
	i) criando uma tabela que recebe como parâmetro os dados da outra - o que por sua vez não trás as
	   restrições da tabela oirginal.

	ii) remover os dados da tabela backup com truncate e em seguida inserir os dados com insert passando
	    o banco de dados como referêncoas
 */


# Primeira Forma 

CREATE TABLE backup_data SELECT * FROM Funcionarios;


# Segunda Forma

TRUNCATE backup_data;

INSERT INTO backup_data SELECT * FROM Funcionarios;


/*
 Vale lembrar que para remover um banco de dados existente é necessário remover a chave primária e estrangeira (se existir),
 como já visto isso é feito com ALTER TABLE MODIFY.
 */



