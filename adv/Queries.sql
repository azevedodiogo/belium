-- | RM3. Ligeiramente diferente
SELECT Nr, Localização, Data_Chegada, Data_Partida
	FROM Paragem
    WHERE Viagem = '?'
    ORDER BY Nr ASC;

-- | RM4. Equivalente
SELECT u.ID, u.Nome
	FROM Utilizador u
    JOIN Sócio s ON u.ID = s.Utilizador
	JOIN Rel_Sócio_Viagem sv ON sv.Sócio = s.Nr_Sócio
	WHERE sv.Viagem = '?'
    ORDER BY u.Nome ASC;

-- | RM6. Ligeiramente diferente
SELECT vp.Viagem, p.ID, p.Nome, vp.Valor
	FROM Rel_Viagem_Patrocinador vp
	JOIN Patrocinador p ON p.ID = vp.Patrocinador;

-- | RM8. Diferente
SELECT ID, Data_Início, Data_Término, Nr_Paragens, Nr_Participantes, Custo, Objetivo 
	FROM Viagem v
    INNER JOIN Paragem p ON p.Viagem = v.ID
    WHERE País = '?';

-- | RM8. Diferente
SELECT ID, Data_Início, Data_Término, Nr_Paragens, Nr_Participantes, Custo, Objetivo 
	FROM Viagem v
    INNER JOIN Paragem p ON p.Viagem = v.ID
    WHERE Cidade = '?';
    
-- | RM9. Diferente
SELECT * 
	FROM Viagem 
    WHERE Data_Início >= '?' AND Data_Término = '?';

-- | RM9. Diferente
SELECT * 
	FROM Viagem 
    WHERE Custo = '?';

-- | RM8/9. Diferente
SELECT ID, Data_Início, Data_Término, Nr_Paragens, Nr_Participantes, Custo, Objetivo 
	FROM Viagem v
    INNER JOIN Paragem p ON p.Viagem = v.ID
    WHERE v.Data_Início >= '?' AND v.Data_Término <= '?' AND v.Custo <= '?' AND p.País = '?' AND p.Cidade = '?';

-- | RM11. Ligeiramente diferente
SELECT ID, Nome, SUM (Valor) AS Total
	FROM Patrocinador p
    INNER JOIN Rel_Viagem_Patrocinador vp ON p.ID = vp.Patrocinador
    GROUP BY p.ID, p.Nome;

-- | RM12. Ligeiramente diferente
SELECT ID, Nome, ROUND (AVG(vp.Valor), 2) AS Média
	FROM Patrocinador p
    INNER JOIN Rel_Viagem_Patrocinador vp ON p.ID = vp.Patrocinador
    GROUP BY p.ID, p.Nome;
    
-- | RM16. Ligeiramente diferente
SELECT S.Nr_Sócio, U.Nome, COUNT (sv.Viagem) AS Nr_Viagens_Publicadas
	FROM Sócio s
    LEFT JOIN Rel_Sócio_Viagem sv ON s.Utilizador = sv.Sócio
    INNER JOIN Utilizador u ON s.Utilizador = u.ID
    GROUP BY S.Nr_Sócio, U.Nome;

-- | RM17. Diferente
SELECT 
    V.ID AS ID_Viagem,
    V.Objetivo,
    V.Data_Início,
    (SUM(CASE WHEN RUV.Reação = 'Positiva' THEN 1 ELSE 0 END) / COUNT(RUV.Utilizador) * 100) AS Percentagem_Positiva
FROM Viagem AS V
JOIN Rel_Utilizador_Viagem AS RUV ON V.ID = RUV.Viagem
GROUP BY V.ID, V.Objetivo, V.Data_Início
HAVING Percentagem_Positiva > 70
ORDER BY Percentagem_Positiva DESC;
    
-- | RM18. Equivalente
SELECT v.*, COUNT (u.Viagem) AS Nr_Visualizações
	FROM Viagens v
    LEFT JOIN Rel_Utilizador_Viagem uv ON v.ID = uv.Viagem
    GROUP BY v.ID
    ORDER BY Nr_Visualizações;