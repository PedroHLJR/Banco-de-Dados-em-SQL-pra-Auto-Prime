-- Stored Precedure para inserir um cliente
USE Loja_carros
GO

	CREATE PROCEDURE sp_InsereCliente
		@nome VARCHAR(100),
		@cpf VARCHAR(11),
		@telefone VARCHAR(20),
		@email VARCHAR(100),
		@data_cadastro DATETIME = NULL
	AS
	BEGIN
    
    -- Se data de cadastro não for informada, usa a data atual
    IF @data_cadastro IS NULL
        SET @data_cadastro = GETDATE();
    
        
        -- Inserção dos dados
        INSERT INTO Clientes (nome, cpf, telefone, email, data_cadastro)
        VALUES (@nome, @cpf, @telefone, @email, @data_cadastro);
        
        
	END;