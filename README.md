# 🚗 Sistema de Gerenciamento para Loja de Veículos

Banco de dados relacional desenvolvido em SQL Server para gerenciar operações completas de uma concessionária de veículos.

## 📋 Sobre o Projeto

Este foi meu primeiro projeto em SQL, desenvolvido durante meus estudos de Ciência da Computação na UFJF. O sistema contempla todas as operações essenciais de uma loja de veículos, desde o cadastro de clientes até o registro de vendas.

## 🛠️ Tecnologias Utilizadas

- **SQL Server** - Sistema de gerenciamento de banco de dados
- **T-SQL** - Linguagem para procedures e queries
- **Stored Procedures** - Automação de inserções

## 📊 Estrutura do Banco de Dados

O sistema é composto por 5 tabelas principais:

### **Clientes**
- Cadastro completo de clientes
- CPF único
- Informações de contato
- Data de cadastro automática

### **Endereços**
- Vínculo com clientes (1:N)
- Dados completos de localização
- Suporte a múltiplos endereços por cliente

### **Veículos**
- Informações detalhadas (marca, modelo, ano, cor)
- Identificação única (placa, chassi)
- Controle de quilometragem e preço
- Status do veículo: `disponível`, `vendido`, `reservado`

### **Vendedores**
- Cadastro de equipe de vendas
- Sistema de comissões
- CPF único
- Data de admissão

### **Vendas**
- Registro completo de transações
- Vincula cliente, veículo e vendedor
- Controle de forma de pagamento: `à vista` ou `parcelado`
- Valor total da venda

## ⚙️ Funcionalidades

- ✅ Cadastro automatizado via Stored Procedures
- ✅ Validação de dados com constraints (CHECK, UNIQUE)
- ✅ Relacionamentos entre tabelas (chaves estrangeiras)
- ✅ Valores padrão inteligentes (data atual, status inicial)
- ✅ Integridade referencial garantida

## 🚀 Como Executar

1. **Clone o repositório**
```bash
git clone https://github.com/PedroHLJR/sistema-loja-veiculos.git
```

2. **Execute o script de criação**
- Abra o SQL Server Management Studio (SSMS)
- Execute o arquivo `Criação Banco e Tabelas.sql`

3. **Crie as Stored Procedures**
- Execute os arquivos da pasta `/stored_procedures` na seguinte ordem:
  - `SP_InsereCliente.sql`
  - `SP_InsereEndereco.sql`
  - `SP_InsereVeiculo.sql`
  - `SP_InsereVendedor.sql`
  - `SP_Venda.sql`

## 📝 Exemplo de Uso

```sql
-- Inserir um cliente
EXEC sp_InsereCliente 
    @nome = 'João Silva',
    @cpf = '12345678900',
    @telefone = '(32)99999-9999',
    @email = 'joao@email.com';

-- Inserir um veículo
EXEC sp_InsereVeiculo
    @marca = 'Toyota',
    @modelo = 'Corolla',
    @ano = 2023,
    @cor = 'Prata',
    @placa = 'ABC-1234',
    @chassi = '9BWZZZ377VT004251',
    @km_rodados = 15000,
    @preco = 85000.00,
    @situacao = 'disponivel',
    @descricao = 'Veículo em excelente estado';
```

## 📁 Estrutura do Repositório

```
📦 sistema-loja-veiculos
 ┣ 📂 database
 ┃ ┗ 📜 Criação Banco e Tabelas.sql
 ┣ 📂 stored_procedures
 ┃ ┣ 📜 SP_InsereCliente.sql
 ┃ ┣ 📜 SP_InsereEndereco.sql
 ┃ ┣ 📜 SP_InsereVeiculo.sql
 ┃ ┣ 📜 SP_InsereVendedor.sql
 ┃ ┗ 📜 SP_Venda.sql
 ┣ 📂 exemplos
 ┃ ┣ 📜 dados_exemplo.sql
 ┃ ┗ 📜 consultas_uteis.sql
 ┗ 📜 README.md
```

## 🎯 Aprendizados

Este projeto me permitiu desenvolver conhecimentos em:
- Modelagem de banco de dados relacional
- Normalização de dados
- Criação de relacionamentos (1:1, 1:N)
- Uso de constraints e validações
- Desenvolvimento de Stored Procedures
- Boas práticas em SQL

## 👨‍💻 Autor

**Pedro Henrique Rosa**
- GitHub: [@PedroHLJR](https://github.com/PedroHLJR)
- LinkedIn: [phrosa](https://linkedin.com/in/phrosa)

## 📄 Licença

Este projeto está sob a licença MIT.

---

⭐ Se este projeto te ajudou de alguma forma, considere dar uma estrela!
