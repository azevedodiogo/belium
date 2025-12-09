-- | Define a base de dados a ser utilizada
USE BeLIUM_Viagens;



-- | Procedimento para adicionar um registo na tabela 'Utilizador'
DELIMITER $$
CREATE PROCEDURE InserirUtilizador (IN p_Nome VARCHAR(100), IN p_Telemovel VARCHAR(13), IN p_Email VARCHAR(100), IN p_Pass_Word VARCHAR(100))
BEGIN
    INSERT INTO Utilizador (Nome, Telemóvel, Email, Pass_Word)
		VALUES (p_Nome, p_Telemovel, p_Email, p_Pass_Word);
END $$
DELIMITER ;



-- | Procedimento para adicionar um registo na tabela 'Sócio'
DELIMITER $$
CREATE PROCEDURE InserirSocio (IN p_Nr_Socio INT UNSIGNED, IN p_Utilizador INT UNSIGNED, IN p_Foto_Perfil VARCHAR(100), IN p_Estatuto ENUM('Direção','Alumni'))
BEGIN
    INSERT INTO Sócio (Nr_Sócio, Utilizador, Foto_Perfil, Estatuto)
		VALUES (p_Nr_Socio, p_Utilizador, p_Foto_Perfil, p_Estatuto);
END $$
DELIMITER ;



-- | Procedimento para adicionar um registo na tabela 'Viagem'
DELIMITER $$
CREATE PROCEDURE InserirViagem (IN p_Data_Inicio DATETIME, IN p_Data_Termino DATETIME, IN p_Nr_Participantes INT, IN p_Custo DECIMAL(8,2), IN p_Objetivo ENUM('Pedagógico','Recreativo','Ambos'))
BEGIN
    INSERT INTO Viagem (Data_Início, Data_Término, Nr_Participantes, Custo, Objetivo)
		VALUES (p_Data_Inicio, p_Data_Termino, p_Nr_Participantes, p_Custo, p_Objetivo);
END $$
DELIMITER ;



-- | Procedimento para adicionar um registo na tabela 'Deslocamento'
DELIMITER $$
CREATE PROCEDURE InserirDeslocamento (IN p_Tipo_Deslocamento ENUM('Carro','Autocarro','Comboio','Avião','Barco','Navio','Bicicleta','Mota','A pé','Outro'), IN p_Viagem INT UNSIGNED)
BEGIN
    INSERT INTO Deslocamento (Tipo_Deslocamento, Viagem)
		VALUES (p_Tipo_Deslocamento, p_Viagem);
END $$
DELIMITER ;



-- | Procedimento para adicionar um registo na tabela 'Paragem'
DELIMITER $$
CREATE PROCEDURE InserirParagem (IN p_Nr INT UNSIGNED, IN p_Viagem INT UNSIGNED, IN p_Cidade VARCHAR(50), IN p_Pais VARCHAR(50), IN p_Data_Chegada DATETIME, IN p_Data_Partida DATETIME)
BEGIN

	-- | Variável auxiliar
    DECLARE v_flag INT;
    
    -- | Determina o número de paragens cujo intervalo de datas interseta com o intervalo da nova paragem
    SELECT COUNT(*) INTO v_flag FROM Paragem
		WHERE Viagem = p_Viagem AND Data_Chegada < p_Data_Partida AND Data_Partida > p_Data_Chegada;
	
    -- | Verifica se a paragem é inválida
    IF v_flag > 0 THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'A paragem é inválida';
	END IF;

	-- | Insere a paragem
    INSERT INTO Paragem (Nr, Viagem, Cidade, País, Data_Chegada, Data_Partida)
		VALUES (p_Nr, p_Viagem, p_Cidade, p_Pais, p_Data_Chegada, p_Data_Partida);
        
END $$
DELIMITER ;



-- | Procedimento para adicionar um registo na tabela 'Foto'
DELIMITER $$
CREATE PROCEDURE InserirFoto (IN p_Foto VARCHAR(100), IN p_Paragem INT UNSIGNED, IN p_Viagem INT UNSIGNED)
BEGIN
    INSERT INTO Foto (Foto, Paragem, Viagem)
		VALUES (p_Foto, p_Paragem, p_Viagem);
END $$
DELIMITER ;



-- | Procedimento para adicionar um registo na tabela 'Rel_Sócio_Viagem'
DELIMITER $$
CREATE PROCEDURE InserirRelSocioViagem (IN p_Socio INT UNSIGNED, IN p_Viagem INT UNSIGNED, IN p_Avaliacao ENUM('Muito Negativa','Negativa','Mediana','Positiva','Muito Positiva'), IN p_Comentario VARCHAR(150))
BEGIN
    INSERT INTO Rel_Sócio_Viagem (Sócio, Viagem, Avaliação, Comentário)
		VALUES (p_Socio, p_Viagem, p_Avaliacao, p_Comentario);
END $$
DELIMITER ;



-- | Procedimento para adicionar um registo na tabela 'Patrocinador'
DELIMITER $$
CREATE PROCEDURE InserirPatrocinador (IN p_Nome VARCHAR(40))
BEGIN
    INSERT INTO Patrocinador (Nome)
		VALUES (p_Nome);
END $$
DELIMITER ;



-- | Procedimento para adicionar um registo na tabela 'Rel_Viagem_Patrocinador'
DELIMITER $$
CREATE PROCEDURE InserirRelViagemPatrocinador (IN p_Viagem INT UNSIGNED, IN p_Patrocinador INT UNSIGNED, IN p_Valor DECIMAL(8,2))
BEGIN
    INSERT INTO Rel_Viagem_Patrocinador (Viagem, Patrocinador, Valor)
		VALUES (p_Viagem, p_Patrocinador, p_Valor);
END $$
DELIMITER ;



-- | Procedimento para adicionar um registo na tabela 'Motivo'
DELIMITER $$
CREATE PROCEDURE InserirMotivo (IN p_Motivo VARCHAR(200), IN p_Viagem INT UNSIGNED, IN p_Patrocinador INT UNSIGNED)
BEGIN
    INSERT INTO Motivo (Motivo, Patrocinador, Viagem)
		VALUES (p_Motivo, p_Patrocinador, p_Viagem);
END $$
DELIMITER ;



-- | Procedimento para adicionar um registo na tabela 'Rel_Utilizador_Viagem'
DELIMITER $$
CREATE PROCEDURE InserirRelUtilizadorViagem (IN p_Utilizador INT UNSIGNED, IN p_Viagem INT UNSIGNED, IN p_Reacao ENUM('Negativa','Positiva'))
BEGIN
    INSERT INTO Rel_Utilizador_Viagem (Utilizador, Viagem, Reação)
		VALUES (p_Utilizador, p_Viagem, p_Reacao);
END $$
DELIMITER ;