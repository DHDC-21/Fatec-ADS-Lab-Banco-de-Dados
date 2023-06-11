/*
 *  Atividade lBD100.003
 *
 *  Crie um Banco de Dados com nome ELEIÇÃO. A seguir crie as tabelas
 *  neste Banco de Dados conforme a relação abaixo:
 *
 *  OBS: DEFINIR AS CHAVES PRIMÁRIAS DE CADA TABELA E AS CHAVES
 *  ESTRANGEIRAS NOS RELACIONAMENTOS.
 *
 *  Cargo:
 *      Codigo_Cargo: inteiro, único e não nulo
 *      Nome_Cargo: varchar (30), único e não nulo.
 *      Salario: float, não nulo e valor padrão 2000,00
 *      Numero_Vagas: inteiro e não nulo
 *
 *  Partido:
 *      Codigo_Partido: inteiro, único e não nulo
 *      Sigla: char (5), único e não nulo
 *      Nome: varchar (40), único e não nulo
 *      Numero: inteiro, único e não nulo
 *
 *  Candidato:
 *      Numero_Candidato: inteiro, único e não nulo
 *      Nome: varchar (40), único e não nulo
 *      Codigo_Cargo: inteiro e não nulo
 *      Codigo_Partido inteiro e não nulo
 *
 *  Eleitor:
 *      Titulo_Eleitor: varchar (30), único e não nulo
 *      Zona_Eleitoral: char (5) e não nulo
 *      Sessao_Eleitoral: char (5) e não nulo
 *      Nome: varchar (40) e não nulo
 *
 *  Voto:
 *      Titulo_Eleitor: varchar (30), único e não nulo
 *      Numero_Candidato: inteiro e não nulo
 */

CREATE SCHEMA eleicao;
USE eleicao;

CREATE TABLE cargo (
    codigo_cargo INTEGER NOT NULL PRIMARY KEY,
    nome_cargo VARCHAR(30) UNIQUE NOT NULL,
    salario FLOAT NOT NULL DEFAULT 2000.00,
    numero_vagas INTEGER NOT NULL
);

CREATE TABLE partido (
    codigo_partido INTEGER UNIQUE NOT NULL,
    sigla CHAR(5) UNIQUE NOT NULL,
    nome VARCHAR(40) UNIQUE NOT NULL,
    numero INTEGER UNIQUE NOT NULL
);

CREATE TABLE candidato (
    numero_candidato INTEGER UNIQUE NOT NULL,
    nome VARCHAR(40) UNIQUE NOT NULL,
    codigo_cargo INTEGER NOT NULL,
    codigo_partido INTEGER NOT NULL,
    fk_cargo INTEGER NOT NULL,
    fk_partido INTEGER NOT NULL,
    FOREIGN KEY (fk_cargo)
        REFERENCES cargo (codigo_cargo),
    FOREIGN KEY (fk_partido)
        REFERENCES partido (codigo_partido)
);

CREATE TABLE eleitor (
    titulo_eleitor VARCHAR(30) UNIQUE NOT NULL,
    zona_eleitoral CHAR(5) NOT NULL,
    sessao_eleitoral CHAR(5) NOT NULL,
    nome VARCHAR(40) NOT NULL
);

CREATE TABLE voto (
    titulo_eleitor VARCHAR(30) UNIQUE NOT NULL,
    numero_candidato INTEGER NOT NULL,
    FOREIGN KEY (numero_candidato)
        REFERENCES candidato (numero_candidato)
);
