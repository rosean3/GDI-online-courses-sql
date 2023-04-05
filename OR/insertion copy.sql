-- Inserção de curso
INSERT INTO tb_curso (id, titulo, valor, descricao, lista_aulas, educador, administrador) VALUES (
1,
'Introdução ao Python',
120.00,
'Curso de introdução a programação em Python',
tp_lista_aulas(tp_aula(1, 'Instalação do Python', 1.5), tp_aula(2, 'Variáveis e Tipos de Dados', 2.0), tp_aula(3, 'Condicionais e Loops', 3.5), tp_aula(4, 'Funções', 2.5), tp_aula(5, 'Módulos', 1.5)),
(SELECT REF(e) FROM tb_educador e WHERE e.cpf = '12345678901'),
(SELECT REF(a) FROM tb_administrador a WHERE a.cpf = '98765432109')
);

-- Inserção de lista de aulas em um curso
UPDATE tb_curso SET lista_aulas = tp_lista_aulas(tp_aula(1, 'Instalação do Python', 1.5), tp_aula(2, 'Variáveis e Tipos de Dados', 2.0), tp_aula(3, 'Condicionais e Loops', 3.5), tp_aula(4, 'Funções', 2.5), tp_aula(5, 'Módulos', 1.5)) WHERE id = 1;

-- Inserção de uma aula em um curso
DECLARE
curso_ref REF tp_curso;
BEGIN
SELECT REF(c) INTO curso_ref FROM tb_curso c WHERE c.id = 1 FOR UPDATE;
curso_ref.add_aula(6, 'Classes e Objetos', 4.0);
UPDATE tb_curso SET lista_aulas = curso_ref.lista_aulas WHERE id = 1;
END;

-- Inserção de efetuar compra
INSERT INTO tb_efetuar_compra (id_ec, curso_ec, aluno_ec, data_hora_compra) VALUES (
1,
(SELECT REF(c) FROM tb_curso c WHERE c.id = 1),
(SELECT REF(a) FROM tb_aluno a WHERE a.cpf = '13451468741'),
TO_TIMESTAMP('2023-04-05 15:30:00', 'YYYY-MM-DD HH24:MI:SS')
);

-- Inserção de assistir aula
INSERT INTO tb_assistir (id_as, aula_as, aluno_as, data_hora_assistir) VALUES (
1,
(SELECT REF(a) FROM tb_curso c, TABLE(c.lista_aulas) a WHERE c.id = 1 AND a.num_da_aula = 1),
(SELECT REF(a) FROM tb_usuario a WHERE a.cpf = '11122233344'),
TO_TIMESTAMP('2023-04-05 15:30:00', 'YYYY-MM-DD HH24:MI:SS')
);