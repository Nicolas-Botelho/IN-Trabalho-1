-- =============================================
-- CRIAÇÃO DOS SCHEMAS
-- =============================================
CREATE SCHEMA IF NOT EXISTS DMs_Locacao;
CREATE SCHEMA IF NOT EXISTS DMs_Manutencao;

-- =============================================
-- DROPS (ORDEM SEGURA PARA FKs)
-- =============================================
-- Drop da tabela Fato primeiro (usa FKs)
DROP TABLE IF EXISTS DMs_Manutencao.Fato;

-- Drop das dimensões
DROP TABLE IF EXISTS DMs_Locacao.Dim_veiculo;
DROP TABLE IF EXISTS DMs_Locacao.Dim_manutencao;
DROP TABLE IF EXISTS DMs_Manutencao.Dim_data;

-- =============================================
-- DIMENSÕES (DMs_Locacao)
-- =============================================
USE DMs_Locacao;

-- -----------------------------------------------------
-- Tabela: Dim_veiculo
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Dim_veiculo (
  idDim_veiculo INT NOT NULL,
  modelo VARCHAR(45) NULL DEFAULT NULL,
  tipo VARCHAR(45) NULL DEFAULT NULL,
  fabricante VARCHAR(45) NULL DEFAULT NULL,
  combustivel VARCHAR(45) NULL DEFAULT NULL,
  ano YEAR(4) NULL DEFAULT NULL,
  PRIMARY KEY (idDim_veiculo)
) ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Tabela: Dim_manutencao
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Dim_manutencao (
  idDim_manutencao INT NOT NULL,
  servico_tipo VARCHAR(45) NULL DEFAULT NULL,
  custo DECIMAL(10,2) NULL DEFAULT NULL,
  data_retorno DATE NULL DEFAULT NULL,
  data_saida DATE NULL DEFAULT NULL,
  PRIMARY KEY (idDim_manutencao)
) ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8;

-- =============================================
-- DIMENSÃO DE DATA (DMs_Manutencao)
-- =============================================
USE DMs_Manutencao;

-- -----------------------------------------------------
-- Tabela: Dim_data (Date Dimension completa)
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Dim_data (
  date_key INT NOT NULL,
  full_date INT NULL DEFAULT NULL,
  day_of_week INT NULL DEFAULT NULL,
  day_num_in_month INT NULL DEFAULT NULL,
  day_num_overall INT NULL DEFAULT NULL,
  day_name VARCHAR(9) NULL DEFAULT NULL,
  day_abbrev CHAR(3) NULL DEFAULT NULL,
  weekday_flag VARCHAR(10) NULL DEFAULT NULL,
  week_num_in_year INT NULL DEFAULT NULL,
  week_num_overall INT NULL DEFAULT NULL,
  week_begin_date INT NULL DEFAULT NULL,
  week_begin_date_key INT NULL DEFAULT NULL,
  month INT NULL DEFAULT NULL,
  month_num_overall INT NULL DEFAULT NULL,
  month_name VARCHAR(9) NULL DEFAULT NULL,
  month_abbrev CHAR(3) NULL DEFAULT NULL,
  quarter INT NULL DEFAULT NULL,
  year INT NULL DEFAULT NULL,
  yearmo INT NULL DEFAULT NULL,
  fiscal_month INT NULL DEFAULT NULL,
  fiscal_quarter INT NULL DEFAULT NULL,
  fiscal_year INT NULL DEFAULT NULL,
  last_day_in_month_flag VARCHAR(14) NULL DEFAULT NULL,
  same_day_year_ago_date INT NULL DEFAULT NULL,
  PRIMARY KEY (date_key)
) ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8;

-- =============================================
-- TABELA FATO (em DMs_Manutencao)
-- =============================================
CREATE TABLE IF NOT EXISTS Fato (
  idFato INT NOT NULL,
  Dim_data_idDim_data INT NOT NULL,
  Dim_veiculo_idDim_veiculo INT NOT NULL,
  Dim_manutencao_idDim_manutencao INT NOT NULL,
  qtd_dias_manutencao INT NULL DEFAULT NULL,
  PRIMARY KEY (
    idFato,
    Dim_data_idDim_data,
    Dim_veiculo_idDim_veiculo,
    Dim_manutencao_idDim_manutencao
  ),
  INDEX idx_Fato_Dim_data (Dim_data_idDim_data ASC),
  INDEX idx_Fato_Dim_veiculo (Dim_veiculo_idDim_veiculo ASC),
  INDEX idx_Fato_Dim_manutencao (Dim_manutencao_idDim_manutencao ASC),
  CONSTRAINT fk_Fato_Dim_data
    FOREIGN KEY (Dim_data_idDim_data)
    REFERENCES DMs_Manutencao.Dim_data (date_key)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Fato_Dim_veiculo
    FOREIGN KEY (Dim_veiculo_idDim_veiculo)
    REFERENCES DMs_Locacao.Dim_veiculo (idDim_veiculo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Fato_Dim_manutencao
    FOREIGN KEY (Dim_manutencao_idDim_manutencao)
    REFERENCES DMs_Locacao.Dim_manutencao (idDim_manutencao)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8;