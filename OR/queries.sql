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
select C.valor AS valorDoCurso, DEREF(C.educador).nome AS educador
    from tb_curso C
    WHERE ROWNUM = 1
    order by C.compareByPrice() DESC;

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