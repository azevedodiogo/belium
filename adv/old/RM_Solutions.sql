-- | Define a base de dados a ser utilizada
USE BeLIUM_Viagens;



-- | RM3. Listar, por ordem, todas as paragens de uma dada viagem.
SELECT Nr, País, Cidade, Data_Chegada, Data_Partida FROM Paragem
	WHERE Viagem = ?
    ORDER BY Data_Chegada ASC;



-- | RM4. Listar todos os sócios (número de sócio, nome e estatuto) que realizaram uma determinada viagem (por ordem alfabética).
SELECT U.Nome, S.Nr_Sócio, S.Estatuto FROM Sócio AS S
	INNER JOIN Rel_Sócio_Viagem AS RSV ON RSV.Sócio = S.Utilizador
	INNER JOIN Utilizador AS U ON U.ID = S.Utilizador
		WHERE RSV.Viagem = ?
		ORDER BY U.Nome ASC;



-- | RM6. Consultar os patrocínios (nome do patrocinador e valor) de uma dada viagem, ordenados pelo valor.
SELECT P.ID, P.Nome, RVP.Valor FROM Patrocinador AS P
	INNER JOIN  Rel_Viagem_Patrocinador AS RVP ON P.ID = RVP.Patrocinador
		WHERE RVP.Viagem = ?
        ORDER BY RVP.Valor ASC, P.Nome ASC;



-- | RM8. Filtrar viagens pela localização (país e cidade) das paragens.
SELECT DISTINCT V.* FROM Viagem AS V
	INNER JOIN Paragem AS P ON V.ID = P.Viagem
		WHERE (? IS NULL OR P.País = ?) AND (? IS NULL OR P.Cidade = ?);



-- | RM9. Filtrar viagens pelas datas, pelo custo e pelo objetivo.
SELECT * FROM Viagem
	WHERE (? IS NULL OR Data_Início >= ?) AND
		  (? IS NULL OR Data_Término <= ?) AND
          (? IS NULL OR Custo >= ?) AND
          (? IS NULL OR Custo <= ?) AND
          (? IS NULL OR Objetivo = ?);



-- | RM11. Calcular o investimento total de cada patrocinador.
SELECT P.ID, P.Nome, SUM(RVP.Valor) AS Investimento_Total FROM Patrocinador AS P
	LEFT OUTER JOIN Rel_Viagem_Patrocinador AS RVP ON P.ID = RVP.Patrocinador
		GROUP BY P.ID, P.Nome;


        
-- | RM12. Calcular a média de investimento de um patrocinador por viagem.
SELECT ROUND(AVG(Valor),2) AS Investimento_Médio FROM Rel_Viagem_Patrocinador
	WHERE Patrocinador = ?;
        

        
-- | RM15. Listar as viagens realizadas por um sócio (através do número de sócio).
SELECT V.* FROM Viagem AS V
	INNER JOIN Rel_Sócio_Viagem AS RSV ON V.ID = RSV.Viagem
    INNER JOIN Sócio AS S ON S.Utilizador = RSV.Sócio
		WHERE S.Nr_Sócio = ?
        ORDER BY V.Data_Início DESC;



-- | RM16. Consultar os motivos de um patrocínio.
SELECT Motivo FROM Motivo
	WHERE Viagem = ? AND Patrocinador = ?;



-- | RM17. Consultar o número de viagens publicadas por cada sócio (ordenado por número de publicações).
SELECT S.Nr_Sócio, U.Nome, COUNT(RSV.Viagem) AS Nr_Viagens_Publicadas FROM Utilizador AS U
	INNER JOIN Sócio AS S ON U.ID = S.Utilizador
    LEFT OUTER JOIN Rel_Sócio_Viagem AS RSV ON S.Utilizador = RSV.Sócio
		GROUP BY S.Nr_Sócio, U.Nome
        ORDER BY Nr_Viagens_Publicadas DESC;



-- | RM18. Filtrar viagens por percentagem de reações positivas (ordenado por percentagem).
SELECT V.*, P.Percentagem FROM Viagem AS V
	INNER JOIN (
		SELECT Viagem, CalcularPercentagemPositiva(Viagem) AS Percentagem FROM Rel_Utilizador_Viagem AS RUV
			GROUP BY Viagem
		) AS P ON V.ID = P.Viagem
			WHERE P.Percentagem >= ?
            ORDER BY P.Percentagem DESC;



-- | RM19. Consultar as viagens mais populares, isto é, com mais visualizações.
SELECT V.*, COUNT(RUV.Viagem) AS Nr_Visualizações FROM Viagem AS V
	LEFT OUTER JOIN Rel_Utilizador_Viagem AS RUV ON V.ID = RUV.Viagem
		GROUP BY V.ID
        ORDER BY Nr_Visualizações DESC
        LIMIT 10;
        
        

-- | RM20. Consultar as opiniões dos sócios em relação a uma dada viagem.
SELECT S.Nr_Sócio, RSV.Avaliação, RSV.Comentário FROM Rel_Sócio_Viagem AS RSV
	INNER JOIN Sócio AS S ON S.Utilizador = RSV.Sócio
		WHERE Viagem = ?;