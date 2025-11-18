-- | Define a base de dados a ser utilizada
USE BeLIUM_Viagens;



-- | Cria o utilizador utilizador
CREATE USER IF NOT EXISTS 'UTILIZADOR'@'localhost' IDENTIFIED BY 'BeLIUM_Viagens_UTILIZADOR_1025';

-- | Cria o utilizador sócio
CREATE USER IF NOT EXISTS 'SOCIO'@'localhost' IDENTIFIED BY 'BeLIUM_Viagens_SOCIO_2047';

-- | Cria o utilizador administrador
CREATE USER IF NOT EXISTS 'ADMIN'@'localhost' IDENTIFIED BY 'BeLIUM_Viagens_VDBS';



-- | RC1. Para se registar, um utilizador deve pedir diretamente a um administrador ou enviar um pedido, por email. Se o pedido for aceite, um administrador deve registá-lo no sistema e comunicá-lo do seu ID e da sua password.
GRANT INSERT ON BeLIUM_Viagens.Utilizador TO 'ADMIN'@'localhost';

-- | RC2. Um utilizador pode consultar todos os dados dos sócios, das viagens e das paragens no sistema.
GRANT SELECT ON BeLIUM_Viagens.Sócio TO 'UTILIZADOR'@'localhost';
GRANT SELECT ON BeLIUM_Viagens.Viagem TO 'UTILIZADOR'@'localhost';
GRANT SELECT ON BeLIUM_Viagens.Paragem TO 'UTILIZADOR'@'localhost';
GRANT SELECT ON BeLIUM_Viagens.Deslocamento TO 'UTILIZADOR'@'localhost';
GRANT SELECT ON BeLIUM_Viagens.Foto TO 'UTILIZADOR'@'localhost';

-- | RC3. Um utilizador pode atualizar a sua password, se souber a atual.
GRANT EXECUTE ON PROCEDURE MudarPassword TO 'UTILIZADOR'@'localhost';

-- | RC5. Utilizadores podem visualizar e reagir às viagens. Podem, também, atualizar ou remover a visualização.
GRANT EXECUTE ON PROCEDURE InserirVisualização TO 'UTILIZADOR'@'localhost';
GRANT EXECUTE ON PROCEDURE AtualizarVisualização TO 'UTILIZADOR'@'localhost';
GRANT EXECUTE ON PROCEDURE RemoveVisualização TO 'UTILIZADOR'@'localhost';

-- | RC6. Os sócios possuem todas as permissões dos utilizadores.
GRANT SELECT ON BeLIUM_Viagens.Sócio TO 'SOCIO'@'localhost';
GRANT SELECT ON BeLIUM_Viagens.Viagem TO 'SOCIO'@'localhost';
GRANT SELECT ON BeLIUM_Viagens.Paragem TO 'SOCIO'@'localhost';
GRANT SELECT ON BeLIUM_Viagens.Deslocamento TO 'SOCIO'@'localhost';
GRANT SELECT ON BeLIUM_Viagens.Foto TO 'SOCIO'@'localhost';
GRANT EXECUTE ON PROCEDURE MudarPassword TO 'SOCIO'@'localhost';
GRANT EXECUTE ON PROCEDURE InserirVisualização TO 'SOCIO'@'localhost';
GRANT EXECUTE ON PROCEDURE AtualizarVisualização TO 'SOCIO'@'localhost';
GRANT EXECUTE ON PROCEDURE RemoveVisualização TO 'SOCIO'@'localhost';

-- | RC7. Os sócios podem inserir novas viagens, assim como as suas paragens. Podem, também, editá-las ou removê-las, caso necessário.
GRANT INSERT, UPDATE, DELETE ON BeLIUM_Viagens.Viagem TO 'SOCIO'@'localhost';
GRANT INSERT, UPDATE, DELETE ON BeLIUM_Viagens.Paragem TO 'SOCIO'@'localhost';
GRANT INSERT, UPDATE, DELETE ON BeLIUM_Viagens.Deslocamento TO 'SOCIO'@'localhost';
GRANT INSERT, UPDATE, DELETE ON BeLIUM_Viagens.Foto TO 'SOCIO'@'localhost';

-- | RC8. Os sócios podem consultar todos os dados no sistema, à excessão dos dados pessoais dos utilizadores.
GRANT SELECT ON BeLIUM_Viagens.Rel_Utilizador_Viagem TO 'SOCIO'@'localhost';
GRANT SELECT ON BeLIUM_Viagens.Rel_Sócio_Viagem TO 'SOCIO'@'localhost';
GRANT SELECT ON BeLIUM_Viagens.Rel_Viagem_Patrocinador TO 'SOCIO'@'localhost';
GRANT SELECT ON BeLIUM_Viagens.Patrocinador TO 'SOCIO'@'localhost';
GRANT SELECT ON BeLIUM_Viagens.Motivo TO 'SOCIO'@'localhost';

-- | RC9. Um sócio pode publicar uma viagem com os respetivos avaliação e comentário. Pode, ainda, editar ou eliminar esta publicação.
GRANT INSERT, UPDATE, DELETE ON BeLIUM_Viagens.Rel_Sócio_Viagem TO 'SOCIO'@'localhost';

-- | RC10. Os administradores (membros do CCP) podem realizar qualquer tipo de operação no sistema, incluindo alterações nucleares, caso necessário.
-- | RC11. Eventualmente, se necessário, sócios de confiança podem obter o estatudo de administrador do sistema (permissão atribuída por outros administradores).
GRANT ALL PRIVILEGES ON BeLIUM_Viagens.* TO 'ADMIN'@'localhost' WITH GRANT OPTION;

-- | Definição das permissões das vistas
GRANT SELECT ON BeLIUM_Viagens.VisualizarInvestimentoTotal TO 'SOCIO'@'localhost', 'ADMIN'@'localhost';
GRANT SELECT ON BeLIUM_Viagens.VisualizarNrPublicações TO 'UTILIZADOR'@'localhost', 'SOCIO'@'localhost', 'ADMIN'@'localhost';
GRANT SELECT ON BeLIUM_Viagens.VisualizarViagensPopulares TO 'UTILIZADOR'@'localhost', 'SOCIO'@'localhost', 'ADMIN'@'localhost';

-- | Definição das permissões das funções
GRANT EXECUTE ON FUNCTION CalcularInvestimentoTotal TO 'SOCIO'@'localhost', 'ADMIN'@'localhost';
GRANT EXECUTE ON FUNCTION CalcularInvestimentoMédio TO 'SOCIO'@'localhost', 'ADMIN'@'localhost';
GRANT EXECUTE ON FUNCTION CalcularPercentagemPositiva TO 'UTILIZADOR'@'localhost', 'SOCIO'@'localhost', 'ADMIN'@'localhost';

-- | Definição das permissões de inserção
GRANT EXECUTE ON PROCEDURE InserirViagem TO 'SOCIO'@'localhost', 'ADMIN'@'localhost';
GRANT EXECUTE ON PROCEDURE InserirDeslocamento TO 'SOCIO'@'localhost', 'ADMIN'@'localhost';
GRANT EXECUTE ON PROCEDURE InserirParagem TO 'SOCIO'@'localhost', 'ADMIN'@'localhost';
GRANT EXECUTE ON PROCEDURE InserirFoto TO 'SOCIO'@'localhost', 'ADMIN'@'localhost';



-- | Reseta os privilégios
FLUSH PRIVILEGES;