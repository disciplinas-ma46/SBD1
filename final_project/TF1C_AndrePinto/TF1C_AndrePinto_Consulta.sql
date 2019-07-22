-- -----------     << TF1 >>     -------------------
-- 
--                       SCRIPT DE CONSULTA (DDL)
-- 
-- Data Criacao ...........: 03/07/2019
-- Autor(es) ..............: Andre Lucas de Sousa Pinto 17/0068251
-- ........................: Marcelo Araújo dos Santos 16/0035481
-- ........................: Felipe Campos de Almeida 16/0119553
-- ........................: Eliseu Egewarth 12/0029693
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: TF1C
-- 
-- Data Ultima Alteracao ..: 03/07/2019
--   => Criacao das consultas
--
-- PROJETO => 01 Base de Dados
--         => 15 Tabelas
-- 
-- -----------------------------------------------------------------

USE TF1C;

-- Select que mostra o nome de todos os clientes que ja pediram Tequila Mexicana
SELECT EMPRESA.nomeFantasia as 'Nome do Cliente' FROM PEDIDO
INNER JOIN PRODUTO
ON PRODUTO.nome = 'Tequila Mexicana'
INNER JOIN ATENDIMENTO
ON ATENDIMENTO.idAtendimento = PEDIDO.idAtendimento
INNER JOIN CLIENTE
ON CLIENTE.cnpj = ATENDIMENTO.cnpjCliente
INNER JOIN EMPRESA
ON CLIENTE.cnpj = EMPRESA.cnpj
ORDER BY PEDIDO.dtPedido;

-- View que junta os dados da empresa com o fornecedor
CREATE OR REPLACE VIEW EMPRESA_FORNECEDOR (cnpj, email, nomeFantasia, numero, bairro, cep, logradouro, uf, complemento, municipio, inscricaoEstadual, razaoSocial, statusFornecedor, cnpjRepresentante, dtInicio) AS SELECT e.cnpj, e.email, e.nomeFantasia, e.numero, e.bairro, e.cep, e.logradouro, e.uf, e.complemento, e.municipio, e.inscricaoEstadual, e.razaoSocial, f.statusFornecedor, f.cnpjRepresentante, f.dtInicio FROM EMPRESA e, FORNECEDOR f;

-- Select da view que mostra todos os fornecedores
SELECT * FROM EMPRESA_FORNECEDOR;

