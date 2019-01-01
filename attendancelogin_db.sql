-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 01, 2019 at 11:18 AM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `attendancelogin_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `absent`
--

DROP TABLE IF EXISTS `absent`;
CREATE TABLE IF NOT EXISTS `absent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `in_time` time NOT NULL,
  `out_time` time DEFAULT NULL,
  `work_hour` time DEFAULT NULL,
  `over_time` time DEFAULT NULL,
  `late_time` time DEFAULT NULL,
  `early_out_time` time DEFAULT NULL,
  `in_location` varchar(200) NOT NULL,
  `out_location` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `absent`
--

INSERT INTO `absent` (`id`, `name`, `date`, `in_time`, `out_time`, `work_hour`, `over_time`, `late_time`, `early_out_time`, `in_location`, `out_location`) VALUES
(1, 'test', '2019-01-01', '10:11:00', '16:00:00', '07:00:00', '03:00:00', '00:02:00', '05:00:00', 'karnal', 'karnal'),
(2, 'test', '2019-01-01', '10:11:00', '16:00:00', '07:00:00', '03:00:00', '00:02:00', '05:00:00', 'karnal', 'karnal');

-- --------------------------------------------------------

--
-- Table structure for table `history_qr`
--

DROP TABLE IF EXISTS `history_qr`;
CREATE TABLE IF NOT EXISTS `history_qr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `history_qr`
--

INSERT INTO `history_qr` (`id`, `name`) VALUES
(2, 'Test 123');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_time` time NOT NULL,
  `out_time` time NOT NULL,
  `many_employee` varchar(50) NOT NULL,
  `key_insert` char(40) NOT NULL,
  `timezone` varchar(100) NOT NULL,
  `recaptcha` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `start_time`, `out_time`, `many_employee`, `key_insert`, `timezone`, `recaptcha`) VALUES
(1, '08:00:00', '17:00:00', '8', '51e69892ab49df85c6230ccc57f8e1d1606cabbb', 'Asia/Makassar', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
CREATE TABLE IF NOT EXISTS `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `user_id` int(10) NOT NULL,
  `created` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tokens`
--

INSERT INTO `tokens` (`id`, `token`, `user_id`, `created`) VALUES
(1, '57b59550b25aee7b9180241e416d53', 3, '2019-01-01'),
(2, '572a3f446cb061549fd47751498852', 2, '2019-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `role` varchar(10) NOT NULL,
  `password` text NOT NULL,
  `last_login` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `banned_users` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `first_name`, `last_name`, `role`, `password`, `last_login`, `status`, `banned_users`) VALUES
(1, 'admin@gmail.com', 'admin', 'admin', '3', 'sha256:1000:afMG4GHoH0gR1YsZz3Odq6W3n1M7wTUG:gjbZhnxB9K0im16imrc+yDM23q+8n1Wm', '2019-01-01 10:56:08 AM', 'approved', 'unban'),
(2, 'test@gmail.com', 'Test', 'Test', '1', 'sha256:1000:JDJ5JDEwJE5VQkFEWjVOTzl4TnlXejF5T1lYdU8ySldNakJBbFF3dUY1S2ZXeG1VL1F6ai9tZXdwWWZH:ta51yihgVTlyiZbJ3XIUEwBQtabNseto', '2019-01-01 11:10:48 AM', 'approved', 'unban'),
(3, 'laxman@gmail.com', 'laxman', 'rana', '4', '', '', 'pending', 'unban');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
