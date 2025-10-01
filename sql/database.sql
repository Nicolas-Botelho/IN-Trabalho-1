-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: LocadoraVeiculos
-- ------------------------------------------------------
-- Server version	8.4.6

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Cargo`
--

DROP TABLE IF EXISTS `Cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cargo` (
  `cdCargo` int NOT NULL AUTO_INCREMENT,
  `descCargo` varchar(45) NOT NULL,
  PRIMARY KEY (`cdCargo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cargo`
--

LOCK TABLES `Cargo` WRITE;
/*!40000 ALTER TABLE `Cargo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cliente`
--

DROP TABLE IF EXISTS `Cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cliente` (
  `cdCliente` int NOT NULL AUTO_INCREMENT,
  `nmCliente` varchar(100) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `celular` varchar(15) DEFAULT NULL,
  `RG` varchar(10) DEFAULT NULL,
  `habilitacao` varchar(45) DEFAULT NULL,
  `cpf` varchar(11) DEFAULT NULL,
  `dtNascimento` date NOT NULL,
  `telefonefixo` varchar(15) DEFAULT NULL,
  `endereco` longtext,
  `EstadoCivil_cdEstadoCivil` int DEFAULT NULL,
  `UF_cdUf` int NOT NULL,
  PRIMARY KEY (`cdCliente`),
  KEY `fk_Cliente_EstadoCivil1_idx` (`EstadoCivil_cdEstadoCivil`),
  KEY `fk_Cliente_UF1_idx` (`UF_cdUf`),
  CONSTRAINT `fk_Cliente_EstadoCivil1` FOREIGN KEY (`EstadoCivil_cdEstadoCivil`) REFERENCES `EstadoCivil` (`cdEstadoCivil`),
  CONSTRAINT `fk_Cliente_UF1` FOREIGN KEY (`UF_cdUf`) REFERENCES `UF` (`cdUf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cliente`
--

LOCK TABLES `Cliente` WRITE;
/*!40000 ALTER TABLE `Cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EstadoCivil`
--

DROP TABLE IF EXISTS `EstadoCivil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EstadoCivil` (
  `cdEstadoCivil` int NOT NULL AUTO_INCREMENT,
  `descEstadoCivil` varchar(30) NOT NULL,
  PRIMARY KEY (`cdEstadoCivil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EstadoCivil`
--

LOCK TABLES `EstadoCivil` WRITE;
/*!40000 ALTER TABLE `EstadoCivil` DISABLE KEYS */;
/*!40000 ALTER TABLE `EstadoCivil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fabricante`
--

DROP TABLE IF EXISTS `Fabricante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Fabricante` (
  `cdFabricante` int NOT NULL AUTO_INCREMENT,
  `descFabricante` varchar(45) NOT NULL,
  PRIMARY KEY (`cdFabricante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fabricante`
--

LOCK TABLES `Fabricante` WRITE;
/*!40000 ALTER TABLE `Fabricante` DISABLE KEYS */;
/*!40000 ALTER TABLE `Fabricante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Funcionario`
--

DROP TABLE IF EXISTS `Funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Funcionario` (
  `codFunc` int NOT NULL AUTO_INCREMENT,
  `matricula` varchar(15) NOT NULL,
  `nmFunc` varchar(100) NOT NULL,
  `celular` varchar(15) DEFAULT NULL,
  `cpf` varchar(11) DEFAULT NULL,
  `telResidencial` varchar(15) DEFAULT NULL,
  `endereco` longtext,
  `RG` varchar(10) DEFAULT NULL,
  `Cargo_cdCargo` int NOT NULL,
  `UF_cdUf` int NOT NULL,
  PRIMARY KEY (`codFunc`),
  KEY `fk_Funcionario_Cargo1_idx` (`Cargo_cdCargo`),
  KEY `fk_Funcionario_UF1_idx` (`UF_cdUf`),
  CONSTRAINT `fk_Funcionario_Cargo1` FOREIGN KEY (`Cargo_cdCargo`) REFERENCES `Cargo` (`cdCargo`),
  CONSTRAINT `fk_Funcionario_UF1` FOREIGN KEY (`UF_cdUf`) REFERENCES `UF` (`cdUf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Funcionario`
--

LOCK TABLES `Funcionario` WRITE;
/*!40000 ALTER TABLE `Funcionario` DISABLE KEYS */;
/*!40000 ALTER TABLE `Funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ItemOpcional`
--

DROP TABLE IF EXISTS `ItemOpcional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ItemOpcional` (
  `cdItemOpcional` int NOT NULL AUTO_INCREMENT,
  `descItemOpcional` varchar(45) NOT NULL,
  `vlrAtualDiaria` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`cdItemOpcional`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ItemOpcional`
--

LOCK TABLES `ItemOpcional` WRITE;
/*!40000 ALTER TABLE `ItemOpcional` DISABLE KEYS */;
/*!40000 ALTER TABLE `ItemOpcional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Locacao`
--

DROP TABLE IF EXISTS `Locacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Locacao` (
  `cdLocacao` int NOT NULL AUTO_INCREMENT,
  `dtInicio` date NOT NULL,
  `dtFim` date DEFAULT NULL,
  `vlrDiaria` decimal(10,2) NOT NULL,
  `kmInicial` int NOT NULL,
  `kmFinal` int DEFAULT NULL,
  `Veiculo_cdVeiculo` int NOT NULL,
  `Funcionario_codFunc` int NOT NULL,
  `Cliente_cdCliente` int NOT NULL,
  PRIMARY KEY (`cdLocacao`),
  KEY `fk_Locacao_Veiculo1_idx` (`Veiculo_cdVeiculo`),
  KEY `fk_Locacao_Funcionario1_idx` (`Funcionario_codFunc`),
  KEY `fk_Locacao_Cliente1_idx` (`Cliente_cdCliente`),
  CONSTRAINT `fk_Locacao_Cliente1` FOREIGN KEY (`Cliente_cdCliente`) REFERENCES `Cliente` (`cdCliente`),
  CONSTRAINT `fk_Locacao_Funcionario1` FOREIGN KEY (`Funcionario_codFunc`) REFERENCES `Funcionario` (`codFunc`),
  CONSTRAINT `fk_Locacao_Veiculo1` FOREIGN KEY (`Veiculo_cdVeiculo`) REFERENCES `Veiculo` (`cdVeiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Locacao`
--

LOCK TABLES `Locacao` WRITE;
/*!40000 ALTER TABLE `Locacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `Locacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LocacaoItemOpcional`
--

DROP TABLE IF EXISTS `LocacaoItemOpcional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LocacaoItemOpcional` (
  `Locacao_cdLocacao` int NOT NULL,
  `ItemOpcional_cdItemOpcional` int NOT NULL,
  `vlrDiariaCobrado` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Locacao_cdLocacao`,`ItemOpcional_cdItemOpcional`),
  KEY `fk_Acessorios_has_Locacao_Locacao1_idx` (`Locacao_cdLocacao`),
  KEY `fk_LocacaoItemOpcional_ItemOpcional1_idx` (`ItemOpcional_cdItemOpcional`),
  CONSTRAINT `fk_Acessorios_has_Locacao_Locacao1` FOREIGN KEY (`Locacao_cdLocacao`) REFERENCES `Locacao` (`cdLocacao`),
  CONSTRAINT `fk_LocacaoItemOpcional_ItemOpcional1` FOREIGN KEY (`ItemOpcional_cdItemOpcional`) REFERENCES `ItemOpcional` (`cdItemOpcional`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LocacaoItemOpcional`
--

LOCK TABLES `LocacaoItemOpcional` WRITE;
/*!40000 ALTER TABLE `LocacaoItemOpcional` DISABLE KEYS */;
/*!40000 ALTER TABLE `LocacaoItemOpcional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ManutencaoVeiculo`
--

DROP TABLE IF EXISTS `ManutencaoVeiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ManutencaoVeiculo` (
  `cdManutencao` int NOT NULL AUTO_INCREMENT,
  `dtSaida` date NOT NULL,
  `dtRetorno` date DEFAULT NULL,
  `Veiculo_cdVeiculo` int NOT NULL,
  PRIMARY KEY (`cdManutencao`),
  KEY `fk_ManutencaoVeiculo_Veiculo1_idx` (`Veiculo_cdVeiculo`),
  CONSTRAINT `fk_ManutencaoVeiculo_Veiculo1` FOREIGN KEY (`Veiculo_cdVeiculo`) REFERENCES `Veiculo` (`cdVeiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ManutencaoVeiculo`
--

LOCK TABLES `ManutencaoVeiculo` WRITE;
/*!40000 ALTER TABLE `ManutencaoVeiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `ManutencaoVeiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ModeloVeiculo`
--

DROP TABLE IF EXISTS `ModeloVeiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ModeloVeiculo` (
  `cdModelo` int NOT NULL AUTO_INCREMENT,
  `descModelo` varchar(45) NOT NULL,
  PRIMARY KEY (`cdModelo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ModeloVeiculo`
--

LOCK TABLES `ModeloVeiculo` WRITE;
/*!40000 ALTER TABLE `ModeloVeiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `ModeloVeiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Servico`
--

DROP TABLE IF EXISTS `Servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Servico` (
  `cdServico` int NOT NULL AUTO_INCREMENT,
  `descServico` varchar(45) NOT NULL,
  PRIMARY KEY (`cdServico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Servico`
--

LOCK TABLES `Servico` WRITE;
/*!40000 ALTER TABLE `Servico` DISABLE KEYS */;
/*!40000 ALTER TABLE `Servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ServicoManutencao`
--

DROP TABLE IF EXISTS `ServicoManutencao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ServicoManutencao` (
  `ManutencaoVeiculo_cdManutencao` int NOT NULL,
  `ServicoManutencao_cdServico` int NOT NULL,
  `dtConclusao` date DEFAULT NULL,
  `observacoes` longtext,
  `custo` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ManutencaoVeiculo_cdManutencao`,`ServicoManutencao_cdServico`),
  KEY `fk_ManutencaoVeiculo_has_ServicoManutencao_ServicoManutenca_idx` (`ServicoManutencao_cdServico`),
  KEY `fk_ManutencaoVeiculo_has_ServicoManutencao_ManutencaoVeicul_idx` (`ManutencaoVeiculo_cdManutencao`),
  CONSTRAINT `fk_ManutencaoVeiculo_has_ServicoManutencao_ManutencaoVeiculo1` FOREIGN KEY (`ManutencaoVeiculo_cdManutencao`) REFERENCES `ManutencaoVeiculo` (`cdManutencao`),
  CONSTRAINT `fk_ManutencaoVeiculo_has_ServicoManutencao_ServicoManutencao1` FOREIGN KEY (`ServicoManutencao_cdServico`) REFERENCES `Servico` (`cdServico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ServicoManutencao`
--

LOCK TABLES `ServicoManutencao` WRITE;
/*!40000 ALTER TABLE `ServicoManutencao` DISABLE KEYS */;
/*!40000 ALTER TABLE `ServicoManutencao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SituacaoVeiculo`
--

DROP TABLE IF EXISTS `SituacaoVeiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SituacaoVeiculo` (
  `cdSituacao` int NOT NULL AUTO_INCREMENT,
  `descSituacao` varchar(20) NOT NULL,
  PRIMARY KEY (`cdSituacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SituacaoVeiculo`
--

LOCK TABLES `SituacaoVeiculo` WRITE;
/*!40000 ALTER TABLE `SituacaoVeiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `SituacaoVeiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TipoCombustivel`
--

DROP TABLE IF EXISTS `TipoCombustivel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TipoCombustivel` (
  `cdCombustivel` int NOT NULL AUTO_INCREMENT,
  `descCombustivel` varchar(30) NOT NULL,
  PRIMARY KEY (`cdCombustivel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TipoCombustivel`
--

LOCK TABLES `TipoCombustivel` WRITE;
/*!40000 ALTER TABLE `TipoCombustivel` DISABLE KEYS */;
/*!40000 ALTER TABLE `TipoCombustivel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TipoVeiculo`
--

DROP TABLE IF EXISTS `TipoVeiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TipoVeiculo` (
  `cdTipoVeiculo` int NOT NULL AUTO_INCREMENT,
  `descTipoVeiculo` varchar(45) NOT NULL,
  PRIMARY KEY (`cdTipoVeiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TipoVeiculo`
--

LOCK TABLES `TipoVeiculo` WRITE;
/*!40000 ALTER TABLE `TipoVeiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `TipoVeiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UF`
--

DROP TABLE IF EXISTS `UF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `UF` (
  `cdUf` int NOT NULL AUTO_INCREMENT,
  `descUF` varchar(45) NOT NULL,
  PRIMARY KEY (`cdUf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UF`
--

LOCK TABLES `UF` WRITE;
/*!40000 ALTER TABLE `UF` DISABLE KEYS */;
/*!40000 ALTER TABLE `UF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Veiculo`
--

DROP TABLE IF EXISTS `Veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Veiculo` (
  `cdVeiculo` int NOT NULL AUTO_INCREMENT,
  `placa` varchar(10) DEFAULT NULL,
  `anoFabricacao` year NOT NULL,
  `chassi` varchar(20) NOT NULL,
  `VlrDiariaBase` decimal(10,2) NOT NULL,
  `Fabricante_cdFabricante` int NOT NULL,
  `TipoCombustivel_cdCombustivel` int NOT NULL,
  `ModeloVeiculo_cdModelo` int NOT NULL,
  `SituacaoVeiculo_cdSituacao` int NOT NULL,
  `TipoVeiculo_cdTipoVeiculo` int NOT NULL,
  PRIMARY KEY (`cdVeiculo`),
  KEY `fk_Veiculo_Fabricante1_idx` (`Fabricante_cdFabricante`),
  KEY `fk_Veiculo_TipoCombustivel1_idx` (`TipoCombustivel_cdCombustivel`),
  KEY `fk_Veiculo_ModeloVeiculo1_idx` (`ModeloVeiculo_cdModelo`),
  KEY `fk_Veiculo_SituacaoVeiculo1_idx` (`SituacaoVeiculo_cdSituacao`),
  KEY `fk_Veiculo_TipoVeiculo1_idx` (`TipoVeiculo_cdTipoVeiculo`),
  CONSTRAINT `fk_Veiculo_Fabricante1` FOREIGN KEY (`Fabricante_cdFabricante`) REFERENCES `Fabricante` (`cdFabricante`),
  CONSTRAINT `fk_Veiculo_ModeloVeiculo1` FOREIGN KEY (`ModeloVeiculo_cdModelo`) REFERENCES `ModeloVeiculo` (`cdModelo`),
  CONSTRAINT `fk_Veiculo_SituacaoVeiculo1` FOREIGN KEY (`SituacaoVeiculo_cdSituacao`) REFERENCES `SituacaoVeiculo` (`cdSituacao`),
  CONSTRAINT `fk_Veiculo_TipoCombustivel1` FOREIGN KEY (`TipoCombustivel_cdCombustivel`) REFERENCES `TipoCombustivel` (`cdCombustivel`),
  CONSTRAINT `fk_Veiculo_TipoVeiculo1` FOREIGN KEY (`TipoVeiculo_cdTipoVeiculo`) REFERENCES `TipoVeiculo` (`cdTipoVeiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Veiculo`
--

LOCK TABLES `Veiculo` WRITE;
/*!40000 ALTER TABLE `Veiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Veiculo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-26 14:00:25
