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