-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 28 fév. 2023 à 18:00
-- Version du serveur : 5.7.36
-- Version de PHP : 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `studi_bookeo`
--

-- --------------------------------------------------------

--
-- Structure de la table `author`
--

DROP TABLE IF EXISTS `author`;
CREATE TABLE IF NOT EXISTS `author` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `last_name` varchar(255) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `author`
--

INSERT INTO `author` (`id`, `last_name`, `first_name`) VALUES
(3, 'Orwell', 'George'),
(4, 'Ito', 'Junji'),
(5, 'Caro', 'Fabrice');

-- --------------------------------------------------------

--
-- Structure de la table `book`
--

DROP TABLE IF EXISTS `book`;
CREATE TABLE IF NOT EXISTS `book` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `image` varchar(255) NOT NULL,
  `type_id` int(10) UNSIGNED NOT NULL,
  `author_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  KEY `type_id` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `book`
--

INSERT INTO `book` (`id`, `title`, `description`, `image`, `type_id`, `author_id`) VALUES
(1, '1984', 'L’histoire se passe à Londres en 1984, comme l\'indique le titre du roman. Le monde, depuis les grandes guerres nucléaires des années 1950, est divisé en trois grands « blocs » : l’Océania (Amériques, îles de l\'Atlantique, comprenant notamment les îles Anglo-Celtes, Océanie et Afrique australe), l’Eurasia (reste de l\'Europe et URSS) et l’Estasia (Chine et ses contrées méridionales, îles du Japon, et une portion importante mais variable de la Mongolie, de la Mandchourie, de l\'Inde et du Tibet6) qui sont en guerre perpétuelle les uns contre les autres.', '1-1984.jpg', 1, 3),
(2, 'Histoires courtes', 'Ce volume unique rassemble les nouvelles créées par le maître Junji Ito pour l\'éditeur japonais Shogakukan, dont certaines sont inédites. La publication est accompagnée de pages en couleur dont des illustrations inédites et également un épisode spécialement créé pour l\'occasion. En bonus, la célèbre histoire autobiographique qu\'Ito a dédiée au maître Kazuo Umezu (L\'École emportée).', '2-histoires-courtes.jpg', 2, 4),
(3, 'Zaï Zaï Zaï Zaï', 'Au passage à la caisse d\'un supermarché, un auteur de bande dessinée réalise qu’il n’a pas sa carte de fidélité. Le vigile intervient à la demande de la caissière mais l’auteur le menace avec un poireau puis parvient à s’enfuir.', '3-zai-zai-zai-zai.jpg', 3, 5);

-- --------------------------------------------------------

--
-- Structure de la table `type`
--

DROP TABLE IF EXISTS `type`;
CREATE TABLE IF NOT EXISTS `type` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `type`
--

INSERT INTO `type` (`id`, `name`) VALUES
(1, 'livre'),
(2, 'manga'),
(3, 'bande dessinée');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `book_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
