-- Criação das Tabelas

CREATE TABLE CLIENTE ( 
    CPF VARCHAR(11), 
    NOME VARCHAR(100), 
    END_RUA VARCHAR(255), 
    END_NUM VARCHAR(12), 
    END_CEP VARCHAR(12), 
    TELEFONE_1 VARCHAR(18), 
    TELEFONE_2 VARCHAR(18), 
    CONSTRAINT PK_CLIENTE PRIMARY KEY(CPF) 
);

CREATE TABLE FESTIVAL ( 
    ID VARCHAR(5), 
    NOME VARCHAR(255), 
    CONSTRAINT PK_FESTIVAL PRIMARY KEY(ID) 
);

CREATE TABLE MUSICO ( 
    CPF VARCHAR(11), 
    NOME VARCHAR(255), 
    CONSTRAINT PK_MUSICO PRIMARY KEY(CPF) 
);

CREATE TABLE INSTRUMENTO ( 
    CADASTRO VARCHAR(12), 
    CATEGORIA VARCHAR(255), 
    NOME VARCHAR(100), 
    CONSTRAINT PK_INSTRUMENTO PRIMARY KEY(Cadastro) 
);

CREATE TABLE FUNCIONARIO ( 
    MATRICULA VARCHAR(12), 
    NOME VARCHAR(255), 
    MAT_CHEFE VARCHAR(12), 
    CONSTRAINT PK_MATRICULA PRIMARY KEY(MATRICULA), 
    CONSTRAINT FK_MAT_CHEFE FOREIGN KEY (Mat_chefe) REFERENCES Funcionario(MATRICULA) 
);

CREATE TABLE CANTOR ( 
    CPF VARCHAR(11), 
    NOME VARCHAR(255), 
    CONSTRAINT PK_CANTOR PRIMARY KEY(CPF) 
);

CREATE TABLE INGRESSO ( 
    NUM VARCHAR(12), 
    ID_FESTIVAL VARCHAR(5) NOT NULL, 
    CONSTRAINT PK_INGRESSO PRIMARY KEY(NUM), 
    CONSTRAINT FK_ID_FESTIVAL FOREIGN KEY (ID_FESTIVAL) REFERENCES FESTIVAL(ID) 
);

CREATE TABLE EQUIPE ( 
    NUM_EQUIPE VARCHAR(12),  --Discriminador / não é por que 1:1 
    CPF_CANTOR VARCHAR(11), -- CPF ARTISTA 
    CONSTRAINT PK_EQUIPE PRIMARY KEY(CPF_CANTOR), 
    CONSTRAINT FK_CPF_C FOREIGN KEY (CPF_CANTOR) REFERENCES CANTOR ON DELETE CASCADE
);

CREATE TABLE SHOW ( 
    COD VARCHAR(12), 
    NOME VARCHAR(255), 
    ID_FESTIVAL VARCHAR(12), 
    DATA_HORA TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    LOCAL_ VARCHAR(30), 
    CONSTRAINT PK_SHOW PRIMARY KEY (COD), 
    CONSTRAINT FK_ID_SHOW FOREIGN KEY (ID_FESTIVAL) REFERENCES Festival(ID) 
);

CREATE TABLE GINCANA ( 
    COD VARCHAR(12), 
    ID_FESTIVAL VARCHAR(12), 
    DATA_HORA TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    LOCAL_ VARCHAR(30), 
    CONSTRAINT PK_GINCANA PRIMARY KEY (COD), 
    CONSTRAINT FK_ID_GINCANA FOREIGN KEY (ID_FESTIVAL) REFERENCES Festival(ID) 
);

CREATE TABLE COMPRA ( 
    CPF VARCHAR(11), 
    NUM VARCHAR(12), 
    CONSTRAINT PK_COMPRA PRIMARY KEY (NUM), 
    CONSTRAINT FK_CPF FOREIGN KEY (CPF) REFERENCES CLIENTE(CPF), 
    CONSTRAINT FK_NUM FOREIGN KEY (NUM) REFERENCES INGRESSO(NUM) 
);

CREATE TABLE TRABALHA ( 
    ID_FESTIVAL VARCHAR(12), 
    DATA_ TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    MATRICULA_FUNC VARCHAR(12), 
    CONSTRAINT PK_TRABALHA PRIMARY KEY (ID_FESTIVAL, MATRICULA_FUNC, DATA_), 
    CONSTRAINT FK_FUNCIONARIO FOREIGN KEY (MATRICULA_FUNC) REFERENCES FUNCIONARIO(Matricula), 
    CONSTRAINT FK_FESTIVAL FOREIGN KEY (ID_FESTIVAL) REFERENCES FESTIVAL(ID) 
);

CREATE TABLE FAZ ( 
    COD_SHOW VARCHAR(12), 
    CPF_CANTOR VARCHAR(11), 
    CONSTRAINT PK_FAZ PRIMARY KEY (COD_SHOW, CPF_CANTOR), 
    CONSTRAINT FK_SHOW FOREIGN KEY (COD_SHOW) REFERENCES SHOW(COD), 
    CONSTRAINT FK_CANTOR FOREIGN KEY (CPF_CANTOR) REFERENCES CANTOR(CPF) 
);

CREATE TABLE PARTICIPA ( 
    NUM_INGRESSO VARCHAR(5), 
    COD_GINCANA VARCHAR(12), 
    CONSTRAINT PK_PARTICIPA PRIMARY KEY (NUM_INGRESSO,COD_GINCANA), 
    CONSTRAINT FK_NUM_PARTICIPA FOREIGN KEY (NUM_INGRESSO) REFERENCES COMPRA(NUM), 
    CONSTRAINT FK_COD_PARTICIPA FOREIGN KEY (COD_GINCANA) REFERENCES GINCANA(COD) 
 
);

CREATE TABLE TOCA ( 
    COD_SHOW VARCHAR(12), 
    CPF_MUSICO VARCHAR(11), 
    CAD_INST VARCHAR(12), 
    CONSTRAINT PK_TOCA PRIMARY KEY (COD_SHOW, CPF_MUSICO, CAD_INST), 
    CONSTRAINT FK_SHOW_TOCA FOREIGN KEY (COD_SHOW) REFERENCES SHOW(COD), 
    CONSTRAINT FK_MUSICO_TOCA FOREIGN KEY (CPF_MUSICO) REFERENCES MUSICO(CPF), 
    CONSTRAINT FK_INSTRUMENTO_TOCA FOREIGN KEY (CAD_INST) REFERENCES INSTRUMENTO(Cadastro) 
);

-- Fim do Script SQL

-- Tabela Cliente
-- Inserções na tabela Cliente
INSERT INTO CLIENTE (CPF, NOME, END_RUA, END_NUM, END_CEP, TELEFONE_1, TELEFONE_2)
VALUES ('16879341004', 'Maria Silva', 'Rua das Flores', '123', '12345-678', '+55 11 987654321', '+55 11 912345678');

INSERT INTO CLIENTE (CPF, NOME, END_RUA, END_NUM, END_CEP, TELEFONE_1, TELEFONE_2)
VALUES ('64340132055', 'José Oliveira', 'Avenida Principal', '456', '54321-876', '+55 11 912345678', '+55 11 998877665');

INSERT INTO CLIENTE (CPF, NOME, END_RUA, END_NUM, END_CEP, TELEFONE_1, TELEFONE_2)
VALUES ('37438576000', 'Ana Pereira', 'Rua da Paz', '789', '98765-432', '+55 11 998877665', '+55 11 912345678');

INSERT INTO CLIENTE (CPF, NOME, END_RUA, END_NUM, END_CEP, TELEFONE_1, TELEFONE_2)
VALUES ('93547295092', 'Pedro Santos', 'Avenida Central', '1011', '23456-789', '+55 11 912345678', '+55 11 998877665');

INSERT INTO CLIENTE (CPF, NOME, END_RUA, END_NUM, END_CEP, TELEFONE_1, TELEFONE_2)
VALUES ('76326465079', 'Sônia Souza', 'Rua do Sol', '1213', '76543-210', '+55 11 998877665', '+55 11 912345678');

INSERT INTO CLIENTE (CPF, NOME, END_RUA, END_NUM, END_CEP, TELEFONE_1, TELEFONE_2)
VALUES ('12121212121', 'Isabela Santos', 'Rua das Palmeiras', '131', '13579-246', '+55 11 876543210', '+55 11 987654321');

INSERT INTO CLIENTE (CPF, NOME, END_RUA, END_NUM, END_CEP, TELEFONE_1, TELEFONE_2)
VALUES ('23232323232', 'Fábio Oliveira', 'Avenida das Águias', '232', '23232-323', '+55 11 765432109', '+55 11 876543210');

INSERT INTO CLIENTE (CPF, NOME, END_RUA, END_NUM, END_CEP, TELEFONE_1, TELEFONE_2)
VALUES ('34343434343', 'Camila Silva', 'Rua do Rio', '343', '34343-434', '+55 11 654321098', '+55 11 765432109');

INSERT INTO CLIENTE (CPF, NOME, END_RUA, END_NUM, END_CEP, TELEFONE_1, TELEFONE_2)
VALUES ('45454545454', 'Rafael Santos', 'Avenida dos Sonhos', '454', '45454-545', '+55 11 543210987', '+55 11 654321098');

INSERT INTO CLIENTE (CPF, NOME, END_RUA, END_NUM, END_CEP, TELEFONE_1, TELEFONE_2)
VALUES ('56565656565', 'Larissa Oliveira', 'Rua das Estrelas', '565', '56565-656', '+55 11 432109876', '+55 11 543210987');

-- Inserções na tabela Festival
INSERT INTO FESTIVAL (ID, NOME) 
VALUES ('F001', 'Festival de Verão');
INSERT INTO FESTIVAL (ID, NOME) 
VALUES ('F002', 'Festival de Rock');
INSERT INTO FESTIVAL (ID, NOME) 
VALUES ('F003', 'Festival de Jazz');
INSERT INTO FESTIVAL (ID, NOME) 
VALUES ('F004', 'Festival de Blues');
INSERT INTO FESTIVAL (ID, NOME) 
VALUES ('F005', 'Festival de Eletrônica');
INSERT INTO FESTIVAL (ID, NOME) 
VALUES ('F006', 'Festival de Hip-Hop');
INSERT INTO FESTIVAL (ID, NOME) 
VALUES ('F007', 'Festival de Sertanejo');
INSERT INTO FESTIVAL (ID, NOME) 
VALUES ('F008', 'Festival de Reggae');
INSERT INTO FESTIVAL (ID, NOME) 
VALUES ('F009', 'Festival de R&B');
INSERT INTO FESTIVAL (ID, NOME) 
VALUES ('F010', 'Festival de Clássica');

-- Inserções na tabela Músico
INSERT INTO MUSICO (CPF, NOME) 
VALUES ('28028106005', 'Carlos Drummond');
INSERT INTO MUSICO (CPF, NOME) 
VALUES ('08465591024', 'Ana Carolina');
INSERT INTO MUSICO (CPF, NOME) 
VALUES ('53202592041', 'Lucas Lima');
INSERT INTO MUSICO (CPF, NOME) 
VALUES ('86218173062', 'Laura Lima');
INSERT INTO MUSICO (CPF, NOME) 
VALUES ('25637592004', 'Ricardo Fernandes');
INSERT INTO MUSICO (CPF, NOME) 
VALUES ('83041873028', 'Juliana Almeida');
INSERT INTO MUSICO (CPF, NOME) 
VALUES ('75279490075', 'Antônio Silva');
INSERT INTO MUSICO (CPF, NOME) 
VALUES ('78690296026', 'Luciana Sousa');
INSERT INTO MUSICO (CPF, NOME) 
VALUES ('55292353019', 'Roberto Pereira');
INSERT INTO MUSICO (CPF, NOME) 
VALUES ('14100110030', 'Amanda Oliveira');


-- Inserções na tabela Instrumento
INSERT INTO INSTRUMENTO (CADASTRO, CATEGORIA, NOME) 
VALUES ('I001', 'Corda', 'Violão');
INSERT INTO INSTRUMENTO (CADASTRO, CATEGORIA, NOME) 
VALUES ('I002', 'Sopro', 'Saxofone');
INSERT INTO INSTRUMENTO (CADASTRO, CATEGORIA, NOME) 
VALUES ('I003', 'Percussão', 'Bateria');
INSERT INTO INSTRUMENTO (CADASTRO, CATEGORIA, NOME) 
VALUES ('I004', 'Corda', 'Baixo');
INSERT INTO INSTRUMENTO (CADASTRO, CATEGORIA, NOME) 
VALUES ('I005', 'Sopro', 'Trompete');
INSERT INTO INSTRUMENTO (CADASTRO, CATEGORIA, NOME) 
VALUES ('I006', 'Corda', 'Violino');
INSERT INTO INSTRUMENTO (CADASTRO, CATEGORIA, NOME) 
VALUES ('I007', 'Percussão', 'Tambor');
INSERT INTO INSTRUMENTO (CADASTRO, CATEGORIA, NOME) 
VALUES ('I008', 'Sopro', 'Flauta');
INSERT INTO INSTRUMENTO (CADASTRO, CATEGORIA, NOME) 
VALUES ('I009', 'Corda', 'Guitarra');
INSERT INTO INSTRUMENTO (CADASTRO, CATEGORIA, NOME) 
VALUES ('I010', 'Sopro', 'Clarinete');


-- Inserções na tabela Funcionário
INSERT INTO FUNCIONARIO (MATRICULA, NOME, MAT_CHEFE)
VALUES ('M001', 'João Silva', NULL);

CREATE OR REPLACE TRIGGER trigger_funcionario
BEFORE INSERT ON FUNCIONARIO 
FOR EACH ROW 
DECLARE 
  MAT_CHEFE FUNCIONARIO.MAT_CHEFE%TYPE; 
BEGIN 
 -- Seleciona uma MATRICULA aleatória existente na tabela FUNCIONARIO
    IF :NEW.MAT_CHEFE IS NULL THEN  
        SELECT MATRICULA INTO MAT_CHEFE FROM ( 
            SELECT MATRICULA FROM FUNCIONARIO WHERE MATRICULA <> :NEW.MATRICULA ORDER BY DBMS_RANDOM.RANDOM) 
        WHERE ROWNUM = 1; 
 
        -- Atribui a MATRICULA selecionada à coluna MAT_CHEFE do novo registro 
        :NEW.MAT_CHEFE := MAT_CHEFE; 
    END IF; 
END; 
/

INSERT INTO FUNCIONARIO (MATRICULA, NOME)
VALUES ('M002', 'Maria Santos');

INSERT INTO FUNCIONARIO (MATRICULA, NOME)
VALUES ('M003', 'Pedro Oliveira');

INSERT INTO FUNCIONARIO (MATRICULA, NOME)
VALUES ('M004', 'Lucas Lima');

INSERT INTO FUNCIONARIO (MATRICULA, NOME)
VALUES ('M005', 'Juliana Almeida');

INSERT INTO FUNCIONARIO (MATRICULA, NOME)
VALUES ('M006', 'Antônio Silva');

INSERT INTO FUNCIONARIO (MATRICULA, NOME)
VALUES ('M007', 'Luciana Sousa');

INSERT INTO FUNCIONARIO (MATRICULA, NOME)
VALUES ('M008', 'Roberto Pereira');

INSERT INTO FUNCIONARIO (MATRICULA, NOME)
VALUES ('M009', 'Amanda Oliveira');

INSERT INTO FUNCIONARIO (MATRICULA, NOME)
VALUES ('M010', 'Fernanda Alves');

-- Inserções na tabela Cantor
INSERT INTO CANTOR (CPF, NOME)
VALUES ('45121087004', 'Carlos Drummond');
INSERT INTO CANTOR (CPF, NOME)
VALUES ('46323246040', 'Ana Carolina');
INSERT INTO CANTOR (CPF, NOME)
VALUES ('53942339005', 'Lucas Lima');
INSERT INTO CANTOR (CPF, NOME)
VALUES ('08409673061', 'Laura Lima');
INSERT INTO CANTOR (CPF, NOME)
VALUES ('99730647046', 'Ricardo Fernandes');

--Inserções na tabela Ingresso - 

CREATE OR REPLACE TRIGGER TRG_ADICIONAR_ID_FESTIVAL
BEFORE INSERT ON INGRESSO
FOR EACH ROW
DECLARE
  v_festival_id VARCHAR(5);
BEGIN
  -- Verifica se há festivais existentes na tabela FESTIVAL
  SELECT ID INTO v_festival_id
  FROM FESTIVAL
  WHERE ROWNUM = 1
  ORDER BY DBMS_RANDOM.VALUE;

  -- Atribui o ID aleatório da tabela FESTIVAL à nova linha de INGRESSO
  :NEW.ID_FESTIVAL := v_festival_id;
END;
/

INSERT INTO INGRESSO (NUM)
VALUES ('IN001');

INSERT INTO INGRESSO (NUM)
VALUES ('IN002');

INSERT INTO INGRESSO (NUM)
VALUES ('IN003');

INSERT INTO INGRESSO (NUM)
VALUES ('IN004');

INSERT INTO INGRESSO (NUM)
VALUES ('IN005');

INSERT INTO INGRESSO (NUM)
VALUES ('IN006');

-- Inserções na tabela Equipe

CREATE OR REPLACE TRIGGER TRG_ADICIONAR_CPF_CANTOR
BEFORE INSERT ON EQUIPE
FOR EACH ROW
DECLARE
  v_cantor_cpf VARCHAR(11);
BEGIN
  -- Verifica se há cantores existentes na tabela CANTOR
  SELECT CPF INTO v_cantor_cpf
  FROM CANTOR
  WHERE ROWNUM = 1
  ORDER BY DBMS_RANDOM.VALUE;

  -- Atribui o CPF aleatório da tabela CANTOR à nova linha de EQUIPE
  :NEW.CPF_CANTOR := v_cantor_cpf;
END;
/

INSERT INTO EQUIPE (NUM_EQUIPE)
VALUES ('E001');

INSERT INTO EQUIPE (NUM_EQUIPE)
VALUES ('E002');

INSERT INTO EQUIPE (NUM_EQUIPE)
VALUES ('E003');

INSERT INTO EQUIPE (NUM_EQUIPE)
VALUES ('E004');

INSERT INTO EQUIPE (NUM_EQUIPE)
VALUES ('E005');

INSERT INTO EQUIPE (NUM_EQUIPE)
VALUES ('E006');

-- Inserções na tabela Show

CREATE OR REPLACE TRIGGER TRG_ADICIONAR_ID_FESTIVAL2
BEFORE INSERT ON SHOW
FOR EACH ROW
DECLARE
  v_festival_id VARCHAR(10);
BEGIN
  -- Verifica se há festivais existentes na tabela FESTIVAL
  SELECT ID INTO v_festival_id
  FROM FESTIVAL
  WHERE ROWNUM = 1
  ORDER BY DBMS_RANDOM.VALUE;

  -- Atribui o ID aleatório da tabela FESTIVAL à nova linha de INGRESSO
  :NEW.ID_FESTIVAL := v_festival_id;
END;
/

INSERT INTO SHOW (COD, NOME,LOCAL_)
VALUES ('S001', 'Show de Rock','Praça Central');

INSERT INTO SHOW (COD, NOME,LOCAL_)
VALUES ('S002', 'Show de Pop','Estádio Municipal');

INSERT INTO SHOW (COD, NOME, LOCAL_)
VALUES ('S003', 'Show de Jazz', 'Teatro Municipal');

INSERT INTO SHOW (COD, NOME, LOCAL_)
VALUES ('S004', 'Show de Blues','Auditório Municipal');

INSERT INTO SHOW (COD, NOME, LOCAL_)
VALUES ('S005', 'Show de Hip-Hop', 'Arena de Eventos');

INSERT INTO SHOW (COD, NOME, LOCAL_)
VALUES ('S006', 'Show de Eletrônica', 'Clube Noturno');

CREATE OR REPLACE TRIGGER TRG_ADICIONAR_ID_FESTIVAL3
BEFORE INSERT ON GINCANA
FOR EACH ROW
DECLARE
  v_festival_id VARCHAR(10);
BEGIN
  -- Verifica se há festivais existentes na tabela FESTIVAL
  SELECT ID INTO v_festival_id
  FROM FESTIVAL
  WHERE ROWNUM = 1
  ORDER BY DBMS_RANDOM.VALUE;

  -- Atribui o ID aleatório da tabela FESTIVAL à nova linha de INGRESSO
  :NEW.ID_FESTIVAL := v_festival_id;
END;
/

-- Inserções na tabela Gincana
INSERT INTO GINCANA (COD, LOCAL_)
VALUES ('G001', 'Centro de Convenções');

INSERT INTO GINCANA (COD, LOCAL_)
VALUES ('G002', 'Praça de Alimentação');

INSERT INTO GINCANA (COD, LOCAL_)
VALUES ('G003', 'Espaco Cultural');

INSERT INTO GINCANA (COD, LOCAL_)
VALUES ('G004', 'Pailo Esportivo');

INSERT INTO GINCANA (COD, LOCAL_)
VALUES ('G005', 'Universo de Arte');

INSERT INTO GINCANA (COD, NOME, LOCAL_)
VALUES ('G006', 'Espaco Ciencia');


-- Inserções na tabela COMPRA


-- Inserções na tabela TRABALHA

BEGIN
INSERE_TRABALHA;
INSERE_TOCA;
INSERE_FAZ;
INSERE_PARTICIPA;
INSERE_COMPRA;
END;
/
-- Fim da inserção de dados
