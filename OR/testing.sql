-- ! MAP MEMBER FUNCTION
-- insert 5 elements into tb_curso
insert into tb_curso values (1, 'Curso de Java', 7000, 'Curso de Java', tp_lista_aulas(tp_aula(1, 'Aula 1', 1.5), tp_aula(2, 'Aula 2', 2.5)), '2020-10-10 10:10:10', null, null);
insert into tb_curso values (2, 'Curso de Python', 200, 'Curso de Python', tp_lista_aulas(tp_aula(1, 'Aula 1', 1.5), tp_aula(2, 'Aula 2', 2.5)), '2020-10-10 10:10:10', null, null);
insert into tb_curso values (3, 'Curso de C#', 300, 'Curso de C#', tp_lista_aulas(tp_aula(1, 'Aula 1', 1.5), tp_aula(2, 'Aula 2', 2.5)), '2020-10-10 10:10:10', null, null);
insert into tb_curso values (4, 'Curso de C++', 3500, 'Curso de C++', tp_lista_aulas(tp_aula(1, 'Aula 1', 1.5), tp_aula(2, 'Aula 2', 2.5)), '2020-10-10 10:10:10', null, null);
insert into tb_curso values (5, 'Curso de C', 500, 'Curso de C', tp_lista_aulas(tp_aula(1, 'Aula 1', 1.5), tp_aula(2, 'Aula 2', 2.5)), '2020-10-10 10:10:10', null, null);

-- select from tb_curso and order with the map function
select C.id, C.valor from tb_curso C order by C.compareByPrice();
select C.id, C.valor from tb_curso C order by C.compareByPrice() DESC;

-- ! CONSTRUTOR DE AULA
-- insert 5 elements into tb_curso
insert into tb_curso values (1, 'Curso de Java', 7000, 'Curso de Java', tp_lista_aulas(tp_aula(1, 'Aula 1', 1.5), tp_aula(2, 'Aula 2', 2.5)), '2020-10-10 10:10:10', null, null);
insert into tb_curso values (2, 'Curso de Python', 200, 'Curso de Python', tp_lista_aulas(tp_aula(1, 'Aula 1', 1.5), tp_aula(2, 'Aula 2', 2.5)), '2020-10-10 10:10:10', null, null);
insert into tb_curso values (3, 'Curso de C#', 300, 'Curso de C#', tp_lista_aulas(tp_aula(1, 'Aula 1', 1.5), tp_aula(2, 'Aula 2', 2.5)), '2020-10-10 10:10:10', null, null);
insert into tb_curso values (4, 'Curso de C++', 3500, 'Curso de C++', tp_lista_aulas(tp_aula(1, 'Aula 1', 1.5), tp_aula(2, 'Aula 2', 2.5)), '2020-10-10 10:10:10', null, null);
insert into tb_curso values (5, 'Curso de C', 500, 'Curso de C', tp_lista_aulas(tp_aula(1, 'Aula 1', 1.5), tp_aula(2, 'Aula 2', 2.5)), '2020-10-10 10:10:10', null, null);

-- select title from aula => it's all uppercase!
SELECT T.titulo FROM TABLE (SELECT C.lista_aulas FROM tb_curso C WHERE C.id = 1) T;
/

-- ! ORDER FUNCTION
declare
	aula1 tp_aula;
    aula2 tp_aula;
    result INTEGER;
     
begin
	aula1 := tp_aula(1, 'Aula 1', 1.5);
  	aula2 := tp_aula(1, 'Aula 1', 2.5);
	result := aula1.orderByDuration(aula2);
	DBMS_OUTPUT.PUT_LINE('Comparison result: ' || result);
end;

-- ! MEMBER FUNCTION

--create a non existing table for testing purposes
create table tb_aula of tp_aula;

--insert a single element
insert into tb_aula values (
    2,
    'olha a gordurinha',
    4.5
);

--PL block for testing the member function
declare
    a tp_aula;
	num float;
begin
    select value(d) into a from tb_aula d where d.duracao = 4.5;
	dbms_output.put_line(a.min_convert); -- expected = 270
end;

-- ! MEMBER PROCEDURE

--insert one element into tb_curso
insert into tb_curso values (1, 'Curso de Java', 100, 'Curso de Java', tp_lista_aulas(tp_aula(1, 'Aula 1', 1.5), tp_aula(2, 'Aula 2', 2.5)), '2020-10-10 10:10:10', null, null);

DECLARE
    c tp_curso;
BEGIN
    
    select value(d) into c from tb_curso d where d.id = 1;
    
    -- add new tp_aula instances to the lista_aulas nested table
    c.add_aula(3, 'aula 3', 3.5);
    c.add_aula(4, 'aula 4', 7.5);
    
    -- update the tb_curso table with the modified curso object instance
    update tb_curso a set a = c where a.id = 1;
END;

DECLARE
    c tp_curso;
BEGIN
     -- select the curso object instance into the c variable
    select value(d) into c from tb_curso d where d.id = 1;

    --loop for testing the member procedure -> prints every element of the nested table
    FOR i IN c.lista_aulas.FIRST .. c.lista_aulas.LAST LOOP
            dbms_output.put_line('Aula ' || i || ': ' || c.lista_aulas(i).titulo);
    END LOOP;
END;

-- ! OVERRIDING MEMBER PROCEDURE pt2

--insert one element into tb_educador (it's also possible with tb_aluno)
INSERT INTO tb_educador VALUES (
    '12345678901', 
    'John Doe', 
    tp_usuario_endereco('Apt 123', '12345678', 123), 
    tp_usuario_fones(tp_usuario_fone('123456789'), tp_usuario_fone('987654321'))
);

-- PL block for testing the overriding member procedure
DECLARE
    u tp_usuario;
BEGIN
    select value(d) into u from tb_educador d where d.cpf = '12345678901';
    u.detail_user;
END;
/

--checar numeros de telefone de um usuario:

DECLARE
    a tp_aluno;
BEGIN
     -- select the curso object instance into the c variable
    select value(d) into a from tb_aluno d where d.cpf = '66402019823';

    --loop for testing the member procedure -> prints every element of the nested table
    FOR i IN a.lista_fones.FIRST .. a.lista_fones.LAST LOOP
            dbms_output.put_line('Fone ' || i || ': ' || a.lista_fones(i).numero);
    END LOOP;
END;
/


-- ! VALUE + FINAL
