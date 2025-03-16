CREATE TABLE Challenge_Catagoria_Pergunta(
    id_categoria NUMBER,
    nome_categoria VARCHAR2(30),
    descricao_categoria VARCHAR2(50)
);

ALTER TABLE Challenge_Catagoria_Pergunta ADD PRIMARY KEY (id_categoria);
ALTER TABLE Challenge_Catagoria_Pergunta MODIFY id_categoria NUMBER NOT NULL;

CREATE TABLE Challenge_Pergunta_Frequente(
    id_pergunta NUMBER,
    pergunta VARCHAR2(50),
    resposta VARCHAR2(255),
    id_categoria NUMBER,
    id_idioma NUMBER,
    id_estacao NUMBER
);

ALTER TABLE Challenge_Pergunta_Frequente ADD PRIMARY KEY (id_pergunta);
ALTER TABLE Challenge_Pergunta_Frequente MODIFY id_pergunta NUMBER NOT NULL;
ALTER TABLE Challenge_Pergunta_Frequente ADD CONSTRAINT FK_ID_CATEGORIA FOREIGN KEY (id_categoria) REFERENCES Challenge_Catagoria_Pergunta(id_categoria);
ALTER TABLE Challenge_Pergunta_Frequente ADD CONSTRAINT FK_ID_IDIOMA FOREIGN KEY (id_idioma) REFERENCES Challenge_Idioma(id_idioma);
ALTER TABLE Challenge_Pergunta_Frequente ADD CONSTRAINT FK_ID_ESTACAO FOREIGN KEY (id_estacao) REFERENCES Challenge_Estacao(id_estacao);

CREATE TABLE Challenge_Idioma(
    id_idioma NUMBER,
    nome_idioma VARCHAR2(30)
);

ALTER TABLE Challenge_Idioma ADD PRIMARY KEY (id_idioma);
ALTER TABLE Challenge_Idioma MODIFY id_idioma NUMBER NOT NULL;

CREATE TABLE Challenge_Ponto_Turistico(
    id_ponto_turistico NUMBER,
    nome_turistico VARCHAR2(20),
    descricao_turistico VARCHAR2(100),
    id_estacao NUMBER,
    id_endereco NUMBER
);

ALTER TABLE Challenge_Ponto_Turistico ADD PRIMARY KEY (id_ponto_turistico);
ALTER TABLE Challenge_Ponto_Turistico MODIFY id_ponto_turistico NUMBER NOT NULL;
ALTER TABLE Challenge_Ponto_Turistico ADD CONSTRAINT FK_ID_ESTACAO_TURISTICO FOREIGN KEY (id_estacao) REFERENCES Challenge_Estacao(id_estacao);
ALTER TABLE Challenge_Ponto_Turistico ADD CONSTRAINT FK_ID_ENDERECO_TURISTICO FOREIGN KEY (id_endereco) REFERENCES Challenge_Endereco(id_endereco);

CREATE TABLE Challenge_Endereco(
    id_endereco NUMBER,
    logradouro VARCHAR2(30),
    ponto_referencia VARCHAR2(30),
    id_bairro NUMBER,
    id_cep NUMBER
);

ALTER TABLE Challenge_Endereco ADD PRIMARY KEY (id_endereco);
ALTER TABLE Challenge_Endereco MODIFY id_endereco NUMBER NOT NULL;
ALTER TABLE Challenge_Endereco ADD CONSTRAINT FK_ID_BAIRRO FOREIGN KEY (id_bairro) REFERENCES Challenge_Bairro(id_bairro);
ALTER TABLE Challenge_Endereco ADD CONSTRAINT FK_ID_CEP FOREIGN KEY (id_cep) REFERENCES Challenge_CEP(id_cep);

CREATE TABLE Challenge_CEP(
    id_cep NUMBER,
    cep NUMBER
);

ALTER TABLE Challenge_CEP ADD PRIMARY KEY (id_cep);
ALTER TABLE Challenge_CEP MODIFY id_cep NUMBER NOT NULL;
ALTER TABLE Challenge_CEP ADD UNIQUE (cep);

CREATE TABLE Challenge_Bairro(
    id_bairro NUMBER,
    nome_bairro VARCHAR2(30),
    id_estado NUMBER
);

ALTER TABLE Challenge_Bairro ADD PRIMARY KEY (id_bairro);
ALTER TABLE Challenge_Bairro MODIFY id_bairro NUMBER NOT NULL;
ALTER TABLE Challenge_Bairro ADD CONSTRAINT FK_ID_ESTADO FOREIGN KEY (id_estado) REFERENCES Challenge_Estado(id_estado);

CREATE TABLE Challenge_Estado(
    id_estado NUMBER,
    nome_estado VARCHAR2(30)
);

ALTER TABLE Challenge_Estado ADD PRIMARY KEY (id_estado);
ALTER TABLE Challenge_Estado MODIFY id_estado NUMBER NOT NULL;

CREATE TABLE Challenge_Estacao(
    id_estacao NUMBER,
    nome_estacao VARCHAR2(30)
);

ALTER TABLE Challenge_Estacao ADD PRIMARY KEY (id_estacao);
ALTER TABLE Challenge_Estacao MODIFY id_estacao NUMBER NOT NULL;

CREATE TABLE Challenge_Rota(
    id_rota NUMBER,
    tempo_viagem_rota VARCHAR2(11),
    baudiacao_rota NUMBER,
    id_linha NUMBER,
    id_estacao NUMBER
);

ALTER TABLE Challenge_Rota ADD PRIMARY KEY (id_rota);
ALTER TABLE Challenge_Rota MODIFY id_rota NUMBER NOT NULL;
ALTER TABLE Challenge_Rota ADD CONSTRAINT FK_ID_LINHA FOREIGN KEY (id_linha) REFERENCES Challenge_Linha(id_linha);
ALTER TABLE Challenge_Rota ADD CONSTRAINT FK_ID_ESTACAO_LINHA FOREIGN KEY (id_estacao) REFERENCES Challenge_Estacao(id_estacao);

CREATE TABLE Challenge_Tipo_Incidente(
    id_tipo_incidente NUMBER,
    nome_tipo_incidente VARCHAR2(30),
    descricao_tipo_incidente VARCHAR2(50)
);

ALTER TABLE Challenge_Tipo_Incidente ADD PRIMARY KEY (id_tipo_incidente);
ALTER TABLE Challenge_Tipo_Incidente MODIFY id_tipo_incidente NUMBER NOT NULL;

CREATE TABLE Challenge_Incidente(
    id_incidente NUMBER,
    descricao_incidente VARCHAR2(100),
    data_inicio_incidente DATE,
    data_fim_incidente DATE,
    hora_inicio_incidente VARCHAR2(11),
    hora_fim_incidente VARCHAR2(11),
    id_estacao NUMBER,
    id_tipo NUMBER
);

ALTER TABLE Challenge_Incidente ADD PRIMARY KEY (id_incidente);
ALTER TABLE Challenge_Incidente MODIFY id_incidente NUMBER NOT NULL;
ALTER TABLE Challenge_Incidente ADD CONSTRAINT FK_ID_ESTACAO_INCIDENTE FOREIGN KEY (id_estacao) REFERENCES Challenge_Estacao(id_estacao);
ALTER TABLE Challenge_Incidente ADD CONSTRAINT FK_ID_TIPO_INCIDENTE FOREIGN KEY (id_tipo) REFERENCES Challenge_Tipo_Incidente(id_tipo_incidente);


CREATE TABLE Challenge_Estacao_Linha(
    id_estacao_linha NUMBER,
    id_linha NUMBER,
    id_estacao NUMBER
);

ALTER TABLE Challenge_Estacao_Linha ADD PRIMARY KEY (id_estacao_linha);
ALTER TABLE Challenge_Estacao_Linha MODIFY id_estacao_linha NUMBER NOT NULL;
ALTER TABLE Challenge_Estacao_Linha ADD CONSTRAINT FK_ID_LINNHA_ESTACAO FOREIGN KEY (id_linha) REFERENCES Challenge_Linha(id_linha);
ALTER TABLE Challenge_Estacao_Linha ADD CONSTRAINT FK_ID_ESTACAO_ESTACAO FOREIGN KEY (id_estacao) REFERENCES Challenge_Estacao(id_estacao);

CREATE TABLE Challenge_Linha(
    id_linha NUMBER,
    nome_linha VARCHAR2(30),
    sentido_linha VARCHAR2(30),
    horario_funcionamento_linha VARCHAR2(8)
);

ALTER TABLE Challenge_Linha ADD PRIMARY KEY (id_linha);
ALTER TABLE Challenge_Linha MODIFY id_linha NUMBER NOT NULL;