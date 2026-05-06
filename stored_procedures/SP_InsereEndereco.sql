-- Stored Procedure para inserir o endereço

USE Loja_carros
GO

	CREATE PROCEDURE sp_InsereEndereco
		@id_cliente int,
		@numero VARCHAR(10),
		@complemento VARCHAR(20),
		@bairro VARCHAR(50),
		@cidade VARCHAR(50),
		@estado CHAR(2),
		@cep VARCHAR(9)
		
		AS
        BEGIN
        -- Inserção dos dados
        INSERT INTO Enderecos (id_cliente, numero, complemento, bairro, cidade, estado, cep)
        VALUES (@id_cliente, @numero, @complemento, @bairro, @cidade, @estado, @cep)
        
		END;
		GO