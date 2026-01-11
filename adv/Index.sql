-- | Define a base de dados a ser utilizada
USE BeLIUM_Viagens;



-- | RM3
CREATE INDEX IDX_Paragem_Data_Chegada ON Paragem (Data_Chegada);

-- | RM8
CREATE INDEX IDX_Paragem_Localização ON Paragem (País, Cidade);

-- | RM9
CREATE INDEX IDX_Viagem_Detalhes ON Viagem (Data_Início, Data_Término, Custo, Objetivo);

-- | RM18
CREATE INDEX IDX_Rel_Utilizador_Viagem_Reação ON Rel_Utilizador_Viagem (Reação);