-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS ecommerce_sa;


USE ecommerce_sa;


CREATE TABLE Cliente (
    id_cliente       INT AUTO_INCREMENT PRIMARY KEY,
    nome             VARCHAR(100) NOT NULL,
    email            VARCHAR(150) NOT NULL UNIQUE,
    senha            VARCHAR(255) NOT NULL,
    endereco_entrega VARCHAR(255) NOT NULL
);


CREATE TABLE Categoria (
    id_categoria   INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(100) NOT NULL UNIQUE
);


CREATE TABLE Produto (
    id_produto   INT AUTO_INCREMENT PRIMARY KEY,
    id_categoria INT NOT NULL,
    nome         VARCHAR(150) NOT NULL,
    preco        DECIMAL(10,2) NOT NULL CHECK (preco >= 0),
    imagem_url   VARCHAR(255),
    CONSTRAINT fk_produto_categoria
        FOREIGN KEY (id_categoria) REFERENCES Categoria (id_categoria)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);


CREATE TABLE PedidoCompra (
    id_pedido       INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente      INT NOT NULL,
    data_compra     DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    forma_pagamento VARCHAR(50) NOT NULL,
    total_pagar     DECIMAL(10,2) NOT NULL CHECK (total_pagar >= 0),
    CONSTRAINT fk_pedido_cliente
        FOREIGN KEY (id_cliente) REFERENCES Cliente (id_cliente)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);