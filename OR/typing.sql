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


create or replace type tp_educador under tp_usuario(
    overriding member procedure detail_user
);
/

CREATE OR REPLACE TYPE BODY tp_educador AS
    OVERRIDING MEMBER PROCEDURE detail_user IS
    BEGIN
        dbms_output.put_line('cpf: ' || self.cpf);
        dbms_output.put_line('nome: ' || self.nome);
        dbms_output.put_line('=============================================');
        dbms_output.put_line('Endereço:');
        dbms_output.put_line('complemento: ' || self.endereco.complemento);
        dbms_output.put_line('cep: ' || self.endereco.cep);
        dbms_output.put_line('numero: ' || self.endereco.numero);
        dbms_output.put_line('==============================================');
        dbms_output.put_line('Telefones:');
        FOR i IN 1..self.lista_fones.COUNT LOOP
            dbms_output.put_line(i || '° numero: ' || self.lista_fones(i).numero);
        END LOOP;
    END detail_user;
END;
/

create or replace type tp_aluno under tp_usuario( 
    overriding member procedure detail_user
);
/

CREATE OR REPLACE TYPE BODY tp_aluno AS
    OVERRIDING MEMBER PROCEDURE detail_user IS
    BEGIN
        dbms_output.put_line('cpf: ' || self.cpf);
        dbms_output.put_line('nome: ' || self.nome);
        dbms_output.put_line('=============================================');
        dbms_output.put_line('Endereço:');
        dbms_output.put_line('complemento: ' || self.endereco.complemento);
        dbms_output.put_line('cep: ' || self.endereco.cep);
        dbms_output.put_line('numero: ' || self.endereco.numero);
        dbms_output.put_line('==============================================');
        dbms_output.put_line('Telefones:');
        FOR i IN 1..self.lista_fones.COUNT LOOP
            dbms_output.put_line(i || '° numero: ' || self.lista_fones(i).numero);
        END LOOP;
    END detail_user;
END;
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
ORDER MEMBER FUNCTION orderByDuration (X tp_aula) RETURN NUMBER IS -- novo
    BEGIN
        RETURN SELF.duracao - X.duracao;
    END orderByDuration;
END;
/

ALTER TYPE tp_aula
MODIFY ATTRIBUTE titulo varchar2(1000) CASCADE;
/

create or replace type tp_lista_aulas as table of tp_aula;
/

create or replace type tp_curso as object(
    id number,
	titulo varchar2(300),
    valor float,
    descricao varchar2(4000),
    lista_aulas tp_lista_aulas,
    data_hora_publicacao varchar2(20), -- relacionamento publicar
    educador ref tp_educador, -- relacionamento publicar
    administrador ref tp_administrador, -- relacionamento publicar
    FINAL MAP MEMBER FUNCTION compareByPrice RETURN NUMBER,
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