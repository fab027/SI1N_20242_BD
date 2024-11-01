-- Criação do schema
DROP SCHEMA IF EXISTS EST_CASO_IV;
CREATE SCHEMA EST_CASO_IV;
USE EST_CASO_IV;

DROP TABLE IF EXISTS MATRICULAS;
DROP TABLE IF EXISTS PAGAMENTOS;
DROP TABLE IF EXISTS AULAS;
DROP TABLE IF EXISTS PLANOS_TREINAMENTO;
DROP TABLE IF EXISTS MODALIDADES;
DROP TABLE IF EXISTS INSTRUTORES;
DROP TABLE IF EXISTS ALUNOS;

CREATE TABLE ALUNOS (
    ALUNO_ID INT PRIMARY KEY AUTO_INCREMENT,
    ALUNO_NOME VARCHAR(100) NOT NULL,
    ALUNO_CPF VARCHAR(14) UNIQUE NOT NULL,
    ALUNO_DATA_NASCIMENTO DATE NOT NULL,
    ALUNO_ENDERECO VARCHAR(255),
    ALUNO_TELEFONE VARCHAR(15),
    ALUNO_EMAIL VARCHAR(100)
);


CREATE TABLE INSTRUTORES (
    INSTRUTOR_ID INT PRIMARY KEY AUTO_INCREMENT,
    INSTRUTOR_NOME VARCHAR(100) NOT NULL,
    INSTRUTOR_CPF VARCHAR(14) UNIQUE NOT NULL,
    INSTRUTOR_DATA_CONTRATACAO DATE NOT NULL,
    INSTRUTOR_ESPECIALIDADE VARCHAR(50),
    INSTRUTOR_TELEFONE VARCHAR(15),
    INSTRUTOR_EMAIL VARCHAR(100)
);


CREATE TABLE MODALIDADES (
    MODALIDADE_ID INT PRIMARY KEY AUTO_INCREMENT,
    MODALIDADE_NOME VARCHAR(50) NOT NULL,
    MODALIDADE_DESCRICAO TEXT
);


CREATE TABLE PLANOS_TREINAMENTO (
    PLANO_ID INT PRIMARY KEY AUTO_INCREMENT,
    PLANO_DATA_INICIO DATE NOT NULL,
    PLANO_DATA_FIM DATE,
    PLANO_OBJETIVO TEXT,
    PLANO_ALUNO_ID INT,
    PLANO_INSTRUTOR_ID INT,
    FOREIGN KEY (PLANO_ALUNO_ID) REFERENCES Alunos(ALUNO_ID),
    FOREIGN KEY (PLANO_INSTRUTOR_ID) REFERENCES Instrutores(INSTRUTOR_ID)
);


CREATE TABLE AULAS (
    AULA_ID INT PRIMARY KEY AUTO_INCREMENT,
    AULA_DATA_HORA DATETIME NOT NULL,
    AULA_CAPACIDADE INT NOT NULL,
    AULA_MODALIDADE_ID INT,
    AULA_INSTRUTOR_ID INT,
    FOREIGN KEY (AULA_MODALIDADE_ID) REFERENCES MODALIDADES(MODALIDADE_ID),
    FOREIGN KEY (AULA_INSTRUTOR_ID) REFERENCES INSTRUTORES(INSTRUTOR_ID)
);


CREATE TABLE PAGAMENTOS (
    PAGAMENTO_ID INT PRIMARY KEY AUTO_INCREMENT,
    PAGAMENTO_DATA DATE NOT NULL,
    PAGAMENTO_VALOR DECIMAL(10, 2) NOT NULL,
    PAGAMENTO_STATUS ENUM('pago', 'pendente') DEFAULT 'pendente',
    PAGAMENTO_ALUNO_ID INT,
    FOREIGN KEY (PAGAMENTO_ALUNO_ID) REFERENCES ALUNOS(ALUNO_ID)
);

CREATE TABLE MATRICULAS (
    MATRICULA_ID INT PRIMARY KEY AUTO_INCREMENT,
    MATRICULA_DATA DATE NOT NULL,
    MATRICULA_ALUNO_ID INT,
    MATRICULA_MODALIDADE_ID INT,
    FOREIGN KEY (MATRICULA_ALUNO_ID) REFERENCES ALUNOS(ALUNO_ID),
    FOREIGN KEY (MATRICULA_MODALIDADE_ID) REFERENCES MODALIDADES(MODALIDADE_ID)
);

-- Exemplos de comandos ALTER para cada tabela


ALTER TABLE ALUNOS 
ADD COLUMN NOME_COMPLETO VARCHAR(150); 

ALTER TABLE ALUNOS 
DROP COLUMN NOME_COMPLETO; 

ALTER TABLE ALUNOS 
MODIFY COLUMN ALUNO_TELEFONE VARCHAR(20);

ALTER TABLE ALUNOS 
CHANGE COLUMN ALUNO_ENDERECO ENDERECO_COMPLETO VARCHAR(255); 


ALTER TABLE INSTRUTORES 
ADD COLUMN ESPECIALIZACAO VARCHAR(50); 

ALTER TABLE INSTRUTORES 
DROP COLUMN ESPECIALIZACAO;

ALTER TABLE INSTRUTORES 
MODIFY COLUMN INSTRUTOR_TELEFONE VARCHAR(20);

ALTER TABLE INSTRUTORES 
CHANGE COLUMN INSTRUTOR_EMAIL EMAIL_CONTATO VARCHAR(100);
 
 
ALTER TABLE MODALIDADES 
ADD COLUMN DIFICULDADE ENUM('iniciante', 'intermediário', 'avançado');

ALTER TABLE MODALIDADES 
DROP COLUMN DIFICULDADE;

ALTER TABLE MODALIDADES 
MODIFY COLUMN MODALIDADE_DESCRICAO VARCHAR(500);

ALTER TABLE MODALIDADES 
CHANGE COLUMN MODALIDADE_NOME NOME_MODALIDADE VARCHAR(50);


ALTER TABLE PLANOS_TREINAMENTO
ADD COLUMN PLANO_OBSERVACOES TEXT;

ALTER TABLE PLANOS_TREINAMENTO
DROP COLUMN PLANO_OBSERVACOES;

ALTER TABLE PLANOS_TREINAMENTO
MODIFY COLUMN PLANO_OBJETIVO VARCHAR(500);

ALTER TABLE PLANOS_TREINAMENTO
CHANGE COLUMN PLANO_OBJETIVO DESCRICAO_OBJETIVO VARCHAR(500);


ALTER TABLE AULAS
ADD COLUMN AULA_SALA INT; 

ALTER TABLE AULAS
DROP COLUMN AULA_SALA; 

ALTER TABLE AULAS
MODIFY COLUMN AULA_CAPACIDADE INT UNSIGNED; 

ALTER TABLE AULAS 
CHANGE COLUMN AULA_CAPACIDADE TOTAL_CAPACIDADE INT UNSIGNED; 


ALTER TABLE PAGAMENTOS
ADD COLUMN METODO_PAGAMENTO ENUM('cartao', 'boleto', 'dinheiro');

ALTER TABLE PAGAMENTOS
DROP COLUMN METODO_PAGAMENTO; 

ALTER TABLE PAGAMENTOS 
MODIFY COLUMN PAGAMENTO_VALOR DECIMAL(12, 2); 

ALTER TABLE PAGAMENTOS 
CHANGE COLUMN PAGAMENTO_STATUS SITUACAO_PAGAMENTO ENUM('pago', 'pendente');


ALTER TABLE MATRICULAS 
ADD COLUMN STATUS_MATRICULA ENUM('ativa', 'cancelada'); 

ALTER TABLE MATRICULAS 
DROP COLUMN STATUS_MATRICULA; 

ALTER TABLE MATRICULAS 
MODIFY COLUMN MATRICULA_DATA DATE NOT NULL; 

ALTER TABLE MATRICULAS 
CHANGE COLUMN MATRICULA_DATA DATA_DE_MATRICULA DATE NOT NULL; 


