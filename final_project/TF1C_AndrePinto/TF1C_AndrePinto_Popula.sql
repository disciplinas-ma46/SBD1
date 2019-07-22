-- --------     << TF1 >>     ------------
-- 
--                    SCRIPT DE POPULA (DML)
-- 
-- Data Criacao ...........: 03/07/2019
-- Autor(es) ..............: Andre Lucas de Sousa Pinto 17/0068251
-- ........................: Marcelo Araújo dos Santos 16/0035481
-- ........................: Felipe Campos de Almeida 16/0119553
-- ........................: Eliseu Egewarth 12/0029693
-- Banco de Dados .........: MySQL
-- Base de Dados(nome) ....: TF1C
-- 
-- Data Ultima Alteracao ..: 03/07/2019
--   => Criacao do script popula
-- 
-- PROJETO => 01 Base de Dados
--         => 15 Tabelas
-- 
-- -----------------------------------------------------------------

USE TF1C;

INSERT INTO EMPRESA VALUES (65198468465164, 'superbom@mercados.com', 'Super Mercado Super Bom', 130, 'Bairro dos Anjos', 60713134, 'Rua Delta', 'CE', 'Bloco A', 'Fortaleza', 9048654068, 'Super Mercado Super Bom Industrias Ltda');
INSERT INTO EMPRESA VALUES (88146305448415, 'pizzariabessa@bessa.com', 'Pizzaria Bessa', 777, 'Asa Sul', 50846941, 'Avenid Santos Dummont', 'DF', 'Bloco B Sala 32', 'Maracanau', 9801654878, 'Pizzaria Bessa Industrias Ltda');
INSERT INTO EMPRESA VALUES (79865017400100, 'zeca@zecaconstrucao.com', 'Zeca da Construcao', 520, 'Bairro dos Palmares', 11164987, 'Rua Coronel Juca', uf, 'Bloco C Andar 7 Sala 2', 'Horizonte', 1065489875, 'Zeca da Construcao Industrias Ltda');
INSERT INTO EMPRESA VALUES (13686510987065, 'macrodistribuidora@macro.com', 'Macro Distribuidora', 786, 'Asa Norte', 80564984, 'Praca do Liceu', 'DF', 'Bloco J', 'Sobral', 9804658975, 'Macro Distribuidora Industrias Ltda');
INSERT INTO EMPRESA VALUES (22151515180984, 'megaalimentos@megaalimentos.com', 'Mega Alimentos', 10, 'Bairro das Canoas', 61970404, 'Avenida Abolicao', 'CE', 'Bloco K sala 2', 'Aracati', 9050486545, 'Mega Alimentos Industrias Ltda');
INSERT INTO EMPRESA VALUES (90846561665145, 'cimento@ze.com', 'Ze do Cimento', 103, 'Montese', 90484608, 'Rua Castro Montes', uf, 'Bloco Z sala 1', 'Crato', 3015549854, 'Ze do Cimento Industrias Ltda');
INSERT INTO EMPRESA VALUES (36081749685304, 'luiz@gmail.com', 'Luiz Representante', 405, 'Mesejana', 60549877, 'Avenida Monsenhor Tabosa', 'CE', 'Bloco A Andar 1', 'Asare', 4084956269, 'Luiz Representante Ltda');
INSERT INTO EMPRESA VALUES (46015468246505, 'mario1231@hotmail.com', 'Mario Representante', 645, 'Aldeota', 60498049, 'Rua Nunes Valente', 'CE', 'Bloco A Andar 1 Sala 7', 'Itapipoca', 6049509504, 'Mario Representante Ltda');
INSERT INTO EMPRESA VALUES (56065346803214, 'thejoao@yahoo.com.br', 'Joao Representante', 113, 'Mondubim', 60044659, 'Praca Portugal', 'CE', 'Bloco H', 'Trairi', 3026567845, 'Joao Representante Ltda');
INSERT INTO EMPRESA VALUES (16065346803214, 'aninha@yahoo.com.br', 'Ana Representante', 140, 'Bairro araticum', 60044659, 'Rua do palmar', 'MA', 'Bloco B', 'Barra do Corda', 1726567845, 'Ana Representante Ltda');
INSERT INTO EMPRESA VALUES (26065346803214, 'pedroca@yahoo.com.br', 'Pedro Representante', 150, 'Bairro jenipapo', 60044659, 'Rua vila velha', 'MA', 'Bloco C', 'Barra do Corda', 1826567845, 'Pedro Representante Ltda');


INSERT INTO telefone VALUES (061982516495, 65198468465164);
INSERT INTO telefone VALUES (072990546464, 88146305448415);
INSERT INTO telefone VALUES (065950054696, 79865017400100);
INSERT INTO telefone VALUES (065950051234, 13686510987065);
INSERT INTO telefone VALUES (065950050012, 22151515180984);
INSERT INTO telefone VALUES (065950052332, 90846561665145);
INSERT INTO telefone VALUES (065950050399, 36081749685304);
INSERT INTO telefone VALUES (065950052099, 46015468246505);
INSERT INTO telefone VALUES (065950058787, 56065346803214);
INSERT INTO telefone VALUES (068950058123, 16065346803214);
INSERT INTO telefone VALUES (068950058345, 26065346803214);


INSERT INTO CLIENTE VALUES ('2015-02-20', 'I', 65198468465164, NULL);
INSERT INTO CLIENTE VALUES ('2015-03-05', 'I', 88146305448415, NULL);
INSERT INTO CLIENTE VALUES ('2015-04-28', 'A', 79865017400100, '2015-05-15');
INSERT INTO CLIENTE VALUES ('2015-05-01', 'A', 13686510987065, '2015-06-10');
INSERT INTO CLIENTE VALUES ('2015-05-12', 'A', 22151515180984, '2015-06-15');

INSERT INTO REPRESENTANTE VALUES (1919564, 56065346803214);
INSERT INTO REPRESENTANTE VALUES (5030355, 46015468246505);
INSERT INTO REPRESENTANTE VALUES (3453738, 36081749685304);
INSERT INTO REPRESENTANTE VALUES (1453738, 16065346803214);
INSERT INTO REPRESENTANTE VALUES (2453738, 26065346803214);

INSERT INTO FORNECEDOR VALUES ('I', 90846561665145, 36081749685304, '2015-02-15');
INSERT INTO FORNECEDOR VALUES ('I', 22151515180984, 36081749685304, '2015-03-01');
INSERT INTO FORNECEDOR VALUES ('A', 13686510987065, 36081749685304, '2015-04-27');
INSERT INTO FORNECEDOR VALUES ('I', 65198468465164, 36081749685304, '2015-03-17');
INSERT INTO FORNECEDOR VALUES ('I', 88146305448415, 36081749685304, '2015-03-22');

INSERT INTO regiaoAtuacao VALUES ('Rua Castro Montes', 90846561665145);
INSERT INTO regiaoAtuacao VALUES ('Bairro das Canoas', 22151515180984);
INSERT INTO regiaoAtuacao VALUES ('Asa Norte', 13686510987065);
INSERT INTO regiaoAtuacao VALUES ('Taguatinga', 65198468465164);
INSERT INTO regiaoAtuacao VALUES ('Areal', 88146305448415);

INSERT INTO CATEGORIA VALUES (NULL, 'Alimentos', 'Alimentos em geral');
INSERT INTO CATEGORIA VALUES (NULL, 'Material de Construcao','Pequenas e medias construcoes');
INSERT INTO CATEGORIA VALUES (NULL, 'Bebidas Alcoolicas', NULL);
INSERT INTO CATEGORIA VALUES (NULL, 'Eletronicos', NULL);
INSERT INTO CATEGORIA VALUES (NULL, 'Carpintaria', 'Produtos de construir casa');

INSERT INTO PRODUTO VALUES (NULL, 5.20, 'Massa de pizza', 500, 4, 2500, 5, 'I', 90846561665145, 1, 'faz em media 10 pizzas');
INSERT INTO PRODUTO VALUES (NULL, 20.99, 'Cimento', 750, 6, 5000, 6, 'I', 22151515180984, 2, 'saco de 50kg');
INSERT INTO PRODUTO VALUES (NULL, 31.01, 'Tequila Mexicana', 100, 5, 1000, 2, 'A', 90846561665145, 3, 'Especial Gold Reposado');
INSERT INTO PRODUTO VALUES (NULL, 180.00, 'Memoria ram hypex', 50, 4, 1000, 2, 'A', 65198468465164, 4, '8GB DDR4 2400hz');
INSERT INTO PRODUTO VALUES (NULL, 70.00, 'Carrinho de mao', 30, 5, 1000, 2, 'A', 88146305448415, 5, 'Especial Gold Reposado');

INSERT INTO estoca VALUES (3, 79865017400100, 200, '2015-05-10', NULL);
INSERT INTO estoca VALUES (3, 79865017400100, 10, '2015-06-11','estoque diminuiu, falar com o fornecedor para enviar mais tequila');
INSERT INTO estoca VALUES (3, 79865017400100, 900, '2015-06-01', NULL);
INSERT INTO estoca VALUES (4, 13686510987065, 200, '2015-06-12', NULL);
INSERT INTO estoca VALUES (5, 22151515180984, 80, '2015-06-23', NULL);

INSERT INTO credita VALUES (65198468465164, 90846561665145, 1000);
INSERT INTO credita VALUES (88146305448415, 22151515180984, 1500);
INSERT INTO credita VALUES (79865017400100, 13686510987065, 50000);
INSERT INTO credita VALUES (65198468465164, 65198468465164, 40000);
INSERT INTO credita VALUES (88146305448415, 88146305448415, 30000);

INSERT INTO FUNCIONARIO VALUES (113, 'Mondubim', 60044659, 'Praca Portugal', 'CE', 'Bloco H', 'Trairi', 088998056486, '1988-12-05', 3002.09, 'Raimundo de Sousa Braz', 25408948604, '2015-06-12', '2015-08-27', 36081749685304);
INSERT INTO FUNCIONARIO VALUES (645, 'Aldeota', 60498049, 'Rua Nunes Valente', 'CE', 'Bloco A Andar 1 Sala 7', 'Itapipoca', 088984654850, '1985-01-01', 2501.90, 'Jose Carlos Amaral', 10490844950, '2015-11-11', '2016-01-14', 36081749685304);
INSERT INTO FUNCIONARIO VALUES (405, 'Mesejana', 60549877, 'Avenida Monsenhor Tabosa', 'CE', 'Bloco A Andar 1', 'Asare', 085989454941, '1990-02-12', 1905.55, 'Francisco Regivam da Silva', 30306118945, '2016-01-14', NULL, 36081749685304);
INSERT INTO FUNCIONARIO VALUES (456, 'Pedrinhas', 60549857, 'Rua do passarinho', 'CE', 'Bloco C', 'Burreau', 085989454123, '1991-02-12', 1905.55, 'Antonio Jose Pereira', 11306118946, '2014-03-16', '2015-06-10', 36081749685304);
INSERT INTO FUNCIONARIO VALUES (345, 'Bambeau', 60593773, 'Praca bom bosco', 'CE', 'Bloco F', 'Asarase', 085989452323, '1992-02-12', 1905.55, 'Maria Julia Lima', 12306118947, '2013-02-15', '2014-03-15', 36081749685304);

INSERT INTO ATENDIMENTO VALUES (NULL, '2015-04-29', 'Produto estava em bom preco no local. Bem apresentado. Estoque aparenta vender rapido', 'P', 36081749685304, 65198468465164);
INSERT INTO ATENDIMENTO VALUES (NULL, '2015-05-01', 'Produto estava em preco caro, foi sugerido baixar um pouco. O produto estava bem apresentado. Estoque aparenta vender rapido', 'P', 36081749685304, 88146305448415);
INSERT INTO ATENDIMENTO VALUES (NULL, '2015-05-01', 'Cliente nao demonstrou mais interesse em continuar comprando, disse que seria a ultima compra', 'V', 36081749685304, 79865017400100);
INSERT INTO ATENDIMENTO VALUES (NULL, '2015-02-01', 'Cliente me ligou dizendo que vai voltar a comprar, e esta com estoque baixo', 'V', 36081749685304, 79865017400100);
INSERT INTO ATENDIMENTO VALUES (NULL, '2015-03-01', 'Cliente com bastante estoque, nao precisara de atendimento por um mes', 'P', 36081749685304, 79865017400100);

INSERT INTO PEDIDO VALUES (1, NULL, '2015-04-29', 'concluido', 1);
INSERT INTO PEDIDO VALUES (2, NULL, '2015-05-01', 'concluido', 2);
INSERT INTO PEDIDO VALUES (1, NULL, '2015-05-01', 'cancelado', 3);
INSERT INTO PEDIDO VALUES (1, NULL, '2015-05-01', 'pendente', 3);
INSERT INTO PEDIDO VALUES (1, NULL, '2015-05-01', 'pendente', 3);

INSERT INTO contem VALUES (1, 1, 505, 0, 5.20);
INSERT INTO contem VALUES (2, 2, 1000, 0, 20.99);
INSERT INTO contem VALUES (3, 3, 900, 0, 31.01);
INSERT INTO contem VALUES (4, 4, 100, 0, 180.00);
INSERT INTO contem VALUES (5, 5, 80, 0, 70.00);

INSERT INTO PAGAMENTO VALUES (NULL, 1, 1, '2015-05-29', '2015-05-01', 5.20);
INSERT INTO PAGAMENTO VALUES (NULL, 2, 1, '2015-06-01', '2015-05-02', 10.50);
INSERT INTO PAGAMENTO VALUES (NULL, 2, 2, '2015-07-01', '2015-06-01', 10.50);
INSERT INTO PAGAMENTO VALUES (NULL, 3, 1, '2015-06-01', NULL, 31.01);
INSERT INTO PAGAMENTO VALUES (NULL, 4, 1, '2015-06-01', NULL, 180.00);
INSERT INTO PAGAMENTO VALUES (NULL, 5, 1, '2015-06-01', NULL, 70.00);
