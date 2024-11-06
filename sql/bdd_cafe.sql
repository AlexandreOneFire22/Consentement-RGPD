-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 06 nov. 2024 à 14:53
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bddcafe2024`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
                             `idCategorie` int(11) NOT NULL,
                             `libelle` text NOT NULL,
                             `description` text NOT NULL,
                             `desactiverCategorie` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`idCategorie`, `libelle`, `description`, `desactiverCategorie`) VALUES
                                                                                             (10, 'Infusion', '', 0),
                                                                                             (11, 'Infusion triangle', '', 0),
                                                                                             (12, 'Infusion vrac', '', 0),
                                                                                             (15, 'Thé triangle', '', 0),
                                                                                             (16, 'Thé vrac', '', 0),
                                                                                             (17, 'Capsule', '', 0),
                                                                                             (18, 'Grain', '', 0),
                                                                                             (19, 'Moulu', '', 0),
                                                                                             (20, 'Rooibos', '', 0),
                                                                                             (21, 'Accompagnements', '', 0);

-- --------------------------------------------------------

--
-- Structure de la table `categorie_utilisateur`
--

CREATE TABLE `categorie_utilisateur` (
                                         `id` int(11) NOT NULL,
                                         `libelle` text NOT NULL,
                                         `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `categorie_utilisateur`
--

INSERT INTO `categorie_utilisateur` (`id`, `libelle`, `description`) VALUES
                                                                         (1, 'administrateur', 'administrateur du logiciel'),
                                                                         (2, 'redacteurCatalogue', 'rédacteur du catalogue'),
                                                                         (3, 'entreprise cliente', 'entreprise cliente, pour administrer'),
                                                                         (4, 'salarie entreprise cliente', 'salarié pour traiter des commandes'),
                                                                         (5, 'commercial', 'commercial gérant les commandes et les entreprises');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
                            `id` int(11) NOT NULL,
                            `dateCreation` datetime DEFAULT NULL,
                            `idEntreprise` int(11) NOT NULL,
                            `etat` int(11) DEFAULT NULL COMMENT '1 : Caddie\r\n2 : Commande confirmée, en attente de virement\r\n3 : Commande payée, virement re├ºu\r\n4 : Commande en préparation\r\n5 : Commande en attente approvisionnement\r\n6 : Commande expédiée\r\n7 : Commande re├ºue par le client\r\n8 : Commande avec incident livraison\r\n9 : Commande avec réexpédition entraine une autre commande\r\n10 : Commande en attente de retour\r\n11 : Commande retournée re├ºue, en attente de remboursement\r\n12 : Commande retournée remboursée\r\n13 : Commande remboursée sans retour client'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id`, `dateCreation`, `idEntreprise`, `etat`) VALUES
                                                                          (1, '2021-09-22 21:20:18', 20, 2),
                                                                          (2, '2021-10-07 00:59:58', 20, 2),
                                                                          (3, '2021-10-07 01:03:28', 20, 2),
                                                                          (4, '2021-10-07 01:05:53', 20, 6),
                                                                          (5, '2022-04-07 15:58:35', 20, 2),
                                                                          (6, '2022-10-12 05:35:27', 20, 2),
                                                                          (7, '2022-10-12 15:11:23', 25, 6),
                                                                          (8, '2022-11-09 16:27:53', 20, 2),
                                                                          (9, '2022-11-09 17:42:01', 20, 3),
                                                                          (10, '2022-11-09 17:42:28', 20, 1),
                                                                          (11, '2023-09-20 15:49:00', 12, 2),
                                                                          (12, '2023-09-25 15:32:52', 7, 2);

-- --------------------------------------------------------

--
-- Structure de la table `commande_avoir_article`
--

CREATE TABLE `commande_avoir_article` (
                                          `idCommande` int(11) NOT NULL,
                                          `idProduit` int(11) NOT NULL,
                                          `quantite` int(11) NOT NULL,
                                          `prixHT` float NOT NULL,
                                          `tauxTVA` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `commande_avoir_article`
--

INSERT INTO `commande_avoir_article` (`idCommande`, `idProduit`, `quantite`, `prixHT`, `tauxTVA`) VALUES
                                                                                                      (6, 128, 4, 6, 0.1),
                                                                                                      (6, 129, 3, 6, 0.1),
                                                                                                      (7, 150, 2, 7, 0.1),
                                                                                                      (7, 152, 3, 7, 0.1),
                                                                                                      (7, 206, 2, 25, 0.1),
                                                                                                      (8, 150, 50, 7, 0.1),
                                                                                                      (9, 150, 2, 7, 0.1),
                                                                                                      (10, 154, 4, 7, 0.1),
                                                                                                      (10, 196, 5, 25, 0.1),
                                                                                                      (11, 216, 2, 25, 0.1),
                                                                                                      (11, 217, 2, 25, 0.1),
                                                                                                      (11, 218, 4, 25, 0.1),
                                                                                                      (11, 220, 2, 25, 0.1),
                                                                                                      (12, 128, 2, 6, 0.1),
                                                                                                      (12, 129, 3, 6, 0.1),
                                                                                                      (12, 130, 3, 6, 0.1),
                                                                                                      (12, 131, 1, 6, 0.1);

-- --------------------------------------------------------

--
-- Structure de la table `entreprise`
--

CREATE TABLE `entreprise` (
                              `idEntreprise` int(11) NOT NULL,
                              `denomination` text NOT NULL,
                              `rueAdresse` text NOT NULL,
                              `complementAdresse` text NOT NULL,
                              `codePostal` text NOT NULL,
                              `ville` text NOT NULL,
                              `pays` text NOT NULL,
                              `numCompte` text DEFAULT NULL,
                              `mailContact` text NOT NULL,
                              `siret` text DEFAULT NULL,
                              `idUtilisateur` int(11) DEFAULT NULL,
                              `desactiver` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `entreprise`
--

INSERT INTO `entreprise` (`idEntreprise`, `denomination`, `rueAdresse`, `complementAdresse`, `codePostal`, `ville`, `pays`, `numCompte`, `mailContact`, `siret`, `idUtilisateur`, `desactiver`) VALUES
                                                                                                                                                                                                    (1, 'Flipstorm', '713 Fieldstone Avenue', '', '41015 CEDEX', 'Blois', 'France', 'Flipstor_1', 'contact@flipstorm.com', '455 256 510 00013', 679, 0),
                                                                                                                                                                                                    (2, 'Skimia', '08 Hansons Hill', '', '59073 CEDEX 1', 'Roubaix', 'France', 'Skimia_2', 'contact@skimia.com', '826 537 170 00001', 689, 0),
                                                                                                                                                                                                    (3, 'Oozz', '54 Morningstar Crossing', '', '85164 CEDEX', 'Saint-Jean-de-Monts', 'France', 'Oozz_3', 'contact@oozz.com', '742 092 550 00034', 685, 0),
                                                                                                                                                                                                    (4, 'Browsecat', '974 Erie Place', '', '63019 CEDEX 2', 'Clermont-Ferrand', 'France', 'Browseca_4', 'contact@browsecat.com', '670 813 160 00033', 673, 0),
                                                                                                                                                                                                    (5, 'Realbridge', '7563 Marcy Circle', '', '76069 CEDEX', 'Le Havre', 'France', 'Realbrid_5', 'contact@realbridge.com', '587 508 140 00023', 688, 0),
                                                                                                                                                                                                    (6, 'Gabcube', '6 Anzinger Pass', '', '44815 CEDEX', 'Saint-Herblain', 'France', 'Gabcube_6', 'contact@gabcube.com', '881 364 150 00022', 680, 0),
                                                                                                                                                                                                    (7, 'Edgeblab', '32 rue de la Mairie', '', '57954 CEDEX', 'Montigny-lès-Arsures', 'France', 'Edgeblab_7', 'contact@edgeblab.com', '89481970000331', 676, 0),
                                                                                                                                                                                                    (8, 'Twimm', '92878 Coolidge Street', '', '16015 CEDEX', 'Angoulême', 'France', 'Twimm_8', 'contact@twimm.com', '890 567 220 00011', 693, 0),
                                                                                                                                                                                                    (9, 'Jetwire', '1907 Westridge Point', '', '92715 CEDEX', 'Colombes', 'France', 'Jetwire_9', 'contact@jetwire.com', '902 078 750 00012', 683, 0),
                                                                                                                                                                                                    (10, 'Topiclounge', '8 Randy Pass', '', '94174 CEDEX', 'Le Perreux-sur-Marne', 'France', 'Topiclou_10', 'contact@topiclounge.com', '335 164 270 00001', 691, 0),
                                                                                                                                                                                                    (11, 'Kazio', '26478 Glendale Way', '', '64109 CEDEX', 'Bayonne', 'France', 'Kazio_11', 'contact@kazio.com', '529 846 650 00024', 684, 0),
                                                                                                                                                                                                    (12, 'Devbug', '34 Brentwood Alley', '', '51086 CEDEX', 'Reims', 'France', 'Devbug_12', 'contact@devbug.com', '064 955 660 00002', 675, 0),
                                                                                                                                                                                                    (13, 'Oyondu', '38328 Union Alley', '', '91893 CEDEX', 'Orsay', 'France', 'Oyondu_13', 'contact@oyondu.com', '575 599 890 00002', 687, 0),
                                                                                                                                                                                                    (14, 'Bubblebox', '4 Glacier Hill Center', '', '47304 CEDEX', 'Villeneuve-sur-Lot', 'France', 'Bubblebo_14', 'contact@bubblebox.com', '705 327 830 00034', 674, 0),
                                                                                                                                                                                                    (15, 'Voonder', '069 South Road', '', '06306 CEDEX 4', 'Nice', 'France', 'Voonder_15', 'contact@voonder.com', '652 956 570 00012', 694, 0),
                                                                                                                                                                                                    (16, 'Oozz', '99977 Anderson Crossing', '', '92174 CEDEX', 'Vanves', 'France', 'Oozz_16', 'contact@oozz.com', '733 160 800 00013', 686, 0),
                                                                                                                                                                                                    (17, 'Edgeblab', '2463 Crownhardt Circle', '', '76124 CEDEX', 'Le Grand-Quevilly', 'France', 'Edgeblab_17', 'contact@edgeblab.com', '133 696 800 00001', 677, 0),
                                                                                                                                                                                                    (18, 'Brainverse', '0 Hazelcrest Parkway', '', '75220 CEDEX 16', 'Paris 16', 'France', 'Brainver_18', 'contact@brainverse.com', '603 037 210 00011', 672, 0),
                                                                                                                                                                                                    (19, 'Twimbo', '8359 Troy Court', '', '33709 CEDEX', 'Mérignac', 'France', 'Twimbo_19', 'contact@twimbo.com', '675 241 060 00002', 692, 0),
                                                                                                                                                                                                    (20, 'Zoombox', '0 Oxford Lane', '', '47211 CEDEX', 'Marmande', 'France', 'Zoombox_20', 'contact@zoombox.com', '477 672 940 00012', 695, 0),
                                                                                                                                                                                                    (21, 'Edgeify', '27 Farragut Lane', '', '88109 CEDEX', 'Saint-Dié-des-Vosges', 'France', 'Edgeify_21', 'contact@edgeify.com', '897 596 980 00002', 678, 0),
                                                                                                                                                                                                    (22, 'Jazzy', '30647 Vidon Plaza', '', '92855 CEDEX', 'Rueil-Malmaison', 'France', 'Jazzy_22', 'contact@jazzy.com', '130 796 000 00011', 681, 0),
                                                                                                                                                                                                    (23, 'Jazzy', '22 Iowa Road', '', '88504 CEDEX', 'Mirecourt', 'France', 'Jazzy_23', 'contact@jazzy.com', '287 966 040 00001', 682, 0),
                                                                                                                                                                                                    (24, 'Tagpad', '31 Upham Trail', '', '72004 CEDEX 1', 'Le Mans', 'France', 'Tagpad_24', 'contact@tagpad.com', '821 738 200 00012', 690, 0),
                                                                                                                                                                                                    (25, 'Blogtags', '8431 South Court', '', '83164 CEDEX', 'La Valette-du-Var', 'France', 'Blogtags_25', 'contact@blogtags.com', '88481276000012', 671, 0);

-- --------------------------------------------------------

--
-- Structure de la table `etat_commande`
--

CREATE TABLE `etat_commande` (
                                 `idEtatCommande` int(11) NOT NULL,
                                 `libelle` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `etat_commande`
--

INSERT INTO `etat_commande` (`idEtatCommande`, `libelle`) VALUES
                                                              (1, 'Caddie'),
                                                              (2, 'Commande confirmée, en attente de virement'),
                                                              (3, 'Commande payée, virement reçu'),
                                                              (4, 'Commande en préparation'),
                                                              (5, 'Commande en attente approvisionnement'),
                                                              (6, 'Commande expédiée'),
                                                              (7, 'Commande réceptionnée (client)'),
                                                              (8, 'Commande avec incident livraison'),
                                                              (9, 'Commande avec réexpédition entraine une autre commande'),
                                                              (10, 'Commande en attente de retour'),
                                                              (11, 'Commande retournée, en attente de remboursement'),
                                                              (12, 'Commande retournée remboursée'),
                                                              (13, 'Commande remboursée sans retour client');

-- --------------------------------------------------------

--
-- Structure de la table `historique_etat_commande`
--

CREATE TABLE `historique_etat_commande` (
                                            `idHistorique` int(11) NOT NULL,
                                            `idCommande` int(11) NOT NULL,
                                            `etat` int(11) NOT NULL,
                                            `dateHeure` datetime NOT NULL,
                                            `infoComplementaire` text NOT NULL,
                                            `idSalarie` int(11) DEFAULT NULL,
                                            `idUtilisateur` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `historique_etat_commande`
--

INSERT INTO `historique_etat_commande` (`idHistorique`, `idCommande`, `etat`, `dateHeure`, `infoComplementaire`, `idSalarie`, `idUtilisateur`) VALUES
                                                                                                                                                   (18, 6, 2, '2022-10-12 05:37:13', 'Commande passée par userZoomBox userZoomBox', 12, -1),
                                                                                                                                                   (19, 7, 2, '2022-10-12 15:11:40', 'Commande passée par test test', 13, -1),
                                                                                                                                                   (20, 7, 3, '2022-10-12 15:12:16', '', -1, 18),
                                                                                                                                                   (21, 7, 4, '2022-10-12 15:12:28', '', -1, 18),
                                                                                                                                                   (22, 7, 6, '2022-10-12 15:12:31', '', -1, 18),
                                                                                                                                                   (23, 8, 2, '2022-11-09 17:09:46', 'Commande passée par userZoomBox userZoomBox', 12, -1),
                                                                                                                                                   (24, 9, 2, '2022-11-09 17:42:04', 'Commande passée par userZoomBox userZoomBox', 12, -1),
                                                                                                                                                   (25, 11, 2, '2023-09-20 15:49:17', 'Commande passée par nomVendeur1 prenomVendeur1', 709, -1),
                                                                                                                                                   (26, 9, 3, '2023-09-25 15:29:51', '', -1, 18),
                                                                                                                                                   (27, 12, 2, '2023-09-25 15:33:08', 'Commande passée par nomVendeur2 prenomVendeur2', 713, -1);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
                           `idProduit` int(11) NOT NULL,
                           `nom` text NOT NULL,
                           `description` text NOT NULL,
                           `resume` text NOT NULL,
                           `fichierImage` text NOT NULL,
                           `prixVenteHT` decimal(10,0) NOT NULL,
                           `idCategorie` int(11) NOT NULL,
                           `idTVA` decimal(10,0) NOT NULL,
                           `desactiverProduit` tinyint(1) NOT NULL,
                           `reference` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`idProduit`, `nom`, `description`, `resume`, `fichierImage`, `prixVenteHT`, `idCategorie`, `idTVA`, `desactiverProduit`, `reference`) VALUES
                                                                                                                                                                 (128, 'Symphonie', 'Raisin de Corynthe, Cynorrhodon, Hibiscus, Orange, Ananas, Papaye, arômes ', 'Raisin de Corynthe, Cynorrhodon, Hibiscus, Orange, Ananas, Papaye, arômes ', 'vign_infu_symphonie_800px.jpg ', 6, 11, 3, 0, NULL),
                                                                                                                                                                 (129, 'Cerise sauvage ', 'Pomme, Cynorrhodon, Hibiscus, Cerise sauvage (3%), arômes ', 'Pomme, Cynorrhodon, Hibiscus, Cerise sauvage (3%), arômes ', 'vign_infu_cerise_sauvage_800px.jpg ', 6, 11, 3, 0, NULL),
                                                                                                                                                                 (130, 'Digestive ', 'Menthe Poivrée BIO plante, Mélisse BIO plante, Angélique BIO fruit, Anis Vert BIO fruit, Fenouil BIO fruit ', 'Menthe Poivrée BIO plante, Mélisse BIO plante, Angélique BIO fruit, Anis Vert BIO fruit, Fenouil BIO fruit ', 'vign_infu_digestive_800px.jpg ', 6, 11, 3, 0, NULL),
                                                                                                                                                                 (131, 'Infusion Au clair de la Lune ', 'Oranger Doux feuille, Passiflore des Indes, Mélisse, Verveine Odorante, Aspérule Odorante ', 'Oranger Doux feuille, Passiflore des Indes, Mélisse, Verveine Odorante, Aspérule Odorante ', 'vign_infu_au_clair_lune_800px.jpg ', 6, 11, 3, 0, NULL),
                                                                                                                                                                 (132, 'Infusion Camomille bio ', 'Camomille Bio ', 'Camomille Bio ', 'vign_infu_camomille_800px.jpg ', 6, 11, 3, 0, NULL),
                                                                                                                                                                 (133, 'Infusion Tilleul ', 'Tilleul ', 'Tilleul ', 'vign_infu_tilleul_800px.jpg ', 6, 11, 3, 0, NULL),
                                                                                                                                                                 (134, 'Infusion Verveine Bio ', 'Verveine Bio ', 'Verveine Bio ', 'vign_infu_verveine_800px.jpg ', 6, 11, 3, 0, NULL),
                                                                                                                                                                 (135, 'La délicieuse ', 'Verveine, Menthe Poivrée, Mélisse, Réglisse ', 'Verveine, Menthe Poivrée, Mélisse, Réglisse ', 'vign_infu_la_delicieuse_800px.jpg ', 6, 11, 3, 0, NULL),
                                                                                                                                                                 (147, 'Tisane de Noël ', 'Cannelle, Orange Douce, Badiane, Hibiscus, Orange Amère, Cardamome  ', 'Cannelle, Orange Douce, Badiane, Hibiscus, Orange Amère, Cardamome  ', 'vign_infu_tisane_de_noel_800px.jpg ', 6, 11, 3, 0, NULL),
                                                                                                                                                                 (148, 'Transit ', 'Anis Vert, Menthe Douce, Citronnelle ', 'Anis Vert, Menthe Douce, Citronnelle ', 'vign_infu_transit_800px.jpg ', 6, 11, 3, 0, NULL),
                                                                                                                                                                 (149, 'Zen ', 'Oranger Doux pétale, Passiflore des Indes, Camomille Matricaire, Mélisse, Coquelicot ', 'Oranger Doux pétale, Passiflore des Indes, Camomille Matricaire, Mélisse, Coquelicot ', ' ', 6, 11, 3, 0, NULL),
                                                                                                                                                                 (150, 'Infusion Camomille Bio 50g ', ' ', ' ', 'vign_infu_camomille_800px.jpg ', 7, 12, 3, 0, NULL),
                                                                                                                                                                 (151, 'Infusion Cassis ', ' ', ' ', 'vign_infu_cassis_800px.jpg ', 7, 12, 3, 0, NULL),
                                                                                                                                                                 (152, 'Infusion Mangue ', ' ', ' ', 'vign_infu_mangue_800px.jpg ', 7, 12, 3, 0, NULL),
                                                                                                                                                                 (153, 'Infusion Menthe Poivrée Bio 50g ', ' ', ' ', 'vign_infu_menthe_800px.jpg ', 7, 12, 3, 0, NULL),
                                                                                                                                                                 (154, 'Thé noir caramel beurre salé ', ' ', ' ', 'vign_the_noir_caram_beur_sal_800px.jpg ', 7, 16, 3, 0, NULL),
                                                                                                                                                                 (155, 'Darjeeling First Flush. Leaf Blend  ', ' ', ' ', 'vign_darjeeling_first_flush_800px.jpg ', 8, 16, 3, 0, NULL),
                                                                                                                                                                 (156, 'English Breakfast ', ' ', ' ', 'vign_english_breakfast_800px.jpg ', 7, 16, 3, 0, NULL),
                                                                                                                                                                 (165, 'Roiboos bergamote ', ' ', ' ', 'vign_infu_rooibos_bergamote_800px.jpg ', 8, 20, 3, 0, NULL),
                                                                                                                                                                 (166, 'Rooibos Aloe verra melon ', ' ', ' ', 'vign_infu_rooibos_aloe_vera_melon_800px.jpg ', 8, 20, 3, 0, NULL),
                                                                                                                                                                 (167, 'Rooibos Cranberry vanille ', ' ', ' ', 'vign_infu_rooibos_cranberry_vanille_800px.jpg ', 8, 20, 3, 0, NULL),
                                                                                                                                                                 (168, 'Rooibos Rhubarbe framboise ', ' ', ' ', 'vign_infu_rooibos_rhubarbe_framb_800px.jpg ', 8, 20, 3, 0, NULL),
                                                                                                                                                                 (169, 'Thé blanc chine (50g) ', ' ', ' ', 'vign_the_blanc_chine_800px.jpg ', 6, 16, 3, 0, NULL),
                                                                                                                                                                 (170, 'Thé noir Ceylan ', ' ', ' ', 'vign_the_noir_ceylan_800px.jpg ', 11, 16, 3, 0, NULL),
                                                                                                                                                                 (171, 'Thé noir Chine ', ' ', ' ', 'vign_the_noir_chine_800px.jpg ', 7, 16, 3, 0, NULL),
                                                                                                                                                                 (172, 'Thé noir fruits rouges ', ' ', ' ', 'vign_the_noir_fruits_rouges_800px.jpg ', 7, 16, 3, 0, NULL),
                                                                                                                                                                 (173, 'Thé noir Inde ', ' ', ' ', 'vign_the_noir_inde_800px.jpg ', 7, 16, 3, 0, NULL),
                                                                                                                                                                 (174, 'Thé noir Mangue ', ' ', ' ', 'vign_the_noir_mangue_800px.jpg ', 7, 16, 3, 0, NULL),
                                                                                                                                                                 (175, 'Thé noir orange ', ' ', ' ', 'vign_the_noir_orange_800px.jpg ', 7, 16, 3, 0, NULL),
                                                                                                                                                                 (176, 'Thé noir péche ', ' ', ' ', 'vign_the_noir_peche_800px.jpg ', 7, 16, 3, 0, NULL),
                                                                                                                                                                 (177, 'Thé vert citron jasmin ', ' ', ' ', 'vign_the_vert_jasmin_800px.jpg ', 7, 16, 3, 0, NULL),
                                                                                                                                                                 (178, 'Thé vert fraise leetchi ', ' ', ' ', 'vign_the_vert_fraise_litchi_800px.jpg ', 7, 16, 3, 0, NULL),
                                                                                                                                                                 (179, 'Thé vert Inde ', ' ', ' ', 'vign_the_vert_inde_800px.jpg ', 9, 16, 3, 0, NULL),
                                                                                                                                                                 (180, 'Thé vert Japon (50g) ', ' ', ' ', 'vign_the_vert_japon_800px.jpg ', 6, 16, 3, 0, NULL),
                                                                                                                                                                 (181, 'Thé vert jasmin ', ' ', ' ', 'vign_the_vert_jasmin_800px.jpg ', 7, 16, 3, 0, NULL),
                                                                                                                                                                 (182, 'Thé vert mangue ananas ', ' ', ' ', 'vign_the_vert_mangue_ananas_800px.jpg ', 7, 16, 3, 0, NULL),
                                                                                                                                                                 (183, 'Thé vert poire ', ' ', ' ', 'vign_the_vert_poire_800px.jpg ', 7, 16, 3, 0, NULL),
                                                                                                                                                                 (184, 'Thé vert Vanille jasmin ', ' ', ' ', 'vign_the_vert_vanille_jasmin_800px.jpg ', 7, 16, 3, 0, NULL),
                                                                                                                                                                 (185, 'Thé vert vietnam ', ' ', ' ', 'vign_the_vert_vietnam_800px.jpg ', 7, 16, 3, 0, NULL),
                                                                                                                                                                 (196, 'Colombie ', 'Issu d\'un microlot de Colombie, ce café vous ravira par ses notes subtiles et suaves ', 'Issu d\'un microlot de Colombie, ce café vous ravira par ses notes subtiles et suaves<br>Arômes : Amandes, Chocolat, Fruits secs, Citron<br>Altitude : 1800m<br>Localisation : Huila<br>Variétés : Castillo, Typica <br>Process : Lavé ', 'capsule_colombie_800.jpg ', 25, 17, 3, 0, NULL),
                                                                                                                                                                 (197, 'Brésil ', 'Premier pays producteur de café, ce cru du Brésil de chez Daterra vous surprendra par ses notes sucrées et fruitées. ', 'Premier pays producteur de café, ce cru du Brésil de chez Daterra vous surprendra par ses notes sucrées et fruitées.<br>Arômes : Noix de pécan, mûre, baies, chocolat<br>Altitude : 1300-1800m<br>Localisation : Cerrado Miineiro<br>Variétés : Caturra/Moka<br>Process : Natural ', 'capsule_bresil_800.jpg ', 25, 17, 3, 0, NULL),
                                                                                                                                                                 (198, 'Ethiopie Yrgacheffe ', 'Issu de la célèbre région d\'Ethiopie Yrgacheffe, ce café est récolté  à pleine maturité, puis laissé fermenter sous eau de 24  à 36 heures afin de développer ses arômes d\'une rare délicatesse ', 'Issu de la célèbre région d\'Ethiopie Yrgacheffe, ce café est récolté  à pleine maturité, puis laissé fermenter sous eau de 24  à 36 heures afin de développer ses arômes d\'une rare délicatesse<br>Arômes : Floral, agrumes, bergamote<br>Altitude : 1750-2000m<br>Localisation : Chelbessa Woreda, Gedeb District<br>Variétés : Variétés sauvages locales<br>Process : Lavé ', 'capsule_ethiopie_800.jpg ', 25, 17, 3, 0, NULL),
                                                                                                                                                                 (201, 'Mexique Décaféiné ', 'Un décaféiné mexicain issu d\'un process naturel  à l\'eau et crédité du label biologiqueLabel : Bio ', 'Un décaféiné mexicain issu d\'un process naturel  à l\'eau et crédité du label biologiqueLabel : Bio<br>Arômes : Cannelle, caramel clair, épices, vanille <br>Altitude : 1100-1700m<br>Localisation : Altos de chiapas <br>Variétés : Bourbon, Mundo Novo, Pacas, Typica <br>Process : Swisswater ', 'capsule_mexique_800.jpg ', 25, 17, 3, 0, NULL),
                                                                                                                                                                 (202, 'Pérou El Palto ', 'L\'association JUMARP qui gère cette coopérative a pour objectifs d\'aider fiancièrement les producteurs et d\'améliorer leurs conditions de travail mais aussi en finan├ºant  la construction d\'école Label : Bio ', 'L\'association JUMARP qui gère cette coopérative a pour objectifs d\'aider fiancièrement les producteurs et d\'améliorer leurs conditions de travail mais aussi en finan├ºant  la construction d\'école Label : Bio<br>Arômes : Chocolat au lait, orange, acidité délicate<br>Altitude : 1300-1800m<br>Localisation : Yamon district / Département Amazonie<br>Variétés : Caturra/Typica/Catimor<br>Process : Lavé ', 'capsule_perou_800.jpg ', 25, 17, 3, 0, NULL),
                                                                                                                                                                 (203, 'Blend de la Brûlerie ', 'Un café rond et subtil 100% arabica avec ses notes de chocolat et de fruits secs ', 'Un café rond et subtil 100% arabica avec ses notes de chocolat et de fruits secs<br>Variétés : Arabica ', 'capsule_blend_brulerie_800.jpg ', 25, 17, 3, 0, NULL),
                                                                                                                                                                 (204, 'Mélange italien ', 'Un café corsé comme dans la tradition italienne avec ses notes de cacao et animal ', 'Un café corsé comme dans la tradition italienne avec ses notes de cacao et animal<br>Variétés : Arabica et Robusta ', 'capsule_melange_italien_800.jpg ', 25, 17, 3, 0, NULL),
                                                                                                                                                                 (206, 'Colombie ', 'Issu d\'un microlot de Colombie, ce café vous ravira par ses notes subtiles et suaves ', 'Issu d\'un microlot de Colombie, ce café vous ravira par ses notes subtiles et suaves<br>Arômes : Amandes, Chocolat, Fruits secs, Citron<br>Altitude : 1800m<br>Localisation : Huila<br>Variétés : Castillo, Typica <br>Process : Lavé ', 'colombie_800_cafe_grain.jpg ', 25, 18, 3, 0, NULL),
                                                                                                                                                                 (207, 'Brésil ', 'Premier pays producteur de café, ce cru du Brésil de chez Daterra vous surprendra par ses notes sucrées et fruitées. ', 'Premier pays producteur de café, ce cru du Brésil de chez Daterra vous surprendra par ses notes sucrées et fruitées.<br>Arômes : Noix de pécan, mûre, baies, chocolat<br>Altitude : 1300-1800m<br>Localisation : Cerrado Miineiro<br>Variétés : Caturra/Moka<br>Process : Natural ', 'bresil_800_cafe_grain.jpg ', 25, 18, 3, 0, NULL),
                                                                                                                                                                 (208, 'Ethiopie Yrgacheffe ', 'Issu de la célèbre région d\'Ethiopie Yrgacheffe, ce café est récolté  à pleine maturité, puis laissé fermenter sous eau de 24  à 36 heures afin de développer ses arômes d\'une rare délicatesse ', 'Issu de la célèbre région d\'Ethiopie Yrgacheffe, ce café est récolté  à pleine maturité, puis laissé fermenter sous eau de 24  à 36 heures afin de développer ses arômes d\'une rare délicatesse<br>Arômes : Floral, agrumes, bergamote<br>Altitude : 1750-2000m<br>Localisation : Chelbessa Woreda, Gedeb District<br>Variétés : Variétés sauvages locales<br>Process : Lavé ', 'ethiopie_800_cafe_grain.jpg ', 25, 18, 3, 0, NULL),
                                                                                                                                                                 (210, 'Guji Ethiopie naturel ', 'Berceau du café, ce cru produit dans la région de Guji est séché naturellement au soleil pour transférer les sucres présent dans la chair du fruit au grain de café ', 'Berceau du café, ce cru produit dans la région de Guji est séché naturellement au soleil pour transférer les sucres présent dans la chair du fruit au grain de café<br>Arômes : Chocolat noir, cerise, fraise<br>Altitude : 1900-2000m<br>Localisation : Guji<br>Variétés : Heirloom<br>Process : Naturel ', 'ethiopie_800_cafe_grain.jpg ', 25, 18, 3, 0, NULL),
                                                                                                                                                                 (211, 'Mexique Décaféiné ', 'Un décaféiné mexicain issu d\'un process naturel  à l\'eau et crédité du label biologiqueLabel : Bio ', 'Un décaféiné mexicain issu d\'un process naturel  à l\'eau et crédité du label biologiqueLabel : Bio<br>Arômes : Cannelle, caramel clair, épices, vanille <br>Altitude : 1100-1700m<br>Localisation : Altos de chiapas <br>Variétés : Bourbon, Mundo Novo, Pacas, Typica <br>Process : Swisswater ', 'mexique_800_cafe_grain.jpg ', 25, 18, 3, 0, NULL),
                                                                                                                                                                 (212, 'Pérou El Palto ', 'L\'association JUMARP qui gère cette coopérative a pour objectifs d\'aider fiancièrement les producteurs et d\'améliorer leurs conditions de travail mais aussi en finan├ºant  la construction d\'école Label : Bio ', 'L\'association JUMARP qui gère cette coopérative a pour objectifs d\'aider fiancièrement les producteurs et d\'améliorer leurs conditions de travail mais aussi en finan├ºant  la construction d\'école Label : Bio<br>Arômes : Chocolat au lait, orange, acidité délicate<br>Altitude : 1300-1800m<br>Localisation : Yamon district / Département Amazonie<br>Variétés : Caturra/Typica/Catimor<br>Process : Lavé ', 'perou_800_cafe_grain.jpg ', 25, 18, 3, 0, NULL),
                                                                                                                                                                 (213, 'Blend de la Brûlerie ', 'Un café rond et subtil 100% arabica avec ses notes de chocolat et de fruits secs ', 'Un café rond et subtil 100% arabica avec ses notes de chocolat et de fruits secs<br>Variétés : Arabica ', 'blend_brulerie_800_cafe_grain.jpg ', 25, 18, 3, 0, NULL),
                                                                                                                                                                 (214, 'Mélange italien ', 'Un café corsé comme dans la tradition italienne avec ses notes de cacao et animal ', 'Un café corsé comme dans la tradition italienne avec ses notes de cacao et animal<br>Variétés : Arabica et Robusta ', 'melange_italien_800_cafe_grain.jpg ', 25, 18, 3, 0, NULL),
                                                                                                                                                                 (216, 'Colombie ', 'Issu d\'un microlot de Colombie, ce café vous ravira par ses notes subtiles et suaves ', 'Issu d\'un microlot de Colombie, ce café vous ravira par ses notes subtiles et suaves<br>Arômes : Amandes, Chocolat, Fruits secs, Citron<br>Altitude : 1800m<br>Localisation : Huila<br>Variétés : Castillo, Typica <br>Process : Lavé ', 'colombie_800_cafe_grain.jpg ', 25, 19, 3, 0, NULL),
                                                                                                                                                                 (217, 'Brésil ', 'Premier pays producteur de café, ce cru du Brésil de chez Daterra vous surprendra par ses notes sucrées et fruitées. ', 'Premier pays producteur de café, ce cru du Brésil de chez Daterra vous surprendra par ses notes sucrées et fruitées.<br>Arômes : Noix de pécan, mûre, baies, chocolat<br>Altitude : 1300-1800m<br>Localisation : Cerrado Miineiro<br>Variétés : Caturra/Moka<br>Process : Natural ', 'bresil_800_cafe_grain.jpg ', 25, 19, 3, 0, NULL),
                                                                                                                                                                 (218, 'Ethiopie Yrgacheffe ', 'Issu de la célèbre région d\'Ethiopie Yrgacheffe, ce café est récolté  à pleine maturité, puis laissé fermenter sous eau de 24  à 36 heures afin de développer ses arômes d\'une rare délicatesse ', 'Issu de la célèbre région d\'Ethiopie Yrgacheffe, ce café est récolté  à pleine maturité, puis laissé fermenter sous eau de 24  à 36 heures afin de développer ses arômes d\'une rare délicatesse<br>Arômes : Floral, agrumes, bergamote<br>Altitude : 1750-2000m<br>Localisation : Chelbessa Woreda, Gedeb District<br>Variétés : Variétés sauvages locales<br>Process : Lavé ', 'ethiopie_800_cafe_grain.jpg ', 25, 19, 3, 0, NULL),
                                                                                                                                                                 (220, 'Guji Ethiopie naturel ', 'Berceau du café, ce cru produit dans la région de Guji est séché naturellement au soleil pour transférer les sucres présent dans la chair du fruit au grain de café ', 'Berceau du café, ce cru produit dans la région de Guji est séché naturellement au soleil pour transférer les sucres présent dans la chair du fruit au grain de café<br>Arômes : Chocolat noir, cerise, fraise<br>Altitude : 1900-2000m<br>Localisation : Guji<br>Variétés : Heirloom<br>Process : Naturel ', 'ethiopie_800_cafe_grain.jpg ', 25, 19, 3, 0, NULL),
                                                                                                                                                                 (221, 'Mexique Décaféiné ', 'Un décaféiné mexicain issu d\'un process naturel  à l\'eau et crédité du label biologiqueLabel : Bio ', 'Un décaféiné mexicain issu d\'un process naturel  à l\'eau et crédité du label biologiqueLabel : Bio<br>Arômes : Cannelle, caramel clair, épices, vanille <br>Altitude : 1100-1700m<br>Localisation : Altos de chiapas <br>Variétés : Bourbon, Mundo Novo, Pacas, Typica <br>Process : Swisswater ', 'mexique_800_cafe_grain.jpg ', 25, 19, 3, 0, NULL),
                                                                                                                                                                 (222, 'Pérou El Palto ', 'L\'association JUMARP qui gère cette coopérative a pour objectifs d\'aider fiancièrement les producteurs et d\'améliorer leurs conditions de travail mais aussi en finan├ºant  la construction d\'école Label : Bio ', 'L\'association JUMARP qui gère cette coopérative a pour objectifs d\'aider fiancièrement les producteurs et d\'améliorer leurs conditions de travail mais aussi en finan├ºant  la construction d\'école Label : Bio<br>Arômes : Chocolat au lait, orange, acidité délicate<br>Altitude : 1300-1800m<br>Localisation : Yamon district / Département Amazonie<br>Variétés : Caturra/Typica/Catimor<br>Process : Lavé ', 'perou_800_cafe_grain.jpg ', 25, 19, 3, 0, NULL),
                                                                                                                                                                 (223, 'Blend de la Brûlerie ', 'Un café rond et subtil 100% arabica avec ses notes de chocolat et de fruits secs ', 'Un café rond et subtil 100% arabica avec ses notes de chocolat et de fruits secs<br>Variétés : Arabica ', 'blend_brulerie_800_cafe_grain.jpg ', 25, 19, 3, 0, NULL),
                                                                                                                                                                 (224, 'Mélange italien ', 'Un café corsé comme dans la tradition italienne avec ses notes de cacao et animal ', 'Un café corsé comme dans la tradition italienne avec ses notes de cacao et animal<br>Variétés : Arabica et Robusta ', 'melange_italien_800_cafe_grain.jpg ', 25, 19, 3, 0, NULL),
                                                                                                                                                                 (225, 'Infusion Noix de coco aloé vera ', ' ', ' ', 'vign_infu_noix_coco_aloe_vera_800px.jpg ', 7, 12, 3, 0, NULL),
                                                                                                                                                                 (226, 'Infusion Pina Colada ', ' ', ' ', 'vign_infu_pina_colada_800px.jpg ', 7, 12, 3, 0, NULL),
                                                                                                                                                                 (227, 'Infusion Poire cannelle ', ' ', ' ', 'vign_infu_poire_canelle_800px.jpg ', 7, 12, 3, 0, NULL),
                                                                                                                                                                 (228, 'Infusion Tilleul Bio 50g ', ' ', ' ', 'vign_infu_tilleul_800px.jpg ', 7, 12, 3, 0, NULL),
                                                                                                                                                                 (229, 'Thé blanc Bai Mu Dan ', 'Thé blanc de Chine ', 'Thé blanc de Chine ', 'vign_the_blanc_bai_mu_dan_800px.jpg ', 6, 15, 3, 0, NULL),
                                                                                                                                                                 (230, 'Thé Earl Grey ', 'Thé noir romatisé  à la bergamote ', 'Thé noir romatisé  à la bergamote ', 'vign_earl_grey_800px.jpg ', 6, 15, 3, 0, NULL),
                                                                                                                                                                 (231, 'Thé noir Lendemain de fête ', 'Thé Noir, Badiane, Tilleul Aubier, Gingembre, Réglisse ', 'Thé Noir, Badiane, Tilleul Aubier, Gingembre, Réglisse ', 'vign_lendemain_de_fete_800px.jpg ', 6, 15, 3, 0, NULL),
                                                                                                                                                                 (232, 'Thé noir mélange anglais ', 'Thé noir ', 'Thé noir ', 'vign_the_noir_anglais_800px.jpg ', 6, 15, 3, 0, NULL),
                                                                                                                                                                 (233, 'Secret d\'Antan ', 'Thé noir, flocons de sucre, Pomme, Amande, arômes, pétale de Rose ', 'Thé noir, flocons de sucre, Pomme, Amande, arômes, pétale de Rose ', 'vign_secret_d_antan_800px.jpg ', 6, 15, 3, 0, NULL),
(234, 'Peps ', 'Maté, Cynorrhodon, Eleuthérocoque, Gingembre, Sarriette, Hibiscus  ', 'Maté, Cynorrhodon, Eleuthérocoque, Gingembre, Sarriette, Hibiscus  ', 'vign_infu_peps_800px.jpg ', 6, 15, 3, 0, NULL),
(235, 'Sencha douce saveur ', 'Thé vert Sencha (70%), Raisin de Corinthe, Pétale de rose, arômes,  Ananas, Papaye, Fraise, Framboise ', 'Thé vert Sencha (70%), Raisin de Corinthe, Pétale de rose, arômes,  Ananas, Papaye, Fraise, Framboise ', 'vign_sencha_douce_saveur_800px.jpg ', 6, 15, 3, 0, NULL),
(236, 'Thé vert bio ', 'Thé vert Bio ', 'Thé vert Bio ', 'vign_the_vert_bio_800px.jpg ', 6, 15, 3, 0, NULL),
(237, 'Thé vert citron ', 'Thé vert (90%), Citron écorce (10%) ', 'Thé vert (90%), Citron écorce (10%) ', 'vign_the_vert_citron_800px.jpg ', 6, 15, 3, 0, NULL),
(238, 'Detox Automne hiver ', 'Thé vert feuille, Chicorée feuille, Citron écorce, Chiendent Officinal racine ', 'Thé vert feuille, Chicorée feuille, Citron écorce, Chiendent Officinal racine ', 'vign_detox_automne_hiver_800px.jpg ', 6, 15, 3, 0, NULL),
(239, 'Thé vert menthe ', 'Thé vert (60%), Menthe Douce (40%) ', 'Thé vert (60%), Menthe Douce (40%) ', 'vign_the_vert_menthe_800px.jpg ', 6, 15, 3, 0, NULL),
(240, 'Thé vert pêche ', ' ', ' ', 'vign_the_vert_peche_800px.jpg ', 7, 16, 3, 0, NULL),
(241, 'Thé vert Mirabelle  ', ' ', ' ', 'vign_the_vert_mirabelle_800px.jpg ', 7, 16, 3, 0, NULL),
(242, 'Thé vert figue baies ', ' ', ' ', 'vign_the_vert_figues_baie_roug_800px.jpg ', 7, 16, 3, 0, NULL),
(243, 'Thé vert Gingembre pomme ', ' ', ' ', 'vign_the_vert_pomme_gingembre_800px.jpg ', 7, 16, 3, 0, NULL),
(244, 'Thé vert cerise  ', ' ', ' ', 'vign_the_vert_cerise_800px.jpg ', 7, 16, 3, 0, NULL),
(245, 'Thé Oolong Vietnam (50g) ', ' ', ' ', 'vign_the_vert_oolong_800px.jpg ', 6, 16, 3, 0, NULL),
(246, 'Honduras ', 'Ce Cru du Honduras vous fera voyager dans ce pays emblématique de la production de café ', 'Ce Cru du Honduras vous fera voyager dans ce pays emblématique de la production de café<br>Arômes : Caramel, Chocolat lait, Fleur Blanche<br>Altitude : 1650m<br>Localisation : Copan<br>Variétés : Catuai<br>Process : Lavé/Fermentation anaérobique ', 'capsule_honduras_800.jpg ', 25, 17, 3, 0, NULL),
(247, 'Honduras ', 'Ce Cru du Honduras vous fera voyager dans ce pays emblématique de la production de café ', 'Ce Cru du Honduras vous fera voyager dans ce pays emblématique de la production de café<br>Arômes : Caramel, Chocolat lait, Fleur Blanche<br>Altitude : 1650m<br>Localisation : Copan<br>Variétés : Catuai<br>Process : Lavé/Fermentation anaérobique ', 'honduras_800_cafe_grain.jpg ', 25, 18, 3, 0, NULL),
(248, 'Honduras ', 'Ce Cru du Honduras vous fera voyager dans ce pays emblématique de la production de café ', 'Ce Cru du Honduras vous fera voyager dans ce pays emblématique de la production de café<br>Arômes : Caramel, Chocolat lait, Fleur Blanche<br>Altitude : 1650m<br>Localisation : Copan<br>Variétés : Catuai<br>Process : Lavé/Fermentation anaérobique ', 'honduras_800_cafe_grain.jpg ', 25, 19, 3, 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `salarie`
--

CREATE TABLE `salarie` (
  `idSalarie` int(11) NOT NULL,
  `nom` text NOT NULL,
  `prenom` text NOT NULL,
  `mail` text NOT NULL,
  `idEntreprise` int(11) NOT NULL,
  `roleEntreprise` text NOT NULL,
  `actif` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `salarie`
--

INSERT INTO `salarie` (`idSalarie`, `nom`, `prenom`, `mail`, `idEntreprise`, `roleEntreprise`, `actif`) VALUES
(0, 'test', 'test', 'secret', 25, 'test@test.cop', b'1'),
(696, 'nomGerantTT', 'prenomGerant', 'gerant@blogtagscom', 25, 'gerant', b'1'),
(697, 'nomVendeur1', 'prenomVendeur1', 'vendeur1@blogtagscom', 25, 'vendeur', b'1'),
(698, 'nomVendeur2', 'prenomVendeur2', 'vendeur2@blogtagscom', 25, 'vendeur', b'1'),
(699, 'nomGerant', 'prenomGerant', 'gerant@brainversecom', 18, 'gerant', b'1'),
(700, 'nomVendeur1', 'prenomVendeur1', 'vendeur1@brainversecom', 18, 'vendeur', b'1'),
(701, 'nomVendeur2', 'prenomVendeur2', 'vendeur2@brainversecom', 18, 'vendeur', b'1'),
(702, 'nomGerant', 'prenomGerant', 'gerant@browsecatcom', 4, 'gerant', b'1'),
(703, 'nomVendeur1', 'prenomVendeur1', 'vendeur1@browsecatcom', 4, 'vendeur', b'1'),
(704, 'nomVendeur2', 'prenomVendeur2', 'vendeur2@browsecatcom', 4, 'vendeur', b'1'),
(705, 'nomGerant', 'prenomGerant', 'gerant@bubbleboxcom', 14, 'gerant', b'1'),
(706, 'nomVendeur1', 'prenomVendeur1', 'vendeur1@bubbleboxcom', 14, 'vendeur', b'1'),
(707, 'nomVendeur2', 'prenomVendeur2', 'vendeur2@bubbleboxcom', 14, 'vendeur', b'1'),
(708, 'nomGerant', 'prenomGerant', 'gerant@devbugcom', 12, 'gerant', b'1'),
(709, 'nomVendeur1', 'prenomVendeur1', 'vendeur1@devbugcom', 12, 'vendeur', b'1'),
(710, 'nomVendeur2', 'prenomVendeur2', 'vendeur2@devbugcom', 12, 'vendeur', b'1'),
(711, 'nomGerant', 'prenomGerant', 'gerant@edgeblabcom', 7, 'gerant', b'1'),
(712, 'nomVendeur1', 'prenomVendeur1', 'vendeur1@edgeblabcom', 7, 'vendeur', b'1'),
(713, 'nomVendeur2', 'prenomVendeur2', 'vendeur2@edgeblabcom', 7, 'vendeur', b'1'),
(714, 'nomGerant', 'prenomGerant', 'gerant@edgeblabcom', 17, 'gerant', b'1'),
(715, 'nomVendeur1', 'prenomVendeur1', 'vendeur1@edgeblabcom', 17, 'vendeur', b'1'),
(716, 'nomVendeur2', 'prenomVendeur2', 'vendeur2@edgeblabcom', 17, 'vendeur', b'1'),
(717, 'nomGerant', 'prenomGerant', 'gerant@edgeifycom', 21, 'gerant', b'1'),
(718, 'nomVendeur1', 'prenomVendeur1', 'vendeur1@edgeifycom', 21, 'vendeur', b'1'),
(719, 'nomVendeur2', 'prenomVendeur2', 'vendeur2@edgeifycom', 21, 'vendeur', b'1'),
(720, 'nomGerant', 'prenomGerant', 'gerant@flipstormcom', 1, 'gerant', b'1'),
(721, 'nomVendeur1', 'prenomVendeur1', 'vendeur1@flipstormcom', 1, 'vendeur', b'1'),
(722, 'nomVendeur2', 'prenomVendeur2', 'vendeur2@flipstormcom', 1, 'vendeur', b'1'),
(723, 'nomGerant', 'prenomGerant', 'gerant@gabcubecom', 6, 'gerant', b'1'),
(724, 'nomVendeur1', 'prenomVendeur1', 'vendeur1@gabcubecom', 6, 'vendeur', b'1'),
(725, 'nomVendeur2', 'prenomVendeur2', 'vendeur2@gabcubecom', 6, 'vendeur', b'1'),
(726, 'nomGerant', 'prenomGerant', 'gerant@jazzycom', 22, 'gerant', b'1'),
(727, 'nomVendeur1', 'prenomVendeur1', 'vendeur1@jazzycom', 22, 'vendeur', b'1'),
(728, 'nomVendeur2', 'prenomVendeur2', 'vendeur2@jazzycom', 22, 'vendeur', b'1'),
(729, 'nomGerant', 'prenomGerant', 'gerant@jazzycom', 23, 'gerant', b'1'),
(730, 'nomVendeur1', 'prenomVendeur1', 'vendeur1@jazzycom', 23, 'vendeur', b'1'),
(731, 'nomVendeur2', 'prenomVendeur2', 'vendeur2@jazzycom', 23, 'vendeur', b'1'),
(732, 'nomGerant', 'prenomGerant', 'gerant@jetwirecom', 9, 'gerant', b'1'),
(733, 'nomVendeur1', 'prenomVendeur1', 'vendeur1@jetwirecom', 9, 'vendeur', b'1'),
(734, 'nomVendeur2', 'prenomVendeur2', 'vendeur2@jetwirecom', 9, 'vendeur', b'1'),
(735, 'nomGerant', 'prenomGerant', 'gerant@kaziocom', 11, 'gerant', b'1'),
(736, 'nomVendeur1', 'prenomVendeur1', 'vendeur1@kaziocom', 11, 'vendeur', b'1'),
(737, 'nomVendeur2', 'prenomVendeur2', 'vendeur2@kaziocom', 11, 'vendeur', b'1'),
(738, 'nomGerant', 'prenomGerant', 'gerant@oozzcom', 3, 'gerant', b'1'),
(739, 'nomVendeur1', 'prenomVendeur1', 'vendeur1@oozzcom', 3, 'vendeur', b'1'),
(740, 'nomVendeur2', 'prenomVendeur2', 'vendeur2@oozzcom', 3, 'vendeur', b'1'),
(741, 'nomGerant', 'prenomGerant', 'gerant@oozzcom', 16, 'gerant', b'1'),
(742, 'nomVendeur1', 'prenomVendeur1', 'vendeur1@oozzcom', 16, 'vendeur', b'1'),
(743, 'nomVendeur2', 'prenomVendeur2', 'vendeur2@oozzcom', 16, 'vendeur', b'1'),
(744, 'nomGerant', 'prenomGerant', 'gerant@oyonducom', 13, 'gerant', b'1'),
(745, 'nomVendeur1', 'prenomVendeur1', 'vendeur1@oyonducom', 13, 'vendeur', b'1'),
(746, 'nomVendeur2', 'prenomVendeur2', 'vendeur2@oyonducom', 13, 'vendeur', b'1'),
(747, 'nomGerant', 'prenomGerant', 'gerant@realbridgecom', 5, 'gerant', b'1'),
(748, 'nomVendeur1', 'prenomVendeur1', 'vendeur1@realbridgecom', 5, 'vendeur', b'1'),
(749, 'nomVendeur2', 'prenomVendeur2', 'vendeur2@realbridgecom', 5, 'vendeur', b'1'),
(750, 'nomGerant', 'prenomGerant', 'gerant@skimiacom', 2, 'gerant', b'1'),
(751, 'nomVendeur1', 'prenomVendeur1', 'vendeur1@skimiacom', 2, 'vendeur', b'1'),
(752, 'nomVendeur2', 'prenomVendeur2', 'vendeur2@skimiacom', 2, 'vendeur', b'1'),
(753, 'nomGerant', 'prenomGerant', 'gerant@tagpadcom', 24, 'gerant', b'1'),
(754, 'nomVendeur1', 'prenomVendeur1', 'vendeur1@tagpadcom', 24, 'vendeur', b'1'),
(755, 'nomVendeur2', 'prenomVendeur2', 'vendeur2@tagpadcom', 24, 'vendeur', b'1'),
(756, 'nomGerant', 'prenomGerant', 'gerant@topicloungecom', 10, 'gerant', b'1'),
(757, 'nomVendeur1', 'prenomVendeur1', 'vendeur1@topicloungecom', 10, 'vendeur', b'1'),
(758, 'nomVendeur2', 'prenomVendeur2', 'vendeur2@topicloungecom', 10, 'vendeur', b'1'),
(759, 'nomGerant', 'prenomGerant', 'gerant@twimbocom', 19, 'gerant', b'1'),
(760, 'nomVendeur1', 'prenomVendeur1', 'vendeur1@twimbocom', 19, 'vendeur', b'1'),
(761, 'nomVendeur2', 'prenomVendeur2', 'vendeur2@twimbocom', 19, 'vendeur', b'1'),
(762, 'nomGerant', 'prenomGerant', 'gerant@twimmcom', 8, 'gerant', b'1'),
(763, 'nomVendeur1', 'prenomVendeur1', 'vendeur1@twimmcom', 8, 'vendeur', b'1'),
(764, 'nomVendeur2', 'prenomVendeur2', 'vendeur2@twimmcom', 8, 'vendeur', b'1'),
(765, 'nomGerant', 'prenomGerant', 'gerant@voondercom', 15, 'gerant', b'1'),
(766, 'nomVendeur1', 'prenomVendeur1', 'vendeur1@voondercom', 15, 'vendeur', b'1'),
(767, 'nomVendeur2', 'prenomVendeur2', 'vendeur2@voondercom', 15, 'vendeur', b'1'),
(768, 'nomGerant', 'prenomGerant', 'gerant@zoomboxcom', 20, 'gerant', b'1'),
(769, 'nomVendeur1', 'prenomVendeur1', 'vendeur1@zoomboxcom', 20, 'vendeur', b'1'),
(770, 'nomVendeur2', 'prenomVendeur2', 'vendeur2@zoomboxcom', 20, 'vendeur', b'1');

-- --------------------------------------------------------

--
-- Structure de la table `tva`
--

CREATE TABLE `tva` (
  `idTVA` int(11) NOT NULL,
  `pourcentageTVA` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `tva`
--

INSERT INTO `tva` (`idTVA`, `pourcentageTVA`) VALUES
(3, 0.1),
(4, 0.2);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `idUtilisateur` int(11) NOT NULL,
  `login` text NOT NULL,
  `motDePasse` text NOT NULL,
  `idCategorie_utilisateur` int(11) NOT NULL,
  `desactiver` tinyint(1) DEFAULT NULL,
  `aAccepteRGPD` tinyint(1) NOT NULL DEFAULT 0,
  `dateAcceptionRGPD` date NOT NULL DEFAULT '1900-01-01',
  `IP` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`idUtilisateur`, `login`, `motDePasse`, `idCategorie_utilisateur`, `desactiver`, `aAccepteRGPD`, `dateAcceptionRGPD`, `IP`) VALUES
(18, 'root', 'secret', 1, 0, 0, '1900-01-01', ''),
(671, 'contact@blogtags.com', 'secret', 3, 0, 0, '1900-01-01', ''),
(672, 'contact@brainverse.com', 'secret', 3, 0, 0, '1900-01-01', ''),
(673, 'contact@browsecat.com', 'secret', 3, 0, 0, '1900-01-01', ''),
(674, 'contact@bubblebox.com', 'secret', 3, 0, 0, '1900-01-01', ''),
(675, 'contact@devbug.com', 'secret', 3, 0, 0, '1900-01-01', ''),
(676, 'contact@edgeblab.com', 'secret', 3, 0, 0, '1900-01-01', ''),
(677, 'contact@edgeblab.com', 'secret', 3, 0, 0, '1900-01-01', ''),
(678, 'contact@edgeify.com', 'secret', 3, 0, 0, '1900-01-01', ''),
(679, 'contact@flipstorm.com', 'secret', 3, 0, 0, '1900-01-01', ''),
(680, 'contact@gabcube.com', 'secret', 3, 0, 0, '1900-01-01', ''),
(681, 'contact@jazzy.com', 'secret', 3, 0, 0, '1900-01-01', ''),
(682, 'contact@jazzy.com', 'secret', 3, 0, 0, '1900-01-01', ''),
(683, 'contact@jetwire.com', 'secret', 3, 0, 0, '1900-01-01', ''),
(684, 'contact@kazio.com', 'secret', 3, 0, 0, '1900-01-01', ''),
(685, 'contact@oozz.com', 'secret', 3, 0, 0, '1900-01-01', ''),
(686, 'contact@oozz.com', 'secret', 3, 0, 0, '1900-01-01', ''),
(687, 'contact@oyondu.com', 'secret', 3, 0, 0, '1900-01-01', ''),
(688, 'contact@realbridge.com', 'secret', 3, 0, 0, '1900-01-01', ''),
(689, 'contact@skimia.com', 'secret', 3, 0, 0, '1900-01-01', ''),
(690, 'contact@tagpad.com', 'secret', 3, 0, 0, '1900-01-01', ''),
(691, 'contact@topiclounge.com', 'secret', 3, 0, 0, '1900-01-01', ''),
(692, 'contact@twimbo.com', 'secret', 3, 0, 0, '1900-01-01', ''),
(693, 'contact@twimm.com', 'secret', 3, 0, 0, '1900-01-01', ''),
(694, 'contact@voonder.com', 'secret', 3, 0, 0, '1900-01-01', ''),
(695, 'contact@zoombox.com', 'secret', 3, 0, 0, '1900-01-01', ''),
(696, 'gerant@blogtagscom', '1234', 4, 0, 0, '1900-01-01', ''),
(697, 'vendeur1@blogtagscom', '1234', 4, 0, 0, '1900-01-01', ''),
(698, 'vendeur2@blogtagscom', '1234', 4, 0, 0, '1900-01-01', ''),
(699, 'gerant@brainversecom', '1234', 4, 0, 0, '1900-01-01', ''),
(700, 'vendeur1@brainversecom', '1234', 4, 0, 0, '1900-01-01', ''),
(701, 'vendeur2@brainversecom', '1234', 4, 0, 0, '1900-01-01', ''),
(702, 'gerant@browsecatcom', '1234', 4, 0, 0, '1900-01-01', ''),
(703, 'vendeur1@browsecatcom', '1234', 4, 0, 0, '1900-01-01', ''),
(704, 'vendeur2@browsecatcom', '1234', 4, 0, 0, '1900-01-01', ''),
(705, 'gerant@bubbleboxcom', '1234', 4, 0, 0, '1900-01-01', ''),
(706, 'vendeur1@bubbleboxcom', '1234', 4, 0, 0, '1900-01-01', ''),
(707, 'vendeur2@bubbleboxcom', '1234', 4, 0, 0, '1900-01-01', ''),
(708, 'gerant@devbugcom', '1234', 4, 0, 0, '1900-01-01', ''),
(709, 'vendeur1@devbugcom', '1234', 4, 0, 0, '1900-01-01', ''),
(710, 'vendeur2@devbugcom', '1234', 4, 0, 0, '1900-01-01', ''),
(711, 'gerant@edgeblabcom', '1234', 4, 0, 0, '1900-01-01', ''),
(712, 'vendeur1@edgeblabcom', '1234', 4, 0, 0, '1900-01-01', ''),
(713, 'vendeur2@edgeblabcom', '1234', 4, 0, 0, '1900-01-01', ''),
(714, 'gerant@edgeblabcom', '1234', 4, 0, 0, '1900-01-01', ''),
(715, 'vendeur1@edgeblabcom', '1234', 4, 0, 0, '1900-01-01', ''),
(716, 'vendeur2@edgeblabcom', '1234', 4, 0, 0, '1900-01-01', ''),
(717, 'gerant@edgeifycom', '1234', 4, 0, 0, '1900-01-01', ''),
(718, 'vendeur1@edgeifycom', '1234', 4, 0, 0, '1900-01-01', ''),
(719, 'vendeur2@edgeifycom', '1234', 4, 0, 0, '1900-01-01', ''),
(720, 'gerant@flipstormcom', '1234', 4, 0, 0, '1900-01-01', ''),
(721, 'vendeur1@flipstormcom', '1234', 4, 0, 0, '1900-01-01', ''),
(722, 'vendeur2@flipstormcom', '1234', 4, 0, 0, '1900-01-01', ''),
(723, 'gerant@gabcubecom', '1234', 4, 0, 0, '1900-01-01', ''),
(724, 'vendeur1@gabcubecom', '1234', 4, 0, 0, '1900-01-01', ''),
(725, 'vendeur2@gabcubecom', '1234', 4, 0, 0, '1900-01-01', ''),
(726, 'gerant@jazzycom', '1234', 4, 0, 0, '1900-01-01', ''),
(727, 'vendeur1@jazzycom', '1234', 4, 0, 0, '1900-01-01', ''),
(728, 'vendeur2@jazzycom', '1234', 4, 0, 0, '1900-01-01', ''),
(729, 'gerant@jazzycom', '1234', 4, 0, 0, '1900-01-01', ''),
(730, 'vendeur1@jazzycom', '1234', 4, 0, 0, '1900-01-01', ''),
(731, 'vendeur2@jazzycom', '1234', 4, 0, 0, '1900-01-01', ''),
(732, 'gerant@jetwirecom', '1234', 4, 0, 0, '1900-01-01', ''),
(733, 'vendeur1@jetwirecom', '1234', 4, 0, 0, '1900-01-01', ''),
(734, 'vendeur2@jetwirecom', '1234', 4, 0, 0, '1900-01-01', ''),
(735, 'gerant@kaziocom', '1234', 4, 0, 0, '1900-01-01', ''),
(736, 'vendeur1@kaziocom', '1234', 4, 0, 0, '1900-01-01', ''),
(737, 'vendeur2@kaziocom', '1234', 4, 0, 0, '1900-01-01', ''),
(738, 'gerant@oozzcom', '1234', 4, 0, 0, '1900-01-01', ''),
(739, 'vendeur1@oozzcom', '1234', 4, 0, 0, '1900-01-01', ''),
(740, 'vendeur2@oozzcom', '1234', 4, 0, 0, '1900-01-01', ''),
(741, 'gerant@oozzcom', '1234', 4, 0, 0, '1900-01-01', ''),
(742, 'vendeur1@oozzcom', '1234', 4, 0, 0, '1900-01-01', ''),
(743, 'vendeur2@oozzcom', '1234', 4, 0, 0, '1900-01-01', ''),
(744, 'gerant@oyonducom', '1234', 4, 0, 0, '1900-01-01', ''),
(745, 'vendeur1@oyonducom', '1234', 4, 0, 0, '1900-01-01', ''),
(746, 'vendeur2@oyonducom', '1234', 4, 0, 0, '1900-01-01', ''),
(747, 'gerant@realbridgecom', '1234', 4, 0, 0, '1900-01-01', ''),
(748, 'vendeur1@realbridgecom', '1234', 4, 0, 0, '1900-01-01', ''),
(749, 'vendeur2@realbridgecom', '1234', 4, 0, 0, '1900-01-01', ''),
(750, 'gerant@skimiacom', '1234', 4, 0, 0, '1900-01-01', ''),
(751, 'vendeur1@skimiacom', '1234', 4, 0, 0, '1900-01-01', ''),
(752, 'vendeur2@skimiacom', '1234', 4, 0, 0, '1900-01-01', ''),
(753, 'gerant@tagpadcom', '1234', 4, 0, 0, '1900-01-01', ''),
(754, 'vendeur1@tagpadcom', '1234', 4, 0, 0, '1900-01-01', ''),
(755, 'vendeur2@tagpadcom', '1234', 4, 0, 0, '1900-01-01', ''),
(756, 'gerant@topicloungecom', '1234', 4, 0, 0, '1900-01-01', ''),
(757, 'vendeur1@topicloungecom', '1234', 4, 0, 0, '1900-01-01', ''),
(758, 'vendeur2@topicloungecom', '1234', 4, 0, 0, '1900-01-01', ''),
(759, 'gerant@twimbocom', '1234', 4, 0, 0, '1900-01-01', ''),
(760, 'vendeur1@twimbocom', '1234', 4, 0, 0, '1900-01-01', ''),
(761, 'vendeur2@twimbocom', '1234', 4, 0, 0, '1900-01-01', ''),
(762, 'gerant@twimmcom', '1234', 4, 0, 0, '1900-01-01', ''),
(763, 'vendeur1@twimmcom', '1234', 4, 0, 0, '1900-01-01', ''),
(764, 'vendeur2@twimmcom', '1234', 4, 0, 0, '1900-01-01', ''),
(765, 'gerant@voondercom', '1234', 4, 0, 0, '1900-01-01', ''),
(766, 'vendeur1@voondercom', '1234', 4, 0, 0, '1900-01-01', ''),
(767, 'vendeur2@voondercom', '1234', 4, 0, 0, '1900-01-01', ''),
(768, 'gerant@zoomboxcom', '1234', 4, 0, 0, '1900-01-01', ''),
(769, 'vendeur1@zoomboxcom', '1234', 4, 0, 0, '1900-01-01', ''),
(770, 'vendeur2@zoomboxcom', '1234', 4, 0, 0, '1900-01-01', ''),
(771, 'redacteur', 'secret', 2, 0, 0, '1900-01-01', ''),
(772, 'commercial', 'secret', 5, 0, 0, '1900-01-01', '');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`idCategorie`);

--
-- Index pour la table `categorie_utilisateur`
--
ALTER TABLE `categorie_utilisateur`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `commande_avoir_article`
--
ALTER TABLE `commande_avoir_article`
  ADD PRIMARY KEY (`idCommande`,`idProduit`),
  ADD KEY `commande_avoir_article_produit_idProduit_fk` (`idProduit`);

--
-- Index pour la table `entreprise`
--
ALTER TABLE `entreprise`
  ADD PRIMARY KEY (`idEntreprise`);

--
-- Index pour la table `etat_commande`
--
ALTER TABLE `etat_commande`
  ADD PRIMARY KEY (`idEtatCommande`);

--
-- Index pour la table `historique_etat_commande`
--
ALTER TABLE `historique_etat_commande`
  ADD PRIMARY KEY (`idHistorique`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`idProduit`),
  ADD KEY `FK_produit` (`idCategorie`);

--
-- Index pour la table `salarie`
--
ALTER TABLE `salarie`
  ADD PRIMARY KEY (`idSalarie`);

--
-- Index pour la table `tva`
--
ALTER TABLE `tva`
  ADD PRIMARY KEY (`idTVA`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`idUtilisateur`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `idCategorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT pour la table `categorie_utilisateur`
--
ALTER TABLE `categorie_utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `entreprise`
--
ALTER TABLE `entreprise`
  MODIFY `idEntreprise` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT pour la table `historique_etat_commande`
--
ALTER TABLE `historique_etat_commande`
  MODIFY `idHistorique` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `idProduit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=254;

--
-- AUTO_INCREMENT pour la table `tva`
--
ALTER TABLE `tva`
  MODIFY `idTVA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `idUtilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=774;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `idUtilisateur` FOREIGN KEY (`id`) REFERENCES `entreprise` (`idEntreprise`);

--
-- Contraintes pour la table `commande_avoir_article`
--
ALTER TABLE `commande_avoir_article`
  ADD CONSTRAINT `commande_avoir_article_commande_id_fk` FOREIGN KEY (`idCommande`) REFERENCES `commande` (`id`),
  ADD CONSTRAINT `commande_avoir_article_produit_idProduit_fk` FOREIGN KEY (`idProduit`) REFERENCES `produit` (`idProduit`);

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `FK_produit` FOREIGN KEY (`idCategorie`) REFERENCES `categorie` (`idCategorie`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
