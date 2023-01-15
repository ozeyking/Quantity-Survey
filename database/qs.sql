-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 15, 2023 at 05:09 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

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
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(2, 'supervisor'),
(1, 'supplier');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_group_permissions`
--

INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
(1, 1, 37),
(2, 1, 38),
(3, 1, 39),
(4, 1, 40),
(5, 1, 41),
(6, 1, 42),
(7, 1, 43),
(8, 1, 44),
(14, 2, 25),
(15, 2, 26),
(16, 2, 27),
(17, 2, 28),
(18, 2, 29),
(19, 2, 30),
(20, 2, 31),
(9, 2, 32),
(10, 2, 33),
(11, 2, 34),
(12, 2, 35),
(13, 2, 36);

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add site', 7, 'add_site'),
(26, 'Can change site', 7, 'change_site'),
(27, 'Can delete site', 7, 'delete_site'),
(28, 'Can view site', 7, 'view_site'),
(29, 'Can add employee', 8, 'add_employee'),
(30, 'Can change employee', 8, 'change_employee'),
(31, 'Can delete employee', 8, 'delete_employee'),
(32, 'Can view employee', 8, 'view_employee'),
(33, 'Can add attendance', 9, 'add_attendance'),
(34, 'Can change attendance', 9, 'change_attendance'),
(35, 'Can delete attendance', 9, 'delete_attendance'),
(36, 'Can view attendance', 9, 'view_attendance'),
(37, 'Can add supplier', 10, 'add_supplier'),
(38, 'Can change supplier', 10, 'change_supplier'),
(39, 'Can delete supplier', 10, 'delete_supplier'),
(40, 'Can view supplier', 10, 'view_supplier'),
(41, 'Can add supplier product', 11, 'add_supplierproduct'),
(42, 'Can change supplier product', 11, 'change_supplierproduct'),
(43, 'Can delete supplier product', 11, 'delete_supplierproduct'),
(44, 'Can view supplier product', 11, 'view_supplierproduct'),
(45, 'Can add product', 12, 'add_product'),
(46, 'Can change product', 12, 'change_product'),
(47, 'Can delete product', 12, 'delete_product'),
(48, 'Can view product', 12, 'view_product'),
(49, 'Can add stock activity', 13, 'add_stockactivity'),
(50, 'Can change stock activity', 13, 'change_stockactivity'),
(51, 'Can delete stock activity', 13, 'delete_stockactivity'),
(52, 'Can view stock activity', 13, 'view_stockactivity'),
(53, 'Can add profile', 14, 'add_profile'),
(54, 'Can change profile', 14, 'change_profile'),
(55, 'Can delete profile', 14, 'delete_profile'),
(56, 'Can view profile', 14, 'view_profile');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$390000$sRnwOX1A4IpVSzQv0ymfaw$1DNEQPh9CcEqTfHogS2LZaR5U5Hw9cQyaVG6LWoWPIU=', '2023-01-15 15:16:46.487469', 0, 'kanombe_supervisor', '', '', 'kanombe@email.com', 1, 1, '2023-01-01 13:42:51.000000'),
(2, 'pbkdf2_sha256$390000$dlhlgOzp8GOfWoenbcavWH$5i/D7+cidVREpnI/jzNcW4ZzR7cAubLdD+NZt4M9J5E=', '2023-01-14 08:19:31.398922', 0, 'cimerwa_representative', '', '', 'cimerwa@email.com', 1, 1, '2023-01-01 13:43:12.000000'),
(3, 'pbkdf2_sha256$390000$D9GPP1dBDxXeBy968kVgmb$ljFnf9IyB1D/rkWaP1pNdyQXByk3SxLCCBvTikjslSs=', '2023-01-15 15:59:50.139899', 1, 'admin', '', '', 'admin@email.com', 1, 1, '2023-01-01 13:43:36.731956'),
(4, 'pbkdf2_sha256$390000$6l4IhThoBoXcjjbre9waxt$1H6r8akbS0maLW5bS3f+xJWceTWyyeaGEB0wj1z1p4w=', '2023-01-15 15:17:26.698359', 0, 'amaco_representative', '', '', 'amaco@email.com', 0, 1, '2023-01-14 13:13:27.000000'),
(5, 'pbkdf2_sha256$390000$eR3JqR70m23rXmahn6o3nv$dSdu5JTNvD/HFGHZDHg2uT7miUQcsoQVubLFovYLTVo=', '2023-01-15 15:21:43.042138', 0, 'ameki_representative', '', '', 'ameki@email.com', 0, 1, '2023-01-14 13:13:56.000000'),
(6, 'pbkdf2_sha256$390000$bwzfmj5EdbIEl78dNdSgtz$YyQFYWBOujawGFxS9273I5bNMNtq+DAvx1+1K1XXW+c=', '2023-01-15 15:25:57.656306', 0, 'dura_paint_dealer', 'MR', 'Dura Paint', 'dura@email.com', 0, 1, '2023-01-14 13:14:19.000000'),
(7, 'pbkdf2_sha256$390000$qGLTQXmC2MOuv3xZcRAho4$fVAxYubXk7cRKibBxcGI8Cyyw8U4+fXvb//HmLet0Lg=', '2023-01-15 15:29:39.829096', 0, 'roto_representative', '', '', 'roto@email.com', 0, 1, '2023-01-14 13:14:40.000000'),
(8, 'pbkdf2_sha256$390000$FpI631zY0ZOAUDpJ1QaJ3B$Wa6lffU6jyzhw+jtz9gbAWy48+xUmJ4/Mgkezud19PY=', '2023-01-14 13:15:04.000000', 0, 'royalpvc_representative', '', '', 'royal@email.com', 0, 1, '2023-01-14 13:15:03.000000'),
(9, 'pbkdf2_sha256$390000$Uq9T2KqS1F55QtgXlF2Ddw$hrBzMO/ROItqIbCW5mWAwbmkgGMqYtV3j34MvT7QzSw=', '2023-01-15 15:34:13.412415', 0, 'ruliba_representative', '', '', 'ruliba@email.com', 0, 1, '2023-01-14 13:15:27.000000'),
(10, 'pbkdf2_sha256$390000$Ab7WpnCEFqzv0Iz9VrEwza$0NiK9zj4cEO8WGKZY1uClFYfE57/Z7ES+ryuIbG+iuM=', '2023-01-14 13:15:59.000000', 0, 'rwandaplastic_representative', '', '', 'rwanda@email.com', 0, 1, '2023-01-14 13:15:59.000000'),
(11, 'pbkdf2_sha256$390000$19Zq1FBIbVzwtvAPc23aPs$G8aA1J1lE6RRxwIHfrlURZB/6ByGzwvRMLGqQrf8UOg=', '2023-01-15 15:37:11.633476', 0, 'safintra_representative', '', '', 'safintra@email.com', 0, 1, '2023-01-14 13:16:35.000000'),
(12, 'pbkdf2_sha256$390000$eoWRFpvvAF1s337eX5vSAW$YZm3VjGY4KZOiCJeD9XNoVU7kNNf9tKftGDI0wPG56I=', '2023-01-14 13:16:59.000000', 0, 'soimex_representative', '', '', 'soimex@email.com', 0, 1, '2023-01-14 13:16:58.000000'),
(13, 'pbkdf2_sha256$390000$430zIKL8Dcz5INFyOFeuW8$8Pwrw9l6w2UUmaXOsA72oY73bXtIbSpArIJz3mO6SFI=', '2023-01-15 15:40:03.548620', 0, 'sonatube_representative', '', '', 'sonatube@email.com', 0, 1, '2023-01-14 13:17:21.000000'),
(14, 'pbkdf2_sha256$390000$Mp70K5qQqo9DEhLgpZY7y7$jyHV4F6JHcejiHSPbAIZ4q7d8fYzQFfXS5kvBFzFuvA=', '2023-01-15 15:42:37.584695', 0, 'steelrwa_representative', '', '', 'stealrwa@email.com', 0, 1, '2023-01-14 13:18:10.000000'),
(15, 'pbkdf2_sha256$390000$esWZoQ7i565UsChARbsqdf$4wIQXVEkVW7TAswrjzADWM2iUwm30n/hW6H/oDahjqE=', '2023-01-15 15:48:24.610302', 0, 'tolirwa_representative', '', '', 'tolirwa@email.com', 0, 1, '2023-01-14 13:18:38.000000'),
(16, 'pbkdf2_sha256$390000$S2kheeHNqyhDCsm712tNpU$Z/aKi+tF1ZGuL6WAPx7MGwaarOWwxeIV2o06XGTu4HI=', '2023-01-15 15:50:26.926453', 0, 'mastersteel_representative', '', '', 'mastersteel@email.com', 0, 1, '2023-01-14 13:19:05.000000'),
(17, 'pbkdf2_sha256$390000$lDPlCLZzMPijrNoQqXtL6N$MFOXRLy1RWuJ8AsRNiWuYZywJPuG7ml0BO75LIyA07M=', '2023-01-15 15:54:16.567086', 0, 'twyford_representative', '', '', 'twyford@email.com', 0, 1, '2023-01-14 13:19:29.000000');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(2, 1, 2),
(1, 2, 1),
(4, 4, 1),
(5, 5, 1),
(8, 6, 1),
(10, 7, 1),
(11, 8, 1),
(12, 9, 1),
(7, 10, 1),
(13, 11, 1),
(14, 12, 1),
(16, 13, 1),
(15, 14, 1),
(6, 15, 1),
(9, 16, 1),
(3, 17, 1);

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(12, 'main', 'product'),
(14, 'main', 'profile'),
(13, 'main', 'stockactivity'),
(6, 'sessions', 'session'),
(9, 'supervisor', 'attendance'),
(8, 'supervisor', 'employee'),
(7, 'supervisor', 'site'),
(10, 'supplier', 'supplier'),
(11, 'supplier', 'supplierproduct');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-01-14 15:18:53.473300'),
(2, 'auth', '0001_initial', '2023-01-14 15:18:54.610499'),
(3, 'admin', '0001_initial', '2023-01-14 15:18:54.825614'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-01-14 15:18:54.851155'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-01-14 15:18:54.886973'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-01-14 15:18:55.025868'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-01-14 15:18:55.136354'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-01-14 15:18:55.191437'),
(9, 'auth', '0004_alter_user_username_opts', '2023-01-14 15:18:55.212312'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-01-14 15:18:55.297106'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-01-14 15:18:55.301547'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-01-14 15:18:55.317266'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-01-14 15:18:55.349850'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-01-14 15:18:55.392661'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-01-14 15:18:55.472641'),
(16, 'auth', '0011_update_proxy_permissions', '2023-01-14 15:18:55.497352'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-01-14 15:18:55.552602'),
(18, 'main', '0001_initial', '2023-01-14 15:18:56.076488'),
(19, 'sessions', '0001_initial', '2023-01-14 15:18:56.149839'),
(20, 'supervisor', '0001_initial', '2023-01-14 15:18:56.785680'),
(21, 'supplier', '0001_initial', '2023-01-14 15:18:57.525908'),
(22, 'supplier', '0002_supplierproduct_description', '2023-01-14 15:18:57.598706'),
(23, 'supplier', '0003_supplierproduct_quality_alter_supplierproduct_price', '2023-01-14 15:18:57.676169'),
(24, 'supplier', '0004_delete_supplierstockactivity', '2023-01-14 15:18:57.686215');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('cxie4tqp4ygxxxk58lrl40674qibcbub', '.eJxVjEEOwiAQRe_C2hDqwAAu3XsGMgwgVUOT0q6Md7dNutDte-__twi0LjWsPc9hTOIiQJx-WSR-5raL9KB2nyRPbZnHKPdEHrbL25Ty63q0fweVet3WzBFIK2SFntiXwXOGQWdVrFMJUHHmlJAsGGfPiE7ZjbIBA1pDseLzBe72N3g:1pGiLv:frEyYl_lqSzjmXmwOacRMVzM5CuwhabpgUokpS--6Co', '2023-01-28 15:21:51.746607'),
('u4jncnb17pb3b5evjhcznt1qsha83xfc', '.eJxVjEEOwiAQRe_C2hDqwAAu3XsGMgwgVUOT0q6Md7dNutDte-__twi0LjWsPc9hTOIiQJx-WSR-5raL9KB2nyRPbZnHKPdEHrbL25Ty63q0fweVet3WzBFIK2SFntiXwXOGQWdVrFMJUHHmlJAsGGfPiE7ZjbIBA1pDseLzBe72N3g:1pGjW5:AzDb4wyRvkq9QKO5LQ_P8uDXbxWNwMMX99hUsD0IheI', '2023-01-28 16:36:25.892925'),
('xn1vjgc4gf4g4exwm7jxn4dk64evnu5j', '.eJxVjEEOwiAQRe_C2hDqwAAu3XsGMgwgVUOT0q6Md7dNutDte-__twi0LjWsPc9hTOIiQJx-WSR-5raL9KB2nyRPbZnHKPdEHrbL25Ty63q0fweVet3WzBFIK2SFntiXwXOGQWdVrFMJUHHmlJAsGGfPiE7ZjbIBA1pDseLzBe72N3g:1pH5QE:zEn9JDDy55d7SThNbt3mZOK7xD_1uLbyEbzOUolfzAY', '2023-01-29 15:59:50.143077');

-- --------------------------------------------------------

--
-- Table structure for table `main_product`
--

CREATE TABLE `main_product` (
  `id` bigint(20) NOT NULL,
  `name` varchar(250) NOT NULL,
  `quality` varchar(250) NOT NULL,
  `price` double NOT NULL,
  `image` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `main_profile`
--

CREATE TABLE `main_profile` (
  `id` bigint(20) NOT NULL,
  `bio` longtext NOT NULL,
  `profile_user_id` bigint(20) NOT NULL,
  `image` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `main_profile`
--

INSERT INTO `main_profile` (`id`, `bio`, `profile_user_id`, `image`, `created_at`, `user_id`) VALUES
(1, '', 17, '', '2023-01-15 17:56:41.477312', 17);

-- --------------------------------------------------------

--
-- Table structure for table `main_stockactivity`
--

CREATE TABLE `main_stockactivity` (
  `id` bigint(20) NOT NULL,
  `price` double NOT NULL,
  `quantity` double NOT NULL,
  `description` longtext NOT NULL,
  `site_id` bigint(20) NOT NULL,
  `transaction_type` varchar(250) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `supervisor_attendance`
--

CREATE TABLE `supervisor_attendance` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `employee_id` bigint(20) NOT NULL,
  `site_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `supervisor_employee`
--

CREATE TABLE `supervisor_employee` (
  `id` bigint(20) NOT NULL,
  `names` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `phone` varchar(250) NOT NULL,
  `position` varchar(250) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `site_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `supervisor_site`
--

CREATE TABLE `supervisor_site` (
  `id` bigint(20) NOT NULL,
  `name` varchar(250) NOT NULL,
  `address` varchar(250) NOT NULL,
  `description` longtext NOT NULL,
  `supervisor_id` bigint(20) NOT NULL,
  `image` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supervisor_site`
--

INSERT INTO `supervisor_site` (`id`, `name`, `address`, `description`, `supervisor_id`, `image`, `created_at`, `user_id`) VALUES
(1, 'Kanombe', 'kigali', 'kanombe', 1, 'site/kanombe.jpg', '2023-01-15 10:53:56.493059', 3),
(2, 'Nyagatare', '.', '.', 18, 'site/nyagatare.jpg', '2023-01-15 10:54:19.868550', 3),
(3, 'Rwamagana', '.', '.', 19, 'site/rwamagana.jpg', '2023-01-15 10:55:00.547822', 3),
(4, 'Huye', '.', '.', 20, 'site/huye.jpg', '2023-01-15 10:55:24.148156', 3),
(5, 'Byumba', '.', '.', 21, 'site/byumba.jpg', '2023-01-15 10:55:53.240980', 3);

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
(1, 'cimerwa ltd', 'call 39059045 for more information', 'supplier/cimerwa_88w4MQm.jpeg', 2, '2023-01-01 15:47:19.398464', 3),
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

-- --------------------------------------------------------

--
-- Table structure for table `supplier_supplierproduct`
--

CREATE TABLE `supplier_supplierproduct` (
  `id` bigint(20) NOT NULL,
  `name` varchar(250) NOT NULL,
  `price` double NOT NULL,
  `image` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `supplier_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `description` longtext NOT NULL,
  `quality` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supplier_supplierproduct`
--

INSERT INTO `supplier_supplierproduct` (`id`, `name`, `price`, `image`, `created_at`, `supplier_id`, `user_id`, `description`, `quality`) VALUES
(1, 'Wall Master', 1000, 'supplier/products/emulsion_paint_nnWCDpJ.jpg', '2023-01-15 17:17:53.884501', 2, 4, 'Wall Master is a durable premium paint with a textured finish. It is weatherproof and ideal for exterior walls.', '2'),
(2, 'Weather Guard', 7600, 'supplier/products/emulsion_paint_LkLRwNp.jpg', '2023-01-15 17:17:53.895491', 2, 4, 'Weather Guard is a premium quality latex paint ideal for exterior surfaces.', '2'),
(3, 'Emulsion paint ', 21300, 'supplier/products/emulsion_paint_01zY13r.jpg', '2023-01-15 17:17:53.900765', 2, 4, 'A high quality, based on styrene acrylic emulsion, it suitable for ceilings and walls internally or externally whether new or previously painted.', '2'),
(4, 'Gloss Enamel', 2100, 'supplier/products/emulsion_paint_WT7yJfy.jpg', '2023-01-15 17:17:53.904508', 2, 4, 'Ni amarangi meza yamavuta,asigwa ku byuma ,imbaho nahandi. Akaba atuma aho asize harabagirana ndetse hakaramba.', '2'),
(5, 'Fast Dry', 1500, 'supplier/products/emulsion_paint_7Jt1J63.jpg', '2023-01-15 17:17:53.911007', 2, 4, 'Fast dry ni amarangi y’amavuta meza afite umwihariko wokuma vuba,ndetse akagaragara neza kucyo asizeho cyane cyane iyo asigishijwe', '2'),
(6, 'Economy Emulsion Paints', 3090, 'supplier/products/emulsion_paint_xhXNt79.jpg', '2023-01-15 17:17:53.914685', 2, 4, 'Economy Paints ni amarangi meza akoreshwa cyane kandi adahenze akaba asigwa munzu imbere no hanze', '2'),
(7, 'Super Gloss', 4500, 'supplier/products/emulsion_paint_cDno0Lc.jpg', '2023-01-15 17:17:53.917838', 2, 4, 'Super gloss ni ubwoko bw’amarangi y’amavuta yo kurwego ro hejuru; akaba afite umwihariko wo gukayangana,no kuramba ndetse akaba anatubuka cyane.', '2'),
(8, 'Silk Vinyl Emulsion', 3000, 'supplier/products/emulsion_paint_30SfYFR.jpg', '2023-01-15 17:17:53.924406', 2, 4, 'Ni irangi ryo kurwego rwohejuru ryagenewe gusigwa mu nzu imbere kandi ryonzwa mugihe ryanduye rikaba Irangi rigaragaza umucyo kandi rigashashagirana aho risize', '2'),
(9, 'Economy Gloss', 2100, 'supplier/products/emulsion_paint_USZciW3.jpg', '2023-01-15 17:17:53.928051', 2, 4, 'Ni amarangi y’amazi meza,asigwa cyane munzu imbere no hanze, ariko ntiyihanganira izuba nimvura kandi akaba ahendutse.', '2'),
(10, 'Weather Guard', 1250, 'supplier/products/emulsion_paint.jpg', '2023-01-15 17:17:53.932232', 2, 4, 'Weather guard ni Irangi ryagenewe gusigwa hanze, Irangi rifite ubushobozi bwo guhanga n’imihindagurikire y’ibihe , Irangi ryozwa mu gihe ryanduye', '2'),
(11, 'Wall Master', 1000, 'supplier/products/69470191_511797462954749_3151868130061709355_n_MZfbDax.jpg', '2023-01-15 17:21:57.327563', 3, 5, 'Wall Master is a durable premium paint with a textured finish. It is weatherproof and ideal for exterior walls.', '3'),
(12, 'Weather Guard', 15000, 'supplier/products/71175595_405525446799951_3732234471378836457_n_gcg6uPu.jpg', '2023-01-15 17:21:57.332095', 3, 5, 'Weather Guard is a premium quality latex paint ideal for exterior surfaces.', '3'),
(13, 'Emulsion paint ', 17000, 'supplier/products/71175595_405525446799951_3732234471378836457_n_dTUdtv3.jpg', '2023-01-15 17:21:57.338802', 3, 5, 'A high quality, based on styrene acrylic emulsion, it suitable for ceilings and walls internally or externally whether new or previously painted.', '3'),
(14, 'Gloss Enamel', 12000, 'supplier/products/71175595_405525446799951_3732234471378836457_n.jpg', '2023-01-15 17:21:57.346784', 3, 5, 'Ni amarangi meza yamavuta,asigwa ku byuma ,imbaho nahandi. Akaba atuma aho asize harabagirana ndetse hakaramba.', '3'),
(15, 'Fast Dry', 15000, 'supplier/products/69470191_511797462954749_3151868130061709355_n.jpg', '2023-01-15 17:21:57.359739', 3, 5, 'Fast dry ni amarangi y’amavuta meza afite umwihariko wokuma vuba,ndetse akagaragara neza kucyo asizeho cyane cyane iyo asigishijwe', '3'),
(16, 'Economy Emulsion Paints', 30900, 'supplier/products/69470191_511797462954749_3151868130061709355_n_N8jQzLM.jpg', '2023-01-15 17:21:57.381859', 3, 5, 'Economy Paints ni amarangi meza akoreshwa cyane kandi adahenze akaba asigwa munzu imbere no hanze', '3'),
(17, 'Super Gloss', 45000, 'supplier/products/67134932_448483949215274_4707000718830857297_n_fGgoI5u.jpg', '2023-01-15 17:21:57.412530', 3, 5, 'Super gloss ni ubwoko bw’amarangi y’amavuta yo kurwego ro hejuru; akaba afite umwihariko wo gukayangana,no kuramba ndetse akaba anatubuka cyane.', '3'),
(18, 'Silk Vinyl Emulsion', 30000, 'supplier/products/67134932_448483949215274_4707000718830857297_n.jpg', '2023-01-15 17:21:57.423476', 3, 5, 'Ni irangi ryo kurwego rwohejuru ryagenewe gusigwa mu nzu imbere kandi ryonzwa mugihe ryanduye rikaba Irangi rigaragaza umucyo kandi rigashashagirana aho risize', '3'),
(19, 'Economy Gloss', 2100, 'supplier/products/69392300_2500832129986331_5506570936330324045_n_LUoUiPi.jpg', '2023-01-15 17:21:57.478783', 3, 5, 'Ni amarangi y’amazi meza,asigwa cyane munzu imbere no hanze, ariko ntiyihanganira izuba nimvura kandi akaba ahendutse.', '3'),
(20, 'Weather Guard', 1200, 'supplier/products/69392300_2500832129986331_5506570936330324045_n.jpg', '2023-01-15 17:21:57.530260', 3, 5, 'Weather guard ni Irangi ryagenewe gusigwa hanze, Irangi rifite ubushobozi bwo guhanga n’imihindagurikire y’ibihe , Irangi ryozwa mu gihe ryanduye', '3'),
(23, 'Emulsion paint ', 17000, 'supplier/products/ac_dura_Bjz59pw.jpg', '2023-01-15 17:26:11.099816', 4, 6, 'A high quality, based on styrene acrylic emulsion, it suitable for ceilings and walls internally or externally whether new or previously painted.', '4'),
(26, 'Economy Emulsion Paints', 3000, 'supplier/products/ac_dura_YpCWjbi.jpg', '2023-01-15 17:26:11.123150', 4, 6, 'Economy Paints ni amarangi meza akoreshwa cyane kandi adahenze akaba asigwa munzu imbere no hanze', '4'),
(27, 'Super Gloss', 2500, 'supplier/products/ac_dura_tGNmeJP.jpg', '2023-01-15 17:26:11.133277', 4, 6, 'Super gloss ni ubwoko bw’amarangi y’amavuta yo kurwego ro hejuru; akaba afite umwihariko wo gukayangana,no kuramba ndetse akaba anatubuka cyane.', '4'),
(28, 'Silk Vinyl Emulsion', 1500, 'supplier/products/ac_dura_vsN4PU4.jpg', '2023-01-15 17:26:11.141001', 4, 6, 'Ni irangi ryo kurwego rwohejuru ryagenewe gusigwa mu nzu imbere kandi ryonzwa mugihe ryanduye rikaba Irangi rigaragaza umucyo kandi rigashashagirana aho risize', '4'),
(29, 'Economy Gloss', 1000, 'supplier/products/ac_dura_c5JR6Ba.jpg', '2023-01-15 17:26:11.149549', 4, 6, 'Ni amarangi y’amazi meza,asigwa cyane munzu imbere no hanze, ariko ntiyihanganira izuba nimvura kandi akaba ahendutse.', '4'),
(30, 'Weather Guard', 12000, 'supplier/products/ac_dura.jpg', '2023-01-15 17:26:11.156678', 4, 6, 'Weather guard ni Irangi ryagenewe gusigwa hanze, Irangi rifite ubushobozi bwo guhanga n’imihindagurikire y’ibihe , Irangi ryozwa mu gihe ryanduye', '4'),
(35, 'Plastic basins', 2000, 'supplier/products/plastic_drum.png', '2023-01-15 17:29:58.860609', 6, 7, 'from 18L to 40L', '1'),
(36, 'ROTO WATER TANKS', 100000, 'supplier/products/roto_kFsMXrG.jpg', '2023-01-15 17:29:58.872632', 6, 7, 'Roto Plastic Water Tank is a Low Cost, Hygienic, Maintenance, Leak Proof, Insulation tanks which is highly weather proof and light weight.', '1'),
(37, 'HDPE PIPES', 50000, 'supplier/products/round_pipes_9OjN1dI.jpg', '2023-01-15 17:29:58.883382', 6, 7, 'ROTO HDPE Pipes are available in 20 mm diameter to 500 mm diameter and Class (Pressure Rating) PN-8, PN-10, PN-12.5, PN-16, PN-20, PN-25 with complete range of fitting.', '1'),
(38, 'PVC PIPES', 20000, 'supplier/products/round_pipes.jpg', '2023-01-15 17:29:58.888283', 6, 7, 'PPR Pipes & Fittings are widely applicable in the plumbing and water supply systems.', '1'),
(39, 'PLASTIC SEPTIC TANKS', 60000, 'supplier/products/rotoo.jpg', '2023-01-15 17:29:58.895643', 6, 7, 'The Roto Plastic Septic Tank was designed and developed by a team of experts after lengthy research.', '1'),
(40, 'DUST BINS', 25000, 'supplier/products/rottt.jpg', '2023-01-15 17:29:58.901670', 6, 7, 'Plastic Dust Bins are rotationally moulded from tough industrial polyethylene giving strength and durability to the product to last for years and years. ', '2'),
(41, 'PLASTIC DRUMS', 30000, 'supplier/products/roto.jpg', '2023-01-15 17:29:58.905761', 6, 7, '210 ltrs, 100 ltrs… Advantages : Long lasting, durable, heavy duty, water proof & hygienic. ', '2'),
(42, 'MOBILE TOILET', 200000, 'supplier/products/rotttu_KRIC7jh.jpg', '2023-01-15 17:29:58.912070', 6, 7, 'The Roto Toilet Hut is the most modern and convenient ready-to-use pit latrine toilet. ', '2'),
(43, 'SANITIZING CABIN', 12000, 'supplier/products/rotttu.jpg', '2023-01-15 17:29:58.918831', 6, 7, 'The Roto TIZER is unique modular Plastic Sanitizing Cabin. The global pandemic of Covid19 has caused the world to set up new protocols for protection.', '6'),
(44, 'small pave', 9000, 'supplier/products/pave.jpg', '2023-01-15 17:34:45.012208', 8, 9, 'general purpose use', '3'),
(45, 'block', 11000, 'supplier/products/block.jpg', '2023-01-15 17:34:45.034027', 8, 9, 'final touch', '2'),
(46, 'sure wall', 12000, 'supplier/products/1237.jpg', '2023-01-15 17:34:45.050766', 8, 9, 'concrete wall', '1'),
(47, 'paver', 15000, 'supplier/products/double_pompei.jpg', '2023-01-15 17:34:45.087721', 8, 9, 'heavy duty', '3'),
(48, 'curved sheets', 100, 'supplier/products/aaaa_fDdnAp9.jpg', '2023-01-15 17:37:27.877881', 10, 11, 'perfect for walk ways', '3'),
(49, 'tile ridge cap', 1300, 'supplier/products/super_echo_profile_gjzz4eA.jpg', '2023-01-15 17:37:27.896620', 10, 11, 'regulates temperature', '1'),
(50, 'high profile', 1200, 'supplier/products/wave_tileform_sheets_ChFHOkt.jpg', '2023-01-15 17:37:27.916736', 10, 11, 'very durable', '2'),
(51, 'ondulee', 1000, 'supplier/products/Tile-ridge-300x168.jpg', '2023-01-15 17:37:27.931088', 10, 11, 'shock resistant', '2'),
(52, 'super echo profile', 2400, 'supplier/products/aaaa_0LyKoyY.jpg', '2023-01-15 17:37:27.936778', 10, 11, 'sound proof', '3'),
(53, 'tileform sheet', 1200, 'supplier/products/wave_tileform_sheets.jpg', '2023-01-15 17:37:27.945550', 10, 11, 'great for insulation', '2'),
(54, 'wave tileform sheet', 1100, 'supplier/products/super_echo_profile.jpg', '2023-01-15 17:37:27.949595', 10, 11, 'perfect for pest control', '1'),
(55, 'galvanised sheet', 2100, 'supplier/products/aaaa.jpg', '2023-01-15 17:37:27.956416', 10, 11, 'rust resistant', '1'),
(73, 'ondulee', 1000, 'supplier/products/V9C5087-2048x1566.jpg', '2023-01-15 17:40:42.730259', 12, 13, 'shock resistant', '2'),
(74, 'super echo profile', 2400, 'supplier/products/round_pvc_pipes.png', '2023-01-15 17:40:42.750402', 12, 13, 'sound proof', '3'),
(75, 'tileform sheet', 1200, 'supplier/products/V9C4883-1024x741_1.jpg', '2023-01-15 17:40:42.759656', 12, 13, 'great for insulation', '2'),
(77, 'square ', 2100, 'supplier/products/square_rectangular_tube.jpg', '2023-01-15 17:40:42.774162', 12, 13, 'rust resistant', '1'),
(78, 'round pipe', 900, 'supplier/products/round_pipes_o1j0ium.jpg', '2023-01-15 17:40:42.778601', 12, 13, 'collect rain water', '2'),
(79, 'curved sheets', 1000, 'supplier/products/V9C5479.jpg', '2023-01-15 17:42:49.057396', 13, 14, 'perfect for walk ways', '3'),
(80, 'pipe', 13000, 'supplier/products/round_pipes_Ov5ppjH.jpg', '2023-01-15 17:42:49.076955', 13, 14, 'good pipe', '1'),
(81, 'good metal', 1200, 'supplier/products/V9C5800.jpg', '2023-01-15 17:42:49.084569', 13, 14, 'best one metal', '2'),
(82, 'ondulee', 1000, 'supplier/products/V9C5083-2048x1437.jpg', '2023-01-15 17:42:49.090846', 13, 14, 'shock resistant', '2'),
(83, 'steel bar', 2400, 'supplier/products/steel_bars.jpg', '2023-01-15 17:42:49.099229', 13, 14, 'strong steel', '3'),
(85, 'Nails', 110, 'supplier/products/nails.jpg', '2023-01-15 17:42:49.115630', 13, 14, 'perfect nails\r\n', '1'),
(86, 'open section', 2100, 'supplier/products/open_sections.jpg', '2023-01-15 17:42:49.123344', 13, 14, 'rust resistant', '1'),
(87, 'metal tube', 900, 'supplier/products/metal_tube.jpg', '2023-01-15 17:42:49.131814', 13, 14, 'igisenge', '1'),
(88, 'curved sheets', 100, 'supplier/products/super_echo_profile_mU5MYP0.jpg', '2023-01-15 17:48:42.825524', 14, 15, 'perfect for walk ways', '3'),
(93, 'tileform sheet', 12000, 'supplier/products/tileform_sheets.jpg', '2023-01-15 17:48:42.893102', 14, 15, 'great for insulation', '2'),
(94, 'wave tileform sheet', 10100, 'supplier/products/high_profile.jpg', '2023-01-15 17:48:42.903571', 14, 15, 'perfect for pest control', '1'),
(95, 'galvanised sheet', 21000, 'supplier/products/aaaa_xUvhMuv.jpg', '2023-01-15 17:48:42.911866', 14, 15, 'rust resistant', '1'),
(99, 'high profile metal', 12000, 'supplier/products/IMG-20220818-WA0012-ptyys0x802n55fr9uj7iy71gjev4pqrm52ao73c1ig_9dGZfwU.jpg', '2023-01-15 17:50:46.262598', 5, 16, 'very most usable\r\n', '2'),
(103, 'wave sheet', 110, 'supplier/products/IMG-20220818-WA0012-ptyys0x802n55fr9uj7iy71gjev4pqrm52ao73c1ig.jpg', '2023-01-15 17:50:46.301013', 5, 16, 'perfect for pest control', '1'),
(104, 'oopen galvanised sheet', 2100, 'supplier/products/open_sections_82gVI5c.jpg', '2023-01-15 17:50:46.306138', 5, 16, 'metal\r\n', '1'),
(105, 'metal', 900, 'supplier/products/nails_MgZQZKg.jpg', '2023-01-15 17:50:46.314863', 5, 16, 'collect rain water', '2'),
(106, 'Close Coupled Rimless Toilet Pan', 9000, 'supplier/products/11toilet_hut_wxQIdTF.png', '2023-01-15 17:54:45.372167', 15, 17, 'general purpose use', '3'),
(107, 'Washbasin 550x400', 11000, 'supplier/products/11toilet_hut_7ELpzBd.png', '2023-01-15 17:54:45.401009', 15, 17, 'baby proof', '2'),
(108, 'Square Flat Top Shower Tray', 12000, 'supplier/products/11toilet_hut_IeXKNRF.png', '2023-01-15 17:54:45.408393', 15, 17, 'hygenic', '1'),
(109, 'Tray 900x900 Square Upstand', 15000, 'supplier/products/11toilet_hut_8whwNx7.png', '2023-01-15 17:54:45.416519', 15, 17, 'heavy duty', '3'),
(110, 'Spectrum Urinal 560x360', 18000, 'supplier/products/11toilet_hut_urbLNdU.png', '2023-01-15 17:54:45.425291', 15, 17, 'ceramic made', '3'),
(111, 'Clifton Urinal 305x445x375', 12000, 'supplier/products/11toilet_hut.png', '2023-01-15 17:54:45.446753', 15, 17, 'general purpose use', '2'),
(112, 'Galerie Toilet Set and Cover SS', 8000, 'supplier/products/toilet_hut.png', '2023-01-15 17:54:45.457711', 15, 17, 'Spare part', '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `main_product`
--
ALTER TABLE `main_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main_product_user_id_e96d0a16_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `main_profile`
--
ALTER TABLE `main_profile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main_profile_user_id_b40d720a_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `main_stockactivity`
--
ALTER TABLE `main_stockactivity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main_stockactivity_product_id_3703fea6_fk_main_product_id` (`product_id`),
  ADD KEY `main_stockactivity_user_id_ec5b6a6a_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `supervisor_attendance`
--
ALTER TABLE `supervisor_attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supervisor_attendanc_employee_id_6aa5b2de_fk_superviso` (`employee_id`),
  ADD KEY `supervisor_attendance_site_id_daf35e37_fk_supervisor_site_id` (`site_id`),
  ADD KEY `supervisor_attendance_user_id_5b8ee12d_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `supervisor_employee`
--
ALTER TABLE `supervisor_employee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supervisor_employee_site_id_89c581cd_fk_supervisor_site_id` (`site_id`),
  ADD KEY `supervisor_employee_user_id_358b4bc1_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `supervisor_site`
--
ALTER TABLE `supervisor_site`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supervisor_site_user_id_a3d5836c_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `supplier_supplier`
--
ALTER TABLE `supplier_supplier`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_supplier_user_id_96e4ec8c_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `supplier_supplierproduct`
--
ALTER TABLE `supplier_supplierproduct`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_supplierpro_supplier_id_44c0ee41_fk_supplier_` (`supplier_id`),
  ADD KEY `supplier_supplierproduct_user_id_e9a2a02d_fk_auth_user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `main_product`
--
ALTER TABLE `main_product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `main_profile`
--
ALTER TABLE `main_profile`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `main_stockactivity`
--
ALTER TABLE `main_stockactivity`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supervisor_attendance`
--
ALTER TABLE `supervisor_attendance`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supervisor_employee`
--
ALTER TABLE `supervisor_employee`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supervisor_site`
--
ALTER TABLE `supervisor_site`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `supplier_supplier`
--
ALTER TABLE `supplier_supplier`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `supplier_supplierproduct`
--
ALTER TABLE `supplier_supplierproduct`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `main_product`
--
ALTER TABLE `main_product`
  ADD CONSTRAINT `main_product_user_id_e96d0a16_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `main_profile`
--
ALTER TABLE `main_profile`
  ADD CONSTRAINT `main_profile_user_id_b40d720a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `main_stockactivity`
--
ALTER TABLE `main_stockactivity`
  ADD CONSTRAINT `main_stockactivity_product_id_3703fea6_fk_main_product_id` FOREIGN KEY (`product_id`) REFERENCES `main_product` (`id`),
  ADD CONSTRAINT `main_stockactivity_user_id_ec5b6a6a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `supervisor_attendance`
--
ALTER TABLE `supervisor_attendance`
  ADD CONSTRAINT `supervisor_attendanc_employee_id_6aa5b2de_fk_superviso` FOREIGN KEY (`employee_id`) REFERENCES `supervisor_employee` (`id`),
  ADD CONSTRAINT `supervisor_attendance_site_id_daf35e37_fk_supervisor_site_id` FOREIGN KEY (`site_id`) REFERENCES `supervisor_site` (`id`),
  ADD CONSTRAINT `supervisor_attendance_user_id_5b8ee12d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `supervisor_employee`
--
ALTER TABLE `supervisor_employee`
  ADD CONSTRAINT `supervisor_employee_site_id_89c581cd_fk_supervisor_site_id` FOREIGN KEY (`site_id`) REFERENCES `supervisor_site` (`id`),
  ADD CONSTRAINT `supervisor_employee_user_id_358b4bc1_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `supervisor_site`
--
ALTER TABLE `supervisor_site`
  ADD CONSTRAINT `supervisor_site_user_id_a3d5836c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `supplier_supplier`
--
ALTER TABLE `supplier_supplier`
  ADD CONSTRAINT `supplier_supplier_user_id_96e4ec8c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `supplier_supplierproduct`
--
ALTER TABLE `supplier_supplierproduct`
  ADD CONSTRAINT `supplier_supplierpro_supplier_id_44c0ee41_fk_supplier_` FOREIGN KEY (`supplier_id`) REFERENCES `supplier_supplier` (`id`),
  ADD CONSTRAINT `supplier_supplierproduct_user_id_e9a2a02d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
