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

create or replace type tp_curso FORCE as object( 
    id number, 
	titulo varchar2(300), 
    valor float, 
    descricao varchar2(4000), 
    lista_aulas tp_lista_aulas, 
 
    educador ref tp_educador, -- relacionamento publicar 
    administrador ref tp_administrador, -- relacionamento publicar 
    MAP MEMBER FUNCTION compareByPrice RETURN NUMBER, 
    final member procedure add_aula (num_da_aula int, titulo varchar2, duracao float), 
 	final member procedure remove_aula (num_da_aula int)
);
/

CREATE OR REPLACE TYPE BODY tp_curso AS   
    MAP MEMBER FUNCTION compareByPrice RETURN NUMBER IS     
    BEGIN     
        RETURN valor;     
    END compareByPrice;      
	     
    final member procedure add_aula (num_da_aula int, titulo varchar2, duracao float) is     
     	v_curso tp_curso := self;   
    BEGIN   
        v_curso.lista_aulas.extend();   
        v_curso.lista_aulas(v_curso.lista_aulas.count) := tp_aula(num_da_aula, titulo, duracao);   
        UPDATE tb_curso c SET c.lista_aulas = v_curso.lista_aulas WHERE c.id = v_curso.id;   
    END add_aula; 
 
    final member procedure remove_aula (num_da_aula int) is 
        v_curso tp_curso := self; 
    BEGIN 
        FOR i IN 1..v_curso.lista_aulas.count LOOP 
            IF v_curso.lista_aulas(i).num_da_aula = num_da_aula THEN 
                v_curso.lista_aulas.delete(i); 
                UPDATE tb_curso c SET c.lista_aulas = v_curso.lista_aulas WHERE c.id = v_curso.id;  
                RETURN; 
            END IF; 
        END LOOP; 
    END remove_aula; 
END;  
/

-- DECLARE
--   c tp_curso;
-- BEGIN
--   SELECT value(cu)
--   INTO c
--   FROM tb_curso cu
--   WHERE cu.id = 1;

--   c.remove_aula(6);
-- END;
-- /
-- select a.*
-- FROM tb_curso c, table(c.lista_aulas) a
-- where c.id = 1;
-- /

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