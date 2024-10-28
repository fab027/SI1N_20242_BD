DROP SCHEMA if exists EST_CASO_II;

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
  PASS_EMAIL varchar(200)
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
  AEROPORTO_ORIGEM int not null,
  AEROPORTO_DESTINO int not null,
  AERONAVE_PREFIXO int not null,
  CONSTRAINT FK_V_AEROPORTO FOREIGN KEY(AEROPORTO_ORIGEM) REFERENCES AEROPORTOS(AEROPORTO_COD),
  CONSTRAINT FK_V2_AEROPORTO FOREIGN KEY(AEROPORTO_DESTINO) REFERENCES AEROPORTOS(AEROPORTO_COD),
  constraint FK_AERONAVES foreign key(AERONAVE_PREFIXO) references AERONAVES(AERONAVE_PREFIXO)
  
);

create table if not exists EQUIPES (

  FUNC_ID int,
  VOO_CODIGO int,
  PRIMARY KEY(FUNC_ID, VOO_CODIGO),
  constraint FK_E_FUNCIONARIOS foreign key(FUNC_ID) references FUNCIONARIOS(FUNC_ID),
  constraint FK_E_VOO foreign key(VOO_CODIGO) references VOOS(VOO_CODIGO)  
);

create table if not exists RESERVAS (

  PASS_CPF int,
  VOO_CODIGO int,
  constraint FK_R_PASSAGEIROS foreign key(PASS_CPF) references PASSAGEIROS(PASS_CPF),
  constraint FK_R_VOOS foreign key(VOO_CODIGO) references VOOS(VOO_CODIGO)
);

alter table PASSAGEIROS ADD PASS_CEP VARCHAR(9);
alter table FUNCIONARIOS add FUNC_EMAIL VARCHAR(50);
