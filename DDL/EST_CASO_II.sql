DROP SCHEMA EST_CASO_II;

create schema EST_CASO_II;

use EST_CASO_II;

create table if not exists PASSAGEIROS (

PASS_CPF INT PRIMARY KEY not null,
PASS_NOME VARCHAR(200) NOT NULL,
PASS_TELEFONE INT,
PASS_RUA VARCHAR(45) NOT NULL,
PASS_NUMRUA INT,
PASS_BAIRRO VARCHAR(45) NOT NULL,
PASS_CIDADE VARCHAR(45) NOT NULL,
PASS_ESTADO VARCHAR(45) NOT NULL,
PASS_PAIS VARCHAR(30) NOT NULL,
PASS_CODPOSTAL VARCHAR(10) NOT NULL, 
PASS_EMAIL varchar(200),
);

create table if not exists AEROPORTOS(

AEROPORTO_COD int primary key,
AEROPORTO_NOME varchar(100) not null,
AEROPORTO_LOCAL varchar(100) not null,
AEROPORTO_PAIS varchar(50) not null,
AEROPORTO_LONGITUDE float,
AEROPORTO_LATITUDE float
);

create table if not exists AERONAVES(

AERONAVE_PREFIXO int primary key,
AERONAVE_MODELO varchar(100) not null,
AERONAVE_ANOFABR date not null,
AERONAVE_CAPACIDADE int not null,
AERONAVE_FABRICANTE varchar (50)
);

create table if not exists FUNCIONARIOS(

FUNC_ID int primary key,
FUNC_FUNCAO varchar(20) not null,
FUNC_NOME varchar(200) not null,
FUNC_DATANASC date not null,
FUNC_TELEFONE int

);

CREATE TABLE IF NOT EXISTS VOOS (
VOO_CODIGO INT primary key not null,
DATA_HORA_ORIGEM timestamp not null,
DATA_HORA_DESTINO timestamp not null,
AEROPORTO_ORIGEM varchar(100) not null,
AEROPORTO_DESTINO varchar(100) not null,
AERONAVE_PREFIXO varchar(50) not null,
constraint FK_AEROPORTOS


);
