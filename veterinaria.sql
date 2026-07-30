-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 30-Jul-2026 às 17:26
-- Versão do servidor: 10.4.32-MariaDB
-- versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `veterinaria`
--
CREATE DATABASE IF NOT EXISTS `veterinaria` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `veterinaria`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `animais`
--

CREATE TABLE `animais` (
  `idani` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `nomeanimal` varchar(255) NOT NULL,
  `especie` varchar(255) NOT NULL,
  `raca` varchar(100) NOT NULL,
  `datanasc` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `animais`
--

INSERT INTO `animais` (`idani`, `id_cliente`, `nomeanimal`, `especie`, `raca`, `datanasc`) VALUES
(1, 1, 'Garoto', 'cachorro', 'RD', '2016-09-05'),
(2, 2, 'Mel', 'Cachorro', 'RD', '2023-11-03'),
(3, 3, 'Peterpan', 'Cavalo', 'Ingês', '2017-01-15'),
(4, 3, 'Pitbull', 'Ganso', 'Toulouse', '2017-07-15');

-- --------------------------------------------------------

--
-- Estrutura da tabela `atendimentos`
--

CREATE TABLE `atendimentos` (
  `id_ate` int(11) NOT NULL,
  `id_ani` int(11) DEFAULT NULL,
  `id_vet` int(11) DEFAULT NULL,
  `dataatendimento` date NOT NULL,
  `horaatendimento` time NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `valor` decimal(7,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL,
  `nomeclit` varchar(255) NOT NULL,
  `telefone` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `cpf` varchar(100) NOT NULL,
  `endereco` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`idcliente`, `nomeclit`, `telefone`, `email`, `cpf`, `endereco`) VALUES
(1, 'Laura', '11 937330641', 'pequenalaur4@gmail.com', '467.296.988-61', 'Rua Serrinha num 104 A, Ribeirão Pires - SP, CEP 09434-510'),
(2, 'Nicoly', '11 981234567', 'nicolysoares@gmail.com', '123.456.789-00', 'Rua Serrinha, num 104, Ribeirão Pires - SP, CEP 09434-510'),
(3, 'Fabio', '11 974561230', 'Fabio@gmail.com', '987.654.321-11', 'Rua das Flores, num 88, Santa Luz - BA, CEP 09410-120');

-- --------------------------------------------------------

--
-- Estrutura da tabela `veterinario`
--

CREATE TABLE `veterinario` (
  `idvet` int(11) NOT NULL,
  `nomevet` varchar(255) NOT NULL,
  `telefone` varchar(255) NOT NULL,
  `especialidade` varchar(100) NOT NULL,
  `crmv` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `veterinario`
--

INSERT INTO `veterinario` (`idvet`, `nomevet`, `telefone`, `especialidade`, `crmv`) VALUES
(1, 'Dr.Artur Pra', '11 987654321', 'Cirurgia Geral', 'CRMV-SP 67890'),
(2, 'Dra.Cubket', '11 976543210', 'Dermatologia Veterinária', 'CRMV-SP 54321');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `animais`
--
ALTER TABLE `animais`
  ADD PRIMARY KEY (`idani`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Índices para tabela `atendimentos`
--
ALTER TABLE `atendimentos`
  ADD PRIMARY KEY (`id_ate`),
  ADD KEY `id_ani` (`id_ani`),
  ADD KEY `id_vet` (`id_vet`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idcliente`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices para tabela `veterinario`
--
ALTER TABLE `veterinario`
  ADD PRIMARY KEY (`idvet`),
  ADD UNIQUE KEY `crmv` (`crmv`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `animais`
--
ALTER TABLE `animais`
  MODIFY `idani` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `atendimentos`
--
ALTER TABLE `atendimentos`
  MODIFY `id_ate` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idcliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `veterinario`
--
ALTER TABLE `veterinario`
  MODIFY `idvet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `animais`
--
ALTER TABLE `animais`
  ADD CONSTRAINT `animais_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`idcliente`);

--
-- Limitadores para a tabela `atendimentos`
--
ALTER TABLE `atendimentos`
  ADD CONSTRAINT `atendimentos_ibfk_1` FOREIGN KEY (`id_ani`) REFERENCES `animais` (`idani`),
  ADD CONSTRAINT `atendimentos_ibfk_2` FOREIGN KEY (`id_vet`) REFERENCES `veterinario` (`idvet`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
