-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 04, 2019 at 06:19 AM
-- Server version: 5.7.21
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `event management`
--

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `venue_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `venue_name` varchar(500) DEFAULT NULL,
  `host_count` varchar(500) DEFAULT NULL,
  `date_event` date DEFAULT NULL,
  `food_choice` varchar(500) DEFAULT NULL,
  `charges` varchar(500) DEFAULT NULL,
  UNIQUE KEY `order_id` (`order_id`),
  KEY `venue_id` (`venue_id`),
  KEY `vendor_id` (`vendor_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `signup`
--

DROP TABLE IF EXISTS `signup`;
CREATE TABLE IF NOT EXISTS `signup` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `f_name` varchar(500) NOT NULL,
  `l_name` varchar(500) NOT NULL,
  `dob` varchar(500) NOT NULL,
  `Address` varchar(1000) NOT NULL,
  `email_id` varchar(500) DEFAULT NULL,
  `phone_num` varchar(500) NOT NULL,
  `password` varchar(500) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email_id` (`email_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `signup`
--

INSERT INTO `signup` (`user_id`, `f_name`, `l_name`, `dob`, `Address`, `email_id`, `phone_num`, `password`) VALUES
(1, 'muhammd', 'waraich', '2019-01-14', 'sadafaf af af aef af a faf ', 'mohammedsoban1@gmail.com', '3002625515150', '1'),
(2, 'muhammd', 'waraich', '2019-01-07', 'sadafaf af af aef af a faf ', 'sweetdeath96@hotmail.com', '', '1');

-- --------------------------------------------------------

--
-- Table structure for table `vendorsignup`
--

DROP TABLE IF EXISTS `vendorsignup`;
CREATE TABLE IF NOT EXISTS `vendorsignup` (
  `vendor_id` int(11) NOT NULL AUTO_INCREMENT,
  `f_name` varchar(500) NOT NULL,
  `l_name` varchar(500) NOT NULL,
  `dob` date NOT NULL,
  `email_id` varchar(500) DEFAULT NULL,
  `company_name` varchar(500) NOT NULL,
  `company_address` varchar(1000) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `password` varchar(500) NOT NULL,
  PRIMARY KEY (`vendor_id`),
  UNIQUE KEY `user_id` (`vendor_id`),
  UNIQUE KEY `email_id` (`email_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendorsignup`
--

INSERT INTO `vendorsignup` (`vendor_id`, `f_name`, `l_name`, `dob`, `email_id`, `company_name`, `company_address`, `phone`, `password`) VALUES
(1, 's', 's', '2019-01-09', NULL, '', '', '', ''),
(2, '', '', '2019-01-19', NULL, '', '', '', ''),
(3, '', '', '2019-01-17', NULL, '1113qsdas d a', '', '', ''),
(4, '', '', '2019-01-10', NULL, '', 'd asd as das ', '', ''),
(5, '', '', '2019-01-03', NULL, '', '', '', ''),
(6, '', '', '2019-01-17', NULL, '', '', '', ''),
(7, 'muhammd', 'soban', '2019-01-15', 'mohammedsoban1@gmail.com', '1113qsdas d a', 'd asd as das ', '03606106', '1'),
(8, '', '', '2019-01-17', '', '', '', '', ''),
(9, 'muhammd', 'soban', '2019-01-17', 'saraimaran71@gmail.com', '1113qsdas d a', 'asdasd', '', '1'),
(10, 'soban', 'waraich', '2019-01-16', 'sweetdeath96@hotmail.com', '1113qsdas d a', 'asdasd', '', '1'),
(11, '', '', '2019-01-08', 'soban@gmail.com', '', '', '', ''),
(12, 'muhammd', 's', '2019-01-10', 'daasddfafa@', 'ss', 'd asd as das ', '', '1');

-- --------------------------------------------------------

--
-- Table structure for table `venues`
--

DROP TABLE IF EXISTS `venues`;
CREATE TABLE IF NOT EXISTS `venues` (
  `venue_id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) NOT NULL,
  `venue_name` varchar(500) DEFAULT NULL,
  `venue_price` varchar(500) NOT NULL,
  `venue_hosting` varchar(500) DEFAULT NULL,
  `venue_address` varchar(500) DEFAULT NULL,
  `venue_details` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`venue_id`),
  KEY `vendor_id` (`vendor_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
