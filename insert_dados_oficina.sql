-- Inserir Clientes
INSERT INTO Cliente (nome, cpf, telefone, email) VALUES
('João Silva', '123.456.789-00', '(11) 98765-4321', 'joao.silva@email.com'),
('Maria Souza', '987.654.321-00', '(21) 97654-3210', 'maria.souza@email.com'),
('Pedro Santos', '456.789.123-00', '(31) 96543-2109', 'pedro.santos@email.com'),
('Ana Oliveira', '789.123.456-00', '(41) 95432-1098', 'ana.oliveira@email.com'),
('Carlos Ferreira', '234.567.891-00', '(51) 94321-0987', 'carlos.ferreira@email.com');

-- Inserir Veículos
INSERT INTO Veiculo (cod_cliente, placa, modelo, marca, ano, cor) VALUES
(1, 'ABC-1234', 'Gol', 'Volkswagen', 2018, 'Prata'),
(2, 'DEF-5678', 'Civic', 'Honda', 2019, 'Preto'),
(3, 'GHI-9012', 'Corolla', 'Toyota', 2020, 'Branco'),
(4, 'JKL-3456', 'Fusion', 'Ford', 2017, 'Azul'),
(5, 'MNO-7890', 'Creta', 'Hyundai', 2021, 'Vermelho');

-- Inserir Serviços
INSERT INTO Servico (nome, descricao, valor_padrao) VALUES
('Troca de Óleo', 'Troca completa do óleo do motor', 150.00),
('Alinhamento', 'Alinhamento e balanceamento', 100.00),
('Revisão Freios', 'Inspeção e manutenção do sistema de freios', 250.00),
('Troca de Pneus', 'Substituição de pneus', 300.00),
('Diagnóstico Eletrônico', 'Verificação completa dos sistemas eletrônicos', 200.00);

-- Inserir Peças
INSERT INTO Peca (nome, marca, valor_unitario, quantidade_estoque) VALUES
('Filtro de Óleo', 'Fram', 25.00, 50),
('Pastilha de Freio', 'Bosch', 80.00, 30),
('Correia Dentada', 'Gates', 150.00, 20),
('Vela de Ignição', 'NGK', 35.00, 100),
('Amortecedor', 'Monroe', 250.00, 15);

-- Inserir Ordens de Serviço
INSERT INTO Ordem_Servico (cod_veiculo, data_entrada, data_saida, status, valor_total) VALUES
(1, '2024-02-01 09:00:00', '2024-02-02 14:30:00', 'Concluída', 500.00),
(2, '2024-02-05 10:30:00', '2024-02-06 16:45:00', 'Concluída', 750.00),
(3, '2024-02-10 11:15:00', NULL, 'Em Andamento', 350.00),
(4, '2024-02-15 14:00:00', '2024-02-16 11:20:00', 'Concluída', 600.00),
(5, '2024-02-20 08:45:00', NULL, 'Em Andamento', 450.00);

-- Inserir Ordem_Servico_Servico
INSERT INTO Ordem_Servico_Servico (cod_ordem_servico, cod_servico, quantidade, valor_unitario) VALUES
(1, 1, 1, 150.00),
(1, 2, 1, 100.00),
(2, 3, 1, 250.00),
(2, 4, 1, 300.00),
(3, 5, 1, 200.00),
(4, 1, 1, 150.00),
(4, 3, 1, 250.00),
(5, 2, 1, 100.00);

-- Inserir Ordem_Servico_Peca
INSERT INTO Ordem_Servico_Peca (cod_ordem_servico, cod_peca, quantidade, valor_unitario) VALUES
(1, 1, 1, 25.00),
(2, 2, 2, 80.00),
(3, 4, 4, 35.00),
(4, 3, 1, 150.00),
(5, 5, 2, 250.00);

-- Inserir Pagamentos
INSERT INTO Pagamento (cod_ordem_servico, data_pagamento, valor_total, forma_pagamento, status_pagamento) VALUES
(1, '2024-02-02 14:45:00', 500.00, 'Cartão de Crédito', 'Pago'),
(2, '2024-02-06 17:00:00', 750.00, 'PIX', 'Pago'),
(3, '2024-02-10 11:30:00', 350.00, 'Boleto', 'Pendente'),
(4, '2024-02-16 11:35:00', 600.00, 'Dinheiro', 'Pago'),
(5, '2024-02-20 09:00:00', 450.00, 'Cartão de Débito', 'Pendente');