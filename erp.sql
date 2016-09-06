-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 06-Set-2016 às 20:45
-- Versão do servidor: 10.1.13-MariaDB
-- PHP Version: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `erp`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `acesso_menu`
--

CREATE TABLE `acesso_menu` (
  `id_menu` int(11) NOT NULL,
  `menu` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `acesso_menu`
--

INSERT INTO `acesso_menu` (`id_menu`, `menu`) VALUES
(1, 'Comercial'),
(2, 'Vendas'),
(3, 'Estoque'),
(4, 'Financeiro'),
(5, 'Relatório');

-- --------------------------------------------------------

--
-- Estrutura da tabela `acesso_menu_perfil`
--

CREATE TABLE `acesso_menu_perfil` (
  `id_menu_perfil` int(11) NOT NULL,
  `id_perfil` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `permissao` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `acesso_menu_perfil`
--

INSERT INTO `acesso_menu_perfil` (`id_menu_perfil`, `id_perfil`, `id_menu`, `permissao`) VALUES
(1, 1, 1, 0),
(2, 1, 2, 0),
(3, 1, 3, 0),
(4, 1, 4, 0),
(5, 1, 5, 0),
(6, 2, 4, 0),
(7, 2, 5, 0),
(9, 3, 1, 0),
(10, 3, 2, 0),
(11, 3, 3, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `acesso_pagina`
--

CREATE TABLE `acesso_pagina` (
  `id_pagina` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `pagina` varchar(100) NOT NULL,
  `descricao` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `acesso_pagina`
--

INSERT INTO `acesso_pagina` (`id_pagina`, `id_menu`, `pagina`, `descricao`) VALUES
(1, 1, 'CADASTRAR CLIENTE', 'CADASTRO DE CLIENTES'),
(2, 1, 'EDITAR CLIENTE', 'EDITAR CLIENTE'),
(3, 1, 'EXCLUIR CLIENTE', 'EXCLUIR CLIENTE'),
(4, 2, 'CANCELAR VENDA', 'CANCELAR VENDA'),
(5, 2, 'GERAR VENDA', 'GERAR VENDA'),
(6, 3, 'CADASTRAR PRODUTO', 'CADASTRAR PRODUTO'),
(7, 3, 'EDITAR PRODUTO', 'EDITAR PRODUTO'),
(8, 3, 'EXCLUIR PRODUTO', 'EXCLUIR PRODUTO'),
(9, 3, 'MOVIMENTAR ESTOQUE', 'MOVIMENTAR ESTOQUE'),
(10, 4, 'CADASTRAR CONTAS', 'CADASTRAR CONTAS'),
(11, 4, 'EDITAR CONTAS', 'EDITAR CONTAS');

-- --------------------------------------------------------

--
-- Estrutura da tabela `acesso_pagina_perfil`
--

CREATE TABLE `acesso_pagina_perfil` (
  `id_pagina_perfil` int(11) NOT NULL,
  `id_perfil` int(11) NOT NULL,
  `id_pagina` int(11) NOT NULL,
  `permissao` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `acesso_pagina_perfil`
--

INSERT INTO `acesso_pagina_perfil` (`id_pagina_perfil`, `id_perfil`, `id_pagina`, `permissao`) VALUES
(1, 1, 1, 0),
(2, 1, 2, 0),
(3, 1, 3, 0),
(4, 1, 4, 0),
(5, 1, 5, 0),
(6, 1, 6, 0),
(7, 2, 10, 0),
(8, 2, 11, 0),
(9, 3, 1, 0),
(10, 3, 5, 0),
(11, 1, 11, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `acesso_perfil`
--

CREATE TABLE `acesso_perfil` (
  `id_perfil` int(11) NOT NULL,
  `perfil` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `acesso_perfil`
--

INSERT INTO `acesso_perfil` (`id_perfil`, `perfil`) VALUES
(1, 'Administrador'),
(2, 'Financeiro'),
(3, 'Vendas');

-- --------------------------------------------------------

--
-- Estrutura da tabela `acesso_usuario`
--

CREATE TABLE `acesso_usuario` (
  `id_usuario` int(11) NOT NULL,
  `id_perfil` int(11) NOT NULL,
  `login` varchar(200) NOT NULL,
  `senha` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `acesso_usuario`
--

INSERT INTO `acesso_usuario` (`id_usuario`, `id_perfil`, `login`, `senha`) VALUES
(1, 1, 'admin', '1234'),
(2, 2, 'user_financeiro', '1234'),
(3, 3, 'user_vendas', '1234');

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `data` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `categorias`
--

INSERT INTO `categorias` (`id`, `nome`, `data`) VALUES
(1, 'Teste', '2016-07-22');

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `telefone` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`id`, `nome`, `telefone`) VALUES
(1, 'Anderson', '86412939'),
(2, 'Enzo', '88491717'),
(3, 'Gabriel', '123456'),
(4, 'Erica', '32659865');

-- --------------------------------------------------------

--
-- Estrutura da tabela `movimentacao`
--

CREATE TABLE `movimentacao` (
  `id` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `qtd_mov` int(11) NOT NULL,
  `tipo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `movimentacao`
--

INSERT INTO `movimentacao` (`id`, `id_produto`, `qtd_mov`, `tipo`) VALUES
(1, 1, 10, 1),
(2, 1, 3, 1),
(3, 2, 25, 1),
(4, 1, 5, 2),
(5, 1, 30, 2),
(6, 3, 6, 2),
(7, 3, 7, 2),
(8, 3, 14, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` int(11) NOT NULL,
  `descricao` varchar(200) NOT NULL,
  `valor_venda` float(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`id`, `descricao`, `valor_venda`) VALUES
(1, 'Caneta', 1.00),
(2, 'Lapis', 0.50),
(3, 'Borracha', 2.00),
(4, 'Papel', 1.60);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acesso_menu`
--
ALTER TABLE `acesso_menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indexes for table `acesso_menu_perfil`
--
ALTER TABLE `acesso_menu_perfil`
  ADD PRIMARY KEY (`id_menu_perfil`);

--
-- Indexes for table `acesso_pagina`
--
ALTER TABLE `acesso_pagina`
  ADD PRIMARY KEY (`id_pagina`);

--
-- Indexes for table `acesso_pagina_perfil`
--
ALTER TABLE `acesso_pagina_perfil`
  ADD PRIMARY KEY (`id_pagina_perfil`);

--
-- Indexes for table `acesso_perfil`
--
ALTER TABLE `acesso_perfil`
  ADD PRIMARY KEY (`id_perfil`);

--
-- Indexes for table `acesso_usuario`
--
ALTER TABLE `acesso_usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indexes for table `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movimentacao`
--
ALTER TABLE `movimentacao`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acesso_menu`
--
ALTER TABLE `acesso_menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `acesso_menu_perfil`
--
ALTER TABLE `acesso_menu_perfil`
  MODIFY `id_menu_perfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `acesso_pagina`
--
ALTER TABLE `acesso_pagina`
  MODIFY `id_pagina` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `acesso_pagina_perfil`
--
ALTER TABLE `acesso_pagina_perfil`
  MODIFY `id_pagina_perfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `acesso_perfil`
--
ALTER TABLE `acesso_perfil`
  MODIFY `id_perfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `acesso_usuario`
--
ALTER TABLE `acesso_usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `movimentacao`
--
ALTER TABLE `movimentacao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
