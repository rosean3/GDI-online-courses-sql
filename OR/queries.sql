-- verifica se o educador com cpf 01731334917 tem pelo menos um curso vinculado a ele 
SELECT DEREF(REF(e)).nome
FROM tb_educador e
WHERE e.cpf = '01731334917'
AND (
  SELECT COUNT(*)
  FROM (
    SELECT c.educador
    FROM tb_educador e1, tb_curso c
    WHERE e1.cpf = e.cpf
    AND c.educador = REF(e1)
    GROUP BY c.educador
  ) derived_table
) > 0;
/

-- mostrar número, título e duração das aulas associadas ao curso com ID igual a 1 
SELECT a.num_da_aula, a.titulo, a.duracao
FROM tb_curso c, TABLE(c.lista_aulas) a
WHERE c.id = 1;
/

-- mostrar os CPFs e os números de telefone de todos os alunos presentes na tabela tb_aluno
SELECT a.cpf, f.numero
FROM tb_aluno a, TABLE(a.lista_fones) f;
/

-- mostrar o valor do curso mais caro e o seu educador
select * from (select C.valor AS valor_do_curso, DEREF(C.educador).nome AS educador
    from tb_curso C
    order by C.compareByPrice() DESC)
  where rownum = 1;

-- ver o total de horas das aulas do curso 'Curso de Inglês' mais barato
SELECT SUM(T.duracao) FROM TABLE (
    SELECT C.lista_aulas
    	FROM tb_curso C 
    	WHERE C.valor = (select MIN(C.valor)
    						from tb_curso C
    						WHERE C.titulo = 'Curso de Inglês'
    					)
    	AND C.titulo = 'Curso de Inglês'
    	)
    T
    ;

-- mostrar o nome e a lista de telefones do aluno que presenteou o curso mais caro
SELECT DEREF(P.aluno_presenteador).nome AS aluno, DEREF(P.curso).valor AS valor_do_curso, DEREF(P.aluno_presenteador).lista_fones AS lista_fones
    from tb_presentear_curso P
	WHERE P.curso = (
    	SELECT REF(C) FROM tb_curso C
    	WHERE C.valor = (
    		select * from (select C.valor
    						from tb_curso C
    						order by C.compareByPrice() DESC
    						)
    		where rownum = 1
        )
    )
    ;

-- operação parecida com a feita acima, mas nessa o curso é o mais barato e a forma que a operação foi feita é diferente
select a.nome, a.lista_fones, DEREF(P.curso).valor AS valor_do_curso from tb_aluno a, tb_presentear_curso P
	WHERE P.aluno_presenteador = REF(a)
    AND P.curso = (
    	SELECT REF(C) FROM tb_curso C
    	WHERE C.valor = (
    		select * from (select C.valor
    						from tb_curso C
    						order by C.compareByPrice()
    						)
    		where rownum = 1
        )
    );

-- mostrar os títulos das aulas cuja duração é mais longa do que a soma das aulas do curso de id 12
SELECT a.titulo
FROM tb_curso c, TABLE(c.lista_aulas) a
WHERE a.duracao > (
    SELECT SUM(T.duracao) FROM TABLE (
        SELECT c.lista_aulas
        FROM tb_curso c
        WHERE c.id = 12
    )
  T
);

-- mostrar o curso com a menor duração total
select * from (
SELECT c.id, c.titulo, SUM(a.duracao) AS total_duration
FROM tb_curso c, TABLE(c.lista_aulas) a
GROUP BY c.id, c.titulo
ORDER BY SUM(a.duracao))
where rownum =1;


-- retorna o nome do curso e ao lado a duração do curso com base na soma do tempo das aulas em minutos
DECLARE
  v_total_minutos FLOAT;
BEGIN
  FOR c IN (SELECT * FROM tb_curso)
  LOOP
    select SUM(a.min_convert()) into v_total_minutos from table (c.lista_aulas) a;
    
    DBMS_OUTPUT.PUT_LINE(c.titulo || ': ' || v_total_minutos);
  END LOOP;
END;

--Consultar a média de preço dos cursos dos educadores com mais de um telefone

--Funcao para caluclar a media de precos dos curso de um educador
CREATE OR REPLACE FUNCTION get_media_preco(p_cpf IN VARCHAR2)
RETURN NUMBER
IS
    v_media_preco NUMBER;
BEGIN
    SELECT AVG(c.valor) INTO v_media_preco
    FROM tb_curso c
    WHERE DEREF(c.educador).cpf = p_cpf;
    IF v_media_preco IS NULL THEN
        RETURN 0; 
	END IF;
    RETURN v_media_preco;
END;
/
--Procedimento para imprimir as medias de preco dos cursos dos educadores com mais de um telefone
BEGIN
    DECLARE
        v_media_preco NUMBER;
    BEGIN

        FOR rec IN (SELECT E.nome, E.cpf, COUNT(Ef.numero) AS count_numero
                    FROM tb_educador E
                    CROSS JOIN TABLE(E.lista_fones) Ef
                    GROUP BY E.cpf, E.nome
                    HAVING COUNT(Ef.numero) > 1)
        LOOP
    
        	v_media_preco := get_media_preco(rec.cpf);
            DBMS_OUTPUT.PUT_LINE('Nome do Educador: ' || rec.nome || ' | CPF: '|| rec.cpf|| ', Media de Preco dos Cursos: ' || v_media_preco);
        END LOOP;
    END;
END;
/

----acha o curso que tem o minuto mais caro e printa os dados do professor
DECLARE
    professor tp_usuario;
    total_min float;
    minutes_price float;
    max_minutes_price float := -1;
BEGIN
    FOR c IN (SELECT * FROM tb_curso) LOOP
    
        SELECT SUM(a.min_convert()) INTO total_min FROM TABLE (c.lista_aulas) a;

        minutes_price := c.valor/total_min;

        IF minutes_price > max_minutes_price THEN
            max_minutes_price := minutes_price;

			select value(e) into professor from tb_educador e where e.cpf = deref(c.educador).cpf;
        END IF;

    END LOOP;
    
    professor.detail_user;
END;
/

--dados do aluno que mais gastou dinheiro em cursos
declare
	aluno tp_usuario;
begin

    select value(a) into aluno from tb_aluno a where a.cpf = (SELECT deref(efc.aluno_ec).cpf
                                                                FROM tb_efetuar_compra efc
                                                                GROUP BY deref(efc.aluno_ec).cpf
                                                                HAVING SUM(deref(efc.curso_ec).valor) = (
                                                                  SELECT MAX(total)
                                                                  FROM (
                                                                    SELECT SUM(deref(efc2.curso_ec).valor) AS total, deref(efc2.aluno_ec).cpf AS cpf
                                                                    FROM tb_efetuar_compra efc2
                                                                    GROUP BY deref(efc2.aluno_ec).cpf
                                                                  ) subquery
                                                                ));

	aluno.detail_user();
end;


--Consultar os telefones dos administradores que estão administrando pelo menos um curso

DECLARE
    v_lista_fones tp_usuario_fones;

BEGIN
    
    FOR admin IN (SELECT DISTINCT a.cpf, a.nome
                  FROM tb_administrador a
                  INNER JOIN tb_curso c 
                      ON DEREF(c.administrador).cpf = a.cpf) 
	LOOP
        DBMS_OUTPUT.PUT_LINE('Nome: '|| admin.nome ||' | CPF: ' || admin.cpf);
		SELECT lista_fones INTO v_lista_fones FROM tb_administrador where cpf = admin.cpf;
        IF v_lista_fones IS NULL THEN
            DBMS_OUTPUT.PUT_LINE('NULL');
        ELSE
            FOR i IN v_lista_fones.FIRST..v_lista_fones.LAST LOOP
                DBMS_OUTPUT.PUT_LINE('Telefone ' || i || ': ' || v_lista_fones(i).numero);
            END LOOP;
        END IF;
        DBMS_OUTPUT.PUT_LINE('--------------------------------------');
    END LOOP;
END;
/
