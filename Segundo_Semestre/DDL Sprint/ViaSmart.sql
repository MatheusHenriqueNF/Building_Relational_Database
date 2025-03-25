
-- CLEYTON ENRIKE DE OLIVEIRA – RM 560485 - Turma 1TDSQ
-- MATHEUS HENRIQUE NASCIMENTO DE FREITAS – RM 560442 - Turma 1TDSQ
-- MATHEUS PINHEIRO ERMACORA MARTIN – RM 557720 - Turma 1TDSZ

-- 1. CRIAÇÃO DE TODAS AS TABELAS
CREATE TABLE Challenge_Estacao(
    id_estacao NUMBER(11),
    nome_estacao VARCHAR2(30),
    status CHAR(1),
    id_usuario NUMBER(11)
);

CREATE TABLE Challenge_Linha(
    id_linha NUMBER(11),
    nome_linha VARCHAR2(30),
    status CHAR(1),
    id_usuario NUMBER(11)
);

CREATE TABLE Challenge_Historico_Busca(
    id_busca NUMBER(11),
    origem VARCHAR2(30),
    destino VARCHAR2(30),
    id_estacao NUMBER(11)
);

CREATE TABLE Challenge_Estacao_Linha(
    id_estacao_linha NUMBER(11),
    id_estacao NUMBER(11),
    id_linha NUMBER(11),
    id_usuario NUMBER(11)
);

CREATE TABLE Challenge_Tipo_Usuario(
    id_tipo_usuario NUMBER(11),
    nome_tipo_usuario VARCHAR2(20),
    status CHAR(1)
);

CREATE TABLE Challenge_Usuario(
    id_usuario NUMBER(11),
    nome_usuario VARCHAR2(11),
    senha VARCHAR2(255),
    ultimo_acesso DATE,
    id_tipo_usuario NUMBER(11)
);

CREATE TABLE Challenge_Logs(
    id_log NUMBER(11),
    acao VARCHAR2(100),
    data_hora_acao DATE,
    id_usuario NUMBER(11)
);

CREATE TABLE Challenge_Pergunta_Frequente(
    id_pergunta NUMBER(11),
    pergunta VARCHAR2(50),
    resposta VARCHAR2(100),
    id_idioma NUMBER(11),
    id_estacao NUMBER(11),
    id_categoria NUMBER(11),
    status CHAR(1),
    id_usuario NUMBER(11)
);

CREATE TABLE Challenge_Idioma(
    id_idioma NUMBER(11),
    nome_idioma VARCHAR2(30),
    status CHAR(1),
    id_usuario NUMBER(11)
);

CREATE TABLE Challenge_Categoria(
    id_categoria NUMBER(11),
    nome_categoria VARCHAR2(30),
    descricao_categoria VARCHAR2(200),
    status CHAR(1),
    id_usuario NUMBER(11)
);

-- 2. ADIÇÃO DE TODAS AS CHAVES PRIMÁRIAS
ALTER TABLE Challenge_Estacao ADD PRIMARY KEY (id_estacao);

ALTER TABLE Challenge_Linha ADD PRIMARY KEY (id_linha);

ALTER TABLE Challenge_Historico_Busca ADD PRIMARY KEY (id_busca);

ALTER TABLE Challenge_Estacao_Linha ADD PRIMARY KEY (id_estacao_linha
);
ALTER TABLE Challenge_Tipo_Usuario ADD PRIMARY KEY (id_tipo_usuario);

ALTER TABLE Challenge_Usuario ADD PRIMARY KEY (id_usuario);

ALTER TABLE Challenge_Logs ADD PRIMARY KEY (id_log);

ALTER TABLE Challenge_Pergunta_Frequente ADD PRIMARY KEY (id_pergunta);

ALTER TABLE Challenge_Idioma ADD PRIMARY KEY (id_idioma);

ALTER TABLE Challenge_Categoria ADD PRIMARY KEY (id_categoria);

-- 3. DEFINIÇÃO DE NOT NULL NAS COLUNAS
ALTER TABLE Challenge_Estacao MODIFY id_estacao NUMBER(11) NOT NULL;
ALTER TABLE Challenge_Estacao MODIFY nome_estacao VARCHAR2(30) NOT NULL;
ALTER TABLE Challenge_Estacao MODIFY status CHAR(1) NOT NULL;
ALTER TABLE Challenge_Estacao MODIFY id_usuario NUMBER(11) NOT NULL;

ALTER TABLE Challenge_Linha MODIFY id_linha NUMBER(11) NOT NULL;
ALTER TABLE Challenge_Linha MODIFY nome_linha VARCHAR2(30) NOT NULL;
ALTER TABLE Challenge_Linha MODIFY status CHAR(1) NOT NULL;
ALTER TABLE Challenge_Linha MODIFY id_usuario NUMBER(11) NOT NULL;

ALTER TABLE Challenge_Historico_Busca MODIFY id_busca NUMBER(11) NOT NULL;
ALTER TABLE Challenge_Historico_Busca MODIFY origem VARCHAR2(30) NOT NULL;
ALTER TABLE Challenge_Historico_Busca MODIFY destino VARCHAR2(30) NOT NULL;
ALTER TABLE Challenge_Historico_Busca MODIFY id_estacao NUMBER(11) NOT NULL;

ALTER TABLE Challenge_Usuario MODIFY id_usuario NUMBER(11) NOT NULL;
ALTER TABLE Challenge_Usuario MODIFY nome_usuario VARCHAR2(11) NOT NULL;
ALTER TABLE Challenge_Usuario MODIFY senha VARCHAR2(255) NOT NULL;
ALTER TABLE Challenge_Usuario MODIFY id_tipo_usuario NUMBER(11) NOT NULL;

-- 4. ADIÇÃO DE CHAVES ESTRANGEIRAS
ALTER TABLE Challenge_Estacao ADD CONSTRAINT FK_ID_ESTACAO FOREIGN KEY (id_usuario) REFERENCES Challenge_Usuario(id_usuario);

ALTER TABLE Challenge_Linha ADD CONSTRAINT FK_ID_USUARIO_LINHA FOREIGN KEY (id_usuario) REFERENCES Challenge_Usuario(id_usuario);

ALTER TABLE Challenge_Historico_Busca ADD CONSTRAINT FK_ID_ESTACAO_BUSCA FOREIGN KEY (id_estacao) REFERENCES Challenge_Estacao(id_estacao);

ALTER TABLE Challenge_Estacao_Linha ADD CONSTRAINT FK_ID_ESTACAO_LINHA FOREIGN KEY (id_estacao) REFERENCES Challenge_Estacao(id_estacao);
ALTER TABLE Challenge_Estacao_Linha ADD CONSTRAINT FK_ID_LINHA_LINHA FOREIGN KEY (id_linha) REFERENCES Challenge_Linha(id_linha);
ALTER TABLE Challenge_Estacao_Linha ADD CONSTRAINT FK_ID_USER_LINHA FOREIGN KEY (id_usuario) REFERENCES Challenge_Usuario(id_usuario);

ALTER TABLE Challenge_Usuario ADD CONSTRAINT FK_ID_TIPO_USUARIO FOREIGN KEY (id_tipo_usuario) REFERENCES Challenge_Tipo_Usuario(id_tipo_usuario);

ALTER TABLE Challenge_Logs ADD CONSTRAINT FK_ID_USUARIO_LOGS FOREIGN KEY (id_usuario) REFERENCES Challenge_Usuario(id_usuario);

ALTER TABLE Challenge_Pergunta_Frequente ADD CONSTRAINT FK_ID_IDIOMA_PERGUNTA FOREIGN KEY (id_idioma) REFERENCES Challenge_Idioma(id_idioma);
ALTER TABLE Challenge_Pergunta_Frequente ADD CONSTRAINT FK_ID_ESTACAO_PERGUNTA FOREIGN KEY (id_estacao) REFERENCES Challenge_Estacao(id_estacao);
ALTER TABLE Challenge_Pergunta_Frequente ADD CONSTRAINT FK_ID_CATEGORIA_PERGUNTA FOREIGN KEY (id_categoria) REFERENCES Challenge_Categoria(id_categoria);
ALTER TABLE Challenge_Pergunta_Frequente ADD CONSTRAINT FK_ID_USUARIO_PERGUNTA FOREIGN KEY (id_usuario) REFERENCES Challenge_Usuario(id_usuario);

ALTER TABLE Challenge_Idioma ADD CONSTRAINT FK_ID_USUARIO_IDIOMA FOREIGN KEY (id_usuario) REFERENCES Challenge_Usuario(id_usuario);

ALTER TABLE Challenge_Categoria ADD CONSTRAINT FK_ID_USUARIO_CATEGORIA FOREIGN KEY (id_usuario) REFERENCES Challenge_Usuario(id_usuario);

-- 5. ADIÇÃO DE RESTRIÇÕES UNIQUE
ALTER TABLE Challenge_Estacao ADD UNIQUE (nome_estacao);

ALTER TABLE Challenge_Linha ADD UNIQUE (nome_linha);

ALTER TABLE Challenge_Usuario ADD UNIQUE (nome_usuario);

ALTER TABLE Challenge_Tipo_Usuario ADD UNIQUE (nome_tipo_usuario);

ALTER TABLE Challenge_Categoria ADD UNIQUE (nome_categoria);

CREATE SEQUENCE seq_estacao START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_linha START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_historico_busca START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_estacao_linha START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_tipo_usuario START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_usuario START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_logs START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_pergunta START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_idioma START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_categoria START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER trg_estacao
BEFORE INSERT ON Challenge_Estacao
FOR EACH ROW
BEGIN
  SELECT seq_estacao.NEXTVAL INTO :NEW.id_estacao FROM DUAL;
END;
/

CREATE OR REPLACE TRIGGER trg_linha
BEFORE INSERT ON Challenge_Linha
FOR EACH ROW
BEGIN
  SELECT seq_linha.NEXTVAL INTO :NEW.id_linha FROM DUAL;
END;
/

CREATE OR REPLACE TRIGGER trg_historico_busca
BEFORE INSERT ON Challenge_Historico_Busca
FOR EACH ROW
BEGIN
  SELECT seq_historico_busca.NEXTVAL INTO :NEW.id_busca FROM DUAL;
END;
/

CREATE OR REPLACE TRIGGER trg_estacao_linha
BEFORE INSERT ON Challenge_Estacao_Linha
FOR EACH ROW
BEGIN
  SELECT seq_estacao_linha.NEXTVAL INTO :NEW.id_estacao_linha FROM DUAL;
END;
/

CREATE OR REPLACE TRIGGER trg_tipo_usuario
BEFORE INSERT ON Challenge_Tipo_Usuario
FOR EACH ROW
BEGIN
  SELECT seq_tipo_usuario.NEXTVAL INTO :NEW.id_tipo_usuario FROM DUAL;
END;
/

CREATE OR REPLACE TRIGGER trg_usuario
BEFORE INSERT ON Challenge_Usuario
FOR EACH ROW
BEGIN
  SELECT seq_usuario.NEXTVAL INTO :NEW.id_usuario FROM DUAL;
END;
/

CREATE OR REPLACE TRIGGER trg_logs
BEFORE INSERT ON Challenge_Logs
FOR EACH ROW
BEGIN
  SELECT seq_logs.NEXTVAL INTO :NEW.id_log FROM DUAL;
END;
/

CREATE OR REPLACE TRIGGER trg_pergunta
BEFORE INSERT ON Challenge_Pergunta_Frequente
FOR EACH ROW
BEGIN
  SELECT seq_pergunta.NEXTVAL INTO :NEW.id_pergunta FROM DUAL;
END;
/

CREATE OR REPLACE TRIGGER trg_idioma
BEFORE INSERT ON Challenge_Idioma
FOR EACH ROW
BEGIN
  SELECT seq_idioma.NEXTVAL INTO :NEW.id_idioma FROM DUAL;
END;
/

CREATE OR REPLACE TRIGGER trg_categoria
BEFORE INSERT ON Challenge_Categoria
FOR EACH ROW
BEGIN
  SELECT seq_categoria.NEXTVAL INTO :NEW.id_categoria FROM DUAL;
END;
/

INSERT INTO Challenge_Tipo_Usuario (nome_tipo_usuario, status) 
VALUES ('Administrador', 1);

INSERT INTO Challenge_Usuario (nome_usuario, senha, ultimo_acesso, id_tipo_usuario) 
VALUES ('admin', 'admin123', SYSDATE, 1);

-- Inserts para Challenge_Estacao
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Tucuruvi', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Parada Inglesa', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Jardim São Paulo-Ayrton Senna', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Santana', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Carandiru', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Portuguesa-Tietê', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Armênia', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Tiradentes', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Luz', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('São Bento', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Sé', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Liberdade', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('São Joaquim', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Vergueiro', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Paraíso', '1', 1);

-- Linha Vermelha (Leste-Oeste)
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Corinthians-Itaquera', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Artur Alvim', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Patriarca', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Guilhermina-Esperança', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Vila Matilde', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Penha', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Carrão', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Tatuapé', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Belém', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Bresser-Mooca', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Brás', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Pedro II', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Sé', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Anhangabaú', '1', 1);

-- Linha Verde (Paulista)
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Vila Madalena', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Sumaré', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Clinicas', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Consolação', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Trianon-MASP', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Brigadeiro', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Paraíso', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Ana Rosa', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Chácara Klabin', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Santos-Imigrantes', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Alto do Ipiranga', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Sacoma', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Tamanduateí', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Vila Prudente', '1', 1);

-- Linha Amarela (Linha 4)
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Luz', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('República', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Higienópolis-Mackenzie', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Paulista', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Oscar Freire', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Fradique Coutinho', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Faria Lima', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Pinheiros', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Butantã', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('São Paulo-Morumbi', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Vila Sônia', '1', 1);

-- Linha Lilás (Linha 5)
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Capão Redondo', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Campo Limpo', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Vila das Belezas', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Giovanni Gronchi', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Santo Amaro', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Largo Treze', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Adolfo Pinheiro', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Alto da Boa Vista', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Borba Gato', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Brooklin', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Campo Belo', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Eucaliptos', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Moema', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('AACD-Servidor', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Hospital São Paulo', '1', 1);

-- Linha Prata (Linha 15 - Monotrilho)
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Vila Prudente', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Oratório', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('São Lucas', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Camilo Haddad', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Vila Tolstói', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Vila União', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Jardim Planalto', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Sapopemba', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Fazenda da Juta', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('São Mateus', '1', 1);
INSERT INTO Challenge_Estacao (nome_estacao, status, id_usuario) VALUES ('Jardim Colonial', '1', 1);

COMMIT;

-- Inserts para Challenge_Linha
INSERT INTO Challenge_Linha (nome_linha, status, id_usuario) VALUES ('Linha Azul', '1', 1);
INSERT INTO Challenge_Linha (nome_linha, status, id_usuario) VALUES ('Linha Vermelha', '1', 1);
INSERT INTO Challenge_Linha (nome_linha, status, id_usuario) VALUES ('Linha Verde', '1', 1);
INSERT INTO Challenge_Linha (nome_linha, status, id_usuario) VALUES ('Linha Amarela', '1', 1);
INSERT INTO Challenge_Linha (nome_linha, status, id_usuario) VALUES ('Linha Lilás', '1', 1);
INSERT INTO Challenge_Linha (nome_linha, status, id_usuario) VALUES ('Linha Prata', '1', 1);

-- Inserts para a tabela Challenge_Historico_Busca
INSERT INTO Challenge_Historico_Busca (origem, destino, id_estacao) VALUES ('Luz', 'República', 1);
INSERT INTO Challenge_Historico_Busca (origem, destino, id_estacao) VALUES ('República', 'Paulista', 2);
INSERT INTO Challenge_Historico_Busca (origem, destino, id_estacao) VALUES ('Paulista', 'Faria Lima', 3);
INSERT INTO Challenge_Historico_Busca (origem, destino, id_estacao) VALUES ('Faria Lima', 'Pinheiros', 4);
INSERT INTO Challenge_Historico_Busca (origem, destino, id_estacao) VALUES ('Pinheiros', 'Butantã', 5);
INSERT INTO Challenge_Historico_Busca (origem, destino, id_estacao) VALUES ('Butantã', 'São Paulo-Morumbi', 6);
INSERT INTO Challenge_Historico_Busca (origem, destino, id_estacao) VALUES ('São Paulo-Morumbi', 'Vila Sônia', 7);

INSERT INTO Challenge_Historico_Busca (origem, destino, id_estacao) VALUES ('Capão Redondo', 'Santo Amaro', 8);
INSERT INTO Challenge_Historico_Busca (origem, destino, id_estacao) VALUES ('Santo Amaro', 'Brooklin', 9);
INSERT INTO Challenge_Historico_Busca (origem, destino, id_estacao) VALUES ('Brooklin', 'Moema', 10);
INSERT INTO Challenge_Historico_Busca (origem, destino, id_estacao) VALUES ('Moema', 'Hospital São Paulo', 11);

INSERT INTO Challenge_Historico_Busca (origem, destino, id_estacao) VALUES ('Vila Prudente', 'Oratório', 12);
INSERT INTO Challenge_Historico_Busca (origem, destino, id_estacao) VALUES ('Oratório', 'São Lucas', 13);
INSERT INTO Challenge_Historico_Busca (origem, destino, id_estacao) VALUES ('São Lucas', 'Camilo Haddad', 14);
INSERT INTO Challenge_Historico_Busca (origem, destino, id_estacao) VALUES ('Camilo Haddad', 'São Mateus', 15);

COMMIT;

-- Inserts para a tabela Challenge_Estacao_Linha
INSERT INTO Challenge_Estacao_Linha (id_estacao, id_linha, id_usuario) VALUES (1, 1, 1);  -- Luz - Linha Azul
INSERT INTO Challenge_Estacao_Linha (id_estacao, id_linha, id_usuario) VALUES (2, 1, 1);  -- São Bento - Linha Azul
INSERT INTO Challenge_Estacao_Linha (id_estacao, id_linha, id_usuario) VALUES (3, 1, 1);  -- Sé - Linha Azul
INSERT INTO Challenge_Estacao_Linha (id_estacao, id_linha, id_usuario) VALUES (4, 1, 1);  -- Paraíso - Linha Azul
INSERT INTO Challenge_Estacao_Linha (id_estacao, id_linha, id_usuario) VALUES (5, 1, 1);  -- Ana Rosa - Linha Azul

INSERT INTO Challenge_Estacao_Linha (id_estacao, id_linha, id_usuario) VALUES (6, 2, 1);  -- República - Linha Vermelha
INSERT INTO Challenge_Estacao_Linha (id_estacao, id_linha, id_usuario) VALUES (7, 2, 1);  -- Sé - Linha Vermelha
INSERT INTO Challenge_Estacao_Linha (id_estacao, id_linha, id_usuario) VALUES (8, 2, 1);  -- Brás - Linha Vermelha
INSERT INTO Challenge_Estacao_Linha (id_estacao, id_linha, id_usuario) VALUES (9, 2, 1);  -- Tatuapé - Linha Vermelha
INSERT INTO Challenge_Estacao_Linha (id_estacao, id_linha, id_usuario) VALUES (10, 2, 1); -- Corinthians-Itaquera - Linha Vermelha

INSERT INTO Challenge_Estacao_Linha (id_estacao, id_linha, id_usuario) VALUES (11, 3, 1); -- Paulista - Linha Amarela
INSERT INTO Challenge_Estacao_Linha (id_estacao, id_linha, id_usuario) VALUES (12, 3, 1); -- Faria Lima - Linha Amarela
INSERT INTO Challenge_Estacao_Linha (id_estacao, id_linha, id_usuario) VALUES (13, 3, 1); -- Pinheiros - Linha Amarela
INSERT INTO Challenge_Estacao_Linha (id_estacao, id_linha, id_usuario) VALUES (14, 3, 1); -- Butantã - Linha Amarela
INSERT INTO Challenge_Estacao_Linha (id_estacao, id_linha, id_usuario) VALUES (15, 3, 1); -- Vila Sônia - Linha Amarela

COMMIT;

-- Inserts para a tabela Challenge_Logs
INSERT INTO Challenge_Logs (acao, data_hora_acao, id_usuario) VALUES ('Login', SYSDATE, 1);
INSERT INTO Challenge_Logs (acao, data_hora_acao, id_usuario) VALUES ('Logout', SYSDATE, 1);
INSERT INTO Challenge_Logs (acao, data_hora_acao, id_usuario) VALUES ('Inseriu Estação', SYSDATE, 2);
INSERT INTO Challenge_Logs (acao, data_hora_acao, id_usuario) VALUES ('Atualizou Linha', SYSDATE, 3);
INSERT INTO Challenge_Logs (acao, data_hora_acao, id_usuario) VALUES ('Deletou Histórico', SYSDATE, 4);

INSERT INTO Challenge_Logs (acao, data_hora_acao, id_usuario) VALUES ('Alterou Senha', SYSDATE, 1);
INSERT INTO Challenge_Logs (acao, data_hora_acao, id_usuario) VALUES ('Criou Usuário', SYSDATE, 2);
INSERT INTO Challenge_Logs (acao, data_hora_acao, id_usuario) VALUES ('Modificou Estação', SYSDATE, 3);
INSERT INTO Challenge_Logs (acao, data_hora_acao, id_usuario) VALUES ('Excluiu Linha', SYSDATE, 4);
INSERT INTO Challenge_Logs (acao, data_hora_acao, id_usuario) VALUES ('Adicionou Nova Linha', SYSDATE, 1);

INSERT INTO Challenge_Logs (acao, data_hora_acao, id_usuario) VALUES ('Consulta Histórico', SYSDATE, 2);
INSERT INTO Challenge_Logs (acao, data_hora_acao, id_usuario) VALUES ('Editou FAQ', SYSDATE, 3);
INSERT INTO Challenge_Logs (acao, data_hora_acao, id_usuario) VALUES ('Criou Categoria', SYSDATE, 4);
INSERT INTO Challenge_Logs (acao, data_hora_acao, id_usuario) VALUES ('Atualizou Idioma', SYSDATE, 1);
INSERT INTO Challenge_Logs (acao, data_hora_acao, id_usuario) VALUES ('Resetou Senha', SYSDATE, 2);

COMMIT;


-- Inserts para Challenge_Pergunta_Frequente
INSERT INTO Challenge_Pergunta_Frequente (pergunta, resposta, id_idioma, id_estacao, id_categoria, status, id_usuario) 
VALUES ('Qual o horário de funcionamento?', 'Das 5h às 23h', 1, 1, 1, '1', 1);

-- Inserts para Challenge_Idioma
INSERT INTO Challenge_Idioma (nome_idioma, status, id_usuario) VALUES ('Português', '1', 1);
INSERT INTO Challenge_Idioma (nome_idioma, status, id_usuario) VALUES ('Inglês', '1', 1);

-- Inserts para Challenge_Categoria
INSERT INTO Challenge_Categoria (nome_categoria, descricao_categoria, status, id_usuario) 
VALUES ('Bilhetes', 'Informações sobre bilhetes', '1', 1);


COMMIT;
