-- phpMyAdmin SQL Dump
-- version 3.2.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tempo de Geração: Abr 12, 2011 as 04:02 PM
-- Versão do Servidor: 5.1.37
-- Versão do PHP: 5.3.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Banco de Dados: `pdvtex`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cabeca_cupons`
--

CREATE TABLE IF NOT EXISTS `Cabeca_Cupons` (
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `cabeca_cupons`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `cabeca_cupons_movto`
--

CREATE TABLE IF NOT EXISTS `Cabeca_Cupons_Movto` (
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `cabeca_cupons_movto`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `conexao`
--

CREATE TABLE IF NOT EXISTS `Conexao` (
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

--
-- Extraindo dados da tabela `conexao`
--

INSERT INTO `Conexao` (`Conexao_Caminho`, `Conexao_Registro`, `Conexao_Loja`, `Conexao_Loja_Curto`, `Conexao_Endereco`, `Conexao_Complemento`, `Conexao_Bairro`, `Conexao_Cidade`, `Conexao_UF`, `Conexao_Cep`, `Conexao_Fone`, `Conexao_Email`) VALUES
(NULL, '12860712860701070721021192710', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `corpo_cupons`
--

CREATE TABLE IF NOT EXISTS `Corpo_Cupons` (
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

--
-- Extraindo dados da tabela `corpo_cupons`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `corpo_cupons_movto`
--

CREATE TABLE IF NOT EXISTS `Corpo_Cupons_Movto` (
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `corpo_cupons_movto`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `empresa`
--

CREATE TABLE IF NOT EXISTS `Empresa` (
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

--
-- Extraindo dados da tabela `empresa`
--

INSERT INTO `Empresa` (`Empresa_Razao_Social`, `Empresa_Nome_Exibicao`, `Empresa_Endereco`, `Empresa_Bairro`, `Empresa_Cidade`, `Empresa_Estado`, `Empresa_Cep`, `Empresa_Fone`, `Empresa_Vincula_Cliente`) VALUES
('Datatex Informática e Serviços Ltda', 'DATATEX', 'Av. Araucária, 1164', 'Parque Novo Oratório', 'Santo André', 'SP', '09251-040', '(11)2896-4707', '-1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `entrada_nota_cabeca`
--

CREATE TABLE IF NOT EXISTS `Entrada_Nota_Cabeca` (
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `entrada_nota_cabeca`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `entrada_nota_produto`
--

CREATE TABLE IF NOT EXISTS `Entrada_Nota_Produto` (
  `Entrada_Nota_Produto_Numero` int(11) NOT NULL AUTO_INCREMENT,
  `Entrada_Nota_Produto_Cabeca` int(11) DEFAULT NULL,
  `Entrada_Nota_Produto_Cod` int(11) DEFAULT NULL,
  `Entrada_Nota_Produto_Desc` varchar(100) DEFAULT NULL,
  `Entrada_Nota_Produto_Qtde` int(11) DEFAULT NULL,
  `Entrada_Nota_Produto_Unit` double(13,2) DEFAULT NULL,
  `Entrada_Nota_Produto_Total` double(13,2) DEFAULT NULL,
  PRIMARY KEY (`Entrada_Nota_Produto_Numero`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `entrada_nota_produto`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `fechamentos_caixas`
--

CREATE TABLE IF NOT EXISTS `Fechamentos_Caixas` (
  `Fechamento_Caixa_Maquina` varchar(10) NOT NULL DEFAULT '',
  `Fechamento_Caixa_Nro_Ultimo_Cupom` varchar(11) DEFAULT '',
  `Fechamento_Caixa_Vlr_Ultimo_Cupom` double(13,2) DEFAULT '0.00',
  `Fechamento_Caixa_Qtde_Cupons` int(11) DEFAULT '0',
  `Fechamento_Caixa_Vlr_Abertura` double(13,2) DEFAULT '0.00',
  `Fechamento_Caixa_Vlr_Vendas` double(13,2) DEFAULT '0.00',
  `Fechamento_Caixa_Vlr_Sangria` double(13,2) DEFAULT '0.00',
  `Fechamento_Caixa_Vlr_Total_Caixa` double(13,2) DEFAULT '0.00',
  `Fechamento_Caixa_Vlr_Venda_Diaria` double(13,2) DEFAULT '0.00',
  PRIMARY KEY (`Fechamento_Caixa_Maquina`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `fechamentos_caixas`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedores`
--

CREATE TABLE IF NOT EXISTS `Fornecedores` (
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `fornecedores`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedores_vazio`
--

CREATE TABLE IF NOT EXISTS `Fornecedores_Vazio` (
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

--
-- Extraindo dados da tabela `fornecedores_vazio`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `grupos`
--

CREATE TABLE IF NOT EXISTS `Grupos` (
  `Grupo_Numero` int(11) NOT NULL AUTO_INCREMENT,
  `Grupo_Descricao` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Grupo_Numero`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `grupos`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `informacao_maquinas`
--

CREATE TABLE IF NOT EXISTS `Informacao_Maquinas` (
  `Informacao_Maquina_HD` varchar(10) NOT NULL DEFAULT '',
  `Informacao_Maquina_Descricao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Informacao_Maquina_HD`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `informacao_maquinas`
--

INSERT INTO `Informacao_Maquinas` (`Informacao_Maquina_HD`, `Informacao_Maquina_Descricao`) VALUES
('6609E511', 'DATATEX');

-- --------------------------------------------------------

--
-- Estrutura da tabela `informacao_maquinas_vazio`
--

CREATE TABLE IF NOT EXISTS `Informacao_Maquinas_Vazio` (
  `Informacao_Maquina_HD` varchar(10) NOT NULL DEFAULT '',
  `Informacao_Maquina_Descricao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Informacao_Maquina_HD`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `informacao_maquinas_vazio`
--

INSERT INTO `Informacao_Maquinas_Vazio` (`Informacao_Maquina_HD`, `Informacao_Maquina_Descricao`) VALUES
('6609E511', 'DATATEX');

-- --------------------------------------------------------

--
-- Estrutura da tabela `item_cancelado`
--

CREATE TABLE IF NOT EXISTS `Item_Cancelado` (
  `Item_Cancelado_Numero` int(11) NOT NULL AUTO_INCREMENT,
  `Item_Cancelado_Data` date DEFAULT NULL,
  `Item_Cancelado_Hora` varchar(8) DEFAULT NULL,
  `Item_Cancelado_Maquina` varchar(10) DEFAULT NULL,
  `Item_Cancelado_Usuario` varchar(50) DEFAULT NULL,
  `Item_Cancelado_Prod_Cod` int(11) DEFAULT NULL,
  `Item_Cancelado_Prod_Desc` varchar(100) DEFAULT NULL,
  `Item_Cancelado_Prod_Qtde` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`Item_Cancelado_Numero`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `item_cancelado`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `item_cancelado_movto`
--

CREATE TABLE IF NOT EXISTS `Item_Cancelado_Movto` (
  `Item_Cancelado_Numero` int(11) NOT NULL AUTO_INCREMENT,
  `Item_Cancelado_Data` date DEFAULT NULL,
  `Item_Cancelado_Hora` varchar(8) DEFAULT NULL,
  `Item_Cancelado_Maquina` varchar(10) DEFAULT NULL,
  `Item_Cancelado_Usuario` varchar(50) DEFAULT NULL,
  `Item_Cancelado_Prod_Cod` int(11) DEFAULT NULL,
  `Item_Cancelado_Prod_Desc` varchar(100) DEFAULT NULL,
  `Item_Cancelado_Prod_Qtde` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`Item_Cancelado_Numero`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `item_cancelado_movto`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `lucratividade`
--

CREATE TABLE IF NOT EXISTS `Lucratividade` (
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

--
-- Extraindo dados da tabela `lucratividade`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `mgt_clientes`
--

CREATE TABLE IF NOT EXISTS `mgt_clientes` (
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

--
-- Extraindo dados da tabela `mgt_clientes`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `permissao_acessos`
--

CREATE TABLE IF NOT EXISTS `Permissao_Acessos` (
  `Permissao_Acesso_Login` varchar(50) NOT NULL DEFAULT '',
  `Permissao_Acesso_Area` varchar(50) NOT NULL DEFAULT '',
  `Permissao_Acesso_Descricao` varchar(100) DEFAULT NULL,
  `Permissao_Acesso_Permitido` char(1) DEFAULT NULL,
  `Permissao_Acesso_Posicao` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`Permissao_Acesso_Login`,`Permissao_Acesso_Area`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `permissao_acessos`
--

INSERT INTO `Permissao_Acessos` (`Permissao_Acesso_Login`, `Permissao_Acesso_Area`, `Permissao_Acesso_Descricao`, `Permissao_Acesso_Permitido`, `Permissao_Acesso_Posicao`) VALUES
('Padrão', 'mnu_Frente_Loja              ', '1. Frente_Loja', 'S', 1),
('Padrão', 'mnu_Cadastros                ', '2. Cadastros', 'S', 2),
('Padrão', 'mnu_Cadastros_Fornecedores   ', '2.1. Cadastros >> Fornecedores', 'S', 3),
('Padrão', 'mnu_Cadastros_Grupos         ', '2.2. Cadastros >> Grupos', 'S', 4),
('Padrão', 'mnu_Cadastros_Produtos       ', '2.3. Cadastros >> Produtos', 'S', 5),
('Padrão', 'mnu_Cadastros_Usuarios       ', '2.4. Cadastros >> Usuários', 'S', 6),
('Padrão', 'mnu_Cadastros_Maquinas       ', '2.5. Cadastros >> Informação das Máquinas', 'S', 7),
('Padrão', 'Empresa1                     ', '2.6. Cadastros >> Informações da Empresa', 'S', 8),
('Padrão', 'Clientes1                    ', '2.7. Cadastros >> Clientes', 'S', 9),
('Padrão', 'mnu_Estoque                  ', '3. Estoque', 'S', 10),
('Padrão', 'mnu_Estoque_Ajuste           ', '3.1. Estoque >> Ajuste de Estoque', 'S', 11),
('Padrão', 'PosioAtualdoEstoque1         ', '3.2. Estoque >> Posição Atual de Estoque', 'S', 12),
('Padrão', 'EntradadeProdutos1           ', '3.3. Estoque >> Entrada de Produtos', 'S', 13),
('Padrão', 'NotadeEntrada1               ', '3.3.1. Estoque >> Entrada de Produtos >> Nota de Entrada', 'S', 14),
('Padrão', 'CancelamentodeNotadeEntrada1 ', '3.3.2. Estoque >> Entrada de Produtos >> Cancelamento de Nota de Entrada', 'S', 15),
('Padrão', 'HistricodeNotasdeEntradas1   ', '3.3.3. Estoque >> Entrada de Produtos >> Histórico de Notas de Entradas', 'S', 16),
('Padrão', 'mnu_Relatorios               ', '4. Relatórios', 'S', 17),
('Padrão', 'Lucratividade1               ', '4.1. Relatórios >> Lucratividade', 'S', 18),
('Padrão', 'FechamentodeCaixa1           ', '4.2. Relatórios >> Fechamento de Caixa', 'S', 19),
('Padrão', 'mnu_Relatorios_Registro_Caixa', '4.3. Relatórios >> Fechamento de Caixa - Detalhado', 'S', 20),
('Padrão', 'ltimaVendaporFornecedor1     ', '4.4. Relatórios >> Última Venda por Fornecedor', 'S', 21),
('Padrão', 'ItensApagadosnaVenda1        ', '4.5. Relatórios >> Itens Apagados na Venda', 'S', 22),
('Padrão', 'ComprasdosClientes1          ', '4.6. Relatórios >> Compras dos Clientes', 'S', 23),
('Padrão', 'mnu_Configuracoes            ', '5. Configurações', 'S', 24),
('Padrão', 'mnu_Configuracoes_Permissoes ', '5.1. Configurações >> Permissões de Acesso', 'S', 25),
('Padrão', 'mnu_Configuracoes_Limpeza    ', '5.2. Configurações >> Limpeza de Registros por Período', 'S', 26),
('Padrão', 'ValordeVendaDiriaporCaixa1   ', '5.3. Configurações >> Valor de Venda Diária por Caixa', 'S', 27),
('Padrão', 'mnu_Sobre                    ', '6. Sobre', 'S', 28),
('Padrão', 'mnu_Sair                     ', '7. Sair', 'S', 29),
('datatex', 'mnu_Frente_Loja', '1. Frente_Loja', 'S', 1),
('datatex', 'mnu_Cadastros', '2. Cadastros', 'S', 2),
('datatex', 'mnu_Cadastros_Fornecedores', '2.1. Cadastros >> Fornecedores', 'S', 3),
('datatex', 'mnu_Cadastros_Grupos', '2.2. Cadastros >> Grupos', 'S', 4),
('datatex', 'mnu_Cadastros_Produtos', '2.3. Cadastros >> Produtos', 'S', 5),
('datatex', 'mnu_Cadastros_Usuarios', '2.4. Cadastros >> Usuários', 'S', 6),
('datatex', 'mnu_Cadastros_Maquinas', '2.5. Cadastros >> Informação das Máquinas', 'S', 7),
('datatex', 'Empresa1', '2.6. Cadastros >> Informações da Empresa', 'S', 8),
('datatex', 'Clientes1', '2.7. Cadastros >> Clientes', 'S', 9),
('datatex', 'mnu_Estoque', '3. Estoque', 'S', 10),
('datatex', 'mnu_Estoque_Ajuste', '3.1. Estoque >> Ajuste de Estoque', 'S', 11),
('datatex', 'PosioAtualdoEstoque1', '3.2. Estoque >> Posição Atual de Estoque', 'S', 12),
('datatex', 'EntradadeProdutos1', '3.3. Estoque >> Entrada de Produtos', 'S', 13),
('datatex', 'NotadeEntrada1', '3.3.1. Estoque >> Entrada de Produtos >> Nota de Entrada', 'S', 14),
('datatex', 'CancelamentodeNotadeEntrada1', '3.3.2. Estoque >> Entrada de Produtos >> Cancelamento de Nota de Entrada', 'S', 15),
('datatex', 'HistricodeNotasdeEntradas1', '3.3.3. Estoque >> Entrada de Produtos >> Histórico de Notas de Entradas', 'S', 16),
('datatex', 'mnu_Relatorios', '4. Relatórios', 'S', 17),
('datatex', 'Lucratividade1', '4.1. Relatórios >> Lucratividade', 'S', 18),
('datatex', 'FechamentodeCaixa1', '4.2. Relatórios >> Fechamento de Caixa', 'S', 19),
('datatex', 'mnu_Relatorios_Registro_Caixa', '4.3. Relatórios >> Fechamento de Caixa - Detalhado', 'S', 20),
('datatex', 'ltimaVendaporFornecedor1', '4.4. Relatórios >> Última Venda por Fornecedor', 'S', 21),
('datatex', 'ItensApagadosnaVenda1', '4.5. Relatórios >> Itens Apagados na Venda', 'S', 22),
('datatex', 'ComprasdosClientes1', '4.6. Relatórios >> Compras dos Clientes', 'N', 23),
('datatex', 'mnu_Configuracoes', '5. Configurações', 'S', 24),
('datatex', 'mnu_Configuracoes_Permissoes', '5.1. Configurações >> Permissões de Acesso', 'S', 25),
('datatex', 'mnu_Configuracoes_Limpeza', '5.2. Configurações >> Limpeza de Registros por Período', 'S', 26),
('datatex', 'ValordeVendaDiriaporCaixa1', '5.3. Configurações >> Valor de Venda Diária por Caixa', 'S', 27),
('datatex', 'mnu_Sobre', '6. Sobre', 'S', 28),
('datatex', 'mnu_Sair', '7. Sair', 'S', 29);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE IF NOT EXISTS `Produtos` (
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `produtos`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos_vazio`
--

CREATE TABLE IF NOT EXISTS `Produtos_Vazio` (
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

--
-- Extraindo dados da tabela `produtos_vazio`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `registro_caixa`
--

CREATE TABLE IF NOT EXISTS `Registro_Caixa` (
  `Registro_Caixa_Data` date NOT NULL DEFAULT '0000-00-00',
  `Registro_Caixa_Hora` varchar(8) NOT NULL DEFAULT '',
  `Registro_Caixa_Operacao` varchar(20) NOT NULL DEFAULT '',
  `Registro_Caixa_Maquina` varchar(10) NOT NULL DEFAULT '',
  `Registro_Caixa_Pedido` varchar(10) DEFAULT NULL,
  `Registro_Caixa_Usuario` varchar(50) DEFAULT NULL,
  `Registro_Caixa_Valor` double(13,2) DEFAULT NULL,
  PRIMARY KEY (`Registro_Caixa_Maquina`,`Registro_Caixa_Operacao`,`Registro_Caixa_Hora`,`Registro_Caixa_Data`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `registro_caixa`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `registro_caixa_movto`
--

CREATE TABLE IF NOT EXISTS `Registro_Caixa_Movto` (
  `Registro_Caixa_Data` date NOT NULL DEFAULT '0000-00-00',
  `Registro_Caixa_Hora` varchar(8) NOT NULL DEFAULT '',
  `Registro_Caixa_Operacao` varchar(20) NOT NULL DEFAULT '',
  `Registro_Caixa_Maquina` varchar(10) NOT NULL DEFAULT '',
  `Registro_Caixa_Pedido` varchar(10) DEFAULT NULL,
  `Registro_Caixa_Usuario` varchar(50) DEFAULT NULL,
  `Registro_Caixa_Valor` double(13,2) DEFAULT NULL,
  PRIMARY KEY (`Registro_Caixa_Maquina`,`Registro_Caixa_Operacao`,`Registro_Caixa_Hora`,`Registro_Caixa_Data`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `registro_caixa_movto`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `rel_fornecedor`
--

CREATE TABLE IF NOT EXISTS `Rel_Fornecedor` (
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

--
-- Extraindo dados da tabela `rel_fornecedor`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE IF NOT EXISTS `Usuarios` (
  `Usuario_Nome` varchar(50) NOT NULL DEFAULT '',
  `Usuario_Senha` varchar(50) DEFAULT NULL,
  `Usuario_Fiscal` char(1) DEFAULT NULL,
  `Usuario_Cor_Grid` varchar(50) DEFAULT NULL,
  `Usuario_Cor_Letra` varchar(50) DEFAULT NULL,
  `Usuario_Gaveta` char(1) DEFAULT NULL,
  `Usuario_Impressora` char(1) DEFAULT NULL,
  PRIMARY KEY (`Usuario_Nome`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `Usuarios` (`Usuario_Nome`, `Usuario_Senha`, `Usuario_Fiscal`, `Usuario_Cor_Grid`, `Usuario_Cor_Letra`, `Usuario_Gaveta`, `Usuario_Impressora`) VALUES
('datatex', 'datatex', 'S', 'clWhite', 'clBlack', 'N', 'N');

-- --------------------------------------------------------

--
-- Estrutura da tabela `valor_venda_diaria`
--

CREATE TABLE IF NOT EXISTS `Valor_Venda_Diaria` (
  `Valor_Venda_Diaria_Vlr` double(13,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `valor_venda_diaria`
--

INSERT INTO `Valor_Venda_Diaria` (`Valor_Venda_Diaria_Vlr`) VALUES
(2000.00);
