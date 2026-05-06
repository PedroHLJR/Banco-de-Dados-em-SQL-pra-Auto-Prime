-- Script com dados de exemplo para teste do sistema
USE Loja_carros;
GO

-- ==========================================
-- INSERINDO CLIENTES
-- ==========================================

-- Cliente 1
EXEC sp_InsereCliente 
    @nome = 'João Silva',
    @cpf = '12345678900',
    @telefone = '(32)99999-1111',
    @email = 'joao.silva@email.com';

-- Cliente 2
EXEC sp_InsereCliente 
    @nome = 'Maria Santos',
    @cpf = '98765432100',
    @telefone = '(32)99999-2222',
    @email = 'maria.santos@email.com';

-- Cliente 3
EXEC sp_InsereCliente 
    @nome = 'Carlos Oliveira',
    @cpf = '45678912300',
    @telefone = '(32)99999-3333',
    @email = 'carlos.oliveira@email.com';

-- Cliente 4
EXEC sp_InsereCliente 
    @nome = 'Ana Costa',
    @cpf = '78912345600',
    @telefone = '(32)99999-4444',
    @email = 'ana.costa@email.com';

-- ==========================================
-- INSERINDO ENDEREÇOS
-- ==========================================

-- Endereço Cliente 1
EXEC sp_InsereEndereco
    @id_cliente = 1,
    @numero = '123',
    @complemento = 'Apto 101',
    @bairro = 'Centro',
    @cidade = 'Juiz de Fora',
    @estado = 'MG',
    @cep = '36010-000';

-- Endereço Cliente 2
EXEC sp_InsereEndereco
    @id_cliente = 2,
    @numero = '456',
    @complemento = 'Casa',
    @bairro = 'São Mateus',
    @cidade = 'Juiz de Fora',
    @estado = 'MG',
    @cep = '36025-000';

-- Endereço Cliente 3
EXEC sp_InsereEndereco
    @id_cliente = 3,
    @numero = '789',
    @complemento = NULL,
    @bairro = 'Manoel Honório',
    @cidade = 'Juiz de Fora',
    @estado = 'MG',
    @cep = '36050-000';

-- Endereço Cliente 4
EXEC sp_InsereEndereco
    @id_cliente = 4,
    @numero = '321',
    @complemento = 'Bloco B',
    @bairro = 'Bom Pastor',
    @cidade = 'Juiz de Fora',
    @estado = 'MG',
    @cep = '36021-000';

-- ==========================================
-- INSERINDO VENDEDORES
-- ==========================================

-- Vendedor 1
EXEC sp_InsereVendedor
    @nome = 'Roberto Alves',
    @cpf = '11122233344',
    @telefone = '(32)98888-1111',
    @email = 'roberto.alves@loja.com',
    @comissao = 2.50;

-- Vendedor 2
EXEC sp_InsereVendedor
    @nome = 'Juliana Martins',
    @cpf = '55566677788',
    @telefone = '(32)98888-2222',
    @email = 'juliana.martins@loja.com',
    @comissao = 3.00;

-- Vendedor 3
EXEC sp_InsereVendedor
    @nome = 'Fernando Lima',
    @cpf = '99988877766',
    @telefone = '(32)98888-3333',
    @email = 'fernando.lima@loja.com',
    @comissao = 2.00;

-- ==========================================
-- INSERINDO VEÍCULOS
-- ==========================================

-- Veículo 1
EXEC sp_InsereVeiculo
    @marca = 'Toyota',
    @modelo = 'Corolla',
    @ano = 2023,
    @cor = 'Prata',
    @placa = 'ABC-1234',
    @chassi = '9BWZZZ377VT004251',
    @km_rodados = 15000,
    @preco = 125000.00,
    @situacao = 'disponivel',
    @descricao = 'Veículo em excelente estado, único dono';

-- Veículo 2
EXEC sp_InsereVeiculo
    @marca = 'Honda',
    @modelo = 'Civic',
    @ano = 2022,
    @cor = 'Preto',
    @placa = 'DEF-5678',
    @chassi = '8AFZZZ123XT008965',
    @km_rodados = 25000,
    @preco = 115000.00,
    @situacao = 'disponivel',
    @descricao = 'Revisões em dia, IPVA pago';

-- Veículo 3
EXEC sp_InsereVeiculo
    @marca = 'Volkswagen',
    @modelo = 'Jetta',
    @ano = 2021,
    @cor = 'Branco',
    @placa = 'GHI-9012',
    @chassi = '7CDXXX456YT002134',
    @km_rodados = 40000,
    @preco = 98000.00,
    @situacao = 'disponivel',
    @descricao = 'Completo, bancos de couro';

-- Veículo 4
EXEC sp_InsereVeiculo
    @marca = 'Chevrolet',
    @modelo = 'Onix',
    @ano = 2024,
    @cor = 'Vermelho',
    @placa = 'JKL-3456',
    @chassi = '6BEXXX789ZT005678',
    @km_rodados = 5000,
    @preco = 78000.00,
    @situacao = 'disponivel',
    @descricao = 'Zero km, modelo 2024';

-- Veículo 5
EXEC sp_InsereVeiculo
    @marca = 'Hyundai',
    @modelo = 'HB20',
    @ano = 2022,
    @cor = 'Azul',
    @placa = 'MNO-7890',
    @chassi = '5AFXXX321WT003456',
    @km_rodados = 30000,
    @preco = 65000.00,
    @situacao = 'disponivel',
    @descricao = 'Econômico, ideal para cidade';

-- Veículo 6
EXEC sp_InsereVeiculo
    @marca = 'Fiat',
    @modelo = 'Argo',
    @ano = 2023,
    @cor = 'Cinza',
    @placa = 'PQR-1357',
    @chassi = '4CDXXX654YT007890',
    @km_rodados = 18000,
    @preco = 70000.00,
    @situacao = 'disponivel',
    @descricao = 'Ar condicionado, direção elétrica';

-- ==========================================
-- INSERINDO VENDAS
-- ==========================================

-- Venda 1 - Cliente 1 compra Corolla
EXEC sp_InsereVenda
    @id_cliente = 1,
    @id_veiculo = 1,
    @id_vendedor = 1,
    @data_venda = '2024-03-15',
    @valor_total = 125000.00,
    @pagamento = 'à vista';

-- Atualizar situação do veículo vendido
UPDATE Veiculos SET situacao = 'vendido' WHERE id_veiculo = 1;

-- Venda 2 - Cliente 2 compra Civic
EXEC sp_InsereVenda
    @id_cliente = 2,
    @id_veiculo = 2,
    @id_vendedor = 2,
    @data_venda = '2024-04-10',
    @valor_total = 115000.00,
    @pagamento = 'parcelado';

-- Atualizar situação do veículo vendido
UPDATE Veiculos SET situacao = 'vendido' WHERE id_veiculo = 2;

-- Venda 3 - Cliente 3 compra HB20
EXEC sp_InsereVenda
    @id_cliente = 3,
    @id_veiculo = 5,
    @id_vendedor = 3,
    @data_venda = '2024-04-20',
    @valor_total = 65000.00,
    @pagamento = 'à vista';

-- Atualizar situação do veículo vendido
UPDATE Veiculos SET situacao = 'vendido' WHERE id_veiculo = 5;

-- ==========================================
-- CONSULTAS PARA VERIFICAÇÃO
-- ==========================================

-- Ver todos os clientes com endereços
SELECT 
    c.nome,
    c.cpf,
    c.telefone,
    e.bairro,
    e.cidade,
    e.estado
FROM Clientes c
LEFT JOIN Enderecos e ON c.id_cliente = e.id_cliente;

-- Ver veículos disponíveis
SELECT 
    marca,
    modelo,
    ano,
    cor,
    preco,
    km_rodados,
    situacao
FROM Veiculos
WHERE situacao = 'disponivel'
ORDER BY preco DESC;

-- Ver vendas realizadas
SELECT 
    v.id_venda,
    c.nome AS Cliente,
    ve.marca + ' ' + ve.modelo AS Veiculo,
    vd.nome AS Vendedor,
    v.data_venda,
    v.valor_total,
    v.pagamento
FROM Vendas v
JOIN Clientes c ON v.id_cliente = c.id_cliente
JOIN Veiculos ve ON v.id_veiculo = ve.id_veiculo
JOIN Vendedores vd ON v.id_vendedor = vd.id_vendedor
ORDER BY v.data_venda DESC;