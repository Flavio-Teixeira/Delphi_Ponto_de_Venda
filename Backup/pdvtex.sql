-- MySQL dump 10.13  Distrib 5.1.37, for Win32 (ia32)
--
-- Host: localhost    Database: pdvtex
-- ------------------------------------------------------
-- Server version	5.1.37-community-log

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
-- Table structure for table `cabeca_cupons`
--

DROP TABLE IF EXISTS `cabeca_cupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cabeca_cupons` (
  `Cabeca_Cupom_Numero` int(11) NOT NULL AUTO_INCREMENT,
  `Cabeca_Cupom_Maquina` varchar(10) NOT NULL DEFAULT '',
  `Cabeca_Cupom_Status` varchar(10) DEFAULT NULL,
  `Cabeca_Cupom_Forma_Pgto` char(1) DEFAULT NULL,
  `Cabeca_Cupom_Vlr_Total` double(13,2) DEFAULT NULL,
  `Cabeca_Cupom_Vlr_Pago` double(13,2) DEFAULT NULL,
  `Cabeca_Cupom_Vlr_Troco` double(13,2) DEFAULT NULL,
  `Cabeca_Cupom_Qtd_Itens` smallint(6) DEFAULT NULL,
  `Cabeca_Cupom_Data_Emissao` date DEFAULT NULL,
  `Cabeca_Cupom_Hora_Emissao` varchar(8) DEFAULT NULL,
  `Cabeca_Cupom_Cliente_Codigo` varchar(80) DEFAULT NULL,
  `Cabeca_Cupom_Cliente_Razao_Social` varchar(100) DEFAULT NULL,
  `Cabeca_Cupom_Cliente_Status` varchar(10) NOT NULL DEFAULT 'Aguardando',
  PRIMARY KEY (`Cabeca_Cupom_Numero`,`Cabeca_Cupom_Maquina`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cabeca_cupons`
--

LOCK TABLES `cabeca_cupons` WRITE;
/*!40000 ALTER TABLE `cabeca_cupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `cabeca_cupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cabeca_cupons_movto`
--

DROP TABLE IF EXISTS `cabeca_cupons_movto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cabeca_cupons_movto` (
  `Cabeca_Cupom_Posicao` int(11) NOT NULL AUTO_INCREMENT,
  `Cabeca_Cupom_Numero` int(11) NOT NULL DEFAULT '0',
  `Cabeca_Cupom_Maquina` varchar(10) NOT NULL DEFAULT '',
  `Cabeca_Cupom_Status` varchar(10) DEFAULT NULL,
  `Cabeca_Cupom_Forma_Pgto` char(1) DEFAULT NULL,
  `Cabeca_Cupom_Vlr_Total` double(13,2) DEFAULT NULL,
  `Cabeca_Cupom_Vlr_Pago` double(13,2) DEFAULT NULL,
  `Cabeca_Cupom_Vlr_Troco` double(13,2) DEFAULT NULL,
  `Cabeca_Cupom_Qtd_Itens` smallint(6) DEFAULT NULL,
  `Cabeca_Cupom_Data_Emissao` datetime DEFAULT NULL,
  `Cabeca_Cupom_Hora_Emissao` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`Cabeca_Cupom_Posicao`,`Cabeca_Cupom_Numero`,`Cabeca_Cupom_Maquina`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cabeca_cupons_movto`
--

LOCK TABLES `cabeca_cupons_movto` WRITE;
/*!40000 ALTER TABLE `cabeca_cupons_movto` DISABLE KEYS */;
/*!40000 ALTER TABLE `cabeca_cupons_movto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conexao`
--

DROP TABLE IF EXISTS `conexao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conexao` (
  `Conexao_Caminho` varchar(100) DEFAULT NULL,
  `Conexao_Registro` varchar(255) DEFAULT NULL,
  `Conexao_Loja` varchar(50) DEFAULT NULL,
  `Conexao_Loja_Curto` varchar(15) DEFAULT NULL,
  `Conexao_Endereco` varchar(80) DEFAULT NULL,
  `Conexao_Complemento` varchar(80) DEFAULT NULL,
  `Conexao_Bairro` varchar(80) DEFAULT NULL,
  `Conexao_Cidade` varchar(80) DEFAULT NULL,
  `Conexao_UF` char(2) DEFAULT NULL,
  `Conexao_Cep` varchar(9) DEFAULT NULL,
  `Conexao_Fone` varchar(40) DEFAULT NULL,
  `Conexao_Email` varchar(80) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conexao`
--

LOCK TABLES `conexao` WRITE;
/*!40000 ALTER TABLE `conexao` DISABLE KEYS */;
INSERT INTO `conexao` VALUES (NULL,'12860712860701070721021192710',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `conexao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corpo_cupons`
--

DROP TABLE IF EXISTS `corpo_cupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corpo_cupons` (
  `Corpo_Cupom_Cabeca` int(11) NOT NULL DEFAULT '0',
  `Corpo_Cupom_Maquina` varchar(10) NOT NULL DEFAULT '',
  `Corpo_Cupom_Prod_Codigo` int(11) NOT NULL DEFAULT '0',
  `Corpo_Cupom_Prod_Desc` varchar(100) DEFAULT NULL,
  `Corpo_Cupom_Prod_Desc_Curta` varchar(20) DEFAULT NULL,
  `Corpo_Cupom_Prod_Qtde` smallint(6) DEFAULT NULL,
  `Corpo_Cupom_Prod_Vlr_Unitario` double(13,2) DEFAULT NULL,
  `Corpo_Cupom_Vlr_Total` double(13,2) DEFAULT NULL,
  PRIMARY KEY (`Corpo_Cupom_Cabeca`,`Corpo_Cupom_Maquina`,`Corpo_Cupom_Prod_Codigo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corpo_cupons`
--

LOCK TABLES `corpo_cupons` WRITE;
/*!40000 ALTER TABLE `corpo_cupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `corpo_cupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corpo_cupons_movto`
--

DROP TABLE IF EXISTS `corpo_cupons_movto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corpo_cupons_movto` (
  `Corpo_Cupom_Posicao` int(11) NOT NULL AUTO_INCREMENT,
  `Corpo_Cupom_Cabeca` int(11) NOT NULL DEFAULT '0',
  `Corpo_Cupom_Maquina` varchar(10) NOT NULL DEFAULT '',
  `Corpo_Cupom_Prod_Codigo` int(11) NOT NULL DEFAULT '0',
  `Corpo_Cupom_Prod_Desc` varchar(100) DEFAULT NULL,
  `Corpo_Cupom_Prod_Desc_Curta` varchar(20) DEFAULT NULL,
  `Corpo_Cupom_Prod_Qtde` smallint(6) DEFAULT NULL,
  `Corpo_Cupom_Prod_Vlr_Unitario` double(13,2) DEFAULT NULL,
  `Corpo_Cupom_Vlr_Total` double(13,2) DEFAULT NULL,
  `Corpo_Cupom_Data_Emissao` date DEFAULT NULL,
  `Corpo_Cupom_Hora_Emissao` varchar(8) DEFAULT NULL,
  `Corpo_Cupom_Status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Corpo_Cupom_Prod_Codigo`,`Corpo_Cupom_Maquina`,`Corpo_Cupom_Cabeca`,`Corpo_Cupom_Posicao`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corpo_cupons_movto`
--

LOCK TABLES `corpo_cupons_movto` WRITE;
/*!40000 ALTER TABLE `corpo_cupons_movto` DISABLE KEYS */;
/*!40000 ALTER TABLE `corpo_cupons_movto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresa` (
  `Empresa_Razao_Social` varchar(100) DEFAULT '',
  `Empresa_Nome_Exibicao` varchar(100) DEFAULT '',
  `Empresa_Endereco` varchar(100) DEFAULT '',
  `Empresa_Bairro` varchar(100) DEFAULT '',
  `Empresa_Cidade` varchar(100) DEFAULT '',
  `Empresa_Estado` char(2) DEFAULT '',
  `Empresa_Cep` varchar(9) DEFAULT '',
  `Empresa_Fone` varchar(50) DEFAULT '',
  `Empresa_Vincula_Cliente` varchar(3) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES ('Datatex Informática e Serviços Ltda','DATATEX','Av. Araucária, 1164','Parque Novo Oratório','Santo André','SP','09251-040','(11)2896-4707','-1');
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrada_nota_cabeca`
--

DROP TABLE IF EXISTS `entrada_nota_cabeca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrada_nota_cabeca` (
  `Entrada_Nota_Cabeca_Numero` int(11) NOT NULL AUTO_INCREMENT,
  `Entrada_Nota_Cabeca_Lacto` date DEFAULT NULL,
  `Entrada_Nota_Cabeca_Fornecedor_Cod` int(11) DEFAULT NULL,
  `Entrada_Nota_Cabeca_Fornecedor_Desc` varchar(50) DEFAULT NULL,
  `Entrada_Nota_Cabeca_Nota` varchar(10) DEFAULT NULL,
  `Entrada_Nota_Cabeca_Emissao` date DEFAULT NULL,
  `Entrada_Nota_Cabeca_Cond_Pgto` varchar(50) DEFAULT NULL,
  `Entrada_Nota_Cabeca_IPI` double(13,2) DEFAULT NULL,
  `Entrada_Nota_Cabeca_Desconto` double(13,2) DEFAULT NULL,
  `Entrada_Nota_Cabeca_Total` double(13,2) DEFAULT NULL,
  `Entrada_Nota_Cabeca_Ajusta` char(1) DEFAULT NULL,
  PRIMARY KEY (`Entrada_Nota_Cabeca_Numero`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrada_nota_cabeca`
--

LOCK TABLES `entrada_nota_cabeca` WRITE;
/*!40000 ALTER TABLE `entrada_nota_cabeca` DISABLE KEYS */;
/*!40000 ALTER TABLE `entrada_nota_cabeca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrada_nota_produto`
--

DROP TABLE IF EXISTS `entrada_nota_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrada_nota_produto` (
  `Entrada_Nota_Produto_Numero` int(11) NOT NULL AUTO_INCREMENT,
  `Entrada_Nota_Produto_Cabeca` int(11) DEFAULT NULL,
  `Entrada_Nota_Produto_Cod` int(11) DEFAULT NULL,
  `Entrada_Nota_Produto_Desc` varchar(100) DEFAULT NULL,
  `Entrada_Nota_Produto_Qtde` int(11) DEFAULT NULL,
  `Entrada_Nota_Produto_Unit` double(13,2) DEFAULT NULL,
  `Entrada_Nota_Produto_Total` double(13,2) DEFAULT NULL,
  PRIMARY KEY (`Entrada_Nota_Produto_Numero`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrada_nota_produto`
--

LOCK TABLES `entrada_nota_produto` WRITE;
/*!40000 ALTER TABLE `entrada_nota_produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `entrada_nota_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fechamentos_caixas`
--

DROP TABLE IF EXISTS `fechamentos_caixas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fechamentos_caixas` (
  `fechamento_caixa_maquina` varchar(10) NOT NULL DEFAULT '',
  `fechamento_caixa_nro_ultimo_cupom` varchar(11) DEFAULT '',
  `fechamento_caixa_vlr_ultimo_cupom` double(13,2) DEFAULT '0.00',
  `fechamento_caixa_qtde_cupons` int(11) DEFAULT '0',
  `fechamento_caixa_vlr_abertura` double(13,2) DEFAULT '0.00',
  `fechamento_caixa_vlr_vendas` double(13,2) DEFAULT '0.00',
  `fechamento_caixa_vlr_sangria` double(13,2) DEFAULT '0.00',
  `fechamento_caixa_vlr_total_caixa` double(13,2) DEFAULT '0.00',
  `fechamento_caixa_vlr_venda_diaria` double(13,2) DEFAULT '0.00',
  PRIMARY KEY (`fechamento_caixa_maquina`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fechamentos_caixas`
--

LOCK TABLES `fechamentos_caixas` WRITE;
/*!40000 ALTER TABLE `fechamentos_caixas` DISABLE KEYS */;
/*!40000 ALTER TABLE `fechamentos_caixas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedores`
--

DROP TABLE IF EXISTS `fornecedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fornecedores` (
  `Fornecedor_Numero` int(11) NOT NULL AUTO_INCREMENT,
  `Fornecedor_CNPJ` varchar(18) DEFAULT NULL,
  `Fornecedor_IE` varchar(20) DEFAULT NULL,
  `Fornecedor_Razao_Social` varchar(100) DEFAULT NULL,
  `Fornecedor_Nome_Fantasia` varchar(100) DEFAULT NULL,
  `Fornecedor_Ramo_Atividade` varchar(100) DEFAULT NULL,
  `Fornecedor_Endereco` varchar(100) DEFAULT NULL,
  `Fornecedor_Complemento` varchar(100) DEFAULT NULL,
  `Fornecedor_Bairro` varchar(100) DEFAULT NULL,
  `Fornecedor_Cidade` varchar(100) DEFAULT NULL,
  `Fornecedor_Estado` char(2) DEFAULT NULL,
  `Fornecedor_CEP` varchar(9) DEFAULT NULL,
  `Fornecedor_Fone_Comercial` varchar(15) DEFAULT NULL,
  `Fornecedor_Fone_Celular` varchar(15) DEFAULT NULL,
  `Fornecedor_Fone_Fax` varchar(15) DEFAULT NULL,
  `Fornecedor_Contato` varchar(100) DEFAULT NULL,
  `Fornecedor_Email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Fornecedor_Numero`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedores`
--

LOCK TABLES `fornecedores` WRITE;
/*!40000 ALTER TABLE `fornecedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `fornecedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedores_vazio`
--

DROP TABLE IF EXISTS `fornecedores_vazio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fornecedores_vazio` (
  `Fornecedor_Numero` int(11) NOT NULL DEFAULT '0',
  `Fornecedor_CNPJ` varchar(18) DEFAULT NULL,
  `Fornecedor_IE` varchar(20) DEFAULT NULL,
  `Fornecedor_Razao_Social` varchar(100) DEFAULT NULL,
  `Fornecedor_Nome_Fantasia` varchar(100) DEFAULT NULL,
  `Fornecedor_Ramo_Atividade` varchar(100) DEFAULT NULL,
  `Fornecedor_Endereco` varchar(100) DEFAULT NULL,
  `Fornecedor_Complemento` varchar(100) DEFAULT NULL,
  `Fornecedor_Bairro` varchar(100) DEFAULT NULL,
  `Fornecedor_Cidade` varchar(100) DEFAULT NULL,
  `Fornecedor_Estado` char(2) DEFAULT NULL,
  `Fornecedor_CEP` varchar(9) DEFAULT NULL,
  `Fornecedor_Fone_Comercial` varchar(15) DEFAULT NULL,
  `Fornecedor_Fone_Celular` varchar(15) DEFAULT NULL,
  `Fornecedor_Fone_Fax` varchar(15) DEFAULT NULL,
  `Fornecedor_Contato` varchar(100) DEFAULT NULL,
  `Fornecedor_Email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Fornecedor_Numero`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedores_vazio`
--

LOCK TABLES `fornecedores_vazio` WRITE;
/*!40000 ALTER TABLE `fornecedores_vazio` DISABLE KEYS */;
/*!40000 ALTER TABLE `fornecedores_vazio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupos`
--

DROP TABLE IF EXISTS `grupos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupos` (
  `Grupo_Numero` int(11) NOT NULL AUTO_INCREMENT,
  `Grupo_Descricao` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Grupo_Numero`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupos`
--

LOCK TABLES `grupos` WRITE;
/*!40000 ALTER TABLE `grupos` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `informacao_maquinas`
--

DROP TABLE IF EXISTS `informacao_maquinas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `informacao_maquinas` (
  `Informacao_Maquina_HD` varchar(10) NOT NULL DEFAULT '',
  `Informacao_Maquina_Descricao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Informacao_Maquina_HD`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `informacao_maquinas`
--

LOCK TABLES `informacao_maquinas` WRITE;
/*!40000 ALTER TABLE `informacao_maquinas` DISABLE KEYS */;
INSERT INTO `informacao_maquinas` VALUES ('6609E511','DATATEX');
/*!40000 ALTER TABLE `informacao_maquinas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `informacao_maquinas_vazio`
--

DROP TABLE IF EXISTS `informacao_maquinas_vazio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `informacao_maquinas_vazio` (
  `Informacao_Maquina_HD` varchar(10) NOT NULL DEFAULT '',
  `Informacao_Maquina_Descricao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Informacao_Maquina_HD`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `informacao_maquinas_vazio`
--

LOCK TABLES `informacao_maquinas_vazio` WRITE;
/*!40000 ALTER TABLE `informacao_maquinas_vazio` DISABLE KEYS */;
INSERT INTO `informacao_maquinas_vazio` VALUES ('6609E511','DATATEX');
/*!40000 ALTER TABLE `informacao_maquinas_vazio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_cancelado`
--

DROP TABLE IF EXISTS `item_cancelado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_cancelado` (
  `Item_Cancelado_Numero` int(11) NOT NULL AUTO_INCREMENT,
  `Item_Cancelado_Data` date DEFAULT NULL,
  `Item_Cancelado_Hora` varchar(8) DEFAULT NULL,
  `Item_Cancelado_Maquina` varchar(10) DEFAULT NULL,
  `Item_Cancelado_Usuario` varchar(50) DEFAULT NULL,
  `Item_Cancelado_Prod_Cod` int(11) DEFAULT NULL,
  `Item_Cancelado_Prod_Desc` varchar(100) DEFAULT NULL,
  `Item_Cancelado_Prod_Qtde` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`Item_Cancelado_Numero`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_cancelado`
--

LOCK TABLES `item_cancelado` WRITE;
/*!40000 ALTER TABLE `item_cancelado` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_cancelado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_cancelado_movto`
--

DROP TABLE IF EXISTS `item_cancelado_movto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_cancelado_movto` (
  `Item_Cancelado_Numero` int(11) NOT NULL AUTO_INCREMENT,
  `Item_Cancelado_Data` date DEFAULT NULL,
  `Item_Cancelado_Hora` varchar(8) DEFAULT NULL,
  `Item_Cancelado_Maquina` varchar(10) DEFAULT NULL,
  `Item_Cancelado_Usuario` varchar(50) DEFAULT NULL,
  `Item_Cancelado_Prod_Cod` int(11) DEFAULT NULL,
  `Item_Cancelado_Prod_Desc` varchar(100) DEFAULT NULL,
  `Item_Cancelado_Prod_Qtde` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`Item_Cancelado_Numero`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_cancelado_movto`
--

LOCK TABLES `item_cancelado_movto` WRITE;
/*!40000 ALTER TABLE `item_cancelado_movto` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_cancelado_movto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lucratividade`
--

DROP TABLE IF EXISTS `lucratividade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lucratividade` (
  `Lucratividade_Codigo` varchar(15) NOT NULL DEFAULT '',
  `Lucratividade_Descricao` varchar(100) DEFAULT NULL,
  `Lucratividade_Qtde` int(11) DEFAULT NULL,
  `Lucratividade_Preco_Venda` double(13,2) DEFAULT NULL,
  `Lucratividade_Total_Faturado` double(13,2) DEFAULT NULL,
  `Lucratividade_Ultimo_Custo` double(13,2) DEFAULT NULL,
  `Lucratividade_Custo_Total` double(13,2) DEFAULT NULL,
  `Lucratividade_Lucro_Bruto` double(13,2) DEFAULT NULL,
  `Lucratividade_Margem_Lucro` double(13,2) DEFAULT NULL,
  `Lucratividade_Grupo` int(11) DEFAULT NULL,
  `Lucratividade_Grupo_Descricao` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Lucratividade_Codigo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lucratividade`
--

LOCK TABLES `lucratividade` WRITE;
/*!40000 ALTER TABLE `lucratividade` DISABLE KEYS */;
/*!40000 ALTER TABLE `lucratividade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgt_clientes`
--

DROP TABLE IF EXISTS `mgt_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mgt_clientes` (
  `mgt_cliente_codigo` varchar(80) NOT NULL,
  `mgt_cliente_codigo_tipo` varchar(6) DEFAULT '',
  `mgt_cliente_nome` varchar(100) DEFAULT '',
  `mgt_cliente_razao_social` varchar(100) DEFAULT '',
  `mgt_cliente_inscricao_municipal` varchar(20) DEFAULT '',
  `mgt_cliente_inscricao_estadual` varchar(20) DEFAULT '',
  `mgt_cliente_endereco` varchar(100) DEFAULT '',
  `mgt_cliente_complemento` varchar(80) DEFAULT '',
  `mgt_cliente_bairro` varchar(80) DEFAULT '',
  `mgt_cliente_cidade` varchar(80) DEFAULT '',
  `mgt_cliente_estado` char(2) DEFAULT '',
  `mgt_cliente_cep` varchar(9) DEFAULT '',
  `mgt_cliente_contato` varchar(50) DEFAULT '',
  `mgt_cliente_ddd` char(3) DEFAULT '',
  `mgt_cliente_fone_comercial` varchar(50) DEFAULT '',
  `mgt_cliente_fone_residencial` varchar(50) DEFAULT '',
  `mgt_cliente_fone_celular` varchar(50) DEFAULT '',
  `mgt_cliente_fone_fax` varchar(50) DEFAULT '',
  `mgt_cliente_fone_ramal` varchar(5) DEFAULT '',
  `mgt_cliente_endereco_cobranca` varchar(100) DEFAULT '',
  `mgt_cliente_complemento_cobranca` varchar(80) DEFAULT '',
  `mgt_cliente_bairro_cobranca` varchar(80) DEFAULT '',
  `mgt_cliente_cidade_cobranca` varchar(80) DEFAULT '',
  `mgt_cliente_estado_cobranca` char(2) DEFAULT '',
  `mgt_cliente_cep_cobranca` varchar(9) DEFAULT '',
  `mgt_cliente_pais_cobranca` varchar(80) DEFAULT '',
  `mgt_cliente_opcao_cobranca` varchar(7) DEFAULT '',
  `mgt_cliente_fone_cobranca` varchar(50) DEFAULT '',
  `mgt_cliente_fax_cobranca` varchar(50) DEFAULT '',
  `mgt_cliente_endereco_entrega` varchar(100) DEFAULT '',
  `mgt_cliente_complemento_entrega` varchar(80) DEFAULT '',
  `mgt_cliente_bairro_entrega` varchar(80) DEFAULT '',
  `mgt_cliente_cidade_entrega` varchar(80) DEFAULT '',
  `mgt_cliente_estado_entrega` char(2) DEFAULT '',
  `mgt_cliente_cep_entrega` varchar(9) DEFAULT '',
  `mgt_cliente_pais_entrega` varchar(80) DEFAULT '',
  `mgt_cliente_opcao_entrega` varchar(7) DEFAULT '',
  `mgt_cliente_fone_entrega` varchar(50) DEFAULT '',
  `mgt_cliente_fax_entrega` varchar(50) DEFAULT '',
  `mgt_cliente_valor_credito` double(13,2) DEFAULT '0.00',
  `mgt_cliente_status_credito` char(1) DEFAULT '',
  `mgt_cliente_banco` int(3) DEFAULT '0',
  `mgt_cliente_tipo` int(2) DEFAULT '0',
  `mgt_cliente_vendedor` int(3) DEFAULT '0',
  `mgt_cliente_tipo_pessoa` char(2) DEFAULT '',
  `mgt_cliente_consignacao` char(1) DEFAULT '',
  `mgt_cliente_zona` int(3) DEFAULT '0',
  `mgt_cliente_data_inclusao` date DEFAULT NULL,
  `mgt_cliente_data_visita` date DEFAULT NULL,
  `mgt_cliente_data_alteracao` date DEFAULT NULL,
  `mgt_cliente_data_ultima_compra` date DEFAULT NULL,
  `mgt_cliente_ultimo_valor` double(13,2) DEFAULT '0.00',
  `mgt_cliente_observacoes` text,
  `mgt_cliente_observacoes_nota` text,
  `mgt_cliente_pais` varchar(80) DEFAULT '',
  `mgt_cliente_email` varchar(80) DEFAULT '',
  `mgt_cliente_site` varchar(80) DEFAULT '',
  `mgt_cliente_desconto` double(7,3) DEFAULT '0.000',
  `mgt_cliente_condicao_pgto_1` int(2) DEFAULT '0',
  `mgt_cliente_condicao_pgto_2` int(2) DEFAULT '0',
  `mgt_cliente_condicao_pgto_3` int(2) DEFAULT '0',
  `mgt_cliente_condicao_pgto_4` int(2) DEFAULT '0',
  `mgt_cliente_tipo_transporte` varchar(15) DEFAULT '',
  `mgt_cliente_transportadora` int(11) DEFAULT '0',
  `mgt_cliente_tipo_faturamento` varchar(15) DEFAULT '',
  `mgt_cliente_tipo_tabela` varchar(15) DEFAULT '',
  `mgt_cliente_emite_lote` char(1) DEFAULT '',
  `mgt_cliente_consumo` char(1) DEFAULT '',
  `mgt_cliente_pgto_frete` varchar(10) DEFAULT '',
  `mgt_cliente_suframa` varchar(255) DEFAULT '',
  `mgt_cliente_fone` varchar(50) DEFAULT '',
  `mgt_cliente_fax` varchar(50) DEFAULT '',
  `mgt_cliente_icms` double(7,3) DEFAULT '0.000',
  `mgt_cliente_base_icms` double(7,3) DEFAULT '0.000',
  PRIMARY KEY (`mgt_cliente_codigo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mgt_clientes`
--

LOCK TABLES `mgt_clientes` WRITE;
/*!40000 ALTER TABLE `mgt_clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `mgt_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissao_acessos`
--

DROP TABLE IF EXISTS `permissao_acessos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissao_acessos` (
  `Permissao_Acesso_Login` varchar(50) NOT NULL DEFAULT '',
  `Permissao_Acesso_Area` varchar(50) NOT NULL DEFAULT '',
  `Permissao_Acesso_Descricao` varchar(100) DEFAULT NULL,
  `Permissao_Acesso_Permitido` char(1) DEFAULT NULL,
  `Permissao_Acesso_Posicao` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`Permissao_Acesso_Login`,`Permissao_Acesso_Area`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissao_acessos`
--

LOCK TABLES `permissao_acessos` WRITE;
/*!40000 ALTER TABLE `permissao_acessos` DISABLE KEYS */;
INSERT INTO `permissao_acessos` VALUES ('Padrão','mnu_Frente_Loja              ','1. Frente_Loja','S',1),('Padrão','mnu_Cadastros                ','2. Cadastros','S',2),('Padrão','mnu_Cadastros_Fornecedores   ','2.1. Cadastros >> Fornecedores','S',3),('Padrão','mnu_Cadastros_Grupos         ','2.2. Cadastros >> Grupos','S',4),('Padrão','mnu_Cadastros_Produtos       ','2.3. Cadastros >> Produtos','S',5),('Padrão','mnu_Cadastros_Usuarios       ','2.4. Cadastros >> Usuários','S',6),('Padrão','mnu_Cadastros_Maquinas       ','2.5. Cadastros >> Informação das Máquinas','S',7),('Padrão','Empresa1                     ','2.6. Cadastros >> Informações da Empresa','S',8),('Padrão','Clientes1                    ','2.7. Cadastros >> Clientes','S',9),('Padrão','mnu_Estoque                  ','3. Estoque','S',10),('Padrão','mnu_Estoque_Ajuste           ','3.1. Estoque >> Ajuste de Estoque','S',11),('Padrão','PosioAtualdoEstoque1         ','3.2. Estoque >> Posição Atual de Estoque','S',12),('Padrão','EntradadeProdutos1           ','3.3. Estoque >> Entrada de Produtos','S',13),('Padrão','NotadeEntrada1               ','3.3.1. Estoque >> Entrada de Produtos >> Nota de Entrada','S',14),('Padrão','CancelamentodeNotadeEntrada1 ','3.3.2. Estoque >> Entrada de Produtos >> Cancelamento de Nota de Entrada','S',15),('Padrão','HistricodeNotasdeEntradas1   ','3.3.3. Estoque >> Entrada de Produtos >> Histórico de Notas de Entradas','S',16),('Padrão','mnu_Relatorios               ','4. Relatórios','S',17),('Padrão','Lucratividade1               ','4.1. Relatórios >> Lucratividade','S',18),('Padrão','FechamentodeCaixa1           ','4.2. Relatórios >> Fechamento de Caixa','S',19),('Padrão','mnu_Relatorios_Registro_Caixa','4.3. Relatórios >> Fechamento de Caixa - Detalhado','S',20),('Padrão','ltimaVendaporFornecedor1     ','4.4. Relatórios >> Última Venda por Fornecedor','S',21),('Padrão','ItensApagadosnaVenda1        ','4.5. Relatórios >> Itens Apagados na Venda','S',22),('Padrão','ComprasdosClientes1          ','4.6. Relatórios >> Compras dos Clientes','S',23),('Padrão','mnu_Configuracoes            ','5. Configurações','S',24),('Padrão','mnu_Configuracoes_Permissoes ','5.1. Configurações >> Permissões de Acesso','S',25),('Padrão','mnu_Configuracoes_Limpeza    ','5.2. Configurações >> Limpeza de Registros por Período','S',26),('Padrão','ValordeVendaDiriaporCaixa1   ','5.3. Configurações >> Valor de Venda Diária por Caixa','S',27),('Padrão','mnu_Sobre                    ','6. Sobre','S',28),('Padrão','mnu_Sair                     ','7. Sair','S',29),('datatex','mnu_Frente_Loja','1. Frente_Loja','S',1),('datatex','mnu_Cadastros','2. Cadastros','S',2),('datatex','mnu_Cadastros_Fornecedores','2.1. Cadastros >> Fornecedores','S',3),('datatex','mnu_Cadastros_Grupos','2.2. Cadastros >> Grupos','S',4),('datatex','mnu_Cadastros_Produtos','2.3. Cadastros >> Produtos','S',5),('datatex','mnu_Cadastros_Usuarios','2.4. Cadastros >> Usuários','S',6),('datatex','mnu_Cadastros_Maquinas','2.5. Cadastros >> Informação das Máquinas','S',7),('datatex','Empresa1','2.6. Cadastros >> Informações da Empresa','S',8),('datatex','Clientes1','2.7. Cadastros >> Clientes','S',9),('datatex','mnu_Estoque','3. Estoque','S',10),('datatex','mnu_Estoque_Ajuste','3.1. Estoque >> Ajuste de Estoque','S',11),('datatex','PosioAtualdoEstoque1','3.2. Estoque >> Posição Atual de Estoque','S',12),('datatex','EntradadeProdutos1','3.3. Estoque >> Entrada de Produtos','S',13),('datatex','NotadeEntrada1','3.3.1. Estoque >> Entrada de Produtos >> Nota de Entrada','S',14),('datatex','CancelamentodeNotadeEntrada1','3.3.2. Estoque >> Entrada de Produtos >> Cancelamento de Nota de Entrada','S',15),('datatex','HistricodeNotasdeEntradas1','3.3.3. Estoque >> Entrada de Produtos >> Histórico de Notas de Entradas','S',16),('datatex','mnu_Relatorios','4. Relatórios','S',17),('datatex','Lucratividade1','4.1. Relatórios >> Lucratividade','S',18),('datatex','FechamentodeCaixa1','4.2. Relatórios >> Fechamento de Caixa','S',19),('datatex','mnu_Relatorios_Registro_Caixa','4.3. Relatórios >> Fechamento de Caixa - Detalhado','S',20),('datatex','ltimaVendaporFornecedor1','4.4. Relatórios >> Última Venda por Fornecedor','S',21),('datatex','ItensApagadosnaVenda1','4.5. Relatórios >> Itens Apagados na Venda','S',22),('datatex','ComprasdosClientes1','4.6. Relatórios >> Compras dos Clientes','N',23),('datatex','mnu_Configuracoes','5. Configurações','S',24),('datatex','mnu_Configuracoes_Permissoes','5.1. Configurações >> Permissões de Acesso','S',25),('datatex','mnu_Configuracoes_Limpeza','5.2. Configurações >> Limpeza de Registros por Período','S',26),('datatex','ValordeVendaDiriaporCaixa1','5.3. Configurações >> Valor de Venda Diária por Caixa','S',27),('datatex','mnu_Sobre','6. Sobre','S',28),('datatex','mnu_Sair','7. Sair','S',29);
/*!40000 ALTER TABLE `permissao_acessos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produtos` (
  `Produto_Codigo` int(11) NOT NULL AUTO_INCREMENT,
  `Produto_Descricao` varchar(100) DEFAULT NULL,
  `Produto_Descricao_Curta` varchar(20) DEFAULT NULL,
  `Produto_Unidade` char(2) DEFAULT NULL,
  `Produto_Grupo` smallint(6) DEFAULT NULL,
  `Produto_Fornecedor_Cod` smallint(6) DEFAULT NULL,
  `Produto_Fornecedor_Desc` varchar(100) DEFAULT NULL,
  `Produto_Custo` double(13,2) DEFAULT NULL,
  `Produto_Margem_Lucro` double(13,2) DEFAULT NULL,
  `Produto_Preco_Varejo` double(13,2) DEFAULT NULL,
  `Produto_Cod_Barra` varchar(15) DEFAULT NULL,
  `Produto_Cod_Alternativo` varchar(15) DEFAULT NULL,
  `Produto_Estoque_Atual` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`Produto_Codigo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos_vazio`
--

DROP TABLE IF EXISTS `produtos_vazio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produtos_vazio` (
  `Produto_Codigo` int(11) NOT NULL DEFAULT '0',
  `Produto_Descricao` varchar(100) DEFAULT NULL,
  `Produto_Descricao_Curta` varchar(20) DEFAULT NULL,
  `Produto_Unidade` char(2) DEFAULT NULL,
  `Produto_Grupo` smallint(6) DEFAULT NULL,
  `Produto_Fornecedor_Cod` smallint(6) DEFAULT NULL,
  `Produto_Fornecedor_Desc` varchar(100) DEFAULT NULL,
  `Produto_Custo` double(13,2) DEFAULT NULL,
  `Produto_Margem_Lucro` double(13,2) DEFAULT NULL,
  `Produto_Preco_Varejo` double(13,2) DEFAULT NULL,
  `Produto_Cod_Barra` varchar(15) DEFAULT NULL,
  `Produto_Cod_Alternativo` varchar(15) DEFAULT NULL,
  `Produto_Estoque_Atual` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`Produto_Codigo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos_vazio`
--

LOCK TABLES `produtos_vazio` WRITE;
/*!40000 ALTER TABLE `produtos_vazio` DISABLE KEYS */;
/*!40000 ALTER TABLE `produtos_vazio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro_caixa`
--

DROP TABLE IF EXISTS `registro_caixa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registro_caixa` (
  `Registro_Caixa_Data` date NOT NULL DEFAULT '0000-00-00',
  `Registro_Caixa_Hora` varchar(8) NOT NULL DEFAULT '',
  `Registro_Caixa_Operacao` varchar(20) NOT NULL DEFAULT '',
  `Registro_Caixa_Maquina` varchar(10) NOT NULL DEFAULT '',
  `Registro_Caixa_Pedido` varchar(10) DEFAULT NULL,
  `Registro_Caixa_Usuario` varchar(50) DEFAULT NULL,
  `Registro_Caixa_Valor` double(13,2) DEFAULT NULL,
  PRIMARY KEY (`Registro_Caixa_Maquina`,`Registro_Caixa_Operacao`,`Registro_Caixa_Hora`,`Registro_Caixa_Data`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_caixa`
--

LOCK TABLES `registro_caixa` WRITE;
/*!40000 ALTER TABLE `registro_caixa` DISABLE KEYS */;
/*!40000 ALTER TABLE `registro_caixa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro_caixa_movto`
--

DROP TABLE IF EXISTS `registro_caixa_movto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registro_caixa_movto` (
  `Registro_Caixa_Data` date NOT NULL DEFAULT '0000-00-00',
  `Registro_Caixa_Hora` varchar(8) NOT NULL DEFAULT '',
  `Registro_Caixa_Operacao` varchar(20) NOT NULL DEFAULT '',
  `Registro_Caixa_Maquina` varchar(10) NOT NULL DEFAULT '',
  `Registro_Caixa_Pedido` varchar(10) DEFAULT NULL,
  `Registro_Caixa_Usuario` varchar(50) DEFAULT NULL,
  `Registro_Caixa_Valor` double(13,2) DEFAULT NULL,
  PRIMARY KEY (`Registro_Caixa_Maquina`,`Registro_Caixa_Operacao`,`Registro_Caixa_Hora`,`Registro_Caixa_Data`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_caixa_movto`
--

LOCK TABLES `registro_caixa_movto` WRITE;
/*!40000 ALTER TABLE `registro_caixa_movto` DISABLE KEYS */;
/*!40000 ALTER TABLE `registro_caixa_movto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rel_fornecedor`
--

DROP TABLE IF EXISTS `rel_fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rel_fornecedor` (
  `Rel_Fornecedor_Numero` int(11) NOT NULL DEFAULT '0',
  `Rel_Fornecedor_CNPJ` varchar(18) DEFAULT NULL,
  `Rel_Fornecedor_Razao_Social` varchar(100) DEFAULT NULL,
  `Rel_Fornecedor_Nome_Fantasia` varchar(100) DEFAULT NULL,
  `Rel_Fornecedor_Fone_Comercial` varchar(15) DEFAULT NULL,
  `Rel_Fornecedor_Fone_Celular` varchar(15) DEFAULT NULL,
  `Rel_Fornecedor_Fone_FAX` varchar(15) DEFAULT NULL,
  `Rel_Fornecedor_Contato` varchar(100) DEFAULT NULL,
  `Rel_Fornecedor_EMail` varchar(100) DEFAULT NULL,
  `Rel_Fornecedor_Ultima_Venda` date DEFAULT NULL,
  `Rel_Fornecedor_Produto_Codigo` int(11) DEFAULT NULL,
  `Rel_Fornecedor_Produto_Descricao` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Rel_Fornecedor_Numero`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rel_fornecedor`
--

LOCK TABLES `rel_fornecedor` WRITE;
/*!40000 ALTER TABLE `rel_fornecedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `rel_fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `Usuario_Nome` varchar(50) NOT NULL DEFAULT '',
  `Usuario_Senha` varchar(50) DEFAULT NULL,
  `Usuario_Fiscal` char(1) DEFAULT NULL,
  `Usuario_Cor_Grid` varchar(50) DEFAULT NULL,
  `Usuario_Cor_Letra` varchar(50) DEFAULT NULL,
  `Usuario_Gaveta` char(1) DEFAULT NULL,
  `Usuario_Impressora` char(1) DEFAULT NULL,
  PRIMARY KEY (`Usuario_Nome`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES ('datatex','datatex','S','clWhite','clBlack','N','N');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valor_venda_diaria`
--

DROP TABLE IF EXISTS `valor_venda_diaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `valor_venda_diaria` (
  `Valor_Venda_Diaria_Vlr` double(13,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valor_venda_diaria`
--

LOCK TABLES `valor_venda_diaria` WRITE;
/*!40000 ALTER TABLE `valor_venda_diaria` DISABLE KEYS */;
INSERT INTO `valor_venda_diaria` VALUES (2000.00);
/*!40000 ALTER TABLE `valor_venda_diaria` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-04-12 16:16:32
