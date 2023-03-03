DROP TABLE Presentear;
DROP TABLE Assistir;
DROP TABLE Efetuar_Compra;
DROP TABLE Aula;
DROP TABLE Curso;
DROP TABLE Administrador;
DROP TABLE Aluno;
DROP TABLE Educador;
DROP TABLE Telefone;
DROP TABLE Endereco;
DROP TABLE Usuario;
DROP SEQUENCE endereco_seq;
DROP SEQUENCE curso_seq;
 
CREATE TABLE Usuario(
  cpf CHAR(11),
  nome VARCHAR(100),
  CONSTRAINT usuario_pk PRIMARY KEY(cpf)
);

CREATE SEQUENCE endereco_seq START WITH 1 INCREMENT BY 1;

CREATE TABLE Endereco(
  id INT,
  cep CHAR(8),
  cpf_usuario CHAR(11),
  numero INT,
  complemento VARCHAR(100),
  CONSTRAINT endereco_pk PRIMARY KEY(id),
  CONSTRAINT endereco_usuario_fk FOREIGN KEY(cpf_usuario) REFERENCES Usuario(cpf)
);
 
CREATE TABLE Telefone(
  cpf_usuario CHAR(11),
  telefone CHAR(11),
  CONSTRAINT telefone_pk PRIMARY KEY(cpf_usuario, telefone),
  CONSTRAINT telefone_usuario_fk FOREIGN KEY(cpf_usuario) REFERENCES Usuario(cpf)
);
 
CREATE TABLE Educador(
  cpf CHAR(11),
  CONSTRAINT educador_pk PRIMARY KEY(cpf),
  CONSTRAINT educador_usuario_fk FOREIGN KEY(cpf) REFERENCES Usuario(cpf)
);
 
CREATE TABLE Aluno(
  cpf CHAR(11),
  CONSTRAINT aluno_pk PRIMARY KEY(cpf),
  CONSTRAINT aluno_usuario_fk FOREIGN KEY(cpf) REFERENCES Usuario(cpf)
);
 
CREATE TABLE Administrador(
  cpf CHAR(11),
  CONSTRAINT administrador_pk PRIMARY KEY(cpf),
  CONSTRAINT administrador_usuario_fk FOREIGN KEY(cpf) REFERENCES Usuario(cpf)
);
 
CREATE SEQUENCE curso_seq START WITH 1 INCREMENT BY 1;

CREATE TABLE Curso(
  id INT,
  titulo VARCHAR(300),
  valor FLOAT,
  descricao VARCHAR(4000),
  duracao FLOAT,
  cpf_educador CHAR(11),
  cpf_administrador CHAR(11),
  CONSTRAINT curso_pk PRIMARY KEY(id),
  CONSTRAINT curso_educador_fk FOREIGN KEY(cpf_educador) REFERENCES Educador(cpf),
  CONSTRAINT curso_administrador_fk FOREIGN KEY(cpf_administrador) REFERENCES Administrador(cpf),
  CONSTRAINT curso_check CHECK (duracao > 5)
);
 
CREATE TABLE Aula(
  id_curso INT,
  n_aula INT,
  titulo VARCHAR(300),
  duracao FLOAT,
  CONSTRAINT aula_pk PRIMARY KEY(id_curso, n_aula),
  CONSTRAINT aula_curso_fk FOREIGN KEY(id_curso) REFERENCES Curso(id)
);
 
CREATE TABLE Efetuar_Compra(
  id_curso INT,
  cpf_aluno CHAR(11),
  data_hora TIMESTAMP,
  CONSTRAINT efetuar_compra_pk PRIMARY KEY(id_curso, cpf_aluno),
  CONSTRAINT efetuar_compra_curso_fk FOREIGN KEY(id_curso) REFERENCES Curso(id),
  CONSTRAINT efetuar_compra_aluno_fk FOREIGN KEY(cpf_aluno) REFERENCES Aluno(cpf)
);
 
CREATE TABLE Assistir(
  data_hora TIMESTAMP,
  id_curso INT,
  n_aula INT,
  cpf_aluno CHAR(11),
  CONSTRAINT assistir_pk PRIMARY KEY(data_hora, cpf_aluno),
  CONSTRAINT assistir_aula_fk FOREIGN KEY(id_curso, n_aula) REFERENCES Aula(id_curso, n_aula),
  CONSTRAINT assistir_aluno_fk FOREIGN KEY(cpf_aluno) REFERENCES Aluno(cpf)
);
 
CREATE TABLE Presentear(
  cpf_aluno_presenteador CHAR(11),
  cpf_aluno_presenteado CHAR(11),
  id_curso INT,
  CONSTRAINT presentear_pk PRIMARY KEY(cpf_aluno_presenteador, cpf_aluno_presenteado, id_curso),
  CONSTRAINT presentear_curso_fk FOREIGN KEY(id_curso) REFERENCES Curso(id),
  CONSTRAINT presentear_aluno1_fk FOREIGN KEY(cpf_aluno_presenteador) REFERENCES Aluno(cpf),
  CONSTRAINT presentear_aluno2_fk FOREIGN KEY(cpf_aluno_presenteado) REFERENCES Aluno(cpf)
);
