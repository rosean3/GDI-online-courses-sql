-- Atualizar o valor de um curso específico:
UPDATE Curso 
SET valor = 150.0 WHERE id = 2;

-- Inserir uma nova aula para um determinado curso:
INSERT INTO Aula (id_curso, n_aula, titulo, duracao) 
VALUES (1,4,'Direito criminal avançado', 1.5);

-- Deletar um curso específico:
DELETE FROM Curso 
WHERE ID = 1;

-- Criar um índice no atributo CPF da entidade Usuário:
CREATE INDEX idx_cpf 
ON Usuario(cpf);

-- Alterar o tipo de dados do atributo "Valor" da tabela "Curso" de INTEGER para FLOAT(30.0).
ALTER TABLE Curso
ALTER COLUMN Valor FLOAT(30.0);

-- Criar uma visão para listar os cursos e seus educadores
CREATE VIEW cursos_educadores AS
SELECT c.titulo, e.nome
FROM curso c 
JOIN educador e ON c.cpf_educador = e.cpf

-- Selecionar o aulas de cada curso, filtrando aulas que apenas duram mais de 2.0 horas:
SELECT c.titulo AS "Curso", COUNT(a.duracao) AS "Num_aulas" 
FROM Curso c 
INNER JOIN aula a ON c.id = a.id_curso 
GROUP BY c.titulo
HAVING COUNT(a.duracao) > 2.0;

-- Consulta para listar os educadores e seus cursos, bem como os alunos e seus cursos, ordenados pelo nome do usuário em ordem alfabética
SELECT u.*, c.* 
FROM Usuario u 
LEFT JOIN Educador e ON u.cpf = e.cpf 
LEFT JOIN curso c ON e.cpf = c.cpf_educador 
UNION 
SELECT u.*, c.* 
FROM usuario u

-- Selecionar todos os cursos que possuem aulas com duração maior que a média de duração das aulas de todos os cursos publicados.
SELECT c.Tema/Título
FROM Curso c
WHERE EXISTS (
  SELECT *
  FROM Aula a
  WHERE a.ID_Curso = c.ID
  AND a.Duração > (
    SELECT AVG(a2.Duração)
    FROM Aula a2
    WHERE a2.ID_Curso = c.ID
  )
)

-- Selecionar todos os cursos que foram comprados por alunos que possuem o CPF "123.456.789-10".
SELECT c.titulo
FROM Curso c
WHERE c.id IN (
  SELECT ec.id_urso
  FROM Efetuar_Compra ec
  INNER JOIN Aluno a ON a.CPF = ec.cpf_aluno
  WHERE a.cpf = '23975024887'
)

-- Listar os cursos com valor superior ao valor médio de todos os cursos publicados por um determinado educador.
SELECT c.titulo, c.valor
FROM curso c
WHERE c.valor > ANY (
   SELECT AVG(valor) 
   FROM curso 
   WHERE id_educador = '41653193506'
);

-- Projetar titulos das aulas com maior duração que as aulas do curso 'Direito Trabalhista'
SELECT titulo 
FROM Aula
WHERE duracao > ALL
        (
            SELECT duracao
            FROM Aula a INNER JOIN 
                Curso c a.id_curso = c.id
            WHERE c.titulo = 'Direito Trabalhista'
        )





