-- 1. Recuperação simples com SELECT Statement
-- Listar todos os clientes
SELECT * FROM Cliente;

-- 2. Filtros com WHERE Statement
-- Buscar veículos de uma marca específica
SELECT * FROM Veiculo WHERE marca = 'Volkswagen';

-- 3. Expressões para gerar atributos derivados
-- Calcular o valor total de peças por ordem de serviço
SELECT 
    cod_ordem_servico, 
    SUM(quantidade * valor_unitario) AS valor_total_pecas
FROM Ordem_Servico_Peca
GROUP BY cod_ordem_servico;

-- 4. Ordenação com ORDER BY
-- Listar serviços ordenados pelo valor padrão do mais caro para o mais barato
SELECT nome, valor_padrao 
FROM Servico 
ORDER BY valor_padrao DESC;

-- 5. Junção entre tabelas para perspectiva complexa
-- Detalhes completos de ordens de serviço com informações do cliente e veículo
SELECT 
    os.cod_ordem_servico,
    c.nome AS nome_cliente,
    v.modelo AS modelo_veiculo,
    v.placa,
    os.data_entrada,
    os.status,
    os.valor_total
FROM Ordem_Servico os
JOIN Veiculo v ON os.cod_veiculo = v.cod_veiculo
JOIN Cliente c ON v.cod_cliente = c.cod_cliente;

-- 6. Query com HAVING - Filtro de grupo
-- Encontrar clientes com mais de um veículo
SELECT 
    c.cod_cliente,
    c.nome,
    COUNT(v.cod_veiculo) AS quantidade_veiculos
FROM Cliente c
JOIN Veiculo v ON c.cod_cliente = v.cod_cliente
GROUP BY c.cod_cliente, c.nome
HAVING COUNT(v.cod_veiculo) > 1;

-- 7. Query complexa - Serviços mais realizados
SELECT 
    s.nome AS servico,
    COUNT(oss.cod_servico) AS total_realizacoes,
    SUM(oss.valor_unitario) AS valor_total
FROM Servico s
JOIN Ordem_Servico_Servico oss ON s.cod_servico = oss.cod_servico
GROUP BY s.cod_servico, s.nome
ORDER BY total_realizacoes DESC;

-- 8. Análise de pagamentos
SELECT 
    forma_pagamento,
    status_pagamento,
    COUNT(*) AS total_pagamentos,
    SUM(valor_total) AS valor_total
FROM Pagamento
GROUP BY forma_pagamento, status_pagamento
ORDER BY valor_total DESC;

-- 9. Relatório de Ordens de Serviço por Cliente
SELECT 
    c.nome AS cliente,
    COUNT(os.cod_ordem_servico) AS total_ordens,
    AVG(os.valor_total) AS media_valor_ordens
FROM Cliente c
JOIN Veiculo v ON c.cod_cliente = v.cod_cliente
JOIN Ordem_Servico os ON v.cod_veiculo = os.cod_veiculo
GROUP BY c.cod_cliente, c.nome
ORDER BY total_ordens DESC;

-- 10. Query com subquery - Peças com estoque abaixo da média
SELECT 
    nome,
    marca,
    quantidade_estoque,
    valor_unitario
FROM Peca
WHERE quantidade_estoque < (
    SELECT AVG(quantidade_estoque) 
    FROM Peca
);