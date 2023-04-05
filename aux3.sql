-- -- ! eu tava só testando umas gambiarras aqui nesse arquivo
-- DROP TABLE tb_presentear_curso;
-- DROP TABLE tb_assistir;
-- DROP TABLE tb_efetuar_compra;
-- DROP TABLE tb_curso;
-- DROP TABLE tb_administrador;
-- DROP TABLE tb_aluno;
-- DROP TABLE tb_educador;

-- create or replace type tp_usuario_fone AS OBJECT(
-- 	numero char(11)
-- );
-- /

-- create or replace type tp_usuario_fones AS VARRAY (5) OF tp_usuario_fone;
-- /

-- create or replace type tp_usuario_endereco as object(
-- 	complemento varchar2(30),
-- 	cep char(8),
--     numero int
-- );
-- /

-- create or replace type tp_usuario as object(
--     cpf char(11),
-- 	nome varchar2(30),
--     endereco tp_usuario_endereco,
--     lista_fones tp_usuario_fones
-- ) not final not INSTANTIABLE;
-- /

-- create or replace type tp_educador under tp_usuario( 
-- );
-- /

-- create or replace type tp_aluno under tp_usuario(  
-- );
-- /

-- create or replace type tp_administrador under tp_usuario(
-- );
-- /

-- CREATE TABLE tb_educador of tp_educador(
--     cpf PRIMARY KEY
-- );
-- /

-- CREATE TABLE tb_aluno of tp_aluno(
--     cpf PRIMARY KEY
-- );
-- /

-- CREATE TABLE tb_administrador of tp_administrador(
--     cpf PRIMARY KEY
-- );
-- /
 
-- create or replace type tp_aula as object(
-- 	num_da_aula int,
--     titulo varchar2(300),
--     duracao float
-- );
-- /

-- create or replace type tp_lista_aulas as table of tp_aula;
-- /

-- create or replace type tp_curso as object(
--     id number,
-- 	titulo varchar2(300),
--     valor float,
--     descricao varchar(4000),
--     lista_aulas tp_lista_aulas,
--     data_hora_publicacao varchar2(20), -- relacionamento publicar
--     educador ref tp_educador, -- relacionamento publicar
--     administrador ref tp_administrador -- relacionamento publicar
-- );
-- /
    
-- CREATE TABLE tb_curso OF tp_curso(
--     id PRIMARY KEY
-- ) NESTED TABLE lista_aulas
-- STORE AS nt_aulas;

-- create or replace type tp_efetuar_compra as object(
--     id_ec int,
--     curso_ec ref tp_curso,
--     aluno_ec ref tp_aluno,
--     data_hora_compra timestamp
-- );
-- /

-- CREATE TABLE tb_efetuar_compra of tp_efetuar_compra(
-- 	id_ec PRIMARY KEY,
--     aluno_ec WITH ROWID REFERENCES tb_aluno,
-- 	curso_ec WITH ROWID REFERENCES tb_curso
-- );
-- /

    
-- create or replace type tp_assistir as object(
-- 	id_as INT,
--     aula_as ref tp_aula,
--     aluno_as ref tp_aluno,
--     data_hora_assitir timestamp
-- );
-- /

-- DROP TABLE tb_assistir;

-- CREATE TABLE tb_assistir OF tp_assistir(
-- 	id_as PRIMARY KEY,
-- 	aluno_as WITH ROWID REFERENCES tb_aluno,
-- 	aula REF tp_aula SCOPE IS tb_curso
-- );

-- CREATE TABLE tb_assistir of tp_assistir(
-- 	id_as PRIMARY KEY,
-- 	aluno_as WITH ROWID REFERENCES tb_aluno
--     -- aula_as WITH ROWID REFERENCES tp_lista_aulas
--     -- tentar referenciar aula de algum jeito
-- );
-- /

-- create or replace type tp_presentear_curso as object(
--     id_pc INT,
--     aluno_presenteado ref tp_aluno,
--     aluno_presenteador ref tp_aluno,
--     curso ref tp_curso
-- );
-- /

-- CREATE TABLE tb_presentear_curso of tp_presentear_curso(
-- 	id_pc PRIMARY KEY,
-- 	aluno_presenteado WITH ROWID REFERENCES tb_aluno,
--     aluno_presenteador WITH ROWID REFERENCES tb_aluno,
-- 	curso WITH ROWID REFERENCES tb_curso
-- );
-- /

-- -- inserir um curso
-- insert into tb_curso values(
--     1,
--     'Curso de Java',
--     100.00,
--     'Curso de Java',
--     tp_lista_aulas(
--         tp_aula(1, 'Aula 1', 1.5),
--         tp_aula(2, 'Aula 2', 1.5),
--         tp_aula(3, 'Aula 3', 1.5),
--         tp_aula(4, 'Aula 4', 1.5),
--         tp_aula(5, 'Aula 5', 1.5)
--     ),
--     '01/01/2020 00:00:00',
--     null,
--     null
-- );

-- -- selecionar uma aula de um curso
-- SELECT * FROM TABLE (SELECT C.lista_aulas FROM tb_curso C WHERE C.id = 1) T WHERE T.NUM_DA_AULA=1;
-- /

-- DROP TABLE tb_assistir;

-- CREATE TABLE tb_assistir of tp_assistir(
-- 	id_as PRIMARY KEY,
-- 	aluno_as WITH ROWID REFERENCES tb_aluno,
--     aula_as WITH ROWID REFERENCES nt_aulas
--     -- aula_as WITH ROWID REFERENCES tp_lista_aulas
--     -- tentar referenciar aula de algum jeito
-- );
-- /


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
    lista_fones tp_usuario_fones,
    CONSTRUCTOR FUNCTION tp_usuario(SELF IN OUT NOCOPY
tp_usuario, cpf char, nome varchar2, endereco tp_usuario_endereco, lista_fones tp_usuario_fones
) RETURN SELF AS RESULT
) not final not INSTANTIABLE;
/

create or replace type body tp_usuario as
CONSTRUCTOR FUNCTION tp_usuario(SELF IN OUT tp_usuario, Cpf char, Nome varchar2, Endereco tp_usuario_endereco, Lista_fones tp_usuario_fones
) RETURN SELF AS
RESULT IS BEGIN
SELF.cpf := Cpf;
SELF.nome := UPPER(Nome);
SELF.endereco := Endereco;
SELF.lista_fones := Lista_fones;
END;
end;

create or replace type tp_educador under tp_usuario( 
);
/

--insert 2 educators
insert into tb_educador values(
    tp_educador('12345678901', 'Joao', tp_usuario_endereco('Rua 1', '12345678', 1), tp_usuario_fones(tp_usuario_fone('12345678901'), tp_usuario_fone('12345678902')))
);
insert into tb_educador values(
    tp_educador('12345678902', 'MariA', tp_usuario_endereco('Rua 2', '12345678', 2), tp_usuario_fones(tp_usuario_fone('12345678903'), tp_usuario_fone('12345678904')))
);

create or replace type tp_aluno under tp_usuario(  
);
/

create or replace type tp_administrador under tp_usuario(
);
/

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
    lista_fones tp_usuario_fones,
    CONSTRUCTOR FUNCTION tp_usuario(SELF IN OUT NOCOPY
tp_usuario, cpf char, nome varchar2, endereco tp_usuario_endereco, lista_fones tp_usuario_fones
) RETURN SELF AS RESULT
) not final;
/

create or replace type body tp_usuario as
CONSTRUCTOR FUNCTION tp_usuario(SELF IN OUT tp_usuario, Cpf char, Nome varchar2, Endereco tp_usuario_endereco, Lista_fones tp_usuario_fones
) RETURN SELF AS
RESULT IS BEGIN
SELF.cpf := Cpf;
SELF.nome := 'teste';
SELF.endereco := Endereco;
SELF.lista_fones := Lista_fones;
RETURN;
END;
end;
/

CREATE TABLE tb_usuario of tp_usuario(
    cpf PRIMARY KEY
);
/

-- insert 2 users
insert into tb_usuario values(
    tp_usuario('12345678901', 'Joao', tp_usuario_endereco('Rua 1', '12345678', 1), tp_usuario_fones(tp_usuario_fone('12345678901'), tp_usuario_fone('12345678902')))
);
insert into tb_usuario values(
    tp_usuario('12345678902', 'MariA', tp_usuario_endereco('Rua 2', '12345678', 2), tp_usuario_fones(tp_usuario_fone('12345678903'), tp_usuario_fone('12345678904')))
);

-- select cpf and name from users
select cpf, nome from tb_usuario;

create or replace type tp_aula as object(
	num_da_aula int,
    titulo varchar2(300),
    duracao float,
    member function min_convert return float,
    CONSTRUCTOR FUNCTION tp_aula(SELF IN OUT NOCOPY
tp_aula, num_da_aula int, titulo varchar2, duracao float
) RETURN SELF AS RESULT
);
/

create or replace type body tp_aula as
CONSTRUCTOR FUNCTION tp_aula(SELF IN OUT tp_aula, Num_da_aula int, Titulo varchar2, Duracao float
) RETURN SELF AS
RESULT IS BEGIN
SELF.num_da_aula := Num_da_aula;
SELF.titulo := UPPER(Titulo);
SELF.duracao := Duracao;
RETURN;
END;
end;
/