
# BeLIUM Viagens

Este repositório foi concebido para o projeto ‘BeLIUM Viagens’, desenvolvido no âmbito da unidade curricular “Base de Dados”, lecionada no segundo ano da Licenciatura em Engenharia Informática.  Trata-se de um projeto académico com um contexto de natureza fictícia.

O desígnio primordial deste sistema reside na centralização, organização e preservação do registo histórico das viagens e iniciativas pedagógicas promovidas pelo CeSIUM (Centro de Estudantes de Engenharia Informática da Universidade do Minho). Identificou-se que, não obstante o vasto património de atividades realizadas por diversas gerações, a informação encontrava-se dispersa por canais informais e documentos isolados, comprometendo a memória institucional e dificultando o planeamento estratégico de eventos futuros.

Neste contexto, o sistema surge como uma solução estruturada para mitigar a fragmentação de dados. Ao implementar um repositório centralizado, o projeto visa facilitar a tomada de decisão sobre destinos e orçamentos, otimizar recursos e, fundamentalmente, criar um portfólio público que perpetue a cultura e as experiências da comunidade académica e da sua comunidade *alumni*.

A arquitetura do sistema foi meticulosamente desenhada em estrita conformidade com o ciclo de vida de desenvolvimento de uma base de dados. O processo iniciou-se com a modelação conceptual, recorrendo à ferramenta *brModelo* para a construção de Diagramas Entidade-Relacionamento (ER), permitindo uma representação visual clara das entidades e das suas interdependências.

Na fase subsequente de modelação lógica, efetuada no *MySQL Workbench*, a estrutura foi refinada através de processos rigorosos de normalização até à Terceira Forma Normal (3FN). Este procedimento garantiu a integridade referencial dos dados e a eliminação de redundâncias. A validação teórica das interrogações e da estrutura relacional foi assegurada através de Álgebra Relacional, com recurso à calculadora *RelaX*. A concretização física do projeto materializou-se no Sistema de Gestão de Bases de Dados MySQL.


<table border="0">
 <tr>
    <td align="center" width="50%">
       <img src="./docs/er_diagram.png" alt="Diagrama ER" width="100%">
       <br>
       <b>Figura 1:</b> Diagrama Entidade-Relacionamento (ER)
    </td>
    <td align="center" width="50%">
       <img src="./docs/logical_schema.png" alt="Esquema Lógico" width="100%">
       <br>
       <b>Figura 2:</b> Esquema Lógico Relacional (MySQL)
    </td>
 </tr>
</table>


O sistema implementa uma hierarquia de privilégios robusta, estruturada em três níveis de acesso distintos, com o objetivo de assegurar a segurança e a correta gestão da informação.

1. **Administração:** Este perfil confere controlo integral sobre a plataforma, responsabilizando-se pela gestão de utilizadores, manutenção da base de dados e supervisão de aspetos financeiros, incluindo a gestão de patrocínios.

2. **Sócio:** Destinado aos membros do núcleo, este perfil permite a criação e gestão de conteúdos.  Os sócios têm a possibilidade de registar novas viagens, definir itinerários, carregar registos fotográficos e atribuir feedback às atividades.

3. **Utilizador:** Este perfil oferece acesso público ou geral, com permissões restritas à consulta de informação e interação básica através de reações às viagens publicadas.

A infraestrutura tecnológica do projeto alicerça-se no MySQL enquanto motor da base de dados, complementado por ferramentas de modelação (_brModelo_ e *MySQL Workbench*) e validação teórica (*Calculadora RelaX*).

A estrutura do repositório foi desenhada para promover a modularidade e facilitar a manutenção contínua do código. O diretório `src` centraliza os componentes estruturais do ciclo de vida da base de dados, contendo os *scripts* essenciais para a criação do esquema, a definição das tabelas e restrições, bem como a gestão administrativa de utilizadores. Paralelamente, o diretório `adv` agrega a lógica de negócio avançada, incluindo procedimentos armazenados (*stored procedures*) para povoamento e autenticação, vistas (*views*) para análise estatística, índices para otimização de desempenho e o conjunto de interrogações (*queries*) de manipulação de dados.
