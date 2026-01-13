-- | Define a base de dados a ser utilizada
USE BeLIUM_Viagens;



-- | RM11. Calcular o investimento total de cada patrocinador.
DELIMITER $$
CREATE FUNCTION CalcularInvestimentoTotal (ID_Patrocinador INT)
	RETURNS DECIMAL(10,2) DETERMINISTIC
BEGIN
	RETURN (SELECT SUM(Valor) FROM Rel_Viagem_Patrocinador
		WHERE Patrocinador = ID_Patrocinador);
END $$
DELIMITER ;



-- | RM12. Calcular a média de investimento de um patrocinador por viagem.
DELIMITER $$
CREATE FUNCTION CalcularInvestimentoMédio (ID_Patrocinador INT)
	RETURNS DECIMAL(10,2) DETERMINISTIC
BEGIN
	 RETURN (SELECT ROUND(AVG(Valor),2) FROM Rel_Viagem_Patrocinador
		WHERE Patrocinador = ID_Patrocinador);
END $$
DELIMITER ;



-- | Determina a percentagem de reações positivas de uma viagem
DELIMITER $$
CREATE FUNCTION CalcularPercentagemPositiva (ID_Viagem INT)
	RETURNS INT DETERMINISTIC
BEGIN
	 RETURN (SELECT ROUND(100.0 * SUM(CASE WHEN Reação = 'Positiva' THEN 1 ELSE 0 END) / NULLIF(COUNT(*),0)) FROM Rel_Utilizador_Viagem
		WHERE Viagem = ID_Viagem);
END $$
DELIMITER ;