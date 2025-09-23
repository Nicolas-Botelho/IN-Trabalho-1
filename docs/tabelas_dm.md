# Tabelas dos DataMarts (DM)

## DM de aluguel (ou locação)

### Dim_data
* idDim_data : INT
* dia : INT
* mes : INT
* ano : INT

### Dim_funcionario
* idDim_funcionario : INT
* nome : VARCHAR(100)
* cargo : VARCHAR(45)

### Dim_opicionais
* idDim_opicionais : INT
* descricao : VARCHAR(45)

### Dim_locacao
* idDim_locacao : INT
* valor : DECIMAL(10,2)
* data_inicio : DATE
* data_fim : DATE
* km_inicio : INT
* km_fim : INT
* contem_opcional : TINYINT

### Dim_veiculo
* idDim_veiculo : INT
* modelo : VARCHAR(45)
* tipo : VARCHAR(45)
* fabricante : VARCHAR(45)
* combustivel : VARCHAR(45)
* ano : YEAR(4)

### Fato
* idFato : INT
* Dim_data_idDim_data : INT
* Dim_funcionario_idDim_funcionario : INT
* Dim_opicionais_idDim_opicionais : INT
* Dim_locacao_idDim_locacao : INT
* Dim_veiculo_idDim_veiculo : INT
* qtd_dias_locacao : INT
* kms_locacao : INT

---

## DM de manutenção

### Dim_data
* idDim_data : INT
* dia : INT
* mes : INT
* ano : INT

### Dim_veiculo
* idDim_veiculo : INT
* modelo : VARCHAR(45)
* tipo : VARCHAR(45)
* fabricante : VARCHAR(45)
* combustivel : VARCHAR(45)
* ano : YEAR(4)

### Dim_manutencao
* idDim_manutencao : INT
* servico_tipo : VARCHAR(45)
* custo : DECIMAL(10,2)
* data_retorno : DATE
* data_conclusao : DATE

### Fato
* idFato : INT
* Dim_data_idDim_data : INT
* Dim_veiculo_idDim_veiculo : INT
* Dim_manutencao_idDim_manutencao : INT
* qtd_dias_manutencao : INT