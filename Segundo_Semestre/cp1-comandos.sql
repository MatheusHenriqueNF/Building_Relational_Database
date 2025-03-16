CREATE TABLE CLIENTES (
    ID NUMBER PRIMARY KEY,
    NOME VARCHAR2(100) NOT NULL,
    EMAIL VARCHAR2(100),
    TELEFONE VARCHAR2(20)
);

/*Adicione uma nova coluna chamada CPF do tipo VARCHAR2(11), garantindo que os valores sejam únicos.*/

ALTER TABLE CLIENTES ADD CPF VARCHAR2(11) UNIQUE;

/*Insira um cliente com os seguintes dados:
ID: 1
Nome: "João Silva"
Email: "joao@email.com"
Telefone: "11999999999"
CPF: "12345678901"*/

INSERT INTO CLIENTES(id, nome, email, telefone, cpf) VALUES (1, 'João Silva', 'joao@gmail.com', '11999999999', '12345678901');

/*Atualize o telefone do cliente cujo ID é 1 para "11888888888".*/

select * from clientes;

UPDATE CLIENTES SET telefone = '12345678901' WHERE id = 1;



DELETE FROM CLIENTES WHERE cpf = '12345678901';

CREATE TABLE FUNCIONARIOS (
    MATRICULA NUMBER PRIMARY KEY,
    NOME VARCHAR2(100) NOT NULL,
    CARGO VARCHAR2(50),
    SALARIO NUMBER(10,2)
);

/*Adicione uma nova coluna chamada DEPARTAMENTO do tipo VARCHAR2(50), garantindo que os valores sejam únicos.*/

ALTER TABLE FUNCIONARIOS ADD DEPARTAMENTO VARCHAR(50) UNIQUE;

/*Insira dois funcionários com os seguintes dados:
Funcionário 1:
    Matrícula: 101
    Nome: "Carlos Souza"
    Cargo: "Analista"
    Salário: 5000.00
    Departamento: "TI"

Funcionário 2:
    Matrícula: 102
    Nome: "Mariana Lima"
    Cargo: "Gerente"
    Salário: 8000.00
    Departamento: "RH"
*/

INSERT INTO FUNCIONARIOS (matricula, nome, cargo, salario, departamento) VALUES (101, 'Carlos Souza', 'Analista', 5000.00, 'TI');
INSERT INTO FUNCIONARIOS (matricula, nome, cargo, salario, departamento) VALUES (102, 'Maraiana Lima', 'Gerente', 8000.00, 'RH');

UPDATE FUNCIONARIOS SET cargo = 'Analista Sr' WHERE matricula = 101;

DELETE FROM FUNCIONARIOS WHERE departamento = 'TI';

SELECT * FROM FUNCIONARIOS;

-- Criar a tabela DEPARTAMENTOS
CREATE TABLE DEPARTAMENTOS (
    ID NUMBER PRIMARY KEY,
    NOME VARCHAR2(50) UNIQUE NOT NULL
);


ALTER TABLE FUNCIONARIOS ADD ID_DEPARTAMENTO NUMBER;

INSERT INTO DEPARTAMENTOS (id, nome) VALUES (1, 'RH-Plus');

ALTER TABLE FUNCIONARIOS ADD CONSTRAINT FK_DEP_FUN FOREIGN KEY (id_departamento) REFERENCES DEPARTAMENTOS(id);

SELECT * FROM FUNCIONARIOS;

ALTER TABLE FUNCIONARIOS RENAME COLUMN nome to nome_completo;


-- SELECT (Consultar Dados)
SELECT * FROM funcionarios;
SELECT nome, salario FROM funcionarios;
SELECT * FROM funcionarios WHERE salario > 3000;
SELECT nome, salario FROM funcionarios ORDER BY salario DESC;
SELECT departamento, AVG(salario) AS media_salarial FROM funcionarios GROUP BY departamento;
SELECT f.nome, d.nome AS departamento FROM funcionarios f JOIN departamentos d ON f.id_departamento = d.id;

-- UPDATE (Atualizar Dados)
UPDATE funcionarios SET salario = 5000 WHERE id = 1;
UPDATE funcionarios SET salario = 6000, cargo = 'Gerente' WHERE id = 2;
UPDATE funcionarios SET salario = salario * 1.10 WHERE id_departamento = 3;

-- DELETE (Excluir Dados)
DELETE FROM funcionarios WHERE id = 5;
DELETE FROM funcionarios WHERE id_departamento = 2;
DELETE FROM funcionarios;
TRUNCATE TABLE funcionarios;

-- ALTER TABLE (Modificar a Estrutura da Tabela)
ALTER TABLE funcionarios ADD data_contratacao DATE;
ALTER TABLE funcionarios MODIFY nome VARCHAR2(150);
ALTER TABLE funcionarios RENAME COLUMN salario TO salario_bruto;
ALTER TABLE funcionarios DROP COLUMN data_contratacao;

-- ALTER TABLE (Chaves Primárias e Estrangeiras)
ALTER TABLE funcionarios ADD CONSTRAINT pk_funcionarios PRIMARY KEY (id);
ALTER TABLE funcionarios ADD CONSTRAINT fk_dep_fun FOREIGN KEY (id_departamento) REFERENCES departamentos(id);
ALTER TABLE funcionarios DROP CONSTRAINT pk_funcionarios;
ALTER TABLE funcionarios DROP CONSTRAINT fk_dep_fun;

-- OUTROS COMANDOS 
CREATE TABLE funcionarios (
    id NUMBER PRIMARY KEY,
    nome VARCHAR2(100) NOT NULL,
    salario NUMBER(10,2),
    id_departamento NUMBER,
    CONSTRAINT fk_departamento FOREIGN KEY (id_departamento) REFERENCES departamentos(id)
);

DROP TABLE funcionarios;
ALTER TABLE funcionarios RENAME TO empregados;



/*----------------------------------------------------*/

CREATE TABLE Estudo_Cliente(
    id NUMBER,
    nome VARCHAR2(10),
    email VARCHAR(255)
);

CREATE TABLE Estudo_Produo(
    id NUMBER,
    nome_pord VARCHAR(20),
    id_clie NUMBER
);

/*CHAVE PRIMARIA Estudo_Cliente*/
ALTER TABLE Estudo_Cliente ADD CONSTRAINT PK_CLIE PRIMARY KEY (id);
/*CHAVE PRIMARIA Estudo_Cliente*/
ALTER TABLE Estudo_Produo RENAME TO Estudo_Produto;
ALTER TABLE Estudo_Produto ADD CONSTRAINT PK_PROD PRIMARY KEY (id);

/*ESTRUTURA DO CAMPO*/
ALTER TABLE Estudo_Produto RENAME  Column nome_pord to nome_prod;
ALTER TABLE Estudo_Produto MODIFY nome_prod VARCHAR2(50);
ALTER TABLE Estudo_Cliente MODIFY nome VARCHAR2(100);

/*INSERIR DADOS*/
INSERT INTO Estudo_Cliente(id, nome, email) VALUES(1, 'Matheus', 'mat@gmail.com');
INSERT INTO Estudo_Produto(id, nome_prod) VALUES (1, 'Carro',1);

/*ALTERANDO VALORES DA COLUNA*/
UPDATE Estudo_Produto SET id_clie = 1 where id = 1;

SELECT * FROM Estudo_Produto;
commit;

SELECT * FROM CODIGOS_SQL;