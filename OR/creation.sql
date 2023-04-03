create or replace type tp_curso as object(
	titulo varchar2(30),
    valor number,
    descricao varchar(50),
    duracao number,
    id number
);

create or replace type tp_usuario_endereco as object(
	complemento varchar2(30),
	cep varchar(50),
    numero number
);
 
create or replace type tp_aula as object(
	num_da_aula varchar2(30),
    titulo varchar2(30),
    duracao varchar2(50),
    id_curso ref tp_curso
);

CREATE TYPE tp_usuario_fone AS OBJECT(
	numero varchar2(30)
);

CREATE TYPE varray_fone AS VARRAY (5) OF tp_usuario_fone;

create or replace type tp_usuario as object(
	nome varchar2(30),
    cpf varchar2(20),
    endereco tp_usuario_endereco,
    duracao number,
    lista_fones varray_fone
)not final not INSTANTIABLE;

create or replace type tp_administrador under tp_usuario(  
);

create or replace type tp_educador under tp_usuario(  
);

create or replace type tp_aluno under tp_usuario(  
);
