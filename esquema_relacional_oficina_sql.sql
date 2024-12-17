-- Criação do Banco de Dados
CREATE DATABASE oficina;
USE oficina;

-- Tabela Cliente
CREATE TABLE Cliente (
    cod_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    telefone VARCHAR(15),
    email VARCHAR(100)
);

-- Tabela Veículo
CREATE TABLE Veiculo (
    cod_veiculo INT AUTO_INCREMENT PRIMARY KEY,
    cod_cliente INT NOT NULL,
    placa VARCHAR(10) UNIQUE NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    marca VARCHAR(50) NOT NULL,
    ano INT NOT NULL,
    cor VARCHAR(30),
    FOREIGN KEY (cod_cliente) REFERENCES Cliente(cod_cliente)
);

-- Tabela Serviço
CREATE TABLE Servico (
    cod_servico INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    valor_padrao DECIMAL(10,2) NOT NULL
);

-- Tabela Ordem de Serviço
CREATE TABLE Ordem_Servico (
    cod_ordem_servico INT AUTO_INCREMENT PRIMARY KEY,
    cod_veiculo INT NOT NULL,
    data_entrada DATETIME NOT NULL,
    data_saida DATETIME,
    status VARCHAR(20) NOT NULL,
    valor_total DECIMAL(10,2),
    FOREIGN KEY (cod_veiculo) REFERENCES Veiculo(cod_veiculo)
);

-- Tabela Ordem_Servico_Servico (Relacionamento)
CREATE TABLE Ordem_Servico_Servico (
    cod_ordem_servico INT NOT NULL,
    cod_servico INT NOT NULL,
    quantidade INT NOT NULL,
    valor_unitario DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (cod_ordem_servico, cod_servico),
    FOREIGN KEY (cod_ordem_servico) REFERENCES Ordem_Servico(cod_ordem_servico),
    FOREIGN KEY (cod_servico) REFERENCES Servico(cod_servico)
);

-- Tabela Peça
CREATE TABLE Peca (
    cod_peca INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    marca VARCHAR(50) NOT NULL,
    valor_unitario DECIMAL(10,2) NOT NULL,
    quantidade_estoque INT NOT NULL
);

-- Tabela Ordem_Servico_Peca (Relacionamento)
CREATE TABLE Ordem_Servico_Peca (
    cod_ordem_servico INT NOT NULL,
    cod_peca INT NOT NULL,
    quantidade INT NOT NULL,
    valor_unitario DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (cod_ordem_servico, cod_peca),
    FOREIGN KEY (cod_ordem_servico) REFERENCES Ordem_Servico(cod_ordem_servico),
    FOREIGN KEY (cod_peca) REFERENCES Peca(cod_peca)
);

-- Tabela Pagamento
CREATE TABLE Pagamento (
    cod_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    cod_ordem_servico INT NOT NULL,
    data_pagamento DATETIME NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    forma_pagamento VARCHAR(30) NOT NULL,
    status_pagamento VARCHAR(20) NOT NULL,
    FOREIGN KEY (cod_ordem_servico) REFERENCES Ordem_Servico(cod_ordem_servico)
);