--usuarios
INSERT INTO Usuario
VALUES ('63068411050', 'Alfredo');
INSERT INTO Usuario
VALUES ('62519332247', 'Laís');
INSERT INTO Usuario
VALUES ('17654430590', 'Lorenzo');
INSERT INTO Usuario
VALUES ('12812287454', 'Luiz');
INSERT INTO Usuario
VALUES ('42880166810', 'Erick');
INSERT INTO Usuario
VALUES ('06445112650', 'Sophia');
INSERT INTO Usuario
VALUES ('23975024887', 'Vitor');
INSERT INTO Usuario
VALUES ('51581412312', 'Sabrina');
INSERT INTO Usuario
VALUES ('25729844409', 'Alexandre');
INSERT INTO Usuario
VALUES ('72586163818', 'Emilly');
INSERT INTO Usuario
VALUES ('19112162254', 'Silvana');
INSERT INTO Usuario
VALUES ('41653193506', 'Luís');
INSERT INTO Usuario
VALUES ('65572473286', 'Sophia');
INSERT INTO Usuario
VALUES ('54124521596', 'Helena');
INSERT INTO Usuario
VALUES ('24868152106', 'Felipe');
INSERT INTO Usuario
VALUES ('01374545384', 'Pedro');
INSERT INTO Usuario
VALUES ('39900055015', 'Hugo');
INSERT INTO Usuario
VALUES ('55262703730', 'Josué');
INSERT INTO Usuario
VALUES ('16022208982', 'Mário');
INSERT INTO Usuario
VALUES ('24868992106', 'Eduardo');
INSERT INTO Usuario
VALUES ('01374995384', 'Vicente');
INSERT INTO Usuario
VALUES ('94157780488', 'Gabriela');






--admin
INSERT INTO Administrador
VALUES ('01374995384');
INSERT INTO Administrador
VALUES ('24868992106');
INSERT INTO Administrador --admin que não validou nenhum curso
VALUES ('94157780488');

--educadores
INSERT INTO Educador
VALUES ('41653193506');
INSERT INTO Educador
VALUES ('65572473286');
INSERT INTO Educador
VALUES ('54124521596');
INSERT INTO Educador
VALUES ('24868152106');
INSERT INTO Educador
VALUES ('01374545384');
INSERT INTO Educador
VALUES ('39900055015');
 --educador sem curso
INSERT INTO Educador
VALUES ('55262703730');
 --educador sem curso
INSERT INTO Educador
VALUES ('16022208982');

--alunos
INSERT INTO Aluno
VALUES ('63068411050');
INSERT INTO Aluno
VALUES ('62519332247');
INSERT INTO Aluno
VALUES ('17654430590');
INSERT INTO Aluno
VALUES ('12812287454');
INSERT INTO Aluno
VALUES ('42880166810');
INSERT INTO Aluno
VALUES ('06445112650');
INSERT INTO Aluno
VALUES ('23975024887');
INSERT INTO Aluno
VALUES ('51581412312');
INSERT INTO Aluno
VALUES ('25729844409');
INSERT INTO Aluno
VALUES ('72586163818');
INSERT INTO Aluno
VALUES ('19112162254');

--cursos
INSERT INTO Curso
VALUES (curso_seq.NEXTVAL, 'Direito Criminal', 12.5, 'Um bom curso de direito criminal', '41653193506', '01374995384');
INSERT INTO Curso
VALUES (curso_seq.NEXTVAL, 'Direito Trabalhista', 34.5, 'Um ótimo curso de direito trabalhista', '41653193506', '24868992106');
INSERT INTO Curso
VALUES (curso_seq.NEXTVAL, 'Matémática x Excel', 19.5, 'Matematica aplicada a excel com excelência', '65572473286', '01374995384');
INSERT INTO Curso
VALUES (curso_seq.NEXTVAL, 'Python, do básico ao avançado', 46.5, 'Python para concursos', '01374545384', '01374995384');
INSERT INTO Curso
VALUES (curso_seq.NEXTVAL, 'C# intemediário', 78.9, 'C# para concursos nordestinos', '01374545384', '24868992106');
INSERT INTO Curso
VALUES (curso_seq.NEXTVAL, 'Contabilidade por Estevão Ferreira', 12.3, 'Aprenda contabilidade com o melhor', '24868152106', '24868992106');
INSERT INTO Curso
VALUES (curso_seq.NEXTVAL, 'Lógica II', 15.99, 'Lógica Aristotélica para concursos federais', '54124521596', '24868992106');
INSERT INTO Curso
VALUES (curso_seq.NEXTVAL, 'Inteligência Artificial para Iniciantes', 50.0, 'Aprenda os conceitos básicos de IA', '39900055015', '01374995384');




--enderecos
INSERT INTO Endereco VALUES (endereco_seq.NEXTVAL, '63068411050', '63068411', 10, NULL);
INSERT INTO Endereco VALUES (endereco_seq.NEXTVAL, '62519332247', '54124521', 120, 'Apartamento 401');
INSERT INTO Endereco VALUES (endereco_seq.NEXTVAL, '17654430590', '42880166', 40, 'Sala 1001');
INSERT INTO Endereco VALUES (endereco_seq.NEXTVAL, '12812287454', '24868152', 170, NULL);
INSERT INTO Endereco VALUES (endereco_seq.NEXTVAL, '42880166810', '01374545', 130, 'Bloco B, Apt 201');
INSERT INTO Endereco VALUES (endereco_seq.NEXTVAL, '06445112650', '42880166', 40, 'Sala 1001');
INSERT INTO Endereco VALUES (endereco_seq.NEXTVAL, '23975024887', '24868992', 140, 'Sala 202');
INSERT INTO Endereco VALUES (endereco_seq.NEXTVAL, '51581412312', '12812287', 30, 'Casa 2');
INSERT INTO Endereco VALUES (endereco_seq.NEXTVAL, '25729844409', '17654430', 20, 'Bloco A, Apt 101');
INSERT INTO Endereco VALUES (endereco_seq.NEXTVAL, '72586163818', '62519332', 160, 'Fundos');
--Silvana
INSERT INTO Endereco VALUES (endereco_seq.NEXTVAL, '41653193506', '72586163', 90, NULL);
INSERT INTO Endereco VALUES (endereco_seq.NEXTVAL, '65572473286', '25729844', 80, 'Lado direito');
INSERT INTO Endereco VALUES (endereco_seq.NEXTVAL, '54124521596', '42880166', 40, 'Sala 2003');
INSERT INTO Endereco VALUES (endereco_seq.NEXTVAL, '24868992106', '51581412', 70, 'Fundo');
INSERT INTO Endereco VALUES (endereco_seq.NEXTVAL, '01374545384', '65572473', 110, NULL);
--Hugo
--Josué
--Mário
INSERT INTO Endereco VALUES (endereco_seq.NEXTVAL, '24868152106', '41653193', 100, 'Casa 5');
INSERT INTO Endereco VALUES (endereco_seq.NEXTVAL, '01374995384', '01374995', 150, NULL);
--Gabriela

--telefones
INSERT INTO Telefone (cpf_usuario, telefone) VALUES ('63068411050', '11111111111');
INSERT INTO Telefone (cpf_usuario, telefone) VALUES ('62519332247', '22222222222');
INSERT INTO Telefone (cpf_usuario, telefone) VALUES ('17654430590', '33333333333');
INSERT INTO Telefone (cpf_usuario, telefone) VALUES ('12812287454', '44444444444');
INSERT INTO Telefone (cpf_usuario, telefone) VALUES ('12812287454', '44444444442');
INSERT INTO Telefone (cpf_usuario, telefone) VALUES ('42880166810', '55555555555');
INSERT INTO Telefone (cpf_usuario, telefone) VALUES ('06445112650', '66666666666');
INSERT INTO Telefone (cpf_usuario, telefone) VALUES ('23975024887', '77777777777');
INSERT INTO Telefone (cpf_usuario, telefone) VALUES ('51581412312', '88888888888');
INSERT INTO Telefone (cpf_usuario, telefone) VALUES ('25729844409', '99999999999');
INSERT INTO Telefone (cpf_usuario, telefone) VALUES ('72586163818', '10101010101');
INSERT INTO Telefone (cpf_usuario, telefone) VALUES ('41653193506', '12121212121');
INSERT INTO Telefone (cpf_usuario, telefone) VALUES ('65572473286', '13131313131');
INSERT INTO Telefone (cpf_usuario, telefone) VALUES ('54124521596', '14141414141');
INSERT INTO Telefone (cpf_usuario, telefone) VALUES ('24868152106', '15151515151');
INSERT INTO Telefone (cpf_usuario, telefone) VALUES ('01374545384', '16161616161');
INSERT INTO Telefone (cpf_usuario, telefone) VALUES ('24868992106', '17171717171');
INSERT INTO Telefone (cpf_usuario, telefone) VALUES ('01374995384', '18181818181');

--aulas

-- Curso 1: Direito Criminal
INSERT INTO Aula VALUES (1, 1, 'Conceitos básicos de Direito Penal', 2.5);
INSERT INTO Aula VALUES (1, 2, 'Crimes contra a pessoa', 3.0);
INSERT INTO Aula VALUES (1, 3, 'Crimes contra o patrimônio', 4.5);

-- Curso 2: Direito Trabalhista
INSERT INTO Aula VALUES (2, 1, 'Introdução ao Direito do Trabalho', 2.5);
INSERT INTO Aula VALUES (2, 2, 'Contratos de trabalho', 3.0);
INSERT INTO Aula VALUES (2, 3, 'Rescisão do contrato de trabalho', 4.5);

-- Curso 3: Matemática x Excel
INSERT INTO Aula VALUES (3, 1, 'Funções matemáticas no Excel', 2.5);
INSERT INTO Aula VALUES (3, 2, 'Gráficos e tabelas no Excel', 3.0);
INSERT INTO Aula VALUES (3, 3, 'Fórmulas e equações no Excel', 4.5);

-- Curso 4: Python, do básico ao avançado
INSERT INTO Aula VALUES (4, 1, 'Introdução ao Python', 2.5);
INSERT INTO Aula VALUES (4, 2, 'Estruturas de dados em Python', 3.0);
INSERT INTO Aula VALUES (4, 3, 'Programação orientada a objetos em Python', 4.5);

-- Curso 5: C# intermediário
INSERT INTO Aula VALUES (5, 1, 'Classes e objetos em C#', 2.5);
INSERT INTO Aula VALUES (5, 2, 'Herança e polimorfismo em C#', 3.0);
INSERT INTO Aula VALUES (5, 3, 'Manipulação de arquivos em C#', 4.5);

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


-- Compra 2
INSERT INTO Efetuar_compra (id_curso, cpf_aluno, data_hora)
VALUES (2, '62519332247', TO_TIMESTAMP('2022-02-28 10:30:00', 'YYYY-MM-DD HH24:MI:SS'));

-- Compra 3
INSERT INTO Efetuar_compra (id_curso, cpf_aluno, data_hora)
VALUES (3, '17654430590', TO_TIMESTAMP('2022-02-28 11:00:00', 'YYYY-MM-DD HH24:MI:SS'));

-- Compra 4
INSERT INTO Efetuar_compra (id_curso, cpf_aluno, data_hora)
VALUES (4, '12812287454', TO_TIMESTAMP('2022-02-28 11:30:00', 'YYYY-MM-DD HH24:MI:SS'));

-- Compra 5
INSERT INTO Efetuar_compra (id_curso, cpf_aluno, data_hora)
VALUES (5, '42880166810', TO_TIMESTAMP('2022-02-28 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));

-- Compra 6
INSERT INTO Efetuar_compra (id_curso, cpf_aluno, data_hora)
VALUES (6, '06445112650', TO_TIMESTAMP('2022-02-28 12:30:00', 'YYYY-MM-DD HH24:MI:SS'));

-- Compra 7
INSERT INTO Efetuar_compra (id_curso, cpf_aluno, data_hora)
VALUES (1, '23975024887', TO_TIMESTAMP('2022-02-28 13:00:00', 'YYYY-MM-DD HH24:MI:SS'));

-- Compra 8
INSERT INTO Efetuar_compra (id_curso, cpf_aluno, data_hora)
VALUES (2, '51581412312', TO_TIMESTAMP('2022-02-28 13:30:00', 'YYYY-MM-DD HH24:MI:SS'));

-- Compra 9
INSERT INTO Efetuar_compra (id_curso, cpf_aluno, data_hora)
VALUES (3, '25729844409', TO_TIMESTAMP('2022-02-28 14:00:00', 'YYYY-MM-DD HH24:MI:SS'));

-- Compra 10
INSERT INTO Efetuar_compra (id_curso, cpf_aluno, data_hora) 
VALUES (4, '72586163818', TO_TIMESTAMP('2022-02-28 14:30:00', 'YYYY-MM-DD HH24:MI:SS'));

-- Compra 11
INSERT INTO Efetuar_compra (id_curso, cpf_aluno, data_hora)
VALUES (5, '06445112650', TO_TIMESTAMP('2022-02-28 15:00:00', 'YYYY-MM-DD HH24:MI:SS'));

-- Compra 12
INSERT INTO Efetuar_compra (id_curso, cpf_aluno, data_hora)
VALUES (6, '12812287454', TO_TIMESTAMP('2022-02-28 15:30:00', 'YYYY-MM-DD HH24:MI:SS'));

-- Compra 13
INSERT INTO Efetuar_compra (id_curso, cpf_aluno, data_hora)
VALUES (1, '17654430590', TO_TIMESTAMP('2022-02-28 16:00:00', 'YYYY-MM-DD HH24:MI:SS'));

-- Compra 14
INSERT INTO Efetuar_compra (id_curso, cpf_aluno, data_hora)
VALUES (2, '23975024887', TO_TIMESTAMP('2022-02-28 16:30:00', 'YYYY-MM-DD HH24:MI:SS'));

-- Compra 15
INSERT INTO Efetuar_compra (id_curso, cpf_aluno, data_hora)
VALUES (2, '25729844409', TO_TIMESTAMP('2022-02-28 17:00:00', 'YYYY-MM-DD HH24:MI:SS'));

-- Compra 16
INSERT INTO Efetuar_compra (id_curso, cpf_aluno, data_hora)
VALUES (7, '42880166810', TO_TIMESTAMP('2022-01-05 09:35:00', 'YYYY-MM-DD HH24:MI:SS'));

-- Compra 17
INSERT INTO Efetuar_compra (id_curso, cpf_aluno, data_hora)
VALUES (7, '62519332247', TO_TIMESTAMP('2022-02-10 13:20:00', 'YYYY-MM-DD HH24:MI:SS'));



--assistir  

INSERT INTO Assistir (data_hora, id_curso, n_aula, cpf_aluno)
VALUES (TO_TIMESTAMP('2023-02-27 09:10:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 1, '23975024887');

-- assiste aula 2 do curso 1
INSERT INTO Assistir (data_hora, id_curso, n_aula, cpf_aluno)
VALUES (TO_TIMESTAMP('2023-02-27 09:50:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 2, '17654430590'); 

-- assiste aula 3 do curso 1
INSERT INTO Assistir (data_hora, id_curso, n_aula, cpf_aluno)
VALUES (TO_TIMESTAMP('2023-02-27 10:30:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 3, '17654430590'); 

-- assiste aula 1 do curso 2
INSERT INTO Assistir (data_hora, id_curso, n_aula, cpf_aluno)
VALUES (TO_TIMESTAMP('2023-02-28 14:10:00', 'YYYY-MM-DD HH24:MI:SS'), 2, 1, '25729844409');

-- assiste aula 2 do curso 2
INSERT INTO Assistir (data_hora, id_curso, n_aula, cpf_aluno)
VALUES (TO_TIMESTAMP('2023-02-28 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), 4, 2, '72586163818');

-- assiste aula 3 do curso 2
INSERT INTO Assistir (data_hora, id_curso, n_aula, cpf_aluno)
VALUES (TO_TIMESTAMP('2023-02-28 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 3, '17654430590');

-- assiste aula 1 do curso 3
INSERT INTO Assistir (data_hora, id_curso, n_aula, cpf_aluno)
VALUES (TO_TIMESTAMP('2023-03-01 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 1, '23975024887');

-- assiste aula 2 do curso 3
INSERT INTO Assistir (data_hora, id_curso, n_aula, cpf_aluno)
VALUES (TO_TIMESTAMP('2023-03-01 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 2, 2, '51581412312');

-- assiste aula 3 do curso 3
INSERT INTO Assistir (data_hora, id_curso, n_aula, cpf_aluno)
VALUES (TO_TIMESTAMP('2023-03-01 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 4, 3, '72586163818');

-- assiste aula 1 do curso 4



--Presentear

INSERT INTO Presentear VALUES ('12812287454', '51581412312', 2);
INSERT INTO Presentear VALUES ('25729844409', '17654430590', 3);
INSERT INTO Presentear VALUES ('72586163818', '23975024887', 4);
INSERT INTO Presentear VALUES ('51581412312', '06445112650', 5);
INSERT INTO Presentear VALUES ('23975024887', '12812287454', 6);
INSERT INTO Presentear VALUES ('42880166810', '72586163818', 1);

INSERT INTO Presentear VALUES ('51581412312', '25729844409', 3);

