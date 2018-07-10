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
  `linguaFrancesa` int(250) DEFAULT NULL,
  `linguaInglesa` int(250) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=693 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `criancas`
--

LOCK TABLES `criancas` WRITE;
/*!40000 ALTER TABLE `criancas` DISABLE KEYS */;
INSERT INTO `criancas` VALUES (669,NULL,'Abdel Malik DjalÃ³','Masculino','2018-07-06 18:29:20',4,'DjalÃ³','242/2013','1','1','',2500,0,0,1000,'Palmarejo','2014-08-01','Matriculado',672,670),(670,NULL,'Adilson Francisco Pereira Bento Monteiro','Feminino','2018-07-06 18:29:20',4,'Adilson','324/2013','','','1',4000,500,600,3700,'Palmarejo','2018-05-20','Matriculado',673,671),(673,NULL,'Gil','','2018-07-06 18:32:04',0,'','','','','',0,0,0,0,'','0000-00-00','Suspenso',676,674),(674,NULL,'Gi','Masculino','2018-07-06 18:32:09',0,'','','','','',2493,0,0,0,'Palmarejo','2018-05-19','Suspenso',677,675),(675,NULL,'Mena Fernandes','Feminino','2018-07-06 18:29:20',2,'Meninha','123/2017','1','1','',2590,0,0,2700,'Achada Grande Frente','2018-05-28','Matriculado',678,676),(679,NULL,'Da GraÃ§a','Masculino','2018-07-06 18:29:20',4,'GraÃ§a','123/2014','1','1','',2500,0,0,1500,'Achada Grande Tras','2018-05-29','Matriculado',684,682),(680,NULL,'Mario Silva da GraÃ§a (Esposa Rute)','Masculino','2018-07-06 18:22:19',5,'Val','123/2013','1','','',2700,0,0,1590,'Latada','2018-05-30','Matriculado',685,683),(681,NULL,'Gilson','','0000-00-00 00:00:00',0,'','','','','',0,0,0,0,'','0000-00-00','',688,687),(682,NULL,'GilsonT','','0000-00-00 00:00:00',0,'','','','','',0,0,0,0,'','0000-00-00','',689,688),(683,NULL,'GilsonT','','0000-00-00 00:00:00',0,'','','','','',0,0,0,0,'','0000-00-00','',690,689),(684,NULL,'GilsoN BG','','2018-07-06 18:32:42',0,'','','','','',0,0,0,0,'','0000-00-00','Suspenso',691,690),(685,NULL,'tess','','0000-00-00 00:00:00',0,'','','','','',0,0,0,0,'','0000-00-00','',692,691),(686,NULL,'tess','','0000-00-00 00:00:00',0,'','','','','',0,0,0,0,'','0000-00-00','',693,692),(687,NULL,'tess','','2018-07-06 18:32:15',0,'','','','','',0,0,0,0,'','0000-00-00','Suspenso',694,693),(688,NULL,'Mario Silva da GraÃ§a','Masculino','2018-07-06 18:29:20',4,'Val','12345','1','1','',3000,0,0,1500,'Achada Grande Frente','2018-06-16','Matriculado',695,694),(689,NULL,'','','2018-07-06 18:31:37',0,'','','','','',0,0,0,0,'','0000-00-00','Suspenso',696,695),(690,NULL,'Ze Rui','Masculino','2018-07-06 18:32:21',0,'Ze test','12345','1','1','',0,1000,3500,1000,'Achada Grande Frente','2018-07-03','Suspenso',697,696),(691,NULL,'Ayrton Gomes','Masculino','2018-07-06 18:29:20',0,'Ayrtoni','123456','1','1','',3500,0,0,0,'Achadinha','2018-07-04','Matriculado',698,697),(692,NULL,'Joana Fernades','Masculino','2018-07-06 18:32:36',5,'Keula','123456','1','1','',4600,0,0,0,'Gamboa','2018-07-05','Suspenso',699,698);
/*!40000 ALTER TABLE `criancas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dividas`
--

DROP TABLE IF EXISTS `dividas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dividas` (
  `id_dividas` int(250) NOT NULL AUTO_INCREMENT,
  `id_crianca` varchar(250) DEFAULT NULL,
  `tipo_divida` varchar(250) DEFAULT NULL,
  `mes_referencia` varchar(250) DEFAULT NULL,
  `ano_referencia` varchar(250) DEFAULT NULL,
  `montante` int(250) DEFAULT NULL,
  `data_registo` varchar(250) DEFAULT NULL,
  `estado` varchar(250) DEFAULT NULL,
  `observacoes` varchar(250) DEFAULT NULL,
  `nome_user` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id_dividas`)
) ENGINE=InnoDB AUTO_INCREMENT=2016 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dividas`
--

LOCK TABLES `dividas` WRITE;
/*!40000 ALTER TABLE `dividas` DISABLE KEYS */;
INSERT INTO `dividas` VALUES (1995,'670','propina','07','2018',1500,'2018-07-06','pago',NULL,NULL),(1996,'670','almoco','07','2018',3500,'2018-07-06','pago',NULL,NULL),(1997,'675','propina','07','2018',2590,'2018-07-06','pendente',NULL,NULL),(1998,'675','almoco','07','2018',2500,'2018-07-06','pendente',NULL,NULL),(1999,'680','propina','07','2018',2700,'2018-07-06','pendente',NULL,NULL),(2000,'680','almoco','07','2018',1590,'2018-07-06','pendente',NULL,NULL),(2001,'688','propina','07','2018',3000,'2018-07-06','pendente',NULL,NULL),(2002,'688','almoco','07','2018',1500,'2018-07-06','pendente',NULL,NULL),(2003,'690','linguaInglesa','07','2018',3500,'2018-07-06','pendente',NULL,NULL),(2004,'690','almoco','07','2018',1000,'2018-07-06','pendente',NULL,NULL),(2005,'691','linguaFrancesa','07','2018',5700,'2018-07-06','pendente',NULL,NULL),(2006,'692','propina','07','2018',4600,'2018-07-06','pendente',NULL,NULL),(2007,'691','propina','07','2018',3500,'2018-07-06','pendente',NULL,NULL),(2008,'690','linguaFrancesa','07','2018',1000,'2018-07-06','pendente',NULL,NULL),(2009,'670','linguaFrancesa','07','2018',500,'2018-07-06','pago',NULL,NULL),(2010,'670','linguaInglesa','07','2018',600,'2018-07-06','pago',NULL,NULL),(2011,'669','propina','07','2018',2500,'2018-07-06','pago',NULL,NULL),(2012,'669','almoco','07','2018',1000,'2018-07-06','pago',NULL,NULL),(2013,'674','propina','07','2018',2493,'2018-07-06','pendente',NULL,NULL),(2014,'679','propina','07','2018',2500,'2018-07-06','pendente',NULL,NULL),(2015,'679','almoco','07','2018',1500,'2018-07-06','pendente',NULL,NULL);
/*!40000 ALTER TABLE `dividas` ENABLE KEYS */;
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
-- Table structure for table `estatisticas`
--

DROP TABLE IF EXISTS `estatisticas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estatisticas` (
  `idEstatistica` int(11) NOT NULL AUTO_INCREMENT,
  `idCrianca` int(11) DEFAULT NULL,
  `frequentouOutroJardim` varchar(50) DEFAULT NULL,
  `viveComPais` varchar(50) NOT NULL,
  `vacinaBCG` varchar(50) NOT NULL,
  `vacinaPolio` varchar(50) NOT NULL,
  `vacinaHepatiteB` varchar(50) NOT NULL,
  `vacinaSarampo` varchar(50) NOT NULL,
  `nee` varchar(50) NOT NULL,
  `timida` varchar(50) NOT NULL,
  `alegre` varchar(50) NOT NULL,
  `brinca` varchar(50) NOT NULL,
  `vaiCasaBanho` varchar(50) NOT NULL,
  `gostaJardim` varchar(50) NOT NULL,
  `relaciona` varchar(50) NOT NULL,
  `temAlergia` varchar(50) NOT NULL,
  PRIMARY KEY (`idEstatistica`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estatisticas`
--

LOCK TABLES `estatisticas` WRITE;
/*!40000 ALTER TABLE `estatisticas` DISABLE KEYS */;
INSERT INTO `estatisticas` VALUES (1,669,'','','','','','','SIM','NAO','','','','','',''),(2,670,'SIM','NAO','SIM','NAO','NAO','NAO','NAO','NAO','NAO','NAO','NAO','NAO','NAO','NAO'),(3,673,NULL,'','','','','','','','','','','','',''),(4,674,NULL,'','','','','','','','','','','','',''),(5,675,NULL,'','','','','','','','','','','','',''),(6,679,NULL,'','','','','','','','','','','','',''),(7,680,'SIM','','','','','','','','','','','','','SIM'),(8,690,NULL,'','','','','','','','','','','','',''),(9,684,NULL,'','','','','','','','','','','','',''),(10,687,NULL,'','','','','','','','','','','','',''),(11,688,'NAO','','','','','','','','','','','','',''),(12,689,NULL,'','','','','','','','','','','','',''),(13,690,NULL,'','','','','','','','','','','','',''),(14,691,NULL,'','','','','','','','','','','','',''),(15,692,'SIM','','NAO','SIM','NAO','SIM','NAO','SIM','NAO','SIM','NAO','SIM','NAO','');
/*!40000 ALTER TABLE `estatisticas` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=699 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mae`
--

LOCK TABLES `mae` WRITE;
/*!40000 ALTER TABLE `mae` DISABLE KEYS */;
INSERT INTO `mae` VALUES (670,'Jassina Cardoso Fernades','Teacher TTTTT','','','',''),(671,'Adozinda Correia Furtado ao quadrado','','','','',''),(672,'','','','','',''),(673,'','','','','',''),(674,'','','','','',''),(675,'','','','','',''),(676,'Mama','Mama tmb ta trabadja','','','',''),(677,'','','','','',''),(678,'','','','','',''),(679,'','','','','',''),(680,'','','','','',''),(681,'','','','','',''),(682,'Juana','Geofisico','','','',''),(683,'Felismina Correia Silva','Padeira','','','',''),(684,'Morgadinha','','','','',''),(685,'Morgadinha','','','','',''),(686,'Morgadinha','','','','',''),(687,'Morgadinha','','','','',''),(688,'Morgadinha','','','','',''),(689,'Morgadinha','','','','',''),(690,'wewewe','','','','',''),(691,'2344','','','','',''),(692,'2344','','','','',''),(693,'2344','','','','',''),(694,'Felismina Correia Silva','Domestica','2561261','','Calheta','Morgadinha'),(695,'','','','','',''),(696,'Ze MAe','','','','',''),(697,'Madinha','','','','',''),(698,'Mena Dilva','Domestica','2671233','9783245','Morrinho','Mena');
/*!40000 ALTER TABLE `mae` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagamento` (
  `id_pagamento` int(11) NOT NULL AUTO_INCREMENT,
  `ordem_pagamento` varchar(250) DEFAULT '0',
  `id_crianca` varchar(250) DEFAULT NULL,
  `tipo_pagamento` varchar(250) DEFAULT NULL,
  `mes_referencia` varchar(250) DEFAULT NULL,
  `ano_referencia` varchar(250) DEFAULT NULL,
  `dia_pagamento` date DEFAULT NULL,
  `montante_pago` int(250) DEFAULT NULL,
  `observacoes` varchar(250) DEFAULT NULL,
  `nome_user` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id_pagamento`)
) ENGINE=InnoDB AUTO_INCREMENT=543 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
INSERT INTO `pagamento` VALUES (533,'001062018','670','propina','07','2018','2018-07-06',1000,'Pagamento Normal','Gilson'),(534,'001062018','670','propina','07','2018','2018-07-06',1500,'Pagamento Normal','Gilson'),(535,'001062018','670','propina','07','2018','2018-07-07',1500,'Pagamento Dividas','Gilson'),(536,'001062018','670','almoco','07','2018','2018-07-07',3500,'Pagamento Dividas','Gilson'),(537,'001062018','670','linguaFrancesa','07','2018','2018-07-07',500,'Pagamento Dividas','Gilson'),(538,'001062018','670','linguaInglesa','07','2018','2018-07-07',600,'Pagamento Dividas','Gilson'),(539,'001062018','670','propina','01','2017','2018-07-07',4000,'Pagamento Normal','Gilson'),(540,'001062018','669','propina','07','2018','2018-07-07',2500,'Pagamento Dividas','Gilson'),(541,'001062018','669','almoco','07','2018','2018-07-07',1000,'Pagamento Dividas','Gilson'),(542,'001062018','669','almoco','01','2018','2018-07-07',1000,'Pagamento Normal','Gilson');
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=700 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pai`
--

LOCK TABLES `pai` WRITE;
/*!40000 ALTER TABLE `pai` DISABLE KEYS */;
INSERT INTO `pai` VALUES (672,'Mamadu Sabani DjalÃ³','Professore','2561261','9932124','Calheta','Morgadinha'),(673,'DeonildoPatricia Almeida Borges','','','','',''),(674,'','','','','',''),(675,'','','','','',''),(676,'','','','','',''),(677,'','','','','',''),(678,'Papa','Papa ta trabadja','','','',''),(679,'Papa','','','','',''),(680,'Mamarrrrrrr','','','','',''),(681,'','','','','',''),(682,'','','','','',''),(683,'','','','','',''),(684,'Joao','Informatico','','','',''),(685,'Valdemar da GraÃ§a','Emigrante','','','',''),(686,'Higino','','','','',''),(687,'Higino','','','','',''),(688,'Higino','','','','',''),(689,'Higino','','','','',''),(690,'Higino','','','','',''),(691,'wewe','','','','',''),(692,'122','','','','',''),(693,'122','','','','',''),(694,'122','','','','',''),(695,'Valdemir da GraÃ§a','Emigrante','003512345','9873421','Portugal','Valdemir'),(696,'','','','','',''),(697,'Ze Pai','','','','',''),(698,'Juvino','','','','',''),(699,'Hildo Fernades','Motoqueiro','2561261','9932125','Morr','Hildo');
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

-- Dump completed on 2018-07-10  0:05:04
