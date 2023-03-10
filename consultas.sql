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

--Selecionar o aulas de cada curso, filtrando aulas que apenas duram mais de 2.0 horas

SELECT C.titulo AS "Curso", COUNT(A.duracao) AS "Num_aulas" 
FROM Curso C 
	INNER JOIN Aula A
		ON C.id = A.id_curso 
GROUP BY A.titulo
HAVING COUNT(A.duracao) > 2.0;

--Criar uma visão para listar os cursos e seus educadores e depois atualiza valor de curso

CREATE VIEW cursos_educadores AS
	SELECT C.titulo, U.nome
	FROM Usuario U
		INNER JOIN Educador E
			ON U.cpf = E.cpf
		INNER JOIN Curso C
			ON C.cpf_educador = E.cpf;

SELECT * FROM cursos_educadores;
UPDATE Curso 
SET valor = 150.0 WHERE id = 2;

--Inserir uma nova aula para um determinado curso

INSERT INTO Aula (id_curso, n_aula, titulo, duracao) 
VALUES (1,4,'Direito criminal avançado', 1.5);

--Deletar um curso específico

DELETE FROM Curso 
WHERE ID = 1;

--Criar um índice no atributo CPF da entidade Usuário

CREATE INDEX idx_cpf 
ON Usuario(cpf);

--Alterar o tipo de dados do atributo "Valor" da tabela "Curso" de INTEGER para FLOAT(30.0)

ALTER TABLE Curso
ALTER COLUMN Valor FLOAT(30.0);

--Selecionar todos os cursos que possuem aulas com duração maior que a média de duração das aulas de todos os cursos publicados

SELECT C.Titulo
FROM Curso C
WHERE EXISTS (
  SELECT *
  FROM Aula A
  WHERE A.id_curso = c.id
      AND a.duracao > (
        SELECT AVG(A2.duracao)
        FROM Aula A2
        WHERE A2.id_curso = C.id
 	 )
);

--Selecionar todos os cursos que foram comprados por alunos que possuem o CPF "123.456.789-10"

SELECT C.titulo
FROM Curso c
WHERE C.id IN (
  SELECT EC.id_curso
  FROM Efetuar_Compra EC
  	INNER JOIN Aluno A 
    	ON A.cpf = EC.cpf_aluno
  WHERE A.cpf = '23975024887'
);

--Listar os cursos com valor superior ao valor médio de todos os cursos publicados por um determinado educador

SELECT C.titulo, C.valor
FROM Curso C
WHERE C.valor > ANY (
   SELECT AVG(valor) 
   FROM Curso 
   WHERE cpf_educador = '41653193506'
);

--Projetar titulos das aulas com maior duração que as aulas do curso 'Direito Trabalhista'

SELECT titulo 
FROM Aula
WHERE duracao > ALL (
    SELECT duracao
    FROM Aula A 
        INNER JOIN Curso C 
        	ON A.id_curso = C.id
    WHERE C.titulo = 'Direito Trabalhista'
);

--Mostrar os nome dos educadores dos cursos de Direito, 'Direito Criminal' e 'Lógica II

SELECT U.nome, C.titulo AS Titulo_Curso
FROM Usuario U
    INNER JOIN Educador E
    	ON U.cpf = E.cpf
	INNER JOIN Curso C 
    	ON E.cpf = C.cpf_educador 
WHERE C.titulo IN ('Direito Criminal', 'Lógica II');

--Selecionar os cursos mais caros comprados pelos alunos cujo nome começa com 'S'

SELECT U.nome, C.titulo, C.valor
FROM Usuario U
	INNER JOIN Aluno A
        ON U.cpf = A.cpf
	INNER JOIN Efetuar_Compra EC
        ON A.cpf = EC.cpf_aluno
	INNER JOIN Curso C
        ON EC.id_curso = C.id
WHERE U.nome LIKE 'S%'
AND C.valor = (
SELECT MAX(C2.valor)
	FROM Efetuar_Compra EC2
	INNER JOIN Curso C2 
		ON EC2.id_curso = C2.id
	WHERE EC2.cpf_aluno = EC.cpf_aluno
);

--Selecionar os cursos mais baratos validados pelos administradores. Mostrando apenas aqueles administradores com cursos validados

SELECT U.nome, C.titulo, C.valor
FROM Usuario U
	INNER JOIN Administrador A
        ON U.cpf = A.cpf
	INNER JOIN Curso C
        ON A.cpf = C.cpf_administrador
WHERE C.valor = (
SELECT MIN(C2.valor)
FROM Curso C2
WHERE C2.cpf_administrador = A.cpf
);

--Procurar pessoas que moram no CEP '42880166'
DECLARE
    
	CURSOR c_cep IS
    	SELECT U.nome
    	FROM Endereco E
    		INNER JOIN Usuario U
    			ON E.cpf_usuario = U.cpf
    	WHERE E.cep = '42880166';

	user_c c_cep%ROWTYPE;

    BEGIN
    	OPEN c_cep;
    
    	LOOP
    		FETCH c_cep INTO user_c;
    		EXIT WHEN c_cep%NOTFOUND;
    		DBMS_OUTPUT.PUT_LINE('Usuario:'||user_c.nome);
        END LOOP;
    	CLOSE c_cep;
    END;
/

--A partir do CPF do usuario, dizer se ele tem um, mais de um ou nenhum telefone registrado

DECLARE
  v_cpf Usuario.cpf%TYPE := '12812287454';
  v_qtde NUMBER := 0;
  CURSOR c_telefones IS 
      SELECT T.telefone 
      FROM Usuario U
      	INNER JOIN Telefone T
      		ON U.cpf = T.cpf_usuario
      WHERE U.cpf = v_cpf;

  v_telefone c_telefones%ROWTYPE;
BEGIN
  OPEN c_telefones;

  FETCH c_telefones INTO v_telefone;

  WHILE c_telefones%FOUND LOOP
    v_qtde := v_qtde + 1;
    FETCH c_telefones INTO v_telefone;
  END LOOP;

  CLOSE c_telefones;

  CASE v_qtde
    WHEN 0 THEN
      DBMS_OUTPUT.PUT_LINE('Usuário ' || v_cpf || ' não possui telefones registrados.');
    WHEN 1 THEN
      DBMS_OUTPUT.PUT_LINE('Usuário ' || v_cpf || ' possui 1 telefone registrado.');
    ELSE
      DBMS_OUTPUT.PUT_LINE('Usuário ' || v_cpf || ' possui ' || v_qtde || ' telefones registrados.');
  END CASE;
END;

--Criar um procedimento que recebe três CEPs, cria uma tabela virtual com esses valores e imprime-os. Recebe os valores em um bloco anônimo e levanta uma exceção caso algum valor seja nulo

CREATE OR REPLACE PROCEDURE criar_tabela_virtual(p_valor1 IN Endereco.cep%TYPE, p_valor2 IN Endereco.cep%TYPE, p_valor3 IN Endereco.cep%TYPE) AS
  TYPE TabelaVirtual IS TABLE OF Endereco.cep%TYPE INDEX BY BINARY_INTEGER;
  v_tabela TabelaVirtual;
BEGIN
  IF p_valor1 IS NULL OR p_valor2 IS NULL OR p_valor3 IS NULL THEN
    RAISE_APPLICATION_ERROR(-20001, 'Os valores devem ser preenchidos.');
  END IF;

  v_tabela(1) := p_valor1;
  v_tabela(2) := p_valor2;
  v_tabela(3) := p_valor3;

  FOR i IN 1..v_tabela.COUNT LOOP
    DBMS_OUTPUT.PUT_LINE('Valor ' || i || ': ' || v_tabela(i));
  END LOOP;
END;
/

DECLARE
  v_valor1 Endereco.cep%TYPE;
  v_valor2 Endereco.cep%TYPE;
  v_valor3 Endereco.cep%TYPE;
BEGIN
  v_valor1 := '63068411';
  v_valor2 := '65572473';
  v_valor3 := NULL;

  criar_tabela_virtual(v_valor1, v_valor2, v_valor3);
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLCODE || ' - ' || SQLERRM);
END;
/

