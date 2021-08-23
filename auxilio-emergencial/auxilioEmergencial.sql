CREATE TABLE Estado (
    uf CHAR(2), --Primary Key
    descricao VARCHAR2(25),
    CONSTRAINT PkEstado PRIMARY KEY(uf)
);

CREATE TABLE Cidade (
    numero NUMBER(8), --Primary Key
    estadoUf CHAR(2), --Foreign Key
    descricao VARCHAR2(50),
    CONSTRAINT PkCidade PRIMARY KEY(numero),
    CONSTRAINT FkCidadeEstado FOREIGN KEY(estadoUf) REFERENCES Estado
);

CREATE TABLE EstadoCivil (
    id NUMBER(2), --Primary Key
    descricao VARCHAR2(20),
    CONSTRAINT PkEstadoCivil PRIMARY KEY(id)
);

CREATE TABLE Banco (
    codigo NUMBER(3), --Primary Key
    nome VARCHAR2(50),
    CONSTRAINT PkBanco PRIMARY KEY(codigo)
);

CREATE TABLE Pessoa (
    cpf NUMBER(11), --Primary Key
    estadoCivilId NUMBER(2), --Foreign Key
    bancoCodigo NUMBER(3), --Foreign Key
    cidadeNumero NUMBER(8), --Foreign Key
    nome VARCHAR2(70),
    sexo CHAR(1),
    nacimento DATE,
    dataCadastro DATE,
    email VARCHAR2(40),
    celular NUMBER(11),
    telefone NUMBER(10),
    temFilhos CHAR(1),
    qtdeFilho NUMBER(2),
    numeroAgencia NUMBER(4),
    digitoAgencia CHAR(1),
    numeroConta NUMBER(8),
    digitoConta CHAR(1),
    CONSTRAINT PkPessoa PRIMARY KEY(cpf),
    CONSTRAINT FkPessoaEstadoCivil FOREIGN KEY(estadoCivilId) REFERENCES EstadoCivil,
    CONSTRAINT FkPessoaBanco FOREIGN key(bancoCodigo) REFERENCES Banco,
    CONSTRAINT FkPessoaCidade FOREIGN KEY(cidadeNumero) REFERENCES Cidade,
    CONSTRAINT CheckPessoaSexo CHECK(sexo='M' OR sexo ='F'),
    CONSTRAINT CheckPessoaTemFilho CHECK(temFilho='S' or temFilho='N')
);

CREATE TABLE Pagamento (
    mesAno CHAR(6), --Primary Key
    pessoaCpf NUMBER(11), --Foreign Key 
    dataPagamento DATE,
    valor NUMBER(7,2),
    CONSTRAINT PkPagamento PRIMARY KEY(pessoaCpf, mesAno),
    CONSTRAINT FkPagamentoPessoa FOREIGN KEY(pessoaCpf) REFERENCES Pessoa
);
