-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 06, 2025 at 07:02 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `iris_gardenapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `abonnements`
--

CREATE TABLE `abonnements` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `access_condition` text DEFAULT NULL,
  `parcelle_id` int(11) DEFAULT NULL,
  `tool_id` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT 'partage'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `abonnements`
--

INSERT INTO `abonnements` (`id`, `name`, `description`, `access_condition`, `parcelle_id`, `tool_id`, `price`, `type`) VALUES
(1, 'Kelsie Baker', 'Velit ea commodi vol', 'Adipisicing voluptat', 5, 2, 493, 'partage'),
(2, 'Steel Sheppard', 'Reprehenderit fugiat', 'Corporis atque assum', 2, 2, 431, 'location'),
(3, 'Abonnemenbt premium', 'Description premium', 'Les conditions', 4, 3, 20, 'location');

-- --------------------------------------------------------

--
-- Table structure for table `credits`
--

CREATE TABLE `credits` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `balance` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `credit_packs`
--

CREATE TABLE `credit_packs` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `credits` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `credit_packs`
--

INSERT INTO `credit_packs` (`id`, `name`, `price`, `credits`) VALUES
(1, 'Pack 1', 11, 16),
(3, 'Brian Bowen', 440, 11),
(4, 'Piper Dodson', 403, 73);

-- --------------------------------------------------------

--
-- Table structure for table `discussions`
--

CREATE TABLE `discussions` (
  `id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `discussions`
--

INSERT INTO `discussions` (`id`, `author_id`, `name`, `description`, `created_at`) VALUES
(2, 2, 'Discussion 2', 'Description de la discussion 2f', '2025-01-06 15:12:22'),
(3, 2, 'Recher partenaire', 'desc', '2025-01-06 16:06:15'),
(4, 3, 'Service commercial', 'ccc', '2025-01-06 17:56:45');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `discussion_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `author_id`, `discussion_id`, `message`, `created_at`) VALUES
(1, 2, 2, 'xxxx', '2025-01-06 15:53:43'),
(2, 2, 2, 'Salut j\'ai besoin de vous', '2025-01-06 15:57:15'),
(3, 2, 2, 'Okay parfait', '2025-01-06 16:02:58'),
(4, 2, 3, 'Je recherches de partenaires', '2025-01-06 16:06:29'),
(5, 3, 4, 'salut', '2025-01-06 17:56:52');

-- --------------------------------------------------------

--
-- Table structure for table `parcelles`
--

CREATE TABLE `parcelles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `surface` double DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `isAvailable` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `parcelles`
--

INSERT INTO `parcelles` (`id`, `name`, `surface`, `address`, `isAvailable`) VALUES
(2, 'Service commercial', 2, 'Aut id rerum quo ex ', 0),
(3, 'Test Dev Arafath', 2, 'Abomey-Calavi\\Sèmè Maison SOUROU ATTIN', NULL),
(4, 'Parcelle 2', 20, 'paris', 0),
(5, 'Parcelle 2', 20, 'paris', NULL),
(6, 'Service commercial', 754, '8', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `message` text DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tools`
--

CREATE TABLE `tools` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `credits` int(11) DEFAULT NULL,
  `isAvailable` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tools`
--

INSERT INTO `tools` (`id`, `name`, `description`, `credits`, `isAvailable`) VALUES
(2, 'pêle', 'ncnc', 2, 0),
(3, 'Seau', 'dndn', 5, 1),
(4, 'India Herring', 'Aliquip quo adipisci', 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `experience` text DEFAULT NULL,
  `role` varchar(50) DEFAULT 'admin',
  `cultures` text DEFAULT NULL,
  `credit_balance` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `experience`, `role`, `cultures`, `credit_balance`, `created_at`) VALUES
(1, 'Admin JardinLoc', 'admin@admin.com', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', ' ', 'admin', NULL, 0, '2025-01-06 17:12:19'),
(3, 'Jean Michel', 'jardinier@jardinier.com', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', '4', 'gardener', 'Tomates, Oignons', 73, '2025-01-06 17:21:35');

-- --------------------------------------------------------

--
-- Table structure for table `user_abonnements`
--

CREATE TABLE `user_abonnements` (
  `id` int(11) NOT NULL,
  `abonnement_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `months` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_abonnements`
--

INSERT INTO `user_abonnements` (`id`, `abonnement_id`, `user_id`, `months`, `status`) VALUES
(4, 2, 13, 5, NULL),
(5, 2, 13, 1, NULL),
(6, 2, 13, 2, NULL),
(7, 2, 13, 3, NULL),
(8, 2, 13, 2, NULL),
(9, 3, 3, 5, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_tools`
--

CREATE TABLE `user_tools` (
  `id` int(11) NOT NULL,
  `tool_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `months` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_tools`
--

INSERT INTO `user_tools` (`id`, `tool_id`, `user_id`, `months`, `status`) VALUES
(1, 2, 13, 2, NULL),
(2, 2, 3, 2, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abonnements`
--
ALTER TABLE `abonnements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `credits`
--
ALTER TABLE `credits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `credit_packs`
--
ALTER TABLE `credit_packs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discussions`
--
ALTER TABLE `discussions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parcelles`
--
ALTER TABLE `parcelles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tools`
--
ALTER TABLE `tools`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_abonnements`
--
ALTER TABLE `user_abonnements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_tools`
--
ALTER TABLE `user_tools`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `abonnements`
--
ALTER TABLE `abonnements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `credits`
--
ALTER TABLE `credits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `credit_packs`
--
ALTER TABLE `credit_packs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `discussions`
--
ALTER TABLE `discussions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `parcelles`
--
ALTER TABLE `parcelles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tools`
--
ALTER TABLE `tools`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_abonnements`
--
ALTER TABLE `user_abonnements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user_tools`
--
ALTER TABLE `user_tools`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
