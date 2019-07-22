-- --------     << EMPRESA FUI >>     ------------
--
--                    SCRIPT DE POPULAR (DML)
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
-- PROJETO => 1 Base de dados
--         => 09 Tabelas
--
-- -----------------------------------------------------------------
USE aula4exer7Fim;

INSERT INTO PESSOA (nome, sexo, dtNascimento) VALUES
	('John Newton', 'M', '1968-01-07'),
  ('Mary Moon', 'F', '1992-02-09'),
  ('Mark Driskol', 'M', '1988-05-03'),
	('Talitha Werneck', 'F', '1983-03-11'),
	('Daniela Calabresa', 'F', '1984-10-07'),
	('Ezra Miller', 'M', '1989-10-08');

INSERT INTO EMPREGADO (rua, numero, bairro, cidade, salario, idPessoa, matriculaSupervisor) VALUES
	('Rua das Palmeiras', 7, 'Bairro das araras', 'Ceilandia', 4000, 1, 1),
	('Rua das Alcarias', 3, 'Bairro dos alcalinos', 'Taguatinga', 5000, 2, 1),
	('Rua da Agua Benda', 9, 'Bairro da luz', 'Guara', 2000, 3, 2);


INSERT INTO DEPARTAMENTO (numeroDepartamento, nomeDepartamento) VALUES
	(100, 'Comunicacao'),
  (101, 'Desenvolvimento'),
  (102, 'Gerencia');


INSERT INTO LOCALIZACAO (descricaoLocalizacao) VALUES
	('FUI ALA 01'),
  ('FUI ALA 02'),
  ('FUI ALA 03');

INSERT INTO PROJETO (numeroProjeto, nomeProjeto, idLocalizacao, numeroDepartamento) VALUES
	(1, 'Generation Energy', 1, 100),
  (4, 'USP class', 2, 101),
  (6, 'Universidade online', 3, 102);


INSERT INTO tem (idLocalizacao, numeroDepartamento) VALUES
	(1,100),
  (2,101),
  (3,102);

INSERT INTO depende (matriculaEmpregado, idPessoa, parentesco) VALUES
	(1, 6, 'Filho'),
	(2, 5, 'Esposa'),
  (3, 4, 'Filha');


INSERT INTO trabalha (matriculaEmpregado, numeroProjeto, horasTrabalhadas) VALUES
	(1, 1, 400),
  (2, 4, 500),
  (3, 6, 350);


INSERT INTO gerencia (matriculaEmpregado, numeroDepartamento, dtInicio) VALUES
	(1, 100, '2018-01-07'),
  (2, 101, '2019-02-05'),
  (3, 102, '2019-01-02');
