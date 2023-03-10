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




