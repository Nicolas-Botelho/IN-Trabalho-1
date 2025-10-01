CREATE DATABASE  IF NOT EXISTS `LocadoraVeiculos` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `LocadoraVeiculos`;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cargo`
--

LOCK TABLES `Cargo` WRITE;
/*!40000 ALTER TABLE `Cargo` DISABLE KEYS */;
INSERT INTO `Cargo` VALUES (1,'Atendente'),(2,'Gerente'),(3,'Mecânico'),(4,'Auxiliar Administrativo'),(5,'Vendedor');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cliente`
--

LOCK TABLES `Cliente` WRITE;
/*!40000 ALTER TABLE `Cliente` DISABLE KEYS */;
INSERT INTO `Cliente` VALUES (1,'Carlos Silva','carlos@email.com','11988887777','1234567','A1234567','12345678901','1975-05-10','1133445566','Rua A, 100',1,1),(2,'Mariana Souza','mariana@email.com','21999996666','2233445','B7654321','98765432100','1988-02-15','2122223333','Rua B, 200',2,2),(3,'João Pereira','joao@email.com','31988887777','3344556','C1111111','45678912300','1995-07-20','3133334444','Rua C, 300',3,3),(4,'Fernanda Lima','fernanda@email.com','41977776666','4455667','D2222222','32165498700','2001-09-25','4144445555','Rua D, 400',1,4),(5,'Ricardo Gomes','ricardo@email.com','51966665555','5566778','E3333333','65498732100','2010-12-30','5155556666','Rua E, 500',4,5);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EstadoCivil`
--

LOCK TABLES `EstadoCivil` WRITE;
/*!40000 ALTER TABLE `EstadoCivil` DISABLE KEYS */;
INSERT INTO `EstadoCivil` VALUES (1,'Solteiro'),(2,'Casado'),(3,'Divorciado'),(4,'Viúvo'),(5,'União Estável');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fabricante`
--

LOCK TABLES `Fabricante` WRITE;
/*!40000 ALTER TABLE `Fabricante` DISABLE KEYS */;
INSERT INTO `Fabricante` VALUES (1,'Toyota'),(2,'Honda'),(3,'Chevrolet'),(4,'Volkswagen'),(5,'Fiat');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Funcionario`
--

LOCK TABLES `Funcionario` WRITE;
/*!40000 ALTER TABLE `Funcionario` DISABLE KEYS */;
INSERT INTO `Funcionario` VALUES (1,'FUNC001','Ana Paula','11977778888','11111111111','1133112233','Rua F, 600','1234567',1,1),(2,'FUNC002','Bruno Rocha','21966667777','22222222222','2122113344','Rua G, 700','2233445',2,2),(3,'FUNC003','Carla Mendes','31955556666','33333333333','3133114455','Rua H, 800','3344556',3,3),(4,'FUNC004','Diego Alves','41944445555','44444444444','4144115566','Rua I, 900','4455667',4,4),(5,'FUNC005','Eduarda Nunes','51933334444','55555555555','5155116677','Rua J, 1000','5566778',5,5);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ItemOpcional`
--

LOCK TABLES `ItemOpcional` WRITE;
/*!40000 ALTER TABLE `ItemOpcional` DISABLE KEYS */;
INSERT INTO `ItemOpcional` VALUES (1,'GPS',20.00),(2,'Cadeirinha bebê',15.00),(3,'Wi-Fi portátil',25.00),(4,'Seguro extra',50.00),(5,'Suporte para bicicleta',30.00);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Locacao`
--

LOCK TABLES `Locacao` WRITE;
/*!40000 ALTER TABLE `Locacao` DISABLE KEYS */;
INSERT INTO `Locacao` VALUES (1,'2024-05-10','2024-05-15',150.00,10000,10200,1,1,1),(2,'2024-11-20','2024-11-25',160.00,20000,20300,2,2,2),(3,'2025-01-05','2025-01-10',120.00,30000,30150,3,3,3),(4,'2025-06-12','2025-06-16',130.00,40000,40200,4,4,4),(5,'2025-09-04','2025-09-08',200.00,50000,50300,5,5,5);
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
INSERT INTO `LocacaoItemOpcional` VALUES (1,1,20.00),(1,2,15.00),(2,3,25.00),(3,4,50.00),(4,5,30.00);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ManutencaoVeiculo`
--

LOCK TABLES `ManutencaoVeiculo` WRITE;
/*!40000 ALTER TABLE `ManutencaoVeiculo` DISABLE KEYS */;
INSERT INTO `ManutencaoVeiculo` VALUES (1,'2024-03-02','2024-03-05',1),(2,'2024-10-18','2024-10-22',2),(3,'2025-02-14','2025-02-18',3),(4,'2025-07-01','2025-07-05',4),(5,'2025-08-28','2025-08-30',5);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ModeloVeiculo`
--

LOCK TABLES `ModeloVeiculo` WRITE;
/*!40000 ALTER TABLE `ModeloVeiculo` DISABLE KEYS */;
INSERT INTO `ModeloVeiculo` VALUES (1,'Corolla'),(2,'Civic'),(3,'Onix'),(4,'Gol'),(5,'Argo');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Servico`
--

LOCK TABLES `Servico` WRITE;
/*!40000 ALTER TABLE `Servico` DISABLE KEYS */;
INSERT INTO `Servico` VALUES (1,'Troca de óleo'),(2,'Troca de pneus'),(3,'Alinhamento e balanceamento'),(4,'Revisão elétrica'),(5,'Troca de freios');
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
INSERT INTO `ServicoManutencao` VALUES (1,1,'2024-03-05','Troca concluída com sucesso',200.00),(2,2,'2024-10-22','Substituição de pneus',800.00),(3,3,'2025-02-18','Alinhamento realizado',150.00),(4,4,'2025-07-05','Revisão feita',400.00),(5,5,'2025-08-30','Freios trocados',600.00);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SituacaoVeiculo`
--

LOCK TABLES `SituacaoVeiculo` WRITE;
/*!40000 ALTER TABLE `SituacaoVeiculo` DISABLE KEYS */;
INSERT INTO `SituacaoVeiculo` VALUES (1,'Disponível'),(2,'Alugado'),(3,'Em manutenção'),(4,'Reservado'),(5,'Vendido');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TipoCombustivel`
--

LOCK TABLES `TipoCombustivel` WRITE;
/*!40000 ALTER TABLE `TipoCombustivel` DISABLE KEYS */;
INSERT INTO `TipoCombustivel` VALUES (1,'Gasolina'),(2,'Álcool'),(3,'Diesel'),(4,'Flex'),(5,'Elétrico');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TipoVeiculo`
--

LOCK TABLES `TipoVeiculo` WRITE;
/*!40000 ALTER TABLE `TipoVeiculo` DISABLE KEYS */;
INSERT INTO `TipoVeiculo` VALUES (1,'Sedan'),(2,'Hatch'),(3,'SUV'),(4,'Picape'),(5,'Elétrico');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UF`
--

LOCK TABLES `UF` WRITE;
/*!40000 ALTER TABLE `UF` DISABLE KEYS */;
INSERT INTO `UF` VALUES (1,'SP'),(2,'RJ'),(3,'MG'),(4,'PR'),(5,'RS');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Veiculo`
--

LOCK TABLES `Veiculo` WRITE;
/*!40000 ALTER TABLE `Veiculo` DISABLE KEYS */;
INSERT INTO `Veiculo` VALUES (1,'ABC1A23',2020,'CHS12345678901234',150.00,1,4,1,1,1),(2,'DEF4B56',2021,'CHS22345678901234',160.00,2,4,2,1,1),(3,'GHI7C89',2019,'CHS32345678901234',120.00,3,1,3,2,2),(4,'JKL0D12',2022,'CHS42345678901234',130.00,4,4,4,3,2),(5,'MNO3E45',2023,'CHS52345678901234',200.00,5,5,5,1,5);
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

-- Dump completed on 2025-10-01 16:20:01
