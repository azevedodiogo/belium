-- | Define a base de dados a ser utilizada
USE BeLIUM_Viagens;



-- | Elimina o utilizador administrador
DROP USER IF EXISTS 'ADMIN'@'localhost';

-- | Elimina o utilizador sócio
DROP USER IF EXISTS 'SOCIO'@'localhost';

-- | Elimina o utilizador utilizador
DROP USER IF EXISTS 'UTILIZADOR'@'localhost';