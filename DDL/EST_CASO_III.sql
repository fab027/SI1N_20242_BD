DROP SCHEMA if exists EST_CASO_III;

create schema EST_CASO_III;

use EST_CASO_III;

drop table if exists ENDERECO;

create table if not exists ENDERECO (
END_ID int primary key,
END_NUMERO int not null,
END_LOGRADOURO varchar(100) not null,
END_COMPLEMENTO text,  
END_CEP int not null,
END_BAIRRO varchar(50) not null,
END_CIDADE varchar(100) not null,
END_ESTADO varchar(50) not null,
TipoEndereco_COD int
);

create table if not exists TIPO_END (
TIPO_END_COD int primary key,
TIPO_END_NOME varchar(20) not null
);

create table if not exists CLIENTES (

CLI_CODIGO int primary key,
CLI_CNPJ varchar(18) unique not null,
CLI_RAZAOSOCI varchar(90) not null,
CLI_RAMO varchar(50) not null,
CLI_DATA_CAD date not null,
CLI_PESSOA_CONT varchar(100) not null

);

create table if not exists TELEFONES_CLIENTES (
    TC_ClienteCodigo INT,
    TC_Telefone VARCHAR(15),
    PRIMARY KEY (TC_ClienteCodigo, TC_Telefone)
);

create table if not exists EMPREGADOS (

EMP_MATRICULA int primary key,
EMP_NOME varchar(100) not null,
EMP_CARGO varchar(40),
EMP_SALARIO decimal(10, 2),
EMP_DATA_ADMI date not null,
EMP_QUALI varchar(100) not null,
EnderecoID int
);

CREATE TABLE if not exists TELEFONES_EMPREGADOS (
    EmpregadoMatricula INT,
    TEmpregado_Telefone VARCHAR(15),
    PRIMARY KEY (EmpregadoMatricula, TEmpregado_Telefone)
);

create table if not exists EMPRESAS (

EMPRESA_CNPJ varchar(18) primary key,
EMPRESA_RAZAOSOCI varchar(90) not null,
EMPRESA_PESSOACONT varchar(100) not null,
EnderecoID int
);

CREATE TABLE if not exists TELEFONES_EMPRESAS (
    Empresa_CNPJ VARCHAR(18),
    TEmpresa_Telefone VARCHAR(15),
    PRIMARY KEY (Empresa_CNPJ, TEmpresa_Telefone)
);

create table if not exists FORNECEDORES (

FORN_CNPJ varchar(18) primary key,
FORN_RAZAOSOCI varchar(100) not null,
FORN_PESSOACONT varchar(100),
EnderecoID int
);

CREATE TABLE if not exists TELEFONES_FORNECEDORES (
    FornecedorCNPJ VARCHAR(18),
    TForn_Telefone VARCHAR(15),
    PRIMARY KEY (FornecedorCNPJ, TForn_Telefone)
);
create table if not exists ENCOMENDAS (

ENC_CODIGO int primary key,
ENC_DATA_INC date not null,
ENC_VALORTOTAL decimal(10, 2),
ENC_VALORDESCONTO decimal(10, 2),
ENC_VALORLIQUIDO decimal(10, 2),
ENC_PARCELAS int,
Cliente_COD int
);

create table if not exists PRODUTOS (
    PROD_COD INT PRIMARY KEY,
    PROD_Nome VARCHAR(100) NOT NULL,
    PROD_Cor VARCHAR(20),
    PROD_Dimensoes VARCHAR(50),
    PROD_Peso DECIMAL(5, 2),
    PROD_Preco DECIMAL(10, 2),
    PROD_TempoFabricacao DECIMAL(5, 2),
    PROD_DesenhoProduto VARCHAR(255),
    PROD_HorasMaoDeObra DECIMAL(5, 2)
);

create table if not exists ENCOMENDAS_PRODUTOS (
    ENCPROD_ID INT,
    ProdutoCodigo INT,
    Quantidade INT,
    PRIMARY KEY (ENCPROD_ID, ProdutoCodigo)
);

create table if not exists TIPOS_COMPONENTE (
    TC_COD INT PRIMARY KEY,
    TC_NOME VARCHAR(50) NOT NULL
);

create table if not exists COMPONENTES (
    COMP_COD INT PRIMARY KEY,
    COMP_NOME VARCHAR(100) NOT NULL,
    TipoComponenteCodigo INT,
    QuantidadeEstoque INT,
    COMP_PRECOUNI DECIMAL(10, 2),
    COMP_UNIDADE VARCHAR(10)
    ); 
    
create table if not exists FORNECEDORES_COMPONENTES (
    FORNCOMP_FornecedorCNPJ VARCHAR(18),
    FORNCOMP_ComponenteCodigo INT,
    PRIMARY KEY (FORNCOMP_FornecedorCNPJ, FORNCOMP_ComponenteCodigo)
    );
    
 create table if not exists MAQUINAS (
    MAQ_COD INT PRIMARY KEY,
    MAQ_TEMPVIDA INT,
    MAQ_DATACOMPRA DATE,
    MAQ_FIMGARANTIA DATE
);

create table if not exists RECURSOS_ESPECIFICOS (
    RE_ProdutoCodigo INT,
    RE_QTDNECESSARIA INT,
    RE_UNIDADE VARCHAR(10),
    RE_TEMPOUSO DECIMAL(5, 2),
    RE_HRMAODEOBRA DECIMAL(5, 2),
    PRIMARY KEY (RE_ProdutoCodigo)
);

CREATE TABLE REGISTRO_MANUTENCAO (
    RM_MAQCOD INT,
    RM_DATA date NOT NULL,
    RM_DESCRICAO TEXT,
    PRIMARY KEY (RM_MAQCOD, RM_DATA)
);

-- Alter Tables


ALTER TABLE ENDERECO 
ADD CONSTRAINT FK_Endereco_TipoEndereco
FOREIGN KEY (TipoEndereco_COD) REFERENCES TIPO_END(TIPO_END_COD);


ALTER TABLE TELEFONES_CLIENTES 
ADD CONSTRAINT FK_TelefonesClientes_ClienteCodigo
FOREIGN KEY (TC_ClienteCodigo) REFERENCES CLIENTES(CLI_CODIGO);


ALTER TABLE EMPREGADOS 
ADD CONSTRAINT FK_Empregados_EnderecoID
FOREIGN KEY (EnderecoID) REFERENCES ENDERECO(END_ID);


ALTER TABLE TELEFONES_EMPREGADOS 
ADD CONSTRAINT FK_TelefonesEmpregados_EmpregadoMatricula
FOREIGN KEY (EmpregadoMatricula) REFERENCES EMPREGADOS(EMP_MATRICULA);


ALTER TABLE EMPRESAS 
ADD CONSTRAINT FK_Empresas_EnderecoID
FOREIGN KEY (EnderecoID) REFERENCES ENDERECO(END_ID);


ALTER TABLE TELEFONES_EMPRESAS 
ADD CONSTRAINT FK_TelefonesEmpresas_EmpresaCNPJ
FOREIGN KEY (Empresa_CNPJ) REFERENCES EMPRESAS(EMPRESA_CNPJ);


ALTER TABLE FORNECEDORES 
ADD CONSTRAINT FK_Fornecedores_EnderecoID
FOREIGN KEY (EnderecoID) REFERENCES ENDERECO(END_ID);


ALTER TABLE TELEFONES_FORNECEDORES 
ADD CONSTRAINT FK_TelefonesFornecedores_FornecedorCNPJ
FOREIGN KEY (FornecedorCNPJ) REFERENCES FORNECEDORES(FORN_CNPJ);


ALTER TABLE ENCOMENDAS 
ADD CONSTRAINT FK_Encomendas_ClienteCOD
FOREIGN KEY (Cliente_COD) REFERENCES CLIENTES(CLI_CODIGO);


ALTER TABLE ENCOMENDAS_PRODUTOS 
ADD CONSTRAINT FK_EncomendasProdutos_ProdutoCodigo
FOREIGN KEY (ProdutoCodigo) REFERENCES PRODUTOS(PROD_COD);


ALTER TABLE COMPONENTES 
ADD CONSTRAINT FK_Componentes_TipoComponenteCodigo
FOREIGN KEY (TipoComponenteCodigo) REFERENCES TIPOS_COMPONENTE(TC_COD);


ALTER TABLE FORNECEDORES_COMPONENTES 
ADD CONSTRAINT FK_FornecedoresComponentes_FornecedorCNPJ
FOREIGN KEY (FORNCOMP_FornecedorCNPJ) REFERENCES FORNECEDORES(FORN_CNPJ);

ALTER TABLE FORNECEDORES_COMPONENTES 
ADD CONSTRAINT FK_FornecedoresComponentes_ComponenteCodigo
FOREIGN KEY (FORNCOMP_ComponenteCodigo) REFERENCES COMPONENTES(COMP_COD);


ALTER TABLE RECURSOS_ESPECIFICOS 
ADD CONSTRAINT FK_RecursosEspecificos_ProdutoCodigo
FOREIGN KEY (RE_ProdutoCodigo) REFERENCES PRODUTOS(PROD_COD);


ALTER TABLE REGISTRO_MANUTENCAO 
ADD CONSTRAINT FK_RegistroManutencao_MaquinaCodigo
FOREIGN KEY (RM_MAQCOD) REFERENCES MAQUINAS(MAQ_COD);

-- Alter Tables dos Requerimentos

ALTER TABLE CLIENTES 
ADD CLI_EMAIL VARCHAR(100);

ALTER TABLE CLIENTES 
DROP COLUMN CLI_EMAIL;

ALTER TABLE CLIENTES 
MODIFY CLI_PESSOA_CONT VARCHAR(150);

ALTER TABLE CLIENTES 
CHANGE CLI_PESSOA_CONT CLI_CONTATO VARCHAR(150);

