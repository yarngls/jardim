-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: encanto
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu0.16.04.1

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
) ENGINE=InnoDB AUTO_INCREMENT=685 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `criancas`
--

LOCK TABLES `criancas` WRITE;
/*!40000 ALTER TABLE `criancas` DISABLE KEYS */;
INSERT INTO `criancas` VALUES (676,NULL,'Abdel Malik fernandes DjalÃ³','Masculino','2018-05-21 19:04:47',4,'','242/2013','1','','',2500,'','',0,'Fazenda','2018-05-21','Suspenso',682,680),(677,NULL,'Adilson Francisco Pereira Bento Monteiro','Masculino','2018-05-21 19:04:36',4,'','','','1','',4000,'','1',0,'SÃ£o Francisco','2018-05-21','Suspenso',685,683),(678,NULL,'Adione Patricia Furtado A. Borges','Feminino','2018-05-21 19:04:51',5,'','324/2013','','','1',4000,'','',10,'Paiol','2018-05-21','Suspenso',686,684),(679,NULL,'CHRISTIAN MACIEL MONTEIRO LOPES','Masculino','2017-12-17 00:00:00',4,'','246-17','','','1',4500,'','',0,'Paiol','2018-03-13','Matriculado',688,686),(680,NULL,'GABRIEL VARELA GOMES','Masculino','2017-05-17 00:00:00',4,'','','','','1',5000,'','',1000,'Achada SÃ£o Filipe','1918-03-28','Matriculado',690,688),(681,NULL,'VICTOR RAFAEL ROCHA SEMEDO','Masculino','2017-03-21 00:00:00',3,'','146-17','','','1',5000,'','',0,'Caiada','2018-04-12','Matriculado',693,691),(682,NULL,'Mellody Maria Gomes Martins','Feminino','2017-11-21 00:00:00',6,'','482-17','1','','',3000,'','',0,'Fazenda','2018-05-04','Matriculado',694,692),(683,NULL,'LIAH DE DEUS CORREIA LEGER MONTEIRO','Feminino','2016-09-16 00:00:00',3,'LIAH','593-16','1','','',3000,'','',0,'Fazenda','2018-05-02','Matriculado',695,693),(684,NULL,'DIONISIO SERGIO SEMEDO','Masculino','2016-02-05 00:00:00',2,'DENIR','167-2016','1','','',3000,'','',0,'Fazenda','2018-01-09','Matriculado',696,694);
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
) ENGINE=InnoDB AUTO_INCREMENT=695 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mae`
--

LOCK TABLES `mae` WRITE;
/*!40000 ALTER TABLE `mae` DISABLE KEYS */;
INSERT INTO `mae` VALUES (677,'Jassina Cardoso Fernandes','','','','',''),(678,'Jassina Cardoso Fernandes','','','','',''),(679,'Jassina Cardoso Fernandes','','','','',''),(680,'Jassina Cardoso Fernandes','','','','',''),(681,'SÃ´nia Cristina Pereira Sousa Varela','','','','',''),(682,'SÃ´nia Cristina Pereira Sousa Varela','','','','',''),(683,'SÃ´nia Cristina Pereira Sousa Varela','','','','',''),(684,'Adozinda Correia Furtado','','','','',''),(685,'Jorcelina Lopes Monteiro','','','','',''),(686,'KATIA MILUCY FATIMA MONTEIRO','RECEPCIONISTA','9755414','9383890','PRAIA FORMOSA','KATY'),(687,'Ana Leonor Rodrigues Varela','','','','',''),(688,'SILVINA CORREIA VARELA','','','','',''),(689,'Adozinda Correia Furtado','','','','',''),(690,'Adozinda Correia Furtado','','','','',''),(691,'GRACA ALINE BARROS DE PINA ROCHA SEMEDO','TÃ‰CNICO LABORATORIO','','9261698','CAIDA','GRACINHA'),(692,'Claudia Patricia Gomes','Apoio Administra','','9880788','Fazenda','Kakau'),(693,'RUTH MIRIAN FORTES CORREIA','GESTORA EMPRESARIAL','','','FAZENDA','RUTH'),(694,'SUE ELLEN SILVA BRITO','ESTUDANTE','','','','');
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
) ENGINE=InnoDB AUTO_INCREMENT=697 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pai`
--

LOCK TABLES `pai` WRITE;
/*!40000 ALTER TABLE `pai` DISABLE KEYS */;
INSERT INTO `pai` VALUES (679,'Mamadu Sabani DjalÃ³','','','','',''),(680,'Mamadu Sabani DjalÃ³','','','','',''),(681,'Mamadu Sabani DjalÃ³','','','','',''),(682,'Mamadu Sabani DjalÃ³','','','','',''),(683,'Adilson Bento Monteiro','','','','',''),(684,'Adilson Bento Monteiro','','','','',''),(685,'Adilson Bento Monteiro','','','','',''),(686,'DeonildoPatricia Almeida Borges','','','','',''),(687,'Admilson Antonio Garcia Oliveira','','','','',''),(688,'GILSON JORGE VARELA LOPES','PROFESSOR EBI','','9133574','PRAIA FORMOSA',''),(689,'Frederico Augusto Carlos Tavares da Fonseca','','','','',''),(690,'ADMISON ANTONIO CARDOSO GOMES PIRES','','','','',''),(691,'Deonildo Patricia Almeida Barros','','','','',''),(692,'Deonildo Patricia Almeida Barros','','','','',''),(693,'NATALINO LOPES VAZ SEMEDO','TECNICO TURISMO','','9299212','CAIDA','NATALINO'),(694,'Hugo Alexandre Almeida MArtins','Fiel de Armazem','','9116005','Fazenda',''),(695,'ELISANGELO DE DEUS LEGER MONTEIRO','ENGENHEIRO','','5162054','FAZENDA','LIAH'),(696,'','','','','','');
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

-- Dump completed on 2018-05-30 14:56:43
