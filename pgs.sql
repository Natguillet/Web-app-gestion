-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Mar 07 Mars 2017 à 13:22
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `pgs`
--

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

USE pgs;
CREATE TABLE `commande` (
  `id_commande` int(11) NOT NULL,
  `id_destinataire` int(11) NOT NULL,
  `date_commande` date NOT NULL,
  `data_envoi` date NOT NULL,
  `date_recep_estime` date NOT NULL,
  `statut` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `livraison`
--

CREATE TABLE `livraison` (
  `id_livraison` int(11) NOT NULL,
  `id_medic` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `data` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `lot`
--

CREATE TABLE `lot` (
  `id_lot` int(11) NOT NULL,
  `id_medic` int(11) NOT NULL,
  `date_peremption` date NOT NULL,
  `code_barre` varchar(64) NOT NULL,
  `quantite` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `lot`
--

INSERT INTO `lot` (`id_lot`, `id_medic`, `date_peremption`, `code_barre`, `quantite`) VALUES
(1, 1, '2017-01-19', '14564', 10),
(2, 2, '2017-02-08', '4567', 2),
(3, 3, '2017-02-14', '7789', 3);

-- --------------------------------------------------------

--
-- Structure de la table `medicament`
--

CREATE TABLE `medicament` (
  `id_medic` int(11) NOT NULL,
  `nomM` varchar(64) NOT NULL,
  `prix` int(11) NOT NULL,
  `dosage` int(11) NOT NULL,
  `quantite_disp_boite` int(11) NOT NULL,
  `forme` varchar(64) NOT NULL,
  `DCI_nom` varchar(64) NOT NULL,
  `unit_prescription` int(11) NOT NULL,
  `sous_ordonnance` varchar(64) NOT NULL,
  `unit_disp` int(11) NOT NULL,
  `unit_condition` int(11) NOT NULL,
  `quantite_min_1` int(11) NOT NULL,
  `quantite_min_2` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `medicament`
--

INSERT INTO `medicament` (`id_medic`, `nomM`, `prix`, `dosage`, `quantite_disp_boite`, `forme`, `DCI_nom`, `unit_prescription`, `sous_ordonnance`, `unit_disp`, `unit_condition`, `quantite_min_1`, `quantite_min_2`) VALUES
(2, 'aspirine', 8, 2, 15, 'comprime', 'asp', 1, 'non', 6, 4, 1, 5),
(1, 'Doliprane', 5, 2, 15, 'comprime', 'dol', 2, 'non', 3, 2, 0, 4),
(3, 'smecta', 15, 1, 10, 'sachet', 'sme', 4, 'oui', 4, 2, 0, 2);

-- --------------------------------------------------------

--
-- Structure de la table `medic_commande`
--

CREATE TABLE `medic_commande` (
  `id_medic` int(11) NOT NULL,
  `id_commande` int(11) NOT NULL,
  `qt_recue` int(11) NOT NULL,
  `qt_envoyee` int(11) NOT NULL,
  `qt_endommagee` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `ordonnance`
--

CREATE TABLE `ordonnance` (
  `id_ordonnance` int(11) NOT NULL,
  `id_patient` int(11) NOT NULL,
  `id_prescription` int(11) NOT NULL,
  `date_creation` date NOT NULL,
  `pathologie` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `patient`
--

CREATE TABLE `patient` (
  `id_patient` int(11) NOT NULL,
  `nom_facteur` varchar(32) NOT NULL,
  `nom` varchar(32) NOT NULL,
  `prenom` varchar(32) NOT NULL,
  `adresse` varchar(64) NOT NULL,
  `email` varchar(32) NOT NULL,
  `phone` varchar(32) NOT NULL,
  `birth_date` date NOT NULL,
  `birth_place` varchar(64) NOT NULL,
  `note` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `patient`
--

INSERT INTO `patient` (`id_patient`, `nom_facteur`, `nom`, `prenom`, `adresse`, `email`, `phone`, `birth_date`, `birth_place`, `note`) VALUES
(1, 'Roger', 'M', 'Kevin', '17 rue blbl', 'keke@gmail.fr', '0628896454', '2015-09-14', 'Kole', NULL),
(2, 'Bernard', 'Champy', 'JP', '12 avenue tro', 'Champy@hotmail.fr', '0624587541', '2014-10-13', 'Ber', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `prescription`
--

CREATE TABLE `prescription` (
  `id_prescription` int(11) NOT NULL,
  `id_medic` int(11) NOT NULL,
  `quantite_prise` int(11) NOT NULL,
  `frequence` varchar(64) NOT NULL,
  `quantite_dispense` int(11) NOT NULL,
  `duree_prescription` varchar(64) NOT NULL,
  `note` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `prevision`
--

CREATE TABLE `prevision` (
  `id_prevision` int(11) NOT NULL,
  `id_medic` int(11) NOT NULL,
  `quantite_min1` int(11) NOT NULL,
  `quantite_min2` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `stock_com`
--

CREATE TABLE `stock_com` (
  `id_stock` int(11) NOT NULL,
  `id_medic` int(11) NOT NULL,
  `id_lot` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `stock_com`
--

INSERT INTO `stock_com` (`id_stock`, `id_medic`, `id_lot`, `quantite`, `id_user`) VALUES
(1, 1, 1, 7, 1),
(2, 2, 2, 4, 1),
(3, 3, 3, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `user_com`
--

CREATE TABLE `user_com` (
  `id_user` int(11) NOT NULL,
  `nom` varchar(32) NOT NULL,
  `prenom` varchar(32) NOT NULL,
  `mdp` varchar(32) NOT NULL,
  `nom_gr_reg` varchar(32) NOT NULL,
  `admin` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `user_com`
--

INSERT INTO `user_com` (`id_user`, `nom`, `prenom`, `mdp`, `nom_gr_reg`, `admin`) VALUES
(1, 'Champy', 'JP', '1234', 'centre', 1);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id_commande`),
  ADD KEY `id_destinataire` (`id_destinataire`);

--
-- Index pour la table `livraison`
--
ALTER TABLE `livraison`
  ADD PRIMARY KEY (`id_livraison`),
  ADD KEY `id_medic` (`id_medic`),
  ADD KEY `id_user` (`id_user`);

--
-- Index pour la table `lot`
--
ALTER TABLE `lot`
  ADD PRIMARY KEY (`id_lot`),
  ADD UNIQUE KEY `id_lot` (`id_lot`),
  ADD KEY `id_medic` (`id_medic`);

--
-- Index pour la table `medicament`
--
ALTER TABLE `medicament`
  ADD PRIMARY KEY (`id_medic`),
  ADD UNIQUE KEY `id_medic` (`id_medic`);

--
-- Index pour la table `medic_commande`
--
ALTER TABLE `medic_commande`
  ADD PRIMARY KEY (`id_commande`),
  ADD KEY `id_medic` (`id_medic`);

--
-- Index pour la table `ordonnance`
--
ALTER TABLE `ordonnance`
  ADD PRIMARY KEY (`id_ordonnance`),
  ADD KEY `id_patient` (`id_patient`),
  ADD KEY `id_prescription` (`id_prescription`);

--
-- Index pour la table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`id_patient`),
  ADD UNIQUE KEY `idpatient` (`id_patient`);

--
-- Index pour la table `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`id_prescription`),
  ADD KEY `id_medic` (`id_medic`);

--
-- Index pour la table `prevision`
--
ALTER TABLE `prevision`
  ADD PRIMARY KEY (`id_prevision`),
  ADD KEY `id_medic` (`id_medic`);

--
-- Index pour la table `stock_com`
--
ALTER TABLE `stock_com`
  ADD PRIMARY KEY (`id_stock`),
  ADD KEY `id_medic` (`id_medic`),
  ADD KEY `id_lot` (`id_lot`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_com` (`id_stock`);

--
-- Index pour la table `user_com`
--
ALTER TABLE `user_com`
  ADD PRIMARY KEY (`id_user`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
