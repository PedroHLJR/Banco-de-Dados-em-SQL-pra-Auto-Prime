-- Stored Procedure para inserir veículos

USE Loja_carros
GO

	CREATE PROCEDURE sp_InsereVeiculo
		@marca VARCHAR(50),
		@modelo VARCHAR(50),
		@ano INT,
		@cor VARCHAR(30),
		@placa VARCHAR(10),
		@chassi VARCHAR(17),
		@km_rodados INT,
		@preco DECIMAL(10,2),
		@situacao VARCHAR(50),
		@descricao text 
		
		AS
        BEGIN
        -- Inserção dos dados
        INSERT INTO Veiculos(marca, modelo, ano, cor, placa, chassi, km_rodados, preco, situacao, descricao)
        VALUES (@marca, @modelo, @ano, @cor, @placa, @chassi, @km_rodados, @preco, @situacao, @descricao)
        
		END;
		GO