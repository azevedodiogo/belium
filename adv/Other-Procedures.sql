-- | Define a base de dados a ser utilizada
USE BeLIUM_Viagens;



-- | Autentifica um utilizador
DELIMITER $$
CREATE PROCEDURE AutentificaUtilizador (IN p_email VARCHAR(100), IN p_password VARCHAR(100), OUT p_ID INT, OUT p_mensagem VARCHAR(100))
BEGIN

	-- | Declara variáveis auxiliares
    DECLARE v_ID INT;
    DECLARE v_password VARCHAR(100);
    
    -- | Inicializa os parâmetros
    SET p_ID = NULL;
    SET p_mensagem = NULL;
	
    -- | Procura o ID e a password do utilizador
	SELECT ID, Pass_Word INTO v_ID, v_password FROM Utilizador
		WHERE Email = p_email;
        
	-- | Verifica se o utilizador não existe (o email é inválido)
    IF v_ID IS NULL THEN
        SET p_mensagem = 'O email é inválido';

	-- | Verifica se a password não corresponde (a password é inválida)
    ELSEIF v_password != p_password THEN
		SET p_mensagem = 'A password é inválida';
        
	-- | Atualiza os parâmetros
	ELSE SET p_ID = v_ID;
	END IF;
    
END $$
DELIMITER ;



-- | Muda a password de um utilizador
DELIMITER $$
CREATE PROCEDURE MudarPassword (IN p_email VARCHAR(100), IN p_password_antiga VARCHAR(100), IN p_password_nova VARCHAR(100))
BEGIN
	
    -- | Declara variáveis auxiliares
	DECLARE v_ID INT;
    DECLARE v_mensagem VARCHAR(100);
    
    -- | Autentifica o utilizador
    CALL AutentificaUtilizador (p_email, p_password_antiga, v_ID, v_mensagem);
    
    -- | Verifica se houve um erro de autentificação
    IF v_mensagem IS NOT NULL THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = v_mensagem;
	END IF;
    
    -- | Atualiza a password do utilizador
    UPDATE Utilizador
		SET Pass_Word = p_password_nova
        WHERE ID = v_ID;

END $$
DELIMITER ;



-- | Insere uma visualização
DELIMITER $$
CREATE PROCEDURE InserirVisualização (IN p_email VARCHAR(100), IN p_password VARCHAR(100), IN p_viagem INT, IN p_reação ENUM('Negativa', 'Positiva'))
BEGIN
	
     -- | Declara variáveis auxiliares
	DECLARE v_ID INT;
    DECLARE v_mensagem VARCHAR(100);
    
    -- | Autentifica o utilizador
    CALL AutentificaUtilizador (p_email, p_password, v_ID, v_mensagem);
    
    -- | Verifica se houve um erro de autentificação
    IF v_mensagem IS NOT NULL THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = v_mensagem;
	END IF;
    
    -- | Insere o registo
    INSERT INTO Rel_Utilizador_Viagem (Utilizador, Viagem, Reação)
		VALUES (v_ID, p_viagem, p_reação);
    
END $$
DELIMITER ;



-- | Atualiza uma visualização
DELIMITER $$
CREATE PROCEDURE AtualizarVisualização (IN p_email VARCHAR(100), IN p_password VARCHAR(100), IN p_viagem INT, IN p_reação ENUM('Negativa', 'Positiva'))
BEGIN
	
     -- | Declara variáveis auxiliares
	DECLARE v_ID INT;
    DECLARE v_mensagem VARCHAR(100);
    DECLARE v_flag INT;
    
    -- | Autentifica o utilizador
    CALL AutentificaUtilizador (p_email, p_password, v_ID, v_mensagem);
    
    -- | Verifica se houve um erro de autentificação
    IF v_mensagem IS NOT NULL THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = v_mensagem;
	END IF;
    
    -- | Procura o registo
    SELECT COUNT(*) INTO v_flag FROM Rel_Utilizador_Viagem
		WHERE Utilizador = v_ID AND Viagem = p_viagem;
        
	-- | Verifica se o registo não existe
    IF v_flag = 0 THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Registo inexistente';
	END IF;
    
    -- | Atualiza o registo
    UPDATE Rel_Utilizador_Viagem
		SET Reação = p_reação
        WHERE Utilizador = v_ID AND Viagem = p_viagem;
    
END $$
DELIMITER ;



-- | Remove uma visualização
DELIMITER $$
CREATE PROCEDURE RemoveVisualização (IN p_email VARCHAR(100), IN p_password VARCHAR(100), IN p_viagem INT)
BEGIN
	
     -- | Declara variáveis auxiliares
	DECLARE v_ID INT;
    DECLARE v_mensagem VARCHAR(100);
    DECLARE v_flag INT;
    
    -- | Autentifica o utilizador
    CALL AutentificaUtilizador (p_email, p_password, v_ID, v_mensagem);
    
    -- | Verifica se houve um erro de autentificação
    IF v_mensagem IS NOT NULL THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = v_mensagem;
	END IF;
    
    -- | Procura o registo
    SELECT COUNT(*) INTO v_flag FROM Rel_Utilizador_Viagem
		WHERE Utilizador = v_ID AND Viagem = p_viagem;
        
	-- | Verifica se o registo não existe
    IF v_flag = 0 THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Registo inexistente';
	END IF;
    
    -- | Remove o registo
    DELETE FROM Rel_Utilizador_Viagem
        WHERE Utilizador = v_ID AND Viagem = p_viagem;
    
END $$
DELIMITER ;



-- | RM8. Filtrar viagens pela localização das paragens.
DELIMITER $$
CREATE PROCEDURE FiltrarViagensPorLocalização (IN p_país VARCHAR(50), IN p_cidade VARCHAR(50))
BEGIN
	SELECT DISTINCT V.* FROM Viagem AS V
		INNER JOIN Paragem AS P ON V.ID = P.Viagem
			WHERE (p_país IS NULL OR P.País = p_país) AND (p_cidade IS NULL OR P.Cidade = p_cidade);
END $$
DELIMITER ;



-- | RM9. Filtrar viagens pelas datas, pelo custo e pelo objetivo.
DELIMITER $$
CREATE PROCEDURE FiltrarViagensPorDetalhes (IN p_data_min DATE, IN p_data_max DATE, IN p_custo_min DECIMAL(8,2), IN p_custo_max DECIMAL(8,2), IN p_objetivo ENUM('Pedagógico', 'Recreativo', 'Ambos'))
BEGIN
	SELECT * FROM Viagem
		WHERE (p_data_min IS NULL OR Data_Início >= p_data_min) AND
			  (p_data_max IS NULL OR Data_Término <= p_data_max) AND
			  (p_custo_min IS NULL OR Custo >= p_custo_min) AND
			  (p_custo_max IS NULL OR Custo <= p_custo_max) AND
			  (p_objetivo IS NULL OR Objetivo = p_objetivo);
END $$
DELIMITER ;



-- | RM18. Filtrar viagens por percentagem de reações positivas (ordenado por percentagem).
DELIMITER $$
CREATE PROCEDURE FiltrarViagensPorReações (IN p_percentagem INT)
BEGIN
	SELECT V.*, P.Percentagem FROM Viagem AS V
		INNER JOIN (
			SELECT Viagem, CalcularPercentagemPositiva(Viagem) AS Percentagem FROM Rel_Utilizador_Viagem AS RUV
				GROUP BY Viagem
			) AS P ON V.ID = P.Viagem
				WHERE P.Percentagem >= p_percentagem
				ORDER BY P.Percentagem DESC;
END $$
DELIMITER ;