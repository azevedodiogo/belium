-- | Define a base de dados a ser utilizada
USE BeLIUM_Viagens;



-- | Cria a tabela do utilizador
CREATE TABLE IF NOT EXISTS Utilizador (

	-- | Define as colunas da tabela
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT, -- UNSIGNED para evitar IDs negativos e AUTO_INCREMENT para gerar IDs automaticamente.
    Nome VARCHAR(100) NOT NULL, 
    Telemóvel VARCHAR(13) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE, -- UNIQUE para garantir que cada email é único na tabela e facilitar procuras futuras. Ao ser UNIQUE um índice é criado automaticamente.
    Pass_Word VARCHAR(100) NOT NULL,    -- Pass_Word para evitar conflito com a palavra reservada PASSWORD.

    -- | Define a chave primária
	PRIMARY KEY (ID),
    
    -- | Define as restrições
    CHECK (Telemóvel LIKE '+%'),   -- O CHECK garante que o telemóvel começa com '+'.
    CHECK (Email LIKE '%@%.%')     -- O CHECK garante que o email tem um formato básico válido.
);



-- | Cria a tabela do sócio
CREATE TABLE IF NOT EXISTS Sócio (
	
    -- | Define as colunas da tabela
    Utilizador INT UNSIGNED NOT NULL,
    Nr_Sócio INT UNSIGNED NOT NULL UNIQUE,
    Foto_Perfil VARCHAR(100) NULL,
    Estatuto ENUM('Direção','Alumni') NULL, -- ENUM para limitar os valores possíveis.
    
    -- | Define a chave primária
    PRIMARY KEY (Utilizador),
    
    -- | Define a chave estranjeira
    CONSTRAINT FK_Sócio_To_Utilizador FOREIGN KEY (Utilizador) REFERENCES Utilizador(ID), -- CONSTRAINT para definir a chave estrangeira que referencia a tabela Utilizador.
    
    -- | Define a restrição
    CHECK (Foto_Perfil IS NULL OR Foto_Perfil LIKE 'Imagens/%.png') -- O CHECK garante que a foto de perfil é nula ou tem o formato correto.
);



-- | Cria a tabela da viagem
CREATE TABLE IF NOT EXISTS Viagem (

	-- | Define as colunas da tabela
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Data_Início DATETIME NOT NULL,
    Data_Término DATETIME NOT NULL,
    Nr_Paragens INT NOT NULL DEFAULT 0,
    Nr_Participantes INT NOT NULL,
    Custo DECIMAL(8,2) NOT NULL,
    Objetivo ENUM('Pedagógico','Recreativo','Ambos') NOT NULL, -- ENUM para limitar os valores possíveis.
    
    -- | Define a chave primária
    PRIMARY KEY (ID),
    
    -- | Define as restrições
    CHECK (Data_Início < Data_Término),
    CHECK (Nr_Paragens >= 0),
    CHECK (Nr_Participantes >= 0),
    CHECK (Custo > 0)
);



-- | Cria a tabela da paragem
CREATE TABLE IF NOT EXISTS Paragem (

	-- | Define as colunas da tabela
    Nr INT UNSIGNED NOT NULL,
    Viagem INT UNSIGNED NOT NULL,
    Cidade VARCHAR(50) NOT NULL,
    País VARCHAR(50) NOT NULL,
    Data_Chegada DATETIME NOT NULL,
    Data_Partida DATETIME NOT NULL,
    
    -- | Define a chave primária
    PRIMARY KEY (Nr,Viagem), -- Chave primária composta por Nr e Viagem. Reforça o facto de a entidade 'Paragem' ser uma entidade fraca dependente de 'Viagem'.
    
    -- | Define a chave estranjeira
    CONSTRAINT FK_Paragem_To_Viagem FOREIGN KEY (Viagem) REFERENCES Viagem(ID),
    
    -- | Define a restrição
    CHECK (Data_Chegada < Data_Partida)
);



-- | Cria a tabela do patrocinador
CREATE TABLE IF NOT EXISTS Patrocinador (

	-- | Define as colunas da tabela
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(40) NOT NULL,
    
    -- | Define a chave primária
    PRIMARY KEY (ID)
);



-- | Cria a tabela do relacionamento entre o utilizador e a viagem
CREATE TABLE IF NOT EXISTS Rel_Utilizador_Viagem (

	-- | Define as colunas da tabela
    Utilizador INT UNSIGNED NOT NULL,
    Viagem INT UNSIGNED NOT NULL,
    Reação ENUM('Negativa','Positiva') NOT NULL,
    
    -- | Define a chave primária
    PRIMARY KEY (Utilizador,Viagem),
    
    -- | Define as chaves estranjeiras
    CONSTRAINT FK_Rel_Utilizador_Viagem_To_Utilizador FOREIGN KEY (Utilizador) REFERENCES Utilizador(ID),
    CONSTRAINT FK_Rel_Utilizador_Viagem_To_Viagem FOREIGN KEY (Viagem) REFERENCES Viagem(ID)
);



-- | Cria a tabela do relacionamento entre o sócio e a viagem
CREATE TABLE IF NOT EXISTS Rel_Sócio_Viagem (

    -- | Define as colunas da tabela
    Sócio INT UNSIGNED NOT NULL,
    Viagem INT UNSIGNED NOT NULL,
    Avaliação ENUM('Muito Negativa','Negativa','Mediana','Positiva','Muito Positiva') NOT NULL,
    Comentário VARCHAR(150) NULL,
    
    -- | Define a chave primária
    PRIMARY KEY (Sócio,Viagem),
    
    -- | Define as chaves estranjeiras
    CONSTRAINT FK_Rel_Sócio_Viagem_To_Sócio FOREIGN KEY (Sócio) REFERENCES Sócio(Utilizador),
    CONSTRAINT FK_Rel_Sócio_Viagem_To_Viagem FOREIGN KEY (Viagem) REFERENCES Viagem(ID)
);



-- | Cria a tabela do relacionamento entre a viagem e o patrocinador
CREATE TABLE IF NOT EXISTS Rel_Viagem_Patrocinador (

	-- | Define as colunas da tabela
    Viagem INT UNSIGNED NOT NULL,
    Patrocinador INT UNSIGNED NOT NULL,
    Valor DECIMAL(8,2) NOT NULL,
    
    -- | Define a chave primária
    PRIMARY KEY (Viagem,Patrocinador),
    
    -- | Define as chaves estranjeiras
    CONSTRAINT FK_Rel_Viagem_Patrocinador_To_Viagem FOREIGN KEY (Viagem) REFERENCES Viagem(ID),
    CONSTRAINT FK_Rel_Viagem_Patrocinador_To_Patrocinador FOREIGN KEY (Patrocinador) REFERENCES Patrocinador(ID),
    
    -- | Define a restrição
    CHECK (Valor > 0)
);



-- | Cria a tabela do tipo de deslocamento da viagem
CREATE TABLE IF NOT EXISTS Deslocamento (

	-- | Define as colunas da tabela
    Tipo_Deslocamento ENUM('Carro','Autocarro','Comboio','Avião','Barco','Navio','Bicicleta','Mota','A pé','Outro') NOT NULL,
    Viagem INT UNSIGNED NOT NULL,
    
    -- | Define a chave primária
    PRIMARY KEY (Tipo_Deslocamento,Viagem),
    
    -- | Define a chave estranjeira
    CONSTRAINT FK_Deslocamento_To_Viagem FOREIGN KEY (Viagem) REFERENCES Viagem(ID)
);



-- | Cria a tabela da foto da paragem
CREATE TABLE IF NOT EXISTS Foto (

	-- | Define as colunas da tabela
    Foto VARCHAR(100) NOT NULL,
    Paragem INT UNSIGNED NOT NULL,
    Viagem INT UNSIGNED NOT NULL,
    
    -- | Define a chave primária
    PRIMARY KEY (Foto,Paragem,Viagem),
    
    -- | Define a chave estranjeira
    CONSTRAINT FK_Foto_To_Paragem FOREIGN KEY (Paragem,Viagem) REFERENCES Paragem(Nr,Viagem),
    
    -- | Define a restrição
    CHECK (Foto LIKE 'Fotos/%.png')
);



-- | Cria a tabela do motivo do patrocínio
CREATE TABLE IF NOT EXISTS Motivo (

	-- | Define as colunas da tabela
    Motivo VARCHAR(200) NOT NULL,
    Patrocinador INT UNSIGNED NOT NULL,
    Viagem INT UNSIGNED NOT NULL,
    
    -- | Define a chave primária
    PRIMARY KEY (Motivo,Patrocinador,Viagem),
    
    -- | Define a chave estranjeira
    CONSTRAINT FK_Motivo_To_Rel_Viagem_Patrocinador FOREIGN KEY (Viagem,Patrocinador) REFERENCES Rel_Viagem_Patrocinador(Viagem,Patrocinador)
);