-- --------     << EMPRESA FUI >>     ------------
--
--                    SCRIPT DE CRIACAO (DDL)
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
--   => Criacao do script de criacao
--
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
--
-- -----------------------------------------------------------------

CREATE DATABASE IF NOT EXISTS aula4exer7Fim;

USE aula4exer7Fim;

CREATE TABLE PESSOA (
    idPessoa BIGINT(10) NOT NULL AUTO_INCREMENT,
    nome VARCHAR(70) NOT NULL,
    sexo ENUM('M','F') NOT NULL,
    dtNascimento DATE NOT NULL,
    CONSTRAINT PESSOA_PK PRIMARY KEY (idPessoa)
) ENGINE = InnoDB AUTO_INCREMENT=1;

CREATE TABLE EMPREGADO (
    matriculaEmpregado BIGINT(10) NOT NULL AUTO_INCREMENT,
    rua VARCHAR(70) NOT NULL,
    numero INT(5) NOT NULL,
    bairro VARCHAR(70) NOT NULL,
    cidade VARCHAR(70) NOT NULL,
    salario DOUBLE(8,2) NOT NULL,
    idPessoa BIGINT(10) NOT NULL,
    matriculaSupervisor BIGINT(10) NOT NULL,
    CONSTRAINT EMPREGADO_PK PRIMARY KEY (matriculaEmpregado),
    CONSTRAINT EMPREGADO_EMPREGADO_FK FOREIGN KEY (matriculaSupervisor) REFERENCES EMPREGADO (matriculaEmpregado),
    CONSTRAINT EMPREGADO_PESSOA_FK FOREIGN KEY (idPessoa) REFERENCES PESSOA (idPessoa)
) ENGINE = InnoDB AUTO_INCREMENT=1;

CREATE TABLE DEPARTAMENTO (
    numeroDepartamento BIGINT(10) NOT NULL,
    nomeDepartamento VARCHAR(70) NOT NULL,
    CONSTRAINT DEPARTAMENTO_PK PRIMARY KEY (numeroDepartamento)
) ENGINE = InnoDB;

CREATE TABLE LOCALIZACAO (
    idLocalizacao BIGINT(10) NOT NULL AUTO_INCREMENT,
    descricaoLocalizacao VARCHAR(70) NOT NULL,
    CONSTRAINT LOCALIZACAO_PK PRIMARY KEY (idLocalizacao)
) ENGINE = InnoDB AUTO_INCREMENT=1;

CREATE TABLE PROJETO (
    numeroProjeto BIGINT(10) NOT NULL,
    nomeProjeto VARCHAR(70) NOT NULL,
    idLocalizacao BIGINT(10) NOT NULL,
    numeroDepartamento BIGINT(10) NOT NULL,
    CONSTRAINT PROJETO_PK PRIMARY KEY (numeroProjeto),
    CONSTRAINT PROJETO_LOCALIZACAO_FK FOREIGN KEY (idLocalizacao) REFERENCES LOCALIZACAO (idLocalizacao),
    CONSTRAINT PROJETO_DEPARTAMENTO_FK FOREIGN KEY (numeroDepartamento) REFERENCES DEPARTAMENTO (numeroDepartamento)
) ENGINE = InnoDB;

CREATE TABLE tem (
    idLocalizacao BIGINT(10) NOT NULL,
    numeroDepartamento BIGINT(10) NOT NULL,
    CONSTRAINT tem_PK PRIMARY KEY (idLocalizacao, numeroDepartamento),
    CONSTRAINT tem_LOCALIZACAO_FK FOREIGN KEY (idLocalizacao) REFERENCES LOCALIZACAO (idLocalizacao),
    CONSTRAINT tem_DEPARTAMENTO_FK FOREIGN KEY (numeroDepartamento) REFERENCES DEPARTAMENTO (numeroDepartamento)
) ENGINE = InnoDB;

CREATE TABLE depende (
    matriculaEmpregado BIGINT(10) NOT NULL,
    idPessoa BIGINT(10) NOT NULL,
    parentesco VARCHAR(70) NOT NULL,
    CONSTRAINT depende_PK PRIMARY KEY (idPessoa, matriculaEmpregado),
    CONSTRAINT depende_EMPREGADO_FK FOREIGN KEY (matriculaEmpregado) REFERENCES EMPREGADO (matriculaEmpregado),
    CONSTRAINT depende_PESSOA_FK FOREIGN KEY (idPessoa) REFERENCES PESSOA (idPessoa)
) ENGINE = InnoDB;

CREATE TABLE trabalha (
    matriculaEmpregado BIGINT(10) NOT NULL,
    numeroProjeto BIGINT(10) NOT NULL,
    horasTrabalhadas INT(5) NOT NULL,
    CONSTRAINT trabalha_PK PRIMARY KEY (matriculaEmpregado, numeroProjeto),
    CONSTRAINT trabalha_EMPREGADO_FK FOREIGN KEY (matriculaEmpregado) REFERENCES EMPREGADO (matriculaEmpregado),
    CONSTRAINT trabalha_PROJETO_FK FOREIGN KEY (numeroProjeto) REFERENCES PROJETO (numeroProjeto)
) ENGINE = InnoDB;

CREATE TABLE gerencia (
    matriculaEmpregado BIGINT(10) NOT NULL,
    numeroDepartamento BIGINT(10) NOT NULL,
    dtInicio DATE NOT NULL,
    CONSTRAINT gerencia_PK PRIMARY KEY (matriculaEmpregado, numeroDepartamento),
    CONSTRAINT gerencia_EMPREGADO_FK FOREIGN KEY (matriculaEmpregado) REFERENCES EMPREGADO (matriculaEmpregado),
    CONSTRAINT gerencia_DEPARTAMENTO_FK FOREIGN KEY (numeroDepartamento) REFERENCES DEPARTAMENTO (numeroDepartamento)
) ENGINE = InnoDB;
