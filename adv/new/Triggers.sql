-- | Define a base de dados a ser utilizada
USE BeLIUM_Viagens;



-- | Atualiza o número de paragens associado a uma viagem
DELIMITER $$
CREATE TRIGGER AtualizaNrParagens AFTER INSERT ON Paragem FOR EACH ROW
BEGIN
	UPDATE Viagem
		SET Nr_Paragens = Nr_Paragens + 1
		WHERE ID = NEW.Viagem;
END $$
DELIMITER ;