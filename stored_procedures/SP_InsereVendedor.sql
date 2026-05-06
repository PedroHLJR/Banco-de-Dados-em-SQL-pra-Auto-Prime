USE Loja_carros
GO

CREATE PROCEDURE sp_InsereVendedor
    @nome VARCHAR(100),
    @cpf VARCHAR(14),
    @telefone VARCHAR(15),
    @email VARCHAR(100) = NULL,
    @data_admissao DATETIME = NULL,
    @comissao DECIMAL(5,2) = 0.00
AS
BEGIN 
        
        -- Se data_admissao não for informada, usa a data atual
        IF @data_admissao IS NULL
            SET @data_admissao = GETDATE();
        
        -- Inserção dos dados
        INSERT INTO Vendedores (
            nome, 
            cpf, 
            telefone, 
            email, 
            data_admissao, 
            comissao)
         VALUES (
            @nome, 
            @cpf, 
            @telefone, 
            @email, 
            @data_admissao, 
            @comissao
        );
        
END
GO