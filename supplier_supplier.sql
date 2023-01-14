-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 14, 2023 at 03:23 PM
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
-- Database: `qs`
--

-- --------------------------------------------------------

--
-- Table structure for table `supplier_supplier`
--

CREATE TABLE `supplier_supplier` (
  `id` bigint(20) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(100) NOT NULL,
  `owner_id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supplier_supplier`
--

INSERT INTO `supplier_supplier` (`id`, `name`, `description`, `image`, `owner_id`, `created_at`, `user_id`) VALUES
(1, 'cimerwa ltd', 'call 39059045 for more information', 'supplier/cimerwa_NfModdT.jpeg', 2, '2023-01-01 15:47:19.398464', 3),
(2, 'Amaco Paints', 'great paint', 'supplier/amaco_paint.png', 4, '2023-01-14 15:25:56.502838', 3),
(3, 'Ameki Color', 'paints', 'supplier/ameki_color.png', 5, '2023-01-14 15:26:32.945544', 3),
(4, 'Dura Paint', 'more paint', 'supplier/dura_paint.jpeg', 6, '2023-01-14 15:27:15.064726', 3),
(5, 'Master Steel', 'strong steel', 'supplier/master_steel.png', 16, '2023-01-14 15:27:41.370212', 3),
(6, 'Roto Tank', 'tanks', 'supplier/roto_tank.jpeg', 7, '2023-01-14 15:31:26.134168', 3),
(7, 'Royal PVC', 'pipes, tanks', 'supplier/royal.jpeg', 8, '2023-01-14 15:32:11.010196', 3),
(8, 'Ruliba Clay', 'bricks', 'supplier/ruliba.png', 9, '2023-01-14 15:32:45.156279', 3),
(9, 'Rwanda Plastic', 'pipes, tanks', 'supplier/rwanda_plastic.png', 10, '2023-01-14 15:33:10.772318', 3),
(10, 'Safintra', 'amabati', 'supplier/safintra.jpeg', 11, '2023-01-14 15:34:03.184741', 3),
(11, 'Soimex Plastic', 'tanks, pipes, container', 'supplier/soimex_plastic.jpeg', 12, '2023-01-14 15:35:38.132612', 3),
(12, 'Sonatube', 'pipes', 'supplier/sonatube.jpeg', 13, '2023-01-14 16:18:49.584613', 3),
(13, 'Steel Rwa', 'amabati', 'supplier/steel_rwa.png', 14, '2023-01-14 16:19:27.816807', 3),
(14, 'Tolirwa', 'amabati meza cyane', 'supplier/tolirwa.png', 15, '2023-01-14 16:20:12.244561', 3),
(15, 'Twyford', 'amakaro', 'supplier/twyford.png', 17, '2023-01-14 16:20:37.687196', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `supplier_supplier`
--
ALTER TABLE `supplier_supplier`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_supplier_user_id_96e4ec8c_fk_auth_user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `supplier_supplier`
--
ALTER TABLE `supplier_supplier`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `supplier_supplier`
--
ALTER TABLE `supplier_supplier`
  ADD CONSTRAINT `supplier_supplier_user_id_96e4ec8c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
