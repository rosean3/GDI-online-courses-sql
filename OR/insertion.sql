--inserindo em tb_educador

INSERT INTO tb_educador (cpf, nome, endereco, lista_fones) VALUES ('01731334917', 'Josué', tp_usuario_endereco('Bloco A', '19692800', 42), tp_usuario_fones(tp_usuario_fone('69336559044'), tp_usuario_fone('29196494496'), tp_usuario_fone('59878563519'), tp_usuario_fone('65006475897')));

INSERT INTO tb_educador (cpf, nome, endereco, lista_fones) VALUES ('00000000001', 'Ruy', tp_usuario_endereco('Apartamento 101', '74134921', 12), tp_usuario_fones(tp_usuario_fone('22222222222')));

INSERT INTO tb_educador (cpf, nome, endereco, lista_fones) VALUES ('06392252608', 'Anjolina', tp_usuario_endereco('Apartamento 101', '74134921', 12), tp_usuario_fones(tp_usuario_fone('24960618193')));

INSERT INTO tb_educador (cpf, nome, endereco, lista_fones) VALUES ('42750271500', 'Guilherme', tp_usuario_endereco('Bloco 3', '58649651', 12), tp_usuario_fones(tp_usuario_fone('50107601283')));

INSERT INTO tb_educador (cpf, nome, endereco, lista_fones) VALUES ('42993006152', 'Silvio', tp_usuario_endereco('Apartamento 302', '74134921', 12), tp_usuario_fones(tp_usuario_fone('96635341469')));

INSERT INTO tb_educador (cpf, nome, endereco, lista_fones) VALUES ('72048996937', 'Gustavo', tp_usuario_endereco('Bloco C', '15797846', 1), tp_usuario_fones(tp_usuario_fone('66666666666')));

INSERT INTO tb_educador (cpf, nome, endereco, lista_fones) VALUES ('90399870064', 'Luis', tp_usuario_endereco(NULL, '29481956', 4), tp_usuario_fones(tp_usuario_fone('18779525814')));

INSERT INTO tb_educador (cpf, nome, endereco, lista_fones) VALUES ('18409941996', 'Marcelo', tp_usuario_endereco('Apartamento 1104', '77661341', 1), tp_usuario_fones(tp_usuario_fone('24587054865')));

INSERT INTO tb_educador (cpf, nome, endereco, lista_fones) VALUES ('26409912996', 'Lenice', tp_usuario_endereco('Apartamento 212', '77641231', 1), tp_usuario_fones(tp_usuario_fone('39999054861'), tp_usuario_fone('99881991234')));


--inserindo em tb_aluno

--1compra
INSERT INTO tb_aluno (cpf, nome, endereco, lista_fones) VALUES ('13451468741', 'Mario', tp_usuario_endereco('Bloco C', '85370453', 42), tp_usuario_fones(tp_usuario_fone('49473798353')));

--1compra
INSERT INTO tb_aluno (cpf, nome, endereco, lista_fones) VALUES ('26419720291', 'Rui', tp_usuario_endereco('Apartamento 202', '85370453', 4), tp_usuario_fones(tp_usuario_fone('74554869342')));

--2compra
INSERT INTO tb_aluno (cpf, nome, endereco, lista_fones) VALUES ('21475327332', 'Leticia', tp_usuario_endereco(NULL, '85246150', 13), tp_usuario_fones(tp_usuario_fone('88758595463'), tp_usuario_fone('67710687600')));

--1compra
INSERT INTO tb_aluno (cpf, nome, endereco, lista_fones) VALUES ('87829442544', 'Rafael', tp_usuario_endereco('Bloco 3', '38489172', 12), tp_usuario_fones(tp_usuario_fone('83943873983')));

--1compra
INSERT INTO tb_aluno (cpf, nome, endereco, lista_fones) VALUES ('86291960821', 'Maria', tp_usuario_endereco('Apartamento 402', '11196898', 4), tp_usuario_fones(tp_usuario_fone('28449310507')));

--2compra
INSERT INTO tb_aluno (cpf, nome, endereco, lista_fones) VALUES ('32274181942', 'Katia', tp_usuario_endereco('Bloco C', '84513522', 1), tp_usuario_fones(tp_usuario_fone('60903915891')));

--1compra
INSERT INTO tb_aluno (cpf, nome, endereco, lista_fones) VALUES ('66402019823', 'Barbara', tp_usuario_endereco(NULL, '46407908', 4), tp_usuario_fones(tp_usuario_fone('19072354622'), tp_usuario_fone('92914517633')));

--4compra
INSERT INTO tb_aluno (cpf, nome, endereco, lista_fones) VALUES ('10918637289', 'Marcelo', tp_usuario_endereco('1104', '23745093', 1), tp_usuario_fones(tp_usuario_fone('57429170002'), tp_usuario_fone('73117579487')));

--3compra
INSERT INTO tb_aluno (cpf, nome, endereco, lista_fones) VALUES ('87387698251', 'Ernesto', tp_usuario_endereco(NULL, '88379717', NULL), tp_usuario_fones(tp_usuario_fone('57625705738'), tp_usuario_fone('26409745131')));

--2compra
INSERT INTO tb_aluno (cpf, nome, endereco, lista_fones) VALUES ('86298332544', 'Beatrice', tp_usuario_endereco(NULL, '87801111', NULL), tp_usuario_fones(tp_usuario_fone('32717751523')));

--2compra
INSERT INTO tb_aluno (cpf, nome, endereco, lista_fones) VALUES ('11936476244', 'Robson', tp_usuario_endereco('Apartamento 1104', '21791174', 1), tp_usuario_fones(tp_usuario_fone('51485148493')));

--inserindo em tb_administrador

INSERT INTO tb_administrador (cpf, nome, endereco, lista_fones) VALUES ('77447413012', 'Fernando', tp_usuario_endereco(NULL, '73461926', NULL), tp_usuario_fones(tp_usuario_fone('65739301198'), tp_usuario_fone('56385266170')));

INSERT INTO tb_administrador (cpf, nome, endereco, lista_fones) VALUES ('23268225852', 'Beatriz', tp_usuario_endereco(NULL, '36826442', NULL), tp_usuario_fones(tp_usuario_fone('88888888888'), tp_usuario_fone('60351492835'), tp_usuario_fone('82754305473')));

INSERT INTO tb_administrador (cpf, nome, endereco, lista_fones) VALUES ('47680877364', 'Matheus', tp_usuario_endereco('Bloco 2', '10562321', 12), tp_usuario_fones(tp_usuario_fone('98451784511')));

INSERT INTO tb_administrador (cpf, nome, endereco, lista_fones) VALUES ('66046090696', 'Gabriel', tp_usuario_endereco('Apartamento 602', '11387378', 4), tp_usuario_fones(tp_usuario_fone('69692040093')));

INSERT INTO tb_administrador (cpf, nome, endereco, lista_fones) VALUES ('81206614383', 'Eulalia', tp_usuario_endereco('Bloco E', '12272583', 1), tp_usuario_fones(tp_usuario_fone('52831167612'), tp_usuario_fone('73388513183'), tp_usuario_fone('84725873884')));

INSERT INTO tb_administrador (cpf, nome, endereco, lista_fones) VALUES ('43846654031', 'Luiz', tp_usuario_endereco(NULL, '88054179', 4), tp_usuario_fones(tp_usuario_fone('5604356058'), tp_usuario_fone('85428572608'), tp_usuario_fone('36591697904')));

INSERT INTO tb_administrador (cpf, nome, endereco, lista_fones) VALUES ('73964907123', 'Alice', tp_usuario_endereco(NULL, '16655300', 13), tp_usuario_fones(tp_usuario_fone('33317203735')));

--inserindo em tb_curso

INSERT INTO tb_curso (id, titulo, valor, descricao, lista_aulas, educador, administrador) VALUES (
1,
'Introdução ao Python',
120.00,
'Curso de introdução a programação em Python',
tp_lista_aulas(tp_aula(1, 'Instalação do Python', 1.5), tp_aula(2, 'Variáveis e Tipos de Dados', 2.0), tp_aula(3, 'Condicionais e Loops', 3.5), tp_aula(4, 'Funções', 2.5), tp_aula(5, 'Módulos', 1.5)),
(SELECT REF(e) FROM tb_educador e WHERE e.cpf = '01731334917'),
(SELECT REF(a) FROM tb_administrador a WHERE a.cpf = '77447413012')
);

INSERT INTO tb_curso (id, titulo, valor, descricao, lista_aulas, educador, administrador) VALUES (
    2,
    'Curso de Matemática',
    100.00,
    'Este curso oferece uma introdução à matemática básica.',
    tp_lista_aulas(
        tp_aula(1, 'Introdução à Álgebra', 2.5)
    ),
    (SELECT REF(e) FROM tb_educador e  WHERE e.cpf = '42750271500'),
    (SELECT REF(a) FROM tb_administrador a WHERE a.cpf = '23268225852')
);

INSERT INTO tb_curso (id, titulo, valor, descricao, lista_aulas, educador, administrador) VALUES (
    3,
    'Curso de Inglês',
    200.00,
    'Este curso ensina o básico do idioma inglês.',
    tp_lista_aulas(
        tp_aula(1, 'Introdução ao Inglês', 2.0),
        tp_aula(2, 'Vocabulário Básico', 1.5)
    ),
    (SELECT REF(e) FROM tb_educador e WHERE e.cpf = '72048996937'),
    (SELECT REF(a) FROM tb_administrador a WHERE a.cpf = '23268225852')
);

INSERT INTO tb_curso (id, titulo, valor, descricao, lista_aulas, educador, administrador) VALUES (
    4,
    'Direito Criminal',
    12.50,
    'Um bom curso de direito criminal.',
    tp_lista_aulas(
        tp_aula(1, 'Conceitos básicos de Direito Penal', 2.5),
        tp_aula(2, 'Crimes contra a pessoa', 3.0), 
        tp_aula(3, 'Crimes contra o patrimônio', 4.5)
    ),
    (SELECT REF(e) FROM tb_educador e WHERE e.cpf = '90399870064'),
    (SELECT REF(a) FROM tb_administrador a WHERE a.cpf = '47680877364')
);

INSERT INTO tb_curso (id, titulo, valor, descricao, lista_aulas, educador, administrador) VALUES (
    5,
    'Direito Trabalhista',
    12.50,
    'Um ótimo curso de direito trabalhista.',
    tp_lista_aulas(
        tp_aula(1, 'Introdução ao Direito do Trabalho', 2.5),
        tp_aula(2, 'Contratos de trabalho', 3.0), 
        tp_aula(3, 'Rescisão do contrato de trabalho', 4.5)
    ),
    (SELECT REF(e) FROM tb_educador e WHERE e.cpf = '90399870064'),
    (SELECT REF(a) FROM tb_administrador a WHERE a.cpf = '66046090696')
);

INSERT INTO tb_curso (id, titulo, valor, descricao, lista_aulas, educador, administrador) VALUES (
    6,
    'C# intemediário',
    78.90,
    'C# para concursos nordestinos.',
    tp_lista_aulas(
        tp_aula(1, 'Classes e objetos em C#', 2.5),
        tp_aula(2, 'Herança e polimorfismo em C#', 3.0), 
        tp_aula(3, 'Manipulação de arquivos em C#', 4.5)
    ),
    (SELECT REF(e) FROM tb_educador e WHERE e.cpf = '00000000001'),
    (SELECT REF(a) FROM tb_administrador a WHERE a.cpf = '81206614383')
);

INSERT INTO tb_curso (id, titulo, valor, descricao, lista_aulas, educador, administrador) VALUES (
    7,
    'Contabilidade',
    12.30,
    'Aprenda contabilidade com o melhor professor de Igarassu.',
    tp_lista_aulas(
        tp_aula(1, 'Introdução à contabilidade', 1.5),
        tp_aula(2, 'Lançamentos contábeis', 2.0), 
        tp_aula(3, 'Demonstrações contábeis', 3.0)
    ),
    (SELECT REF(e) FROM tb_educador e WHERE e.cpf = '18409941996'),
    (SELECT REF(a) FROM tb_administrador a WHERE a.cpf = '43846654031')
);

INSERT INTO tb_curso (id, titulo, valor, descricao, lista_aulas, educador, administrador) VALUES (
    8,
    'Lógica II',
    15.99,
    'Lógica Aristotélica para concursos federais.',
    tp_lista_aulas(
        tp_aula(1, 'Conceitos básicos de lógica', 1.0),
        tp_aula(2, 'Lógica proposicional', 2.5), 
        tp_aula(3, 'Lógica de predicados', 2.5)
    ),
    (SELECT REF(e) FROM tb_educador e WHERE e.cpf = '42993006152'),
    (SELECT REF(a) FROM tb_administrador a WHERE a.cpf = '47680877364')
);

INSERT INTO tb_curso (id, titulo, valor, descricao, lista_aulas, educador, administrador) VALUES (
    9,
    'Inteligência Artificial para Iniciantes',
    12.50,
    'Aprenda os conceitos básicos de IA.',
    NULL,
    (SELECT REF(e) FROM tb_educador e WHERE e.cpf = '00000000001'),
    (SELECT REF(a) FROM tb_administrador a WHERE a.cpf = '43846654031')
);

INSERT INTO tb_curso (id, titulo, valor, descricao, lista_aulas, educador, administrador) VALUES (
    10,
    'Jogo do Bicho 101',
    12.50,
    'Se torne aprendiz do Zeca Pagodinho.',
    NULL,
    (SELECT REF(e) FROM tb_educador e WHERE e.cpf = '00000000001'),
    (SELECT REF(a) FROM tb_administrador a WHERE a.cpf = '66046090696')
);


INSERT INTO tb_curso (id, titulo, valor, descricao, lista_aulas, educador, administrador) VALUES (
    11,
    'Curso de Inglês',
    100.00,
    'Este curso ensina o básico do idioma inglês.',
    tp_lista_aulas(
        tp_aula(1, 'Introdução ao Inglês', 4.0),
        tp_aula(2, 'Vocabulário Básico', 4.5)
    ),
    (SELECT REF(e) FROM tb_educador e WHERE e.cpf = '00000000001'),
    (SELECT REF(a) FROM tb_administrador a WHERE a.cpf = '66046090696')
);

INSERT INTO tb_curso (id, titulo, valor, descricao, lista_aulas, educador, administrador) VALUES (
    12,
    'Curso de Francês',
    100.00,
    'Este curso ensina o básico do idioma inglês.',
    tp_lista_aulas(
        tp_aula(1, 'Introdução ao Francês', 2.0),
        tp_aula(1, 'Vocabulário Básico', 2.0)
    ),
    (SELECT REF(e) FROM tb_educador e WHERE e.cpf = '00000000001'),
    (SELECT REF(a) FROM tb_administrador a WHERE a.cpf = '66046090696')
);

--inserindo em tb_efetuar_compra

INSERT INTO tb_efetuar_compra (id_ec, curso_ec, aluno_ec, data_hora_compra) VALUES (
efetuar_compra_seq.NEXTVAL,
(SELECT REF(c) FROM tb_curso c WHERE c.id = 1),
(SELECT REF(a) FROM tb_aluno a WHERE a.cpf = '13451468741'),
TO_TIMESTAMP('2023-04-05 15:30:00', 'YYYY-MM-DD HH24:MI:SS')
);

INSERT INTO tb_efetuar_compra (id_ec, curso_ec, aluno_ec, data_hora_compra) VALUES (
efetuar_compra_seq.NEXTVAL,
(SELECT REF(c) FROM tb_curso c WHERE c.id = 3),
(SELECT REF(a) FROM tb_aluno a WHERE a.cpf = '26419720291'),
TO_TIMESTAMP('2022-04-30 11:30:20', 'YYYY-MM-DD HH24:MI:SS')
);

INSERT INTO tb_efetuar_compra (id_ec, curso_ec, aluno_ec, data_hora_compra) VALUES (
efetuar_compra_seq.NEXTVAL,
(SELECT REF(c) FROM tb_curso c WHERE c.id = 4),
(SELECT REF(a) FROM tb_aluno a WHERE a.cpf = '21475327332'),
TO_TIMESTAMP('2023-02-12 11:30:20', 'YYYY-MM-DD HH24:MI:SS')
);

INSERT INTO tb_efetuar_compra (id_ec, curso_ec, aluno_ec, data_hora_compra) VALUES (
efetuar_compra_seq.NEXTVAL,
(SELECT REF(c) FROM tb_curso c WHERE c.id = 5),
(SELECT REF(a) FROM tb_aluno a WHERE a.cpf = '21475327332'),
TO_TIMESTAMP('2023-02-12 11:32:45', 'YYYY-MM-DD HH24:MI:SS')
);

INSERT INTO tb_efetuar_compra (id_ec, curso_ec, aluno_ec, data_hora_compra) VALUES (
efetuar_compra_seq.NEXTVAL,
(SELECT REF(c) FROM tb_curso c WHERE c.id = 2),
(SELECT REF(a) FROM tb_aluno a WHERE a.cpf = '87829442544'),
TO_TIMESTAMP('2023-01-24 18:42:34', 'YYYY-MM-DD HH24:MI:SS')
);

INSERT INTO tb_efetuar_compra (id_ec, curso_ec, aluno_ec, data_hora_compra) VALUES (
efetuar_compra_seq.NEXTVAL,
(SELECT REF(c) FROM tb_curso c WHERE c.id = 10),
(SELECT REF(a) FROM tb_aluno a WHERE a.cpf = '86291960821'),
TO_TIMESTAMP('2023-01-02 03:21:14', 'YYYY-MM-DD HH24:MI:SS')
);

INSERT INTO tb_efetuar_compra (id_ec, curso_ec, aluno_ec, data_hora_compra) VALUES (
efetuar_compra_seq.NEXTVAL,
(SELECT REF(c) FROM tb_curso c WHERE c.id = 7),
(SELECT REF(a) FROM tb_aluno a WHERE a.cpf = '32274181942'),
TO_TIMESTAMP('2022-12-07 08:26:00', 'YYYY-MM-DD HH24:MI:SS')
);

INSERT INTO tb_efetuar_compra (id_ec, curso_ec, aluno_ec, data_hora_compra) VALUES (
efetuar_compra_seq.NEXTVAL,
(SELECT REF(c) FROM tb_curso c WHERE c.id = 8),
(SELECT REF(a) FROM tb_aluno a WHERE a.cpf = '32274181942'),
TO_TIMESTAMP('2023-01-03 13:41:10', 'YYYY-MM-DD HH24:MI:SS')
);

INSERT INTO tb_efetuar_compra (id_ec, curso_ec, aluno_ec, data_hora_compra) VALUES (
efetuar_compra_seq.NEXTVAL,
(SELECT REF(c) FROM tb_curso c WHERE c.id = 6),
(SELECT REF(a) FROM tb_aluno a WHERE a.cpf = '66402019823'),
TO_TIMESTAMP('2023-02-17 11:21:00', 'YYYY-MM-DD HH24:MI:SS')
);

INSERT INTO tb_efetuar_compra (id_ec, curso_ec, aluno_ec, data_hora_compra) VALUES (
efetuar_compra_seq.NEXTVAL,
(SELECT REF(c) FROM tb_curso c WHERE c.id = 9),
(SELECT REF(a) FROM tb_aluno a WHERE a.cpf = '10918637289'),
TO_TIMESTAMP('2023-02-12 11:17:00', 'YYYY-MM-DD HH24:MI:SS')
);

INSERT INTO tb_efetuar_compra (id_ec, curso_ec, aluno_ec, data_hora_compra) VALUES (
efetuar_compra_seq.NEXTVAL,
(SELECT REF(c) FROM tb_curso c WHERE c.id = 1),
(SELECT REF(a) FROM tb_aluno a WHERE a.cpf = '10918637289'),
TO_TIMESTAMP('2023-02-12 11:19:00', 'YYYY-MM-DD HH24:MI:SS')
);

INSERT INTO tb_efetuar_compra (id_ec, curso_ec, aluno_ec, data_hora_compra) VALUES (
efetuar_compra_seq.NEXTVAL,
(SELECT REF(c) FROM tb_curso c WHERE c.id = 2),
(SELECT REF(a) FROM tb_aluno a WHERE a.cpf = '10918637289'),
TO_TIMESTAMP('2023-02-12 11:20:00', 'YYYY-MM-DD HH24:MI:SS')
);

INSERT INTO tb_efetuar_compra (id_ec, curso_ec, aluno_ec, data_hora_compra) VALUES (
efetuar_compra_seq.NEXTVAL,
(SELECT REF(c) FROM tb_curso c WHERE c.id = 10),
(SELECT REF(a) FROM tb_aluno a WHERE a.cpf = '10918637289'),
TO_TIMESTAMP('2023-02-12 11:21:00', 'YYYY-MM-DD HH24:MI:SS')
);

INSERT INTO tb_efetuar_compra (id_ec, curso_ec, aluno_ec, data_hora_compra) VALUES (
efetuar_compra_seq.NEXTVAL,
(SELECT REF(c) FROM tb_curso c WHERE c.id = 4),
(SELECT REF(a) FROM tb_aluno a WHERE a.cpf = '87387698251'),
TO_TIMESTAMP('2023-03-13 13:22:55', 'YYYY-MM-DD HH24:MI:SS')
);

INSERT INTO tb_efetuar_compra (id_ec, curso_ec, aluno_ec, data_hora_compra) VALUES (
efetuar_compra_seq.NEXTVAL,
(SELECT REF(c) FROM tb_curso c WHERE c.id = 8),
(SELECT REF(a) FROM tb_aluno a WHERE a.cpf = '87387698251'),
TO_TIMESTAMP('2023-02-01 09:21:20', 'YYYY-MM-DD HH24:MI:SS')
);

INSERT INTO tb_efetuar_compra (id_ec, curso_ec, aluno_ec, data_hora_compra) VALUES (
efetuar_compra_seq.NEXTVAL,
(SELECT REF(c) FROM tb_curso c WHERE c.id = 7),
(SELECT REF(a) FROM tb_aluno a WHERE a.cpf = '87387698251'),
TO_TIMESTAMP('2022-12-12 12:12:12', 'YYYY-MM-DD HH24:MI:SS')
);

INSERT INTO tb_efetuar_compra (id_ec, curso_ec, aluno_ec, data_hora_compra) VALUES (
efetuar_compra_seq.NEXTVAL,
(SELECT REF(c) FROM tb_curso c WHERE c.id = 10),
(SELECT REF(a) FROM tb_aluno a WHERE a.cpf = '86298332544'),
TO_TIMESTAMP('2022-12-31 11:12:12', 'YYYY-MM-DD HH24:MI:SS')
);

INSERT INTO tb_efetuar_compra (id_ec, curso_ec, aluno_ec, data_hora_compra) VALUES (
efetuar_compra_seq.NEXTVAL,
(SELECT REF(c) FROM tb_curso c WHERE c.id = 4),
(SELECT REF(a) FROM tb_aluno a WHERE a.cpf = '86298332544'),
TO_TIMESTAMP('2023-01-01 17:55:03', 'YYYY-MM-DD HH24:MI:SS')
);

INSERT INTO tb_efetuar_compra (id_ec, curso_ec, aluno_ec, data_hora_compra) VALUES (
efetuar_compra_seq.NEXTVAL,
(SELECT REF(c) FROM tb_curso c WHERE c.id = 8),
(SELECT REF(a) FROM tb_aluno a WHERE a.cpf = '11936476244'),
TO_TIMESTAMP('2023-01-31 17:54:03', 'YYYY-MM-DD HH24:MI:SS')
);

INSERT INTO tb_efetuar_compra (id_ec, curso_ec, aluno_ec, data_hora_compra) VALUES (
efetuar_compra_seq.NEXTVAL,
(SELECT REF(c) FROM tb_curso c WHERE c.id = 9),
(SELECT REF(a) FROM tb_aluno a WHERE a.cpf = '11936476244'),
TO_TIMESTAMP('2023-02-26 14:51:43', 'YYYY-MM-DD HH24:MI:SS')
);

--inserindo em tb_presentear_curso

INSERT INTO tb_presentear_curso (id_pc, aluno_presenteado, aluno_presenteador, curso) VALUES (
1,
(SELECT REF(a1) FROM tb_aluno a1 WHERE a1.cpf = '13451468741'),
(SELECT REF(a2) FROM tb_aluno a2 WHERE a2.cpf = '26419720291'),
(SELECT REF(c) FROM tb_curso c WHERE c.id = 2)
);

INSERT INTO tb_presentear_curso (id_pc, aluno_presenteado, aluno_presenteador, curso) VALUES (
2,
(SELECT REF(a1) FROM tb_aluno a1 WHERE a1.cpf = '26419720291'),
(SELECT REF(a2) FROM tb_aluno a2 WHERE a2.cpf = '13451468741'),
(SELECT REF(c) FROM tb_curso c WHERE c.id = 2)
);

INSERT INTO tb_presentear_curso (id_pc, aluno_presenteado, aluno_presenteador, curso) VALUES (
3,
(SELECT REF(a1) FROM tb_aluno a1 WHERE a1.cpf = '32274181942'),
(SELECT REF(a2) FROM tb_aluno a2 WHERE a2.cpf = '66402019823'),
(SELECT REF(c) FROM tb_curso c WHERE c.id = 2)
);

INSERT INTO tb_presentear_curso (id_pc, aluno_presenteado, aluno_presenteador, curso) VALUES (
4,
(SELECT REF(a1) FROM tb_aluno a1 WHERE a1.cpf = '21475327332'),
(SELECT REF(a2) FROM tb_aluno a2 WHERE a2.cpf = '86291960821'),
(SELECT REF(c) FROM tb_curso c WHERE c.id = 5)
);

INSERT INTO tb_presentear_curso (id_pc, aluno_presenteado, aluno_presenteador, curso) VALUES (
5,
(SELECT REF(a1) FROM tb_aluno a1 WHERE a1.cpf = '66402019823'),
(SELECT REF(a2) FROM tb_aluno a2 WHERE a2.cpf = '87829442544'),
(SELECT REF(c) FROM tb_curso c WHERE c.id = 2)
);

INSERT INTO tb_presentear_curso (id_pc, aluno_presenteado, aluno_presenteador, curso) VALUES (
6,
(SELECT REF(a1) FROM tb_aluno a1 WHERE a1.cpf = '10918637289'),
(SELECT REF(a2) FROM tb_aluno a2 WHERE a2.cpf = '87387698251'),
(SELECT REF(c) FROM tb_curso c WHERE c.id = 4)
);

INSERT INTO tb_presentear_curso (id_pc, aluno_presenteado, aluno_presenteador, curso) VALUES (
7,
(SELECT REF(a1) FROM tb_aluno a1 WHERE a1.cpf = '11936476244'),
(SELECT REF(a2) FROM tb_aluno a2 WHERE a2.cpf = '86291960821'),
(SELECT REF(c) FROM tb_curso c WHERE c.id = 2)
);

INSERT INTO tb_presentear_curso (id_pc, aluno_presenteado, aluno_presenteador, curso) VALUES (
8,
(SELECT REF(a1) FROM tb_aluno a1 WHERE a1.cpf = '10918637289'),
(SELECT REF(a2) FROM tb_aluno a2 WHERE a2.cpf = '86298332544'),
(SELECT REF(c) FROM tb_curso c WHERE c.id = 3)
);

INSERT INTO tb_presentear_curso (id_pc, aluno_presenteado, aluno_presenteador, curso) VALUES (
9,
(SELECT REF(a1) FROM tb_aluno a1 WHERE a1.cpf = '10918637289'),
(SELECT REF(a2) FROM tb_aluno a2 WHERE a2.cpf = '86298332544'),
(SELECT REF(c) FROM tb_curso c WHERE c.id = 7)
);


--inserindo em tb_assistir