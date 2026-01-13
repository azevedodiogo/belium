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

-- | Povoamento da tabela 'Utilizador'
CALL InserirUtilizador ('Bruno Magalhães', '+351937426819', 'brunomagalhaes_cesium_1728@gmail.com', 'gA9!rZ3#tX7K@pV$L2mN');
CALL InserirUtilizador ('Vera Almeida', '+351963817402', 'veraalmeida_cesium_1854@gmail.com', 'nB7@qY4$kP8#sH2!T6zG');
CALL InserirUtilizador ('Diogo Azevedo', '+351912345678', 'diogoazevedo_cesium_1912@gmail.com', 'pC6$wR8#vM9@hL3!K2sD');
CALL InserirUtilizador ('Simão Santos', '+351934781256', 'simaosantos_cesium_2037@gmail.com', 'tD5#eS7!uN1@jQ4$H8mB');
CALL InserirUtilizador ('Júlio Pinto', '+351961482739', 'juliopinto_cesium_2149@gmail.com', 'vE4%fT6^sM2&kR9*H1pZ');
CALL InserirUtilizador ('Gustavo Pereira', '+351926573814', 'gustavopereira_cesium_2263@gmail.com', 'wF3&gU5*tN8(jS1)K9qY');
CALL InserirUtilizador ('Rui Afonso', '+351968240157', 'ruiafonso_cesium_2378@gmail.com', 'xG2(hV4)rM7-lT0_P8wE');
CALL InserirUtilizador ('Mário Rodrigues', '+351913857462', 'mariorodrigues_cesium_2441@gmail.com', 'yH1)iW3_qN6+mS9=O7eR');
CALL InserirUtilizador ('Humberto Gomes', '+351947162805', 'humbertogomes_cesium_1986@gmail.com', 'zI0_jX2+pM5=nT8~Q6tS');
CALL InserirUtilizador ('Gonçalo Pombo', '+351965028417', 'goncalopombo_cesium_2215@gmail.com', 'aJ9+kY1=oN4~mU7!R5uF');
CALL InserirUtilizador ('João Silva', '+351912345679', 'joao.silva@email.com', 'bK8=lZ0~pO3!nV6@S4iG');
CALL InserirUtilizador ('Maria Santos', '+351934781257', 'maria.santos@email.com', 'cL7!mY9#qP2$oW5%T3hH');
CALL InserirUtilizador ('Pedro Almeida', '+351961482740', 'pedro.almeida@email.com', 'dM6#nX8$rQ1%pV4^U2jI');
CALL InserirUtilizador ('Ana Costa', '+351926573815', 'ana.costa@email.com', 'eN5$oW7%sR0^qX3&V1kJ');
CALL InserirUtilizador ('Rui Ferreira', '+351968240158', 'rui.ferreira@email.com', 'fO4%pV6^tS9&rY2*W0lK');
CALL InserirUtilizador ('Sofia Martins', '+351913857463', 'sofia.martins@email.com', 'gP3^qW5&uT8*sZ1(X9mL');
CALL InserirUtilizador ('Tiago Lopes', '+351947162806', 'tiago.lopes@email.com', 'hQ2&rX4*vU7(tA0)Y8nM');
CALL InserirUtilizador ('Inês Rocha', '+351965028418', 'ines.rocha@email.com', 'iR1*sY3(wV6)uB9_Z7oN');
CALL InserirUtilizador ('Carlos Pereira', '+351932740681', 'carlos.pereira@email.com', 'jS0(tZ2)xW5_vC8+A6pO');
CALL InserirUtilizador ('Beatriz Nunes', '+351951864237', 'beatriz.nunes@email.com', 'kT9)uY1_yX4+wD7=B5qP');

-- | Procedimento para adicionar um registo na tabela 'Sócio'
DELIMITER $$
CREATE PROCEDURE InserirSocio (IN p_Nr_Socio INT UNSIGNED, IN p_Utilizador INT UNSIGNED, IN p_Foto_Perfil VARCHAR(100), IN p_Estatuto ENUM('Direção','Alumni'))
BEGIN
    INSERT INTO Sócio (Nr_Sócio, Utilizador, Foto_Perfil, Estatuto)
		VALUES (p_Nr_Socio, p_Utilizador, p_Foto_Perfil, p_Estatuto);
END $$
DELIMITER ;

-- | Povoamento da tabela 'Sócio'
CALL InserirSocio (1728, 1, NULL, 'Direção');
CALL InserirSocio (1854, 2, 'Imagens/FP1854.png', 'Direção');
CALL InserirSocio (1912, 3, 'Imagens/FP1912.png', 'Direção');
CALL InserirSocio (2037, 4, 'Imagens/FP2037.png', 'Direção');
CALL InserirSocio (2149, 5, 'Imagens/FP2149.png', 'Direção');
CALL InserirSocio (2263, 6, 'Imagens/FP2263.png', 'Direção');
CALL InserirSocio (2378, 7, NULL, 'Alumni');
CALL InserirSocio (2441, 8, NULL, NULL);
CALL InserirSocio (1986, 9, 'Imagens/FP1986.png', NULL);
CALL InserirSocio (2215, 10, 'Imagens/FP2215.png', 'Direção');

-- | Procedimento para adicionar um registo na tabela 'Viagem'
DELIMITER $$
CREATE PROCEDURE InserirViagem (IN p_Data_Inicio DATETIME, IN p_Data_Termino DATETIME, IN p_Nr_Participantes INT, IN p_Custo DECIMAL(8,2), IN p_Objetivo ENUM('Pedagógico','Recreativo','Ambos'))
BEGIN
    INSERT INTO Viagem (Data_Início, Data_Término, Nr_Participantes, Custo, Objetivo)
		VALUES (p_Data_Inicio, p_Data_Termino, p_Nr_Participantes, p_Custo, p_Objetivo);
END $$
DELIMITER ;

-- | Povoamento da tabela 'Viagem'
CALL InserirViagem ('2025-04-10 09:00:00', '2025-04-15 18:00:00', 10, 1257.84, 'Ambos');
CALL InserirViagem ('2024-11-20 08:30:00', '2024-11-20 20:00:00', 1, 24.70, 'Recreativo');
CALL InserirViagem ('2025-02-14 10:00:00', '2025-02-14 18:00:00', 2, 120.79, 'Pedagógico');
CALL InserirViagem ('2025-03-05 09:00:00', '2025-03-05 17:30:00', 5, 237.28, 'Recreativo');
CALL InserirViagem ('2025-07-05 07:30:00', '2025-07-09 21:00:00', 4, 1297.58, 'Ambos');

-- | Procedimento para adicionar um registo na tabela 'Deslocamento'
DELIMITER $$
CREATE PROCEDURE InserirDeslocamento (IN p_Tipo_Deslocamento ENUM('Carro','Autocarro','Comboio','Avião','Barco','Navio','Bicicleta','Mota','A pé','Outro'), IN p_Viagem INT UNSIGNED)
BEGIN
    INSERT INTO Deslocamento (Tipo_Deslocamento, Viagem)
		VALUES (p_Tipo_Deslocamento, p_Viagem);
END $$
DELIMITER ;

-- | Povoamento da tabela 'Deslocamento'
CALL InserirDeslocamento ('Avião', 1);
CALL InserirDeslocamento ('Carro', 1);
CALL InserirDeslocamento ('A pé', 1);
CALL InserirDeslocamento ('A pé', 2);
CALL InserirDeslocamento ('Carro', 3);
CALL InserirDeslocamento ('Carro', 4);
CALL InserirDeslocamento ('Barco', 4);
CALL InserirDeslocamento ('A pé', 4);
CALL InserirDeslocamento ('Avião', 5);
CALL InserirDeslocamento ('Autocarro', 5);
CALL InserirDeslocamento ('A pé', 5);

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

-- | Povoamento da tabela 'Paragem'
CALL InserirParagem (1, 1, 'Lisboa', 'Portugal', '2025-04-10 09:00:00', '2025-04-10 12:00:00');
CALL InserirParagem (2, 1, 'Coimbra', 'Portugal', '2025-04-11 10:00:00', '2025-04-11 16:00:00');
CALL InserirParagem (3, 1, 'Porto', 'Portugal', '2025-04-12 09:30:00', '2025-04-13 18:00:00');
CALL InserirParagem (4, 1, 'Vigo', 'Espanha', '2025-04-14 09:00:00', '2025-04-15 18:00:00');
CALL InserirParagem (1, 2, 'Lisboa', 'Portugal', '2024-11-20 08:30:00', '2024-11-20 11:00:00');
CALL InserirParagem (2, 2, 'Sintra', 'Portugal', '2024-11-20 11:30:00', '2024-11-20 20:00:00');
CALL InserirParagem (1, 3, 'Braga', 'Portugal', '2025-02-14 10:00:00', '2025-02-14 13:00:00');
CALL InserirParagem (2, 3, 'Porto', 'Portugal', '2025-02-14 14:00:00', '2025-02-14 18:00:00');
CALL InserirParagem (1, 4, 'Évora', 'Portugal', '2025-03-05 09:00:00', '2025-03-05 11:30:00');
CALL InserirParagem (2, 4, 'Beja', 'Portugal', '2025-03-05 12:30:00', '2025-03-05 15:00:00');
CALL InserirParagem (3, 4, 'Faro', 'Portugal', '2025-03-05 15:30:00', '2025-03-05 17:30:00');
CALL InserirParagem (1, 5, 'Madrid', 'Espanha', '2025-07-05 10:00:00', '2025-07-05 18:00:00');
CALL InserirParagem (2, 5, 'Saragossa', 'Espanha', '2025-07-06 09:00:00', '2025-07-06 17:00:00');
CALL InserirParagem (3, 5, 'Barcelona', 'Espanha', '2025-07-07 09:00:00', '2025-07-07 20:00:00');
CALL InserirParagem (4, 5, 'Valência', 'Espanha', '2025-07-08 09:00:00', '2025-07-08 19:00:00');
CALL InserirParagem (5, 5, 'Alicante', 'Espanha', '2025-07-09 09:00:00', '2025-07-09 21:00:00');

-- | Procedimento para adicionar um registo na tabela 'Foto'
DELIMITER $$
CREATE PROCEDURE InserirFoto (IN p_Foto VARCHAR(100), IN p_Paragem INT UNSIGNED, IN p_Viagem INT UNSIGNED)
BEGIN
    INSERT INTO Foto (Foto, Paragem, Viagem)
		VALUES (p_Foto, p_Paragem, p_Viagem);
END $$
DELIMITER ;

-- | Povoamento da tabela 'Foto'
CALL InserirFoto ('Fotos/Viagem1_Lisboa_01.png', 1, 1);
CALL InserirFoto ('Fotos/Viagem1_Coimbra_01.png', 2, 1);
CALL InserirFoto ('Fotos/Viagem1_Porto_01.png', 3, 1);
CALL InserirFoto ('Fotos/Viagem1_Vigo_01.png', 4, 1);
CALL InserirFoto ('Fotos/Viagem2_Lisboa_01.png', 1, 2);
CALL InserirFoto ('Fotos/Viagem2_Sintra_01.png', 2, 2);
CALL InserirFoto ('Fotos/Viagem3_Braga_01.png', 1, 3);
CALL InserirFoto ('Fotos/Viagem3_Porto_01.png', 2, 3);
CALL InserirFoto ('Fotos/Viagem4_Evora_01.png', 1, 4);
CALL InserirFoto ('Fotos/Viagem4_Beja_01.png', 2, 4);
CALL InserirFoto ('Fotos/Viagem4_Faro_01.png', 3, 4);
CALL InserirFoto ('Fotos/Viagem5_Madrid_01.png', 1, 5);
CALL InserirFoto ('Fotos/Viagem5_Saragossa_01.png', 2, 5);
CALL InserirFoto ('Fotos/Viagem5_Barcelona_01.png', 3, 5);
CALL InserirFoto ('Fotos/Viagem5_Valencia_01.png', 4, 5);
CALL InserirFoto ('Fotos/Viagem5_Alicante_01.png', 5, 5);

-- | Procedimento para adicionar um registo na tabela 'Rel_Sócio_Viagem'
DELIMITER $$
CREATE PROCEDURE InserirRelSocioViagem (IN p_Socio INT UNSIGNED, IN p_Viagem INT UNSIGNED, IN p_Avaliacao ENUM('Muito Negativa','Negativa','Mediana','Positiva','Muito Positiva'), IN p_Comentario VARCHAR(150))
BEGIN
    INSERT INTO Rel_Sócio_Viagem (Sócio, Viagem, Avaliação, Comentário)
		VALUES (p_Socio, p_Viagem, p_Avaliacao, p_Comentario);
END $$
DELIMITER ;

-- | Povoamento da tabela 'Rel_Sócio_Viagem'
CALL InserirRelSocioViagem (1, 1, 'Muito Positiva', 'Excelente organização e muito boa interação entre participantes.');
CALL InserirRelSocioViagem (2, 1, 'Positiva', NULL);
CALL InserirRelSocioViagem (3, 1, 'Positiva', 'Conteúdos pedagógicos relevantes e guias muito prestáveis.');
CALL InserirRelSocioViagem (4, 1, 'Mediana', NULL);
CALL InserirRelSocioViagem (5, 1, 'Positiva', NULL);
CALL InserirRelSocioViagem (6, 1, 'Muito Positiva', NULL);
CALL InserirRelSocioViagem (7, 1, 'Negativa', NULL);
CALL InserirRelSocioViagem (8, 1, 'Mediana', NULL);
CALL InserirRelSocioViagem (9, 1, 'Positiva', NULL);
CALL InserirRelSocioViagem (10, 1, 'Muito Positiva', NULL);
CALL InserirRelSocioViagem (1, 2, 'Positiva', 'Viagem curta mas muito interessante e bem organizada.');
CALL InserirRelSocioViagem (2, 3, 'Muito Positiva', 'Conteúdos pedagógicos muito relevantes, gostei bastante.');
CALL InserirRelSocioViagem (4, 4, 'Positiva', 'Boa logística e atividades divertidas.');
CALL InserirRelSocioViagem (1, 5, 'Positiva', NULL);
CALL InserirRelSocioViagem (2, 5, 'Muito Positiva', NULL);
CALL InserirRelSocioViagem (3, 5, 'Positiva', NULL);
CALL InserirRelSocioViagem (4, 5, 'Muito Positiva', 'A viagem foi excelente, momentos inesquecíveis e muito bem organizada.');

-- | Procedimento para adicionar um registo na tabela 'Patrocinador'
DELIMITER $$
CREATE PROCEDURE InserirPatrocinador (IN p_Nome VARCHAR(40))
BEGIN
    INSERT INTO Patrocinador (Nome)
		VALUES (p_Nome);
END $$
DELIMITER ;

-- | Povoamento da tabela 'Patrocinador'
CALL InserirPatrocinador ('Yari Labs');
CALL InserirPatrocinador ('Accenture');
CALL InserirPatrocinador ('Uphold');

-- | Procedimento para adicionar um registo na tabela 'Rel_Viagem_Patrocinador'
DELIMITER $$
CREATE PROCEDURE InserirRelViagemPatrocinador (IN p_Viagem INT UNSIGNED, IN p_Patrocinador INT UNSIGNED, IN p_Valor DECIMAL(8,2))
BEGIN
    INSERT INTO Rel_Viagem_Patrocinador (Viagem, Patrocinador, Valor)
		VALUES (p_Viagem, p_Patrocinador, p_Valor);
END $$
DELIMITER ;

-- | Povoamento da tabela 'Rel_Viagem_Patrocinador'
CALL InserirRelViagemPatrocinador (1, 1, 1200.00);
CALL InserirRelViagemPatrocinador (1, 2, 600.00);

-- | Procedimento para adicionar um registo na tabela 'Motivo'
DELIMITER $$
CREATE PROCEDURE InserirMotivo (IN p_Motivo VARCHAR(200), IN p_Viagem INT UNSIGNED, IN p_Patrocinador INT UNSIGNED)
BEGIN
    INSERT INTO Motivo (Motivo, Patrocinador, Viagem)
		VALUES (p_Motivo, p_Patrocinador, p_Viagem);
END $$
DELIMITER ;

-- | Povoamento da tabela 'Motivo'
CALL InserirMotivo ('Apoio à viagem coletiva do CeSIUM para cobertura parcial de custos de transporte e alojamento e promoção de atividades pedagógicas e de divulgação.', 1, 1);
CALL InserirMotivo ('Patrocínio da excursão recreativa, destinado a apoio logístico e promoção da marca junto dos participantes.', 1, 2);

-- | Procedimento para adicionar um registo na tabela 'Rel_Utilizador_Viagem'
DELIMITER $$
CREATE PROCEDURE InserirRelUtilizadorViagem (IN p_Utilizador INT UNSIGNED, IN p_Viagem INT UNSIGNED, IN p_Reacao ENUM('Negativa','Positiva'))
BEGIN
    INSERT INTO Rel_Utilizador_Viagem (Utilizador, Viagem, Reação)
		VALUES (p_Utilizador, p_Viagem, p_Reacao);
END $$
DELIMITER ;

-- | Povoamento da tabela 'Rel_Utilizador_Viagem'
CALL InserirRelUtilizadorViagem (1, 1, 'Positiva');
CALL InserirRelUtilizadorViagem (2, 1, 'Positiva');
CALL InserirRelUtilizadorViagem (3, 1, 'Positiva');
CALL InserirRelUtilizadorViagem (4, 1, 'Positiva');
CALL InserirRelUtilizadorViagem (5, 1, 'Positiva');
CALL InserirRelUtilizadorViagem (6, 1, 'Positiva');
CALL InserirRelUtilizadorViagem (7, 1, 'Positiva');
CALL InserirRelUtilizadorViagem (8, 1, 'Positiva');
CALL InserirRelUtilizadorViagem (9, 1, 'Positiva');
CALL InserirRelUtilizadorViagem (10, 1, 'Positiva');
CALL InserirRelUtilizadorViagem (11, 1, 'Positiva');
CALL InserirRelUtilizadorViagem (12, 1, 'Positiva');
CALL InserirRelUtilizadorViagem (13, 1, 'Positiva');
CALL InserirRelUtilizadorViagem (14, 1, 'Negativa');
CALL InserirRelUtilizadorViagem (15, 1, 'Positiva');
CALL InserirRelUtilizadorViagem (16, 1, 'Positiva');
CALL InserirRelUtilizadorViagem (17, 1, 'Positiva');
CALL InserirRelUtilizadorViagem (18, 1, 'Positiva');
CALL InserirRelUtilizadorViagem (19, 1, 'Positiva');
CALL InserirRelUtilizadorViagem (1, 2, 'Positiva');
CALL InserirRelUtilizadorViagem (5, 2, 'Positiva');
CALL InserirRelUtilizadorViagem (8, 2, 'Negativa');
CALL InserirRelUtilizadorViagem (12, 2, 'Positiva');
CALL InserirRelUtilizadorViagem (15, 2, 'Positiva');
CALL InserirRelUtilizadorViagem (2, 3, 'Positiva');
CALL InserirRelUtilizadorViagem (4, 3, 'Positiva');
CALL InserirRelUtilizadorViagem (6, 3, 'Positiva');
CALL InserirRelUtilizadorViagem (9, 3, 'Negativa');
CALL InserirRelUtilizadorViagem (11, 3, 'Positiva');
CALL InserirRelUtilizadorViagem (13, 3, 'Positiva');
CALL InserirRelUtilizadorViagem (17, 3, 'Positiva');
CALL InserirRelUtilizadorViagem (1, 4, 'Positiva');
CALL InserirRelUtilizadorViagem (3, 4, 'Positiva');
CALL InserirRelUtilizadorViagem (5, 4, 'Positiva');
CALL InserirRelUtilizadorViagem (7, 4, 'Positiva');
CALL InserirRelUtilizadorViagem (10, 4, 'Positiva');
CALL InserirRelUtilizadorViagem (14, 4, 'Positiva');
CALL InserirRelUtilizadorViagem (18, 4, 'Positiva');
CALL InserirRelUtilizadorViagem (2, 5, 'Positiva');
CALL InserirRelUtilizadorViagem (4, 5, 'Positiva');
CALL InserirRelUtilizadorViagem (6, 5, 'Positiva');
CALL InserirRelUtilizadorViagem (8, 5, 'Negativa');
CALL InserirRelUtilizadorViagem (9, 5, 'Positiva');
CALL InserirRelUtilizadorViagem (11, 5, 'Positiva');
CALL InserirRelUtilizadorViagem (12, 5, 'Positiva');
CALL InserirRelUtilizadorViagem (13, 5, 'Negativa');
CALL InserirRelUtilizadorViagem (15, 5, 'Positiva');
CALL InserirRelUtilizadorViagem (17, 5, 'Positiva');
CALL InserirRelUtilizadorViagem (19, 5, 'Positiva');
CALL InserirRelUtilizadorViagem (20, 5, 'Positiva');