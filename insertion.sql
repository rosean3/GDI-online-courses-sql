--inserção

--usuarios
INSERT INTO Usuario
VALUES (63068411050, 'Alfredo');
INSERT INTO Usuario
VALUES (62519332247, 'Laís ');
INSERT INTO Usuario
VALUES (17654430590, 'Lorenzo');
INSERT INTO Usuario
VALUES (12812287454, 'Luiz');
INSERT INTO Usuario
VALUES (42880166810, 'Erick');
INSERT INTO Usuario
VALUES (06445112650, 'Sophia');
INSERT INTO Usuario
VALUES (23975024887, 'Vitor');
INSERT INTO Usuario
VALUES (51581412312, 'Sabrina');
INSERT INTO Usuario
VALUES (25729844409, 'Alexandre');
INSERT INTO Usuario
VALUES (72586163818, 'Emilly');
INSERT INTO Usuario
VALUES (41653193506, 'Luiz');
INSERT INTO Usuario
VALUES (65572473286, 'Sophia');
INSERT INTO Usuario
VALUES (54124521596, 'Helena');
INSERT INTO Usuario
VALUES (24868152106, 'Felipe');
INSERT INTO Usuario
VALUES (01374545384, 'Pedro');
INSERT INTO Usuario
VALUES (24868992106, 'Eduardo');
INSERT INTO Usuario
VALUES (01374995384, 'Vicente');


--admin
INSERT INTO Administrador
VALUES (01374995384);
INSERT INTO Administrador
VALUES (24868992106);

--educadores
INSERT INTO Educador
VALUES (41653193506);
INSERT INTO Educador
VALUES (65572473286);
INSERT INTO Educador
VALUES (54124521596);
INSERT INTO Educador
VALUES (24868152106);
INSERT INTO Educador
VALUES (01374545384);

--alunos
INSERT INTO Aluno
VALUES (63068411050);
INSERT INTO Aluno
VALUES (62519332247);
INSERT INTO Aluno
VALUES (17654430590);
INSERT INTO Aluno
VALUES (12812287454);
INSERT INTO Aluno
VALUES (42880166810);
INSERT INTO Aluno
VALUES (06445112650);
INSERT INTO Aluno
VALUES (23975024887);
INSERT INTO Aluno
VALUES (51581412312);
INSERT INTO Aluno
VALUES (25729844409);
INSERT INTO Aluno
VALUES (72586163818);

--cursos
INSERT INTO Curso
VALUES (1, 'Direito Criminal', 12.5, 'Um bom curso de direito criminal', 8.5, 41653193506, 01374995384);
INSERT INTO Curso
VALUES (2, 'Direito Trabalhista', 34.5, 'Um ótimo curso de direito trabalhista', 7.9, 41653193506, 24868992106);
INSERT INTO Curso
VALUES (3, 'Matémática x Excel', 19.5, 'Matematica aplicada a excel com excelência', 5.5, 65572473286, 01374995384);
INSERT INTO Curso
VALUES (4, 'Python, do básico ao avançado', 46.5, 'Python para concursos', 9.5, 01374545384, 01374995384);
INSERT INTO Curso
VALUES (5, 'C# intemediário', 78.9, 'C# para concursos nordestinos', 6.7, 01374545384, 24868992106);
INSERT INTO Curso
VALUES (6, 'Contabilidade por Estevão Ferreira', 12.3, 'Aprenda contabilidade com o melhor', 15.9, 24868152106, 24868992106);
INSERT INTO Curso
VALUES (7, 'Lógica II', 15.99, 'Lógica Aristotélica para concursos federais', 12.6, 54124521596, 24868992106);


--testes
SELECT COUNT(u.nome) FROM Usuario u
JOIN Aluno aln ON aln.cpf = u.cpf 

select * from Curso


