-- | Define a base de dados a ser utilizada
USE BeLIUM_Viagens;



-- | Elimina a tabela do tipo de deslocamento da viagem
DROP TABLE IF EXISTS Deslocamento;

-- | Elimina a tabela da foto da paragem
DROP TABLE IF EXISTS Foto;

-- | Elimina a tabela do motivo do patrocínio
DROP TABLE IF EXISTS Motivo;

-- | Elimina a tabela do relacionamento entre o utilizador e a viagem
DROP TABLE IF EXISTS Rel_Utilizador_Viagem;

-- | Elimina a tabela do relacionamento entre o sócio e a viagem
DROP TABLE IF EXISTS Rel_Sócio_Viagem;

-- | Elimina a tabela do relacionamento entre a viagem e o patrocinador
DROP TABLE IF EXISTS Rel_Viagem_Patrocinador;

-- | Elimina a tabela do sócio
DROP TABLE IF EXISTS Sócio;

-- | Elimina a tabela da paragem
DROP TABLE IF EXISTS Paragem;

-- | Elimina a tabela do utilizador
DROP TABLE IF EXISTS Utilizador;

-- | Elimina a tabela da viagem
DROP TABLE IF EXISTS Viagem;

-- | Elimina a tabela do patrocinador
DROP TABLE IF EXISTS Patrocinador;