create or replace type tp_aula as object(
	num_da_aula varchar2(30),
    titulo varchar2(30),
    duracao varchar2(50)
);
/

create or replace type tp_aula_relac as object(
    aula ref tp_aula
);
/

create or replace type tp_nt_aula as table of tp_aula_relac;
/

create or replace type tp_curso as object(
	titulo varchar2(30),
    valor number,
    descricao varchar(50),
    duracao number,
    id number,
    data_hora_publicacao varchar2(20),
    lista_aulas tp_nt_aula
);
/

create or replace type tp_curso_relac as object(
    curso ref tp_curso
);
/

create or replace type tp_nt_cursos as table of tp_curso;
/

create or replace type tp_usuario_endereco as object(
	complemento varchar2(30),
	cep varchar(50),
    numero number
);
/

CREATE TYPE tp_usuario_fone AS OBJECT(
	numero varchar2(30)
);
/

CREATE TYPE varray_fone AS VARRAY (5) OF tp_usuario_fone;
/

create or replace type tp_usuario as object(
	nome varchar2(30),
    cpf varchar2(20),
    endereco tp_usuario_endereco,
    duracao number,
    lista_fones varray_fone
)not final not INSTANTIABLE;
/

create or replace type tp_educador under tp_usuario( 
    lista_cursos tp_nt_cursos 
);
/
    
create or replace type tp_educador_curso_relac as object(
    lista_educadores ref tp_educador 
);
/

create or replace type tp_nt_educador_curso as table of tp_educador_curso_relac;
/

create or replace type tp_administrador under tp_usuario(
    lista_cursos_educadores tp_nt_educador_curso
);
/

create or replace type tp_aluno under tp_usuario(  
    lista_aulas_assistir tp_nt_aula
);
/

create or replace type tp_efetuar_compra as object(
    aluno ref tp_aluno,
    curso ref tp_curso,
    data_hora_compra varchar2(30)
);
/

create or replace type tp_assistir as object(
    aula ref tp_aula,
    aluno ref tp_aluno,
    data_hora_assitida varchar2(30)
);
/

create or replace type tp_presentear_curso as object(
    aluno_presenteado ref tp_aluno,
    aluno_presenteador ref tp_aluno,
    curso ref tp_curso
);
/