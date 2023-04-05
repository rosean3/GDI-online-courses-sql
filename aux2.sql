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
    member procedure detail_user

) not final not INSTANTIABLE;
/

CREATE OR REPLACE TYPE BODY tp_educador AS
    MEMBER PROCEDURE detail_user IS
    BEGIN
        dbms_output.put_line('cpf: ' || self.cpf);
        dbms_output.put_line('nome: ' || self.nome);
        dbms_output.put_line('endereco.complemento: ' || self.endereco.complemento);
        dbms_output.put_line('endereco.cep: ' || self.endereco.cep);
        dbms_output.put_line('endereco.numero: ' || self.endereco.numero);
        
        FOR i IN 1..self.lista_fones.COUNT LOOP
            dbms_output.put_line('lista_fones(' || i || ').numero: ' || self.lista_fones(i).numero);
        END LOOP;
    END detail_user;
END;
/

create or replace type tp_educador under tp_usuario(
    overriding member procedure detail_user
);
/

create or replace type tp_aluno under tp_usuario( 
    overriding member procedure detail_user
);
/

create or replace type tp_administrador under tp_usuario(
    overriding member procedure detail_user
);
/
 
create or replace type tp_aula as object(
	num_da_aula int,
    titulo varchar2(300),
    duracao float,
    member function min_convert return float,
    ORDER MEMBER FUNCTION orderByDuration (X tp_aula) RETURN NUMBER,
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
member function min_convert return float is
    begin
        return duracao * 60;
    end min_convert;
ORDER MEMBER FUNCTION orderByDuration (X tp_aula) RETURN NUMBER IS
    BEGIN
        RETURN SELF.duracao - X.duracao;
    END orderByDuration;
END;
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
    administrador ref tp_administrador, -- relacionamento publicar
    MAP MEMBER FUNCTION compareByPrice RETURN NUMBER,
    member procedure add_aula (num_da_aula int, titulo varchar2, duracao float)

);
/

CREATE OR REPLACE TYPE BODY tp_curso AS
    MAP MEMBER FUNCTION compareByPrice RETURN NUMBER IS
    BEGIN
        RETURN valor;
    END compareByPrice; 
	
    member procedure add_aula (num_da_aula int, titulo varchar2, duracao float) is
    BEGIN
        lista_aulas.extend;
        lista_aulas(lista_aulas.last) := tp_aula(num_da_aula, titulo, duracao);
    END add_aula;
END;
/

create or replace type tp_efetuar_compra as object(
    id_ec int,
    curso_ec ref tp_curso,
    aluno_ec ref tp_aluno,
    data_hora_compra timestamp
);
/

create or replace type tp_assistir as object(
	id_as INT,
    aula_as ref tp_aula,
    aluno_as ref tp_aluno,
    data_hora_assitir timestamp
);
/

create or replace type tp_presentear_curso as object(
    id_pc INT,
    aluno_presenteado ref tp_aluno,
    aluno_presenteador ref tp_aluno,
    curso ref tp_curso
);
/

DROP TABLE tb_presentear_curso;
DROP TABLE tb_assistir;
DROP TABLE tb_efetuar_compra;
DROP TABLE tb_curso;
DROP TABLE tb_administrador;
DROP TABLE tb_aluno;
DROP TABLE tb_educador;

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
    
CREATE TABLE tb_curso OF tp_curso(
    id PRIMARY KEY,
    educador SCOPE IS tb_educador, -- ! adicionei scope is
    administrador SCOPE IS tb_administrador -- ! adicionei scope is
) NESTED TABLE lista_aulas
STORE AS nt_aulas;


CREATE TABLE tb_efetuar_compra of tp_efetuar_compra(
	id_ec PRIMARY KEY,
    aluno_ec WITH ROWID REFERENCES tb_aluno,
	curso_ec WITH ROWID REFERENCES tb_curso
);
/

CREATE TABLE tb_assistir of tp_assistir(
	id_as PRIMARY KEY,
	aluno_as WITH ROWID REFERENCES tb_aluno
    -- aula_as WITH ROWID REFERENCES tp_lista_aulas
    -- tentar referenciar aula de algum jeito
);
/

CREATE TABLE tb_presentear_curso of tp_presentear_curso(
	id_pc PRIMARY KEY,
	aluno_presenteado WITH ROWID REFERENCES tb_aluno,
    aluno_presenteador WITH ROWID REFERENCES tb_aluno,
	curso WITH ROWID REFERENCES tb_curso
);
/

insert into tb_curso values (1, 'Curso de Java', 7000, 'Curso de Java', tp_lista_aulas(tp_aula(1, 'Aula 1', 1.5), tp_aula(2, 'Aula 2', 2.5)), '2020-10-10 10:10:10', null, null);
insert into tb_curso values (2, 'Curso de Python', 200, 'Curso de Python', tp_lista_aulas(tp_aula(1, 'Aula 1', 1.5), tp_aula(2, 'Aula 2', 2.5)), '2020-10-10 10:10:10', null, null);
insert into tb_curso values (3, 'Curso de C#', 300, 'Curso de C#', tp_lista_aulas(tp_aula(1, 'Aula 1', 1.5), tp_aula(2, 'Aula 2', 2.5)), '2020-10-10 10:10:10', null, null);
insert into tb_curso values (4, 'Curso de C++', 3500, 'Curso de C++', tp_lista_aulas(tp_aula(1, 'Aula 1', 1.5), tp_aula(2, 'Aula 2', 2.5)), '2020-10-10 10:10:10', null, null);
insert into tb_curso values (5, 'Curso de C', 500, 'Curso de C', tp_lista_aulas(tp_aula(1, 'Aula 1', 1.5), tp_aula(2, 'Aula 2', 2.5)), '2020-10-10 10:10:10', null, null);


-- compare the first and second aulas of curso with an id of 1 using orderByDuration and print out the one with the lower duration
select lista_aulas(1).orderByDuration(lista_aulas(2)) from tb_curso where id = 1;
-- put this info: SELECT * FROM TABLE (SELECT C.lista_aulas FROM tb_curso C WHERE C.id = 1) T WHERE T.num_da_aula = 1;
-- inside a variable called aula1 in an anonymous block
declare
    aula1 tp_aula;
begin
    select * into aula1 from table (select c.lista_aulas from tb_curso c where c.id = 1) t where t.num_da_aula = 1;
    dbms_output.put_line(aula1.titulo);
end;