USE EST_CASO_V;

SET FOREIGN_KEY_CHECKS = 0;

DELETE FROM PAGAMENTOS;
DELETE FROM VENDAS_PRODUTOS;
DELETE FROM VENDAS;
DELETE FROM PRODUTOS;
DELETE FROM FORNECEDORES;
DELETE FROM CLIENTES;

SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO CLIENTES (CLIENTE_ID, CLIENTE_NOME, CLIENTE_CPF, CLIENTE_DATA_NASC, CLIENTE_RUA, CLIENTE_CIDADE, CLIENTE_ESTADO, CLIENTE_FIDELIDADE_STATUS) 
VALUES 
('1','João Silva', '12345678901', '1990-05-15', 'Rua A, 123', 'São Paulo', 'SP', TRUE),
('2','Maria Oliveira', '98765432109', '1985-10-20', 'Avenida B, 456', 'Rio de Janeiro', 'RJ', FALSE),
('3','Carlos Santos', '45678912300', '1995-12-30', 'Rua C, 789', 'Curitiba', 'PR', TRUE),
('4','Ana Souza', '32165498700', '1998-07-11', 'Rua D, 321', 'Belo Horizonte', 'MG', FALSE),
('5','Lucas Pereira', '78912345600', '1993-03-21', 'Rua E, 654', 'Porto Alegre', 'RS', TRUE);

UPDATE CLIENTES 
SET CLIENTE_CIDADE = 'Campinas'
WHERE CLIENTE_CPF = '12345678901';

UPDATE CLIENTES 
SET CLIENTE_FIDELIDADE_STATUS = TRUE
WHERE CLIENTE_ESTADO = 'RJ';

INSERT INTO FORNECEDORES (FORNECEDOR_ID, FORNECEDOR_NOME, FORNECEDOR_RESPONSAVEL, FORNECEDOR_TELEFONE, FORNECEDOR_EMAIL) 
VALUES 
('1','Fornecedor A', 'João Lima', '11987654321', 'fornecedor.a@example.com'),
('2','Fornecedor B', 'Maria Silva', '21987654321', 'fornecedor.b@example.com'),
('3','Fornecedor C', 'Carlos Oliveira', '31987654321', 'fornecedor.c@example.com'),
('4','Fornecedor D', 'Ana Pereira', '41987654321', 'fornecedor.d@example.com'),
('5','Fornecedor E', 'Lucas Souza', '51987654321', 'fornecedor.e@example.com');

UPDATE FORNECEDORES 
SET FORNECEDOR_RESPONSAVEL = 'Fernanda Rocha'
WHERE FORNECEDOR_NOME = 'Fornecedor B';

UPDATE FORNECEDORES 
SET FORNECEDOR_TELEFONE = '21999999999'
WHERE FORNECEDOR_EMAIL LIKE '%example.com';

INSERT INTO PRODUTOS (PRODUTO_ID, PRODUTO_NOME, PRODUTO_CATEGORIA, PRODUTO_PRECO, PRODUTO_QUANTIDADE, FORNECEDOR_ID) 
VALUES 
('1','Produto A', 'Eletrônicos', 150.00, 50, 1),
('2','Produto B', 'Móveis', 200.00, 30, 2),
('3','Produto C', 'Vestuário', 120.00, 100, 3),
('4','Produto D', 'Alimentos', 250.00, 200, 4),
('5','Produto E', 'Cosméticos', 300.00, 75, 5);

UPDATE PRODUTOS 
SET PRODUTO_PRECO = PRODUTO_PRECO * 1.1
WHERE PRODUTO_CATEGORIA = 'Eletrônicos';

UPDATE PRODUTOS 
SET PRODUTO_QUANTIDADE = 80
WHERE PRODUTO_NOME = 'Produto C';

INSERT INTO VENDAS (VENDA_ID, CLIENTE_ID, DATA_VENDA, VENDA_TOTAL) 
VALUES 
('1', 1, '2024-11-01', 500.00),
('2', 2, '2024-11-01', 300.00),
('3', 3, '2024-11-01', 150.00),
('4', 4, '2024-11-01', 250.00),
('5', 5, '2024-11-01', 450.00);

UPDATE VENDAS 
SET VENDA_TOTAL = VENDA_TOTAL * 0.9
WHERE CLIENTE_ID = 3;

INSERT INTO VENDAS_PRODUTOS (VENDA_ID, PRODUTO_ID, QTDE_COMPRADA) 
VALUES 
(1, 1, 2),
(2, 2, 3),
(3, 3, 1),
(4, 4, 5),
(5, 5, 2);

UPDATE VENDAS_PRODUTOS 
SET QTDE_COMPRADA = 4
WHERE PRODUTO_ID = 1 AND VENDA_ID = 1;

