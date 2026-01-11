# BeLIUM Viagens 🌍

O **BeLIUM Viagens** é um sistema de base de dados relacional desenvolvido para o **CeSIUM** (Centro de Estudantes de Engenharia Informática da Universidade do Minho). O projeto surge da necessidade de centralizar e preservar a memória histórica e operacional das viagens organizadas pelo núcleo, combatendo a dispersão de informação por canais informais e documentos isolados.

## 📋 Sobre o Projeto

Este sistema foi desenhado para documentar o portfólio de viagens do CeSIUM, servindo como uma ferramenta estratégica para o planeamento de futuras atividades pedagógicas, gestão de parcerias e fortalecimento do networking entre estudantes e alumni.

A arquitetura do sistema seguiu rigorosamente o ciclo de vida de desenvolvimento de bases de dados:
* **Modelação Conceptual:** Diagramas Entidade-Relacionamento (ER).
* **Modelação Lógica:** Normalização até à Terceira Forma Normal (3FN).
* **Implementação Física:** MySQL com motor InnoDB para suporte a transações e integridade referencial.

A arquitetura do sistema seguiu rigorosamente o ciclo de vida de desenvolvimento de bases de dados:

* **Modelação Conceptual:** Diagramas Entidade-Relacionamento (ER).
![Diagrama Entidade-Relacionamento](docs/er_diagram.png)

* **Modelação Lógica:** Normalização até à Terceira Forma Normal (3FN).
![Esquema Lógico](docs/logical_schema.png)

## 🚀 Funcionalidades Principais

* **Arquivo Histórico:** Registo detalhado de destinos, datas e participantes.
* **Gestão Financeira:** Monitorização de orçamentos e patrocínios associados a cada viagem.
* **Interatividade:** Sistema de avaliações, comentários e reações (Likes) por parte dos sócios.
* **Documentação Multimédia:** Associação de fotografias a paragens específicas de cada itinerário.
* **Segurança (RBAC):** Controlo de acesso baseado em perfis (Administrador, Sócio e Utilizador).

## 🛠️ Tecnologias Utilizadas

* **SGBD:** MySQL
* **Modelação:** brModelo (Conceptual) e MySQL Workbench (Lógico)
* **Validação:** Álgebra Relacional (Calculadora RelaX)

## 📂 Estrutura do Repositório

O código está organizado para facilitar a manutenção e a implementação modular:

```text
├── src/
│   ├── Database_Life_Cycle.sql  # Criação do Schema e gestão inicial
│   ├── Create_Tables.sql       # Definição das tabelas e restrições
│   ├── Create_Users.sql        # Configuração de utilizadores e privilégios
│   ├── Drop_Tables.sql         # Scripts para eliminar tabelas
│   └── Drop_Users.sql          # Scripts para remover utilizadores
├── adv/
│   ├── Procedures_Insert.sql   # Povoamento da BD através de procedimentos
│   ├── Procedures.sql          # Lógica de negócio e autenticação
│   ├── Vistas.sql              # Vistas para estatísticas e listagens
│   ├── Index.sql               # Otimização de desempenho (Índices)
│   ├── Queries.sql             # Interrogações de manipulação de dados
│   └── RM_Solutions.sql        # Resoluções dos requisitos de manipulação
└── README.md

```

## ⚙️ Instalação e Configuração

Para instanciar a base de dados localmente, execute os seguintes comandos no seu cliente MySQL (garanta que está na raiz do projeto):

```sql
-- Estrutura e Tabelas
SOURCE src/Database_Life_Cycle.sql;
SOURCE src/Create_Tables.sql;

-- Segurança e Utilizadores
SOURCE src/Create_Users.sql;

-- Dados e Lógica Avançada
SOURCE adv/Procedures_Insert.sql;
SOURCE adv/Procedures.sql;
SOURCE adv/Vistas.sql;
SOURCE adv/Index.sql;
```

## 👥 Níveis de Acesso

O sistema implementa três perfis distintos:

* **Administrador:** Controlo total sobre o sistema, orçamentos e gestão de utilizadores.
* **Sócio:** Pode registar novas viagens, adicionar paragens, fotos e interagir com o conteúdo.
* **Utilizador:** Perfil de consulta com permissões limitadas a reações e visualização pública.

## ✍️ Autores

Projeto desenvolvido para a Unidade Curricular de **Bases de Dados** (2025/2026):

* **Bruno Magalhães**
* **Diogo Azevedo**
* **Simão Santos**
* **Vera Almeida**

**Universidade do Minho** - Licenciatura em Engenharia Informática
