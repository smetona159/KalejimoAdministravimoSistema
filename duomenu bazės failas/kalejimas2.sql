-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2019 m. Spa 18 d. 15:25
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kalejimas2`
--

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `asmuo`
--

CREATE TABLE `asmuo` (
  `asmens_kodas` varchar(11) NOT NULL,
  `vardas` varchar(255) NOT NULL,
  `pavarde` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Sukurta duomenų kopija lentelei `asmuo`
--

INSERT INTO `asmuo` (`asmens_kodas`, `vardas`, `pavarde`) VALUES
('0000000', 'veikia', 'gal'),
('123', 'dx', 'dx'),
('1234', 'test', 'test'),
('12457896311', 'test', '2test'),
('22222222', 'testas', 'testas'),
('3333333333', 'testas', 'testas'),
('39705032365', 'kristupas', 'slimas'),
('39710024', 'Simas', 'Paskauskas'),
('49705032365', 'Kristupas', 'Slimas'),
('888888888', 'testas', 'testas');

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `aukstai`
--

CREATE TABLE `aukstai` (
  `Pavadinimas` varchar(255) NOT NULL,
  `Kodas` int(11) NOT NULL,
  `fk_Blokas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Sukurta duomenų kopija lentelei `aukstai`
--

INSERT INTO `aukstai` (`Pavadinimas`, `Kodas`, `fk_Blokas`) VALUES
('A1', 1, 0),
('A2', 2, 0),
('A3', 3, 0),
('B1', 4, 1),
('B2', 5, 1),
('B3', 6, 1),
('C1', 7, 2),
('C2', 8, 2),
('C3', 9, 2);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `blokai`
--

CREATE TABLE `blokai` (
  `Pavadinimas` varchar(255) NOT NULL,
  `Kodas` int(11) NOT NULL,
  `Signalizacija` tinyint(1) NOT NULL,
  `fk_Kalejimas` int(11) NOT NULL,
  `fk_Koridorius` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Sukurta duomenų kopija lentelei `blokai`
--

INSERT INTO `blokai` (`Pavadinimas`, `Kodas`, `Signalizacija`, `fk_Kalejimas`, `fk_Koridorius`) VALUES
('A', 0, 0, 0, NULL),
('B', 1, 0, 0, NULL),
('C', 2, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `daiktas`
--

CREATE TABLE `daiktas` (
  `Pavadinimas` varchar(255) NOT NULL,
  `Kodas` int(11) NOT NULL,
  `Gavimo_data` date NOT NULL,
  `Kaina` double NOT NULL,
  `Spalva` varchar(255) DEFAULT NULL,
  `Tipas` varchar(255) NOT NULL,
  `Bukle` varchar(255) NOT NULL,
  `fk_PatalpaId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `darbuotojas`
--

CREATE TABLE `darbuotojas` (
  `tabelio_nr` int(11) NOT NULL,
  `telefono_numeris` int(11) NOT NULL,
  `gyvenamoji_vieta` varchar(255) NOT NULL,
  `sutarties_pradzia` date NOT NULL,
  `sutarties_pabaiga` date DEFAULT NULL,
  `pareigos` int(1) NOT NULL,
  `fk_Pamainapamainos_id` int(11) DEFAULT NULL,
  `fk_Asmuoasmens_kodas` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Sukurta duomenų kopija lentelei `darbuotojas`
--

INSERT INTO `darbuotojas` (`tabelio_nr`, `telefono_numeris`, `gyvenamoji_vieta`, `sutarties_pradzia`, `sutarties_pabaiga`, `pareigos`, `fk_Pamainapamainos_id`, `fk_Asmuoasmens_kodas`) VALUES
(1234, 86123132, 'Kaunas', '2018-11-01', NULL, 2, NULL, '39710024'),
(1254, 865825475, 'Kaunas', '2018-12-01', NULL, 2, NULL, '39705032365'),
(1257, 1235, 'mano', '2018-11-30', '0000-00-00', 0, 1, '49705032365'),
(1263, 111, '1111', '2018-12-01', '2018-12-29', 1, 1, '123'),
(1266, 888888, '888888', '2018-12-01', '2018-12-02', 1, 1, '12457896311'),
(1267, 1235, 'mano', '2018-12-01', '2018-12-02', 2, 1, '0000000'),
(1269, 0, '00000', '2018-12-01', '2018-12-01', 1, 2, '1234'),
(1270, 55555555, '55555555', '2018-12-01', '2018-12-15', 1, 2, '22222222');

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `grafiko_laikas`
--

CREATE TABLE `grafiko_laikas` (
  `grafiko_id` int(11) NOT NULL,
  `grafiko_pradzia` time NOT NULL DEFAULT '07:10:10',
  `grafiko_pabaiga` time NOT NULL DEFAULT '07:10:10'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Sukurta duomenų kopija lentelei `grafiko_laikas`
--

INSERT INTO `grafiko_laikas` (`grafiko_id`, `grafiko_pradzia`, `grafiko_pabaiga`) VALUES
(1, '08:00:10', '12:00:10'),
(2, '12:00:10', '16:00:10'),
(3, '16:00:10', '20:00:10'),
(4, '20:00:10', '00:00:10'),
(5, '00:00:10', '04:00:10'),
(6, '04:00:10', '08:00:10');

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `kalejimai`
--

CREATE TABLE `kalejimai` (
  `Pavadinimas` varchar(255) NOT NULL,
  `id_Kalejimas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Sukurta duomenų kopija lentelei `kalejimai`
--

INSERT INTO `kalejimai` (`Pavadinimas`, `id_Kalejimas`) VALUES
('Lukiskiu', 0);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `kalinys`
--

CREATE TABLE `kalinys` (
  `kalinio_id` int(11) NOT NULL,
  `kalejimo_priezastis` varchar(255) NOT NULL,
  `kalejimo_pradzios_laikotarpis` date NOT NULL,
  `numatoma_paleidimo_data` date DEFAULT NULL,
  `fk_KameraKodas` int(11) DEFAULT NULL,
  `fk_Asmuoasmens_kodas` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Sukurta duomenų kopija lentelei `kalinys`
--

INSERT INTO `kalinys` (`kalinio_id`, `kalejimo_priezastis`, `kalejimo_pradzios_laikotarpis`, `numatoma_paleidimo_data`, `fk_KameraKodas`, `fk_Asmuoasmens_kodas`) VALUES
(1, 'Vagyste', '2018-12-01', NULL, 1, '39710024'),
(8, 'testas', '2018-12-01', '2018-12-02', 5, '123'),
(10, 'testas2x', '2018-12-01', '2018-12-29', 10, '1234'),
(12, 'testttttt', '2018-12-01', '2018-12-22', 18, '0000000'),
(13, '22222222', '2018-12-01', '2018-12-30', 19, '3333333333');

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `kameros`
--

CREATE TABLE `kameros` (
  `Kodas` int(11) NOT NULL,
  `fk_Aukstas` int(11) NOT NULL,
  `Vardas` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Sukurta duomenų kopija lentelei `kameros`
--

INSERT INTO `kameros` (`Kodas`, `fk_Aukstas`, `Vardas`) VALUES
(1, 1, '01'),
(2, 1, '02'),
(3, 1, '03'),
(4, 1, '04'),
(5, 1, '05'),
(6, 1, '06'),
(7, 1, '07'),
(8, 1, '08'),
(9, 1, '09'),
(10, 1, '10'),
(11, 1, '11'),
(12, 1, '12'),
(13, 1, '13'),
(14, 1, '14'),
(15, 1, '15'),
(16, 1, '16'),
(17, 1, '17'),
(18, 1, '18'),
(19, 1, '19'),
(20, 1, '20'),
(21, 2, '03'),
(22, 2, '04'),
(23, 2, '05'),
(24, 2, '06'),
(25, 2, '07'),
(26, 2, '08'),
(27, 2, '09'),
(28, 2, '10'),
(29, 2, '11'),
(30, 2, '12'),
(31, 2, '13'),
(32, 2, '14'),
(33, 2, '15'),
(34, 2, '16'),
(35, 2, '17'),
(36, 2, '18'),
(37, 2, '19'),
(38, 2, '20'),
(39, 3, '03'),
(40, 3, '04'),
(41, 3, '05'),
(42, 3, '06'),
(43, 3, '07'),
(44, 3, '08'),
(45, 3, '09'),
(46, 3, '10'),
(47, 3, '11'),
(48, 3, '12'),
(49, 3, '13'),
(50, 3, '14'),
(51, 3, '15'),
(52, 3, '16'),
(53, 3, '17'),
(54, 3, '18'),
(55, 3, '19'),
(56, 3, '20'),
(57, 4, '03'),
(58, 4, '04'),
(59, 4, '05'),
(60, 4, '06'),
(61, 4, '07'),
(62, 4, '08'),
(63, 4, '09'),
(64, 4, '10'),
(65, 4, '11'),
(66, 4, '12'),
(67, 4, '13'),
(68, 4, '14'),
(69, 4, '15'),
(70, 4, '16'),
(71, 4, '17'),
(72, 4, '18'),
(73, 4, '19'),
(74, 4, '20'),
(75, 5, '03'),
(76, 5, '04'),
(77, 5, '05'),
(78, 5, '06'),
(79, 5, '07'),
(80, 5, '08'),
(81, 5, '09'),
(82, 5, '10'),
(83, 5, '11'),
(84, 5, '12'),
(85, 5, '13'),
(86, 5, '14'),
(87, 5, '15'),
(88, 5, '16'),
(89, 5, '17'),
(90, 5, '18'),
(91, 5, '19'),
(92, 5, '20'),
(93, 6, '03'),
(94, 6, '04'),
(95, 6, '05'),
(96, 6, '06'),
(97, 6, '07'),
(98, 6, '08'),
(99, 6, '09'),
(100, 6, '10'),
(101, 6, '11'),
(102, 6, '12'),
(103, 6, '13'),
(104, 6, '14'),
(105, 6, '15'),
(106, 6, '16'),
(107, 6, '17'),
(108, 6, '18'),
(109, 6, '19'),
(110, 6, '20'),
(111, 7, '03'),
(112, 7, '04'),
(113, 7, '05'),
(114, 7, '06'),
(115, 7, '07'),
(116, 7, '08'),
(117, 7, '09'),
(118, 7, '10'),
(119, 7, '11'),
(120, 7, '12'),
(121, 7, '13'),
(122, 7, '14'),
(123, 7, '15'),
(124, 7, '16'),
(125, 7, '17'),
(126, 7, '18'),
(127, 7, '19'),
(128, 7, '20'),
(129, 8, '03'),
(130, 8, '04'),
(131, 8, '05'),
(132, 8, '06'),
(133, 8, '07'),
(134, 8, '08'),
(135, 8, '09'),
(136, 8, '10'),
(137, 8, '11'),
(138, 8, '12'),
(139, 8, '13'),
(140, 8, '14'),
(141, 8, '15'),
(142, 8, '16'),
(143, 8, '17'),
(144, 8, '18'),
(145, 8, '19'),
(146, 8, '20'),
(147, 9, '03'),
(148, 9, '04'),
(149, 9, '05'),
(150, 9, '06'),
(151, 9, '07'),
(152, 9, '08'),
(153, 9, '09'),
(154, 9, '10'),
(155, 9, '11'),
(156, 9, '12'),
(157, 9, '13'),
(158, 9, '14'),
(159, 9, '15'),
(160, 9, '16'),
(161, 9, '17'),
(162, 9, '18'),
(163, 9, '19'),
(164, 9, '20');

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `koridoriai`
--

CREATE TABLE `koridoriai` (
  `Pavadinimas` varchar(255) NOT NULL,
  `Kodas` int(11) NOT NULL,
  `fk_Koridorius` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `korteles`
--

CREATE TABLE `korteles` (
  `Isdavimo_data` date NOT NULL,
  `Galiojimo_data` date NOT NULL,
  `ID` int(11) NOT NULL,
  `Lygis` int(1) NOT NULL,
  `fk_Darbuotojastabelio_nr` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Sukurta duomenų kopija lentelei `korteles`
--

INSERT INTO `korteles` (`Isdavimo_data`, `Galiojimo_data`, `ID`, `Lygis`, `fk_Darbuotojastabelio_nr`) VALUES
('2018-11-08', '2018-12-08', 0, 3, 1234),
('2018-11-30', '2018-11-30', 51509718, 1, 1234),
('2018-11-30', '2018-12-08', 67375990, 5, 1234),
('2018-11-30', '2019-01-25', 86880313, 2, 1234),
('2018-11-30', '2018-12-08', 91573944, 2, 1234);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `kortelesvartai`
--

CREATE TABLE `kortelesvartai` (
  `Uzklausa_sekminga` tinyint(1) NOT NULL,
  `Kreipimasis` int(1) NOT NULL,
  `fk_Vartai` int(11) NOT NULL,
  `fk_Kortele` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `Kada` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Sukurta duomenų kopija lentelei `kortelesvartai`
--

INSERT INTO `kortelesvartai` (`Uzklausa_sekminga`, `Kreipimasis`, `fk_Vartai`, `fk_Kortele`, `id`, `Kada`) VALUES
(0, 0, 242, 67375990, 1, '2018-12-02 08:17:05'),
(1, 1, 252, 86880313, 2, '2018-12-04 07:20:11'),
(0, 0, 243, 67375990, 3, '2018-12-02 23:54:07'),
(0, 0, 243, 67375990, 4, '2018-12-02 23:57:23'),
(1, 0, 243, 67375990, 5, '2018-12-03 00:00:27');

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `lankytojas`
--

CREATE TABLE `lankytojas` (
  `lankytojo_id` int(11) NOT NULL,
  `lankytojo_telefono_numeris` int(11) NOT NULL,
  `lankytojo_gyvenamoji_vieta` varchar(255) NOT NULL,
  `lankymo_data` date NOT NULL,
  `fk_Kalinyskalinio_id` int(11) NOT NULL,
  `fk_Asmuoasmens_kodas` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Sukurta duomenų kopija lentelei `lankytojas`
--

INSERT INTO `lankytojas` (`lankytojo_id`, `lankytojo_telefono_numeris`, `lankytojo_gyvenamoji_vieta`, `lankymo_data`, `fk_Kalinyskalinio_id`, `fk_Asmuoasmens_kodas`) VALUES
(1, 123, 'test', '2018-12-01', 8, '123'),
(5, 123569, 'test', '2018-12-30', 1, '1234'),
(6, 123569, 'test', '2018-12-01', 12, '39710024'),
(7, 123569, 'test', '2018-12-01', 13, '0000000');

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `pamaina`
--

CREATE TABLE `pamaina` (
  `pamainos_id` int(11) NOT NULL,
  `pavadinimas` varchar(255) NOT NULL,
  `fk_Grafiko_laikasgrafiko_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Sukurta duomenų kopija lentelei `pamaina`
--

INSERT INTO `pamaina` (`pamainos_id`, `pavadinimas`, `fk_Grafiko_laikasgrafiko_id`) VALUES
(1, 'pirma', 1),
(2, 'antra', 2);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `patalpa`
--

CREATE TABLE `patalpa` (
  `Id` int(11) NOT NULL,
  `Pavadinimas` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `registracija`
--

CREATE TABLE `registracija` (
  `Isdavimo_kodas` int(11) NOT NULL,
  `Isdavimo_d` date NOT NULL,
  `Pridavimo_d` date DEFAULT NULL,
  `fk_DaiktasKodas` int(11) NOT NULL,
  `fk_Darbuotojastabelio_nr` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `vartai`
--

CREATE TABLE `vartai` (
  `Kodas` int(11) NOT NULL,
  `Atidaryti` tinyint(1) NOT NULL,
  `Lygis` int(1) NOT NULL,
  `Vardas` varchar(5) NOT NULL,
  `fk_Blokas` int(11) DEFAULT NULL,
  `fk_Koridorius` int(11) DEFAULT NULL,
  `fk_Kamera` int(11) DEFAULT NULL,
  `fk_Aukstas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Sukurta duomenų kopija lentelei `vartai`
--

INSERT INTO `vartai` (`Kodas`, `Atidaryti`, `Lygis`, `Vardas`, `fk_Blokas`, `fk_Koridorius`, `fk_Kamera`, `fk_Aukstas`) VALUES
(242, 1, 1, '01', 0, NULL, NULL, 1),
(243, 0, 1, '02', 0, NULL, NULL, 1),
(244, 1, 1, '03', 0, NULL, NULL, 1),
(245, 1, 1, '04', 0, NULL, NULL, 1),
(246, 1, 1, '05', 0, NULL, NULL, 1),
(247, 1, 1, '06', 0, NULL, NULL, 1),
(248, 1, 1, '07', 0, NULL, NULL, 1),
(249, 1, 1, '08', 0, NULL, NULL, 1),
(250, 1, 1, '09', 0, NULL, NULL, 1),
(251, 1, 1, '10', 0, NULL, NULL, 1),
(252, 1, 1, '11', 0, NULL, NULL, 1),
(253, 1, 1, '12', 0, NULL, NULL, 1),
(254, 1, 1, '13', 0, NULL, NULL, 1),
(255, 1, 1, '14', 0, NULL, NULL, 1),
(256, 1, 1, '15', 0, NULL, NULL, 1),
(257, 1, 1, '16', 0, NULL, NULL, 1),
(258, 1, 1, '17', 0, NULL, NULL, 1),
(259, 1, 1, '18', 0, NULL, NULL, 1),
(260, 1, 1, '19', 0, NULL, NULL, 1),
(261, 1, 1, '20', 0, NULL, NULL, 1),
(262, 1, 1, '01', 0, NULL, NULL, 2),
(263, 1, 1, '02', 0, NULL, NULL, 2),
(264, 1, 1, '03', 0, NULL, NULL, 2),
(265, 1, 1, '04', 0, NULL, NULL, 2),
(266, 1, 1, '05', 0, NULL, NULL, 2),
(267, 1, 1, '06', 0, NULL, NULL, 2),
(268, 1, 1, '07', 0, NULL, NULL, 2),
(269, 1, 1, '08', 0, NULL, NULL, 2),
(270, 1, 1, '09', 0, NULL, NULL, 2),
(271, 1, 1, '10', 0, NULL, NULL, 2),
(272, 1, 1, '11', 0, NULL, NULL, 2),
(273, 1, 1, '12', 0, NULL, NULL, 2),
(274, 1, 1, '13', 0, NULL, NULL, 2),
(275, 1, 1, '14', 0, NULL, NULL, 2),
(276, 1, 1, '15', 0, NULL, NULL, 2),
(277, 1, 1, '16', 0, NULL, NULL, 2),
(278, 1, 1, '17', 0, NULL, NULL, 2),
(279, 1, 1, '18', 0, NULL, NULL, 2),
(280, 1, 1, '19', 0, NULL, NULL, 2),
(281, 1, 1, '20', 0, NULL, NULL, 2),
(282, 1, 1, '01', 0, NULL, NULL, 3),
(283, 1, 1, '02', 0, NULL, NULL, 3),
(284, 1, 1, '03', 0, NULL, NULL, 3),
(285, 1, 1, '04', 0, NULL, NULL, 3),
(286, 1, 1, '05', 0, NULL, NULL, 3),
(287, 1, 1, '06', 0, NULL, NULL, 3),
(288, 1, 1, '07', 0, NULL, NULL, 3),
(289, 1, 1, '08', 0, NULL, NULL, 3),
(290, 1, 1, '09', 0, NULL, NULL, 3),
(291, 1, 1, '10', 0, NULL, NULL, 3),
(292, 1, 1, '11', 0, NULL, NULL, 3),
(293, 1, 1, '12', 0, NULL, NULL, 3),
(294, 1, 1, '13', 0, NULL, NULL, 3),
(295, 1, 1, '14', 0, NULL, NULL, 3),
(296, 1, 1, '15', 0, NULL, NULL, 3),
(297, 1, 1, '16', 0, NULL, NULL, 3),
(298, 1, 1, '17', 0, NULL, NULL, 3),
(299, 1, 1, '18', 0, NULL, NULL, 3),
(300, 1, 1, '19', 0, NULL, NULL, 3),
(301, 1, 1, '20', 0, NULL, NULL, 3),
(302, 1, 1, '01', 1, NULL, NULL, 4),
(303, 1, 1, '02', 1, NULL, NULL, 4),
(304, 1, 1, '03', 1, NULL, NULL, 4),
(305, 1, 1, '04', 1, NULL, NULL, 4),
(306, 1, 1, '05', 1, NULL, NULL, 4),
(307, 1, 1, '06', 1, NULL, NULL, 4),
(308, 1, 1, '07', 1, NULL, NULL, 4),
(309, 1, 1, '08', 1, NULL, NULL, 4),
(310, 1, 1, '09', 1, NULL, NULL, 4),
(311, 1, 1, '10', 1, NULL, NULL, 4),
(312, 1, 1, '11', 1, NULL, NULL, 4),
(313, 1, 1, '12', 1, NULL, NULL, 4),
(314, 1, 1, '13', 1, NULL, NULL, 4),
(315, 1, 1, '14', 1, NULL, NULL, 4),
(316, 1, 1, '15', 1, NULL, NULL, 4),
(317, 1, 1, '16', 1, NULL, NULL, 4),
(318, 1, 1, '17', 1, NULL, NULL, 4),
(319, 1, 1, '18', 1, NULL, NULL, 4),
(320, 1, 1, '19', 1, NULL, NULL, 4),
(321, 1, 1, '20', 1, NULL, NULL, 4),
(322, 1, 1, '01', 1, NULL, NULL, 5),
(323, 1, 1, '02', 1, NULL, NULL, 5),
(324, 1, 1, '03', 1, NULL, NULL, 5),
(325, 1, 1, '04', 1, NULL, NULL, 5),
(326, 1, 1, '05', 1, NULL, NULL, 5),
(327, 1, 1, '06', 1, NULL, NULL, 5),
(328, 1, 1, '07', 1, NULL, NULL, 5),
(329, 1, 1, '08', 1, NULL, NULL, 5),
(330, 1, 1, '09', 1, NULL, NULL, 5),
(331, 1, 1, '10', 1, NULL, NULL, 5),
(332, 1, 1, '11', 1, NULL, NULL, 5),
(333, 1, 1, '12', 1, NULL, NULL, 5),
(334, 1, 1, '13', 1, NULL, NULL, 5),
(335, 1, 1, '14', 1, NULL, NULL, 5),
(336, 1, 1, '15', 1, NULL, NULL, 5),
(337, 1, 1, '16', 1, NULL, NULL, 5),
(338, 1, 1, '17', 1, NULL, NULL, 5),
(339, 1, 1, '18', 1, NULL, NULL, 5),
(340, 1, 1, '19', 1, NULL, NULL, 5),
(341, 1, 1, '20', 1, NULL, NULL, 5),
(342, 1, 1, '01', 1, NULL, NULL, 6),
(343, 1, 1, '02', 1, NULL, NULL, 6),
(344, 1, 1, '03', 1, NULL, NULL, 6),
(345, 1, 1, '04', 1, NULL, NULL, 6),
(346, 1, 1, '05', 1, NULL, NULL, 6),
(347, 1, 1, '06', 1, NULL, NULL, 6),
(348, 1, 1, '07', 1, NULL, NULL, 6),
(349, 1, 1, '08', 1, NULL, NULL, 6),
(350, 1, 1, '09', 1, NULL, NULL, 6),
(351, 1, 1, '10', 1, NULL, NULL, 6),
(352, 1, 1, '11', 1, NULL, NULL, 6),
(353, 1, 1, '12', 1, NULL, NULL, 6),
(354, 1, 1, '13', 1, NULL, NULL, 6),
(355, 1, 1, '14', 1, NULL, NULL, 6),
(356, 1, 1, '15', 1, NULL, NULL, 6),
(357, 1, 1, '16', 1, NULL, NULL, 6),
(358, 1, 1, '17', 1, NULL, NULL, 6),
(359, 1, 1, '18', 1, NULL, NULL, 6),
(360, 1, 1, '19', 1, NULL, NULL, 6),
(361, 1, 1, '20', 1, NULL, NULL, 6),
(382, 1, 2, '01', 2, NULL, NULL, 7),
(383, 1, 1, '02', 2, NULL, NULL, 7),
(384, 1, 2, '03', 2, NULL, NULL, 7),
(385, 1, 2, '04', 2, NULL, NULL, 7),
(386, 1, 2, '05', 2, NULL, NULL, 7),
(387, 1, 2, '06', 2, NULL, NULL, 7),
(388, 1, 2, '07', 2, NULL, NULL, 7),
(389, 1, 2, '08', 2, NULL, NULL, 7),
(390, 1, 2, '09', 2, NULL, NULL, 7),
(391, 1, 2, '10', 2, NULL, NULL, 7),
(392, 1, 2, '11', 2, NULL, NULL, 7),
(393, 1, 2, '12', 2, NULL, NULL, 7),
(394, 1, 2, '13', 2, NULL, NULL, 7),
(395, 1, 2, '14', 2, NULL, NULL, 7),
(396, 1, 2, '15', 2, NULL, NULL, 7),
(397, 1, 2, '16', 2, NULL, NULL, 7),
(398, 1, 2, '17', 2, NULL, NULL, 7),
(399, 1, 2, '18', 2, NULL, NULL, 7),
(400, 1, 2, '19', 2, NULL, NULL, 7),
(401, 1, 2, '20', 2, NULL, NULL, 7),
(402, 1, 2, '01', 2, NULL, NULL, 8),
(403, 1, 2, '02', 2, NULL, NULL, 8),
(404, 1, 2, '03', 2, NULL, NULL, 8),
(405, 1, 2, '04', 2, NULL, NULL, 8),
(406, 1, 2, '05', 2, NULL, NULL, 8),
(407, 1, 2, '06', 2, NULL, NULL, 8),
(408, 1, 2, '07', 2, NULL, NULL, 8),
(409, 1, 2, '08', 2, NULL, NULL, 8),
(410, 1, 2, '09', 2, NULL, NULL, 8),
(411, 1, 2, '10', 2, NULL, NULL, 8),
(412, 1, 2, '11', 2, NULL, NULL, 8),
(413, 1, 2, '12', 2, NULL, NULL, 8),
(414, 1, 2, '13', 2, NULL, NULL, 8),
(415, 1, 2, '14', 2, NULL, NULL, 8),
(416, 1, 2, '15', 2, NULL, NULL, 8),
(417, 1, 2, '16', 2, NULL, NULL, 8),
(418, 1, 2, '17', 2, NULL, NULL, 8),
(419, 1, 2, '18', 2, NULL, NULL, 8),
(420, 1, 2, '19', 2, NULL, NULL, 8),
(421, 1, 2, '20', 2, NULL, NULL, 8),
(422, 1, 2, '01', 2, NULL, NULL, 9),
(423, 1, 2, '02', 2, NULL, NULL, 9),
(424, 1, 2, '03', 2, NULL, NULL, 9),
(425, 1, 2, '04', 2, NULL, NULL, 9),
(426, 1, 2, '05', 2, NULL, NULL, 9),
(427, 1, 2, '06', 2, NULL, NULL, 9),
(428, 1, 2, '07', 2, NULL, NULL, 9),
(429, 1, 2, '08', 2, NULL, NULL, 9),
(430, 1, 2, '09', 2, NULL, NULL, 9),
(431, 1, 2, '10', 2, NULL, NULL, 9),
(432, 1, 2, '11', 2, NULL, NULL, 9),
(433, 1, 2, '12', 2, NULL, NULL, 9),
(434, 1, 2, '13', 2, NULL, NULL, 9),
(435, 1, 2, '14', 2, NULL, NULL, 9),
(436, 1, 2, '15', 2, NULL, NULL, 9),
(437, 1, 2, '16', 2, NULL, NULL, 9),
(438, 1, 2, '17', 2, NULL, NULL, 9),
(439, 1, 2, '18', 2, NULL, NULL, 9),
(440, 1, 2, '19', 2, NULL, NULL, 9),
(441, 1, 2, '20', 2, NULL, NULL, 9);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `vartotojai`
--

CREATE TABLE `vartotojai` (
  `id` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `level` int(11) NOT NULL,
  `fk_Darbuotojastabelio_nr` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Sukurta duomenų kopija lentelei `vartotojai`
--

INSERT INTO `vartotojai` (`id`, `username`, `password`, `email`, `level`, `fk_Darbuotojastabelio_nr`) VALUES
('', 'naujas', '098f6bcd4621d373cade4e832627b4f6', 'kristupas.slimas@gmail.com', 1, 1266),
('a7f34c3e4a3ce8af29707ad43eb57ba3', 'kristupas', '098f6bcd4621d373cade4e832627b4f6', 'kristupas.slimas@gmail.com', 1, 1254),
('abLokY4FobKKVqsH', 'smetona159', '098f6bcd4621d373cade4e832627b4f6', 'kristupas.slimas@gmail.com', 2, 1269),
('ooNV9qSTOXAf5dbj', 'karolis249', '098f6bcd4621d373cade4e832627b4f6', 'kristupas.slimas@gmail.com', 3, 1267),
('opmmba2ggg3xI6SM', 'testas', '098f6bcd4621d373cade4e832627b4f6', 'kristupas.slimas@gmail.com', 2, 1270);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `asmuo`
--
ALTER TABLE `asmuo`
  ADD PRIMARY KEY (`asmens_kodas`);

--
-- Indexes for table `aukstai`
--
ALTER TABLE `aukstai`
  ADD PRIMARY KEY (`Kodas`),
  ADD KEY `fk_Blokas` (`fk_Blokas`);

--
-- Indexes for table `blokai`
--
ALTER TABLE `blokai`
  ADD PRIMARY KEY (`Kodas`),
  ADD KEY `turi5` (`fk_Kalejimas`),
  ADD KEY `jungia1` (`fk_Koridorius`);

--
-- Indexes for table `daiktas`
--
ALTER TABLE `daiktas`
  ADD PRIMARY KEY (`Kodas`),
  ADD KEY `priklauso_daiktas` (`fk_PatalpaId`);

--
-- Indexes for table `darbuotojas`
--
ALTER TABLE `darbuotojas`
  ADD PRIMARY KEY (`tabelio_nr`),
  ADD KEY `turi_pamaina` (`fk_Pamainapamainos_id`),
  ADD KEY `dirba` (`fk_Asmuoasmens_kodas`);

--
-- Indexes for table `grafiko_laikas`
--
ALTER TABLE `grafiko_laikas`
  ADD PRIMARY KEY (`grafiko_id`);

--
-- Indexes for table `kalejimai`
--
ALTER TABLE `kalejimai`
  ADD PRIMARY KEY (`id_Kalejimas`);

--
-- Indexes for table `kalinys`
--
ALTER TABLE `kalinys`
  ADD PRIMARY KEY (`kalinio_id`),
  ADD UNIQUE KEY `fk_Asmuoasmens_kodas` (`fk_Asmuoasmens_kodas`),
  ADD KEY `gyvena` (`fk_KameraKodas`);

--
-- Indexes for table `kameros`
--
ALTER TABLE `kameros`
  ADD PRIMARY KEY (`Kodas`),
  ADD KEY `turi3` (`fk_Aukstas`);

--
-- Indexes for table `koridoriai`
--
ALTER TABLE `koridoriai`
  ADD PRIMARY KEY (`Kodas`),
  ADD KEY `jungia` (`fk_Koridorius`);

--
-- Indexes for table `korteles`
--
ALTER TABLE `korteles`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_Darbuotojastabelio_nr_2` (`fk_Darbuotojastabelio_nr`),
  ADD KEY `fk_Darbuotojastabelio_nr` (`fk_Darbuotojastabelio_nr`) USING BTREE;

--
-- Indexes for table `kortelesvartai`
--
ALTER TABLE `kortelesvartai`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Atidaro1` (`fk_Vartai`),
  ADD KEY `atidaro` (`fk_Kortele`);

--
-- Indexes for table `lankytojas`
--
ALTER TABLE `lankytojas`
  ADD PRIMARY KEY (`lankytojo_id`),
  ADD KEY `lanko_kalini` (`fk_Kalinyskalinio_id`),
  ADD KEY `lanko` (`fk_Asmuoasmens_kodas`);

--
-- Indexes for table `pamaina`
--
ALTER TABLE `pamaina`
  ADD PRIMARY KEY (`pamainos_id`),
  ADD KEY `turi_grafika` (`fk_Grafiko_laikasgrafiko_id`);

--
-- Indexes for table `patalpa`
--
ALTER TABLE `patalpa`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `registracija`
--
ALTER TABLE `registracija`
  ADD PRIMARY KEY (`Isdavimo_kodas`),
  ADD KEY `registruojamas_daiktas` (`fk_DaiktasKodas`),
  ADD KEY `registruojamas_darbuotojas` (`fk_Darbuotojastabelio_nr`);

--
-- Indexes for table `vartai`
--
ALTER TABLE `vartai`
  ADD PRIMARY KEY (`Kodas`),
  ADD UNIQUE KEY `fk_Kamera` (`fk_Kamera`),
  ADD KEY `turi1` (`fk_Blokas`),
  ADD KEY `turi4` (`fk_Koridorius`),
  ADD KEY `fk_Aukstas` (`fk_Aukstas`);

--
-- Indexes for table `vartotojai`
--
ALTER TABLE `vartotojai`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fk_Darbuotojastabelio_nr` (`fk_Darbuotojastabelio_nr`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `daiktas`
--
ALTER TABLE `daiktas`
  MODIFY `Kodas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `darbuotojas`
--
ALTER TABLE `darbuotojas`
  MODIFY `tabelio_nr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1271;

--
-- AUTO_INCREMENT for table `grafiko_laikas`
--
ALTER TABLE `grafiko_laikas`
  MODIFY `grafiko_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `kalinys`
--
ALTER TABLE `kalinys`
  MODIFY `kalinio_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `kameros`
--
ALTER TABLE `kameros`
  MODIFY `Kodas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

--
-- AUTO_INCREMENT for table `koridoriai`
--
ALTER TABLE `koridoriai`
  MODIFY `Kodas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kortelesvartai`
--
ALTER TABLE `kortelesvartai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `lankytojas`
--
ALTER TABLE `lankytojas`
  MODIFY `lankytojo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pamaina`
--
ALTER TABLE `pamaina`
  MODIFY `pamainos_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `patalpa`
--
ALTER TABLE `patalpa`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `registracija`
--
ALTER TABLE `registracija`
  MODIFY `Isdavimo_kodas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vartai`
--
ALTER TABLE `vartai`
  MODIFY `Kodas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=442;

--
-- Apribojimai eksportuotom lentelėm
--

--
-- Apribojimai lentelei `aukstai`
--
ALTER TABLE `aukstai`
  ADD CONSTRAINT `Aukstai_ibfk_1` FOREIGN KEY (`fk_Blokas`) REFERENCES `blokai` (`Kodas`);

--
-- Apribojimai lentelei `blokai`
--
ALTER TABLE `blokai`
  ADD CONSTRAINT `jungia1` FOREIGN KEY (`fk_Koridorius`) REFERENCES `koridoriai` (`Kodas`),
  ADD CONSTRAINT `turi5` FOREIGN KEY (`fk_Kalejimas`) REFERENCES `kalejimai` (`id_Kalejimas`);

--
-- Apribojimai lentelei `daiktas`
--
ALTER TABLE `daiktas`
  ADD CONSTRAINT `priklauso_daiktas` FOREIGN KEY (`fk_PatalpaId`) REFERENCES `patalpa` (`Id`);

--
-- Apribojimai lentelei `darbuotojas`
--
ALTER TABLE `darbuotojas`
  ADD CONSTRAINT `dirba` FOREIGN KEY (`fk_Asmuoasmens_kodas`) REFERENCES `asmuo` (`asmens_kodas`),
  ADD CONSTRAINT `turi_pamaina` FOREIGN KEY (`fk_Pamainapamainos_id`) REFERENCES `pamaina` (`pamainos_id`);

--
-- Apribojimai lentelei `kalinys`
--
ALTER TABLE `kalinys`
  ADD CONSTRAINT `gyvena` FOREIGN KEY (`fk_KameraKodas`) REFERENCES `kameros` (`Kodas`),
  ADD CONSTRAINT `kali` FOREIGN KEY (`fk_Asmuoasmens_kodas`) REFERENCES `asmuo` (`asmens_kodas`);

--
-- Apribojimai lentelei `kameros`
--
ALTER TABLE `kameros`
  ADD CONSTRAINT `turi3` FOREIGN KEY (`fk_Aukstas`) REFERENCES `aukstai` (`Kodas`);

--
-- Apribojimai lentelei `koridoriai`
--
ALTER TABLE `koridoriai`
  ADD CONSTRAINT `jungia` FOREIGN KEY (`fk_Koridorius`) REFERENCES `koridoriai` (`Kodas`);

--
-- Apribojimai lentelei `korteles`
--
ALTER TABLE `korteles`
  ADD CONSTRAINT `turi10` FOREIGN KEY (`fk_Darbuotojastabelio_nr`) REFERENCES `darbuotojas` (`tabelio_nr`);

--
-- Apribojimai lentelei `kortelesvartai`
--
ALTER TABLE `kortelesvartai`
  ADD CONSTRAINT `Atidaro1` FOREIGN KEY (`fk_Vartai`) REFERENCES `vartai` (`Kodas`),
  ADD CONSTRAINT `atidaro` FOREIGN KEY (`fk_Kortele`) REFERENCES `korteles` (`ID`);

--
-- Apribojimai lentelei `lankytojas`
--
ALTER TABLE `lankytojas`
  ADD CONSTRAINT `lanko` FOREIGN KEY (`fk_Asmuoasmens_kodas`) REFERENCES `asmuo` (`asmens_kodas`),
  ADD CONSTRAINT `lanko_kalini` FOREIGN KEY (`fk_Kalinyskalinio_id`) REFERENCES `kalinys` (`kalinio_id`);

--
-- Apribojimai lentelei `pamaina`
--
ALTER TABLE `pamaina`
  ADD CONSTRAINT `turi_grafika` FOREIGN KEY (`fk_Grafiko_laikasgrafiko_id`) REFERENCES `grafiko_laikas` (`grafiko_id`);

--
-- Apribojimai lentelei `registracija`
--
ALTER TABLE `registracija`
  ADD CONSTRAINT `registruojamas_daiktas` FOREIGN KEY (`fk_DaiktasKodas`) REFERENCES `daiktas` (`Kodas`),
  ADD CONSTRAINT `registruojamas_darbuotojas` FOREIGN KEY (`fk_Darbuotojastabelio_nr`) REFERENCES `darbuotojas` (`tabelio_nr`);

--
-- Apribojimai lentelei `vartai`
--
ALTER TABLE `vartai`
  ADD CONSTRAINT `turi` FOREIGN KEY (`fk_Aukstas`) REFERENCES `aukstai` (`Kodas`),
  ADD CONSTRAINT `turi1` FOREIGN KEY (`fk_Blokas`) REFERENCES `blokai` (`Kodas`),
  ADD CONSTRAINT `turi2` FOREIGN KEY (`fk_Kamera`) REFERENCES `kameros` (`Kodas`),
  ADD CONSTRAINT `turi4` FOREIGN KEY (`fk_Koridorius`) REFERENCES `koridoriai` (`Kodas`);

--
-- Apribojimai lentelei `vartotojai`
--
ALTER TABLE `vartotojai`
  ADD CONSTRAINT `Vartotojai_ibfk_1` FOREIGN KEY (`fk_Darbuotojastabelio_nr`) REFERENCES `darbuotojas` (`tabelio_nr`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
