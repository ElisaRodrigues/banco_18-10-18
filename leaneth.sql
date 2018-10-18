-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 18-Out-2018 às 12:37
-- Versão do servidor: 5.7.19
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `leaneth`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `administrador`
--

DROP TABLE IF EXISTS `administrador`;
CREATE TABLE IF NOT EXISTS `administrador` (
  `razao_social` varchar(150) NOT NULL,
  `cnpj` varchar(150) NOT NULL,
  `id_usuarios` int(11) NOT NULL,
  `idAdministrador` int(11) NOT NULL AUTO_INCREMENT,
  `nome_fantasia` varchar(150) NOT NULL,
  `ativado` int(11) NOT NULL,
  PRIMARY KEY (`idAdministrador`),
  KEY `idUsuarios` (`id_usuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `administrador`
--

INSERT INTO `administrador` (`razao_social`, `cnpj`, `id_usuarios`, `idAdministrador`, `nome_fantasia`, `ativado`) VALUES
('admin', 'admin', 40, 20, 'admin', 0),
('admin', 'teste', 42, 21, 'admin', 0),
('1045 admin', '1045 admin', 44, 22, '1045 admin', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente_loja`
--

DROP TABLE IF EXISTS `cliente_loja`;
CREATE TABLE IF NOT EXISTS `cliente_loja` (
  `nomeFantasia` varchar(150) DEFAULT NULL,
  `cnpj` varchar(150) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `razao_social` varchar(150) DEFAULT NULL,
  `telefone` varchar(150) DEFAULT NULL,
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `endereco` varchar(150) NOT NULL,
  `vendedor_idVendedor` int(11) NOT NULL,
  `ativado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCliente`),
  KEY `fk_cliente_loja_vendedor1_idx` (`vendedor_idVendedor`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cliente_loja`
--

INSERT INTO `cliente_loja` (`nomeFantasia`, `cnpj`, `email`, `razao_social`, `telefone`, `idCliente`, `endereco`, `vendedor_idVendedor`, `ativado`) VALUES
('1117', '1117', '1117@teste', '1117', '1117', 6, '1117', 0, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cor`
--

DROP TABLE IF EXISTS `cor`;
CREATE TABLE IF NOT EXISTS `cor` (
  `id_cor` int(11) NOT NULL AUTO_INCREMENT,
  `cor` varchar(145) NOT NULL,
  `ativado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_cor`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cor`
--

INSERT INTO `cor` (`id_cor`, `cor`, `ativado`) VALUES
(40, '37', NULL),
(41, '40', NULL),
(42, '37', NULL),
(43, '40', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `historico`
--

DROP TABLE IF EXISTS `historico`;
CREATE TABLE IF NOT EXISTS `historico` (
  `idhistorico` int(11) NOT NULL AUTO_INCREMENT,
  `produtos_idProdutos` int(11) NOT NULL,
  `qtd` varchar(45) DEFAULT NULL,
  `cliente_loja_idCliente` int(11) NOT NULL,
  PRIMARY KEY (`idhistorico`),
  KEY `fk_historico_produtos1_idx` (`produtos_idProdutos`),
  KEY `fk_historico_cliente_loja1_idx` (`cliente_loja_idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `imagem`
--

DROP TABLE IF EXISTS `imagem`;
CREATE TABLE IF NOT EXISTS `imagem` (
  `id_imagem` int(11) NOT NULL AUTO_INCREMENT,
  `imagem` varchar(64) NOT NULL,
  `ativado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_imagem`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `imagem`
--

INSERT INTO `imagem` (`id_imagem`, `imagem`, `ativado`) VALUES
(24, '270918021904cana de acucar.jpg', NULL),
(25, '171018081019', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

DROP TABLE IF EXISTS `produtos`;
CREATE TABLE IF NOT EXISTS `produtos` (
  `idProdutos` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `preco` varchar(150) DEFAULT NULL,
  `estoque` int(11) DEFAULT NULL,
  `estoque_min` int(11) DEFAULT NULL,
  `descricao` varchar(150) DEFAULT NULL,
  `referencia` int(15) NOT NULL,
  `idTipoProduto` int(11) NOT NULL,
  `ativado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idProdutos`),
  KEY `idTipoProduto` (`idTipoProduto`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`idProdutos`, `nome`, `preco`, `estoque`, `estoque_min`, `descricao`, `referencia`, `idTipoProduto`, `ativado`) VALUES
(41, 'TESTE', '456', 65, 65, 'teste', 1212, 1, NULL),
(42, 'tseste', '5765', 64, 8, 'ghtgdfj', 656789, 3, NULL),
(44, 'TESTE', '456', 65, 65, 'teste', 1212, 1, NULL),
(45, 'TESTE', '456', 65, 65, 'teste', 1212, 1, NULL),
(46, 'TESTE', '200.00', 123, 45, 'teste de cadastro', 1212, 3, NULL),
(47, '1054', '373', 23, 2333, 'teste de cadastro', 1212, 3, NULL),
(48, '1118', '200.00', 34, 63, '', 547654, 3, NULL),
(49, 'blusa com decote canoa', '50', 65, 45, 'Uma blusa bÃ¡sica com um decote levemente canoado para a esquerda ', 547654, 3, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `prod_cor`
--

DROP TABLE IF EXISTS `prod_cor`;
CREATE TABLE IF NOT EXISTS `prod_cor` (
  `prod_id_prod` int(11) NOT NULL,
  `cor_id_cor` int(11) NOT NULL,
  `ativado` int(11) DEFAULT NULL,
  PRIMARY KEY (`prod_id_prod`,`cor_id_cor`),
  KEY `fk_produtos_has_cor_cor1_idx` (`cor_id_cor`),
  KEY `fk_produtos_has_cor_produtos1_idx` (`prod_id_prod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `prod_cor`
--

INSERT INTO `prod_cor` (`prod_id_prod`, `cor_id_cor`, `ativado`) VALUES
(46, 40, NULL),
(47, 41, NULL),
(48, 42, NULL),
(49, 43, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `prod_imagem`
--

DROP TABLE IF EXISTS `prod_imagem`;
CREATE TABLE IF NOT EXISTS `prod_imagem` (
  `prod_id_prod` int(11) NOT NULL,
  `img_id_img` int(11) NOT NULL,
  `ativado` int(11) DEFAULT NULL,
  PRIMARY KEY (`prod_id_prod`,`img_id_img`),
  KEY `fk_produtos_has_imagem_imagem1_idx` (`img_id_img`),
  KEY `fk_produtos_has_imagem_produtos1_idx` (`prod_id_prod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `prod_imagem`
--

INSERT INTO `prod_imagem` (`prod_id_prod`, `img_id_img`, `ativado`) VALUES
(48, 24, NULL),
(49, 25, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `prod_tamanho`
--

DROP TABLE IF EXISTS `prod_tamanho`;
CREATE TABLE IF NOT EXISTS `prod_tamanho` (
  `tam_id_tam` int(11) NOT NULL,
  `prod_id_prod` int(11) NOT NULL,
  `ativado` int(11) DEFAULT NULL,
  PRIMARY KEY (`tam_id_tam`,`prod_id_prod`),
  KEY `fk_tamanho_has_produtos_produtos1_idx` (`prod_id_prod`),
  KEY `fk_tamanho_has_produtos_tamanho1_idx` (`tam_id_tam`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `prod_tamanho`
--

INSERT INTO `prod_tamanho` (`tam_id_tam`, `prod_id_prod`, `ativado`) VALUES
(34, 46, NULL),
(37, 47, NULL),
(37, 49, NULL),
(38, 48, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tamanho`
--

DROP TABLE IF EXISTS `tamanho`;
CREATE TABLE IF NOT EXISTS `tamanho` (
  `tamanho` varchar(5) DEFAULT NULL,
  `idTamanho` int(11) NOT NULL AUTO_INCREMENT,
  `ativado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idTamanho`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tamanho`
--

INSERT INTO `tamanho` (`tamanho`, `idTamanho`, `ativado`) VALUES
('0', 34, NULL),
('0', 35, NULL),
('0', 36, NULL),
('34', 37, NULL),
('37', 38, NULL),
('38', 39, NULL),
('37', 40, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_produto`
--

DROP TABLE IF EXISTS `tipo_produto`;
CREATE TABLE IF NOT EXISTS `tipo_produto` (
  `tipo` varchar(150) DEFAULT NULL,
  `idTipoProduto` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idTipoProduto`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tipo_produto`
--

INSERT INTO `tipo_produto` (`tipo`, `idTipoProduto`) VALUES
('Calça', 1),
('Shorts', 2),
('Blusa', 3),
('Casaco', 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `telefone` varchar(150) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `senha` varchar(150) DEFAULT NULL,
  `nome` varchar(150) DEFAULT NULL,
  `idUsuarios` int(11) NOT NULL AUTO_INCREMENT,
  `ativado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idUsuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`telefone`, `email`, `senha`, `nome`, `idUsuarios`, `ativado`) VALUES
('admin', 'admin@teste.com', 'admin', 'admin', 40, NULL),
('vend', 'vend', 'vend', 'vend', 41, NULL),
('teste', 'teste.com', '123', 'teste', 42, NULL),
('teste', 'teste.com', '123', 'vend', 43, NULL),
('1045 admin', '1045 admin', '123', '1045 admin', 44, NULL),
('vend 1427', 'love', 'love', 'vend 1427', 45, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendedor`
--

DROP TABLE IF EXISTS `vendedor`;
CREATE TABLE IF NOT EXISTS `vendedor` (
  `idVendedor` int(11) NOT NULL AUTO_INCREMENT,
  `cpf` varchar(150) DEFAULT NULL,
  `id_usuarios` int(11) DEFAULT NULL,
  `empresa` varchar(105) DEFAULT NULL,
  `ativado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idVendedor`),
  KEY `idUsuarios` (`id_usuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `vendedor`
--

INSERT INTO `vendedor` (`idVendedor`, `cpf`, `id_usuarios`, `empresa`, `ativado`) VALUES
(11, '3123', 41, 'dgsdv', NULL);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `administrador`
--
ALTER TABLE `administrador`
  ADD CONSTRAINT `administrador_ibfk_1` FOREIGN KEY (`id_usuarios`) REFERENCES `usuarios` (`idUsuarios`);

--
-- Limitadores para a tabela `cliente_loja`
--
ALTER TABLE `cliente_loja`
  ADD CONSTRAINT `fk_cliente_loja_vendedor1` FOREIGN KEY (`vendedor_idVendedor`) REFERENCES `vendedor` (`idVendedor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `historico`
--
ALTER TABLE `historico`
  ADD CONSTRAINT `fk_historico_cliente_loja1` FOREIGN KEY (`cliente_loja_idCliente`) REFERENCES `cliente_loja` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_historico_produtos1` FOREIGN KEY (`produtos_idProdutos`) REFERENCES `produtos` (`idProdutos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `produtos_ibfk_1` FOREIGN KEY (`idTipoProduto`) REFERENCES `tipo_produto` (`idTipoProduto`);

--
-- Limitadores para a tabela `prod_cor`
--
ALTER TABLE `prod_cor`
  ADD CONSTRAINT `fk_produtos_has_cor_cor1` FOREIGN KEY (`cor_id_cor`) REFERENCES `cor` (`id_cor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_produtos_has_cor_produtos1` FOREIGN KEY (`prod_id_prod`) REFERENCES `produtos` (`idProdutos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `prod_imagem`
--
ALTER TABLE `prod_imagem`
  ADD CONSTRAINT `fk_produtos_has_imagem_imagem1` FOREIGN KEY (`img_id_img`) REFERENCES `imagem` (`id_imagem`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_produtos_has_imagem_produtos1` FOREIGN KEY (`prod_id_prod`) REFERENCES `produtos` (`idProdutos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `prod_tamanho`
--
ALTER TABLE `prod_tamanho`
  ADD CONSTRAINT `fk_tamanho_has_produtos_produtos1` FOREIGN KEY (`prod_id_prod`) REFERENCES `produtos` (`idProdutos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tamanho_has_produtos_tamanho1` FOREIGN KEY (`tam_id_tam`) REFERENCES `tamanho` (`idTamanho`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `vendedor`
--
ALTER TABLE `vendedor`
  ADD CONSTRAINT `vendedor_ibfk_1` FOREIGN KEY (`id_usuarios`) REFERENCES `usuarios` (`idUsuarios`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
