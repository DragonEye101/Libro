-- MySQL dump 10.13  Distrib 5.5.15, for Win32 (x86)
--
-- Host: localhost    Database: eso
-- ------------------------------------------------------
-- Server version	5.5.15

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
-- Current Database: `eso`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `eso` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `eso`;

--
-- Table structure for table `autor`
--

DROP TABLE IF EXISTS `autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autor` (
  `ID_Autor` smallint(5) NOT NULL,
  `Nombre_autor` varchar(15) NOT NULL,
  `Apellido_paterno_autor` varchar(15) NOT NULL,
  `Apellido_materno_autor` varchar(15) NOT NULL,
  `Fecha_nacimiento` date NOT NULL,
  `Nacionalidad` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_Autor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor`
--

LOCK TABLES `autor` WRITE;
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
/*!40000 ALTER TABLE `autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `RUT` varchar(9) NOT NULL,
  `Nombre1_cliente` varchar(15) NOT NULL,
  `Nombre2_cliente` varchar(15) NOT NULL,
  `Apellido_paterno_cliente` varchar(15) NOT NULL,
  `Apellido_materno_cliente` varchar(15) NOT NULL,
  `Fono` varchar(9) NOT NULL,
  `Direccion` smallint(10) NOT NULL,
  `edad` smallint(6) NOT NULL,
  `comuna_ID_Comuna` smallint(4) NOT NULL,
  PRIMARY KEY (`RUT`),
  KEY `fk_cliente_comuna1` (`comuna_ID_Comuna`),
  CONSTRAINT `fk_cliente_comuna1` FOREIGN KEY (`comuna_ID_Comuna`) REFERENCES `comuna` (`ID_Comuna`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compra` (
  `ID_Compra` smallint(5) NOT NULL,
  `Desc_compra` smallint(5) NOT NULL,
  `total` smallint(6) NOT NULL,
  `Cliente_RUT` varchar(9) NOT NULL,
  `Forma_Pago_ID_FP` smallint(4) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`ID_Compra`),
  KEY `fk_Compra_Forma_Pago1_idx` (`Forma_Pago_ID_FP`),
  KEY `fk_Compra_Cliente1_idx` (`Cliente_RUT`),
  CONSTRAINT `fk_Compra_Cliente1` FOREIGN KEY (`Cliente_RUT`) REFERENCES `cliente` (`RUT`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Compra_Forma_Pago1` FOREIGN KEY (`Forma_Pago_ID_FP`) REFERENCES `forma_pago` (`ID_FP`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comuna`
--

DROP TABLE IF EXISTS `comuna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comuna` (
  `ID_Comuna` smallint(4) NOT NULL,
  `Nombre_comuna` varchar(15) NOT NULL,
  `region_ID_Region` smallint(4) NOT NULL,
  PRIMARY KEY (`ID_Comuna`),
  KEY `fk_comuna_region1` (`region_ID_Region`),
  CONSTRAINT `fk_comuna_region1` FOREIGN KEY (`region_ID_Region`) REFERENCES `region` (`ID_Region`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comuna`
--

LOCK TABLES `comuna` WRITE;
/*!40000 ALTER TABLE `comuna` DISABLE KEYS */;
/*!40000 ALTER TABLE `comuna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editorial`
--

DROP TABLE IF EXISTS `editorial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `editorial` (
  `ideditorial` smallint(6) NOT NULL,
  `nombreeditorial` varchar(45) NOT NULL,
  `contacto` varchar(45) NOT NULL,
  PRIMARY KEY (`ideditorial`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editorial`
--

LOCK TABLES `editorial` WRITE;
/*!40000 ALTER TABLE `editorial` DISABLE KEYS */;
/*!40000 ALTER TABLE `editorial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forma_pago`
--

DROP TABLE IF EXISTS `forma_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forma_pago` (
  `ID_FP` smallint(4) NOT NULL,
  `Tipo_pago` varchar(15) NOT NULL,
  PRIMARY KEY (`ID_FP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forma_pago`
--

LOCK TABLES `forma_pago` WRITE;
/*!40000 ALTER TABLE `forma_pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `forma_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libro`
--

DROP TABLE IF EXISTS `libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `libro` (
  `ISBN` smallint(5) NOT NULL,
  `Titulo_Nombre` varchar(20) NOT NULL,
  `Cant_paginas` smallint(4) NOT NULL,
  `Ano` year(4) NOT NULL,
  `Stock` smallint(4) NOT NULL,
  `Precio` smallint(5) NOT NULL,
  `editorial_ideditorial` smallint(6) NOT NULL,
  PRIMARY KEY (`ISBN`),
  KEY `fk_libro_editorial1` (`editorial_ideditorial`),
  CONSTRAINT `fk_libro_editorial1` FOREIGN KEY (`editorial_ideditorial`) REFERENCES `editorial` (`ideditorial`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libro`
--

LOCK TABLES `libro` WRITE;
/*!40000 ALTER TABLE `libro` DISABLE KEYS */;
/*!40000 ALTER TABLE `libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libro_has_autor`
--

DROP TABLE IF EXISTS `libro_has_autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `libro_has_autor` (
  `libro_ISBN` smallint(5) NOT NULL,
  `autor_ID_Autor` smallint(5) NOT NULL,
  PRIMARY KEY (`libro_ISBN`,`autor_ID_Autor`),
  KEY `fk_libro_has_autor_autor1` (`autor_ID_Autor`),
  KEY `fk_libro_has_autor_libro1` (`libro_ISBN`),
  CONSTRAINT `fk_libro_has_autor_libro1` FOREIGN KEY (`libro_ISBN`) REFERENCES `libro` (`ISBN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_libro_has_autor_autor1` FOREIGN KEY (`autor_ID_Autor`) REFERENCES `autor` (`ID_Autor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libro_has_autor`
--

LOCK TABLES `libro_has_autor` WRITE;
/*!40000 ALTER TABLE `libro_has_autor` DISABLE KEYS */;
/*!40000 ALTER TABLE `libro_has_autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libro_has_compra`
--

DROP TABLE IF EXISTS `libro_has_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `libro_has_compra` (
  `libro_ISBN` smallint(5) NOT NULL,
  `compra_ID_Compra` smallint(5) NOT NULL,
  `cantidad` smallint(6) NOT NULL,
  PRIMARY KEY (`libro_ISBN`,`compra_ID_Compra`),
  KEY `fk_libro_has_compra_compra1` (`compra_ID_Compra`),
  KEY `fk_libro_has_compra_libro1` (`libro_ISBN`),
  CONSTRAINT `fk_libro_has_compra_libro1` FOREIGN KEY (`libro_ISBN`) REFERENCES `libro` (`ISBN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_libro_has_compra_compra1` FOREIGN KEY (`compra_ID_Compra`) REFERENCES `compra` (`ID_Compra`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libro_has_compra`
--

LOCK TABLES `libro_has_compra` WRITE;
/*!40000 ALTER TABLE `libro_has_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `libro_has_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region` (
  `ID_Region` smallint(4) NOT NULL,
  `Nombre_region` varchar(15) NOT NULL,
  `Provincia_ID_Provincia` smallint(4) NOT NULL,
  PRIMARY KEY (`ID_Region`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-08 14:53:21
