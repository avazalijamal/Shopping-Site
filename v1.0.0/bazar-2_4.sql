-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 07, 2022 at 07:27 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bazar-2.4`
--

-- --------------------------------------------------------

--
-- Table structure for table `kateqoriyalar`
--

CREATE TABLE `kateqoriyalar` (
  `id` int(11) NOT NULL,
  `adi` varchar(30) NOT NULL,
  `stat` int(11) NOT NULL DEFAULT 1,
  `tarix_ee` date NOT NULL DEFAULT current_timestamp(),
  `tarix_deaktiv` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL DEFAULT 'no name',
  `category` varchar(30) NOT NULL,
  `price` float DEFAULT NULL,
  `count` int(11) NOT NULL DEFAULT 1,
  `info` text DEFAULT NULL,
  `img_1` varchar(256) NOT NULL,
  `img_2` varchar(256) DEFAULT NULL,
  `img_3` varchar(256) DEFAULT NULL,
  `stat` int(11) NOT NULL DEFAULT 1,
  `startTime` date NOT NULL DEFAULT current_timestamp(),
  `endTime` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sifarisler`
--

CREATE TABLE `sifarisler` (
  `id` int(11) NOT NULL,
  `product` text NOT NULL,
  `sifarisci_adi` varchar(30) NOT NULL,
  `sifarisci_kod` varchar(10) NOT NULL,
  `sifarisci_tel` varchar(15) NOT NULL,
  `sifarisci_seher` varchar(20) NOT NULL,
  `sifarisci_unvan` text NOT NULL,
  `stat` int(11) NOT NULL DEFAULT 1,
  `tarix_sifaris` date NOT NULL DEFAULT current_timestamp(),
  `tarix_bitis` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `testiq_kodu`
--

CREATE TABLE `testiq_kodu` (
  `id` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  `kod` varchar(10) NOT NULL,
  `stat` int(11) NOT NULL DEFAULT 1,
  `tarix_verilme` date NOT NULL DEFAULT current_timestamp(),
  `tarix_bitme` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(15) NOT NULL DEFAULT 'Admin',
  `mail` varchar(50) NOT NULL,
  `img` varchar(256) NOT NULL DEFAULT 'profil.png',
  `pass` varchar(256) NOT NULL,
  `stat` int(11) NOT NULL DEFAULT 1,
  `startTime` date NOT NULL DEFAULT current_timestamp(),
  `endDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kateqoriyalar`
--
ALTER TABLE `kateqoriyalar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sifarisler`
--
ALTER TABLE `sifarisler`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testiq_kodu`
--
ALTER TABLE `testiq_kodu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kateqoriyalar`
--
ALTER TABLE `kateqoriyalar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sifarisler`
--
ALTER TABLE `sifarisler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `testiq_kodu`
--
ALTER TABLE `testiq_kodu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
