--Mostrar o nome e o CPF dos alunos e a quantidade de cursos comprados por eles, mostrando também os nomes e CPFs dos alunos que não compraram nada.

SELECT U.nome, U.cpf, COUNT(id_curso) AS cursos_comprados
FROM Usuario U
	INNER JOIN Aluno A
		ON U.cpf = A.cpf
	LEFT JOIN Efetuar_Compra EC
		ON A.cpf = EC.cpf_aluno
	LEFT JOIN Curso C
		ON EC.id_curso = C.id
GROUP BY U.nome, U.cpf
ORDER BY cursos_comprados DESC, U.nome;

--Selecionar o nome e o CPF dos educadores que não publicaram nenhum curso

SELECT U.nome, U.cpf
FROM Usuario U
	INNER JOIN Educador E
		ON U.cpf = E.cpf
		LEFT JOIN Curso C
			ON E.cpf = C.cpf_educador
WHERE C.id IS NULL;


--Mostrar a média de duração dos cursos comprados pela aluna 'Sophia'

CREATE OR REPLACE FUNCTION duracao_curso (curso_f Curso.id%TYPE) RETURN NUMBER IS
duracao_c NUMBER;

BEGIN
	SELECT SUM(A.duracao) INTO duracao_c
	FROM Aula A, Curso C
	WHERE A.id_curso = C.id
		AND C.id = curso_f;
    RETURN duracao_c;
END duracao_curso;
/

SELECT U.nome, AVG(duracao_curso(C.id)) AS duracao_media_cursos
FROM Usuario U
	INNER JOIN Aluno A
		ON U.cpf = A.cpf
	INNER JOIN Efetuar_Compra EC
		ON A.cpf = EC.cpf_aluno
    INNER JOIN Curso C
    	ON EC.id_curso = C.id
WHERE U.nome = 'Sophia'
GROUP BY U.nome;
/

--Mostrar os nome dos educadores dos cursos de Direito, 'Direito Criminal' e 'Direito Trabalhista'

--Selecionar os endereços das pessoas cujo nome começa com 'S'

--Procurar pessoas que moram no CEP '42880166'

