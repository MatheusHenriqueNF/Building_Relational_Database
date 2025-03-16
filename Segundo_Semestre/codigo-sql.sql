CREATE TABLE codigos_sql (
    id NUMBER PRIMARY KEY,
    codigo CLOB
);

INSERT INTO codigos_sql (id, codigo) VALUES (1, TO_CLOB('
-- SELECT (Consultar Dados)
SELECT * FROM funcionarios;
SELECT nome, salario FROM funcionarios;
SELECT * FROM funcionarios WHERE salario > 3000;
SELECT nome, salario FROM funcionarios ORDER BY salario DESC;
SELECT departamento, AVG(salario) AS media_salarial FROM funcionarios GROUP BY departamento;
SELECT f.nome, d.nome AS departamento FROM funcionarios f JOIN departamentos d ON f.id_departamento = d.id;
'));

SELECT * FROM codigos_sql;

INSERT INTO codigos_sql (id, codigo) VALUES (2, TO_CLOB('
-- UPDATE (Atualizar Dados)
UPDATE funcionarios SET salario = 5000 WHERE id = 1;
UPDATE funcionarios SET salario = 6000, cargo = ''Gerente'' WHERE id = 2;
UPDATE funcionarios SET salario = salario * 1.10 WHERE id_departamento = 3;
'));

INSERT INTO codigos_sql (id, codigo) VALUES (3, TO_CLOB('
-- DELETE (Excluir Dados)
DELETE FROM funcionarios WHERE id = 5;
DELETE FROM funcionarios WHERE id_departamento = 2;
DELETE FROM funcionarios;
TRUNCATE TABLE funcionarios;
'));

INSERT INTO codigos_sql (id, codigo) VALUES (4, TO_CLOB('
-- ALTER TABLE (Modificar a Estrutura da Tabela)
ALTER TABLE funcionarios ADD data_contratacao DATE;
ALTER TABLE funcionarios MODIFY nome VARCHAR2(150);
ALTER TABLE funcionarios RENAME COLUMN salario TO salario_bruto;
ALTER TABLE funcionarios DROP COLUMN data_contratacao;
'));

INSERT INTO codigos_sql (id, codigo) VALUES (5, TO_CLOB('
-- ALTER TABLE (Chaves Primárias e Estrangeiras)
ALTER TABLE funcionarios ADD CONSTRAINT pk_funcionarios PRIMARY KEY (id);
ALTER TABLE funcionarios ADD CONSTRAINT fk_dep_fun FOREIGN KEY (id_departamento) REFERENCES departamentos(id);
ALTER TABLE funcionarios DROP CONSTRAINT pk_funcionarios;
ALTER TABLE funcionarios DROP CONSTRAINT fk_dep_fun;
'));

INSERT INTO codigos_sql (id, codigo) VALUES (6, TO_CLOB('
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
'));

commit;