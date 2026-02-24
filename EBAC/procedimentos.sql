USE EBAC;

DELIMITER //

CREATE PROCEDURE lista()
 BEGIN 
	SELECT c.nome, c.email FROM Clientes as c;
 END // 

DELIMITER ;


-- Não faz muito sentido utilizar procedimentos para retornar tabelas, acredito que seja mais eficiente utilizar views


DELIMITER //

CREATE PROCEDURE insercao_dados(IN p_nome VARCHAR(30), IN p_data_nascimento DATE, OUT contagem_usuarios INT)
 BEGIN 
	INSERT INTO Clientes(nome, data_nascimento) VALUES (p_nome, p_data_nascimento);
	SELECT COUNT(*) INTO contagem_usuarios FROM Clientes;
 END //

DELIMITER ;


CALL insercao_dados('Diogo', '2003-06-15', @contagem_usuarios);
