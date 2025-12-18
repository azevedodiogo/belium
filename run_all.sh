#!/bin/bash

# Script de execução sequencial dos scripts SQL do projeto BeLIUM Viagens.
# Certifique-se de que tem o cliente MySQL instalado e configurado.

echo "A iniciar a criação e povoamento da base de dados BeLIUM Viagens..."

mysql -u root -p < schema/Database.sql
mysql -u root -p < schema/Tables.sql
mysql -u root -p < schema/Users.sql
mysql -u root -p < logic/Functions.sql
mysql -u root -p < logic/views/Views.sql
mysql -u root -p < logic/Other-Procedures.sql
mysql -u root -p < logic/population/Insersion-Procedures.sql
mysql -u root -p < logic/population/Population.sql
mysql -u root -p < logic/Triggers.sql
mysql -u root -p < logic/Indexes.sql
mysql -u root -p < logic/Prepared-Statements.sql

echo "Processo concluído com sucesso!"
