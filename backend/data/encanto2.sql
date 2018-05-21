-- MySQL dump 10.16  Distrib 10.1.21-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: localhost
-- ------------------------------------------------------
-- Server version	10.1.21-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `criancas`
--

DROP TABLE IF EXISTS `criancas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `criancas` (
  `idCrianca` int(255) NOT NULL AUTO_INCREMENT,
  `fotoPerfil` varchar(250) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `sexo` varchar(255) DEFAULT NULL,
  `dataNascimento` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `idade` int(255) DEFAULT NULL,
  `alcunha` varchar(255) DEFAULT NULL,
  `numeroPMI` varchar(255) DEFAULT NULL,
  `periodoManha` varchar(250) DEFAULT NULL,
  `periodoTarde` varchar(250) DEFAULT NULL,
  `diaInteiro` varchar(250) DEFAULT NULL,
  `propina` int(255) DEFAULT NULL,
  `linguaFrancesa` varchar(250) DEFAULT NULL,
  `linguaInglesa` varchar(250) DEFAULT NULL,
  `almoco` int(255) DEFAULT NULL,
  `morada` varchar(250) DEFAULT NULL,
  `dataInicioJardim` date DEFAULT NULL,
  `estado` varchar(250) DEFAULT NULL,
  `idPai` int(11) NOT NULL,
  `idmae` int(11) NOT NULL,
  PRIMARY KEY (`idCrianca`),
  KEY `idmae` (`idmae`),
  KEY `idPai` (`idPai`),
  CONSTRAINT `criancas_ibfk_1` FOREIGN KEY (`idmae`) REFERENCES `mae` (`idMae`),
  CONSTRAINT `criancas_ibfk_2` FOREIGN KEY (`idPai`) REFERENCES `pai` (`idPai`)
) ENGINE=InnoDB AUTO_INCREMENT=675 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `criancas`
--

LOCK TABLES `criancas` WRITE;
/*!40000 ALTER TABLE `criancas` DISABLE KEYS */;
INSERT INTO `criancas` VALUES (669,NULL,'Abdel Malik DjalÃ³','Masculino','2018-05-19 00:00:00',4,'DjalÃ³','242/2013','1','1','',2500,'1','1',1000,'Palmarejo','2014-08-01','Matriculado',672,670),(670,NULL,'Adilson Francisco Pereira Bento Monteiro','Masculino','2013-06-10 00:00:00',4,'Adilson','324/2013','','','1',4000,'1','',3000,'Palmarejo','2018-05-20','Matriculado',673,671),(671,NULL,'','','0000-00-00 00:00:00',0,'','','','','',0,'','',0,'','0000-00-00','',674,672),(672,NULL,'','','0000-00-00 00:00:00',0,'','','','','',0,'','',0,'','0000-00-00','',675,673),(673,NULL,'Gil','','0000-00-00 00:00:00',0,'','','','','',0,'','',0,'','0000-00-00','',676,674),(674,NULL,'Gi','Masculino','2018-05-18 00:00:00',0,'','','','','',2493,'','',0,'Palmarejo','2018-05-19','Matriculado',677,675);
/*!40000 ALTER TABLE `criancas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadocriancas`
--

DROP TABLE IF EXISTS `estadocriancas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estadocriancas` (
  `idEstado` int(11) NOT NULL AUTO_INCREMENT,
  `descricaoEstado` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`idEstado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadocriancas`
--

LOCK TABLES `estadocriancas` WRITE;
/*!40000 ALTER TABLE `estadocriancas` DISABLE KEYS */;
/*!40000 ALTER TABLE `estadocriancas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localidades`
--

DROP TABLE IF EXISTS `localidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `localidades` (
  `idLocalidade` int(11) NOT NULL AUTO_INCREMENT,
  `nomeLocalidade` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`idLocalidade`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localidades`
--

LOCK TABLES `localidades` WRITE;
/*!40000 ALTER TABLE `localidades` DISABLE KEYS */;
INSERT INTO `localidades` VALUES (1,'Achada Grande Frente'),(2,'Achada Grande Tras'),(3,'Achada Santo António'),(4,'Achada São Filipe'),(5,'Achadinha'),(6,'Bela Vista'),(7,'Caiada'),(8,'Calabaceira '),(9,'Castelão'),(10,'Cidadela'),(11,'Fazenda'),(12,'Gamboa'),(13,'Latada'),(14,'Lém Cachorro'),(15,'Lém Ferreira'),(16,'Eugénio Lima'),(17,'Paiol'),(18,'Palmarejo'),(19,'Palmarejo Grande-Monte Vermelho'),(22,'Pensamento'),(23,'Plateau'),(24,'Prainha'),(25,'Ponta da Agua'),(26,'Quebra Canela'),(27,'Safende'),(28,'Terra Branca'),(29,'Tira Chapéu'),(30,'Várzea');
/*!40000 ALTER TABLE `localidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mae`
--

DROP TABLE IF EXISTS `mae`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mae` (
  `idMae` int(255) NOT NULL AUTO_INCREMENT,
  `nomeMae` varchar(255) DEFAULT NULL,
  `profissaoMae` varchar(255) DEFAULT NULL,
  `telefoneMae` varchar(255) DEFAULT NULL,
  `movelMae` varchar(255) DEFAULT NULL,
  `moradaMae` varchar(255) DEFAULT NULL,
  `alcunhaMae` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idMae`)
) ENGINE=InnoDB AUTO_INCREMENT=676 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mae`
--

LOCK TABLES `mae` WRITE;
/*!40000 ALTER TABLE `mae` DISABLE KEYS */;
INSERT INTO `mae` VALUES (670,'Jassina Cardoso Fernades','','','','',''),(671,'Adozinda Correia Furtado','','','','',''),(672,'','','','','',''),(673,'','','','','',''),(674,'','','','','',''),(675,'','','','','','');
/*!40000 ALTER TABLE `mae` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pai`
--

DROP TABLE IF EXISTS `pai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pai` (
  `idPai` int(255) NOT NULL AUTO_INCREMENT,
  `nomePai` varchar(255) DEFAULT NULL,
  `profissaoPai` varchar(255) DEFAULT NULL,
  `telefonePai` varchar(255) DEFAULT NULL,
  `movelPai` varchar(255) DEFAULT NULL,
  `moradaPai` varchar(255) DEFAULT NULL,
  `alcunhaPai` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idPai`),
  KEY `telefonePai` (`telefonePai`)
) ENGINE=InnoDB AUTO_INCREMENT=678 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pai`
--

LOCK TABLES `pai` WRITE;
/*!40000 ALTER TABLE `pai` DISABLE KEYS */;
INSERT INTO `pai` VALUES (672,'Mamadu Sabani DjalÃ³','','','','',''),(673,'DeonildoPatricia Almeida Borges','','','','',''),(674,'','','','','',''),(675,'','','','','',''),(676,'','','','','',''),(677,'','','','','','');
/*!40000 ALTER TABLE `pai` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-21  8:34:31
