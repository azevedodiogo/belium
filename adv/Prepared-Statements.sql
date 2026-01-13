-- | RM3
PREPARE RM3 FROM 
'SELECT Nr, País, Cidade, Data_Chegada, Data_Partida 
     FROM Paragem 
     WHERE Viagem = ? 
     ORDER BY Data_Chegada ASC;';
SET @ViagemRM3 = 1;
EXECUTE RM3 USING @ViagemRM3;
DEALLOCATE PREPARE RM3;

-- | RM4
PREPARE RM4 FROM
'SELECT U.Nome, S.Nr_Sócio, S.Estatuto FROM Sócio AS S
     INNER JOIN Rel_Sócio_Viagem AS RSV ON RSV.Sócio = S.Utilizador
     INNER JOIN Utilizador AS U ON U.ID = S.Utilizador
         WHERE RSV.Viagem = ?
         ORDER BY U.Nome ASC;';
SET @ViagemRM4 = 1;
EXECUTE RM4 USING @ViagemRM4;
DEALLOCATE PREPARE RM4;

-- | RM6
PREPARE RM6 FROM 
'SELECT P.ID, P.Nome, RVP.Valor FROM Patrocinador AS P
     INNER JOIN Rel_Viagem_Patrocinador AS RVP
ON P.ID = RVP.Patrocinador
         WHERE RVP.Viagem = ?
         ORDER BY RVP.Valor ASC, P.Nome ASC;';
SET @ViagemRM6 = 1;
EXECUTE RM6 USING @ViagemRM6;
DEALLOCATE PREPARE RM6;

-- | RM12
PREPARE RM12 FROM 
'SELECT CalcularInvestimentoMédio(P.ID) AS Investimento_Médio
FROM Rel_Viagem_Patrocinador
WHERE Patrocinador = ?;';
SET @IdRM12 = 1;
EXECUTE RM12 USING @IdRM12;
DEALLOCATE PREPARE RM12;

-- | RM15
PREPARE RM15 FROM 
'SELECT V.* FROM Viagem AS V
     INNER JOIN Rel_Sócio_Viagem AS RSV ON V.ID = RSV.Viagem
     INNER JOIN Sócio AS S ON S.Utilizador = RSV.Sócio
         WHERE S.Nr_Sócio = ?
         ORDER BY V.Data_Início DESC;';
SET @SocioRM15 = 123;
EXECUTE RM15 USING @SocioRM15;
DEALLOCATE PREPARE RM15;

-- | RM16
PREPARE RM16 FROM 
'SELECT Motivo FROM Motivo
     WHERE Viagem = ? AND Patrocinador = ?;';
SET @ViagemRM16 = 1;
SET @PatrocinadorRM16 = 5;
EXECUTE RM16 USING @ViagemRM16, @PatrocinadorRM16;
DEALLOCATE PREPARE RM16;

-- | RM20
PREPARE RM20 FROM 
'SELECT S.Nr_Sócio, RSV.Avaliação, RSV.Comentário
FROM Rel_Sócio_Viagem AS RSV
     INNER JOIN Sócio AS S ON S.Utilizador = RSV.Sócio
     WHERE Viagem = ?;';
SET @ViagemRM20 = 2;
EXECUTE RM20 USING @ViagemRM20;
DEALLOCATE PREPARE RM20;