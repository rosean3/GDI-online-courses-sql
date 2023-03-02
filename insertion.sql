--sequences

CREATE SEQUENCE endereco_seq START WITH 1 INCREMENT BY 1;

CREATE TABLE Endereco (
   id INT DEFAULT NEXTVAL('endereco_seq') PRIMARY KEY,
   cep CHAR(8) NOT NULL,
   cpf_usuario CHAR(11) NOT NULL,
   numero INT NOT NULL,
   complemento VARCHAR(100),
   FOREIGN KEY(cpf_usuario) REFERENCES Usuario(cpf)
);




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


--enderecos
63068411050 62519332247 17654430590 12812287454 42880166810 06445112650 23975024887 51581412312 25729844409 72586163818 41653193506 65572473286 54124521596 24868152106 01374545384 24868992106 01374995384
INSERT INTO Endereco VALUES (63068411050, '12345678901', 10, NULL);
INSERT INTO Endereco VALUES (62519332247, '67890123456', 160, 'Fundos');
INSERT INTO Endereco VALUES (17654430590, '23456789012', 20, 'Bloco A, Apt 101');
INSERT INTO Endereco VALUES (12812287454, '34567890123', 30, 'Casa 2');
INSERT INTO Endereco VALUES (42880166810, '45678901234', 40, 'Sala 1001');
INSERT INTO Endereco VALUES (06445112650, '56789012345', 50, 'Loja 3, Piso 2');
INSERT INTO Endereco VALUES (23975024887, '67890123456', 60, NULL);
INSERT INTO Endereco VALUES (51581412312, '78901234567', 70, 'Fundo');
INSERT INTO Endereco VALUES (25729844409, '89012345678', 80, 'Lado direito');
INSERT INTO Endereco VALUES (72586163818, '90123456789', 90, NULL);
INSERT INTO Endereco VALUES (41653193506, '01234567890', 100, 'Casa 5');
INSERT INTO Endereco VALUES (65572473286, '12345678901', 110, NULL);
INSERT INTO Endereco VALUES (54124521596, '23456789012', 120, 'Apartamento 401');
INSERT INTO Endereco VALUES (24868152106, '78901234567', 170, NULL);
INSERT INTO Endereco VALUES (01374545384, '34567890123', 130, 'Bloco B, Apt 201');
INSERT INTO Endereco VALUES (24868992106, '45678901234', 140, 'Sala 202');
INSERT INTO Endereco VALUES (01374995384, '56789012345', 150, NULL);

--telefones
INSERT INTO Telefone (cpf_usuario, telefone) VALUES (63068411050, '11111111111');
INSERT INTO Telefone (cpf_usuario, telefone) VALUES (62519332247, '22222222222');
INSERT INTO Telefone (cpf_usuario, telefone) VALUES (17654430590, '33333333333');
INSERT INTO Telefone (cpf_usuario, telefone) VALUES (12812287454, '44444444444');
INSERT INTO Telefone (cpf_usuario, telefone) VALUES (42880166810, '55555555555');
INSERT INTO Telefone (cpf_usuario, telefone) VALUES (06445112650, '66666666666');
INSERT INTO Telefone (cpf_usuario, telefone) VALUES (23975024887, '77777777777');
INSERT INTO Telefone (cpf_usuario, telefone) VALUES (51581412312, '88888888888');
INSERT INTO Telefone (cpf_usuario, telefone) VALUES (25729844409, '99999999999');
INSERT INTO Telefone (cpf_usuario, telefone) VALUES (72586163818, '10101010101');
INSERT INTO Telefone (cpf_usuario, telefone) VALUES (41653193506, '12121212121');
INSERT INTO Telefone (cpf_usuario, telefone) VALUES (65572473286, '13131313131');
INSERT INTO Telefone (cpf_usuario, telefone) VALUES (54124521596, '14141414141');
INSERT INTO Telefone (cpf_usuario, telefone) VALUES (24868152106, '15151515151');
INSERT INTO Telefone (cpf_usuario, telefone) VALUES (01374545384, '16161616161');
INSERT INTO Telefone (cpf_usuario, telefone) VALUES (24868992106, '17171717171');
INSERT INTO Telefone (cpf_usuario, telefone) VALUES (01374995384, '18181818181');

--aulas
-- Curso 1: Direito Criminal
INSERT INTO Aula (id_curso, n_aula, titulo, duracao) VALUES (1, 1, 'Conceitos básicos de Direito Penal', 2.5);
INSERT INTO Aula (id_curso, n_aula, titulo, duracao) VALUES (1, 2, 'Crimes contra a pessoa', 3.0);
INSERT INTO Aula (id_curso, n_aula, titulo, duracao) VALUES (1, 3, 'Crimes contra o patrimônio', 4.5);

-- Curso 2: Direito Trabalhista
INSERT INTO Aula (id_curso, n_aula, titulo, duracao) VALUES (2, 1, 'Introdução ao Direito do Trabalho', 2.5);
INSERT INTO Aula (id_curso, n_aula, titulo, duracao) VALUES (2, 2, 'Contratos de trabalho', 3.0);
INSERT INTO Aula (id_curso, n_aula, titulo, duracao) VALUES (2, 3, 'Rescisão do contrato de trabalho', 4.5);

-- Curso 3: Matemática x Excel
INSERT INTO Aula (id_curso, n_aula, titulo, duracao) VALUES (3, 1, 'Funções matemáticas no Excel', 2.5);
INSERT INTO Aula (id_curso, n_aula, titulo, duracao) VALUES (3, 2, 'Gráficos e tabelas no Excel', 3.0);
INSERT INTO Aula (id_curso, n_aula, titulo, duracao) VALUES (3, 3, 'Fórmulas e equações no Excel', 4.5);

-- Curso 4: Python, do básico ao avançado
INSERT INTO Aula (id_curso, n_aula, titulo, duracao) VALUES (4, 1, 'Introdução ao Python', 2.5);
INSERT INTO Aula (id_curso, n_aula, titulo, duracao) VALUES (4, 2, 'Estruturas de dados em Python', 3.0);
INSERT INTO Aula (id_curso, n_aula, titulo, duracao) VALUES (4, 3, 'Programação orientada a objetos em Python', 4.5);

-- Curso 5: C# intermediário
INSERT INTO Aula (id_curso, n_aula, titulo, duracao) VALUES (5, 1, 'Classes e objetos em C#', 2.5);
INSERT INTO Aula (id_curso, n_aula, titulo, duracao) VALUES (5, 2, 'Herança e polimorfismo em C#', 3.0);
INSERT INTO Aula (id_curso, n_aula, titulo, duracao) VALUES (5, 3, 'Manipulação de arquivos em C#', 4.5);

-- Curso 6: Contabilidade por Estevão Ferreira
INSERT INTO Aula VALUES (6, 1, 'Introdução à contabilidade', 1.5);
INSERT INTO Aula VALUES (6, 2, 'Lançamentos contábeis', 2.0);
INSERT INTO Aula VALUES (6, 3, 'Demonstrações contábeis', 3.0);

-- Curso 7: Lógica II
INSERT INTO Aula VALUES (7, 1, 'Conceitos básicos de lógica', 1.0);
INSERT INTO Aula VALUES (7, 2, 'Lógica proposicional', 2.5);
INSERT INTO Aula VALUES (7, 3, 'Lógica de predicados', 2.5);

-- Efetuar_compra
-- Compra 1
INSERT INTO Efetuar_compra (id_curso, cpf_aluno, data_hora)
VALUES (1, '63068411050', '2022-02-28 10:00:00');

-- Compra 2
INSERT INTO Efetuar_compra (id_curso, cpf_aluno, data_hora)
VALUES (2, '62519332247', '2022-02-28 10:30:00');

-- Compra 3
INSERT INTO Efetuar_compra (id_curso, cpf_aluno, data_hora)
VALUES (3, '17654430590', '2022-02-28 11:00:00');

-- Compra 4
INSERT INTO Efetuar_compra (id_curso, cpf_aluno, data_hora)
VALUES (4, '12812287454', '2022-02-28 11:30:00');

-- Compra 5
INSERT INTO Efetuar_compra (id_curso, cpf_aluno, data_hora)
VALUES (5, '42880166810', '2022-02-28 12:00:00');

-- Compra 6
INSERT INTO Efetuar_compra (id_curso, cpf_aluno, data_hora)
VALUES (6, '06445112650', '2022-02-28 12:30:00');

-- Compra 7
INSERT INTO Efetuar_compra (id_curso, cpf_aluno, data_hora)
VALUES (1, '23975024887', '2022-02-28 13:00:00');

-- Compra 8
INSERT INTO Efetuar_compra (id_curso, cpf_aluno, data_hora)
VALUES (2, '51581412312', '2022-02-28 13:30:00');

-- Compra 9
INSERT INTO Efetuar_compra (id_curso, cpf_aluno, data_hora)
VALUES (3, '25729844409', '2022-02-28 14:00:00');

-- Compra 10
INSERT INTO Efetuar_compra (id_curso, cpf_aluno, data_hora)
VALUES (4, '72586163818', '2022-02-28 14:30:00');

-- Compra 11
INSERT INTO Efetuar_compra (id_curso, cpf_aluno, data_hora)
VALUES (5, '41653193506', '2022-02-28 15:00:00');

-- Compra 12
INSERT INTO Efetuar_compra (id_curso, cpf_aluno, data_hora)
VALUES (6, '65572473286', '2022-02-28 15:30:00');

-- Compra 13
INSERT INTO Efetuar_compra (id_curso, cpf_aluno, data_hora)
VALUES (1, '54124521596', '2022-02-28 16:00:00');

-- Compra 14
INSERT INTO Efetuar_compra (id_curso, cpf_aluno, data_hora)
VALUES (2, '24868152106', '2022-02-28 16:30:00');

-- Compra 15
INSERT INTO Efetuar_compra (id_curso, cpf_aluno, data_hora)
VALUES (3, '01374545384', '2022-02-28 17:00:00');

INSERT INTO Efetuar_compra (id_curso, cpf_aluno, data_hora)
VALUES (7, '24868992106', '2022-01-05 09:35:00');

INSERT INTO Efetuar_compra (id_curso, cpf_aluno, data_hora)
VALUES (7, '54124521596', '2022-02-10 13:20:00');

--assistir
-- assiste aula 1 do curso 1
INSERT INTO Assistir (data_hora, id_curso, n_aula, cpf_aluno)
VALUES ('2023-02-27 09:10:00', 1, 1, '41653193506');

-- assiste aula 2 do curso 1
INSERT INTO Assistir (data_hora, id_curso, n_aula, cpf_aluno)
VALUES ('2023-02-27 09:50:00', 1, 2, '06445112650');

-- assiste aula 3 do curso 1
INSERT INTO Assistir (data_hora, id_curso, n_aula, cpf_aluno)
VALUES ('2023-02-27 10:30:00', 1, 3, '23975024887');

-- assiste aula 1 do curso 2
INSERT INTO Assistir (data_hora, id_curso, n_aula, cpf_aluno)
VALUES ('2023-02-28 14:10:00', 2, 1, '25729844409');

-- assiste aula 2 do curso 2
INSERT INTO Assistir (data_hora, id_curso, n_aula, cpf_aluno)
VALUES ('2023-02-28 15:00:00', 2, 2, '72586163818');

-- assiste aula 3 do curso 2
INSERT INTO Assistir (data_hora, id_curso, n_aula, cpf_aluno)
VALUES ('2023-02-28 16:00:00', 2, 3, '24868152106');

-- assiste aula 1 do curso 3
INSERT INTO Assistir (data_hora, id_curso, n_aula, cpf_aluno)
VALUES ('2023-03-01 09:00:00', 3, 1, '01374995384');

-- assiste aula 2 do curso 3
INSERT INTO Assistir (data_hora, id_curso, n_aula, cpf_aluno)
VALUES ('2023-03-01 10:00:00', 3, 2, '51581412312');

-- assiste aula 3 do curso 3
INSERT INTO Assistir (data_hora, id_curso, n_aula, cpf_aluno)
VALUES ('2023-03-01 11:00:00', 3, 3, '24868992106');

-- assiste aula 1 do curso 4
INSERT INTO Assistir (data_hora, id_curso, n_aula, cpf_aluno)
VALUES ('2023-03-02 13:30:00', 4, 1, '41653193506');

--Presetear
INSERT INTO Presentear VALUES ('63068411050', '62519332247', 1);
INSERT INTO Presentear VALUES ('12812287454', '51581412312', 2);
INSERT INTO Presentear VALUES ('25729844409', '17654430590', 3);
INSERT INTO Presentear VALUES ('72586163818', '23975024887', 4);
INSERT INTO Presentear VALUES ('51581412312', '06445112650', 5);
INSERT INTO Presentear VALUES ('23975024887', '12812287454', 6);
INSERT INTO Presentear VALUES ('42880166810', '72586163818', 1);
INSERT INTO Presentear VALUES ('63068411050', '17654430590', 2);
INSERT INTO Presentear VALUES ('51581412312', '25729844409', 3);
INSERT INTO Presentear VALUES ('72586163818', '63068411050', 4);

--testes
SELECT COUNT(u.nome) FROM Usuario u
JOIN Aluno aln ON aln.cpf = u.cpf 

select * from Curso


