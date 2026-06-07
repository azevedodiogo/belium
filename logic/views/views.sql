-- | Define a base de dados a ser utilizada
USE BeLIUM_Viagens;



-- | RM11. Calcular o investimento total de cada patrocinador.
CREATE VIEW VisualizarInvestimentoTotal AS
SELECT P.ID, P.Nome, SUM(RVP.Valor) AS Investimento_Total FROM Patrocinador AS P
	LEFT OUTER JOIN Rel_Viagem_Patrocinador AS RVP ON P.ID = RVP.Patrocinador
		GROUP BY P.ID, P.Nome;



-- | RM17. Consultar o número de viagens publicadas por cada sócio (ordenado por número de publicações).
CREATE VIEW VisualizarNrPublicações AS
SELECT S.Nr_Sócio, U.Nome, COUNT(RSV.Viagem) AS Nr_Viagens_Publicadas FROM Utilizador AS U
	INNER JOIN Sócio AS S ON U.ID = S.Utilizador
    LEFT OUTER JOIN Rel_Sócio_Viagem AS RSV ON S.Utilizador = RSV.Sócio
		GROUP BY S.Nr_Sócio, U.Nome
        ORDER BY Nr_Viagens_Publicadas DESC;



-- | RM19. Consultar as viagens mais populares, isto é, com mais visualizações.
CREATE VIEW VisualizarViagensPopulares AS
SELECT V.ID, V.Data_Início, V.Data_Término, V.Nr_Participantes, V.Custo, V.Objetivo, COUNT(RUV.Viagem) AS Nr_Visualizações FROM Viagem AS V
	LEFT OUTER JOIN Rel_Utilizador_Viagem AS RUV ON V.ID = RUV.Viagem
		GROUP BY V.ID, V.Data_Início, V.Data_Término, V.Nr_Participantes, V.Custo, V.Objetivo
        ORDER BY Nr_Visualizações DESC
        LIMIT 10;