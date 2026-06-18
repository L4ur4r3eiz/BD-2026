-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 18-Jun-2026 às 17:28
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `loja`
--
CREATE DATABASE IF NOT EXISTS `loja` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `loja`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `categoria` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `categoria`) VALUES
(1, 'Eletrônicos'),
(2, 'Roupas'),
(3, 'Limpeza'),
(4, 'Hortifruit'),
(5, 'Laticínios');

-- --------------------------------------------------------

--
-- Estrutura da tabela `itens`
--

CREATE TABLE `itens` (
  `idproduto` int(11) NOT NULL,
  `produto` varchar(255) NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `quantidades` int(11) NOT NULL,
  `marca` varchar(255) NOT NULL,
  `observacoes` varchar(255) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `data_cadastro` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `itens`
--

INSERT INTO `itens` (`idproduto`, `produto`, `preco`, `quantidades`, `marca`, `observacoes`, `id_categoria`, `data_cadastro`) VALUES
(1, 'Mouse Gamer RGB', '89.90', 15, 'Redragon', 'Mouse com iluminação RGB', 1, '2025-06-17'),
(2, 'Teclado Mecânico', '249.90', 10, 'Logitech', 'Switch Blue ABNT2', 1, '2025-06-17'),
(3, 'Fone de Ouvido Bluetooth', '159.90', 20, 'JBL', 'Conexão sem fio', 1, '2025-06-17'),
(4, 'Camiseta Básica', '39.90', 30, 'Hering', '100% algodão', 2, '2025-06-17'),
(5, 'Calça Jeans', '129.90', 18, 'Sawary', 'Modelagem reta', 2, '2025-06-17'),
(6, 'Moletom com Capuz', '149.90', 12, 'Nike', 'Flanelado', 2, '2025-06-17'),
(7, 'Detergente Neutro', '2.99', 50, 'Ypê', 'Frasco de 500ml', 3, '2025-06-17'),
(8, 'Água Sanitária', '6.49', 35, 'Qboa', 'Frasco de 2L', 3, '2025-06-17'),
(9, 'Sabão em Pó', '18.90', 22, 'OMO', 'Pacote de 1,6kg', 3, '2025-06-17'),
(10, 'Banana Prata', '7.99', 40, 'Produtor Local', 'Preço por kg', 4, '2025-06-17'),
(11, 'Tomate', '8.49', 35, 'Produtor Local', 'Preço por kg', 4, '2025-06-17'),
(12, 'Alface Americana', '3.99', 25, 'Horta Verde', 'Unidade', 4, '2025-06-17'),
(13, 'Leite Integral 1L', '5.99', 45, 'Piracanjuba', 'Caixa longa vida', 5, '2025-06-17'),
(14, 'Queijo Mussarela', '42.90', 15, 'Tirolez', 'Preço por kg', 5, '2025-06-17'),
(15, 'Iogurte Natural', '4.99', 28, 'Nestlé', 'Pote de 170g', 5, '2025-06-17');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Índices para tabela `itens`
--
ALTER TABLE `itens`
  ADD PRIMARY KEY (`idproduto`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `itens`
--
ALTER TABLE `itens`
  MODIFY `idproduto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `itens`
--
ALTER TABLE `itens`
  ADD CONSTRAINT `itens_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
