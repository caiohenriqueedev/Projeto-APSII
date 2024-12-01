-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 01-Dez-2024 às 01:07
-- Versão do servidor: 5.7.36
-- versão do PHP: 8.1.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_salle`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `espacos`
--

CREATE TABLE `espacos` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `descricao` text NOT NULL,
  `capacidade` int(11) NOT NULL,
  `imagem` varchar(255) NOT NULL,
  `cep` varchar(10) NOT NULL,
  `rua` varchar(255) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  `bairro` varchar(300) NOT NULL,
  `cidade` varchar(300) NOT NULL,
  `estado_sigla` varchar(2) NOT NULL,
  `data_criacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `preco` decimal(10,2) DEFAULT NULL,
  `usuario_id` int(11) NOT NULL,
  `status` enum('disponivel','indisponivel') NOT NULL DEFAULT 'disponivel'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `espacos`
--

INSERT INTO `espacos` (`id`, `nome`, `descricao`, `capacidade`, `imagem`, `cep`, `rua`, `numero`, `complemento`, `bairro`, `cidade`, `estado_sigla`, `data_criacao`, `preco`, `usuario_id`, `status`) VALUES
(1, 'Restaurante ABC', 'Restaurante com comida variada', 100, '/assets/uploads/berserk.jpg', '12345-678', 'Rua A', '100', 'Apto 101', 'Centro', 'Cidade X', 'SP', '2024-11-28 16:46:01', '150.00', 2, 'disponivel'),
(2, 'Café do Bairro', 'Café e lanches', 30, '/assets/uploads/dog.jpg', '23456-789', 'Rua B', '200', 'Bloco 2', 'Jardim', 'Cidade Y', 'RJ', '2024-11-28 16:46:01', '50.00', 2, 'disponivel'),
(3, 'Pizzaria Bella', 'Pizzas de vários sabores', 50, '/assets/uploads/pig.jpg', '34567-890', 'Rua C', '300', NULL, 'Bela Vista', 'Cidade Z', 'MG', '2024-11-28 16:46:01', '120.00', 2, 'disponivel'),
(7, 'amigo', 'asd', 123, '/assets/uploads/1733011013294.jpg', '123123', 'rua magio', '123', '', 'bairro adc', 'sao paulo', 'SP', '2024-11-30 23:56:53', '150.00', 2, 'disponivel'),
(8, 'ccc', 'ccc', 1, '/assets/uploads/1733012198612.png', '1231233', '1', '1', '', 'bairro adc', 'sao paulo', 'SP', '2024-12-01 00:16:38', '150.00', 2, 'disponivel'),
(9, 'a', '1', 1, '/assets/uploads/1733014991478.jpg', '1', '1', '1', '', '1', 'a', 'SP', '2024-12-01 01:03:11', '150.00', 2, 'disponivel'),
(10, 'v', 'v', 1, '/assets/uploads/1733015143689.jpg', 'v', 'v', '1', 'v', 'v', 'sao paulo', 'SP', '2024-12-01 01:05:43', '150.00', 2, 'disponivel');

-- --------------------------------------------------------

--
-- Estrutura da tabela `reservas`
--

CREATE TABLE `reservas` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_espaco` int(11) NOT NULL,
  `data_inicio` datetime NOT NULL,
  `data_fim` datetime NOT NULL,
  `status` enum('pendente','confirmada','cancelada') DEFAULT 'pendente',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `tipo_usuario` int(11) NOT NULL DEFAULT '0',
  `data_criacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_atualizacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `telefone` varchar(20) NOT NULL,
  `data_nascimento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `senha`, `tipo_usuario`, `data_criacao`, `data_atualizacao`, `telefone`, `data_nascimento`) VALUES
(2, 'amigo', 'amigo@gmail.com', '123', 0, '2024-11-28 16:27:15', '2024-11-30 16:42:56', '1123456', '2024-11-05'),
(3, 'amigo', 'xxx@gmail.com', '123', 0, '2024-11-28 16:38:01', '2024-11-28 16:38:01', '112345655', '2024-11-12'),
(4, 'ccc', 'CCC@gmail.com', '123', 0, '2024-11-30 00:07:44', '2024-11-30 00:07:44', '1233333', '2024-11-01');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `espacos`
--
ALTER TABLE `espacos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_usuario` (`usuario_id`);

--
-- Índices para tabela `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_espaco` (`id_espaco`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `telefone` (`telefone`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `espacos`
--
ALTER TABLE `espacos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `reservas`
--
ALTER TABLE `reservas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `espacos`
--
ALTER TABLE `espacos`
  ADD CONSTRAINT `fk_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reservas_ibfk_2` FOREIGN KEY (`id_espaco`) REFERENCES `espacos` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
