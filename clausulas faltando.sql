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


