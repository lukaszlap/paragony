-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Maj 19, 2024 at 04:19 PM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `paragony`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `firmy`
--

CREATE TABLE `firmy` (
  `id` int(11) NOT NULL,
  `nazwa_firmy` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `firmy`
--

INSERT INTO `firmy` (`id`, `nazwa_firmy`) VALUES
(1, 'A'),
(2, 'B'),
(3, 'C');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kategorie`
--

CREATE TABLE `kategorie` (
  `id_kategorii` int(11) NOT NULL,
  `nazwa_kategorii` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategorie`
--

INSERT INTO `kategorie` (`id_kategorii`, `nazwa_kategorii`) VALUES
(1, 'jedzenie'),
(2, 'napoje'),
(3, 'chemia'),
(4, 'ubrania'),
(5, 'elektronika'),
(6, 'kosmetyki'),
(7, 'usługi'),
(8, 'zakupy_online'),
(17, 'słodycze');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `paragony`
--

CREATE TABLE `paragony` (
  `id` int(11) NOT NULL,
  `id_uzytkownika` int(11) NOT NULL,
  `id_firmy` int(11) NOT NULL,
  `ulica` varchar(25) DEFAULT NULL,
  `miasto` varchar(25) DEFAULT NULL,
  `suma` decimal(10,2) NOT NULL,
  `rabat` decimal(10,2) DEFAULT NULL,
  `data_dodania` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `paragony`
--

INSERT INTO `paragony` (`id`, `id_uzytkownika`, `id_firmy`, `ulica`, `miasto`, `suma`, `rabat`, `data_dodania`) VALUES
(1, 1, 1, 'cos', 'cos', 22.00, 1.00, '2024-05-16 17:44:46'),
(2, 1, 2, 'cos', 'cos', 11.00, 2.00, '2024-05-16 17:47:16'),
(3, 1, 2, 'F.H.U. BOSMAN', '84-120 WLADYSLAWOWO', 103.00, 0.00, '2024-05-16 18:23:28'),
(4, 1, 2, 'F.H.U. BOSMAN', '84-120 Wladyslawowo', 103.00, 0.00, '2024-05-16 18:37:30'),
(5, 1, 2, 'F.H.U. BOSMAN', '84-120 WLADYSLAWOWO', 103.00, 0.00, '2024-05-16 18:38:37'),
(6, 1, 2, 'F.H.U. BOSMAN', '84-120 WLADYSLAWOWO', 103.00, 0.00, '2024-05-16 18:46:25'),
(7, 1, 2, 'F.H.U. BOSMAN', '84-120 WLADYSLAWOWO', 103.00, 0.00, '2024-05-16 18:48:08'),
(8, 1, 2, 'WEJSCIE NA PLAZE NR 1', '84-120 WLADYSLAWOWO', 103.00, 0.00, '2024-05-16 18:59:11'),
(9, 1, 2, 'ul. MONTE CASSINO 37', 'ŚWINOUJŚCIE', 52.83, 0.00, '2024-05-16 19:19:29'),
(10, 1, 2, 'ul. MONTE CASSINO 37', 'ŚWINOUJŚCIE', 52.83, 0.00, '2024-05-16 19:19:55'),
(11, 1, 2, 'UL. MONTE CASSINO 37', 'ŚWINOUJŚCIE', 52.83, 0.00, '2024-05-16 19:52:45'),
(12, 1, 2, 'ul. JOZEFA BEMA 1', 'Swinoujscie', 52.83, 0.00, '2024-05-16 20:44:27'),
(13, 1, 2, 'ul. JOZEFA BEMA 1', 'SZINOUJSCIE', 52.83, 0.00, '2024-05-16 20:46:43'),
(14, 1, 2, 'Swinoujscie ul. Jozefa Be', NULL, 52.83, 0.00, '2024-05-16 20:50:48'),
(15, 1, 2, 'UL. JOZEFA BEMA 1', 'SWINOUJSCIE', 52.83, 0.00, '2024-05-16 21:06:36'),
(16, 1, 2, 'ul. JOZEFA BEMA 1', 'SWINOUJSCIE', 52.83, 0.00, '2024-05-16 21:07:32'),
(17, 1, 2, 'UL. JOZEFA BEMA 1', 'SWINOUJSCIE', 52.83, 0.00, '2024-05-16 21:07:58'),
(18, 1, 2, 'ul. JOZEFA BEMA 1', 'SłWINOUJŚCIE', 52.83, 0.00, '2024-05-16 21:08:45'),
(19, 1, 2, 'WEJSCIE NA PLAZE NR 1', '84-120 Wladyslawowo', 103.00, 0.00, '2024-05-16 21:17:33'),
(20, 1, 2, 'WEJŚCIE NA PLAŻE NR 1', '84-120 Władysławowo', 103.00, 0.00, '2024-05-16 21:20:08'),
(21, 1, 2, 'WEJSCIE NA PLAZE NR 1', '84-120 WLADYSLAWOWO', 103.00, 0.00, '2024-05-16 21:25:46'),
(22, 1, 2, 'WEJSCIE NA PLAZE NR 1', '84-120 WLADYSLAWOWO', 103.00, 0.00, '2024-05-16 21:26:59'),
(23, 1, 2, NULL, NULL, 180.00, 0.00, '2024-05-16 21:29:20'),
(24, 1, 2, 'ul. Grudziądzka 27/29, 85', 'Jeronimo Martins Polska S', 27.76, 0.00, '2024-05-16 21:32:22'),
(25, 1, 2, 'ul. Kruszwicka 1', 'Bydgoszcz', 21.76, 0.00, '2024-05-16 21:36:23'),
(26, 1, 2, 'ul. Kruszwicka 1', 'Bydgoszcz', 21.76, 0.00, '2024-05-16 21:37:40'),
(27, 1, 2, 'Sp. z o.o. Sp. K.', 'Kraków', 209.00, 0.00, '2024-05-19 12:25:51'),
(28, 1, 2, 'ul. Kruszwicka 1', 'Bydgoszcz', 21.76, 0.00, '2024-05-19 14:11:13'),
(29, 1, 2, 'WEJSCIE NA PLAZE NR 1', '84-120 WLADYSLAWOWO', 103.00, 0.00, '2024-05-19 14:11:45'),
(30, 1, 2, 'ul. JOZEFA BEMA 1', 'ŚWINOUJŚCIE', 52.83, 0.00, '2024-05-19 14:12:17'),
(31, 1, 2, 'Sp. z o.o. Sp. K.', 'Kraków', 209.00, 0.00, '2024-05-19 14:12:47'),
(32, 1, 2, 'ul. Kruszwicka 1', 'Bydgoszcz', 21.76, 0.00, '2024-05-19 14:13:31'),
(33, 1, 2, 'WEJSCIE NA PLAZE NR 1', '84-120 WLADYSLAWOWO', 103.00, 0.00, '2024-05-19 14:13:56'),
(34, 1, 2, 'UL. JOZEFA BEMA 1', 'SWINOUJSCIE', 52.83, 0.00, '2024-05-19 14:14:29'),
(35, 1, 2, 'Sp. z o.o. Sp. K.', 'Kraków', 209.00, 0.00, '2024-05-19 14:15:08');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `produkty`
--

CREATE TABLE `produkty` (
  `id` int(11) NOT NULL,
  `id_paragonu` int(11) NOT NULL,
  `nazwa_produktu` varchar(30) NOT NULL,
  `cena` decimal(10,2) NOT NULL,
  `ilosc` int(11) DEFAULT NULL,
  `jednostka` varchar(15) DEFAULT NULL,
  `typ_podatku` char(1) DEFAULT NULL,
  `id_kategorii` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produkty`
--

INSERT INTO `produkty` (`id`, `id_paragonu`, `nazwa_produktu`, `cena`, `ilosc`, `jednostka`, `typ_podatku`, `id_kategorii`) VALUES
(1, 1, 'kawa', 11.00, 1, 'szt', 'A', 0),
(2, 1, 'herbata', 1.00, 1, 'szt', 'C', 0),
(3, 1, 'herbata', 10.00, 1, 'szt', 'C', 0),
(4, 1, 'cukier', 2.50, 1, 'kg', 'A', 0),
(5, 1, 'chleb', 3.50, 1, 'szt', 'A', 0),
(6, 1, 'mleko', 2.80, 1, 'l', 'A', 0),
(7, 1, 'jajka', 5.00, 10, 'szt', 'A', 0),
(8, 1, 'jabłka', 3.00, 1, 'kg', 'A', 0),
(9, 1, 'banany', 4.00, 1, 'kg', 'A', 0),
(10, 1, 'kawa', 15.00, 1, 'szt', 'B', 0),
(11, 1, 'woda mineralna', 2.00, 1, 'l', 'A', 0),
(12, 1, 'sok pomarańczowy', 3.50, 1, 'l', 'C', 0),
(13, 1, 'jogurt naturalny', 1.50, 1, 'szt', 'A', 0),
(14, 1, 'ser żółty', 12.00, 1, 'kg', 'A', 0),
(15, 1, 'masło', 5.50, 1, 'szt', 'A', 0),
(16, 1, 'szynka', 20.00, 1, 'kg', 'A', 0),
(17, 1, 'ziemniaki', 2.00, 1, 'kg', 'A', 0),
(18, 2, 'herbata', 10.00, 1, 'szt', 'C', 0),
(19, 2, 'cukier', 2.50, 1, 'kg', 'A', 0),
(20, 2, 'chleb', 3.50, 1, 'szt', 'A', 0),
(21, 2, 'mleko', 2.80, 1, 'l', 'A', 0),
(22, 2, 'jajka', 5.00, 10, 'szt', 'A', 0),
(23, 2, 'jabłka', 3.00, 1, 'kg', 'A', 0),
(24, 2, 'banany', 4.00, 1, 'kg', 'A', 0),
(25, 2, 'kawa', 15.00, 1, 'szt', 'B', 0),
(26, 2, 'woda mineralna', 2.00, 1, 'l', 'A', 0),
(27, 2, 'sok pomarańczowy', 3.50, 1, 'l', 'C', 0),
(28, 2, 'jogurt naturalny', 1.50, 1, 'szt', 'A', 0),
(29, 2, 'ser żółty', 12.00, 1, 'kg', 'A', 0),
(30, 2, 'masło', 5.50, 1, 'szt', 'A', 0),
(31, 2, 'szynka', 20.00, 1, 'kg', 'A', 0),
(32, 2, 'ziemniaki', 2.00, 1, 'kg', 'A', 0),
(33, 5, 'WODA', 5.00, 1, 'szt', 'A', 0),
(34, 5, 'FUZE TEA', 6.00, 1, 'szt', 'A', 0),
(35, 5, 'PIWO 0,5L', 8.00, 1, 'szt', 'A', 0),
(36, 5, 'SOK DO PIWA *', 1.00, 1, 'szt', 'B', 0),
(37, 5, 'DORSZ FIL. SMAZ. ZST', 27.00, 1, 'szt', 'B', 0),
(38, 5, 'FLADRA TUSZ. SMAZ. ZESTAW', 25.00, 1, 'szt', 'B', 0),
(39, 5, 'SANDACZ FILET SMAZ. ZESTAW', 31.00, 1, 'szt', 'B', 0),
(41, 7, 'WODA', 5.00, 1, 'szt', 'A', 0),
(42, 7, 'FUZETE', 6.00, 1, 'szt', 'A', 0),
(43, 7, 'PIWO 0,5L', 8.00, 1, 'szt', 'A', 0),
(44, 7, 'SOK DO PIWA', 1.00, 1, 'szt', 'B', 0),
(45, 7, 'DORSZ FIL. SMAZ. ZST', 27.00, 1, 'szt', 'B', 0),
(46, 7, 'FLADRA TUSZ. SMAZ. ZESTAW', 25.00, 1, 'szt', 'B', 0),
(47, 7, 'SANDACZ FILET SMAZ. ZESTAW', 31.00, 1, 'szt', 'B', 0),
(48, 8, 'WODA', 5.00, 1, 'szt', 'A', 0),
(49, 8, 'FUZETE', 6.00, 1, 'szt', 'A', 0),
(50, 8, 'PIWO 0,5L', 8.00, 1, 'szt', 'A', 0),
(51, 8, 'SOK DO PIWA', 1.00, 1, 'szt', 'B', 0),
(52, 8, 'DORSZ FIL. SMAZ. ZST', 27.00, 1, 'szt', 'B', 0),
(53, 8, 'FLADRA TUSZ. SMAZ. ZESTAW', 25.00, 1, 'szt', 'B', 0),
(54, 8, 'SANDACZ FILET SMAZ. ZESTAW', 31.00, 1, 'szt', 'B', 0),
(55, 9, 'SMAŁEC/MIĘSO/CZOSN', 4.90, 1, 'szt', 'D', 0),
(56, 9, 'MLEKO ŁACIATE BUT.', 3.40, 1, 'szt', 'D', 0),
(57, 9, 'BUŁKA MĄTOWA 100G', 5.00, 4, 'szt', 'D', 0),
(58, 9, 'WŁOSZCZYZNA', 5.50, 1, 'szt', 'D', 0),
(59, 9, 'GOŹDZIKI 10G', 3.20, 1, 'szt', 'B', 0),
(60, 9, 'ŚMIETANA 18 200ML', 2.30, 1, 'szt', 'D', 0),
(61, 9, 'MASŁO EKSTRA 200/G', 6.50, 1, 'szt', 'D', 0),
(62, 9, 'MASŁO EKSTRA 200/G', 6.50, 1, 'szt', 'D', 0),
(63, 9, 'CHLEB BALTONGHS/K', 3.70, 1, 'szt', 'D', 0),
(64, 9, 'CZOSNEK SZT MEŁODY', 5.40, 2, 'szt', 'D', 0),
(65, 9, 'POMIDORY MALINÓWKI', 6.43, 0, 'kg', 'D', 0),
(66, 10, 'SMAŁEC/MIĘSO/CZOSN', 4.90, 1, 'szt', 'D', 0),
(67, 10, 'MLEKO ŁACIATE BUT.', 3.40, 1, 'szt', 'D', 0),
(68, 10, 'BUŁKA MONTOWA 100G', 5.00, 4, 'szt', 'D', 0),
(69, 10, 'WŁOSZCZYZNA', 5.50, 1, 'szt', 'D', 0),
(70, 10, 'GOŹDZIKI 10G', 3.20, 1, 'szt', 'B', 0),
(71, 10, 'ŚMIETANA 18 200ML', 2.30, 1, 'szt', 'D', 0),
(72, 10, 'MASŁO EKSTRA 200/G', 6.50, 1, 'szt', 'D', 0),
(73, 10, 'MASŁO EKSTRA 200/G', 6.50, 1, 'szt', 'D', 0),
(74, 10, 'CHLEB BALTONGS/K', 3.70, 1, 'szt', 'D', 0),
(75, 10, 'CZOSNEK SZT MEŁODY', 5.40, 2, 'szt', 'D', 0),
(76, 10, 'POMIDORY MALINOWKI', 6.43, 0, 'kg', 'D', 0),
(77, 11, 'SMALEC/MIESO/CZOSN', 4.90, 1, 'szt', 'D', 0),
(78, 11, 'MLEKO ŁACIATE BUT.', 3.40, 1, 'szt', 'D', 0),
(79, 11, 'BUŁKA MONTOWA 100G', 5.00, 4, 'szt', 'D', 0),
(80, 11, 'WŁOSZCZYZNA', 5.50, 1, 'szt', 'D', 0),
(81, 11, 'GOŹDZIKI 10G', 3.20, 1, 'szt', 'B', 0),
(82, 11, 'ŚMIETANA 18 200ML', 2.30, 1, 'szt', 'D', 0),
(83, 11, 'MASŁO EKSTRA 200/G', 6.50, 1, 'szt', 'D', 0),
(84, 11, 'MASŁO EKSTRA 200/G', 6.50, 1, 'szt', 'D', 0),
(85, 11, 'CHLEB BALTONGS/K', 3.70, 1, 'szt', 'D', 0),
(86, 11, 'CZOSNEK SZT. MŁODY', 5.40, 2, 'szt', 'D', 0),
(87, 11, 'POMIDORY MALINOWKI', 6.43, 0, 'kg', 'D', 0),
(88, 12, 'SMALEC/MIESO/CZOSN', 4.90, 1, 'szt', 'D', 0),
(89, 12, 'MLEKO LACIATE BUT.', 3.40, 1, 'szt', 'D', 0),
(90, 12, 'BULKA MONTOWA 100G', 5.00, 4, 'szt', 'D', 0),
(91, 12, 'WLOSZCZYZNA', 5.50, 1, 'szt', 'D', 0),
(92, 12, 'GOZDZIKI 10G', 3.20, 1, 'szt', 'B', 0),
(93, 12, 'SMIETANA 18 200ML', 2.30, 1, 'szt', 'D', 0),
(94, 12, 'MASLO EKSTRA 200/G', 6.50, 1, 'szt', 'D', 0),
(95, 12, 'MASLO EKSTRA 200/G', 6.50, 1, 'szt', 'D', 0),
(96, 12, 'CHLEB BALTONGHS/K', 3.70, 1, 'szt', 'D', 0),
(97, 12, 'CZOSNEK SZT MEODY', 5.40, 2, 'szt', 'D', 0),
(98, 12, 'POMIDORY MALINOWKI', 6.43, 0, 'kg', 'D', 0),
(99, 13, 'SMALEC/MIESO/CZOSN', 4.90, 1, 'szt', 'D', 0),
(100, 13, 'MLEKO LACICATE BUT.', 3.40, 1, 'szt', 'D', 0),
(101, 13, 'BULEKA MONTOWA 100G', 5.00, 4, 'szt', 'D', 0),
(102, 13, 'WLOSZCZZYZNA', 5.50, 1, 'szt', 'D', 0),
(103, 13, 'GOZDZIKI 10G', 3.20, 1, 'szt', 'B', 0),
(104, 13, 'SMIETANA 18 200ML', 2.30, 1, 'szt', 'D', 0),
(105, 13, 'MASLO EKSTRA 200/G', 6.50, 1, 'szt', 'D', 0),
(106, 13, 'MASLO EKSTRA 200/G', 6.50, 1, 'szt', 'D', 0),
(107, 13, 'CHLEB BALTONGHS/K', 3.70, 1, 'szt', 'D', 0),
(108, 13, 'CZOSNEK SZT MEODY', 5.40, 2, 'szt', 'D', 0),
(109, 13, 'POMIDORY MALINOWKI', 6.43, 0, 'kg', 'D', 0),
(110, 14, 'SMALEC/MIESO/CZOSN', 4.90, 1, 'szt', 'D', 0),
(111, 14, 'MLEKO LACIATE BUT.', 3.40, 1, 'szt', 'D', 0),
(112, 14, 'BULKA MONTOWA 100G', 5.00, 4, 'szt', 'D', 0),
(113, 14, 'WLOSZCZYZNA', 5.50, 1, 'szt', 'D', 0),
(114, 14, 'GOZDZIKI 10G', 3.20, 1, 'szt', 'B', 0),
(115, 14, 'SMIETANA 18 200ML', 2.30, 1, 'szt', 'D', 0),
(116, 14, 'MASLO EKSTRA 200/G', 6.50, 1, 'szt', 'D', 0),
(117, 14, 'MASLO EKSTRA 200/G', 6.50, 1, 'szt', 'D', 0),
(118, 14, 'CHLEB BALTONGHS/K', 3.70, 1, 'szt', 'D', 0),
(119, 14, 'CZOSNEK SZT MEODY', 5.40, 2, 'szt', 'D', 0),
(120, 14, 'POMIDORY MALINOWKI', 6.43, 0, 'kg', 'D', 0),
(129, 18, 'SMALEC/MIESO/CZOSN', 4.90, 1, 'szt', 'D', 1),
(130, 18, 'MLEKO LACJATE BUT.', 3.40, 1, 'szt', 'D', 1),
(131, 18, 'BUŁKA MONTOWA 100G', 5.00, 4, 'szt', 'D', 1),
(132, 18, 'WŁOSZCZYZNA', 5.50, 1, 'szt', 'D', 7),
(133, 18, 'GOŹDZIKI 10G', 3.20, 1, 'szt', 'B', 1),
(134, 18, 'ŚMIETANA 18 200ML', 2.30, 1, 'szt', 'D', 1),
(135, 18, 'MASŁO EKSTRA 200/G', 6.50, 1, 'szt', 'D', 1),
(136, 18, 'MASŁO EKSTRA 200/G', 6.50, 1, 'szt', 'D', 1),
(137, 18, 'CHLEB BALTONGHS/K', 3.70, 1, 'szt', 'D', 1),
(138, 18, 'CZOSNEK SZT MŁODY', 5.40, 2, 'szt', 'D', 1),
(139, 18, 'POMIDORY MALINOWKI', 6.43, 0, 'kg', 'D', 1),
(140, 19, 'WODA', 5.00, 1, 'szt', 'A', 2),
(141, 19, 'FUZE TEA', 6.00, 1, 'szt', 'A', 2),
(142, 19, 'PIWO 0,5L', 8.00, 1, 'szt', 'A', 2),
(143, 19, 'SOK DO PIWA', 1.00, 1, 'szt', 'B', 2),
(144, 19, 'DORSZ FIL. SMAZ. ZST', 27.00, 1, 'szt', 'B', 1),
(145, 19, 'FLADRA TUSZ. SMAZ. ZESTAW', 25.00, 1, 'szt', 'B', 6),
(146, 19, 'SANDACZ FILET SMAZ. ZESTAW', 31.00, 1, 'szt', 'B', 1),
(147, 20, 'WODA', 5.00, 1, 'szt', 'A', 2),
(148, 20, 'FUZETEA', 6.00, 1, 'szt', 'A', 2),
(149, 20, 'PIWO 0,5L', 8.00, 1, 'szt', 'A', 2),
(150, 20, 'SOK DO PIWA', 1.00, 1, 'szt', 'B', 2),
(151, 20, 'DORSZ FIL. SMAŻ. ZST', 27.00, 1, 'szt', 'B', 1),
(152, 20, 'FLĄDRA TUSZ. SMAŻ. ZESTAW', 25.00, 1, 'szt', 'B', 6),
(153, 20, 'SANDACZ FILET SMAŻ. ZESTAW', 31.00, 1, 'szt', 'B', 1),
(154, 21, 'WODA', 5.00, 1, 'szt', 'A', 2),
(155, 21, 'FUZETEA', 6.00, 1, 'szt', 'A', 2),
(156, 21, 'PIWO 0,5L', 8.00, 1, 'szt', 'A', 2),
(157, 21, 'SOK DO PIWA', 1.00, 1, 'szt', 'B', 2),
(158, 21, 'DORSZ FIL. SMAZ. ZST', 27.00, 1, 'szt', 'B', 1),
(159, 21, 'FLADRA TUSZ. SMAZ. ZESTAW', 25.00, 1, 'szt', 'B', 3),
(160, 21, 'SANDACZ FILET SMAZ. ZESTAW', 31.00, 1, 'szt', 'B', 1),
(161, 22, 'WODA', 5.00, 1, 'szt', 'A', 2),
(162, 22, 'FUZE TEA', 6.00, 1, 'szt', 'A', 2),
(163, 22, 'PIWO 0,5L', 8.00, 1, 'szt', 'A', 2),
(164, 22, 'SOK DO PIWA', 1.00, 1, 'szt', 'B', 2),
(165, 22, 'DORSZ FIL. SMAZ. ZST', 27.00, 1, 'szt', 'B', 1),
(166, 22, 'FLADRA TUSZ. SMAZ. ZESTAW', 25.00, 1, 'szt', 'B', 6),
(167, 22, 'SANDACZ FILET SMAZ. ZESTAW', 31.00, 1, 'szt', 'B', 1),
(168, 23, 'Dorsz panier.', 64.60, 0, 'kg', 'B', 1),
(169, 23, 'Frytki', 9.00, 1, 'szt', 'B', 1),
(170, 23, 'Szpinak liściasty', 12.00, 1, 'szt', 'B', 1),
(171, 23, 'Sandacz saute', 50.40, 0, 'kg', 'B', 1),
(172, 23, 'Ziemniaki z wody', 6.00, 1, 'szt', 'B', 1),
(173, 23, 'Surówka z kiszonej kapusty', 8.00, 1, 'szt', 'B', 1),
(174, 23, 'Bałtycki Dziad Pils', 14.00, 1, 'szt', 'A', 2),
(175, 23, 'Książęce 0,5L', 9.00, 1, 'szt', 'A', 2),
(176, 23, 'Sos J-K', 3.00, 1, 'szt', 'B', 1),
(177, 23, 'Ketchup', 1.00, 1, 'szt', 'B', 1),
(178, 23, 'Sos czosnkowy', 3.00, 1, 'szt', 'B', 1),
(179, 24, 'TortillaTopSol150g', 3.93, 1, NULL, 'C', 1),
(180, 24, 'WafleKnopePea5x25g', 7.85, 1, NULL, 'C', 17),
(181, 24, 'Zel.Smiejel.145g', 4.99, 1, NULL, 'A', 1),
(182, 24, 'Sushi Sushiko 230g', 10.99, 1, NULL, 'C', 1),
(183, 25, 'SALAMI AUC 974761', 4.99, 1, NULL, 'A', 1),
(184, 25, 'POMIDOR KIS 45645', 9.99, 1, NULL, 'A', 1),
(185, 25, 'CEBULA 43444', 1.99, 1, NULL, 'C', 1),
(186, 25, 'CUKIERTKI RO 203189', 17.90, 1, NULL, 'C', 17),
(187, 26, 'SALAMI AUC 974761', 4.99, 1, NULL, 'A', 1),
(188, 26, 'POMIDOR KiS 45645', 9.99, 1, NULL, 'A', 1),
(189, 26, 'CEBULA 43444', 1.99, 1, NULL, 'C', 1),
(190, 26, 'CUKIEREK RO 203189', 17.90, 1, NULL, 'C', 17),
(191, 27, 'SZNYCEL JAK W WIĘDNIU', 132.00, 4, 'szt', 'A', 1),
(192, 27, 'KWAŚ CHLEBOWY', 19.00, 1, '0,33L', 'A', 1),
(193, 27, 'KOZEL JASNY', 26.00, 2, '0,4L', 'A', 2),
(194, 27, 'MACZANKA MACZANKA', 32.00, 1, NULL, 'A', 1),
(195, 28, 'SALAMI AUC 974761', 4.99, 1, NULL, 'A', 1),
(196, 28, 'POMIDOR KIŚ 45645', 9.99, 1, NULL, 'A', 1),
(197, 28, 'CEBULA 43444', 1.99, 1, NULL, 'C', 1),
(198, 28, 'CUKIERTKI RO 203189', 17.90, 1, NULL, 'C', 17),
(199, 29, 'WODA', 5.00, 1, 'szt', 'A', 2),
(200, 29, 'FUZE TEA', 6.00, 1, 'szt', 'A', 2),
(201, 29, 'PIWO 0,5L', 8.00, 1, 'szt', 'A', 2),
(202, 29, 'SOK DO PIWA', 1.00, 1, 'szt', 'B', 2),
(203, 29, 'DORSZ FIL. SMAZ. ZST', 27.00, 1, 'szt', 'B', 1),
(204, 29, 'FLADRA TUSZ. SMAZ. ZESTAW', 25.00, 1, 'szt', 'B', 6),
(205, 29, 'SANDACZ FILET SMAZ. ZESTAW', 31.00, 1, 'szt', 'B', 1),
(209, 31, 'SZNYCEL JAK W WIĘDNIU', 132.00, 4, 'szt', 'B', 1),
(210, 31, 'Kwas Chlebowy', 19.00, 1, '0.33L', 'A', 1),
(211, 31, 'KOZEL JASNY', 26.00, 2, '0.4L', 'A', 2),
(212, 31, 'MACZANKA MACZANKA', 32.00, 1, NULL, 'B', 1),
(213, 32, 'SALAMI AUC 974761', 4.99, 1, NULL, 'A', 1),
(214, 32, 'POMIDOR KIŚ 45645', 9.99, 1, NULL, 'A', 1),
(215, 32, 'CEBULA 43444', 1.99, 1, NULL, 'A', 1),
(216, 32, 'CUKIERKI RO 203189', 17.90, 1, NULL, 'C', 17),
(217, 33, 'WODA', 5.00, 1, 'szt', 'A', 2),
(218, 33, 'FUZE TEA', 6.00, 1, 'szt', 'A', 2),
(219, 33, 'PIWO 0,5L', 8.00, 1, 'szt', 'A', 2),
(220, 33, 'SOK DO PIWA', 1.00, 1, 'szt', 'B', 2),
(221, 33, 'DORSZ FIL. SMAZ. ZST', 27.00, 1, 'szt', 'B', 1),
(222, 33, 'FLANDRA TUSZ. SMAZ. ZESTAW', 25.00, 1, 'szt', 'B', 3),
(223, 33, 'SANDACZ FILET SMAZ. ZESTAW', 31.00, 1, 'szt', 'B', 1),
(224, 34, 'SMALEC/MIESO/CZOSN', 4.90, 1, 'szt', 'D', 1),
(225, 34, 'MLEKO LACIATE BUT.', 3.40, 1, 'szt', 'D', 1),
(226, 34, 'BULKA MONTOWA 100G', 5.00, 4, 'szt', 'D', 1),
(227, 34, 'WLOSZCZZYZNA', 5.50, 1, 'szt', 'D', 7),
(228, 34, 'GOZDZIKI 10G', 3.20, 1, 'szt', 'B', 1),
(229, 34, 'SMIETANA 18 200ML', 2.30, 1, 'szt', 'D', 1),
(230, 34, 'MASLO EKSTRA 200/G', 6.50, 1, 'szt', 'D', 1),
(231, 34, 'MASLO EKSTRA 200/G', 6.50, 1, 'szt', 'D', 1),
(232, 34, 'CHLEB BALTONGHS/K', 3.70, 1, 'szt', 'D', 1),
(233, 34, 'CZOSNEK SZT MEODY', 5.40, 2, 'szt', 'D', 1),
(234, 34, 'POMIDORY MALINOWKI', 6.43, 0, 'kg', 'D', 1),
(235, 35, 'SZNYCEL JAK W WIĘDNII', 132.00, 4, 'szt', 'A', 1),
(236, 35, 'KWAS CHLEBOWY', 19.00, 1, NULL, 'A', 1),
(237, 35, 'KOZEL JASNY', 26.00, 2, NULL, 'A', 2),
(238, 35, 'MACZANKA MACZANKA', 32.00, 1, NULL, 'A', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownicy`
--

CREATE TABLE `uzytkownicy` (
  `id` int(11) NOT NULL,
  `login` varchar(50) NOT NULL,
  `password` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `uzytkownicy`
--

INSERT INTO `uzytkownicy` (`id`, `login`, `password`) VALUES
(1, 'user1', 'pass1'),
(2, 'user2', 'pass2');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `firmy`
--
ALTER TABLE `firmy`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `nazwa_firmy` (`nazwa_firmy`);

--
-- Indeksy dla tabeli `kategorie`
--
ALTER TABLE `kategorie`
  ADD PRIMARY KEY (`id_kategorii`);

--
-- Indeksy dla tabeli `paragony`
--
ALTER TABLE `paragony`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `Paragony_fk1` (`id_uzytkownika`),
  ADD KEY `Paragony_fk2` (`id_firmy`);

--
-- Indeksy dla tabeli `produkty`
--
ALTER TABLE `produkty`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `Produkty_fk1` (`id_paragonu`);

--
-- Indeksy dla tabeli `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `login` (`login`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `firmy`
--
ALTER TABLE `firmy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kategorie`
--
ALTER TABLE `kategorie`
  MODIFY `id_kategorii` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `paragony`
--
ALTER TABLE `paragony`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `produkty`
--
ALTER TABLE `produkty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=239;

--
-- AUTO_INCREMENT for table `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `paragony`
--
ALTER TABLE `paragony`
  ADD CONSTRAINT `Paragony_fk1` FOREIGN KEY (`id_uzytkownika`) REFERENCES `uzytkownicy` (`id`),
  ADD CONSTRAINT `Paragony_fk2` FOREIGN KEY (`id_firmy`) REFERENCES `firmy` (`id`);

--
-- Constraints for table `produkty`
--
ALTER TABLE `produkty`
  ADD CONSTRAINT `Produkty_fk1` FOREIGN KEY (`id_paragonu`) REFERENCES `paragony` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
