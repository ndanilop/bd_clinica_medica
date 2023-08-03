-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 22-Jul-2022 às 22:20
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bdclinica_danilo`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `agenda_medicos`
--

CREATE TABLE `agenda_medicos` (
  `codigo_agendamento` int(11) NOT NULL,
  `medico` varchar(15) NOT NULL,
  `data_agendamento` date NOT NULL,
  `hora` time NOT NULL,
  `disponivel` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `agenda_medicos`
--

INSERT INTO `agenda_medicos` (`codigo_agendamento`, `medico`, `data_agendamento`, `hora`, `disponivel`) VALUES
(1, '688576-RJ', '2021-06-21', '13:00:00', 1),
(2, '688576-RJ', '2021-06-21', '13:30:00', 1),
(3, '088314-RJ', '2021-06-21', '09:00:00', 1),
(4, '088314-RJ', '2021-06-21', '09:30:00', 1),
(5, '061231-RJ', '2021-06-21', '15:00:00', 1),
(6, '141436-RJ', '2021-06-22', '16:00:00', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `consultas`
--

CREATE TABLE `consultas` (
  `cod_consulta` int(11) NOT NULL,
  `data_consulta` date NOT NULL,
  `paciente` int(11) DEFAULT NULL,
  `e_convenio` tinyint(4) NOT NULL,
  `e_articular` tinyint(4) NOT NULL,
  `cod_convenio` varchar(5) DEFAULT NULL,
  `valor` decimal(5,2) NOT NULL,
  `hora_consulta` time NOT NULL,
  `diagnosticos` varchar(100) NOT NULL,
  `prescricoes` varchar(100) NOT NULL,
  `medico` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `consultas`
--

INSERT INTO `consultas` (`cod_consulta`, `data_consulta`, `paciente`, `e_convenio`, `e_articular`, `cod_convenio`, `valor`, `hora_consulta`, `diagnosticos`, `prescricoes`, `medico`) VALUES
(1, '2021-05-31', 3, 1, 0, 'AML', '180.00', '09:00:00', 'Amidalite', 'AAA', '088314-RJ'),
(2, '2021-05-31', 1, 1, 0, 'AML', '150.00', '13:30:00', 'Hérnia Lombar', 'BBB', '688576-RJ'),
(3, '2021-05-31', 2, 1, 0, 'BRA', '150.20', '13:00:00', 'Cifose', 'CCC', '688576-RJ'),
(4, '2021-05-31', 4, 0, 1, 'PART', '150.20', '15:00:00', 'COVID', 'DDD', '061231-RJ'),
(6, '2021-05-31', 5, 0, 1, 'PART', '120.50', '16:00:00', 'COVID', 'EEE', '141436-RJ'),
(7, '2021-06-01', 2, 0, 1, 'PART', '120.50', '16:00:00', 'COVID', 'FFF', '141436-RJ');

-- --------------------------------------------------------

--
-- Estrutura da tabela `convenios`
--

CREATE TABLE `convenios` (
  `codigo_convenio` varchar(5) NOT NULL,
  `nome_convenio` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `convenios`
--

INSERT INTO `convenios` (`codigo_convenio`, `nome_convenio`) VALUES
('AML', 'Amil Saúde SA'),
('BRA', 'Bradesco Saúde SA'),
('PART', 'Particular'),
('UNM', 'Unimed SA');

-- --------------------------------------------------------

--
-- Estrutura da tabela `especialidades_medicas`
--

CREATE TABLE `especialidades_medicas` (
  `codigo_especialidade` varchar(5) NOT NULL,
  `especialidades` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `especialidades_medicas`
--

INSERT INTO `especialidades_medicas` (`codigo_especialidade`, `especialidades`) VALUES
('CLG', 'Clínica Geral'),
('ORT', 'Ortopedia'),
('PED', 'Pediatria');

-- --------------------------------------------------------

--
-- Estrutura da tabela `exames`
--

CREATE TABLE `exames` (
  `cod_exame` varchar(5) NOT NULL,
  `nome_exame` varchar(45) NOT NULL,
  `valor` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `exames`
--

INSERT INTO `exames` (`cod_exame`, `nome_exame`, `valor`) VALUES
('COL', 'Colesterol', '30.00'),
('FEZ', 'Fezes Completo', '15.00'),
('HEMO', 'Hemograma Completo', '25.00'),
('RAD', 'Radiografia', '100.00'),
('URI', 'Urina Completa com Ureia e Creatina', '25.00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `exames_solicitados`
--

CREATE TABLE `exames_solicitados` (
  `codigo_solicitacao` int(11) NOT NULL,
  `exame` varchar(5) DEFAULT NULL,
  `paciente` int(11) DEFAULT NULL,
  `cod_consulta` int(11) DEFAULT NULL,
  `data_realizacao` varchar(45) NOT NULL,
  `resultado_diagnostico` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `medicos`
--

CREATE TABLE `medicos` (
  `crm` varchar(15) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `telefone` bigint(14) NOT NULL,
  `cod_espec` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `medicos`
--

INSERT INTO `medicos` (`crm`, `nome`, `telefone`, `cod_espec`) VALUES
('061231-RJ', 'Juliana Carvalho', 0, 'CLG'),
('088314-RJ', 'Beatriz Brandão', 0, 'PED'),
('141436-RJ', 'Roberto Campos', 0, 'ORT'),
('688576-RJ', 'André Vinicius Novaes', 0, 'CLG');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pacientes`
--

CREATE TABLE `pacientes` (
  `codigo_paciente` int(11) NOT NULL,
  `numero_prontuario` varchar(50) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `sexo` varchar(1) NOT NULL,
  `rg` varchar(12) NOT NULL,
  `data_nascimento` varchar(45) NOT NULL,
  `telefone_contato` varchar(45) NOT NULL,
  `tipo_sanguineo` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `pacientes`
--

INSERT INTO `pacientes` (`codigo_paciente`, `numero_prontuario`, `nome`, `sexo`, `rg`, `data_nascimento`, `telefone_contato`, `tipo_sanguineo`) VALUES
(1, 'PNIT-01-2021', 'Ana Carolina Batalha', 'F', '21.802.834-6', '1965-06-04', '(21) 997658790', 'A+'),
(2, 'PNIT-02-2021', 'Roberto Vicente', 'M', '01.912.937-1', '1985-03-10', '(21) 996455871', 'B+'),
(3, 'PNIT-03-2021', 'João Carlos Machado', 'M', '14.713.921-2', '2018-07-24', '(21) 998918000', 'AB'),
(4, 'PNIT-04-2021', 'Andrea Beltrão', 'F', '09.403.452-3', '1992-02-27', '(21) 997658790', 'O-'),
(5, 'PNIT-05-2021', 'Marcelo Alencar', 'M', '09.403.452-3', '1979-01-03', '(21) 997658790', 'A+'),
(6, 'PNIT-06-2021', 'Mirella Carneiro', 'M', '29.123.456-7', '1997-02-15', '(21) 968632522', 'AB');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `agenda_medicos`
--
ALTER TABLE `agenda_medicos`
  ADD PRIMARY KEY (`codigo_agendamento`),
  ADD UNIQUE KEY `codigo_agendamento` (`codigo_agendamento`),
  ADD KEY `FK_agendamed_medicos` (`medico`);

--
-- Índices para tabela `consultas`
--
ALTER TABLE `consultas`
  ADD PRIMARY KEY (`cod_consulta`),
  ADD UNIQUE KEY `cod_consulta` (`cod_consulta`),
  ADD KEY `FK_consultas_convenios` (`cod_convenio`),
  ADD KEY `FK_consultas_pacientes` (`paciente`),
  ADD KEY `FK_medico_consultas` (`medico`);

--
-- Índices para tabela `convenios`
--
ALTER TABLE `convenios`
  ADD PRIMARY KEY (`codigo_convenio`),
  ADD UNIQUE KEY `codigo_convenio` (`codigo_convenio`);

--
-- Índices para tabela `especialidades_medicas`
--
ALTER TABLE `especialidades_medicas`
  ADD PRIMARY KEY (`codigo_especialidade`),
  ADD UNIQUE KEY `codigo_especialidade` (`codigo_especialidade`);

--
-- Índices para tabela `exames`
--
ALTER TABLE `exames`
  ADD PRIMARY KEY (`cod_exame`),
  ADD UNIQUE KEY `cod_exame` (`cod_exame`);

--
-- Índices para tabela `exames_solicitados`
--
ALTER TABLE `exames_solicitados`
  ADD PRIMARY KEY (`codigo_solicitacao`),
  ADD UNIQUE KEY `codigo_solicitacao` (`codigo_solicitacao`),
  ADD KEY `FK_xamessolic_exames` (`exame`),
  ADD KEY `FK_examesssolic_consultas` (`cod_consulta`);

--
-- Índices para tabela `medicos`
--
ALTER TABLE `medicos`
  ADD PRIMARY KEY (`crm`),
  ADD UNIQUE KEY `crm` (`crm`),
  ADD KEY `FK_medicos_espec_medicas` (`cod_espec`);

--
-- Índices para tabela `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`codigo_paciente`),
  ADD UNIQUE KEY `codigo_paciente` (`codigo_paciente`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `agenda_medicos`
--
ALTER TABLE `agenda_medicos`
  ADD CONSTRAINT `FK_agendamed_medicos` FOREIGN KEY (`medico`) REFERENCES `medicos` (`crm`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `consultas`
--
ALTER TABLE `consultas`
  ADD CONSTRAINT `FK_consultas_convenios` FOREIGN KEY (`cod_convenio`) REFERENCES `convenios` (`codigo_convenio`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_consultas_pacientes` FOREIGN KEY (`paciente`) REFERENCES `pacientes` (`codigo_paciente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_medico_consultas` FOREIGN KEY (`medico`) REFERENCES `medicos` (`crm`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `exames_solicitados`
--
ALTER TABLE `exames_solicitados`
  ADD CONSTRAINT `FK_examesssolic_consultas` FOREIGN KEY (`cod_consulta`) REFERENCES `consultas` (`cod_consulta`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_xamessolic_exames` FOREIGN KEY (`exame`) REFERENCES `exames` (`cod_exame`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `medicos`
--
ALTER TABLE `medicos`
  ADD CONSTRAINT `FK_medicos_espec_medicas` FOREIGN KEY (`cod_espec`) REFERENCES `especialidades_medicas` (`codigo_especialidade`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
