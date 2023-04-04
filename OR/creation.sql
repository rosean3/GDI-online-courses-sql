create or replace type tp_usuario_fone AS OBJECT(
	numero char(11)
);
/

create or replace type tp_usuario_fones AS VARRAY (5) OF tp_usuario_fone;
/

create or replace type tp_usuario_endereco as object(
	complemento varchar2(30),
	cep char(8),
    numero int
);
/

create or replace type tp_usuario as object(
    cpf char(11),
	nome varchar2(30),
    endereco tp_usuario_endereco,
    lista_fones tp_usuario_fones
) not final not INSTANTIABLE;
/

create or replace type tp_educador under tp_usuario( 
);
/

create or replace type tp_aluno under tp_usuario(  
);
/

create or replace type tp_administrador under tp_usuario(
);
/

CREATE TABLE tb_educador of tp_educador(
    cpf PRIMARY KEY
);
/

CREATE TABLE tb_aluno of tp_aluno(
    cpf PRIMARY KEY
);
/

CREATE TABLE tb_administrador of tp_administrador(
    cpf PRIMARY KEY
);
/
 
create or replace type tp_aula as object(
	num_da_aula int,
    titulo varchar2(300),
    duracao float
);
/

create or replace type tp_lista_aulas as table of tp_aula;
/

create or replace type tp_curso as object(
    id number,
	titulo varchar2(300),
    valor float,
    descricao varchar(4000),
    lista_aulas tp_lista_aulas,
    data_hora_publicacao varchar2(20), -- relacionamento publicar
    educador ref tp_educador, -- relacionamento publicar
    administrador ref tp_administrador -- relacionamento publicar
);
/
    
CREATE TABLE tb_curso OF tp_curso(
    id PRIMARY KEY
) NESTED TABLE lista_aulas
STORE AS nt_aulas;

create or replace type tp_efetuar_compra as object(
    id_ec int,
    curso_ec ref tp_curso,
    aluno_ec ref tp_aluno,
    data_hora_compra timestamp
);
/

DROP TABLE tb_efetuar_compra;
/

CREATE TABLE tb_efetuar_compra of tp_efetuar_compra(
	id_ec PRIMARY KEY,
    aluno_ec WITH ROWID REFERENCES tb_aluno,
	curso_ec WITH ROWID REFERENCES tb_curso
);
/

    
create or replace type tp_assistir as object(
	id_as INT,
    aula_as ref tp_aula,
    aluno_as ref tp_aluno,
    data_hora_assitir timestamp
);
/

DROP TABLE tb_assistir;

CREATE TABLE tb_assistir of tp_assistir(
	id_as PRIMARY KEY,
	aluno_as WITH ROWID REFERENCES tb_aluno
    -- aula_as WITH ROWID REFERENCES tp_lista_aulas
    -- tentar referenciar aula de algum jeito
);
/

create or replace type tp_presentear_curso as object(
    id_pc INT,
    aluno_presenteado ref tp_aluno,
    aluno_presenteador ref tp_aluno,
    curso ref tp_curso
);
/

CREATE TABLE tb_presentear_curso of tp_presentear_curso(
	id_pc PRIMARY KEY,
	aluno_presenteado WITH ROWID REFERENCES tb_aluno,
    aluno_presenteador WITH ROWID REFERENCES tb_aluno,
	curso WITH ROWID REFERENCES tb_curso
);
/