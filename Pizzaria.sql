CREATE DATABASE pizzaria;

USE pizzaria;

CREATE TABLE clientes(
 idCliente INT PRIMARY KEY  AUTO_INCREMENT,
 nome      VARCHAR(100) NOT NULL,
 telefone  VARCHAR(11)  NOT NULL,
 endereco  VARCHAR(150) NOT NULL
);

CREATE TABLE bebidas(
idBebida    INT PRIMARY KEY AUTO_INCREMENT,
saborBebida VARCHAR(50) NOT NULL,
precoSaborB FLOAT(5,2) NOT NULL
);

CREATE TABLE massas(
idMassa   INT PRIMARY KEY AUTO_INCREMENT,
tipoMassa VARCHAR(40) NOT NULL
);

CREATE TABLE bordas(
idBorda INT PRIMARY KEY AUTO_INCREMENT,
tipoBorda VARCHAR(50) NOT NULL,
precoBorda FLOAT(4,2) NOT NULL
);

CREATE TABLE ingredientes(
idIngrediente   INT PRIMARY KEY AUTO_INCREMENT,
nomeIngrediente VARCHAR(50) NOT NULL,
qtdDispo        INT NOT NULL
);

CREATE TABLE saboresPizzas(
idSaborPizza    INT PRIMARY KEY AUTO_INCREMENT,
saborPizza      VARCHAR(50) NOT NULL,
precoSaborP     FLOAT(5,2)  NOT NULL,
fkIdIngrediente INT NOT NULL,

FOREIGN KEY (fkidIngrediente) REFERENCES ingredientes (idIngrediente)
);

CREATE TABLE pizzas(
idPizza         INT PRIMARY KEY AUTO_INCREMENT,
fkIdSaborPizza  INT NOT NULL,
fkIdBorda       INT NOT NULL,
fkIdMassa       INT NOT NULL,

FOREIGN KEY (fkIdSaborPizza) REFERENCES saborespizzas (idSaborPizza),
FOREIGN KEY (fkIdBorda)      REFERENCES bordas        (idBorda),
FOREIGN KEY (fkIdMassa)      REFERENCES massas        (idMassa)
);

CREATE TABLE pedidos(
notaFiscal  INT PRIMARY KEY AUTO_INCREMENT,
valorTotal  FLOAT(9, 2) NOT NULL DEFAULT 0.00,
qtdBebidas  INT NOT NULL DEFAULT 0,
qtdPizas    INT NOT NULL DEFAULT 0,
fkIdCliente INT,
fkIdBebida  INT,
fkIdPizza   INT,

FOREIGN KEY (fkIdCliente) REFERENCES clientes (idCliente),
FOREIGN KEY (fkIdBebida)  REFERENCES bebidas  (idBebida),
FOREIGN KEY (fkIdPizza)   REFERENCES pizzas   (idPizza)

);

CREATE TABLE fornadas(
idFornada    INT PRIMARY KEY AUTO_INCREMENT,
dataHora     DATETIME,
fkNotaFiscal INT NOT NULL,

FOREIGN KEY (fkNotaFiscal) REFERENCES pedidos (notaFiscal)
);