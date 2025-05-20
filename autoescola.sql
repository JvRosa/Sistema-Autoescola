-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 30/07/2024 às 14:13
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `autoescola`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `alunos`
--

CREATE TABLE `alunos` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `data_pauta` date NOT NULL,
  `status_pauta` varchar(50) NOT NULL,
  `categoria` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `alunos`
--

INSERT INTO `alunos` (`id`, `nome`, `email`, `telefone`, `cpf`, `endereco`, `data_pauta`, `status_pauta`, `categoria`) VALUES
(1, 'Antônio Silva', 'antonio@hotmail.com', '(62) 99181-8148', '065.409.709-84', 'Rua Almeida Campos 150', '2024-07-05', '2024-07-05', 'B'),
(2, 'Aluno Teste', 'aluno@gmail.com', '(62) 99191-9090', '999.999.999-99', 'rua x quadra s', '2024-07-05', '2024-07-05', 'A');

-- --------------------------------------------------------

--
-- Estrutura para tabela `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nome` varchar(5) NOT NULL,
  `valor` decimal(8,2) NOT NULL,
  `comissao` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `categorias`
--

INSERT INTO `categorias` (`id`, `nome`, `valor`, `comissao`) VALUES
(1, 'A', 0.00, 0.00),
(2, 'B', 0.00, 0.00),
(3, 'C', 0.00, 0.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `comissoes`
--

CREATE TABLE `comissoes` (
  `id` int(11) NOT NULL,
  `descricao` varchar(50) NOT NULL,
  `valor` decimal(7,2) NOT NULL,
  `funcionario` varchar(20) NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `conta_pagars`
--

CREATE TABLE `conta_pagars` (
  `id` int(11) NOT NULL,
  `descricao` varchar(50) NOT NULL,
  `valor` decimal(8,2) NOT NULL,
  `recep` varchar(20) NOT NULL,
  `pago` varchar(5) NOT NULL,
  `data_venc` date NOT NULL,
  `data` date DEFAULT NULL,
  `servico` int(11) DEFAULT NULL,
  `arquivo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `conta_pagars`
--

INSERT INTO `conta_pagars` (`id`, `descricao`, `valor`, `recep`, `pago`, `data_venc`, `data`, `servico`, `arquivo`) VALUES
(1, 'Conta de Luz', 560.00, '010.203.040-50', 'Não', '2024-07-10', '2024-07-10', NULL, NULL),
(2, 'Conta de Água', 300.00, '010.203.040-50', 'Não', '2024-07-10', '2024-07-10', NULL, ''),
(8, 'Conta de Gás', 350.00, '010.203.040-50', 'Não', '2024-07-12', '2024-07-12', NULL, 'conta3.jpg'),
(9, 'Manutenção', 100.00, '111.111.111-11', 'Sim', '2024-07-19', '2024-07-30', 8, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `conta_recebers`
--

CREATE TABLE `conta_recebers` (
  `id` int(11) NOT NULL,
  `descricao` varchar(50) NOT NULL,
  `valor` decimal(8,2) NOT NULL,
  `aluno` int(11) NOT NULL,
  `recep` varchar(20) NOT NULL,
  `pago` varchar(5) NOT NULL,
  `data` date NOT NULL,
  `aula` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `conta_recebers`
--

INSERT INTO `conta_recebers` (`id`, `descricao`, `valor`, `aluno`, `recep`, `pago`, `data`, `aula`) VALUES
(1, 'Aula - Pinkman', 0.00, 2, '111.111.111-11', 'Não', '2024-07-29', 'Sim'),
(2, 'Aula - Pinkman', 0.00, 2, '111.111.111-11', 'Não', '2024-07-29', 'Sim'),
(3, 'Aula - Pinkman', 0.00, 2, '111.111.111-11', 'Não', '2024-07-29', 'Sim'),
(5, 'Aula - Pinkman', 0.00, 2, '111.111.111-11', 'Não', '2024-07-30', 'Sim');

-- --------------------------------------------------------

--
-- Estrutura para tabela `horarios`
--

CREATE TABLE `horarios` (
  `id` int(11) NOT NULL,
  `hora` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `horarios`
--

INSERT INTO `horarios` (`id`, `hora`) VALUES
(1, '19:00:00'),
(2, '20:00:00'),
(3, '14:00:00'),
(4, '15:00:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `instrutores`
--

CREATE TABLE `instrutores` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `credencial` varchar(50) NOT NULL,
  `data_venc` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `instrutores`
--

INSERT INTO `instrutores` (`id`, `nome`, `email`, `cpf`, `telefone`, `endereco`, `credencial`, `data_venc`) VALUES
(5, 'Pinkman', 'pink@gmail.com', '111.111.111-11', '(62) 99999-9999', 'Rua Almeida Campos 150', '123456789', '2024-07-04'),
(6, 'Walter', 'white@gmail.com', '222.222.222-22', '(62) 91919-1919', 'Rua Almeida Campos 10', '987654321', '2024-07-04');

-- --------------------------------------------------------

--
-- Estrutura para tabela `marcacoes`
--

CREATE TABLE `marcacoes` (
  `id` int(11) NOT NULL,
  `aluno` varchar(50) NOT NULL,
  `instrutor` varchar(20) NOT NULL,
  `data` date NOT NULL,
  `hora` time NOT NULL,
  `categoria` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `marcacoes`
--

INSERT INTO `marcacoes` (`id`, `aluno`, `instrutor`, `data`, `hora`, `categoria`) VALUES
(1, '999.999.999-99', '111.111.111-11', '2024-07-24', '19:00:00', 'A'),
(2, '999.999.999-99', '111.111.111-11', '2024-07-29', '19:00:00', 'A'),
(3, '999.999.999-99', '111.111.111-11', '2024-07-29', '14:00:00', 'A');

-- --------------------------------------------------------

--
-- Estrutura para tabela `movimentacoes`
--

CREATE TABLE `movimentacoes` (
  `id` int(11) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `descricao` varchar(50) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `recep` varchar(20) NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `movimentacoes`
--

INSERT INTO `movimentacoes` (`id`, `tipo`, `descricao`, `valor`, `recep`, `data`) VALUES
(1, 'Entrada', 'aula', 100.00, '010.203.040-50', '2024-07-30'),
(2, 'Saída', 'Manutenção', 100.00, '010.203.040-50', '2024-07-30');

-- --------------------------------------------------------

--
-- Estrutura para tabela `recepcionistas`
--

CREATE TABLE `recepcionistas` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `endereco` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `recepcionistas`
--

INSERT INTO `recepcionistas` (`id`, `nome`, `email`, `cpf`, `telefone`, `endereco`) VALUES
(1, 'Recepcionista', 'recep@gmail.com', '010.203.040-50', '(62) 90990-9090', 'asdf');

-- --------------------------------------------------------

--
-- Estrutura para tabela `servicos`
--

CREATE TABLE `servicos` (
  `id` int(11) NOT NULL,
  `carro` int(11) NOT NULL,
  `instrutor` varchar(20) NOT NULL,
  `descricao` varchar(50) NOT NULL,
  `valor` decimal(8,2) NOT NULL,
  `data` date NOT NULL,
  `pago` varchar(5) NOT NULL,
  `status` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `servicos`
--

INSERT INTO `servicos` (`id`, `carro`, `instrutor`, `descricao`, `valor`, `data`, `pago`, `status`) VALUES
(1, 2, '111.111.111-11', 'Troca de Óleo', 220.00, '2024-07-19', 'Não', 'Aguardando PGTO'),
(3, 2, '111.111.111-11', 'Trocar Pneu', 120.00, '2024-07-19', 'Não', 'Aguardando PGTO'),
(8, 2, '111.111.111-11', 'Manutenção', 100.00, '2024-07-19', 'Sim', 'Pago');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `senha` varchar(35) NOT NULL,
  `nivel` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `usuario`, `senha`, `nivel`) VALUES
(1, 'Joao Rosa', '000.000.000-00', 'admin@hotmail.com', '123', 'admin'),
(2, 'Pinkman', '111.111.111-11', 'pink@gmail.com', '123', 'instrutor'),
(3, 'Walter', '222.222.222-22', 'white@gmail.com', '123', 'instrutor'),
(4, 'Recepcionista', '010.203.040-50', 'recep@gmail.com', '123', 'recep');

-- --------------------------------------------------------

--
-- Estrutura para tabela `veiculos`
--

CREATE TABLE `veiculos` (
  `id` int(11) NOT NULL,
  `placa` varchar(20) NOT NULL,
  `categoria` varchar(5) NOT NULL,
  `km` int(11) NOT NULL,
  `cor` varchar(35) NOT NULL,
  `marca` varchar(50) NOT NULL,
  `ano` int(11) NOT NULL,
  `data_revisao` date NOT NULL,
  `instrutor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `veiculos`
--

INSERT INTO `veiculos` (`id`, `placa`, `categoria`, `km`, `cor`, `marca`, `ano`, `data_revisao`, `instrutor`) VALUES
(1, 'PWD-4526', 'B', 15000, 'Azul', 'Volkswagen', 2012, '2024-07-03', 0),
(2, 'PKD-1453', 'A', 2000, 'Verde', 'Honda', 2015, '2024-07-03', 5);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `alunos`
--
ALTER TABLE `alunos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `comissoes`
--
ALTER TABLE `comissoes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `conta_pagars`
--
ALTER TABLE `conta_pagars`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `conta_recebers`
--
ALTER TABLE `conta_recebers`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `horarios`
--
ALTER TABLE `horarios`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `instrutores`
--
ALTER TABLE `instrutores`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `marcacoes`
--
ALTER TABLE `marcacoes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `movimentacoes`
--
ALTER TABLE `movimentacoes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `recepcionistas`
--
ALTER TABLE `recepcionistas`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `servicos`
--
ALTER TABLE `servicos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `veiculos`
--
ALTER TABLE `veiculos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `alunos`
--
ALTER TABLE `alunos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `comissoes`
--
ALTER TABLE `comissoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `conta_pagars`
--
ALTER TABLE `conta_pagars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `conta_recebers`
--
ALTER TABLE `conta_recebers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `horarios`
--
ALTER TABLE `horarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `instrutores`
--
ALTER TABLE `instrutores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `marcacoes`
--
ALTER TABLE `marcacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `movimentacoes`
--
ALTER TABLE `movimentacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `recepcionistas`
--
ALTER TABLE `recepcionistas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `servicos`
--
ALTER TABLE `servicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `veiculos`
--
ALTER TABLE `veiculos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
