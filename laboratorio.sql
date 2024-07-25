drop schema if exists laboratorio;
CREATE SCHEMA laboratorio;

use laboratorio;

CREATE TABLE tipo_exame(
  codtipoexame INTEGER,
  nome VARCHAR(100) not null,
  descricao VARCHAR(500),
  primary key (codtipoexame)
);

CREATE TABLE departamento(
  coddepartamento INTEGER,
  nome VARCHAR(30) not null,
  cpfgerente CHAR(11) not null, 
  primary key (coddepartamento)
);

CREATE TABLE funcionario(
  cpf CHAR(11) not null,
  nome VARCHAR(200) not null,
  datanascimento DATE,
  cargo VARCHAR(50) not null,
  genero VARCHAR(20), 
  salario NUMERIC(5) not null,
  endereco VARCHAR(100) not null,
  coddepartamento	 INTEGER,
  primary key (cpf),
  foreign key (coddepartamento) references departamento(coddepartamento)
);

CREATE TABLE pessoa(
  cpf CHAR(11) not null,
  nome VARCHAR(200) not null,
  datanascimento DATE,
  cpfresponsavel CHAR(11),
  sexo CHAR(1) not null,
  telefone VARCHAR(20) not null,
  primary key (cpf),
  foreign key (cpfresponsavel) references pessoa(cpf)
);

CREATE TABLE exame(
  codexame INTEGER,
  cpfpaciente CHAR(11) not null, 
  cpfprofissionalresponsavel CHAR(11) not null,
  datarealizacao DATE,
  dataentrega DATE,
  codtipoexame INTEGER not null,
  descricaoresultado VARCHAR (200), 
  primary key(codexame),
  foreign key (cpfpaciente) references pessoa(cpf), 
  foreign key (cpfprofissionalresponsavel) references funcionario(cpf),
  foreign key (codtipoexame) references tipo_exame(codtipoexame)
);
