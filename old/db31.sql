-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Vært: 127.0.0.1
-- Genereringstid: 06. 10 2017 kl. 21:48:21
-- Serverversion: 10.1.26-MariaDB
-- PHP-version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `worldtest`
--

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `city`
--

CREATE TABLE `city` (
  `id` int(11) NOT NULL,
  `name` varchar(35) NOT NULL,
  `countrycode` char(3) NOT NULL,
  `district` varchar(20) NOT NULL,
  `population` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Data dump for tabellen `city`
--

INSERT INTO `city` (`id`, `name`, `countrycode`, `district`, `population`) VALUES
(1, 'Kolding', '208', 'Sønderjylland', 60000),
(2, 'Odense', '208', 'Fyn', 100000),
(3, 'Aarhus', '208', 'Midtjylland', 250000),
(4, 'København', '208', 'Sjælland', 1000000);

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `country`
--

CREATE TABLE `country` (
  `code` char(3) NOT NULL,
  `name` varchar(32) NOT NULL,
  `continent` enum('Asia','Australia','Antarctica','Africa','Europe','North America','South America') NOT NULL,
  `region` varchar(26) NOT NULL,
  `surfacearea` float(10,2) NOT NULL,
  `indepyear` smallint(6) NOT NULL,
  `population` int(11) NOT NULL,
  `lifeexpectancy` float(3,1) NOT NULL,
  `gnp` float(10,2) NOT NULL,
  `gnpold` float(10,2) NOT NULL,
  `localname` varchar(45) NOT NULL,
  `governmentform` char(45) NOT NULL,
  `headofstate` varchar(60) NOT NULL,
  `capital` int(11) NOT NULL,
  `code2` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Data dump for tabellen `country`
--

INSERT INTO `country` (`code`, `name`, `continent`, `region`, `surfacearea`, `indepyear`, `population`, `lifeexpectancy`, `gnp`, `gnpold`, `localname`, `governmentform`, `headofstate`, `capital`, `code2`) VALUES
('208', 'Denmark', 'Europe', 'a', 10.00, 999, 5000000, 73.0, 10.00, 10.00, 'test', 'test', 'test', 192, '22');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `countrylanguage`
--

CREATE TABLE `countrylanguage` (
  `countrycode` char(3) NOT NULL,
  `language` char(30) NOT NULL,
  `isofficial` enum('T','F') NOT NULL,
  `percentage` float(4,1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Data dump for tabellen `countrylanguage`
--

INSERT INTO `countrylanguage` (`countrycode`, `language`, `isofficial`, `percentage`) VALUES
('208', 'Danish', 'T', 93.0),
('208', 'Sønderjysk', 'T', 7.0);

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `speaks`
--

CREATE TABLE `speaks` (
  `code` char(3) NOT NULL,
  `countrycode` char(3) NOT NULL,
  `name` varchar(32) NOT NULL,
  `language` char(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Begrænsninger for dumpede tabeller
--

--
-- Indeks for tabel `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`),
  ADD KEY `countrycode` (`countrycode`);

--
-- Indeks for tabel `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`code`);

--
-- Indeks for tabel `countrylanguage`
--
ALTER TABLE `countrylanguage`
  ADD PRIMARY KEY (`countrycode`,`language`);

--
-- Indeks for tabel `speaks`
--
ALTER TABLE `speaks`
  ADD PRIMARY KEY (`code`,`countrycode`),
  ADD KEY `countrycode` (`countrycode`);

--
-- Brug ikke AUTO_INCREMENT for slettede tabeller
--

--
-- Tilføj AUTO_INCREMENT i tabel `city`
--
ALTER TABLE `city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Begrænsninger for dumpede tabeller
--

--
-- Begrænsninger for tabel `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `city_ibfk_1` FOREIGN KEY (`countrycode`) REFERENCES `country` (`code`);

--
-- Begrænsninger for tabel `speaks`
--
ALTER TABLE `speaks`
  ADD CONSTRAINT `speaks_ibfk_1` FOREIGN KEY (`code`) REFERENCES `country` (`code`) ON DELETE CASCADE,
  ADD CONSTRAINT `speaks_ibfk_2` FOREIGN KEY (`countrycode`) REFERENCES `countrylanguage` (`countrycode`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
