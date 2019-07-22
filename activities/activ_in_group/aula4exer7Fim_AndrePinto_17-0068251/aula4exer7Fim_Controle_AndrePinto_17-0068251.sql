-- --------     << EMPRESA FUI >>     ------------
--
--                    SCRIPT CONTROLE (DML)
--
-- Data Criacao ...........: 16/06/2019
-- Autor(es) ..............: Alexandre Miguel Rodrigues Nunes Pereira
--                           André Lucas de Sousa Pinto
--                           Marcelo Araújo dos Santos
--                           Thiago Ribeiro Pereira
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: aula4exer7Fim
--
-- Data Ultima Alteracao ..: 17/06/2019
--   => Criacao do script popula
--
-- PROJETO => 1 Base de Dados
--         => 09 Tabelas
--
-- -----------------------------------------------------------------
USE aula4exer7Fim;

SET GLOBAL validate_password_policy=LOW;

CREATE USER 'usufui' IDENTIFIED BY 'fui123';

GRANT SELECT, INSERT, DELETE, UPDATE ON aula4exer7Fim.* TO usufui;
