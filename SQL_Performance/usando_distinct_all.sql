USE SQL_Performance;

/*
 Neste trecho iremos usar o ALL e DISTINCT para seleção de dados específicos.
 i) ALL: este é um "parâmetro" opcional que quando usado irá retornar todas as linhas da tabela (o que o próprio
    SELECT já faz por padrão, logo por este motivo o mesmo é um parâmetro opcional.)

 ii) DISTINCT: quando a esta função temos que ela irá retornar as linhas de maneira que não haja duplicidade,
     isso me faz lembrar um pouco do uso do group by em conjunto com a função COUNT.
 */


-- Exemplo simples de uso

SELECT ALL f.id_funcionario, f.nome, f.email FROM Funcionarios AS f
LIMIT 20; -- Sim não faz muito sentido utilizar o limit junto com o ALL porém este dataset possuí 500 registros.


SELECT DISTINCT f.id_funcionario, f.nome, f.email FROM Funcionarios AS f
LIMIT 30;

SELECT COUNT(DISTINCT f.id_funcionario, f.nome, f.email) AS registros_nao_duplicados FROM Funcionarios AS f
LIMIT 40; -- Esta consulta irá retornar o número todas de não duplicatas, logo se ele retornasse 480 registros, então 20 deles seriam duplicatas.


-- Mas também teriamos outra maneira mais eficiênte para saber sobre o número total de duplicatas.

SELECT DISTINCT f.id_funcionario, f.nome, f.email, COUNT(*) AS registros_nao_duplicados FROM Funcionarios AS f 
LIMIT 25;


/*
 O uso do DISTINCT também se assemlha muito com o group by + count, a grande diferença entre os uso dessa junção é que
 o segundo irá buscar se forma "única" por coluna, ou seja o DISTINCT irá retornar multiplas colunas.  
 */


SELECT f.id_funcionario, f.nome, f.email, COUNT(*) AS registros_veridicos FROM Funcionarios AS f
GROUP BY id_funcionario;
