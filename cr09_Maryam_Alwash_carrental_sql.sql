-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 16, 2018 at 03:34 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr09_Maryam_Alwash_carrental.sql`
--

-- --------------------------------------------------------

--
-- Table structure for table `additional_charges`
--

CREATE TABLE `additional_charges` (
  `additional_charges_id` int(11) NOT NULL,
  `amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `additional_charges`
--

INSERT INTO `additional_charges` (`additional_charges_id`, `amount`) VALUES
(1, 50),
(2, 70);

-- --------------------------------------------------------

--
-- Table structure for table `additional_driver`
--

CREATE TABLE `additional_driver` (
  `additional_driver_id` int(11) NOT NULL,
  `driver_name` varchar(30) DEFAULT NULL,
  `dirivr_number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `additional_driver`
--

INSERT INTO `additional_driver` (`additional_driver_id`, `driver_name`, `dirivr_number`) VALUES
(1, 'patrick', 660456789),
(2, 'ahmed', 664234567);

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `car_id` int(11) NOT NULL,
  `car_model` varchar(20) DEFAULT NULL,
  `car_number` int(11) DEFAULT NULL,
  `fk_start_location_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`car_id`, `car_model`, `car_number`, `fk_start_location_id`) VALUES
(1, 'BMW 2015', 34, 1),
(2, 'VW 2017', 35, 2);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `cust_id` int(11) NOT NULL,
  `cust_age` int(11) DEFAULT NULL,
  `cust_full_name` varchar(20) DEFAULT NULL,
  `fk_additional_driver_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`cust_id`, `cust_age`, `cust_full_name`, `fk_additional_driver_id`) VALUES
(1, 30, 'sameh Shahin', 1),
(2, 20, 'Maryam Alwash', 2);

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL,
  `price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `price`) VALUES
(1, 20),
(2, 30);

-- --------------------------------------------------------

--
-- Table structure for table `pick_up`
--

CREATE TABLE `pick_up` (
  `pick_up_id` int(11) NOT NULL,
  `fk_rent_id` int(11) DEFAULT NULL,
  `fk_invoice_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pick_up`
--

INSERT INTO `pick_up` (`pick_up_id`, `fk_rent_id`, `fk_invoice_id`) VALUES
(1, 1, 1),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `rent`
--

CREATE TABLE `rent` (
  `rent_id` int(11) NOT NULL,
  `fk_reserve_id` int(11) DEFAULT NULL,
  `fk_invoice_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rent`
--

INSERT INTO `rent` (`rent_id`, `fk_reserve_id`, `fk_invoice_id`) VALUES
(1, 1, 1),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `reserve_id` int(11) NOT NULL,
  `cust_password` int(11) DEFAULT NULL,
  `cust_email` varchar(30) DEFAULT NULL,
  `fk_cust_id` int(11) DEFAULT NULL,
  `fk_car_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`reserve_id`, `cust_password`, `cust_email`, `fk_cust_id`, `fk_car_id`) VALUES
(1, 0, 'cust1@icloud.com', 1, 1),
(2, 1, 'cust2@icloud.com', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `return_car`
--

CREATE TABLE `return_car` (
  `return_id` int(11) NOT NULL,
  `fk_rent_id` int(11) DEFAULT NULL,
  `fk_additional_charges_id` int(11) DEFAULT NULL,
  `fk_return_location_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `return_car`
--

INSERT INTO `return_car` (`return_id`, `fk_rent_id`, `fk_additional_charges_id`, `fk_return_location_id`) VALUES
(1, 1, 1, 1),
(2, 2, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `return_location`
--

CREATE TABLE `return_location` (
  `return_location_id` int(11) NOT NULL,
  `address` varchar(20) DEFAULT NULL,
  `city` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `return_location`
--

INSERT INTO `return_location` (`return_location_id`, `address`, `city`) VALUES
(1, 'stephnplaz 122', 'Vienna'),
(2, ' Stifterstrasse 4', 'linz');

-- --------------------------------------------------------

--
-- Table structure for table `start_location`
--

CREATE TABLE `start_location` (
  `start_location_id` int(11) NOT NULL,
  `city` varchar(10) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `start_location`
--

INSERT INTO `start_location` (`start_location_id`, `city`, `address`) VALUES
(1, 'Vienna', 'kalesplaz 11/1'),
(2, 'linz', 'Baumbachstrasse 17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `additional_charges`
--
ALTER TABLE `additional_charges`
  ADD PRIMARY KEY (`additional_charges_id`);

--
-- Indexes for table `additional_driver`
--
ALTER TABLE `additional_driver`
  ADD PRIMARY KEY (`additional_driver_id`);

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`car_id`),
  ADD KEY `fk_start_location_id` (`fk_start_location_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cust_id`),
  ADD KEY `fk_additional_driver_id` (`fk_additional_driver_id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`);

--
-- Indexes for table `pick_up`
--
ALTER TABLE `pick_up`
  ADD PRIMARY KEY (`pick_up_id`),
  ADD KEY `fk_rent_id` (`fk_rent_id`),
  ADD KEY `fk_invoice_id` (`fk_invoice_id`);

--
-- Indexes for table `rent`
--
ALTER TABLE `rent`
  ADD PRIMARY KEY (`rent_id`),
  ADD KEY `fk_reserve_id` (`fk_reserve_id`),
  ADD KEY `fk_invoice_id` (`fk_invoice_id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reserve_id`),
  ADD KEY `fk_cust_id` (`fk_cust_id`),
  ADD KEY `fk_car_id` (`fk_car_id`);

--
-- Indexes for table `return_car`
--
ALTER TABLE `return_car`
  ADD PRIMARY KEY (`return_id`),
  ADD KEY `fk_rent_id` (`fk_rent_id`),
  ADD KEY `fk_additional_charges_id` (`fk_additional_charges_id`),
  ADD KEY `fk_return_location_id` (`fk_return_location_id`);

--
-- Indexes for table `return_location`
--
ALTER TABLE `return_location`
  ADD PRIMARY KEY (`return_location_id`);

--
-- Indexes for table `start_location`
--
ALTER TABLE `start_location`
  ADD PRIMARY KEY (`start_location_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `cars_ibfk_1` FOREIGN KEY (`fk_start_location_id`) REFERENCES `start_location` (`start_location_id`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`fk_additional_driver_id`) REFERENCES `additional_driver` (`additional_driver_id`);

--
-- Constraints for table `pick_up`
--
ALTER TABLE `pick_up`
  ADD CONSTRAINT `pick_up_ibfk_1` FOREIGN KEY (`fk_rent_id`) REFERENCES `rent` (`rent_id`),
  ADD CONSTRAINT `pick_up_ibfk_2` FOREIGN KEY (`fk_invoice_id`) REFERENCES `invoice` (`invoice_id`);

--
-- Constraints for table `rent`
--
ALTER TABLE `rent`
  ADD CONSTRAINT `rent_ibfk_1` FOREIGN KEY (`fk_reserve_id`) REFERENCES `reservation` (`reserve_id`),
  ADD CONSTRAINT `rent_ibfk_2` FOREIGN KEY (`fk_invoice_id`) REFERENCES `invoice` (`invoice_id`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`fk_cust_id`) REFERENCES `customer` (`cust_id`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`fk_car_id`) REFERENCES `cars` (`car_id`);

--
-- Constraints for table `return_car`
--
ALTER TABLE `return_car`
  ADD CONSTRAINT `return_car_ibfk_1` FOREIGN KEY (`fk_rent_id`) REFERENCES `rent` (`rent_id`),
  ADD CONSTRAINT `return_car_ibfk_2` FOREIGN KEY (`fk_additional_charges_id`) REFERENCES `additional_charges` (`additional_charges_id`),
  ADD CONSTRAINT `return_car_ibfk_3` FOREIGN KEY (`fk_return_location_id`) REFERENCES `return_location` (`return_location_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
