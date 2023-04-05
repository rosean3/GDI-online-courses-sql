DROP TABLE tb_presentear_curso;
DROP TABLE tb_assistir;
DROP TABLE tb_efetuar_compra;
DROP TABLE tb_curso;
DROP TABLE tb_administrador;
DROP TABLE tb_aluno;
DROP TABLE tb_educador;

CREATE TABLE tb_educador of tp_educador(
    cpf PRIMARY KEY
);
/

CREATE TABLE tb_aluno of tp_aluno(
    cpf PRIMARY KEY
);
/

CREATE TABLE tb_administrador of tp_administrador(
    cpf PRIMARY KEY
);
/
    
CREATE TABLE tb_curso OF tp_curso(
    id PRIMARY KEY,
    educador SCOPE IS tb_educador, -- ! adicionei scope is
    administrador SCOPE IS tb_administrador -- ! adicionei scope is
) NESTED TABLE lista_aulas
STORE AS nt_aulas;


CREATE TABLE tb_efetuar_compra of tp_efetuar_compra(
	id_ec PRIMARY KEY,
    aluno_ec WITH ROWID REFERENCES tb_aluno,
	curso_ec WITH ROWID REFERENCES tb_curso
);
/

CREATE TABLE tb_assistir of tp_assistir(
	id_as PRIMARY KEY,
	aluno_as WITH ROWID REFERENCES tb_aluno
    -- aula_as WITH ROWID REFERENCES tp_lista_aulas
    -- tentar referenciar aula de algum jeito
);
/

CREATE TABLE tb_presentear_curso of tp_presentear_curso(
	id_pc PRIMARY KEY,
	aluno_presenteado WITH ROWID REFERENCES tb_aluno,
    aluno_presenteador WITH ROWID REFERENCES tb_aluno,
	curso WITH ROWID REFERENCES tb_curso
);
/