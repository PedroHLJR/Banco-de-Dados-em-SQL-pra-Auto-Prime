-- Stored Procedure para inserir vendas

USE Loja_carros
GO

	CREATE PROCEDURE sp_InsereVenda
		@id_cliente INT,
		@id_veiculo INT,
		@id_vendedor INT,
		@data_venda DATETIME,
		@valor_total DECIMAL(10,2),
		@pagamento VARCHAR(50)
		
		AS
        BEGIN
        -- Inserção dos dados
        INSERT INTO Vendas (id_cliente, id_veiculo, id_vendedor, data_venda, valor_total, pagamento)
        VALUES (@id_cliente, @id_veiculo, @id_vendedor, @data_venda, @valor_total, @pagamento)
        
		END;
		GO