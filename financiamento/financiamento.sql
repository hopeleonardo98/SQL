CREATE TABLE Tipo (
    id CHAR(1), --Primary Key
    descricao VARCHAR2(15),
    CONSTRAINT PkTipo PRIMARY KEY(id)
);

CREATE TABLE Categoria (
    id CHAR(1), --Primary Key
    descricao VARCHAR2(15),
    CONSTRAINT PkCategoria PRIMARY KEY(id)
);

CREATE TABLE DespesaReceita (
    codigo NUMBER(5), --Primary Key
    categoriaId CHAR(1), --Foreign Key
    tipoId CHAR(1), --Foreign Key
    descricao VARCHAR2(70),
    dia NUMER(2),
    CONSTRAINT PkDespesaReceita PRIMARY KEY(codigo),
    CONSTRAINT FkDespesaReceitaCategoria FOREIGN KEY(categoriaId) REFERENCES Categoria,
    CONSTRAINT FkDespesaReceitaTipo FOREIGN KEY(tipoId) REFERENCES Tipo
);

CREATE TABLE Lancamento (
    mesAno CHAR(6), --Primary Key
    despesaReceitaCodigo NUMBER(5), --Foreign Key
    valor NUMBER(9,2),
    CONSTRAINT PkLancamento PRIMARY KEY(despesaReceitaCodigo, mesAno),
    CONSTRAINT FkLancamentoDespesaReceita FOREIGN KEY(despesaReceitaCodigo) REFERENCES DespesaReceita
);