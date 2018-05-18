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
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `sexo` varchar(255) DEFAULT NULL,
  `dataNascimento` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `idade` int(255) DEFAULT NULL,
  `alcunha` varchar(255) DEFAULT NULL,
  `numeroPMI` varchar(255) DEFAULT NULL,
  `propina` int(255) DEFAULT NULL,
  `nomePai` varchar(255) DEFAULT NULL,
  `nomeMae` varchar(250) DEFAULT NULL,
  `encaregadoEducacao` varchar(250) DEFAULT NULL,
  `morada` varchar(250) DEFAULT NULL,
  `dataInicioJardim` date DEFAULT NULL,
  `estado` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=665 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `criancas`
--

LOCK TABLES `criancas` WRITE;
/*!40000 ALTER TABLE `criancas` DISABLE KEYS */;
INSERT INTO `criancas` VALUES (658,'Joana','','2018-08-08 00:00:00',0,'','',2500,'','','','','2018-03-12','Matriculado'),(659,'Tuta','','2018-08-08 00:00:00',0,'','',223,'','','','','2018-03-12','Matriculado'),(660,'Gilson','','2018-05-17 00:00:00',0,'','',2500,'','','','','2018-03-12',''),(661,'Gilson','','2018-05-17 00:00:00',0,'','',2500,'','','','','2018-03-12','Matriculado'),(662,'Hub','Feminino','2018-05-09 00:00:00',0,'','',2500,'','','','Palmarejo','2018-03-12','Matriculado'),(663,'Adelcides','Masculino','1998-08-12 00:00:00',19,'Ade','234/1998',2590,'Adelcides Pai','Adelcides Mai','','Palmarejo','2018-05-04','Matriculado'),(664,'Ayanne Sophia Silva Barreto de Carvalho','Feminino','2012-03-03 00:00:00',6,'Ayanne','123/2012',4000,'Danilo Lopes Barreto de Carvalho','Jocimara Romina Silva Neves','','Palmarejo','2018-05-17','Matriculado');
/*!40000 ALTER TABLE `criancas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-18  5:56:09
