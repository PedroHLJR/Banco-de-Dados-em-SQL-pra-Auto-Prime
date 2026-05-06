-- Consultas úteis para análise e relatórios
USE Loja_carros;
GO

-- ==========================================
-- CONSULTAS DE VENDAS E RELATÓRIOS
-- ==========================================

-- 1. Ranking de vendedores por faturamento
SELECT 
    vd.nome AS Vendedor,
    COUNT(v.id_venda) AS Total_Vendas,
    SUM(v.valor_total) AS Faturamento_Total,
    AVG(v.valor_total) AS Ticket_Medio,
    SUM(v.valor_total * vd.comissao / 100) AS Total_Comissoes
FROM Vendedores vd
LEFT JOIN Vendas v ON vd.id_vendedor = v.id_vendedor
GROUP BY vd.nome, vd.comissao
ORDER BY Faturamento_Total DESC;

-- 2. Veículos mais vendidos por marca
SELECT 
    ve.marca,
    ve.modelo,
    COUNT(v.id_venda) AS Quantidade_Vendida,
    AVG(v.valor_total) AS Preco_Medio
FROM Veiculos ve
JOIN Vendas v ON ve.id_veiculo = v.id_veiculo
GROUP BY ve.marca, ve.modelo
ORDER BY Quantidade_Vendida DESC;

-- 3. Faturamento mensal
SELECT 
    YEAR(data_venda) AS Ano,
    MONTH(data_venda) AS Mes,
    COUNT(*) AS Total_Vendas,
    SUM(valor_total) AS Faturamento,
    AVG(valor_total) AS Ticket_Medio
FROM Vendas
GROUP BY YEAR(data_venda), MONTH(data_venda)
ORDER BY Ano DESC, Mes DESC;

-- 4. Clientes que mais compraram
SELECT 
    c.nome AS Cliente,
    c.telefone,
    c.email,
    COUNT(v.id_venda) AS Total_Compras,
    SUM(v.valor_total) AS Valor_Total_Gasto
FROM Clientes c
JOIN Vendas v ON c.id_cliente = v.id_cliente
GROUP BY c.nome, c.telefone, c.email
ORDER BY Total_Compras DESC, Valor_Total_Gasto DESC;

-- ==========================================
-- CONSULTAS DE ESTOQUE
-- ==========================================

-- 5. Estoque atual por situação
SELECT 
    situacao,
    COUNT(*) AS Quantidade,
    AVG(preco) AS Preco_Medio,
    MIN(preco) AS Menor_Preco,
    MAX(preco) AS Maior_Preco
FROM Veiculos
GROUP BY situacao;

-- 6. Veículos disponíveis ordenados por preço
SELECT 
    marca + ' ' + modelo AS Veiculo,
    ano,
    cor,
    km_rodados,
    FORMAT(preco, 'C', 'pt-BR') AS Preco,
    descricao
FROM Veiculos
WHERE situacao = 'disponivel'
ORDER BY preco ASC;

-- 7. Veículos com maior quilometragem
SELECT TOP 10
    marca + ' ' + modelo AS Veiculo,
    ano,
    km_rodados,
    FORMAT(preco, 'C', 'pt-BR') AS Preco,
    situacao
FROM Veiculos
ORDER BY km_rodados DESC;

-- ==========================================
-- ANÁLISES ESPECÍFICAS
-- ==========================================

-- 8. Formas de pagamento mais utilizadas
SELECT 
    pagamento,
    COUNT(*) AS Quantidade,
    SUM(valor_total) AS Valor_Total,
    AVG(valor_total) AS Ticket_Medio
FROM Vendas
GROUP BY pagamento;

-- 9. Vendas por cidade dos clientes
SELECT 
    e.cidade,
    e.estado,
    COUNT(v.id_venda) AS Total_Vendas,
    SUM(v.valor_total) AS Faturamento
FROM Vendas v
JOIN Clientes c ON v.id_cliente = c.id_cliente
JOIN Enderecos e ON c.id_cliente = e.id_cliente
GROUP BY e.cidade, e.estado
ORDER BY Total_Vendas DESC;

-- 10. Tempo médio entre cadastro e primeira compra
SELECT 
    c.nome AS Cliente,
    c.data_cadastro,
    MIN(v.data_venda) AS Primeira_Compra,
    DATEDIFF(DAY, c.data_cadastro, MIN(v.data_venda)) AS Dias_Ate_Compra
FROM Clientes c
JOIN Vendas v ON c.id_cliente = v.id_cliente
GROUP BY c.nome, c.data_cadastro
ORDER BY Dias_Ate_Compra;

-- ==========================================
-- RELATÓRIOS DETALHADOS
-- ==========================================

-- 11. Relatório completo de vendas
SELECT 
    v.id_venda,
    c.nome AS Cliente,
    c.cpf,
    c.telefone,
    ve.marca + ' ' + ve.modelo AS Veiculo,
    ve.ano,
    ve.placa,
    vd.nome AS Vendedor,
    v.data_venda,
    FORMAT(v.valor_total, 'C', 'pt-BR') AS Valor,
    v.pagamento,
    FORMAT(v.valor_total * vd.comissao / 100, 'C', 'pt-BR') AS Comissao_Vendedor
FROM Vendas v
JOIN Clientes c ON v.id_cliente = c.id_cliente
JOIN Veiculos ve ON v.id_veiculo = ve.id_veiculo
JOIN Vendedores vd ON v.id_vendedor = vd.id_vendedor
ORDER BY v.data_venda DESC;

-- 12. Análise de preços por marca
SELECT 
    marca,
    COUNT(*) AS Quantidade_Estoque,
    AVG(preco) AS Preco_Medio,
    MIN(preco) AS Menor_Preco,
    MAX(preco) AS Maior_Preco,
    AVG(km_rodados) AS KM_Medio
FROM Veiculos
GROUP BY marca
ORDER BY Preco_Medio DESC;

-- ==========================================
-- VIEWS ÚTEIS (OPCIONAL)
-- ==========================================

-- View de veículos disponíveis com detalhes
CREATE VIEW vw_Veiculos_Disponiveis AS
SELECT 
    id_veiculo,
    marca + ' ' + modelo AS Veiculo_Completo,
    ano,
    cor,
    placa,
    km_rodados,
    preco,
    descricao
FROM Veiculos
WHERE situacao = 'disponivel';
GO

-- View de histórico de vendas
CREATE VIEW vw_Historico_Vendas AS
SELECT 
    v.id_venda,
    v.data_venda,
    c.nome AS Cliente,
    ve.marca + ' ' + ve.modelo AS Veiculo,
    vd.nome AS Vendedor,
    v.valor_total,
    v.pagamento
FROM Vendas v
JOIN Clientes c ON v.id_cliente = c.id_cliente
JOIN Veiculos ve ON v.id_veiculo = ve.id_veiculo
JOIN Vendedores vd ON v.id_vendedor = vd.id_vendedor;
GO