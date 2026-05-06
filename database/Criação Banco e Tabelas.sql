-- Criação do banco de dados
CREATE DATABASE Loja_carros;
GO
USE Loja_carros;

-- Tabela de Clientes
CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY IDENTITY,
    nome VARCHAR(100),
    cpf VARCHAR(14) UNIQUE,
    telefone VARCHAR(15),
    email VARCHAR(100),
    data_cadastro DATETIME,
);

-- Tabela de Endereços
CREATE TABLE Enderecos (
    id_endereco INT PRIMARY KEY IDENTITY,
    id_cliente INT NOT NULL,
    numero VARCHAR(10),
    complemento VARCHAR(50),
    bairro VARCHAR(50),
    cidade VARCHAR(50) NOT NULL,
    estado CHAR(2) NOT NULL,
    cep VARCHAR(9),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);


-- Tabela de Veículos
CREATE TABLE Veiculos (
    id_veiculo INT PRIMARY KEY IDENTITY,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    ano INT NOT NULL,
    cor VARCHAR(30),
    placa VARCHAR(10) UNIQUE,
    chassi VARCHAR(17) UNIQUE,
    km_rodados INT,
    preco DECIMAL(10,2) NOT NULL,
	situacao VARCHAR(50) DEFAULT ('disponivel'),
    descricao TEXT
);
	-- Script para checar a situação
	ALTER TABLE Veiculos
	ADD CONSTRAINT CK_situacao CHECK (situacao IN ('disponivel', 'vendido', 'reservado'));

-- Tabela de Vendedores
CREATE TABLE Vendedores (
    id_vendedor INT PRIMARY KEY IDENTITY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE,
    telefone VARCHAR(15),
    email VARCHAR(100),
    data_admissao DATETIME,
    comissao DECIMAL(5,2) DEFAULT 0.0
	);

	-- Tabela de Vendas
CREATE TABLE Vendas (
    id_venda INT PRIMARY KEY IDENTITY,
    id_cliente INT,
    id_veiculo INT,
    id_vendedor INT,
    data_venda DATETIME,
    valor_total DECIMAL(10,2),
	pagamento varchar(50),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_veiculo) REFERENCES veiculos(id_veiculo),
    FOREIGN KEY (id_vendedor) REFERENCES vendedores(id_vendedor)
);

	-- Script para checar o método do pagamento
	ALTER TABLE Vendas
	ADD CONSTRAINT CK_pagamento CHECK (pagamento IN ('à vista', 'parcelado'));
