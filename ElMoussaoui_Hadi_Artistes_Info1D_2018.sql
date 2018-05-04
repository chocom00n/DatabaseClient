-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 04, 2018 at 05:08 PM
-- Server version: 5.7.21-0ubuntu0.17.10.1
-- PHP Version: 7.1.15-0ubuntu0.17.10.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Hadi_LabelsM_DB`
--

-- --------------------------------------------------------

--
-- Table structure for table `T_Artistes`
--

CREATE TABLE `T_Artistes` (
  `id_artistes` int(11) NOT NULL,
  `nom_artiste` varchar(81) DEFAULT NULL,
  `id_lieux` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `t_artiste_appartient_label`
--

CREATE TABLE `t_artiste_appartient_label` (
  `id_artiste_appartient_label` int(11) NOT NULL,
  `fk_Artiste` int(11) NOT NULL,
  `fk_Label` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `t_artiste_a_musique`
--

CREATE TABLE `t_artiste_a_musique` (
  `id_artiste_a_musique` int(11) NOT NULL,
  `fk_Artiste` int(11) NOT NULL,
  `fk_Musique` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `T_Genres`
--

CREATE TABLE `T_Genres` (
  `id_genres` int(11) NOT NULL,
  `nom_genre` varchar(81) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `t_genre_a_musique`
--

CREATE TABLE `t_genre_a_musique` (
  `id_genres` int(11) NOT NULL,
  `id_musiques` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `T_labels`
--

CREATE TABLE `T_labels` (
  `id_label` int(11) NOT NULL,
  `nom_label` varchar(81) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `T_Lieux`
--

CREATE TABLE `T_Lieux` (
  `id_lieux` int(11) NOT NULL,
  `nom_lieu` varchar(81) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `T_Musiques`
--

CREATE TABLE `T_Musiques` (
  `id_musiques` int(11) NOT NULL,
  `nom_musique` varchar(81) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `T_Artistes`
--
ALTER TABLE `T_Artistes`
  ADD PRIMARY KEY (`id_artistes`),
  ADD KEY `FK_T_Artistes_id_lieux` (`id_lieux`);

--
-- Indexes for table `t_artiste_appartient_label`
--
ALTER TABLE `t_artiste_appartient_label`
  ADD PRIMARY KEY (`id_artiste_appartient_label`),
  ADD KEY `FK_Artiste_id_Artiste` (`fk_Artiste`),
  ADD KEY `FK_Label_id_Label` (`fk_Label`);

--
-- Indexes for table `t_artiste_a_musique`
--
ALTER TABLE `t_artiste_a_musique`
  ADD PRIMARY KEY (`id_artiste_a_musique`),
  ADD KEY `FK_Musique_id_Musique` (`fk_Musique`),
  ADD KEY `fk_ArtisteM_id_Artiste` (`fk_Artiste`);

--
-- Indexes for table `T_Genres`
--
ALTER TABLE `T_Genres`
  ADD PRIMARY KEY (`id_genres`);

--
-- Indexes for table `t_genre_a_musique`
--
ALTER TABLE `t_genre_a_musique`
  ADD PRIMARY KEY (`id_genres`,`id_musiques`),
  ADD KEY `FK_genre_a_musique_id_musiques` (`id_musiques`);

--
-- Indexes for table `T_labels`
--
ALTER TABLE `T_labels`
  ADD PRIMARY KEY (`id_label`);

--
-- Indexes for table `T_Lieux`
--
ALTER TABLE `T_Lieux`
  ADD PRIMARY KEY (`id_lieux`);

--
-- Indexes for table `T_Musiques`
--
ALTER TABLE `T_Musiques`
  ADD PRIMARY KEY (`id_musiques`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `T_Artistes`
--
ALTER TABLE `T_Artistes`
  MODIFY `id_artistes` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `t_artiste_appartient_label`
--
ALTER TABLE `t_artiste_appartient_label`
  MODIFY `id_artiste_appartient_label` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `t_artiste_a_musique`
--
ALTER TABLE `t_artiste_a_musique`
  MODIFY `id_artiste_a_musique` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `T_Genres`
--
ALTER TABLE `T_Genres`
  MODIFY `id_genres` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `T_labels`
--
ALTER TABLE `T_labels`
  MODIFY `id_label` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `T_Lieux`
--
ALTER TABLE `T_Lieux`
  MODIFY `id_lieux` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `T_Musiques`
--
ALTER TABLE `T_Musiques`
  MODIFY `id_musiques` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `T_Artistes`
--
ALTER TABLE `T_Artistes`
  ADD CONSTRAINT `FK_T_Artistes_id_lieux` FOREIGN KEY (`id_lieux`) REFERENCES `T_Lieux` (`id_lieux`);

--
-- Constraints for table `t_artiste_appartient_label`
--
ALTER TABLE `t_artiste_appartient_label`
  ADD CONSTRAINT `FK_Artiste_id_Artiste` FOREIGN KEY (`fk_Artiste`) REFERENCES `T_Artistes` (`id_artistes`),
  ADD CONSTRAINT `FK_Label_id_Label` FOREIGN KEY (`fk_Label`) REFERENCES `T_labels` (`id_label`);

--
-- Constraints for table `t_artiste_a_musique`
--
ALTER TABLE `t_artiste_a_musique`
  ADD CONSTRAINT `FK_Musique_id_Musique` FOREIGN KEY (`fk_Musique`) REFERENCES `T_Musiques` (`id_musiques`),
  ADD CONSTRAINT `fk_ArtisteM_id_Artiste` FOREIGN KEY (`fk_Artiste`) REFERENCES `T_Artistes` (`id_artistes`);

--
-- Constraints for table `t_genre_a_musique`
--
ALTER TABLE `t_genre_a_musique`
  ADD CONSTRAINT `FK_genre_a_musique_id_genres` FOREIGN KEY (`id_genres`) REFERENCES `T_Genres` (`id_genres`),
  ADD CONSTRAINT `FK_genre_a_musique_id_musiques` FOREIGN KEY (`id_musiques`) REFERENCES `T_Musiques` (`id_musiques`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
