-- -----------     << TF1 >>     -------------------
-- 
--                     SCRIPT DE CONTROLE (DDL)
-- 
-- Data Criacao ...........: 03/07/2019
-- Autor(es) ..............: Andre Lucas de Sousa Pinto 17/0068251
-- ........................: Marcelo Araújo dos Santos 16/0035481
-- ........................: Felipe Campos de Almeida 16/0119553
-- ........................: Eliseu Egewarth 12/0029693
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: TF1A
-- 
-- Data Ultima Alteracao ..: 03/07/2019
--   => Criacao do usuario admin1, com as devidas permissoes
--
-- PROJETO => 01 Base de Dados
--         => 15 Tabelas
-- 
-- -----------------------------------------------------------------

CREATE USER 'admin1' IDENTIFIED BY 'Admin!representante132';

GRANT ALL PRIVILEGES ON TF1C.* TO 'admin1';

FLUSH PRIVILEGES;

